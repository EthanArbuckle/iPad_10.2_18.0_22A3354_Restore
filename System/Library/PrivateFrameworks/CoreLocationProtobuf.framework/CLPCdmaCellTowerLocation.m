@implementation CLPCdmaCellTowerLocation

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)CLPCdmaCellTowerLocation;
  -[CLPCdmaCellTowerLocation dealloc](&v3, sel_dealloc);
}

- (void)setBsLatitude:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_bsLatitude = a3;
}

- (void)setHasBsLatitude:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBsLatitude
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setBsLongitude:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_bsLongitude = a3;
}

- (void)setHasBsLongitude:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBsLongitude
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setZoneid:(int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_zoneid = a3;
}

- (void)setHasZoneid:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasZoneid
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (BOOL)hasSectorid
{
  return self->_sectorid != 0;
}

- (void)setSectorLatitude:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_sectorLatitude = a3;
}

- (void)setHasSectorLatitude:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasSectorLatitude
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setSectorLongitude:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_sectorLongitude = a3;
}

- (void)setHasSectorLongitude:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasSectorLongitude
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setBandclass:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_bandclass = a3;
}

- (void)setHasBandclass:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasBandclass
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRat:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_rat = a3;
}

- (void)setHasRat:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasRat
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setCelltype:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_celltype = a3;
}

- (void)setHasCelltype:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasCelltype
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setPnoffset:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_pnoffset = a3;
}

- (void)setHasPnoffset:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasPnoffset
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setChannel:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasChannel
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

- (void)setServerHash:(int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_serverHash = a3;
}

- (void)setHasServerHash:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasServerHash
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (BOOL)hasOperatorName
{
  return self->_operatorName != 0;
}

- (void)setLtmOffset:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_ltmOffset = a3;
}

- (void)setHasLtmOffset:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasLtmOffset
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setDayLightSavings:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_dayLightSavings = a3;
}

- (void)setHasDayLightSavings:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasDayLightSavings
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (unint64_t)derivedMccsCount
{
  return self->_derivedMccs.count;
}

- (int)derivedMccs
{
  return self->_derivedMccs.list;
}

- (void)clearDerivedMccs
{
  PBRepeatedInt32Clear();
}

- (void)addDerivedMcc:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)derivedMccAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_derivedMccs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_derivedMccs = &self->_derivedMccs;
  count = self->_derivedMccs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_derivedMccs->list[a3];
}

- (void)setDerivedMccs:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (void)setEcn0:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_ecn0 = a3;
}

- (void)setHasEcn0:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasEcn0
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRscp:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_rscp = a3;
}

- (void)setHasRscp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasRscp
{
  return (*(_WORD *)&self->_has >> 12) & 1;
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
  *(_WORD *)&self->_has |= 0x8000u;
  self->_isLimitedService = a3;
}

- (void)setHasIsLimitedService:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasIsLimitedService
{
  return *(_WORD *)&self->_has >> 15;
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
  v8.super_class = (Class)CLPCdmaCellTowerLocation;
  -[CLPCdmaCellTowerLocation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPCdmaCellTowerLocation dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *sectorid;
  __int16 v12;
  void *v13;
  CLPLocation *location;
  void *v15;
  NSString *appBundleId;
  void *v17;
  NSString *operatorName;
  __int16 v19;
  void *v20;
  void *v21;
  void *v22;
  __int16 v23;
  void *v24;
  void *v25;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  CLPCellNeighborsGroup *neighborGroup;
  void *v34;
  void *v35;
  NSString *serviceProviderName;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_mcc);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("mcc"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_mnc);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("mnc"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("sid"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_nid);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("nid"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_bsid);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("bsid"));

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_bsLatitude);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("bsLatitude"));

    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x4000) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_bsLongitude);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("bsLongitude"));

  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_zoneid);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("zoneid"));

  }
LABEL_5:
  sectorid = self->_sectorid;
  if (sectorid)
    objc_msgSend(v3, "setObject:forKey:", sectorid, CFSTR("sectorid"));
  v12 = (__int16)self->_has;
  if ((v12 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sectorLatitude);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("sectorLatitude"));

    v12 = (__int16)self->_has;
    if ((v12 & 8) == 0)
    {
LABEL_9:
      if ((v12 & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_52;
    }
  }
  else if ((v12 & 8) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sectorLongitude);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("sectorLongitude"));

  v12 = (__int16)self->_has;
  if ((v12 & 0x10) == 0)
  {
LABEL_10:
    if ((v12 & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_bandclass);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("bandclass"));

  v12 = (__int16)self->_has;
  if ((v12 & 0x800) == 0)
  {
LABEL_11:
    if ((v12 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_rat);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("rat"));

  v12 = (__int16)self->_has;
  if ((v12 & 0x20) == 0)
  {
LABEL_12:
    if ((v12 & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_celltype);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("celltype"));

  v12 = (__int16)self->_has;
  if ((v12 & 0x400) == 0)
  {
LABEL_13:
    if ((v12 & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_55:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_pnoffset);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("pnoffset"));

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_channel);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("channel"));

  }
LABEL_15:
  location = self->_location;
  if (location)
  {
    -[CLPLocation dictionaryRepresentation](location, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("location"));

  }
  appBundleId = self->_appBundleId;
  if (appBundleId)
    objc_msgSend(v3, "setObject:forKey:", appBundleId, CFSTR("appBundleId"));
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_serverHash);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("serverHash"));

  }
  operatorName = self->_operatorName;
  if (operatorName)
    objc_msgSend(v3, "setObject:forKey:", operatorName, CFSTR("operatorName"));
  v19 = (__int16)self->_has;
  if ((v19 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_ltmOffset);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("ltmOffset"));

    v19 = (__int16)self->_has;
  }
  if ((v19 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_dayLightSavings);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("dayLightSavings"));

  }
  PBRepeatedInt32NSArray();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("derivedMcc"));

  v23 = (__int16)self->_has;
  if ((v23 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_ecn0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("ecn0"));

    v23 = (__int16)self->_has;
  }
  if ((v23 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_rscp);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("rscp"));

  }
  if (-[NSMutableArray count](self->_neighbors, "count"))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_neighbors, "count"));
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v27 = self->_neighbors;
    v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v47 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v46);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v32);

        }
        v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      }
      while (v29);
    }

    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("neighbor"));
  }
  neighborGroup = self->_neighborGroup;
  if (neighborGroup)
  {
    -[CLPCellNeighborsGroup dictionaryRepresentation](neighborGroup, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("neighborGroup"));

  }
  if ((*(_WORD *)&self->_has & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLimitedService);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("isLimitedService"));

  }
  serviceProviderName = self->_serviceProviderName;
  if (serviceProviderName)
    objc_msgSend(v3, "setObject:forKey:", serviceProviderName, CFSTR("serviceProviderName"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPCdmaCellTowerLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  unint64_t v8;
  __int16 v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x4000) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
LABEL_4:
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (self->_sectorid)
    PBDataWriterWriteStringField();
  v6 = (__int16)self->_has;
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    v6 = (__int16)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_52;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_10:
    if ((v6 & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteInt32Field();
  v6 = (__int16)self->_has;
  if ((v6 & 0x800) == 0)
  {
LABEL_11:
    if ((v6 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteInt32Field();
  v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_12:
    if ((v6 & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteInt32Field();
  v6 = (__int16)self->_has;
  if ((v6 & 0x400) == 0)
  {
LABEL_13:
    if ((v6 & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_55:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x40) != 0)
LABEL_14:
    PBDataWriterWriteInt32Field();
LABEL_15:
  if (!self->_location)
    -[CLPCdmaCellTowerLocation writeTo:].cold.1();
  PBDataWriterWriteSubmessage();
  if (self->_appBundleId)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_operatorName)
    PBDataWriterWriteStringField();
  v7 = (__int16)self->_has;
  if ((v7 & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    v7 = (__int16)self->_has;
  }
  if ((v7 & 0x80) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_derivedMccs.count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v8;
    }
    while (v8 < self->_derivedMccs.count);
  }
  v9 = (__int16)self->_has;
  if ((v9 & 0x100) != 0)
  {
    PBDataWriterWriteSint32Field();
    v9 = (__int16)self->_has;
  }
  if ((v9 & 0x1000) != 0)
    PBDataWriterWriteSint32Field();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_neighbors;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

  if (self->_neighborGroup)
    PBDataWriterWriteSubmessage();
  if ((*(_WORD *)&self->_has & 0x80000000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_serviceProviderName)
    PBDataWriterWriteStringField();

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
  __int16 v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  _DWORD *v18;

  v4 = a3;
  v4[27] = self->_mcc;
  v4[28] = self->_mnc;
  v4[48] = self->_sid;
  v4[34] = self->_nid;
  v4[19] = self->_bsid;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_bsLatitude;
    *((_WORD *)v4 + 102) |= 1u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x4000) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_bsLongitude;
  *((_WORD *)v4 + 102) |= 2u;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_4:
    v4[49] = self->_zoneid;
    *((_WORD *)v4 + 102) |= 0x4000u;
  }
LABEL_5:
  v18 = v4;
  if (self->_sectorid)
  {
    objc_msgSend(v4, "setSectorid:");
    v4 = v18;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 4) != 0)
  {
    *((_QWORD *)v4 + 6) = *(_QWORD *)&self->_sectorLatitude;
    *((_WORD *)v4 + 102) |= 4u;
    v6 = (__int16)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_49;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_QWORD *)v4 + 7) = *(_QWORD *)&self->_sectorLongitude;
  *((_WORD *)v4 + 102) |= 8u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_10:
    if ((v6 & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_50;
  }
LABEL_49:
  v4[18] = self->_bandclass;
  *((_WORD *)v4 + 102) |= 0x10u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x800) == 0)
  {
LABEL_11:
    if ((v6 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_51;
  }
LABEL_50:
  v4[39] = self->_rat;
  *((_WORD *)v4 + 102) |= 0x800u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_12:
    if ((v6 & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_52;
  }
LABEL_51:
  v4[20] = self->_celltype;
  *((_WORD *)v4 + 102) |= 0x20u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x400) == 0)
  {
LABEL_13:
    if ((v6 & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_52:
  v4[38] = self->_pnoffset;
  *((_WORD *)v4 + 102) |= 0x400u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_14:
    v4[21] = self->_channel;
    *((_WORD *)v4 + 102) |= 0x40u;
  }
LABEL_15:
  objc_msgSend(v4, "setLocation:", self->_location);
  if (self->_appBundleId)
    objc_msgSend(v18, "setAppBundleId:");
  v7 = v18;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    v18[44] = self->_serverHash;
    *((_WORD *)v18 + 102) |= 0x2000u;
  }
  if (self->_operatorName)
  {
    objc_msgSend(v18, "setOperatorName:");
    v7 = v18;
  }
  v8 = (__int16)self->_has;
  if ((v8 & 0x200) != 0)
  {
    v7[26] = self->_ltmOffset;
    *((_WORD *)v7 + 102) |= 0x200u;
    v8 = (__int16)self->_has;
  }
  if ((v8 & 0x80) != 0)
  {
    v7[22] = self->_dayLightSavings;
    *((_WORD *)v7 + 102) |= 0x80u;
  }
  if (-[CLPCdmaCellTowerLocation derivedMccsCount](self, "derivedMccsCount"))
  {
    objc_msgSend(v18, "clearDerivedMccs");
    v9 = -[CLPCdmaCellTowerLocation derivedMccsCount](self, "derivedMccsCount");
    if (v9)
    {
      v10 = v9;
      for (i = 0; i != v10; ++i)
        objc_msgSend(v18, "addDerivedMcc:", -[CLPCdmaCellTowerLocation derivedMccAtIndex:](self, "derivedMccAtIndex:", i));
    }
  }
  v12 = (__int16)self->_has;
  if ((v12 & 0x100) != 0)
  {
    v18[23] = self->_ecn0;
    *((_WORD *)v18 + 102) |= 0x100u;
    v12 = (__int16)self->_has;
  }
  if ((v12 & 0x1000) != 0)
  {
    v18[40] = self->_rscp;
    *((_WORD *)v18 + 102) |= 0x1000u;
  }
  if (-[CLPCdmaCellTowerLocation neighborsCount](self, "neighborsCount"))
  {
    objc_msgSend(v18, "clearNeighbors");
    v13 = -[CLPCdmaCellTowerLocation neighborsCount](self, "neighborsCount");
    if (v13)
    {
      v14 = v13;
      for (j = 0; j != v14; ++j)
      {
        -[CLPCdmaCellTowerLocation neighborAtIndex:](self, "neighborAtIndex:", j);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addNeighbor:", v16);

      }
    }
  }
  if (self->_neighborGroup)
    objc_msgSend(v18, "setNeighborGroup:");
  v17 = v18;
  if ((*(_WORD *)&self->_has & 0x80000000) != 0)
  {
    *((_BYTE *)v18 + 200) = self->_isLimitedService;
    *((_WORD *)v18 + 102) |= 0x8000u;
  }
  if (self->_serviceProviderName)
  {
    objc_msgSend(v18, "setServiceProviderName:");
    v17 = v18;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  uint64_t v8;
  void *v9;
  __int16 v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int16 v17;
  __int16 v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  *(_DWORD *)(v5 + 108) = self->_mcc;
  *(_DWORD *)(v5 + 112) = self->_mnc;
  *(_DWORD *)(v5 + 192) = self->_sid;
  *(_DWORD *)(v5 + 136) = self->_nid;
  *(_DWORD *)(v5 + 76) = self->_bsid;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 32) = self->_bsLatitude;
    *(_WORD *)(v5 + 204) |= 1u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x4000) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 40) = self->_bsLongitude;
  *(_WORD *)(v5 + 204) |= 2u;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 196) = self->_zoneid;
    *(_WORD *)(v5 + 204) |= 0x4000u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_sectorid, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 168);
  *(_QWORD *)(v6 + 168) = v8;

  v10 = (__int16)self->_has;
  if ((v10 & 4) != 0)
  {
    *(double *)(v6 + 48) = self->_sectorLatitude;
    *(_WORD *)(v6 + 204) |= 4u;
    v10 = (__int16)self->_has;
    if ((v10 & 8) == 0)
    {
LABEL_7:
      if ((v10 & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_38;
    }
  }
  else if ((v10 & 8) == 0)
  {
    goto LABEL_7;
  }
  *(double *)(v6 + 56) = self->_sectorLongitude;
  *(_WORD *)(v6 + 204) |= 8u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x10) == 0)
  {
LABEL_8:
    if ((v10 & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_39;
  }
LABEL_38:
  *(_DWORD *)(v6 + 72) = self->_bandclass;
  *(_WORD *)(v6 + 204) |= 0x10u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x800) == 0)
  {
LABEL_9:
    if ((v10 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_40;
  }
LABEL_39:
  *(_DWORD *)(v6 + 156) = self->_rat;
  *(_WORD *)(v6 + 204) |= 0x800u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x20) == 0)
  {
LABEL_10:
    if ((v10 & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v6 + 80) = self->_celltype;
  *(_WORD *)(v6 + 204) |= 0x20u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x400) == 0)
  {
LABEL_11:
    if ((v10 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_41:
  *(_DWORD *)(v6 + 152) = self->_pnoffset;
  *(_WORD *)(v6 + 204) |= 0x400u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    *(_DWORD *)(v6 + 84) = self->_channel;
    *(_WORD *)(v6 + 204) |= 0x40u;
  }
LABEL_13:
  v11 = -[CLPLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v11;

  v13 = -[NSString copyWithZone:](self->_appBundleId, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v13;

  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    *(_DWORD *)(v6 + 176) = self->_serverHash;
    *(_WORD *)(v6 + 204) |= 0x2000u;
  }
  v15 = -[NSString copyWithZone:](self->_operatorName, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 144);
  *(_QWORD *)(v6 + 144) = v15;

  v17 = (__int16)self->_has;
  if ((v17 & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 104) = self->_ltmOffset;
    *(_WORD *)(v6 + 204) |= 0x200u;
    v17 = (__int16)self->_has;
  }
  if ((v17 & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 88) = self->_dayLightSavings;
    *(_WORD *)(v6 + 204) |= 0x80u;
  }
  PBRepeatedInt32Copy();
  v18 = (__int16)self->_has;
  if ((v18 & 0x100) != 0)
  {
    *(_DWORD *)(v6 + 92) = self->_ecn0;
    *(_WORD *)(v6 + 204) |= 0x100u;
    v18 = (__int16)self->_has;
  }
  if ((v18 & 0x1000) != 0)
  {
    *(_DWORD *)(v6 + 160) = self->_rscp;
    *(_WORD *)(v6 + 204) |= 0x1000u;
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v19 = self->_neighbors;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(v19);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v30);
        objc_msgSend((id)v6, "addNeighbor:", v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v21);
  }

  v25 = -[CLPCellNeighborsGroup copyWithZone:](self->_neighborGroup, "copyWithZone:", a3);
  v26 = *(void **)(v6 + 120);
  *(_QWORD *)(v6 + 120) = v25;

  if ((*(_WORD *)&self->_has & 0x80000000) != 0)
  {
    *(_BYTE *)(v6 + 200) = self->_isLimitedService;
    *(_WORD *)(v6 + 204) |= 0x8000u;
  }
  v27 = -[NSString copyWithZone:](self->_serviceProviderName, "copyWithZone:", a3, (_QWORD)v30);
  v28 = *(void **)(v6 + 184);
  *(_QWORD *)(v6 + 184) = v27;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  __int16 *v4;
  __int16 has;
  __int16 v6;
  NSString *sectorid;
  __int16 v8;
  CLPLocation *location;
  NSString *appBundleId;
  __int16 v11;
  NSString *operatorName;
  __int16 v13;
  NSMutableArray *neighbors;
  CLPCellNeighborsGroup *neighborGroup;
  int v16;
  NSString *serviceProviderName;
  char v18;

  v4 = (__int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    || self->_mcc != *((_DWORD *)v4 + 27)
    || self->_mnc != *((_DWORD *)v4 + 28)
    || self->_sid != *((_DWORD *)v4 + 48)
    || self->_nid != *((_DWORD *)v4 + 34)
    || self->_bsid != *((_DWORD *)v4 + 19))
  {
    goto LABEL_102;
  }
  has = (__int16)self->_has;
  v6 = v4[102];
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_bsLatitude != *((double *)v4 + 4))
      goto LABEL_102;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_102;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_bsLongitude != *((double *)v4 + 5))
      goto LABEL_102;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((v4[102] & 0x4000) == 0 || self->_zoneid != *((_DWORD *)v4 + 49))
      goto LABEL_102;
  }
  else if ((v4[102] & 0x4000) != 0)
  {
    goto LABEL_102;
  }
  sectorid = self->_sectorid;
  if ((unint64_t)sectorid | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](sectorid, "isEqual:"))
      goto LABEL_102;
    has = (__int16)self->_has;
  }
  v8 = v4[102];
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_sectorLatitude != *((double *)v4 + 6))
      goto LABEL_102;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_102;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_sectorLongitude != *((double *)v4 + 7))
      goto LABEL_102;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_102;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_bandclass != *((_DWORD *)v4 + 18))
      goto LABEL_102;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_102;
  }
  if ((has & 0x800) != 0)
  {
    if ((v4[102] & 0x800) == 0 || self->_rat != *((_DWORD *)v4 + 39))
      goto LABEL_102;
  }
  else if ((v4[102] & 0x800) != 0)
  {
    goto LABEL_102;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_celltype != *((_DWORD *)v4 + 20))
      goto LABEL_102;
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_102;
  }
  if ((has & 0x400) != 0)
  {
    if ((v4[102] & 0x400) == 0 || self->_pnoffset != *((_DWORD *)v4 + 38))
      goto LABEL_102;
  }
  else if ((v4[102] & 0x400) != 0)
  {
    goto LABEL_102;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_channel != *((_DWORD *)v4 + 21))
      goto LABEL_102;
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_102;
  }
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 12) && !-[CLPLocation isEqual:](location, "isEqual:"))
    goto LABEL_102;
  appBundleId = self->_appBundleId;
  if ((unint64_t)appBundleId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](appBundleId, "isEqual:"))
      goto LABEL_102;
  }
  v11 = (__int16)self->_has;
  if ((v11 & 0x2000) != 0)
  {
    if ((v4[102] & 0x2000) == 0 || self->_serverHash != *((_DWORD *)v4 + 44))
      goto LABEL_102;
  }
  else if ((v4[102] & 0x2000) != 0)
  {
    goto LABEL_102;
  }
  operatorName = self->_operatorName;
  if ((unint64_t)operatorName | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](operatorName, "isEqual:"))
      goto LABEL_102;
    v11 = (__int16)self->_has;
  }
  v13 = v4[102];
  if ((v11 & 0x200) != 0)
  {
    if ((v4[102] & 0x200) == 0 || self->_ltmOffset != *((_DWORD *)v4 + 26))
      goto LABEL_102;
  }
  else if ((v4[102] & 0x200) != 0)
  {
    goto LABEL_102;
  }
  if ((v11 & 0x80) != 0)
  {
    if ((v13 & 0x80) == 0 || self->_dayLightSavings != *((_DWORD *)v4 + 22))
      goto LABEL_102;
  }
  else if ((v13 & 0x80) != 0)
  {
    goto LABEL_102;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_102:
    v18 = 0;
    goto LABEL_103;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((v4[102] & 0x100) == 0 || self->_ecn0 != *((_DWORD *)v4 + 23))
      goto LABEL_102;
  }
  else if ((v4[102] & 0x100) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((v4[102] & 0x1000) == 0 || self->_rscp != *((_DWORD *)v4 + 40))
      goto LABEL_102;
  }
  else if ((v4[102] & 0x1000) != 0)
  {
    goto LABEL_102;
  }
  neighbors = self->_neighbors;
  if ((unint64_t)neighbors | *((_QWORD *)v4 + 16)
    && !-[NSMutableArray isEqual:](neighbors, "isEqual:"))
  {
    goto LABEL_102;
  }
  neighborGroup = self->_neighborGroup;
  if ((unint64_t)neighborGroup | *((_QWORD *)v4 + 15))
  {
    if (!-[CLPCellNeighborsGroup isEqual:](neighborGroup, "isEqual:"))
      goto LABEL_102;
  }
  v16 = v4[102];
  if ((*(_WORD *)&self->_has & 0x80000000) == 0)
  {
    if ((v16 & 0x80000000) == 0)
      goto LABEL_99;
    goto LABEL_102;
  }
  if ((v16 & 0x80000000) == 0)
    goto LABEL_102;
  if (self->_isLimitedService)
  {
    if (!*((_BYTE *)v4 + 200))
      goto LABEL_102;
  }
  else if (*((_BYTE *)v4 + 200))
  {
    goto LABEL_102;
  }
LABEL_99:
  serviceProviderName = self->_serviceProviderName;
  if ((unint64_t)serviceProviderName | *((_QWORD *)v4 + 23))
    v18 = -[NSString isEqual:](serviceProviderName, "isEqual:");
  else
    v18 = 1;
LABEL_103:

  return v18;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  double bsLatitude;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double bsLongitude;
  double v11;
  long double v12;
  double v13;
  __int16 v14;
  unint64_t v15;
  double sectorLatitude;
  double v17;
  long double v18;
  double v19;
  unint64_t v20;
  double sectorLongitude;
  double v22;
  long double v23;
  double v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  NSUInteger v35;
  uint64_t v36;
  uint64_t v37;
  NSUInteger v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  NSUInteger v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t bsid;
  uint64_t nid;
  uint64_t sid;
  uint64_t mnc;
  uint64_t mcc;

  mnc = self->_mnc;
  mcc = self->_mcc;
  nid = self->_nid;
  sid = self->_sid;
  bsid = self->_bsid;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    bsLatitude = self->_bsLatitude;
    v6 = -bsLatitude;
    if (bsLatitude >= 0.0)
      v6 = self->_bsLatitude;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 2) != 0)
  {
    bsLongitude = self->_bsLongitude;
    v11 = -bsLongitude;
    if (bsLongitude >= 0.0)
      v11 = self->_bsLongitude;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v48 = v9;
  v49 = v4;
  if ((has & 0x4000) != 0)
    v47 = 2654435761 * self->_zoneid;
  else
    v47 = 0;
  v46 = -[NSString hash](self->_sectorid, "hash");
  v14 = (__int16)self->_has;
  if ((v14 & 4) != 0)
  {
    sectorLatitude = self->_sectorLatitude;
    v17 = -sectorLatitude;
    if (sectorLatitude >= 0.0)
      v17 = self->_sectorLatitude;
    v18 = floor(v17 + 0.5);
    v19 = (v17 - v18) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  if ((v14 & 8) != 0)
  {
    sectorLongitude = self->_sectorLongitude;
    v22 = -sectorLongitude;
    if (sectorLongitude >= 0.0)
      v22 = self->_sectorLongitude;
    v23 = floor(v22 + 0.5);
    v24 = (v22 - v23) * 1.84467441e19;
    v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0)
        v20 += (unint64_t)v24;
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    v20 = 0;
  }
  if ((v14 & 0x10) != 0)
  {
    v44 = 2654435761 * self->_bandclass;
    if ((v14 & 0x800) != 0)
    {
LABEL_38:
      v43 = 2654435761 * self->_rat;
      if ((v14 & 0x20) != 0)
        goto LABEL_39;
LABEL_43:
      v42 = 0;
      if ((v14 & 0x400) != 0)
        goto LABEL_40;
      goto LABEL_44;
    }
  }
  else
  {
    v44 = 0;
    if ((v14 & 0x800) != 0)
      goto LABEL_38;
  }
  v43 = 0;
  if ((v14 & 0x20) == 0)
    goto LABEL_43;
LABEL_39:
  v42 = 2654435761 * self->_celltype;
  if ((v14 & 0x400) != 0)
  {
LABEL_40:
    v41 = 2654435761 * self->_pnoffset;
    goto LABEL_45;
  }
LABEL_44:
  v41 = 0;
LABEL_45:
  v45 = v20;
  if ((v14 & 0x40) != 0)
    v40 = 2654435761 * self->_channel;
  else
    v40 = 0;
  v39 = -[CLPLocation hash](self->_location, "hash");
  v38 = -[NSString hash](self->_appBundleId, "hash");
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
    v37 = 2654435761 * self->_serverHash;
  else
    v37 = 0;
  v35 = -[NSString hash](self->_operatorName, "hash");
  v25 = (__int16)self->_has;
  if ((v25 & 0x200) != 0)
  {
    v26 = 2654435761 * self->_ltmOffset;
    if ((v25 & 0x80) != 0)
      goto LABEL_53;
  }
  else
  {
    v26 = 0;
    if ((v25 & 0x80) != 0)
    {
LABEL_53:
      v27 = 2654435761 * self->_dayLightSavings;
      goto LABEL_56;
    }
  }
  v27 = 0;
LABEL_56:
  v28 = PBRepeatedInt32Hash();
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v29 = 2654435761 * self->_ecn0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_58;
  }
  else
  {
    v29 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
LABEL_58:
      v30 = 2654435761 * self->_rscp;
      goto LABEL_61;
    }
  }
  v30 = 0;
LABEL_61:
  v31 = -[NSMutableArray hash](self->_neighbors, "hash", v35);
  v32 = -[CLPCellNeighborsGroup hash](self->_neighborGroup, "hash");
  if ((*(_WORD *)&self->_has & 0x80000000) != 0)
    v33 = 2654435761 * self->_isLimitedService;
  else
    v33 = 0;
  return (2654435761 * mnc) ^ (2654435761 * mcc) ^ (2654435761 * sid) ^ (2654435761 * nid) ^ (2654435761 * bsid) ^ v49 ^ v48 ^ v47 ^ v46 ^ v15 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33 ^ -[NSString hash](self->_serviceProviderName, "hash");
}

- (void)mergeFrom:(id)a3
{
  __int16 *v4;
  __int16 *v5;
  __int16 v6;
  __int16 v7;
  CLPLocation *location;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int16 v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  CLPCellNeighborsGroup *neighborGroup;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (__int16 *)a3;
  v5 = v4;
  self->_mcc = *((_DWORD *)v4 + 27);
  self->_mnc = *((_DWORD *)v4 + 28);
  self->_sid = *((_DWORD *)v4 + 48);
  self->_nid = *((_DWORD *)v4 + 34);
  self->_bsid = *((_DWORD *)v4 + 19);
  v6 = v4[102];
  if ((v6 & 1) != 0)
  {
    self->_bsLatitude = *((double *)v4 + 4);
    *(_WORD *)&self->_has |= 1u;
    v6 = v4[102];
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 0x4000) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_bsLongitude = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 2u;
  if ((v4[102] & 0x4000) != 0)
  {
LABEL_4:
    self->_zoneid = *((_DWORD *)v4 + 49);
    *(_WORD *)&self->_has |= 0x4000u;
  }
LABEL_5:
  if (*((_QWORD *)v4 + 21))
    -[CLPCdmaCellTowerLocation setSectorid:](self, "setSectorid:");
  v7 = v5[102];
  if ((v7 & 4) != 0)
  {
    self->_sectorLatitude = *((double *)v5 + 6);
    *(_WORD *)&self->_has |= 4u;
    v7 = v5[102];
    if ((v7 & 8) == 0)
    {
LABEL_9:
      if ((v7 & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_23;
    }
  }
  else if ((v7 & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_sectorLongitude = *((double *)v5 + 7);
  *(_WORD *)&self->_has |= 8u;
  v7 = v5[102];
  if ((v7 & 0x10) == 0)
  {
LABEL_10:
    if ((v7 & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  self->_bandclass = *((_DWORD *)v5 + 18);
  *(_WORD *)&self->_has |= 0x10u;
  v7 = v5[102];
  if ((v7 & 0x800) == 0)
  {
LABEL_11:
    if ((v7 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  self->_rat = *((_DWORD *)v5 + 39);
  *(_WORD *)&self->_has |= 0x800u;
  v7 = v5[102];
  if ((v7 & 0x20) == 0)
  {
LABEL_12:
    if ((v7 & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_26;
  }
LABEL_25:
  self->_celltype = *((_DWORD *)v5 + 20);
  *(_WORD *)&self->_has |= 0x20u;
  v7 = v5[102];
  if ((v7 & 0x400) == 0)
  {
LABEL_13:
    if ((v7 & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_26:
  self->_pnoffset = *((_DWORD *)v5 + 38);
  *(_WORD *)&self->_has |= 0x400u;
  if ((v5[102] & 0x40) != 0)
  {
LABEL_14:
    self->_channel = *((_DWORD *)v5 + 21);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_15:
  location = self->_location;
  v9 = *((_QWORD *)v5 + 12);
  if (location)
  {
    if (v9)
      -[CLPLocation mergeFrom:](location, "mergeFrom:");
  }
  else if (v9)
  {
    -[CLPCdmaCellTowerLocation setLocation:](self, "setLocation:");
  }
  if (*((_QWORD *)v5 + 8))
    -[CLPCdmaCellTowerLocation setAppBundleId:](self, "setAppBundleId:");
  if ((v5[102] & 0x2000) != 0)
  {
    self->_serverHash = *((_DWORD *)v5 + 44);
    *(_WORD *)&self->_has |= 0x2000u;
  }
  if (*((_QWORD *)v5 + 18))
    -[CLPCdmaCellTowerLocation setOperatorName:](self, "setOperatorName:");
  v10 = v5[102];
  if ((v10 & 0x200) != 0)
  {
    self->_ltmOffset = *((_DWORD *)v5 + 26);
    *(_WORD *)&self->_has |= 0x200u;
    v10 = v5[102];
  }
  if ((v10 & 0x80) != 0)
  {
    self->_dayLightSavings = *((_DWORD *)v5 + 22);
    *(_WORD *)&self->_has |= 0x80u;
  }
  v11 = objc_msgSend(v5, "derivedMccsCount");
  if (v11)
  {
    v12 = v11;
    for (i = 0; i != v12; ++i)
      -[CLPCdmaCellTowerLocation addDerivedMcc:](self, "addDerivedMcc:", objc_msgSend(v5, "derivedMccAtIndex:", i));
  }
  v14 = v5[102];
  if ((v14 & 0x100) != 0)
  {
    self->_ecn0 = *((_DWORD *)v5 + 23);
    *(_WORD *)&self->_has |= 0x100u;
    v14 = v5[102];
  }
  if ((v14 & 0x1000) != 0)
  {
    self->_rscp = *((_DWORD *)v5 + 40);
    *(_WORD *)&self->_has |= 0x1000u;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = *((id *)v5 + 16);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        -[CLPCdmaCellTowerLocation addNeighbor:](self, "addNeighbor:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j), (_QWORD)v22);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v17);
  }

  neighborGroup = self->_neighborGroup;
  v21 = *((_QWORD *)v5 + 15);
  if (neighborGroup)
  {
    if (v21)
      -[CLPCellNeighborsGroup mergeFrom:](neighborGroup, "mergeFrom:");
  }
  else if (v21)
  {
    -[CLPCdmaCellTowerLocation setNeighborGroup:](self, "setNeighborGroup:");
  }
  if (v5[102] < 0)
  {
    self->_isLimitedService = *((_BYTE *)v5 + 200);
    *(_WORD *)&self->_has |= 0x8000u;
  }
  if (*((_QWORD *)v5 + 23))
    -[CLPCdmaCellTowerLocation setServiceProviderName:](self, "setServiceProviderName:");

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

- (int)sid
{
  return self->_sid;
}

- (void)setSid:(int)a3
{
  self->_sid = a3;
}

- (int)nid
{
  return self->_nid;
}

- (void)setNid:(int)a3
{
  self->_nid = a3;
}

- (int)bsid
{
  return self->_bsid;
}

- (void)setBsid:(int)a3
{
  self->_bsid = a3;
}

- (double)bsLatitude
{
  return self->_bsLatitude;
}

- (double)bsLongitude
{
  return self->_bsLongitude;
}

- (int)zoneid
{
  return self->_zoneid;
}

- (NSString)sectorid
{
  return self->_sectorid;
}

- (void)setSectorid:(id)a3
{
  objc_storeStrong((id *)&self->_sectorid, a3);
}

- (double)sectorLatitude
{
  return self->_sectorLatitude;
}

- (double)sectorLongitude
{
  return self->_sectorLongitude;
}

- (int)bandclass
{
  return self->_bandclass;
}

- (int)rat
{
  return self->_rat;
}

- (int)celltype
{
  return self->_celltype;
}

- (int)pnoffset
{
  return self->_pnoffset;
}

- (int)channel
{
  return self->_channel;
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

- (NSString)operatorName
{
  return self->_operatorName;
}

- (void)setOperatorName:(id)a3
{
  objc_storeStrong((id *)&self->_operatorName, a3);
}

- (int)ltmOffset
{
  return self->_ltmOffset;
}

- (int)dayLightSavings
{
  return self->_dayLightSavings;
}

- (int)ecn0
{
  return self->_ecn0;
}

- (int)rscp
{
  return self->_rscp;
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
  objc_storeStrong((id *)&self->_sectorid, 0);
  objc_storeStrong((id *)&self->_operatorName, 0);
  objc_storeStrong((id *)&self->_neighbors, 0);
  objc_storeStrong((id *)&self->_neighborGroup, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPCdmaCellTowerLocation writeTo:]", "CLPCollectionRequest.gen.m", 4391, "self->_location != nil");
}

@end
