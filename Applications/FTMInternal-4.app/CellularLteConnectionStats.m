@implementation CellularLteConnectionStats

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDuration
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)maxUlMod
{
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    return self->_maxUlMod;
  else
    return 0;
}

- (void)setMaxUlMod:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_maxUlMod = a3;
}

- (void)setHasMaxUlMod:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasMaxUlMod
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)maxUlModAsString:(int)a3
{
  if (a3 >= 7)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025F180 + a3);
}

- (int)StringAsMaxUlMod:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULATION_BPSK")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULATION_QPSK")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULATION_16QAM")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULATION_64QAM")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULATION_256QAM")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULATION_1024QAM")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MODULATION_UNKOWN")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)maxDlMod
{
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    return self->_maxDlMod;
  else
    return 0;
}

- (void)setMaxDlMod:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_maxDlMod = a3;
}

- (void)setHasMaxDlMod:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasMaxDlMod
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)maxDlModAsString:(int)a3
{
  if (a3 >= 7)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025F180 + a3);
}

- (int)StringAsMaxDlMod:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULATION_BPSK")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULATION_QPSK")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULATION_16QAM")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULATION_64QAM")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULATION_256QAM")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULATION_1024QAM")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MODULATION_UNKOWN")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setMaxNwMimoLyr:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_maxNwMimoLyr = a3;
}

- (void)setHasMaxNwMimoLyr:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasMaxNwMimoLyr
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setMaxUeRank:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_maxUeRank = a3;
}

- (void)setHasMaxUeRank:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasMaxUeRank
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setMaxRxAnt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_maxRxAnt = a3;
}

- (void)setHasMaxRxAnt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasMaxRxAnt
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setMaxSchdMimoLyr:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_maxSchdMimoLyr = a3;
}

- (void)setHasMaxSchdMimoLyr:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasMaxSchdMimoLyr
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setLteTotalNumCcs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_lteTotalNumCcs = a3;
}

- (void)setHasLteTotalNumCcs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasLteTotalNumCcs
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setLteTotalDlMimoLayers:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_lteTotalDlMimoLayers = a3;
}

- (void)setHasLteTotalDlMimoLayers:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasLteTotalDlMimoLayers
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasLteBandCombo
{
  return self->_lteBandCombo != 0;
}

- (void)setMrdcTotalNumCcs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_mrdcTotalNumCcs = a3;
}

- (void)setHasMrdcTotalNumCcs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasMrdcTotalNumCcs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setMrdcTotalDlMimoLayers:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_mrdcTotalDlMimoLayers = a3;
}

- (void)setHasMrdcTotalDlMimoLayers:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasMrdcTotalDlMimoLayers
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setMrdcLteTotalNumCcs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_mrdcLteTotalNumCcs = a3;
}

- (void)setHasMrdcLteTotalNumCcs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasMrdcLteTotalNumCcs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setMrdcLteTotalDlMimoLayers:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_mrdcLteTotalDlMimoLayers = a3;
}

- (void)setHasMrdcLteTotalDlMimoLayers:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasMrdcLteTotalDlMimoLayers
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasMrdcLteBandCombo
{
  return self->_mrdcLteBandCombo != 0;
}

- (void)setMrdcNrTotalNumCcs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_mrdcNrTotalNumCcs = a3;
}

- (void)setHasMrdcNrTotalNumCcs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasMrdcNrTotalNumCcs
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setMrdcNrTotalDlMimoLayers:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_mrdcNrTotalDlMimoLayers = a3;
}

- (void)setHasMrdcNrTotalDlMimoLayers:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasMrdcNrTotalDlMimoLayers
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasMrdcNrBandCombo
{
  return self->_mrdcNrBandCombo != 0;
}

- (void)clearNwUeCapStats
{
  -[NSMutableArray removeAllObjects](self->_nwUeCapStats, "removeAllObjects");
}

- (void)addNwUeCapStat:(id)a3
{
  id v4;
  NSMutableArray *nwUeCapStats;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  nwUeCapStats = self->_nwUeCapStats;
  v8 = v4;
  if (!nwUeCapStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_nwUeCapStats;
    self->_nwUeCapStats = v6;

    v4 = v8;
    nwUeCapStats = self->_nwUeCapStats;
  }
  -[NSMutableArray addObject:](nwUeCapStats, "addObject:", v4);

}

- (unint64_t)nwUeCapStatsCount
{
  return (unint64_t)-[NSMutableArray count](self->_nwUeCapStats, "count");
}

- (id)nwUeCapStatAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_nwUeCapStats, "objectAtIndex:", a3);
}

+ (Class)nwUeCapStatType
{
  return (Class)objc_opt_class(NwUeCapMimoStat, a2);
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasNumSubs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasSubsId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasPsPref
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (int)cause
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_cause;
  else
    return 0;
}

- (void)setCause:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_cause = a3;
}

- (void)setHasCause:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCause
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)causeAsString:(int)a3
{
  if (a3 >= 6)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025F1B8 + a3);
}

- (int)StringAsCause:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONN_INFO_CAUSE_INVALID")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONN_INFO_CAUSE_RELEASE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONN_INFO_CAUSE_HO")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONN_INFO_CAUSE_OTHER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONN_INFO_CAUSE_MAX")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CONN_INFO_CAUSE_MAX_STATS")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setConnDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_connDuration = a3;
}

- (void)setHasConnDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasConnDuration
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularLteConnectionStats;
  v3 = -[CellularLteConnectionStats description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLteConnectionStats dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has;
  void *v5;
  BandCombo *lteBandCombo;
  void *v7;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v8;
  void *v9;
  BandCombo *mrdcLteBandCombo;
  void *v11;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v12;
  void *v13;
  void *v14;
  BandCombo *mrdcNrBandCombo;
  void *v16;
  id v17;
  NSMutableArray *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  NSData *plmn;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v26;
  void *v27;
  id v28;
  void *v30;
  void *v31;
  uint64_t maxUlMod;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t cause;
  void *v40;
  uint64_t maxDlMod;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("timestamp"));

    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_48;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_duration));
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("duration"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_60;
  }
LABEL_48:
  maxUlMod = self->_maxUlMod;
  if (maxUlMod >= 7)
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_maxUlMod));
  else
    v33 = *(&off_10025F180 + maxUlMod);
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("max_ul_mod"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_67;
  }
LABEL_60:
  maxDlMod = self->_maxDlMod;
  if (maxDlMod >= 7)
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_maxDlMod));
  else
    v42 = *(&off_10025F180 + maxDlMod);
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("max_dl_mod"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_68;
  }
LABEL_67:
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_maxNwMimoLyr));
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("max_nw_mimo_lyr"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_69;
  }
LABEL_68:
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_maxUeRank));
  objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("max_ue_rank"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_70;
  }
LABEL_69:
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_maxRxAnt));
  objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("max_rx_ant"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_71;
  }
LABEL_70:
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_maxSchdMimoLyr));
  objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("max_schd_mimo_lyr"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_71:
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lteTotalNumCcs));
  objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("lte_total_num_ccs"));

  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lteTotalDlMimoLayers));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("lte_total_dl_mimo_layers"));

  }
LABEL_12:
  lteBandCombo = self->_lteBandCombo;
  if (lteBandCombo)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BandCombo dictionaryRepresentation](lteBandCombo, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("lte_band_combo"));

  }
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000) != 0)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mrdcTotalNumCcs));
    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("mrdc_total_num_ccs"));

    v8 = self->_has;
    if ((*(_DWORD *)&v8 & 0x10000) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&v8 & 0x2000) == 0)
        goto LABEL_17;
      goto LABEL_52;
    }
  }
  else if ((*(_DWORD *)&v8 & 0x10000) == 0)
  {
    goto LABEL_16;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mrdcTotalDlMimoLayers));
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("mrdc_total_dl_mimo_layers"));

  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v8 & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_52:
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mrdcLteTotalNumCcs));
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("mrdc_lte_total_num_ccs"));

  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_18:
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mrdcLteTotalDlMimoLayers));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("mrdc_lte_total_dl_mimo_layers"));

  }
LABEL_19:
  mrdcLteBandCombo = self->_mrdcLteBandCombo;
  if (mrdcLteBandCombo)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BandCombo dictionaryRepresentation](mrdcLteBandCombo, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("mrdc_lte_band_combo"));

  }
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x8000) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mrdcNrTotalNumCcs));
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("mrdc_nr_total_num_ccs"));

    v12 = self->_has;
  }
  if ((*(_WORD *)&v12 & 0x4000) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mrdcNrTotalDlMimoLayers));
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("mrdc_nr_total_dl_mimo_layers"));

  }
  mrdcNrBandCombo = self->_mrdcNrBandCombo;
  if (mrdcNrBandCombo)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BandCombo dictionaryRepresentation](mrdcNrBandCombo, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("mrdc_nr_band_combo"));

  }
  if (-[NSMutableArray count](self->_nwUeCapStats, "count"))
  {
    v17 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_nwUeCapStats, "count"));
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v18 = self->_nwUeCapStats;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v49 != v21)
            objc_enumerationMutation(v18);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v17, "addObject:", v23);

        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      }
      while (v20);
    }

    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("nw_ue_cap_stat"));
  }
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("num_subs"));

  }
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x100000) != 0)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("subs_id"));

    v26 = self->_has;
    if ((*(_DWORD *)&v26 & 0x80000) == 0)
    {
LABEL_42:
      if ((*(_BYTE *)&v26 & 2) == 0)
        goto LABEL_43;
LABEL_56:
      cause = self->_cause;
      if (cause >= 6)
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_cause));
      else
        v40 = *(&off_10025F1B8 + cause);
      objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("cause"));

      if ((*(_DWORD *)&self->_has & 4) != 0)
        goto LABEL_44;
      goto LABEL_45;
    }
  }
  else if ((*(_DWORD *)&v26 & 0x80000) == 0)
  {
    goto LABEL_42;
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("ps_pref"));

  v26 = self->_has;
  if ((*(_BYTE *)&v26 & 2) != 0)
    goto LABEL_56;
LABEL_43:
  if ((*(_BYTE *)&v26 & 4) != 0)
  {
LABEL_44:
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_connDuration));
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("conn_duration"));

  }
LABEL_45:
  v28 = v3;

  return v28;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000A9E28((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has;
  BandCombo *lteBandCombo;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v8;
  BandCombo *mrdcLteBandCombo;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v10;
  BandCombo *mrdcNrBandCombo;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSData *plmn;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v5 = v4;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_46;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_duration, 2);
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteInt32Field(v5, self->_maxUlMod, 3);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteInt32Field(v5, self->_maxDlMod, 4);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field(v5, self->_maxNwMimoLyr, 5);
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field(v5, self->_maxUeRank, 6);
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field(v5, self->_maxRxAnt, 7);
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field(v5, self->_maxSchdMimoLyr, 8);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_52:
  PBDataWriterWriteUint32Field(v5, self->_lteTotalNumCcs, 9);
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
LABEL_11:
    PBDataWriterWriteUint32Field(v5, self->_lteTotalDlMimoLayers, 10);
LABEL_12:
  lteBandCombo = self->_lteBandCombo;
  if (lteBandCombo)
    PBDataWriterWriteSubmessage(v5, lteBandCombo, 11);
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_mrdcTotalNumCcs, 12);
    v8 = self->_has;
    if ((*(_DWORD *)&v8 & 0x10000) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&v8 & 0x2000) == 0)
        goto LABEL_17;
      goto LABEL_56;
    }
  }
  else if ((*(_DWORD *)&v8 & 0x10000) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteUint32Field(v5, self->_mrdcTotalDlMimoLayers, 13);
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v8 & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_56:
  PBDataWriterWriteUint32Field(v5, self->_mrdcLteTotalNumCcs, 14);
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
LABEL_18:
    PBDataWriterWriteUint32Field(v5, self->_mrdcLteTotalDlMimoLayers, 15);
LABEL_19:
  mrdcLteBandCombo = self->_mrdcLteBandCombo;
  if (mrdcLteBandCombo)
    PBDataWriterWriteSubmessage(v5, mrdcLteBandCombo, 16);
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x8000) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_mrdcNrTotalNumCcs, 17);
    v10 = self->_has;
  }
  if ((*(_WORD *)&v10 & 0x4000) != 0)
    PBDataWriterWriteUint32Field(v5, self->_mrdcNrTotalDlMimoLayers, 18);
  mrdcNrBandCombo = self->_mrdcNrBandCombo;
  if (mrdcNrBandCombo)
    PBDataWriterWriteSubmessage(v5, mrdcNrBandCombo, 19);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_nwUeCapStats;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v16), 20);
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    PBDataWriterWriteUint32Field(v5, self->_numSubs, 21);
  plmn = self->_plmn;
  if (plmn)
    PBDataWriterWriteDataField(v5, plmn, 22);
  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x100000) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_subsId, 23);
    v18 = self->_has;
    if ((*(_DWORD *)&v18 & 0x80000) == 0)
    {
LABEL_40:
      if ((*(_BYTE *)&v18 & 2) == 0)
        goto LABEL_41;
LABEL_60:
      PBDataWriterWriteInt32Field(v5, self->_cause, 25);
      if ((*(_DWORD *)&self->_has & 4) == 0)
        goto LABEL_43;
      goto LABEL_42;
    }
  }
  else if ((*(_DWORD *)&v18 & 0x80000) == 0)
  {
    goto LABEL_40;
  }
  PBDataWriterWriteUint32Field(v5, self->_psPref, 24);
  v18 = self->_has;
  if ((*(_BYTE *)&v18 & 2) != 0)
    goto LABEL_60;
LABEL_41:
  if ((*(_BYTE *)&v18 & 4) != 0)
LABEL_42:
    PBDataWriterWriteUint32Field(v5, self->_connDuration, 26);
LABEL_43:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v6;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  _DWORD *v12;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v13;
  _DWORD *v14;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 36) |= 1u;
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_43;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_duration;
  *((_DWORD *)v4 + 36) |= 8u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 17) = self->_maxUlMod;
  *((_DWORD *)v4 + 36) |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 12) = self->_maxDlMod;
  *((_DWORD *)v4 + 36) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 13) = self->_maxNwMimoLyr;
  *((_DWORD *)v4 + 36) |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 16) = self->_maxUeRank;
  *((_DWORD *)v4 + 36) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 14) = self->_maxRxAnt;
  *((_DWORD *)v4 + 36) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 15) = self->_maxSchdMimoLyr;
  *((_DWORD *)v4 + 36) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_49:
  *((_DWORD *)v4 + 11) = self->_lteTotalNumCcs;
  *((_DWORD *)v4 + 36) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    *((_DWORD *)v4 + 10) = self->_lteTotalDlMimoLayers;
    *((_DWORD *)v4 + 36) |= 0x10u;
  }
LABEL_12:
  v14 = v4;
  if (self->_lteBandCombo)
  {
    objc_msgSend(v4, "setLteBandCombo:");
    v4 = v14;
  }
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) != 0)
  {
    *((_DWORD *)v4 + 27) = self->_mrdcTotalNumCcs;
    *((_DWORD *)v4 + 36) |= 0x20000u;
    v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x10000) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&v6 & 0x2000) == 0)
        goto LABEL_17;
      goto LABEL_53;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)v4 + 26) = self->_mrdcTotalDlMimoLayers;
  *((_DWORD *)v4 + 36) |= 0x10000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v6 & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_53:
  *((_DWORD *)v4 + 21) = self->_mrdcLteTotalNumCcs;
  *((_DWORD *)v4 + 36) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_18:
    *((_DWORD *)v4 + 20) = self->_mrdcLteTotalDlMimoLayers;
    *((_DWORD *)v4 + 36) |= 0x1000u;
  }
LABEL_19:
  if (self->_mrdcLteBandCombo)
  {
    objc_msgSend(v14, "setMrdcLteBandCombo:");
    v4 = v14;
  }
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x8000) != 0)
  {
    *((_DWORD *)v4 + 25) = self->_mrdcNrTotalNumCcs;
    *((_DWORD *)v4 + 36) |= 0x8000u;
    v7 = self->_has;
  }
  if ((*(_WORD *)&v7 & 0x4000) != 0)
  {
    *((_DWORD *)v4 + 24) = self->_mrdcNrTotalDlMimoLayers;
    *((_DWORD *)v4 + 36) |= 0x4000u;
  }
  if (self->_mrdcNrBandCombo)
    objc_msgSend(v14, "setMrdcNrBandCombo:");
  if (-[CellularLteConnectionStats nwUeCapStatsCount](self, "nwUeCapStatsCount"))
  {
    objc_msgSend(v14, "clearNwUeCapStats");
    v8 = -[CellularLteConnectionStats nwUeCapStatsCount](self, "nwUeCapStatsCount");
    if (v8)
    {
      v9 = v8;
      for (i = 0; i != v9; ++i)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLteConnectionStats nwUeCapStatAtIndex:](self, "nwUeCapStatAtIndex:", i));
        objc_msgSend(v14, "addNwUeCapStat:", v11);

      }
    }
  }
  v12 = v14;
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
  {
    v14[28] = self->_numSubs;
    v14[36] |= 0x40000u;
  }
  if (self->_plmn)
  {
    objc_msgSend(v14, "setPlmn:");
    v12 = v14;
  }
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x100000) != 0)
  {
    v12[35] = self->_subsId;
    v12[36] |= 0x100000u;
    v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x80000) == 0)
    {
LABEL_37:
      if ((*(_BYTE *)&v13 & 2) == 0)
        goto LABEL_38;
LABEL_57:
      v12[4] = self->_cause;
      v12[36] |= 2u;
      if ((*(_DWORD *)&self->_has & 4) == 0)
        goto LABEL_40;
      goto LABEL_39;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x80000) == 0)
  {
    goto LABEL_37;
  }
  v12[34] = self->_psPref;
  v12[36] |= 0x80000u;
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 2) != 0)
    goto LABEL_57;
LABEL_38:
  if ((*(_BYTE *)&v13 & 4) != 0)
  {
LABEL_39:
    v12[5] = self->_connDuration;
    v12[36] |= 4u;
  }
LABEL_40:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has;
  id v8;
  void *v9;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v10;
  id v11;
  void *v12;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v13;
  id v14;
  void *v15;
  NSMutableArray *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_DWORD *)v5 + 36) |= 1u;
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_38;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 6) = self->_duration;
  *((_DWORD *)v5 + 36) |= 8u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v5 + 17) = self->_maxUlMod;
  *((_DWORD *)v5 + 36) |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v5 + 12) = self->_maxDlMod;
  *((_DWORD *)v5 + 36) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v5 + 13) = self->_maxNwMimoLyr;
  *((_DWORD *)v5 + 36) |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v5 + 16) = self->_maxUeRank;
  *((_DWORD *)v5 + 36) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v5 + 14) = self->_maxRxAnt;
  *((_DWORD *)v5 + 36) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v5 + 15) = self->_maxSchdMimoLyr;
  *((_DWORD *)v5 + 36) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_44:
  *((_DWORD *)v5 + 11) = self->_lteTotalNumCcs;
  *((_DWORD *)v5 + 36) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    *((_DWORD *)v5 + 10) = self->_lteTotalDlMimoLayers;
    *((_DWORD *)v5 + 36) |= 0x10u;
  }
LABEL_12:
  v8 = -[BandCombo copyWithZone:](self->_lteBandCombo, "copyWithZone:", a3);
  v9 = (void *)v6[4];
  v6[4] = v8;

  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x20000) != 0)
  {
    *((_DWORD *)v6 + 27) = self->_mrdcTotalNumCcs;
    *((_DWORD *)v6 + 36) |= 0x20000u;
    v10 = self->_has;
    if ((*(_DWORD *)&v10 & 0x10000) == 0)
    {
LABEL_14:
      if ((*(_WORD *)&v10 & 0x2000) == 0)
        goto LABEL_15;
      goto LABEL_48;
    }
  }
  else if ((*(_DWORD *)&v10 & 0x10000) == 0)
  {
    goto LABEL_14;
  }
  *((_DWORD *)v6 + 26) = self->_mrdcTotalDlMimoLayers;
  *((_DWORD *)v6 + 36) |= 0x10000u;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v10 & 0x1000) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_48:
  *((_DWORD *)v6 + 21) = self->_mrdcLteTotalNumCcs;
  *((_DWORD *)v6 + 36) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_16:
    *((_DWORD *)v6 + 20) = self->_mrdcLteTotalDlMimoLayers;
    *((_DWORD *)v6 + 36) |= 0x1000u;
  }
LABEL_17:
  v11 = -[BandCombo copyWithZone:](self->_mrdcLteBandCombo, "copyWithZone:", a3);
  v12 = (void *)v6[9];
  v6[9] = v11;

  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x8000) != 0)
  {
    *((_DWORD *)v6 + 25) = self->_mrdcNrTotalNumCcs;
    *((_DWORD *)v6 + 36) |= 0x8000u;
    v13 = self->_has;
  }
  if ((*(_WORD *)&v13 & 0x4000) != 0)
  {
    *((_DWORD *)v6 + 24) = self->_mrdcNrTotalDlMimoLayers;
    *((_DWORD *)v6 + 36) |= 0x4000u;
  }
  v14 = -[BandCombo copyWithZone:](self->_mrdcNrBandCombo, "copyWithZone:", a3);
  v15 = (void *)v6[11];
  v6[11] = v14;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = self->_nwUeCapStats;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        v21 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v20), "copyWithZone:", a3, (_QWORD)v26);
        objc_msgSend(v6, "addNwUeCapStat:", v21);

        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v18);
  }

  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
  {
    *((_DWORD *)v6 + 28) = self->_numSubs;
    *((_DWORD *)v6 + 36) |= 0x40000u;
  }
  v22 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3, (_QWORD)v26);
  v23 = (void *)v6[16];
  v6[16] = v22;

  v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x100000) != 0)
  {
    *((_DWORD *)v6 + 35) = self->_subsId;
    *((_DWORD *)v6 + 36) |= 0x100000u;
    v24 = self->_has;
    if ((*(_DWORD *)&v24 & 0x80000) == 0)
    {
LABEL_32:
      if ((*(_BYTE *)&v24 & 2) == 0)
        goto LABEL_33;
LABEL_52:
      *((_DWORD *)v6 + 4) = self->_cause;
      *((_DWORD *)v6 + 36) |= 2u;
      if ((*(_DWORD *)&self->_has & 4) == 0)
        return v6;
      goto LABEL_34;
    }
  }
  else if ((*(_DWORD *)&v24 & 0x80000) == 0)
  {
    goto LABEL_32;
  }
  *((_DWORD *)v6 + 34) = self->_psPref;
  *((_DWORD *)v6 + 36) |= 0x80000u;
  v24 = self->_has;
  if ((*(_BYTE *)&v24 & 2) != 0)
    goto LABEL_52;
LABEL_33:
  if ((*(_BYTE *)&v24 & 4) != 0)
  {
LABEL_34:
    *((_DWORD *)v6 + 5) = self->_connDuration;
    *((_DWORD *)v6 + 36) |= 4u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has;
  int v7;
  BandCombo *lteBandCombo;
  int v9;
  BandCombo *mrdcLteBandCombo;
  int v11;
  BandCombo *mrdcNrBandCombo;
  NSMutableArray *nwUeCapStats;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v14;
  int v15;
  NSData *plmn;
  int v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_120;
  has = self->_has;
  v7 = *((_DWORD *)v4 + 36);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_120;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_120;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_duration != *((_DWORD *)v4 + 6))
      goto LABEL_120;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_120;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_maxUlMod != *((_DWORD *)v4 + 17))
      goto LABEL_120;
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_120;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_maxDlMod != *((_DWORD *)v4 + 12))
      goto LABEL_120;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_120;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_maxNwMimoLyr != *((_DWORD *)v4 + 13))
      goto LABEL_120;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_120;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_maxUeRank != *((_DWORD *)v4 + 16))
      goto LABEL_120;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_120;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_maxRxAnt != *((_DWORD *)v4 + 14))
      goto LABEL_120;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_120;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_maxSchdMimoLyr != *((_DWORD *)v4 + 15))
      goto LABEL_120;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_120;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_lteTotalNumCcs != *((_DWORD *)v4 + 11))
      goto LABEL_120;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_120;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_lteTotalDlMimoLayers != *((_DWORD *)v4 + 10))
      goto LABEL_120;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_120;
  }
  lteBandCombo = self->_lteBandCombo;
  if ((unint64_t)lteBandCombo | *((_QWORD *)v4 + 4))
  {
    if (!-[BandCombo isEqual:](lteBandCombo, "isEqual:"))
      goto LABEL_120;
    has = self->_has;
  }
  v9 = *((_DWORD *)v4 + 36);
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v9 & 0x20000) == 0 || self->_mrdcTotalNumCcs != *((_DWORD *)v4 + 27))
      goto LABEL_120;
  }
  else if ((v9 & 0x20000) != 0)
  {
    goto LABEL_120;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v9 & 0x10000) == 0 || self->_mrdcTotalDlMimoLayers != *((_DWORD *)v4 + 26))
      goto LABEL_120;
  }
  else if ((v9 & 0x10000) != 0)
  {
    goto LABEL_120;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v9 & 0x2000) == 0 || self->_mrdcLteTotalNumCcs != *((_DWORD *)v4 + 21))
      goto LABEL_120;
  }
  else if ((v9 & 0x2000) != 0)
  {
    goto LABEL_120;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v9 & 0x1000) == 0 || self->_mrdcLteTotalDlMimoLayers != *((_DWORD *)v4 + 20))
      goto LABEL_120;
  }
  else if ((v9 & 0x1000) != 0)
  {
    goto LABEL_120;
  }
  mrdcLteBandCombo = self->_mrdcLteBandCombo;
  if ((unint64_t)mrdcLteBandCombo | *((_QWORD *)v4 + 9))
  {
    if (!-[BandCombo isEqual:](mrdcLteBandCombo, "isEqual:"))
      goto LABEL_120;
    has = self->_has;
  }
  v11 = *((_DWORD *)v4 + 36);
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v11 & 0x8000) == 0 || self->_mrdcNrTotalNumCcs != *((_DWORD *)v4 + 25))
      goto LABEL_120;
  }
  else if ((v11 & 0x8000) != 0)
  {
    goto LABEL_120;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v11 & 0x4000) == 0 || self->_mrdcNrTotalDlMimoLayers != *((_DWORD *)v4 + 24))
      goto LABEL_120;
  }
  else if ((v11 & 0x4000) != 0)
  {
    goto LABEL_120;
  }
  mrdcNrBandCombo = self->_mrdcNrBandCombo;
  if ((unint64_t)mrdcNrBandCombo | *((_QWORD *)v4 + 11) && !-[BandCombo isEqual:](mrdcNrBandCombo, "isEqual:"))
    goto LABEL_120;
  nwUeCapStats = self->_nwUeCapStats;
  if ((unint64_t)nwUeCapStats | *((_QWORD *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](nwUeCapStats, "isEqual:"))
      goto LABEL_120;
  }
  v14 = self->_has;
  v15 = *((_DWORD *)v4 + 36);
  if ((*(_DWORD *)&v14 & 0x40000) != 0)
  {
    if ((v15 & 0x40000) == 0 || self->_numSubs != *((_DWORD *)v4 + 28))
      goto LABEL_120;
  }
  else if ((v15 & 0x40000) != 0)
  {
    goto LABEL_120;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 16))
  {
    if (-[NSData isEqual:](plmn, "isEqual:"))
    {
      v14 = self->_has;
      goto LABEL_100;
    }
LABEL_120:
    v18 = 0;
    goto LABEL_121;
  }
LABEL_100:
  v17 = *((_DWORD *)v4 + 36);
  if ((*(_DWORD *)&v14 & 0x100000) != 0)
  {
    if ((v17 & 0x100000) == 0 || self->_subsId != *((_DWORD *)v4 + 35))
      goto LABEL_120;
  }
  else if ((v17 & 0x100000) != 0)
  {
    goto LABEL_120;
  }
  if ((*(_DWORD *)&v14 & 0x80000) != 0)
  {
    if ((v17 & 0x80000) == 0 || self->_psPref != *((_DWORD *)v4 + 34))
      goto LABEL_120;
  }
  else if ((v17 & 0x80000) != 0)
  {
    goto LABEL_120;
  }
  if ((*(_BYTE *)&v14 & 2) != 0)
  {
    if ((v17 & 2) == 0 || self->_cause != *((_DWORD *)v4 + 4))
      goto LABEL_120;
  }
  else if ((v17 & 2) != 0)
  {
    goto LABEL_120;
  }
  if ((*(_BYTE *)&v14 & 4) != 0)
  {
    if ((v17 & 4) == 0 || self->_connDuration != *((_DWORD *)v4 + 5))
      goto LABEL_120;
    v18 = 1;
  }
  else
  {
    v18 = (*((_DWORD *)v4 + 36) & 4) == 0;
  }
LABEL_121:

  return v18;
}

- (unint64_t)hash
{
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v4;
  uint64_t v5;
  unint64_t v6;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v34 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&has & 8) != 0)
    {
LABEL_3:
      v33 = 2654435761 * self->_duration;
      if ((*(_WORD *)&has & 0x800) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v34 = 0;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_3;
  }
  v33 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_4:
    v32 = 2654435761 * self->_maxUlMod;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v32 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_5:
    v31 = 2654435761 * self->_maxDlMod;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v31 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_6:
    v30 = 2654435761 * self->_maxNwMimoLyr;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v30 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_7:
    v29 = 2654435761 * self->_maxUeRank;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v29 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_8:
    v28 = 2654435761 * self->_maxRxAnt;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v28 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_9:
    v27 = 2654435761 * self->_maxSchdMimoLyr;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_10;
LABEL_20:
    v26 = 0;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_11;
    goto LABEL_21;
  }
LABEL_19:
  v27 = 0;
  if ((*(_BYTE *)&has & 0x20) == 0)
    goto LABEL_20;
LABEL_10:
  v26 = 2654435761 * self->_lteTotalNumCcs;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_11:
    v25 = 2654435761 * self->_lteTotalDlMimoLayers;
    goto LABEL_22;
  }
LABEL_21:
  v25 = 0;
LABEL_22:
  v24 = -[BandCombo hash](self->_lteBandCombo, "hash");
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x20000) != 0)
  {
    v23 = 2654435761 * self->_mrdcTotalNumCcs;
    if ((*(_DWORD *)&v4 & 0x10000) != 0)
    {
LABEL_24:
      v22 = 2654435761 * self->_mrdcTotalDlMimoLayers;
      if ((*(_WORD *)&v4 & 0x2000) != 0)
        goto LABEL_25;
LABEL_29:
      v20 = 0;
      if ((*(_WORD *)&v4 & 0x1000) != 0)
        goto LABEL_26;
      goto LABEL_30;
    }
  }
  else
  {
    v23 = 0;
    if ((*(_DWORD *)&v4 & 0x10000) != 0)
      goto LABEL_24;
  }
  v22 = 0;
  if ((*(_WORD *)&v4 & 0x2000) == 0)
    goto LABEL_29;
LABEL_25:
  v20 = 2654435761 * self->_mrdcLteTotalNumCcs;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
LABEL_26:
    v5 = 2654435761 * self->_mrdcLteTotalDlMimoLayers;
    goto LABEL_31;
  }
LABEL_30:
  v5 = 0;
LABEL_31:
  v6 = -[BandCombo hash](self->_mrdcLteBandCombo, "hash", v20);
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x8000) != 0)
  {
    v8 = 2654435761 * self->_mrdcNrTotalNumCcs;
    if ((*(_WORD *)&v7 & 0x4000) != 0)
      goto LABEL_33;
  }
  else
  {
    v8 = 0;
    if ((*(_WORD *)&v7 & 0x4000) != 0)
    {
LABEL_33:
      v9 = 2654435761 * self->_mrdcNrTotalDlMimoLayers;
      goto LABEL_36;
    }
  }
  v9 = 0;
LABEL_36:
  v10 = -[BandCombo hash](self->_mrdcNrBandCombo, "hash");
  v11 = (unint64_t)-[NSMutableArray hash](self->_nwUeCapStats, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    v12 = 2654435761 * self->_numSubs;
  else
    v12 = 0;
  v13 = (unint64_t)-[NSData hash](self->_plmn, "hash");
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x100000) != 0)
  {
    v15 = 2654435761 * self->_subsId;
    if ((*(_DWORD *)&v14 & 0x80000) != 0)
    {
LABEL_41:
      v16 = 2654435761 * self->_psPref;
      if ((*(_BYTE *)&v14 & 2) != 0)
        goto LABEL_42;
LABEL_46:
      v17 = 0;
      if ((*(_BYTE *)&v14 & 4) != 0)
        goto LABEL_43;
LABEL_47:
      v18 = 0;
      return v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v23 ^ v22 ^ v21 ^ v5 ^ v24 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16 ^ v17 ^ v18;
    }
  }
  else
  {
    v15 = 0;
    if ((*(_DWORD *)&v14 & 0x80000) != 0)
      goto LABEL_41;
  }
  v16 = 0;
  if ((*(_BYTE *)&v14 & 2) == 0)
    goto LABEL_46;
LABEL_42:
  v17 = 2654435761 * self->_cause;
  if ((*(_BYTE *)&v14 & 4) == 0)
    goto LABEL_47;
LABEL_43:
  v18 = 2654435761 * self->_connDuration;
  return v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v23 ^ v22 ^ v21 ^ v5 ^ v24 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  int v6;
  BandCombo *lteBandCombo;
  uint64_t v8;
  int v9;
  BandCombo *mrdcLteBandCombo;
  uint64_t v11;
  int v12;
  BandCombo *mrdcNrBandCombo;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  v5 = v4;
  v6 = *((_DWORD *)v4 + 36);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v6 = *((_DWORD *)v4 + 36);
    if ((v6 & 8) == 0)
    {
LABEL_3:
      if ((v6 & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  v6 = *((_DWORD *)v4 + 36);
  if ((v6 & 0x800) == 0)
  {
LABEL_4:
    if ((v6 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  self->_maxUlMod = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x800u;
  v6 = *((_DWORD *)v4 + 36);
  if ((v6 & 0x40) == 0)
  {
LABEL_5:
    if ((v6 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  self->_maxDlMod = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x40u;
  v6 = *((_DWORD *)v4 + 36);
  if ((v6 & 0x80) == 0)
  {
LABEL_6:
    if ((v6 & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  self->_maxNwMimoLyr = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x80u;
  v6 = *((_DWORD *)v4 + 36);
  if ((v6 & 0x400) == 0)
  {
LABEL_7:
    if ((v6 & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  self->_maxUeRank = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x400u;
  v6 = *((_DWORD *)v4 + 36);
  if ((v6 & 0x100) == 0)
  {
LABEL_8:
    if ((v6 & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  self->_maxRxAnt = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x100u;
  v6 = *((_DWORD *)v4 + 36);
  if ((v6 & 0x200) == 0)
  {
LABEL_9:
    if ((v6 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  self->_maxSchdMimoLyr = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x200u;
  v6 = *((_DWORD *)v4 + 36);
  if ((v6 & 0x20) == 0)
  {
LABEL_10:
    if ((v6 & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_23:
  self->_lteTotalNumCcs = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x20u;
  if ((*((_DWORD *)v4 + 36) & 0x10) != 0)
  {
LABEL_11:
    self->_lteTotalDlMimoLayers = *((_DWORD *)v4 + 10);
    *(_DWORD *)&self->_has |= 0x10u;
  }
LABEL_12:
  lteBandCombo = self->_lteBandCombo;
  v8 = *((_QWORD *)v5 + 4);
  if (lteBandCombo)
  {
    if (v8)
      -[BandCombo mergeFrom:](lteBandCombo, "mergeFrom:");
  }
  else if (v8)
  {
    -[CellularLteConnectionStats setLteBandCombo:](self, "setLteBandCombo:");
  }
  v9 = *((_DWORD *)v5 + 36);
  if ((v9 & 0x20000) != 0)
  {
    self->_mrdcTotalNumCcs = *((_DWORD *)v5 + 27);
    *(_DWORD *)&self->_has |= 0x20000u;
    v9 = *((_DWORD *)v5 + 36);
    if ((v9 & 0x10000) == 0)
    {
LABEL_29:
      if ((v9 & 0x2000) == 0)
        goto LABEL_30;
      goto LABEL_37;
    }
  }
  else if ((v9 & 0x10000) == 0)
  {
    goto LABEL_29;
  }
  self->_mrdcTotalDlMimoLayers = *((_DWORD *)v5 + 26);
  *(_DWORD *)&self->_has |= 0x10000u;
  v9 = *((_DWORD *)v5 + 36);
  if ((v9 & 0x2000) == 0)
  {
LABEL_30:
    if ((v9 & 0x1000) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_37:
  self->_mrdcLteTotalNumCcs = *((_DWORD *)v5 + 21);
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((*((_DWORD *)v5 + 36) & 0x1000) != 0)
  {
LABEL_31:
    self->_mrdcLteTotalDlMimoLayers = *((_DWORD *)v5 + 20);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_32:
  mrdcLteBandCombo = self->_mrdcLteBandCombo;
  v11 = *((_QWORD *)v5 + 9);
  if (mrdcLteBandCombo)
  {
    if (v11)
      -[BandCombo mergeFrom:](mrdcLteBandCombo, "mergeFrom:");
  }
  else if (v11)
  {
    -[CellularLteConnectionStats setMrdcLteBandCombo:](self, "setMrdcLteBandCombo:");
  }
  v12 = *((_DWORD *)v5 + 36);
  if ((v12 & 0x8000) != 0)
  {
    self->_mrdcNrTotalNumCcs = *((_DWORD *)v5 + 25);
    *(_DWORD *)&self->_has |= 0x8000u;
    v12 = *((_DWORD *)v5 + 36);
  }
  if ((v12 & 0x4000) != 0)
  {
    self->_mrdcNrTotalDlMimoLayers = *((_DWORD *)v5 + 24);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
  mrdcNrBandCombo = self->_mrdcNrBandCombo;
  v14 = *((_QWORD *)v5 + 11);
  if (mrdcNrBandCombo)
  {
    if (v14)
      -[BandCombo mergeFrom:](mrdcNrBandCombo, "mergeFrom:");
  }
  else if (v14)
  {
    -[CellularLteConnectionStats setMrdcNrBandCombo:](self, "setMrdcNrBandCombo:");
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = *((id *)v5 + 15);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        -[CellularLteConnectionStats addNwUeCapStat:](self, "addNwUeCapStat:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), (_QWORD)v21);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v17);
  }

  if ((*((_BYTE *)v5 + 146) & 4) != 0)
  {
    self->_numSubs = *((_DWORD *)v5 + 28);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
  if (*((_QWORD *)v5 + 16))
    -[CellularLteConnectionStats setPlmn:](self, "setPlmn:");
  v20 = *((_DWORD *)v5 + 36);
  if ((v20 & 0x100000) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 35);
    *(_DWORD *)&self->_has |= 0x100000u;
    v20 = *((_DWORD *)v5 + 36);
    if ((v20 & 0x80000) == 0)
    {
LABEL_63:
      if ((v20 & 2) == 0)
        goto LABEL_64;
LABEL_69:
      self->_cause = *((_DWORD *)v5 + 4);
      *(_DWORD *)&self->_has |= 2u;
      if ((*((_DWORD *)v5 + 36) & 4) == 0)
        goto LABEL_66;
      goto LABEL_65;
    }
  }
  else if ((v20 & 0x80000) == 0)
  {
    goto LABEL_63;
  }
  self->_psPref = *((_DWORD *)v5 + 34);
  *(_DWORD *)&self->_has |= 0x80000u;
  v20 = *((_DWORD *)v5 + 36);
  if ((v20 & 2) != 0)
    goto LABEL_69;
LABEL_64:
  if ((v20 & 4) != 0)
  {
LABEL_65:
    self->_connDuration = *((_DWORD *)v5 + 5);
    *(_DWORD *)&self->_has |= 4u;
  }
LABEL_66:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)duration
{
  return self->_duration;
}

- (unsigned)maxNwMimoLyr
{
  return self->_maxNwMimoLyr;
}

- (unsigned)maxUeRank
{
  return self->_maxUeRank;
}

- (unsigned)maxRxAnt
{
  return self->_maxRxAnt;
}

- (unsigned)maxSchdMimoLyr
{
  return self->_maxSchdMimoLyr;
}

- (unsigned)lteTotalNumCcs
{
  return self->_lteTotalNumCcs;
}

- (unsigned)lteTotalDlMimoLayers
{
  return self->_lteTotalDlMimoLayers;
}

- (BandCombo)lteBandCombo
{
  return self->_lteBandCombo;
}

- (void)setLteBandCombo:(id)a3
{
  objc_storeStrong((id *)&self->_lteBandCombo, a3);
}

- (unsigned)mrdcTotalNumCcs
{
  return self->_mrdcTotalNumCcs;
}

- (unsigned)mrdcTotalDlMimoLayers
{
  return self->_mrdcTotalDlMimoLayers;
}

- (unsigned)mrdcLteTotalNumCcs
{
  return self->_mrdcLteTotalNumCcs;
}

- (unsigned)mrdcLteTotalDlMimoLayers
{
  return self->_mrdcLteTotalDlMimoLayers;
}

- (BandCombo)mrdcLteBandCombo
{
  return self->_mrdcLteBandCombo;
}

- (void)setMrdcLteBandCombo:(id)a3
{
  objc_storeStrong((id *)&self->_mrdcLteBandCombo, a3);
}

- (unsigned)mrdcNrTotalNumCcs
{
  return self->_mrdcNrTotalNumCcs;
}

- (unsigned)mrdcNrTotalDlMimoLayers
{
  return self->_mrdcNrTotalDlMimoLayers;
}

- (BandCombo)mrdcNrBandCombo
{
  return self->_mrdcNrBandCombo;
}

- (void)setMrdcNrBandCombo:(id)a3
{
  objc_storeStrong((id *)&self->_mrdcNrBandCombo, a3);
}

- (NSMutableArray)nwUeCapStats
{
  return self->_nwUeCapStats;
}

- (void)setNwUeCapStats:(id)a3
{
  objc_storeStrong((id *)&self->_nwUeCapStats, a3);
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (NSData)plmn
{
  return self->_plmn;
}

- (void)setPlmn:(id)a3
{
  objc_storeStrong((id *)&self->_plmn, a3);
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (unsigned)connDuration
{
  return self->_connDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plmn, 0);
  objc_storeStrong((id *)&self->_nwUeCapStats, 0);
  objc_storeStrong((id *)&self->_mrdcNrBandCombo, 0);
  objc_storeStrong((id *)&self->_mrdcLteBandCombo, 0);
  objc_storeStrong((id *)&self->_lteBandCombo, 0);
}

@end
