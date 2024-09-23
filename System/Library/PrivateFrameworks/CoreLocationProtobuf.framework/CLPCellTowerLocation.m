@implementation CLPCellTowerLocation

- (void)setArfcn:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_arfcn = a3;
}

- (void)setHasArfcn:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasArfcn
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPsc:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_psc = a3;
}

- (void)setHasPsc:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasPsc
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

- (void)setServerHash:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_serverHash = a3;
}

- (void)setHasServerHash:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasServerHash
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setTransmit:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_transmit = a3;
}

- (void)setHasTransmit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTransmit
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasOperatorName
{
  return self->_operatorName != 0;
}

- (void)setEcn0:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_ecn0 = a3;
}

- (void)setHasEcn0:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasEcn0
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setRscp:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_rscp = a3;
}

- (void)setHasRscp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRscp
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRat:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_rat = a3;
}

- (void)setHasRat:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasRat
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)clearNeighbors
{
  -[NSMutableArray removeAllObjects](self->_neighbors, "removeAllObjects");
}

- (void)addNeighbor:(id)a3
{
  id v4;
  NSMutableArray *neighbors;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  neighbors = self->_neighbors;
  v8 = v4;
  if (!neighbors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_neighbors;
    self->_neighbors = v6;

    v4 = v8;
    neighbors = self->_neighbors;
  }
  -[NSMutableArray addObject:](neighbors, "addObject:", v4);

}

- (unint64_t)neighborsCount
{
  return -[NSMutableArray count](self->_neighbors, "count");
}

- (id)neighborAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_neighbors, "objectAtIndex:", a3);
}

+ (Class)neighborType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasNeighborGroup
{
  return self->_neighborGroup != 0;
}

- (void)setIsLimitedService:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isLimitedService = a3;
}

- (void)setHasIsLimitedService:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsLimitedService
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasServiceProviderName
{
  return self->_serviceProviderName != 0;
}

- (void)setUniqueCount:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_uniqueCount = a3;
}

- (void)setHasUniqueCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasUniqueCount
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasWifiFallback:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_hasWifiFallback = a3;
}

- (void)setHasHasWifiFallback:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasHasWifiFallback
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CLPCellTowerLocation;
  -[CLPCellTowerLocation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPCellTowerLocation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int16 has;
  void *v10;
  void *v11;
  CLPLocation *location;
  void *v13;
  NSString *appBundleId;
  __int16 v15;
  void *v16;
  void *v17;
  NSString *operatorName;
  __int16 v19;
  void *v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  CLPCellNeighborsGroup *neighborGroup;
  void *v29;
  void *v30;
  NSString *serviceProviderName;
  __int16 v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_mcc);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("mcc"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_mnc);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("mnc"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_lac);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("lac"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_ci);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("ci"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_rssi);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("rssi"));

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_arfcn);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("arfcn"));

    has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_psc);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("psc"));

  }
  location = self->_location;
  if (location)
  {
    -[CLPLocation dictionaryRepresentation](location, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("location"));

  }
  appBundleId = self->_appBundleId;
  if (appBundleId)
    objc_msgSend(v3, "setObject:forKey:", appBundleId, CFSTR("appBundleId"));
  v15 = (__int16)self->_has;
  if ((v15 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_serverHash);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("serverHash"));

    v15 = (__int16)self->_has;
  }
  if ((v15 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_transmit);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("transmit"));

  }
  operatorName = self->_operatorName;
  if (operatorName)
    objc_msgSend(v3, "setObject:forKey:", operatorName, CFSTR("operatorName"));
  v19 = (__int16)self->_has;
  if ((v19 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_ecn0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("ecn0"));

    v19 = (__int16)self->_has;
    if ((v19 & 0x10) == 0)
    {
LABEL_17:
      if ((v19 & 8) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((v19 & 0x10) == 0)
  {
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_rscp);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("rscp"));

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_rat);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("rat"));

  }
LABEL_19:
  if (-[NSMutableArray count](self->_neighbors, "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_neighbors, "count"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v22 = self->_neighbors;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v39 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v38);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v27);

        }
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v24);
    }

    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("neighbor"));
  }
  neighborGroup = self->_neighborGroup;
  if (neighborGroup)
  {
    -[CLPCellNeighborsGroup dictionaryRepresentation](neighborGroup, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("neighborGroup"));

  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLimitedService);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("isLimitedService"));

  }
  serviceProviderName = self->_serviceProviderName;
  if (serviceProviderName)
    objc_msgSend(v3, "setObject:forKey:", serviceProviderName, CFSTR("serviceProviderName"));
  v32 = (__int16)self->_has;
  if ((v32 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_uniqueCount);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("uniqueCount"));

    v32 = (__int16)self->_has;
  }
  if ((v32 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasWifiFallback);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("hasWifiFallback"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPCellTowerLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int16 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (!self->_location)
    -[CLPCellTowerLocation writeTo:].cold.1();
  PBDataWriterWriteSubmessage();
  if (self->_appBundleId)
    PBDataWriterWriteStringField();
  v6 = (__int16)self->_has;
  if ((v6 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x40) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_operatorName)
    PBDataWriterWriteStringField();
  v7 = (__int16)self->_has;
  if ((v7 & 2) != 0)
  {
    PBDataWriterWriteSint32Field();
    v7 = (__int16)self->_has;
    if ((v7 & 0x10) == 0)
    {
LABEL_16:
      if ((v7 & 8) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((v7 & 0x10) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteSint32Field();
  if ((*(_WORD *)&self->_has & 8) != 0)
LABEL_17:
    PBDataWriterWriteInt32Field();
LABEL_18:
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_neighbors;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  if (self->_neighborGroup)
    PBDataWriterWriteSubmessage();
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_serviceProviderName)
    PBDataWriterWriteStringField();
  v13 = (__int16)self->_has;
  if ((v13 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    v13 = (__int16)self->_has;
  }
  if ((v13 & 0x80) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;
  __int16 v6;
  _DWORD *v7;
  __int16 v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  _BYTE *v13;
  __int16 v14;
  id v15;

  v4 = a3;
  v4[10] = self->_mcc;
  v4[11] = self->_mnc;
  v4[7] = self->_lac;
  v4[5] = self->_ci;
  v4[21] = self->_rssi;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[4] = self->_arfcn;
    *((_WORD *)v4 + 56) |= 1u;
    has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[18] = self->_psc;
    *((_WORD *)v4 + 56) |= 4u;
  }
  v15 = v4;
  objc_msgSend(v4, "setLocation:", self->_location);
  if (self->_appBundleId)
    objc_msgSend(v15, "setAppBundleId:");
  v6 = (__int16)self->_has;
  v7 = v15;
  if ((v6 & 0x20) != 0)
  {
    *((_DWORD *)v15 + 22) = self->_serverHash;
    *((_WORD *)v15 + 56) |= 0x20u;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x40) != 0)
  {
    *((_DWORD *)v15 + 26) = self->_transmit;
    *((_WORD *)v15 + 56) |= 0x40u;
  }
  if (self->_operatorName)
  {
    objc_msgSend(v15, "setOperatorName:");
    v7 = v15;
  }
  v8 = (__int16)self->_has;
  if ((v8 & 2) == 0)
  {
    if ((v8 & 0x10) == 0)
      goto LABEL_15;
LABEL_33:
    v7[20] = self->_rscp;
    *((_WORD *)v7 + 56) |= 0x10u;
    if ((*(_WORD *)&self->_has & 8) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
  v7[6] = self->_ecn0;
  *((_WORD *)v7 + 56) |= 2u;
  v8 = (__int16)self->_has;
  if ((v8 & 0x10) != 0)
    goto LABEL_33;
LABEL_15:
  if ((v8 & 8) != 0)
  {
LABEL_16:
    v7[19] = self->_rat;
    *((_WORD *)v7 + 56) |= 8u;
  }
LABEL_17:
  if (-[CLPCellTowerLocation neighborsCount](self, "neighborsCount"))
  {
    objc_msgSend(v15, "clearNeighbors");
    v9 = -[CLPCellTowerLocation neighborsCount](self, "neighborsCount");
    if (v9)
    {
      v10 = v9;
      for (i = 0; i != v10; ++i)
      {
        -[CLPCellTowerLocation neighborAtIndex:](self, "neighborAtIndex:", i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addNeighbor:", v12);

      }
    }
  }
  if (self->_neighborGroup)
    objc_msgSend(v15, "setNeighborGroup:");
  v13 = v15;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((_BYTE *)v15 + 109) = self->_isLimitedService;
    *((_WORD *)v15 + 56) |= 0x100u;
  }
  if (self->_serviceProviderName)
  {
    objc_msgSend(v15, "setServiceProviderName:");
    v13 = v15;
  }
  v14 = (__int16)self->_has;
  if ((v14 & 0x200) != 0)
  {
    v13[110] = self->_uniqueCount;
    *((_WORD *)v13 + 56) |= 0x200u;
    v14 = (__int16)self->_has;
  }
  if ((v14 & 0x80) != 0)
  {
    v13[108] = self->_hasWifiFallback;
    *((_WORD *)v13 + 56) |= 0x80u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  void *v14;
  __int16 v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __int16 v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  *(_DWORD *)(v5 + 40) = self->_mcc;
  *(_DWORD *)(v5 + 44) = self->_mnc;
  *(_DWORD *)(v5 + 28) = self->_lac;
  *(_DWORD *)(v5 + 20) = self->_ci;
  *(_DWORD *)(v5 + 84) = self->_rssi;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_arfcn;
    *(_WORD *)(v5 + 112) |= 1u;
    has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_psc;
    *(_WORD *)(v5 + 112) |= 4u;
  }
  v8 = -[CLPLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_appBundleId, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v10;

  v12 = (__int16)self->_has;
  if ((v12 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 88) = self->_serverHash;
    *(_WORD *)(v6 + 112) |= 0x20u;
    v12 = (__int16)self->_has;
  }
  if ((v12 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 104) = self->_transmit;
    *(_WORD *)(v6 + 112) |= 0x40u;
  }
  v13 = -[NSString copyWithZone:](self->_operatorName, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v13;

  v15 = (__int16)self->_has;
  if ((v15 & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_ecn0;
    *(_WORD *)(v6 + 112) |= 2u;
    v15 = (__int16)self->_has;
    if ((v15 & 0x10) == 0)
    {
LABEL_11:
      if ((v15 & 8) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((v15 & 0x10) == 0)
  {
    goto LABEL_11;
  }
  *(_DWORD *)(v6 + 80) = self->_rscp;
  *(_WORD *)(v6 + 112) |= 0x10u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_12:
    *(_DWORD *)(v6 + 76) = self->_rat;
    *(_WORD *)(v6 + 112) |= 8u;
  }
LABEL_13:
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v16 = self->_neighbors;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v28);
        objc_msgSend((id)v6, "addNeighbor:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v18);
  }

  v22 = -[CLPCellNeighborsGroup copyWithZone:](self->_neighborGroup, "copyWithZone:", a3);
  v23 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v22;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(_BYTE *)(v6 + 109) = self->_isLimitedService;
    *(_WORD *)(v6 + 112) |= 0x100u;
  }
  v24 = -[NSString copyWithZone:](self->_serviceProviderName, "copyWithZone:", a3, (_QWORD)v28);
  v25 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v24;

  v26 = (__int16)self->_has;
  if ((v26 & 0x200) != 0)
  {
    *(_BYTE *)(v6 + 110) = self->_uniqueCount;
    *(_WORD *)(v6 + 112) |= 0x200u;
    v26 = (__int16)self->_has;
  }
  if ((v26 & 0x80) != 0)
  {
    *(_BYTE *)(v6 + 108) = self->_hasWifiFallback;
    *(_WORD *)(v6 + 112) |= 0x80u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  CLPLocation *location;
  NSString *appBundleId;
  __int16 v9;
  __int16 v10;
  NSString *operatorName;
  __int16 v12;
  NSMutableArray *neighbors;
  CLPCellNeighborsGroup *neighborGroup;
  __int16 v15;
  NSString *serviceProviderName;
  __int16 v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    || self->_mcc != *((_DWORD *)v4 + 10)
    || self->_mnc != *((_DWORD *)v4 + 11)
    || self->_lac != *((_DWORD *)v4 + 7)
    || self->_ci != *((_DWORD *)v4 + 5)
    || self->_rssi != *((_DWORD *)v4 + 21))
  {
    goto LABEL_75;
  }
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 56);
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_arfcn != *((_DWORD *)v4 + 4))
      goto LABEL_75;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_psc != *((_DWORD *)v4 + 18))
      goto LABEL_75;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_75;
  }
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 4) && !-[CLPLocation isEqual:](location, "isEqual:"))
    goto LABEL_75;
  appBundleId = self->_appBundleId;
  if ((unint64_t)appBundleId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](appBundleId, "isEqual:"))
      goto LABEL_75;
  }
  v9 = (__int16)self->_has;
  v10 = *((_WORD *)v4 + 56);
  if ((v9 & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_serverHash != *((_DWORD *)v4 + 22))
      goto LABEL_75;
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_75;
  }
  if ((v9 & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_transmit != *((_DWORD *)v4 + 26))
      goto LABEL_75;
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_75;
  }
  operatorName = self->_operatorName;
  if ((unint64_t)operatorName | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](operatorName, "isEqual:"))
      goto LABEL_75;
    v9 = (__int16)self->_has;
  }
  v12 = *((_WORD *)v4 + 56);
  if ((v9 & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_ecn0 != *((_DWORD *)v4 + 6))
      goto LABEL_75;
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_75;
  }
  if ((v9 & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0 || self->_rscp != *((_DWORD *)v4 + 20))
      goto LABEL_75;
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_75;
  }
  if ((v9 & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_rat != *((_DWORD *)v4 + 19))
      goto LABEL_75;
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_75;
  }
  neighbors = self->_neighbors;
  if ((unint64_t)neighbors | *((_QWORD *)v4 + 7)
    && !-[NSMutableArray isEqual:](neighbors, "isEqual:"))
  {
    goto LABEL_75;
  }
  neighborGroup = self->_neighborGroup;
  if ((unint64_t)neighborGroup | *((_QWORD *)v4 + 6))
  {
    if (!-[CLPCellNeighborsGroup isEqual:](neighborGroup, "isEqual:"))
      goto LABEL_75;
  }
  v15 = (__int16)self->_has;
  if ((v15 & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x100) == 0)
      goto LABEL_75;
    if (self->_isLimitedService)
    {
      if (!*((_BYTE *)v4 + 109))
        goto LABEL_75;
    }
    else if (*((_BYTE *)v4 + 109))
    {
      goto LABEL_75;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x100) != 0)
  {
    goto LABEL_75;
  }
  serviceProviderName = self->_serviceProviderName;
  if ((unint64_t)serviceProviderName | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](serviceProviderName, "isEqual:"))
      goto LABEL_75;
    v15 = (__int16)self->_has;
  }
  v17 = *((_WORD *)v4 + 56);
  if ((v15 & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x200) == 0)
      goto LABEL_75;
    if (self->_uniqueCount)
    {
      if (!*((_BYTE *)v4 + 110))
        goto LABEL_75;
    }
    else if (*((_BYTE *)v4 + 110))
    {
      goto LABEL_75;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x200) != 0)
  {
    goto LABEL_75;
  }
  if ((v15 & 0x80) != 0)
  {
    if ((v17 & 0x80) != 0)
    {
      if (self->_hasWifiFallback)
      {
        if (!*((_BYTE *)v4 + 108))
          goto LABEL_75;
      }
      else if (*((_BYTE *)v4 + 108))
      {
        goto LABEL_75;
      }
      v18 = 1;
      goto LABEL_76;
    }
LABEL_75:
    v18 = 0;
    goto LABEL_76;
  }
  v18 = (v17 & 0x80) == 0;
LABEL_76:

  return v18;
}

- (unint64_t)hash
{
  __int16 has;
  __int16 v4;
  NSUInteger v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  uint64_t rssi;
  uint64_t ci;
  unint64_t v23;
  uint64_t lac;
  uint64_t mnc;
  uint64_t mcc;
  uint64_t v27;
  uint64_t v28;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
    v28 = 2654435761 * self->_arfcn;
  else
    v28 = 0;
  if ((has & 4) != 0)
    v27 = 2654435761 * self->_psc;
  else
    v27 = 0;
  mcc = self->_mcc;
  mnc = self->_mnc;
  lac = self->_lac;
  rssi = self->_rssi;
  ci = self->_ci;
  v23 = -[CLPLocation hash](self->_location, "hash");
  v20 = -[NSString hash](self->_appBundleId, "hash");
  v4 = (__int16)self->_has;
  if ((v4 & 0x20) != 0)
  {
    v19 = 2654435761 * self->_serverHash;
    if ((v4 & 0x40) != 0)
      goto LABEL_9;
  }
  else
  {
    v19 = 0;
    if ((v4 & 0x40) != 0)
    {
LABEL_9:
      v18 = 2654435761 * self->_transmit;
      goto LABEL_12;
    }
  }
  v18 = 0;
LABEL_12:
  v5 = -[NSString hash](self->_operatorName, "hash");
  v6 = (__int16)self->_has;
  if ((v6 & 2) == 0)
  {
    v7 = 0;
    if ((v6 & 0x10) != 0)
      goto LABEL_14;
LABEL_17:
    v8 = 0;
    if ((v6 & 8) != 0)
      goto LABEL_15;
    goto LABEL_18;
  }
  v7 = 2654435761 * self->_ecn0;
  if ((v6 & 0x10) == 0)
    goto LABEL_17;
LABEL_14:
  v8 = 2654435761 * self->_rscp;
  if ((v6 & 8) != 0)
  {
LABEL_15:
    v9 = 2654435761 * self->_rat;
    goto LABEL_19;
  }
LABEL_18:
  v9 = 0;
LABEL_19:
  v10 = -[NSMutableArray hash](self->_neighbors, "hash");
  v11 = -[CLPCellNeighborsGroup hash](self->_neighborGroup, "hash");
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    v12 = 2654435761 * self->_isLimitedService;
  else
    v12 = 0;
  v13 = -[NSString hash](self->_serviceProviderName, "hash");
  v14 = (__int16)self->_has;
  if ((v14 & 0x200) != 0)
  {
    v15 = 2654435761 * self->_uniqueCount;
    if ((v14 & 0x80) != 0)
      goto LABEL_24;
LABEL_26:
    v16 = 0;
    return (2654435761 * mnc) ^ (2654435761 * mcc) ^ (2654435761 * lac) ^ (2654435761 * ci) ^ (2654435761 * rssi) ^ v28 ^ v27 ^ v23 ^ v20 ^ v19 ^ v18 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16;
  }
  v15 = 0;
  if ((v14 & 0x80) == 0)
    goto LABEL_26;
LABEL_24:
  v16 = 2654435761 * self->_hasWifiFallback;
  return (2654435761 * mnc) ^ (2654435761 * mcc) ^ (2654435761 * lac) ^ (2654435761 * ci) ^ (2654435761 * rssi) ^ v28 ^ v27 ^ v23 ^ v20 ^ v19 ^ v18 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  __int16 v6;
  CLPLocation *location;
  uint64_t v8;
  __int16 v9;
  __int16 v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  CLPCellNeighborsGroup *neighborGroup;
  uint64_t v17;
  __int16 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  self->_mcc = v4[10];
  self->_mnc = v4[11];
  self->_lac = v4[7];
  self->_ci = v4[5];
  self->_rssi = v4[21];
  v6 = *((_WORD *)v4 + 56);
  if ((v6 & 1) != 0)
  {
    self->_arfcn = v4[4];
    *(_WORD *)&self->_has |= 1u;
    v6 = *((_WORD *)v4 + 56);
  }
  if ((v6 & 4) != 0)
  {
    self->_psc = v4[18];
    *(_WORD *)&self->_has |= 4u;
  }
  location = self->_location;
  v8 = *((_QWORD *)v5 + 4);
  if (location)
  {
    if (v8)
      -[CLPLocation mergeFrom:](location, "mergeFrom:");
  }
  else if (v8)
  {
    -[CLPCellTowerLocation setLocation:](self, "setLocation:");
  }
  if (*((_QWORD *)v5 + 1))
    -[CLPCellTowerLocation setAppBundleId:](self, "setAppBundleId:");
  v9 = *((_WORD *)v5 + 56);
  if ((v9 & 0x20) != 0)
  {
    self->_serverHash = *((_DWORD *)v5 + 22);
    *(_WORD *)&self->_has |= 0x20u;
    v9 = *((_WORD *)v5 + 56);
  }
  if ((v9 & 0x40) != 0)
  {
    self->_transmit = *((_DWORD *)v5 + 26);
    *(_WORD *)&self->_has |= 0x40u;
  }
  if (*((_QWORD *)v5 + 8))
    -[CLPCellTowerLocation setOperatorName:](self, "setOperatorName:");
  v10 = *((_WORD *)v5 + 56);
  if ((v10 & 2) != 0)
  {
    self->_ecn0 = *((_DWORD *)v5 + 6);
    *(_WORD *)&self->_has |= 2u;
    v10 = *((_WORD *)v5 + 56);
    if ((v10 & 0x10) == 0)
    {
LABEL_20:
      if ((v10 & 8) == 0)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  else if ((v10 & 0x10) == 0)
  {
    goto LABEL_20;
  }
  self->_rscp = *((_DWORD *)v5 + 20);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)v5 + 56) & 8) != 0)
  {
LABEL_21:
    self->_rat = *((_DWORD *)v5 + 19);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_22:
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = *((id *)v5 + 7);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        -[CLPCellTowerLocation addNeighbor:](self, "addNeighbor:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  neighborGroup = self->_neighborGroup;
  v17 = *((_QWORD *)v5 + 6);
  if (neighborGroup)
  {
    if (v17)
      -[CLPCellNeighborsGroup mergeFrom:](neighborGroup, "mergeFrom:");
  }
  else if (v17)
  {
    -[CLPCellTowerLocation setNeighborGroup:](self, "setNeighborGroup:");
  }
  if ((*((_WORD *)v5 + 56) & 0x100) != 0)
  {
    self->_isLimitedService = *((_BYTE *)v5 + 109);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)v5 + 12))
    -[CLPCellTowerLocation setServiceProviderName:](self, "setServiceProviderName:");
  v18 = *((_WORD *)v5 + 56);
  if ((v18 & 0x200) != 0)
  {
    self->_uniqueCount = *((_BYTE *)v5 + 110);
    *(_WORD *)&self->_has |= 0x200u;
    v18 = *((_WORD *)v5 + 56);
  }
  if ((v18 & 0x80) != 0)
  {
    self->_hasWifiFallback = *((_BYTE *)v5 + 108);
    *(_WORD *)&self->_has |= 0x80u;
  }

}

- (int)mcc
{
  return self->_mcc;
}

- (void)setMcc:(int)a3
{
  self->_mcc = a3;
}

- (int)mnc
{
  return self->_mnc;
}

- (void)setMnc:(int)a3
{
  self->_mnc = a3;
}

- (int)lac
{
  return self->_lac;
}

- (void)setLac:(int)a3
{
  self->_lac = a3;
}

- (int)ci
{
  return self->_ci;
}

- (void)setCi:(int)a3
{
  self->_ci = a3;
}

- (int)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int)a3
{
  self->_rssi = a3;
}

- (int)arfcn
{
  return self->_arfcn;
}

- (int)psc
{
  return self->_psc;
}

- (CLPLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleId, a3);
}

- (int)serverHash
{
  return self->_serverHash;
}

- (int)transmit
{
  return self->_transmit;
}

- (NSString)operatorName
{
  return self->_operatorName;
}

- (void)setOperatorName:(id)a3
{
  objc_storeStrong((id *)&self->_operatorName, a3);
}

- (int)ecn0
{
  return self->_ecn0;
}

- (int)rscp
{
  return self->_rscp;
}

- (int)rat
{
  return self->_rat;
}

- (NSMutableArray)neighbors
{
  return self->_neighbors;
}

- (void)setNeighbors:(id)a3
{
  objc_storeStrong((id *)&self->_neighbors, a3);
}

- (CLPCellNeighborsGroup)neighborGroup
{
  return self->_neighborGroup;
}

- (void)setNeighborGroup:(id)a3
{
  objc_storeStrong((id *)&self->_neighborGroup, a3);
}

- (BOOL)isLimitedService
{
  return self->_isLimitedService;
}

- (NSString)serviceProviderName
{
  return self->_serviceProviderName;
}

- (void)setServiceProviderName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProviderName, a3);
}

- (BOOL)uniqueCount
{
  return self->_uniqueCount;
}

- (BOOL)hasWifiFallback
{
  return self->_hasWifiFallback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProviderName, 0);
  objc_storeStrong((id *)&self->_operatorName, 0);
  objc_storeStrong((id *)&self->_neighbors, 0);
  objc_storeStrong((id *)&self->_neighborGroup, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPCellTowerLocation writeTo:]", "CLPCollectionRequest.gen.m", 6587, "self->_location != nil");
}

@end
