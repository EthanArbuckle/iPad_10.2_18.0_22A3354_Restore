@implementation CLPLteCellTowerLocation

- (void)setUarfcn:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_uarfcn = a3;
}

- (void)setHasUarfcn:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasUarfcn
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setPid:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_pid = a3;
}

- (void)setHasPid:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasPid
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setBandInfo:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_bandInfo = a3;
}

- (void)setHasBandInfo:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasBandInfo
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

- (BOOL)hasOperatorName
{
  return self->_operatorName != 0;
}

- (void)setCellLatitude:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_cellLatitude = a3;
}

- (void)setHasCellLatitude:(BOOL)a3
{
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasCellLatitude
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setCellLongitude:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_cellLongitude = a3;
}

- (void)setHasCellLongitude:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCellLongitude
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setServerHash:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_serverHash = a3;
}

- (void)setHasServerHash:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasServerHash
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setEcn0:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_ecn0 = a3;
}

- (void)setHasEcn0:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasEcn0
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setRscp:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_rscp = a3;
}

- (void)setHasRscp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasRscp
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setRssi:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_rssi = a3;
}

- (void)setHasRssi:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasRssi
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
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

- (void)setBandwidth:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_bandwidth = a3;
}

- (void)setHasBandwidth:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasBandwidth
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIsLimitedService:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_isLimitedService = a3;
}

- (void)setHasIsLimitedService:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasIsLimitedService
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (BOOL)hasServiceProviderName
{
  return self->_serviceProviderName != 0;
}

- (void)setDeploymentType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_deploymentType = a3;
}

- (void)setHasDeploymentType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasDeploymentType
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setDownlinkBandwidth:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_downlinkBandwidth = a3;
}

- (void)setHasDownlinkBandwidth:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasDownlinkBandwidth
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setIsStalled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_isStalled = a3;
}

- (void)setHasIsStalled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasIsStalled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setLatency:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_latency = a3;
}

- (void)setHasLatency:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasLatency
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setPmax:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_pmax = a3;
}

- (void)setHasPmax:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasPmax
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setMaxThroughput:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_maxThroughput = a3;
}

- (void)setHasMaxThroughput:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasMaxThroughput
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setCsgIndication:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_csgIndication = a3;
}

- (void)setHasCsgIndication:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasCsgIndication
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setCsgId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_csgId = a3;
}

- (void)setHasCsgId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasCsgId
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTimingAdvance:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_timingAdvance = a3;
}

- (void)setHasTimingAdvance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTimingAdvance
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setUniqueCount:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_uniqueCount = a3;
}

- (void)setHasUniqueCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasUniqueCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasWifiFallback:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_hasWifiFallback = a3;
}

- (void)setHasHasWifiFallback:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasHasWifiFallback
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasNpnNwIdEf
{
  return self->_npnNwIdEf != 0;
}

- (BOOL)hasNpnCsgIdEf
{
  return self->_npnCsgIdEf != 0;
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
  v8.super_class = (Class)CLPLteCellTowerLocation;
  -[CLPLteCellTowerLocation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPLteCellTowerLocation dictionaryRepresentation](self, "dictionaryRepresentation");
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
  $518A04349E53DCBCEC9F539BAEE36789 has;
  void *v9;
  CLPLocation *location;
  void *v11;
  NSString *appBundleId;
  NSString *operatorName;
  $518A04349E53DCBCEC9F539BAEE36789 v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  CLPCellNeighborsGroup *neighborGroup;
  void *v24;
  $518A04349E53DCBCEC9F539BAEE36789 v25;
  void *v26;
  void *v27;
  NSString *serviceProviderName;
  $518A04349E53DCBCEC9F539BAEE36789 v29;
  void *v30;
  NSString *npnNwIdEf;
  NSString *npnCsgIdEf;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_mcc);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("mcc"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_mnc);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("mnc"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_tac);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("tac"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_ci);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("ci"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_uarfcn);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("uarfcn"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_pid);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("pid"));

  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_bandInfo);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("bandInfo"));

  }
LABEL_5:
  location = self->_location;
  if (location)
  {
    -[CLPLocation dictionaryRepresentation](location, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("location"));

  }
  appBundleId = self->_appBundleId;
  if (appBundleId)
    objc_msgSend(v3, "setObject:forKey:", appBundleId, CFSTR("appBundleId"));
  operatorName = self->_operatorName;
  if (operatorName)
    objc_msgSend(v3, "setObject:forKey:", operatorName, CFSTR("operatorName"));
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_cellLatitude);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("cellLatitude"));

    v14 = self->_has;
    if ((*(_BYTE *)&v14 & 2) == 0)
    {
LABEL_13:
      if ((*(_WORD *)&v14 & 0x8000) == 0)
        goto LABEL_14;
      goto LABEL_57;
    }
  }
  else if ((*(_BYTE *)&v14 & 2) == 0)
  {
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_cellLongitude);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("cellLongitude"));

  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v14 & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_serverHash);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("serverHash"));

  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v14 & 0x2000) == 0)
      goto LABEL_16;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_ecn0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("ecn0"));

  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v14 & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_59:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_rscp);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("rscp"));

  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_rssi);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("rssi"));

  }
LABEL_18:
  if (-[NSMutableArray count](self->_neighbors, "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_neighbors, "count"));
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v17 = self->_neighbors;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v52 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v51);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      }
      while (v19);
    }

    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("neighbor"));
  }
  neighborGroup = self->_neighborGroup;
  if (neighborGroup)
  {
    -[CLPCellNeighborsGroup dictionaryRepresentation](neighborGroup, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("neighborGroup"));

  }
  v25 = self->_has;
  if ((*(_BYTE *)&v25 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_bandwidth);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("bandwidth"));

    v25 = self->_has;
  }
  if ((*(_DWORD *)&v25 & 0x80000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLimitedService);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("isLimitedService"));

  }
  serviceProviderName = self->_serviceProviderName;
  if (serviceProviderName)
    objc_msgSend(v3, "setObject:forKey:", serviceProviderName, CFSTR("serviceProviderName"));
  v29 = self->_has;
  if ((*(_BYTE *)&v29 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_deploymentType);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("deploymentType"));

    v29 = self->_has;
    if ((*(_BYTE *)&v29 & 0x80) == 0)
    {
LABEL_37:
      if ((*(_DWORD *)&v29 & 0x100000) == 0)
        goto LABEL_38;
      goto LABEL_63;
    }
  }
  else if ((*(_BYTE *)&v29 & 0x80) == 0)
  {
    goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_downlinkBandwidth, (_QWORD)v51);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("downlinkBandwidth"));

  v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x100000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v29 & 0x200) == 0)
      goto LABEL_39;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isStalled, (_QWORD)v51);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("isStalled"));

  v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x200) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v29 & 0x1000) == 0)
      goto LABEL_40;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_latency, (_QWORD)v51);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("latency"));

  v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x1000) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&v29 & 0x400) == 0)
      goto LABEL_41;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_pmax, (_QWORD)v51);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("pmax"));

  v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x400) == 0)
  {
LABEL_41:
    if ((*(_BYTE *)&v29 & 0x20) == 0)
      goto LABEL_42;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_maxThroughput, (_QWORD)v51);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("maxThroughput"));

  v29 = self->_has;
  if ((*(_BYTE *)&v29 & 0x20) == 0)
  {
LABEL_42:
    if ((*(_BYTE *)&v29 & 0x10) == 0)
      goto LABEL_43;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_csgIndication, (_QWORD)v51);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("csgIndication"));

  v29 = self->_has;
  if ((*(_BYTE *)&v29 & 0x10) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v29 & 0x10000) == 0)
      goto LABEL_44;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_csgId, (_QWORD)v51);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("csgId"));

  v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x10000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v29 & 0x200000) == 0)
      goto LABEL_45;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_timingAdvance, (_QWORD)v51);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("timingAdvance"));

  v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x200000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v29 & 0x40000) == 0)
      goto LABEL_47;
    goto LABEL_46;
  }
LABEL_70:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_uniqueCount, (_QWORD)v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("uniqueCount"));

  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_46:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasWifiFallback, (_QWORD)v51);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("hasWifiFallback"));

  }
LABEL_47:
  npnNwIdEf = self->_npnNwIdEf;
  if (npnNwIdEf)
    objc_msgSend(v3, "setObject:forKey:", npnNwIdEf, CFSTR("npnNwIdEf"));
  npnCsgIdEf = self->_npnCsgIdEf;
  if (npnCsgIdEf)
    objc_msgSend(v3, "setObject:forKey:", npnCsgIdEf, CFSTR("npnCsgIdEf"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLteCellTowerLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $518A04349E53DCBCEC9F539BAEE36789 has;
  $518A04349E53DCBCEC9F539BAEE36789 v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  $518A04349E53DCBCEC9F539BAEE36789 v12;
  $518A04349E53DCBCEC9F539BAEE36789 v13;
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
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 4) != 0)
LABEL_4:
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (!self->_location)
    -[CLPLteCellTowerLocation writeTo:].cold.1();
  PBDataWriterWriteSubmessage();
  if (self->_appBundleId)
    PBDataWriterWriteStringField();
  if (self->_operatorName)
    PBDataWriterWriteStringField();
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v6 = self->_has;
    if ((*(_BYTE *)&v6 & 2) == 0)
    {
LABEL_12:
      if ((*(_WORD *)&v6 & 0x8000) == 0)
        goto LABEL_13;
      goto LABEL_54;
    }
  }
  else if ((*(_BYTE *)&v6 & 2) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteDoubleField();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v6 & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteInt32Field();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v6 & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteSint32Field();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_56:
  PBDataWriterWriteSint32Field();
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
LABEL_16:
    PBDataWriterWriteSint32Field();
LABEL_17:
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_neighbors;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  if (self->_neighborGroup)
    PBDataWriterWriteSubmessage();
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v12 = self->_has;
  }
  if ((*(_DWORD *)&v12 & 0x80000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_serviceProviderName)
    PBDataWriterWriteStringField();
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    v13 = self->_has;
    if ((*(_BYTE *)&v13 & 0x80) == 0)
    {
LABEL_34:
      if ((*(_DWORD *)&v13 & 0x100000) == 0)
        goto LABEL_35;
      goto LABEL_60;
    }
  }
  else if ((*(_BYTE *)&v13 & 0x80) == 0)
  {
    goto LABEL_34;
  }
  PBDataWriterWriteUint32Field();
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x100000) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v13 & 0x200) == 0)
      goto LABEL_36;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteBOOLField();
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x200) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&v13 & 0x1000) == 0)
      goto LABEL_37;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint32Field();
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x1000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v13 & 0x400) == 0)
      goto LABEL_38;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint32Field();
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x400) == 0)
  {
LABEL_38:
    if ((*(_BYTE *)&v13 & 0x20) == 0)
      goto LABEL_39;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint32Field();
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x20) == 0)
  {
LABEL_39:
    if ((*(_BYTE *)&v13 & 0x10) == 0)
      goto LABEL_40;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint32Field();
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x10) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v13 & 0x10000) == 0)
      goto LABEL_41;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint32Field();
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x10000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v13 & 0x200000) == 0)
      goto LABEL_42;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteInt32Field();
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x200000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v13 & 0x40000) == 0)
      goto LABEL_44;
    goto LABEL_43;
  }
LABEL_67:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
LABEL_43:
    PBDataWriterWriteBOOLField();
LABEL_44:
  if (self->_npnNwIdEf)
    PBDataWriterWriteStringField();
  if (self->_npnCsgIdEf)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  $518A04349E53DCBCEC9F539BAEE36789 has;
  $518A04349E53DCBCEC9F539BAEE36789 v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  $518A04349E53DCBCEC9F539BAEE36789 v11;
  _DWORD *v12;
  $518A04349E53DCBCEC9F539BAEE36789 v13;
  id v14;

  v4 = a3;
  v4[21] = self->_mcc;
  v4[22] = self->_mnc;
  v4[42] = self->_tac;
  v4[10] = self->_ci;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    v4[44] = self->_uarfcn;
    v4[46] |= 0x20000u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  v4[34] = self->_pid;
  v4[46] |= 0x800u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[8] = self->_bandInfo;
    v4[46] |= 4u;
  }
LABEL_5:
  v14 = v4;
  objc_msgSend(v4, "setLocation:", self->_location);
  if (self->_appBundleId)
    objc_msgSend(v14, "setAppBundleId:");
  if (self->_operatorName)
    objc_msgSend(v14, "setOperatorName:");
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 1) != 0)
  {
    *((_QWORD *)v14 + 1) = *(_QWORD *)&self->_cellLatitude;
    *((_DWORD *)v14 + 46) |= 1u;
    v6 = self->_has;
    if ((*(_BYTE *)&v6 & 2) == 0)
    {
LABEL_11:
      if ((*(_WORD *)&v6 & 0x8000) == 0)
        goto LABEL_12;
      goto LABEL_50;
    }
  }
  else if ((*(_BYTE *)&v6 & 2) == 0)
  {
    goto LABEL_11;
  }
  *((_QWORD *)v14 + 2) = *(_QWORD *)&self->_cellLongitude;
  *((_DWORD *)v14 + 46) |= 2u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v6 & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v14 + 38) = self->_serverHash;
  *((_DWORD *)v14 + 46) |= 0x8000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v6 & 0x2000) == 0)
      goto LABEL_14;
LABEL_52:
    *((_DWORD *)v14 + 36) = self->_rscp;
    *((_DWORD *)v14 + 46) |= 0x2000u;
    if ((*(_DWORD *)&self->_has & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_51:
  *((_DWORD *)v14 + 15) = self->_ecn0;
  *((_DWORD *)v14 + 46) |= 0x100u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) != 0)
    goto LABEL_52;
LABEL_14:
  if ((*(_WORD *)&v6 & 0x4000) != 0)
  {
LABEL_15:
    *((_DWORD *)v14 + 37) = self->_rssi;
    *((_DWORD *)v14 + 46) |= 0x4000u;
  }
LABEL_16:
  if (-[CLPLteCellTowerLocation neighborsCount](self, "neighborsCount"))
  {
    objc_msgSend(v14, "clearNeighbors");
    v7 = -[CLPLteCellTowerLocation neighborsCount](self, "neighborsCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        -[CLPLteCellTowerLocation neighborAtIndex:](self, "neighborAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addNeighbor:", v10);

      }
    }
  }
  if (self->_neighborGroup)
    objc_msgSend(v14, "setNeighborGroup:");
  v11 = self->_has;
  v12 = v14;
  if ((*(_BYTE *)&v11 & 8) != 0)
  {
    *((_DWORD *)v14 + 9) = self->_bandwidth;
    *((_DWORD *)v14 + 46) |= 8u;
    v11 = self->_has;
  }
  if ((*(_DWORD *)&v11 & 0x80000) != 0)
  {
    *((_BYTE *)v14 + 181) = self->_isLimitedService;
    *((_DWORD *)v14 + 46) |= 0x80000u;
  }
  if (self->_serviceProviderName)
  {
    objc_msgSend(v14, "setServiceProviderName:");
    v12 = v14;
  }
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x40) != 0)
  {
    v12[13] = self->_deploymentType;
    v12[46] |= 0x40u;
    v13 = self->_has;
    if ((*(_BYTE *)&v13 & 0x80) == 0)
    {
LABEL_30:
      if ((*(_DWORD *)&v13 & 0x100000) == 0)
        goto LABEL_31;
      goto LABEL_56;
    }
  }
  else if ((*(_BYTE *)&v13 & 0x80) == 0)
  {
    goto LABEL_30;
  }
  v12[14] = self->_downlinkBandwidth;
  v12[46] |= 0x80u;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x100000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v13 & 0x200) == 0)
      goto LABEL_32;
    goto LABEL_57;
  }
LABEL_56:
  *((_BYTE *)v12 + 182) = self->_isStalled;
  v12[46] |= 0x100000u;
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x200) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v13 & 0x1000) == 0)
      goto LABEL_33;
    goto LABEL_58;
  }
LABEL_57:
  v12[16] = self->_latency;
  v12[46] |= 0x200u;
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x1000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v13 & 0x400) == 0)
      goto LABEL_34;
    goto LABEL_59;
  }
LABEL_58:
  v12[35] = self->_pmax;
  v12[46] |= 0x1000u;
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x400) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&v13 & 0x20) == 0)
      goto LABEL_35;
    goto LABEL_60;
  }
LABEL_59:
  v12[20] = self->_maxThroughput;
  v12[46] |= 0x400u;
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x20) == 0)
  {
LABEL_35:
    if ((*(_BYTE *)&v13 & 0x10) == 0)
      goto LABEL_36;
    goto LABEL_61;
  }
LABEL_60:
  v12[12] = self->_csgIndication;
  v12[46] |= 0x20u;
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x10) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v13 & 0x10000) == 0)
      goto LABEL_37;
    goto LABEL_62;
  }
LABEL_61:
  v12[11] = self->_csgId;
  v12[46] |= 0x10u;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x10000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v13 & 0x200000) == 0)
      goto LABEL_38;
    goto LABEL_63;
  }
LABEL_62:
  v12[43] = self->_timingAdvance;
  v12[46] |= 0x10000u;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x200000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v13 & 0x40000) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_63:
  *((_BYTE *)v12 + 183) = self->_uniqueCount;
  v12[46] |= 0x200000u;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_39:
    *((_BYTE *)v12 + 180) = self->_hasWifiFallback;
    v12[46] |= 0x40000u;
  }
LABEL_40:
  if (self->_npnNwIdEf)
  {
    objc_msgSend(v14, "setNpnNwIdEf:");
    v12 = v14;
  }
  if (self->_npnCsgIdEf)
  {
    objc_msgSend(v14, "setNpnCsgIdEf:");
    v12 = v14;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  _DWORD *v6;
  $518A04349E53DCBCEC9F539BAEE36789 has;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  $518A04349E53DCBCEC9F539BAEE36789 v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  $518A04349E53DCBCEC9F539BAEE36789 v23;
  uint64_t v24;
  void *v25;
  $518A04349E53DCBCEC9F539BAEE36789 v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = (_DWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  v5[21] = self->_mcc;
  v5[22] = self->_mnc;
  v5[42] = self->_tac;
  v5[10] = self->_ci;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    v5[44] = self->_uarfcn;
    v5[46] |= 0x20000u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  v5[34] = self->_pid;
  v5[46] |= 0x800u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5[8] = self->_bandInfo;
    v5[46] |= 4u;
  }
LABEL_5:
  v8 = -[CLPLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v6 + 9);
  *((_QWORD *)v6 + 9) = v8;

  v10 = -[NSString copyWithZone:](self->_appBundleId, "copyWithZone:", a3);
  v11 = (void *)*((_QWORD *)v6 + 3);
  *((_QWORD *)v6 + 3) = v10;

  v12 = -[NSString copyWithZone:](self->_operatorName, "copyWithZone:", a3);
  v13 = (void *)*((_QWORD *)v6 + 16);
  *((_QWORD *)v6 + 16) = v12;

  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 1) != 0)
  {
    *((_QWORD *)v6 + 1) = *(_QWORD *)&self->_cellLatitude;
    v6[46] |= 1u;
    v14 = self->_has;
    if ((*(_BYTE *)&v14 & 2) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&v14 & 0x8000) == 0)
        goto LABEL_8;
      goto LABEL_41;
    }
  }
  else if ((*(_BYTE *)&v14 & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_QWORD *)v6 + 2) = *(_QWORD *)&self->_cellLongitude;
  v6[46] |= 2u;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x8000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&v14 & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_42;
  }
LABEL_41:
  v6[38] = self->_serverHash;
  v6[46] |= 0x8000u;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x100) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&v14 & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_43;
  }
LABEL_42:
  v6[15] = self->_ecn0;
  v6[46] |= 0x100u;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&v14 & 0x4000) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_43:
  v6[36] = self->_rscp;
  v6[46] |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_11:
    v6[37] = self->_rssi;
    v6[46] |= 0x4000u;
  }
LABEL_12:
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v15 = self->_neighbors;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v33;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v33 != v18)
          objc_enumerationMutation(v15);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v19), "copyWithZone:", a3, (_QWORD)v32);
        objc_msgSend(v6, "addNeighbor:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v17);
  }

  v21 = -[CLPCellNeighborsGroup copyWithZone:](self->_neighborGroup, "copyWithZone:", a3);
  v22 = (void *)*((_QWORD *)v6 + 12);
  *((_QWORD *)v6 + 12) = v21;

  v23 = self->_has;
  if ((*(_BYTE *)&v23 & 8) != 0)
  {
    v6[9] = self->_bandwidth;
    v6[46] |= 8u;
    v23 = self->_has;
  }
  if ((*(_DWORD *)&v23 & 0x80000) != 0)
  {
    *((_BYTE *)v6 + 181) = self->_isLimitedService;
    v6[46] |= 0x80000u;
  }
  v24 = -[NSString copyWithZone:](self->_serviceProviderName, "copyWithZone:", a3, (_QWORD)v32);
  v25 = (void *)*((_QWORD *)v6 + 20);
  *((_QWORD *)v6 + 20) = v24;

  v26 = self->_has;
  if ((*(_BYTE *)&v26 & 0x40) != 0)
  {
    v6[13] = self->_deploymentType;
    v6[46] |= 0x40u;
    v26 = self->_has;
    if ((*(_BYTE *)&v26 & 0x80) == 0)
    {
LABEL_25:
      if ((*(_DWORD *)&v26 & 0x100000) == 0)
        goto LABEL_26;
      goto LABEL_47;
    }
  }
  else if ((*(_BYTE *)&v26 & 0x80) == 0)
  {
    goto LABEL_25;
  }
  v6[14] = self->_downlinkBandwidth;
  v6[46] |= 0x80u;
  v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x100000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v26 & 0x200) == 0)
      goto LABEL_27;
    goto LABEL_48;
  }
LABEL_47:
  *((_BYTE *)v6 + 182) = self->_isStalled;
  v6[46] |= 0x100000u;
  v26 = self->_has;
  if ((*(_WORD *)&v26 & 0x200) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v26 & 0x1000) == 0)
      goto LABEL_28;
    goto LABEL_49;
  }
LABEL_48:
  v6[16] = self->_latency;
  v6[46] |= 0x200u;
  v26 = self->_has;
  if ((*(_WORD *)&v26 & 0x1000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v26 & 0x400) == 0)
      goto LABEL_29;
    goto LABEL_50;
  }
LABEL_49:
  v6[35] = self->_pmax;
  v6[46] |= 0x1000u;
  v26 = self->_has;
  if ((*(_WORD *)&v26 & 0x400) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&v26 & 0x20) == 0)
      goto LABEL_30;
    goto LABEL_51;
  }
LABEL_50:
  v6[20] = self->_maxThroughput;
  v6[46] |= 0x400u;
  v26 = self->_has;
  if ((*(_BYTE *)&v26 & 0x20) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&v26 & 0x10) == 0)
      goto LABEL_31;
    goto LABEL_52;
  }
LABEL_51:
  v6[12] = self->_csgIndication;
  v6[46] |= 0x20u;
  v26 = self->_has;
  if ((*(_BYTE *)&v26 & 0x10) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v26 & 0x10000) == 0)
      goto LABEL_32;
    goto LABEL_53;
  }
LABEL_52:
  v6[11] = self->_csgId;
  v6[46] |= 0x10u;
  v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x10000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v26 & 0x200000) == 0)
      goto LABEL_33;
LABEL_54:
    *((_BYTE *)v6 + 183) = self->_uniqueCount;
    v6[46] |= 0x200000u;
    if ((*(_DWORD *)&self->_has & 0x40000) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_53:
  v6[43] = self->_timingAdvance;
  v6[46] |= 0x10000u;
  v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x200000) != 0)
    goto LABEL_54;
LABEL_33:
  if ((*(_DWORD *)&v26 & 0x40000) != 0)
  {
LABEL_34:
    *((_BYTE *)v6 + 180) = self->_hasWifiFallback;
    v6[46] |= 0x40000u;
  }
LABEL_35:
  v27 = -[NSString copyWithZone:](self->_npnNwIdEf, "copyWithZone:", a3);
  v28 = (void *)*((_QWORD *)v6 + 15);
  *((_QWORD *)v6 + 15) = v27;

  v29 = -[NSString copyWithZone:](self->_npnCsgIdEf, "copyWithZone:", a3);
  v30 = (void *)*((_QWORD *)v6 + 14);
  *((_QWORD *)v6 + 14) = v29;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $518A04349E53DCBCEC9F539BAEE36789 has;
  int v6;
  CLPLocation *location;
  NSString *appBundleId;
  NSString *operatorName;
  $518A04349E53DCBCEC9F539BAEE36789 v10;
  int v11;
  NSMutableArray *neighbors;
  CLPCellNeighborsGroup *neighborGroup;
  $518A04349E53DCBCEC9F539BAEE36789 v14;
  int v15;
  NSString *serviceProviderName;
  int v17;
  NSString *npnNwIdEf;
  NSString *npnCsgIdEf;
  char v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    || self->_mcc != *((_DWORD *)v4 + 21)
    || self->_mnc != *((_DWORD *)v4 + 22)
    || self->_tac != *((_DWORD *)v4 + 42)
    || self->_ci != *((_DWORD *)v4 + 10))
  {
    goto LABEL_145;
  }
  has = self->_has;
  v6 = *((_DWORD *)v4 + 46);
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_uarfcn != *((_DWORD *)v4 + 44))
      goto LABEL_145;
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_pid != *((_DWORD *)v4 + 34))
      goto LABEL_145;
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_bandInfo != *((_DWORD *)v4 + 8))
      goto LABEL_145;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_145;
  }
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 9) && !-[CLPLocation isEqual:](location, "isEqual:"))
    goto LABEL_145;
  appBundleId = self->_appBundleId;
  if ((unint64_t)appBundleId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](appBundleId, "isEqual:"))
      goto LABEL_145;
  }
  operatorName = self->_operatorName;
  if ((unint64_t)operatorName | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](operatorName, "isEqual:"))
      goto LABEL_145;
  }
  v10 = self->_has;
  v11 = *((_DWORD *)v4 + 46);
  if ((*(_BYTE *)&v10 & 1) != 0)
  {
    if ((v11 & 1) == 0 || self->_cellLatitude != *((double *)v4 + 1))
      goto LABEL_145;
  }
  else if ((v11 & 1) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_BYTE *)&v10 & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_cellLongitude != *((double *)v4 + 2))
      goto LABEL_145;
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_WORD *)&v10 & 0x8000) != 0)
  {
    if ((v11 & 0x8000) == 0 || self->_serverHash != *((_DWORD *)v4 + 38))
      goto LABEL_145;
  }
  else if ((v11 & 0x8000) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_WORD *)&v10 & 0x100) != 0)
  {
    if ((v11 & 0x100) == 0 || self->_ecn0 != *((_DWORD *)v4 + 15))
      goto LABEL_145;
  }
  else if ((v11 & 0x100) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_WORD *)&v10 & 0x2000) != 0)
  {
    if ((v11 & 0x2000) == 0 || self->_rscp != *((_DWORD *)v4 + 36))
      goto LABEL_145;
  }
  else if ((v11 & 0x2000) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_WORD *)&v10 & 0x4000) != 0)
  {
    if ((v11 & 0x4000) == 0 || self->_rssi != *((_DWORD *)v4 + 37))
      goto LABEL_145;
  }
  else if ((v11 & 0x4000) != 0)
  {
    goto LABEL_145;
  }
  neighbors = self->_neighbors;
  if ((unint64_t)neighbors | *((_QWORD *)v4 + 13)
    && !-[NSMutableArray isEqual:](neighbors, "isEqual:"))
  {
    goto LABEL_145;
  }
  neighborGroup = self->_neighborGroup;
  if ((unint64_t)neighborGroup | *((_QWORD *)v4 + 12))
  {
    if (!-[CLPCellNeighborsGroup isEqual:](neighborGroup, "isEqual:"))
      goto LABEL_145;
  }
  v14 = self->_has;
  v15 = *((_DWORD *)v4 + 46);
  if ((*(_BYTE *)&v14 & 8) != 0)
  {
    if ((v15 & 8) == 0 || self->_bandwidth != *((_DWORD *)v4 + 9))
      goto LABEL_145;
  }
  else if ((v15 & 8) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_DWORD *)&v14 & 0x80000) != 0)
  {
    if ((v15 & 0x80000) == 0)
      goto LABEL_145;
    if (self->_isLimitedService)
    {
      if (!*((_BYTE *)v4 + 181))
        goto LABEL_145;
    }
    else if (*((_BYTE *)v4 + 181))
    {
      goto LABEL_145;
    }
  }
  else if ((v15 & 0x80000) != 0)
  {
    goto LABEL_145;
  }
  serviceProviderName = self->_serviceProviderName;
  if ((unint64_t)serviceProviderName | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](serviceProviderName, "isEqual:"))
      goto LABEL_145;
    v14 = self->_has;
  }
  v17 = *((_DWORD *)v4 + 46);
  if ((*(_BYTE *)&v14 & 0x40) != 0)
  {
    if ((v17 & 0x40) == 0 || self->_deploymentType != *((_DWORD *)v4 + 13))
      goto LABEL_145;
  }
  else if ((v17 & 0x40) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_BYTE *)&v14 & 0x80) != 0)
  {
    if ((v17 & 0x80) == 0 || self->_downlinkBandwidth != *((_DWORD *)v4 + 14))
      goto LABEL_145;
  }
  else if ((v17 & 0x80) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_DWORD *)&v14 & 0x100000) != 0)
  {
    if ((v17 & 0x100000) == 0)
      goto LABEL_145;
    if (self->_isStalled)
    {
      if (!*((_BYTE *)v4 + 182))
        goto LABEL_145;
    }
    else if (*((_BYTE *)v4 + 182))
    {
      goto LABEL_145;
    }
  }
  else if ((v17 & 0x100000) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
    if ((v17 & 0x200) == 0 || self->_latency != *((_DWORD *)v4 + 16))
      goto LABEL_145;
  }
  else if ((v17 & 0x200) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_WORD *)&v14 & 0x1000) != 0)
  {
    if ((v17 & 0x1000) == 0 || self->_pmax != *((_DWORD *)v4 + 35))
      goto LABEL_145;
  }
  else if ((v17 & 0x1000) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_WORD *)&v14 & 0x400) != 0)
  {
    if ((v17 & 0x400) == 0 || self->_maxThroughput != *((_DWORD *)v4 + 20))
      goto LABEL_145;
  }
  else if ((v17 & 0x400) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_BYTE *)&v14 & 0x20) != 0)
  {
    if ((v17 & 0x20) == 0 || self->_csgIndication != *((_DWORD *)v4 + 12))
      goto LABEL_145;
  }
  else if ((v17 & 0x20) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_BYTE *)&v14 & 0x10) != 0)
  {
    if ((v17 & 0x10) == 0 || self->_csgId != *((_DWORD *)v4 + 11))
      goto LABEL_145;
  }
  else if ((v17 & 0x10) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_DWORD *)&v14 & 0x10000) != 0)
  {
    if ((v17 & 0x10000) == 0 || self->_timingAdvance != *((_DWORD *)v4 + 43))
      goto LABEL_145;
  }
  else if ((v17 & 0x10000) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_DWORD *)&v14 & 0x200000) != 0)
  {
    if ((v17 & 0x200000) == 0)
      goto LABEL_145;
    if (self->_uniqueCount)
    {
      if (!*((_BYTE *)v4 + 183))
        goto LABEL_145;
    }
    else if (*((_BYTE *)v4 + 183))
    {
      goto LABEL_145;
    }
  }
  else if ((v17 & 0x200000) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_DWORD *)&v14 & 0x40000) != 0)
  {
    if ((v17 & 0x40000) != 0)
    {
      if (self->_hasWifiFallback)
      {
        if (!*((_BYTE *)v4 + 180))
          goto LABEL_145;
        goto LABEL_141;
      }
      if (!*((_BYTE *)v4 + 180))
        goto LABEL_141;
    }
LABEL_145:
    v20 = 0;
    goto LABEL_146;
  }
  if ((v17 & 0x40000) != 0)
    goto LABEL_145;
LABEL_141:
  npnNwIdEf = self->_npnNwIdEf;
  if ((unint64_t)npnNwIdEf | *((_QWORD *)v4 + 15) && !-[NSString isEqual:](npnNwIdEf, "isEqual:"))
    goto LABEL_145;
  npnCsgIdEf = self->_npnCsgIdEf;
  if ((unint64_t)npnCsgIdEf | *((_QWORD *)v4 + 14))
    v20 = -[NSString isEqual:](npnCsgIdEf, "isEqual:");
  else
    v20 = 1;
LABEL_146:

  return v20;
}

- (unint64_t)hash
{
  $518A04349E53DCBCEC9F539BAEE36789 has;
  $518A04349E53DCBCEC9F539BAEE36789 v4;
  unint64_t v5;
  double cellLatitude;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  double cellLongitude;
  double v12;
  long double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  $518A04349E53DCBCEC9F539BAEE36789 v18;
  uint64_t v19;
  uint64_t v20;
  NSUInteger v21;
  $518A04349E53DCBCEC9F539BAEE36789 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSUInteger v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSUInteger v40;
  NSUInteger v41;
  uint64_t ci;
  unint64_t v43;
  uint64_t tac;
  uint64_t mnc;
  uint64_t mcc;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
    v49 = 2654435761 * self->_uarfcn;
  else
    v49 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
    v48 = 2654435761 * self->_pid;
  else
    v48 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
    v47 = 2654435761 * self->_bandInfo;
  else
    v47 = 0;
  mcc = self->_mcc;
  tac = self->_tac;
  mnc = self->_mnc;
  ci = self->_ci;
  v43 = -[CLPLocation hash](self->_location, "hash");
  v41 = -[NSString hash](self->_appBundleId, "hash");
  v40 = -[NSString hash](self->_operatorName, "hash");
  v4 = self->_has;
  if ((*(_BYTE *)&v4 & 1) != 0)
  {
    cellLatitude = self->_cellLatitude;
    v7 = -cellLatitude;
    if (cellLatitude >= 0.0)
      v7 = self->_cellLatitude;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((*(_BYTE *)&v4 & 2) != 0)
  {
    cellLongitude = self->_cellLongitude;
    v12 = -cellLongitude;
    if (cellLongitude >= 0.0)
      v12 = self->_cellLongitude;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((*(_WORD *)&v4 & 0x8000) != 0)
  {
    v39 = 2654435761 * self->_serverHash;
    if ((*(_WORD *)&v4 & 0x100) != 0)
    {
LABEL_28:
      v38 = 2654435761 * self->_ecn0;
      if ((*(_WORD *)&v4 & 0x2000) != 0)
        goto LABEL_29;
LABEL_33:
      v37 = 0;
      if ((*(_WORD *)&v4 & 0x4000) != 0)
        goto LABEL_30;
      goto LABEL_34;
    }
  }
  else
  {
    v39 = 0;
    if ((*(_WORD *)&v4 & 0x100) != 0)
      goto LABEL_28;
  }
  v38 = 0;
  if ((*(_WORD *)&v4 & 0x2000) == 0)
    goto LABEL_33;
LABEL_29:
  v37 = 2654435761 * self->_rscp;
  if ((*(_WORD *)&v4 & 0x4000) != 0)
  {
LABEL_30:
    v15 = 2654435761 * self->_rssi;
    goto LABEL_35;
  }
LABEL_34:
  v15 = 0;
LABEL_35:
  v16 = -[NSMutableArray hash](self->_neighbors, "hash");
  v17 = -[CLPCellNeighborsGroup hash](self->_neighborGroup, "hash");
  v18 = self->_has;
  if ((*(_BYTE *)&v18 & 8) != 0)
  {
    v19 = 2654435761 * self->_bandwidth;
    if ((*(_DWORD *)&v18 & 0x80000) != 0)
      goto LABEL_37;
  }
  else
  {
    v19 = 0;
    if ((*(_DWORD *)&v18 & 0x80000) != 0)
    {
LABEL_37:
      v20 = 2654435761 * self->_isLimitedService;
      goto LABEL_40;
    }
  }
  v20 = 0;
LABEL_40:
  v21 = -[NSString hash](self->_serviceProviderName, "hash");
  v22 = self->_has;
  if ((*(_BYTE *)&v22 & 0x40) != 0)
  {
    v23 = 2654435761 * self->_deploymentType;
    if ((*(_BYTE *)&v22 & 0x80) != 0)
    {
LABEL_42:
      v24 = 2654435761 * self->_downlinkBandwidth;
      if ((*(_DWORD *)&v22 & 0x100000) != 0)
        goto LABEL_43;
      goto LABEL_54;
    }
  }
  else
  {
    v23 = 0;
    if ((*(_BYTE *)&v22 & 0x80) != 0)
      goto LABEL_42;
  }
  v24 = 0;
  if ((*(_DWORD *)&v22 & 0x100000) != 0)
  {
LABEL_43:
    v25 = 2654435761 * self->_isStalled;
    if ((*(_WORD *)&v22 & 0x200) != 0)
      goto LABEL_44;
    goto LABEL_55;
  }
LABEL_54:
  v25 = 0;
  if ((*(_WORD *)&v22 & 0x200) != 0)
  {
LABEL_44:
    v26 = 2654435761 * self->_latency;
    if ((*(_WORD *)&v22 & 0x1000) != 0)
      goto LABEL_45;
    goto LABEL_56;
  }
LABEL_55:
  v26 = 0;
  if ((*(_WORD *)&v22 & 0x1000) != 0)
  {
LABEL_45:
    v27 = 2654435761 * self->_pmax;
    if ((*(_WORD *)&v22 & 0x400) != 0)
      goto LABEL_46;
    goto LABEL_57;
  }
LABEL_56:
  v27 = 0;
  if ((*(_WORD *)&v22 & 0x400) != 0)
  {
LABEL_46:
    v28 = 2654435761 * self->_maxThroughput;
    if ((*(_BYTE *)&v22 & 0x20) != 0)
      goto LABEL_47;
    goto LABEL_58;
  }
LABEL_57:
  v28 = 0;
  if ((*(_BYTE *)&v22 & 0x20) != 0)
  {
LABEL_47:
    v29 = 2654435761 * self->_csgIndication;
    if ((*(_BYTE *)&v22 & 0x10) != 0)
      goto LABEL_48;
    goto LABEL_59;
  }
LABEL_58:
  v29 = 0;
  if ((*(_BYTE *)&v22 & 0x10) != 0)
  {
LABEL_48:
    v30 = 2654435761 * self->_csgId;
    if ((*(_DWORD *)&v22 & 0x10000) != 0)
      goto LABEL_49;
    goto LABEL_60;
  }
LABEL_59:
  v30 = 0;
  if ((*(_DWORD *)&v22 & 0x10000) != 0)
  {
LABEL_49:
    v31 = 2654435761 * self->_timingAdvance;
    if ((*(_DWORD *)&v22 & 0x200000) != 0)
      goto LABEL_50;
LABEL_61:
    v32 = 0;
    if ((*(_DWORD *)&v22 & 0x40000) != 0)
      goto LABEL_51;
LABEL_62:
    v33 = 0;
    goto LABEL_63;
  }
LABEL_60:
  v31 = 0;
  if ((*(_DWORD *)&v22 & 0x200000) == 0)
    goto LABEL_61;
LABEL_50:
  v32 = 2654435761 * self->_uniqueCount;
  if ((*(_DWORD *)&v22 & 0x40000) == 0)
    goto LABEL_62;
LABEL_51:
  v33 = 2654435761 * self->_hasWifiFallback;
LABEL_63:
  v34 = (2654435761 * mnc) ^ (2654435761 * mcc) ^ (2654435761 * tac) ^ (2654435761 * ci) ^ v49 ^ v48 ^ v47 ^ v43 ^ v41 ^ v40 ^ v5 ^ v10 ^ v39 ^ v38 ^ v37 ^ v15 ^ v16 ^ v17 ^ v19 ^ v20 ^ v21 ^ v23 ^ v24;
  v35 = v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33 ^ -[NSString hash](self->_npnNwIdEf, "hash");
  return v34 ^ v35 ^ -[NSString hash](self->_npnCsgIdEf, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;
  int v6;
  CLPLocation *location;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  CLPCellNeighborsGroup *neighborGroup;
  uint64_t v16;
  int v17;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (int *)a3;
  v5 = v4;
  self->_mcc = v4[21];
  self->_mnc = v4[22];
  self->_tac = v4[42];
  self->_ci = v4[10];
  v6 = v4[46];
  if ((v6 & 0x20000) != 0)
  {
    self->_uarfcn = v4[44];
    *(_DWORD *)&self->_has |= 0x20000u;
    v6 = v4[46];
    if ((v6 & 0x800) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v6 & 0x800) == 0)
  {
    goto LABEL_3;
  }
  self->_pid = v4[34];
  *(_DWORD *)&self->_has |= 0x800u;
  if ((v4[46] & 4) != 0)
  {
LABEL_4:
    self->_bandInfo = v4[8];
    *(_DWORD *)&self->_has |= 4u;
  }
LABEL_5:
  location = self->_location;
  v8 = *((_QWORD *)v5 + 9);
  if (location)
  {
    if (v8)
      -[CLPLocation mergeFrom:](location, "mergeFrom:");
  }
  else if (v8)
  {
    -[CLPLteCellTowerLocation setLocation:](self, "setLocation:");
  }
  if (*((_QWORD *)v5 + 3))
    -[CLPLteCellTowerLocation setAppBundleId:](self, "setAppBundleId:");
  if (*((_QWORD *)v5 + 16))
    -[CLPLteCellTowerLocation setOperatorName:](self, "setOperatorName:");
  v9 = v5[46];
  if ((v9 & 1) != 0)
  {
    self->_cellLatitude = *((double *)v5 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v9 = v5[46];
    if ((v9 & 2) == 0)
    {
LABEL_19:
      if ((v9 & 0x8000) == 0)
        goto LABEL_20;
      goto LABEL_36;
    }
  }
  else if ((v9 & 2) == 0)
  {
    goto LABEL_19;
  }
  self->_cellLongitude = *((double *)v5 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v9 = v5[46];
  if ((v9 & 0x8000) == 0)
  {
LABEL_20:
    if ((v9 & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_37;
  }
LABEL_36:
  self->_serverHash = v5[38];
  *(_DWORD *)&self->_has |= 0x8000u;
  v9 = v5[46];
  if ((v9 & 0x100) == 0)
  {
LABEL_21:
    if ((v9 & 0x2000) == 0)
      goto LABEL_22;
    goto LABEL_38;
  }
LABEL_37:
  self->_ecn0 = v5[15];
  *(_DWORD *)&self->_has |= 0x100u;
  v9 = v5[46];
  if ((v9 & 0x2000) == 0)
  {
LABEL_22:
    if ((v9 & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_38:
  self->_rscp = v5[36];
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((v5[46] & 0x4000) != 0)
  {
LABEL_23:
    self->_rssi = v5[37];
    *(_DWORD *)&self->_has |= 0x4000u;
  }
LABEL_24:
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = *((id *)v5 + 13);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        -[CLPLteCellTowerLocation addNeighbor:](self, "addNeighbor:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  neighborGroup = self->_neighborGroup;
  v16 = *((_QWORD *)v5 + 12);
  if (neighborGroup)
  {
    if (v16)
      -[CLPCellNeighborsGroup mergeFrom:](neighborGroup, "mergeFrom:");
  }
  else if (v16)
  {
    -[CLPLteCellTowerLocation setNeighborGroup:](self, "setNeighborGroup:");
  }
  v17 = v5[46];
  if ((v17 & 8) != 0)
  {
    self->_bandwidth = v5[9];
    *(_DWORD *)&self->_has |= 8u;
    v17 = v5[46];
  }
  if ((v17 & 0x80000) != 0)
  {
    self->_isLimitedService = *((_BYTE *)v5 + 181);
    *(_DWORD *)&self->_has |= 0x80000u;
  }
  if (*((_QWORD *)v5 + 20))
    -[CLPLteCellTowerLocation setServiceProviderName:](self, "setServiceProviderName:");
  v18 = v5[46];
  if ((v18 & 0x40) != 0)
  {
    self->_deploymentType = v5[13];
    *(_DWORD *)&self->_has |= 0x40u;
    v18 = v5[46];
    if ((v18 & 0x80) == 0)
    {
LABEL_50:
      if ((v18 & 0x100000) == 0)
        goto LABEL_51;
      goto LABEL_67;
    }
  }
  else if ((v18 & 0x80) == 0)
  {
    goto LABEL_50;
  }
  self->_downlinkBandwidth = v5[14];
  *(_DWORD *)&self->_has |= 0x80u;
  v18 = v5[46];
  if ((v18 & 0x100000) == 0)
  {
LABEL_51:
    if ((v18 & 0x200) == 0)
      goto LABEL_52;
    goto LABEL_68;
  }
LABEL_67:
  self->_isStalled = *((_BYTE *)v5 + 182);
  *(_DWORD *)&self->_has |= 0x100000u;
  v18 = v5[46];
  if ((v18 & 0x200) == 0)
  {
LABEL_52:
    if ((v18 & 0x1000) == 0)
      goto LABEL_53;
    goto LABEL_69;
  }
LABEL_68:
  self->_latency = v5[16];
  *(_DWORD *)&self->_has |= 0x200u;
  v18 = v5[46];
  if ((v18 & 0x1000) == 0)
  {
LABEL_53:
    if ((v18 & 0x400) == 0)
      goto LABEL_54;
    goto LABEL_70;
  }
LABEL_69:
  self->_pmax = v5[35];
  *(_DWORD *)&self->_has |= 0x1000u;
  v18 = v5[46];
  if ((v18 & 0x400) == 0)
  {
LABEL_54:
    if ((v18 & 0x20) == 0)
      goto LABEL_55;
    goto LABEL_71;
  }
LABEL_70:
  self->_maxThroughput = v5[20];
  *(_DWORD *)&self->_has |= 0x400u;
  v18 = v5[46];
  if ((v18 & 0x20) == 0)
  {
LABEL_55:
    if ((v18 & 0x10) == 0)
      goto LABEL_56;
    goto LABEL_72;
  }
LABEL_71:
  self->_csgIndication = v5[12];
  *(_DWORD *)&self->_has |= 0x20u;
  v18 = v5[46];
  if ((v18 & 0x10) == 0)
  {
LABEL_56:
    if ((v18 & 0x10000) == 0)
      goto LABEL_57;
    goto LABEL_73;
  }
LABEL_72:
  self->_csgId = v5[11];
  *(_DWORD *)&self->_has |= 0x10u;
  v18 = v5[46];
  if ((v18 & 0x10000) == 0)
  {
LABEL_57:
    if ((v18 & 0x200000) == 0)
      goto LABEL_58;
    goto LABEL_74;
  }
LABEL_73:
  self->_timingAdvance = v5[43];
  *(_DWORD *)&self->_has |= 0x10000u;
  v18 = v5[46];
  if ((v18 & 0x200000) == 0)
  {
LABEL_58:
    if ((v18 & 0x40000) == 0)
      goto LABEL_60;
    goto LABEL_59;
  }
LABEL_74:
  self->_uniqueCount = *((_BYTE *)v5 + 183);
  *(_DWORD *)&self->_has |= 0x200000u;
  if ((v5[46] & 0x40000) != 0)
  {
LABEL_59:
    self->_hasWifiFallback = *((_BYTE *)v5 + 180);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
LABEL_60:
  if (*((_QWORD *)v5 + 15))
    -[CLPLteCellTowerLocation setNpnNwIdEf:](self, "setNpnNwIdEf:");
  if (*((_QWORD *)v5 + 14))
    -[CLPLteCellTowerLocation setNpnCsgIdEf:](self, "setNpnCsgIdEf:");

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

- (int)tac
{
  return self->_tac;
}

- (void)setTac:(int)a3
{
  self->_tac = a3;
}

- (int)ci
{
  return self->_ci;
}

- (void)setCi:(int)a3
{
  self->_ci = a3;
}

- (int)uarfcn
{
  return self->_uarfcn;
}

- (int)pid
{
  return self->_pid;
}

- (int)bandInfo
{
  return self->_bandInfo;
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

- (NSString)operatorName
{
  return self->_operatorName;
}

- (void)setOperatorName:(id)a3
{
  objc_storeStrong((id *)&self->_operatorName, a3);
}

- (double)cellLatitude
{
  return self->_cellLatitude;
}

- (double)cellLongitude
{
  return self->_cellLongitude;
}

- (int)serverHash
{
  return self->_serverHash;
}

- (int)ecn0
{
  return self->_ecn0;
}

- (int)rscp
{
  return self->_rscp;
}

- (int)rssi
{
  return self->_rssi;
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

- (int)bandwidth
{
  return self->_bandwidth;
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

- (unsigned)deploymentType
{
  return self->_deploymentType;
}

- (unsigned)downlinkBandwidth
{
  return self->_downlinkBandwidth;
}

- (BOOL)isStalled
{
  return self->_isStalled;
}

- (unsigned)latency
{
  return self->_latency;
}

- (unsigned)pmax
{
  return self->_pmax;
}

- (unsigned)maxThroughput
{
  return self->_maxThroughput;
}

- (unsigned)csgIndication
{
  return self->_csgIndication;
}

- (unsigned)csgId
{
  return self->_csgId;
}

- (int)timingAdvance
{
  return self->_timingAdvance;
}

- (BOOL)uniqueCount
{
  return self->_uniqueCount;
}

- (BOOL)hasWifiFallback
{
  return self->_hasWifiFallback;
}

- (NSString)npnNwIdEf
{
  return self->_npnNwIdEf;
}

- (void)setNpnNwIdEf:(id)a3
{
  objc_storeStrong((id *)&self->_npnNwIdEf, a3);
}

- (NSString)npnCsgIdEf
{
  return self->_npnCsgIdEf;
}

- (void)setNpnCsgIdEf:(id)a3
{
  objc_storeStrong((id *)&self->_npnCsgIdEf, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProviderName, 0);
  objc_storeStrong((id *)&self->_operatorName, 0);
  objc_storeStrong((id *)&self->_npnNwIdEf, 0);
  objc_storeStrong((id *)&self->_npnCsgIdEf, 0);
  objc_storeStrong((id *)&self->_neighbors, 0);
  objc_storeStrong((id *)&self->_neighborGroup, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPLteCellTowerLocation writeTo:]", "CLPCollectionRequest.gen.m", 24735, "self->_location != nil");
}

@end
