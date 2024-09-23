@implementation CLPSCdmaCellTowerLocation

- (void)setArfcn:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_arfcn = a3;
}

- (void)setHasArfcn:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasArfcn
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setPsc:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_psc = a3;
}

- (void)setHasPsc:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPsc
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

- (void)setServerHash:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_serverHash = a3;
}

- (void)setHasServerHash:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasServerHash
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setTransmit:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_transmit = a3;
}

- (void)setHasTransmit:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTransmit
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasOperatorName
{
  return self->_operatorName != 0;
}

- (void)setEcn0:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_ecn0 = a3;
}

- (void)setHasEcn0:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEcn0
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setRscp:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_rscp = a3;
}

- (void)setHasRscp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRscp
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setRat:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_rat = a3;
}

- (void)setHasRat:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRat
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  *(_BYTE *)&self->_has |= 0x80u;
  self->_isLimitedService = a3;
}

- (void)setHasIsLimitedService:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasIsLimitedService
{
  return *(_BYTE *)&self->_has >> 7;
}

- (BOOL)hasServiceProviderName
{
  return self->_serviceProviderName != 0;
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
  v8.super_class = (Class)CLPSCdmaCellTowerLocation;
  -[CLPSCdmaCellTowerLocation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPSCdmaCellTowerLocation dictionaryRepresentation](self, "dictionaryRepresentation");
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
  char has;
  void *v10;
  void *v11;
  CLPLocation *location;
  void *v13;
  NSString *appBundleId;
  char v15;
  void *v16;
  void *v17;
  NSString *operatorName;
  char v19;
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
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
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

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_arfcn);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("arfcn"));

    has = (char)self->_has;
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
  v15 = (char)self->_has;
  if ((v15 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_serverHash);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("serverHash"));

    v15 = (char)self->_has;
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
  v19 = (char)self->_has;
  if ((v19 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_ecn0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("ecn0"));

    v19 = (char)self->_has;
    if ((v19 & 0x10) == 0)
    {
LABEL_17:
      if ((v19 & 8) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_rscp);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("rscp"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
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
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v22 = self->_neighbors;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v36 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v35);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v27);

        }
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
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
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLimitedService);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("isLimitedService"));

  }
  serviceProviderName = self->_serviceProviderName;
  if (serviceProviderName)
    objc_msgSend(v3, "setObject:forKey:", serviceProviderName, CFSTR("serviceProviderName"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPSCdmaCellTowerLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  char v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (!self->_location)
    -[CLPSCdmaCellTowerLocation writeTo:].cold.1();
  PBDataWriterWriteSubmessage();
  if (self->_appBundleId)
    PBDataWriterWriteStringField();
  v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = (char)self->_has;
  }
  if ((v6 & 0x40) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_operatorName)
    PBDataWriterWriteStringField();
  v7 = (char)self->_has;
  if ((v7 & 2) != 0)
  {
    PBDataWriterWriteSint32Field();
    v7 = (char)self->_has;
    if ((v7 & 0x10) == 0)
    {
LABEL_16:
      if ((v7 & 8) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteSint32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_17:
    PBDataWriterWriteInt32Field();
LABEL_18:
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_neighbors;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  if (self->_neighborGroup)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_serviceProviderName)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  char v6;
  _DWORD *v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v4[10] = self->_mcc;
  v4[11] = self->_mnc;
  v4[7] = self->_lac;
  v4[5] = self->_ci;
  v4[21] = self->_rssi;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[4] = self->_arfcn;
    *((_BYTE *)v4 + 112) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[18] = self->_psc;
    *((_BYTE *)v4 + 112) |= 4u;
  }
  v14 = v4;
  objc_msgSend(v4, "setLocation:", self->_location);
  if (self->_appBundleId)
    objc_msgSend(v14, "setAppBundleId:");
  v6 = (char)self->_has;
  v7 = v14;
  if ((v6 & 0x20) != 0)
  {
    *((_DWORD *)v14 + 22) = self->_serverHash;
    *((_BYTE *)v14 + 112) |= 0x20u;
    v6 = (char)self->_has;
  }
  if ((v6 & 0x40) != 0)
  {
    *((_DWORD *)v14 + 26) = self->_transmit;
    *((_BYTE *)v14 + 112) |= 0x40u;
  }
  if (self->_operatorName)
  {
    objc_msgSend(v14, "setOperatorName:");
    v7 = v14;
  }
  v8 = (char)self->_has;
  if ((v8 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_15;
LABEL_29:
    v7[20] = self->_rscp;
    *((_BYTE *)v7 + 112) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
  v7[6] = self->_ecn0;
  *((_BYTE *)v7 + 112) |= 2u;
  v8 = (char)self->_has;
  if ((v8 & 0x10) != 0)
    goto LABEL_29;
LABEL_15:
  if ((v8 & 8) != 0)
  {
LABEL_16:
    v7[19] = self->_rat;
    *((_BYTE *)v7 + 112) |= 8u;
  }
LABEL_17:
  if (-[CLPSCdmaCellTowerLocation neighborsCount](self, "neighborsCount"))
  {
    objc_msgSend(v14, "clearNeighbors");
    v9 = -[CLPSCdmaCellTowerLocation neighborsCount](self, "neighborsCount");
    if (v9)
    {
      v10 = v9;
      for (i = 0; i != v10; ++i)
      {
        -[CLPSCdmaCellTowerLocation neighborAtIndex:](self, "neighborAtIndex:", i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addNeighbor:", v12);

      }
    }
  }
  if (self->_neighborGroup)
    objc_msgSend(v14, "setNeighborGroup:");
  v13 = v14;
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *((_BYTE *)v14 + 108) = self->_isLimitedService;
    *((_BYTE *)v14 + 112) |= 0x80u;
  }
  if (self->_serviceProviderName)
  {
    objc_msgSend(v14, "setServiceProviderName:");
    v13 = v14;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  char v15;
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
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  *(_DWORD *)(v5 + 40) = self->_mcc;
  *(_DWORD *)(v5 + 44) = self->_mnc;
  *(_DWORD *)(v5 + 28) = self->_lac;
  *(_DWORD *)(v5 + 20) = self->_ci;
  *(_DWORD *)(v5 + 84) = self->_rssi;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_arfcn;
    *(_BYTE *)(v5 + 112) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_psc;
    *(_BYTE *)(v5 + 112) |= 4u;
  }
  v8 = -[CLPLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_appBundleId, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v10;

  v12 = (char)self->_has;
  if ((v12 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 88) = self->_serverHash;
    *(_BYTE *)(v6 + 112) |= 0x20u;
    v12 = (char)self->_has;
  }
  if ((v12 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 104) = self->_transmit;
    *(_BYTE *)(v6 + 112) |= 0x40u;
  }
  v13 = -[NSString copyWithZone:](self->_operatorName, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v13;

  v15 = (char)self->_has;
  if ((v15 & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_ecn0;
    *(_BYTE *)(v6 + 112) |= 2u;
    v15 = (char)self->_has;
    if ((v15 & 0x10) == 0)
    {
LABEL_11:
      if ((v15 & 8) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_11;
  }
  *(_DWORD *)(v6 + 80) = self->_rscp;
  *(_BYTE *)(v6 + 112) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_12:
    *(_DWORD *)(v6 + 76) = self->_rat;
    *(_BYTE *)(v6 + 112) |= 8u;
  }
LABEL_13:
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v16 = self->_neighbors;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v27);
        objc_msgSend((id)v6, "addNeighbor:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v18);
  }

  v22 = -[CLPCellNeighborsGroup copyWithZone:](self->_neighborGroup, "copyWithZone:", a3);
  v23 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v22;

  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *(_BYTE *)(v6 + 108) = self->_isLimitedService;
    *(_BYTE *)(v6 + 112) |= 0x80u;
  }
  v24 = -[NSString copyWithZone:](self->_serviceProviderName, "copyWithZone:", a3, (_QWORD)v27);
  v25 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v24;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  CLPLocation *location;
  NSString *appBundleId;
  char has;
  NSString *operatorName;
  NSMutableArray *neighbors;
  CLPCellNeighborsGroup *neighborGroup;
  int v11;
  NSString *serviceProviderName;
  char v13;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    || self->_mcc != *((_DWORD *)v4 + 10)
    || self->_mnc != *((_DWORD *)v4 + 11)
    || self->_lac != *((_DWORD *)v4 + 7)
    || self->_ci != *((_DWORD *)v4 + 5)
    || self->_rssi != *((_DWORD *)v4 + 21))
  {
    goto LABEL_58;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[112] & 1) == 0 || self->_arfcn != *((_DWORD *)v4 + 4))
      goto LABEL_58;
  }
  else if ((v4[112] & 1) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[112] & 4) == 0 || self->_psc != *((_DWORD *)v4 + 18))
      goto LABEL_58;
  }
  else if ((v4[112] & 4) != 0)
  {
    goto LABEL_58;
  }
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 4) && !-[CLPLocation isEqual:](location, "isEqual:"))
    goto LABEL_58;
  appBundleId = self->_appBundleId;
  if ((unint64_t)appBundleId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](appBundleId, "isEqual:"))
      goto LABEL_58;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    if ((v4[112] & 0x20) == 0 || self->_serverHash != *((_DWORD *)v4 + 22))
      goto LABEL_58;
  }
  else if ((v4[112] & 0x20) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((v4[112] & 0x40) == 0 || self->_transmit != *((_DWORD *)v4 + 26))
      goto LABEL_58;
  }
  else if ((v4[112] & 0x40) != 0)
  {
    goto LABEL_58;
  }
  operatorName = self->_operatorName;
  if ((unint64_t)operatorName | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](operatorName, "isEqual:"))
      goto LABEL_58;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((v4[112] & 2) == 0 || self->_ecn0 != *((_DWORD *)v4 + 6))
      goto LABEL_58;
  }
  else if ((v4[112] & 2) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x10) != 0)
  {
    if ((v4[112] & 0x10) == 0 || self->_rscp != *((_DWORD *)v4 + 20))
      goto LABEL_58;
  }
  else if ((v4[112] & 0x10) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 8) != 0)
  {
    if ((v4[112] & 8) == 0 || self->_rat != *((_DWORD *)v4 + 19))
      goto LABEL_58;
  }
  else if ((v4[112] & 8) != 0)
  {
    goto LABEL_58;
  }
  neighbors = self->_neighbors;
  if ((unint64_t)neighbors | *((_QWORD *)v4 + 7)
    && !-[NSMutableArray isEqual:](neighbors, "isEqual:"))
  {
    goto LABEL_58;
  }
  neighborGroup = self->_neighborGroup;
  if ((unint64_t)neighborGroup | *((_QWORD *)v4 + 6))
  {
    if (!-[CLPCellNeighborsGroup isEqual:](neighborGroup, "isEqual:"))
      goto LABEL_58;
  }
  v11 = v4[112];
  if ((*(_BYTE *)&self->_has & 0x80000000) == 0)
  {
    if ((v11 & 0x80000000) == 0)
      goto LABEL_55;
LABEL_58:
    v13 = 0;
    goto LABEL_59;
  }
  if ((v11 & 0x80000000) == 0)
    goto LABEL_58;
  if (self->_isLimitedService)
  {
    if (!v4[108])
      goto LABEL_58;
  }
  else if (v4[108])
  {
    goto LABEL_58;
  }
LABEL_55:
  serviceProviderName = self->_serviceProviderName;
  if ((unint64_t)serviceProviderName | *((_QWORD *)v4 + 12))
    v13 = -[NSString isEqual:](serviceProviderName, "isEqual:");
  else
    v13 = 1;
LABEL_59:

  return v13;
}

- (unint64_t)hash
{
  uint64_t mcc;
  uint64_t mnc;
  uint64_t lac;
  uint64_t ci;
  uint64_t rssi;
  unint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSUInteger v24;
  uint64_t v25;
  unint64_t v26;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v22 = 2654435761 * self->_arfcn;
  else
    v22 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v21 = 2654435761 * self->_psc;
  else
    v21 = 0;
  mcc = self->_mcc;
  mnc = self->_mnc;
  lac = self->_lac;
  ci = self->_ci;
  rssi = self->_rssi;
  v8 = -[CLPLocation hash](self->_location, "hash");
  v9 = -[NSString hash](self->_appBundleId, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v20 = 2654435761 * self->_serverHash;
  else
    v20 = 0;
  v24 = v9;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v19 = 2654435761 * self->_transmit;
  else
    v19 = 0;
  v10 = -[NSString hash](self->_operatorName, "hash");
  v25 = mcc;
  v26 = v8;
  v23 = mnc;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v18 = 2654435761 * self->_ecn0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_15;
  }
  else
  {
    v18 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_15:
      v11 = 2654435761 * self->_rscp;
      goto LABEL_18;
    }
  }
  v11 = 0;
LABEL_18:
  v12 = v10;
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v13 = 2654435761 * self->_rat;
  else
    v13 = 0;
  v14 = -[NSMutableArray hash](self->_neighbors, "hash");
  v15 = -[CLPCellNeighborsGroup hash](self->_neighborGroup, "hash");
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    v16 = 2654435761 * self->_isLimitedService;
  else
    v16 = 0;
  return (2654435761 * v23) ^ (2654435761 * v25) ^ (2654435761 * lac) ^ (2654435761 * ci) ^ (2654435761 * rssi) ^ v22 ^ v21 ^ v26 ^ v24 ^ v20 ^ v19 ^ v12 ^ v18 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ -[NSString hash](self->_serviceProviderName, "hash");
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  char *v5;
  char v6;
  CLPLocation *location;
  uint64_t v8;
  char v9;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  CLPCellNeighborsGroup *neighborGroup;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  v5 = v4;
  self->_mcc = *((_DWORD *)v4 + 10);
  self->_mnc = *((_DWORD *)v4 + 11);
  self->_lac = *((_DWORD *)v4 + 7);
  self->_ci = *((_DWORD *)v4 + 5);
  self->_rssi = *((_DWORD *)v4 + 21);
  v6 = v4[112];
  if ((v6 & 1) != 0)
  {
    self->_arfcn = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
    v6 = v4[112];
  }
  if ((v6 & 4) != 0)
  {
    self->_psc = *((_DWORD *)v4 + 18);
    *(_BYTE *)&self->_has |= 4u;
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
    -[CLPSCdmaCellTowerLocation setLocation:](self, "setLocation:");
  }
  if (*((_QWORD *)v5 + 1))
    -[CLPSCdmaCellTowerLocation setAppBundleId:](self, "setAppBundleId:");
  v9 = v5[112];
  if ((v9 & 0x20) != 0)
  {
    self->_serverHash = *((_DWORD *)v5 + 22);
    *(_BYTE *)&self->_has |= 0x20u;
    v9 = v5[112];
  }
  if ((v9 & 0x40) != 0)
  {
    self->_transmit = *((_DWORD *)v5 + 26);
    *(_BYTE *)&self->_has |= 0x40u;
  }
  if (*((_QWORD *)v5 + 8))
    -[CLPSCdmaCellTowerLocation setOperatorName:](self, "setOperatorName:");
  v10 = v5[112];
  if ((v10 & 2) != 0)
  {
    self->_ecn0 = *((_DWORD *)v5 + 6);
    *(_BYTE *)&self->_has |= 2u;
    v10 = v5[112];
    if ((v10 & 0x10) == 0)
    {
LABEL_20:
      if ((v10 & 8) == 0)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  else if ((v5[112] & 0x10) == 0)
  {
    goto LABEL_20;
  }
  self->_rscp = *((_DWORD *)v5 + 20);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((v5[112] & 8) != 0)
  {
LABEL_21:
    self->_rat = *((_DWORD *)v5 + 19);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_22:
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = *((id *)v5 + 7);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        -[CLPSCdmaCellTowerLocation addNeighbor:](self, "addNeighbor:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
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
    -[CLPSCdmaCellTowerLocation setNeighborGroup:](self, "setNeighborGroup:");
  }
  if (v5[112] < 0)
  {
    self->_isLimitedService = v5[108];
    *(_BYTE *)&self->_has |= 0x80u;
  }
  if (*((_QWORD *)v5 + 12))
    -[CLPSCdmaCellTowerLocation setServiceProviderName:](self, "setServiceProviderName:");

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
  __assert_rtn("-[CLPSCdmaCellTowerLocation writeTo:]", "CLPCollectionRequest.gen.m", 33248, "self->_location != nil");
}

@end
