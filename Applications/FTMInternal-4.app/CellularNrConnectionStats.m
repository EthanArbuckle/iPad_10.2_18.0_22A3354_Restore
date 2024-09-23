@implementation CellularNrConnectionStats

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDuration
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
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
    return *(&off_10025FD90 + a3);
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
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
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
    return *(&off_10025FD90 + a3);
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

- (int)connectionType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_connectionType;
  else
    return 0;
}

- (void)setConnectionType:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasConnectionType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)connectionTypeAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025FDC8 + a3);
}

- (int)StringAsConnectionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_MAC_QSH_METRIC_CONNECTION_SA")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_MAC_QSH_METRIC_CONNECTION_NSA")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_MAC_QSH_METRIC_CONNECTION_MAX")))
  {
    v4 = 2;
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
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
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
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
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
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
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
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasMaxSchdMimoLyr
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setDurationOfConn:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_durationOfConn = a3;
}

- (void)setHasDurationOfConn:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDurationOfConn
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasBwpSwitch:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_hasBwpSwitch = a3;
}

- (void)setHasHasBwpSwitch:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasHasBwpSwitch
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setNr5gTotalNumCcs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_nr5gTotalNumCcs = a3;
}

- (void)setHasNr5gTotalNumCcs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasNr5gTotalNumCcs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setNr5gTotalDlMimoLayers:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_nr5gTotalDlMimoLayers = a3;
}

- (void)setHasNr5gTotalDlMimoLayers:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasNr5gTotalDlMimoLayers
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasNr5gBandCombo
{
  return self->_nr5gBandCombo != 0;
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
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasNumSubs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSubsId
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasPsPref
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
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
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCause
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)causeAsString:(int)a3
{
  if (a3 >= 5)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025FDE0 + a3);
}

- (int)StringAsCause:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONN_INFO_FLUSH_REASON_RELEASE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONN_INFO_FLUSH_REASON_HO")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONN_INFO_FLUSH_REASON_OTHER1")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONN_INFO_FLUSH_REASON_MAX")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CONN_INFO_FLUSH_REASON_MAX_STATS")))
  {
    v4 = 4;
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
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
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
  v8.super_class = (Class)CellularNrConnectionStats;
  v3 = -[CellularNrConnectionStats description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularNrConnectionStats dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $BA2926CC5996097E6E8D4FEAFF59E913 has;
  void *v5;
  BandCombo *nr5gBandCombo;
  void *v7;
  id v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  NSData *plmn;
  $BA2926CC5996097E6E8D4FEAFF59E913 v17;
  void *v18;
  void *v20;
  void *v21;
  uint64_t maxUlMod;
  void *v23;
  void *v24;
  void *v25;
  uint64_t cause;
  void *v27;
  uint64_t maxDlMod;
  void *v29;
  uint64_t connectionType;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("timestamp"));

    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_38;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_duration));
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("duration"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_46;
  }
LABEL_38:
  maxUlMod = self->_maxUlMod;
  if (maxUlMod >= 7)
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_maxUlMod));
  else
    v23 = *(&off_10025FD90 + maxUlMod);
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("max_ul_mod"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_53;
  }
LABEL_46:
  maxDlMod = self->_maxDlMod;
  if (maxDlMod >= 7)
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_maxDlMod));
  else
    v29 = *(&off_10025FD90 + maxDlMod);
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("max_dl_mod"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_57;
  }
LABEL_53:
  connectionType = self->_connectionType;
  if (connectionType >= 3)
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_connectionType));
  else
    v31 = *(&off_10025FDC8 + connectionType);
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("connection_type"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_58;
  }
LABEL_57:
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_maxNwMimoLyr));
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("max_nw_mimo_lyr"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_59;
  }
LABEL_58:
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_maxUeRank));
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("max_ue_rank"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_60;
  }
LABEL_59:
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_maxRxAnt));
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("max_rx_ant"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_61;
  }
LABEL_60:
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_maxSchdMimoLyr));
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("max_schd_mimo_lyr"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_12;
    goto LABEL_62;
  }
LABEL_61:
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_durationOfConn));
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("duration_of_conn"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_63;
  }
LABEL_62:
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_hasBwpSwitch));
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("has_bwp_switch"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_63:
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nr5gTotalNumCcs));
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("nr5g_total_num_ccs"));

  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_14:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nr5gTotalDlMimoLayers));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("nr5g_total_dl_mimo_layers"));

  }
LABEL_15:
  nr5gBandCombo = self->_nr5gBandCombo;
  if (nr5gBandCombo)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BandCombo dictionaryRepresentation](nr5gBandCombo, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("nr5g_band_combo"));

  }
  if (-[NSMutableArray count](self->_nwUeCapStats, "count"))
  {
    v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_nwUeCapStats, "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v9 = self->_nwUeCapStats;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("nw_ue_cap_stat"));
  }
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("num_subs"));

  }
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x10000) != 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("subs_id"));

    v17 = self->_has;
    if ((*(_WORD *)&v17 & 0x8000) == 0)
    {
LABEL_32:
      if ((*(_BYTE *)&v17 & 2) == 0)
        goto LABEL_33;
LABEL_42:
      cause = self->_cause;
      if (cause >= 5)
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_cause));
      else
        v27 = *(&off_10025FDE0 + cause);
      objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("cause"));

      if ((*(_DWORD *)&self->_has & 4) != 0)
        goto LABEL_34;
      return v3;
    }
  }
  else if ((*(_WORD *)&v17 & 0x8000) == 0)
  {
    goto LABEL_32;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("ps_pref"));

  v17 = self->_has;
  if ((*(_BYTE *)&v17 & 2) != 0)
    goto LABEL_42;
LABEL_33:
  if ((*(_BYTE *)&v17 & 4) != 0)
  {
LABEL_34:
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_connDuration));
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("conn_duration"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100109A74((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  $BA2926CC5996097E6E8D4FEAFF59E913 has;
  BandCombo *nr5gBandCombo;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSData *plmn;
  $BA2926CC5996097E6E8D4FEAFF59E913 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = v4;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_36;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
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
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt32Field(v5, self->_maxUlMod, 3);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt32Field(v5, self->_maxDlMod, 4);
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteInt32Field(v5, self->_connectionType, 5);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field(v5, self->_maxNwMimoLyr, 6);
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field(v5, self->_maxUeRank, 7);
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field(v5, self->_maxRxAnt, 8);
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field(v5, self->_maxSchdMimoLyr, 9);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_12;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field(v5, self->_durationOfConn, 10);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteBOOLField(v5, self->_hasBwpSwitch, 11);
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_45:
  PBDataWriterWriteUint32Field(v5, self->_nr5gTotalNumCcs, 12);
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
LABEL_14:
    PBDataWriterWriteUint32Field(v5, self->_nr5gTotalDlMimoLayers, 13);
LABEL_15:
  nr5gBandCombo = self->_nr5gBandCombo;
  if (nr5gBandCombo)
    PBDataWriterWriteSubmessage(v5, nr5gBandCombo, 14);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_nwUeCapStats;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12), 15);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    PBDataWriterWriteUint32Field(v5, self->_numSubs, 16);
  plmn = self->_plmn;
  if (plmn)
    PBDataWriterWriteDataField(v5, plmn, 17);
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x10000) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_subsId, 18);
    v14 = self->_has;
    if ((*(_WORD *)&v14 & 0x8000) == 0)
    {
LABEL_30:
      if ((*(_BYTE *)&v14 & 2) == 0)
        goto LABEL_31;
LABEL_49:
      PBDataWriterWriteInt32Field(v5, self->_cause, 20);
      if ((*(_DWORD *)&self->_has & 4) == 0)
        goto LABEL_33;
      goto LABEL_32;
    }
  }
  else if ((*(_WORD *)&v14 & 0x8000) == 0)
  {
    goto LABEL_30;
  }
  PBDataWriterWriteUint32Field(v5, self->_psPref, 19);
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 2) != 0)
    goto LABEL_49;
LABEL_31:
  if ((*(_BYTE *)&v14 & 4) != 0)
LABEL_32:
    PBDataWriterWriteUint32Field(v5, self->_connDuration, 21);
LABEL_33:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $BA2926CC5996097E6E8D4FEAFF59E913 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  _DWORD *v10;
  $BA2926CC5996097E6E8D4FEAFF59E913 v11;
  _DWORD *v12;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 29) |= 1u;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_33;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 7) = self->_duration;
  *((_DWORD *)v4 + 29) |= 0x10u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 14) = self->_maxUlMod;
  *((_DWORD *)v4 + 29) |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 9) = self->_maxDlMod;
  *((_DWORD *)v4 + 29) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 6) = self->_connectionType;
  *((_DWORD *)v4 + 29) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 10) = self->_maxNwMimoLyr;
  *((_DWORD *)v4 + 29) |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 13) = self->_maxUeRank;
  *((_DWORD *)v4 + 29) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 11) = self->_maxRxAnt;
  *((_DWORD *)v4 + 29) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 12) = self->_maxSchdMimoLyr;
  *((_DWORD *)v4 + 29) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_12;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 8) = self->_durationOfConn;
  *((_DWORD *)v4 + 29) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_41:
  *((_BYTE *)v4 + 112) = self->_hasBwpSwitch;
  *((_DWORD *)v4 + 29) |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_42:
  *((_DWORD *)v4 + 19) = self->_nr5gTotalNumCcs;
  *((_DWORD *)v4 + 29) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_14:
    *((_DWORD *)v4 + 18) = self->_nr5gTotalDlMimoLayers;
    *((_DWORD *)v4 + 29) |= 0x1000u;
  }
LABEL_15:
  v12 = v4;
  if (self->_nr5gBandCombo)
    objc_msgSend(v4, "setNr5gBandCombo:");
  if (-[CellularNrConnectionStats nwUeCapStatsCount](self, "nwUeCapStatsCount"))
  {
    objc_msgSend(v12, "clearNwUeCapStats");
    v6 = -[CellularNrConnectionStats nwUeCapStatsCount](self, "nwUeCapStatsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CellularNrConnectionStats nwUeCapStatAtIndex:](self, "nwUeCapStatAtIndex:", i));
        objc_msgSend(v12, "addNwUeCapStat:", v9);

      }
    }
  }
  v10 = v12;
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    v12[20] = self->_numSubs;
    v12[29] |= 0x4000u;
  }
  if (self->_plmn)
  {
    objc_msgSend(v12, "setPlmn:");
    v10 = v12;
  }
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x10000) != 0)
  {
    v10[27] = self->_subsId;
    v10[29] |= 0x10000u;
    v11 = self->_has;
    if ((*(_WORD *)&v11 & 0x8000) == 0)
    {
LABEL_27:
      if ((*(_BYTE *)&v11 & 2) == 0)
        goto LABEL_28;
LABEL_46:
      v10[4] = self->_cause;
      v10[29] |= 2u;
      if ((*(_DWORD *)&self->_has & 4) == 0)
        goto LABEL_30;
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&v11 & 0x8000) == 0)
  {
    goto LABEL_27;
  }
  v10[26] = self->_psPref;
  v10[29] |= 0x8000u;
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 2) != 0)
    goto LABEL_46;
LABEL_28:
  if ((*(_BYTE *)&v11 & 4) != 0)
  {
LABEL_29:
    v10[5] = self->_connDuration;
    v10[29] |= 4u;
  }
LABEL_30:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  $BA2926CC5996097E6E8D4FEAFF59E913 has;
  id v8;
  void *v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  $BA2926CC5996097E6E8D4FEAFF59E913 v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_DWORD *)v5 + 29) |= 1u;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_32;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 7) = self->_duration;
  *((_DWORD *)v5 + 29) |= 0x10u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v5 + 14) = self->_maxUlMod;
  *((_DWORD *)v5 + 29) |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v5 + 9) = self->_maxDlMod;
  *((_DWORD *)v5 + 29) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v5 + 6) = self->_connectionType;
  *((_DWORD *)v5 + 29) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v5 + 10) = self->_maxNwMimoLyr;
  *((_DWORD *)v5 + 29) |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v5 + 13) = self->_maxUeRank;
  *((_DWORD *)v5 + 29) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v5 + 11) = self->_maxRxAnt;
  *((_DWORD *)v5 + 29) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v5 + 12) = self->_maxSchdMimoLyr;
  *((_DWORD *)v5 + 29) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_12;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v5 + 8) = self->_durationOfConn;
  *((_DWORD *)v5 + 29) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_41;
  }
LABEL_40:
  *((_BYTE *)v5 + 112) = self->_hasBwpSwitch;
  *((_DWORD *)v5 + 29) |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_41:
  *((_DWORD *)v5 + 19) = self->_nr5gTotalNumCcs;
  *((_DWORD *)v5 + 29) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_14:
    *((_DWORD *)v5 + 18) = self->_nr5gTotalDlMimoLayers;
    *((_DWORD *)v5 + 29) |= 0x1000u;
  }
LABEL_15:
  v8 = -[BandCombo copyWithZone:](self->_nr5gBandCombo, "copyWithZone:", a3);
  v9 = (void *)v6[8];
  v6[8] = v8;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = self->_nwUeCapStats;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v14), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend(v6, "addNwUeCapStat:", v15);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    *((_DWORD *)v6 + 20) = self->_numSubs;
    *((_DWORD *)v6 + 29) |= 0x4000u;
  }
  v16 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3, (_QWORD)v20);
  v17 = (void *)v6[12];
  v6[12] = v16;

  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x10000) != 0)
  {
    *((_DWORD *)v6 + 27) = self->_subsId;
    *((_DWORD *)v6 + 29) |= 0x10000u;
    v18 = self->_has;
    if ((*(_WORD *)&v18 & 0x8000) == 0)
    {
LABEL_26:
      if ((*(_BYTE *)&v18 & 2) == 0)
        goto LABEL_27;
LABEL_45:
      *((_DWORD *)v6 + 4) = self->_cause;
      *((_DWORD *)v6 + 29) |= 2u;
      if ((*(_DWORD *)&self->_has & 4) == 0)
        return v6;
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&v18 & 0x8000) == 0)
  {
    goto LABEL_26;
  }
  *((_DWORD *)v6 + 26) = self->_psPref;
  *((_DWORD *)v6 + 29) |= 0x8000u;
  v18 = self->_has;
  if ((*(_BYTE *)&v18 & 2) != 0)
    goto LABEL_45;
LABEL_27:
  if ((*(_BYTE *)&v18 & 4) != 0)
  {
LABEL_28:
    *((_DWORD *)v6 + 5) = self->_connDuration;
    *((_DWORD *)v6 + 29) |= 4u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  $BA2926CC5996097E6E8D4FEAFF59E913 has;
  int v7;
  BandCombo *nr5gBandCombo;
  NSMutableArray *nwUeCapStats;
  $BA2926CC5996097E6E8D4FEAFF59E913 v10;
  int v11;
  NSData *plmn;
  int v13;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_102;
  has = self->_has;
  v7 = *((_DWORD *)v4 + 29);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_102;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_duration != *((_DWORD *)v4 + 7))
      goto LABEL_102;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_maxUlMod != *((_DWORD *)v4 + 14))
      goto LABEL_102;
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_maxDlMod != *((_DWORD *)v4 + 9))
      goto LABEL_102;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_connectionType != *((_DWORD *)v4 + 6))
      goto LABEL_102;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_maxNwMimoLyr != *((_DWORD *)v4 + 10))
      goto LABEL_102;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_maxUeRank != *((_DWORD *)v4 + 13))
      goto LABEL_102;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_maxRxAnt != *((_DWORD *)v4 + 11))
      goto LABEL_102;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_maxSchdMimoLyr != *((_DWORD *)v4 + 12))
      goto LABEL_102;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_durationOfConn != *((_DWORD *)v4 + 8))
      goto LABEL_102;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0)
      goto LABEL_102;
    if (self->_hasBwpSwitch)
    {
      if (!*((_BYTE *)v4 + 112))
        goto LABEL_102;
    }
    else if (*((_BYTE *)v4 + 112))
    {
      goto LABEL_102;
    }
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_nr5gTotalNumCcs != *((_DWORD *)v4 + 19))
      goto LABEL_102;
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_nr5gTotalDlMimoLayers != *((_DWORD *)v4 + 18))
      goto LABEL_102;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_102;
  }
  nr5gBandCombo = self->_nr5gBandCombo;
  if ((unint64_t)nr5gBandCombo | *((_QWORD *)v4 + 8) && !-[BandCombo isEqual:](nr5gBandCombo, "isEqual:"))
    goto LABEL_102;
  nwUeCapStats = self->_nwUeCapStats;
  if ((unint64_t)nwUeCapStats | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](nwUeCapStats, "isEqual:"))
      goto LABEL_102;
  }
  v10 = self->_has;
  v11 = *((_DWORD *)v4 + 29);
  if ((*(_WORD *)&v10 & 0x4000) != 0)
  {
    if ((v11 & 0x4000) == 0 || self->_numSubs != *((_DWORD *)v4 + 20))
      goto LABEL_102;
  }
  else if ((v11 & 0x4000) != 0)
  {
    goto LABEL_102;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 12))
  {
    if (-[NSData isEqual:](plmn, "isEqual:"))
    {
      v10 = self->_has;
      goto LABEL_82;
    }
LABEL_102:
    v14 = 0;
    goto LABEL_103;
  }
LABEL_82:
  v13 = *((_DWORD *)v4 + 29);
  if ((*(_DWORD *)&v10 & 0x10000) != 0)
  {
    if ((v13 & 0x10000) == 0 || self->_subsId != *((_DWORD *)v4 + 27))
      goto LABEL_102;
  }
  else if ((v13 & 0x10000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&v10 & 0x8000) != 0)
  {
    if ((v13 & 0x8000) == 0 || self->_psPref != *((_DWORD *)v4 + 26))
      goto LABEL_102;
  }
  else if ((v13 & 0x8000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&v10 & 2) != 0)
  {
    if ((v13 & 2) == 0 || self->_cause != *((_DWORD *)v4 + 4))
      goto LABEL_102;
  }
  else if ((v13 & 2) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&v10 & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_connDuration != *((_DWORD *)v4 + 5))
      goto LABEL_102;
    v14 = 1;
  }
  else
  {
    v14 = (*((_DWORD *)v4 + 29) & 4) == 0;
  }
LABEL_103:

  return v14;
}

- (unint64_t)hash
{
  $BA2926CC5996097E6E8D4FEAFF59E913 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  $BA2926CC5996097E6E8D4FEAFF59E913 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v26 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
LABEL_3:
      v25 = 2654435761 * self->_duration;
      if ((*(_WORD *)&has & 0x800) != 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else
  {
    v26 = 0;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_3;
  }
  v25 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_4:
    v24 = 2654435761 * self->_maxUlMod;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  v24 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_5:
    v23 = 2654435761 * self->_maxDlMod;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  v23 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_6:
    v22 = 2654435761 * self->_connectionType;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  v22 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_7:
    v21 = 2654435761 * self->_maxNwMimoLyr;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  v21 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_8:
    v20 = 2654435761 * self->_maxUeRank;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  v20 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_9:
    v19 = 2654435761 * self->_maxRxAnt;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  v19 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_10:
    v18 = 2654435761 * self->_maxSchdMimoLyr;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  v18 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_11:
    v4 = 2654435761 * self->_durationOfConn;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  v4 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_12:
    v5 = 2654435761 * self->_hasBwpSwitch;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_13;
LABEL_26:
    v6 = 0;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_14;
    goto LABEL_27;
  }
LABEL_25:
  v5 = 0;
  if ((*(_WORD *)&has & 0x2000) == 0)
    goto LABEL_26;
LABEL_13:
  v6 = 2654435761 * self->_nr5gTotalNumCcs;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_14:
    v7 = 2654435761 * self->_nr5gTotalDlMimoLayers;
    goto LABEL_28;
  }
LABEL_27:
  v7 = 0;
LABEL_28:
  v8 = -[BandCombo hash](self->_nr5gBandCombo, "hash");
  v9 = (unint64_t)-[NSMutableArray hash](self->_nwUeCapStats, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    v10 = 2654435761 * self->_numSubs;
  else
    v10 = 0;
  v11 = (unint64_t)-[NSData hash](self->_plmn, "hash");
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x10000) != 0)
  {
    v13 = 2654435761 * self->_subsId;
    if ((*(_WORD *)&v12 & 0x8000) != 0)
    {
LABEL_33:
      v14 = 2654435761 * self->_psPref;
      if ((*(_BYTE *)&v12 & 2) != 0)
        goto LABEL_34;
LABEL_38:
      v15 = 0;
      if ((*(_BYTE *)&v12 & 4) != 0)
        goto LABEL_35;
LABEL_39:
      v16 = 0;
      return v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
    }
  }
  else
  {
    v13 = 0;
    if ((*(_WORD *)&v12 & 0x8000) != 0)
      goto LABEL_33;
  }
  v14 = 0;
  if ((*(_BYTE *)&v12 & 2) == 0)
    goto LABEL_38;
LABEL_34:
  v15 = 2654435761 * self->_cause;
  if ((*(_BYTE *)&v12 & 4) == 0)
    goto LABEL_39;
LABEL_35:
  v16 = 2654435761 * self->_connDuration;
  return v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  int v6;
  BandCombo *nr5gBandCombo;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = v4;
  v6 = *((_DWORD *)v4 + 29);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v6 = *((_DWORD *)v4 + 29);
    if ((v6 & 0x10) == 0)
    {
LABEL_3:
      if ((v6 & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  v6 = *((_DWORD *)v4 + 29);
  if ((v6 & 0x800) == 0)
  {
LABEL_4:
    if ((v6 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  self->_maxUlMod = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
  v6 = *((_DWORD *)v4 + 29);
  if ((v6 & 0x40) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  self->_maxDlMod = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  v6 = *((_DWORD *)v4 + 29);
  if ((v6 & 8) == 0)
  {
LABEL_6:
    if ((v6 & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  self->_connectionType = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  v6 = *((_DWORD *)v4 + 29);
  if ((v6 & 0x80) == 0)
  {
LABEL_7:
    if ((v6 & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  self->_maxNwMimoLyr = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  v6 = *((_DWORD *)v4 + 29);
  if ((v6 & 0x400) == 0)
  {
LABEL_8:
    if ((v6 & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  self->_maxUeRank = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x400u;
  v6 = *((_DWORD *)v4 + 29);
  if ((v6 & 0x100) == 0)
  {
LABEL_9:
    if ((v6 & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  self->_maxRxAnt = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  v6 = *((_DWORD *)v4 + 29);
  if ((v6 & 0x200) == 0)
  {
LABEL_10:
    if ((v6 & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  self->_maxSchdMimoLyr = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  v6 = *((_DWORD *)v4 + 29);
  if ((v6 & 0x20) == 0)
  {
LABEL_11:
    if ((v6 & 0x20000) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  self->_durationOfConn = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  v6 = *((_DWORD *)v4 + 29);
  if ((v6 & 0x20000) == 0)
  {
LABEL_12:
    if ((v6 & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  self->_hasBwpSwitch = *((_BYTE *)v4 + 112);
  *(_DWORD *)&self->_has |= 0x20000u;
  v6 = *((_DWORD *)v4 + 29);
  if ((v6 & 0x2000) == 0)
  {
LABEL_13:
    if ((v6 & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_29:
  self->_nr5gTotalNumCcs = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((*((_DWORD *)v4 + 29) & 0x1000) != 0)
  {
LABEL_14:
    self->_nr5gTotalDlMimoLayers = *((_DWORD *)v4 + 18);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_15:
  nr5gBandCombo = self->_nr5gBandCombo;
  v8 = *((_QWORD *)v5 + 8);
  if (nr5gBandCombo)
  {
    if (v8)
      -[BandCombo mergeFrom:](nr5gBandCombo, "mergeFrom:");
  }
  else if (v8)
  {
    -[CellularNrConnectionStats setNr5gBandCombo:](self, "setNr5gBandCombo:");
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = *((id *)v5 + 11);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        -[CellularNrConnectionStats addNwUeCapStat:](self, "addNwUeCapStat:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), (_QWORD)v15);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  if ((*((_BYTE *)v5 + 117) & 0x40) != 0)
  {
    self->_numSubs = *((_DWORD *)v5 + 20);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
  if (*((_QWORD *)v5 + 12))
    -[CellularNrConnectionStats setPlmn:](self, "setPlmn:");
  v14 = *((_DWORD *)v5 + 29);
  if ((v14 & 0x10000) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 27);
    *(_DWORD *)&self->_has |= 0x10000u;
    v14 = *((_DWORD *)v5 + 29);
    if ((v14 & 0x8000) == 0)
    {
LABEL_46:
      if ((v14 & 2) == 0)
        goto LABEL_47;
LABEL_52:
      self->_cause = *((_DWORD *)v5 + 4);
      *(_DWORD *)&self->_has |= 2u;
      if ((*((_DWORD *)v5 + 29) & 4) == 0)
        goto LABEL_49;
      goto LABEL_48;
    }
  }
  else if ((v14 & 0x8000) == 0)
  {
    goto LABEL_46;
  }
  self->_psPref = *((_DWORD *)v5 + 26);
  *(_DWORD *)&self->_has |= 0x8000u;
  v14 = *((_DWORD *)v5 + 29);
  if ((v14 & 2) != 0)
    goto LABEL_52;
LABEL_47:
  if ((v14 & 4) != 0)
  {
LABEL_48:
    self->_connDuration = *((_DWORD *)v5 + 5);
    *(_DWORD *)&self->_has |= 4u;
  }
LABEL_49:

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

- (unsigned)durationOfConn
{
  return self->_durationOfConn;
}

- (BOOL)hasBwpSwitch
{
  return self->_hasBwpSwitch;
}

- (unsigned)nr5gTotalNumCcs
{
  return self->_nr5gTotalNumCcs;
}

- (unsigned)nr5gTotalDlMimoLayers
{
  return self->_nr5gTotalDlMimoLayers;
}

- (BandCombo)nr5gBandCombo
{
  return self->_nr5gBandCombo;
}

- (void)setNr5gBandCombo:(id)a3
{
  objc_storeStrong((id *)&self->_nr5gBandCombo, a3);
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
  objc_storeStrong((id *)&self->_nr5gBandCombo, 0);
}

@end
