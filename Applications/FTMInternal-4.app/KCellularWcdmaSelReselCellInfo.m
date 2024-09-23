@implementation KCellularWcdmaSelReselCellInfo

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear(&self->_multiBandInfos, a2);
  v3.receiver = self;
  v3.super_class = (Class)KCellularWcdmaSelReselCellInfo;
  -[KCellularWcdmaSelReselCellInfo dealloc](&v3, "dealloc");
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHsdpaCapable:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_hsdpaCapable = a3;
}

- (void)setHasHsdpaCapable:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasHsdpaCapable
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setEdchCapable:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_edchCapable = a3;
}

- (void)setHasEdchCapable:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasEdchCapable
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (int)duplexMode
{
  if ((*(_WORD *)&self->_has & 4) != 0)
    return self->_duplexMode;
  else
    return 0;
}

- (void)setDuplexMode:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_duplexMode = a3;
}

- (void)setHasDuplexMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDuplexMode
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)duplexModeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("FDD");
  if (a3 == 1)
    v3 = CFSTR("TDD");
  else
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsDuplexMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FDD")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("TDD"));

  return v4;
}

- (unint64_t)multiBandInfosCount
{
  return self->_multiBandInfos.count;
}

- (unsigned)multiBandInfos
{
  return self->_multiBandInfos.list;
}

- (void)clearMultiBandInfos
{
  PBRepeatedUInt32Clear(&self->_multiBandInfos, a2);
}

- (void)addMultiBandInfo:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_multiBandInfos, *(_QWORD *)&a3);
}

- (unsigned)multiBandInfoAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_multiBandInfos;
  unint64_t count;
  void *v6;
  void *v7;

  p_multiBandInfos = &self->_multiBandInfos;
  count = self->_multiBandInfos.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_multiBandInfos->list[a3];
}

- (void)setMultiBandInfos:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_multiBandInfos, a3, a4);
}

- (void)setImsEmergencySupport:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_imsEmergencySupport = a3;
}

- (void)setHasImsEmergencySupport:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasImsEmergencySupport
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setCellBarred:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_cellBarred = a3;
}

- (void)setHasCellBarred:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCellBarred
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setFachMeasOccInfoPresent:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_fachMeasOccInfoPresent = a3;
}

- (void)setHasFachMeasOccInfoPresent:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasFachMeasOccInfoPresent
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSRxlev:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_sRxlev = a3;
}

- (void)setHasSRxlev:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSRxlev
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setSQual:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_sQual = a3;
}

- (void)setHasSQual:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSQual
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setSIntrasearch:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_sIntrasearch = a3;
}

- (void)setHasSIntrasearch:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSIntrasearch
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setSIntersearch:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_sIntersearch = a3;
}

- (void)setHasSIntersearch:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSIntersearch
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setSSearchRat:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_sSearchRat = a3;
}

- (void)setHasSSearchRat:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSSearchRat
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setSCellPrio:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_sCellPrio = a3;
}

- (void)setHasSCellPrio:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSCellPrio
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)clearEutraPrioInfos
{
  -[NSMutableArray removeAllObjects](self->_eutraPrioInfos, "removeAllObjects");
}

- (void)addEutraPrioInfo:(id)a3
{
  id v4;
  NSMutableArray *eutraPrioInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  eutraPrioInfos = self->_eutraPrioInfos;
  v8 = v4;
  if (!eutraPrioInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_eutraPrioInfos;
    self->_eutraPrioInfos = v6;

    v4 = v8;
    eutraPrioInfos = self->_eutraPrioInfos;
  }
  -[NSMutableArray addObject:](eutraPrioInfos, "addObject:", v4);

}

- (unint64_t)eutraPrioInfosCount
{
  return (unint64_t)-[NSMutableArray count](self->_eutraPrioInfos, "count");
}

- (id)eutraPrioInfoAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_eutraPrioInfos, "objectAtIndex:", a3);
}

+ (Class)eutraPrioInfoType
{
  return (Class)objc_opt_class(EutraFreqInfo, a2);
}

- (void)clearUtraPrioInfos
{
  -[NSMutableArray removeAllObjects](self->_utraPrioInfos, "removeAllObjects");
}

- (void)addUtraPrioInfo:(id)a3
{
  id v4;
  NSMutableArray *utraPrioInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  utraPrioInfos = self->_utraPrioInfos;
  v8 = v4;
  if (!utraPrioInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_utraPrioInfos;
    self->_utraPrioInfos = v6;

    v4 = v8;
    utraPrioInfos = self->_utraPrioInfos;
  }
  -[NSMutableArray addObject:](utraPrioInfos, "addObject:", v4);

}

- (unint64_t)utraPrioInfosCount
{
  return (unint64_t)-[NSMutableArray count](self->_utraPrioInfos, "count");
}

- (id)utraPrioInfoAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_utraPrioInfos, "objectAtIndex:", a3);
}

+ (Class)utraPrioInfoType
{
  return (Class)objc_opt_class(UtraFreqInfo, a2);
}

- (void)clearGsmPrioInfos
{
  -[NSMutableArray removeAllObjects](self->_gsmPrioInfos, "removeAllObjects");
}

- (void)addGsmPrioInfo:(id)a3
{
  id v4;
  NSMutableArray *gsmPrioInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  gsmPrioInfos = self->_gsmPrioInfos;
  v8 = v4;
  if (!gsmPrioInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_gsmPrioInfos;
    self->_gsmPrioInfos = v6;

    v4 = v8;
    gsmPrioInfos = self->_gsmPrioInfos;
  }
  -[NSMutableArray addObject:](gsmPrioInfos, "addObject:", v4);

}

- (unint64_t)gsmPrioInfosCount
{
  return (unint64_t)-[NSMutableArray count](self->_gsmPrioInfos, "count");
}

- (id)gsmPrioInfoAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_gsmPrioInfos, "objectAtIndex:", a3);
}

+ (Class)gsmPrioInfoType
{
  return (Class)objc_opt_class(GsmFreqInfo, a2);
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KCellularWcdmaSelReselCellInfo;
  v3 = -[KCellularWcdmaSelReselCellInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularWcdmaSelReselCellInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v6;
  void *v7;
  int duplexMode;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  __int16 v12;
  void *v13;
  id v14;
  NSMutableArray *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  id v21;
  NSMutableArray *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  void *v27;
  id v28;
  NSMutableArray *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *k;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_hsdpaCapable));
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("hsdpa_capable"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_15;
    goto LABEL_9;
  }
LABEL_8:
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_edchCapable));
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("edch_capable"));

  if ((*(_WORD *)&self->_has & 4) == 0)
    goto LABEL_15;
LABEL_9:
  duplexMode = self->_duplexMode;
  if (duplexMode)
  {
    if (duplexMode == 1)
      v9 = CFSTR("TDD");
    else
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_duplexMode));
  }
  else
  {
    v9 = CFSTR("FDD");
  }
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("duplex_mode"));

LABEL_15:
  v10 = PBRepeatedUInt32NSArray(&self->_multiBandInfos);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("multi_band_info"));

  v12 = (__int16)self->_has;
  if ((v12 & 0x40) != 0)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_imsEmergencySupport));
    objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("ims_emergency_support"));

    v12 = (__int16)self->_has;
    if ((v12 & 2) == 0)
    {
LABEL_17:
      if ((v12 & 0x10) == 0)
        goto LABEL_18;
      goto LABEL_57;
    }
  }
  else if ((v12 & 2) == 0)
  {
    goto LABEL_17;
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cellBarred));
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("cell_barred"));

  v12 = (__int16)self->_has;
  if ((v12 & 0x10) == 0)
  {
LABEL_18:
    if ((v12 & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_58;
  }
LABEL_57:
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_fachMeasOccInfoPresent));
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("fach_meas_occ_info_present"));

  v12 = (__int16)self->_has;
  if ((v12 & 0x800) == 0)
  {
LABEL_19:
    if ((v12 & 0x400) == 0)
      goto LABEL_20;
    goto LABEL_59;
  }
LABEL_58:
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_sRxlev));
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("s_rxlev"));

  v12 = (__int16)self->_has;
  if ((v12 & 0x400) == 0)
  {
LABEL_20:
    if ((v12 & 0x200) == 0)
      goto LABEL_21;
    goto LABEL_60;
  }
LABEL_59:
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_sQual));
  objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("s_qual"));

  v12 = (__int16)self->_has;
  if ((v12 & 0x200) == 0)
  {
LABEL_21:
    if ((v12 & 0x100) == 0)
      goto LABEL_22;
    goto LABEL_61;
  }
LABEL_60:
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_sIntrasearch));
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("s_intrasearch"));

  v12 = (__int16)self->_has;
  if ((v12 & 0x100) == 0)
  {
LABEL_22:
    if ((v12 & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_62;
  }
LABEL_61:
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_sIntersearch));
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("s_intersearch"));

  v12 = (__int16)self->_has;
  if ((v12 & 0x1000) == 0)
  {
LABEL_23:
    if ((v12 & 0x80) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_62:
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_sSearchRat));
  objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("s_search_rat"));

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_24:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_sCellPrio));
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("s_cell_prio"));

  }
LABEL_25:
  if (-[NSMutableArray count](self->_eutraPrioInfos, "count"))
  {
    v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_eutraPrioInfos, "count"));
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v15 = self->_eutraPrioInfos;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v54 != v18)
            objc_enumerationMutation(v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("eutra_prio_info"));
  }
  if (-[NSMutableArray count](self->_utraPrioInfos, "count"))
  {
    v21 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_utraPrioInfos, "count"));
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v22 = self->_utraPrioInfos;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(_QWORD *)v50 != v25)
            objc_enumerationMutation(v22);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)j), "dictionaryRepresentation"));
          objc_msgSend(v21, "addObject:", v27);

        }
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      }
      while (v24);
    }

    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("utra_prio_info"));
  }
  if (-[NSMutableArray count](self->_gsmPrioInfos, "count"))
  {
    v28 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_gsmPrioInfos, "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v29 = self->_gsmPrioInfos;
    v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v46;
      do
      {
        for (k = 0; k != v31; k = (char *)k + 1)
        {
          if (*(_QWORD *)v46 != v32)
            objc_enumerationMutation(v29);
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)k), "dictionaryRepresentation"));
          objc_msgSend(v28, "addObject:", v34);

        }
        v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
      }
      while (v31);
    }

    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("gsm_prio_info"));
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100092E68((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  __int16 has;
  unint64_t v7;
  __int16 v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  NSMutableArray *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  NSMutableArray *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *k;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];

  v4 = a3;
  v5 = v4;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_47;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_hsdpaCapable, 2);
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_47:
  PBDataWriterWriteUint32Field(v5, self->_edchCapable, 3);
  if ((*(_WORD *)&self->_has & 4) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field(v5, self->_duplexMode, 4);
LABEL_6:
  if (self->_multiBandInfos.count)
  {
    v36 = 0;
    PBDataWriterPlaceMark(v5, &v36, 5);
    if (self->_multiBandInfos.count)
    {
      v7 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_multiBandInfos.list[v7++], 0xFFFFFFFFLL);
      while (v7 < self->_multiBandInfos.count);
    }
    PBDataWriterRecallMark(v5, &v36);
  }
  v8 = (__int16)self->_has;
  if ((v8 & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_imsEmergencySupport, 6);
    v8 = (__int16)self->_has;
    if ((v8 & 2) == 0)
    {
LABEL_13:
      if ((v8 & 0x10) == 0)
        goto LABEL_14;
      goto LABEL_51;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field(v5, self->_cellBarred, 7);
  v8 = (__int16)self->_has;
  if ((v8 & 0x10) == 0)
  {
LABEL_14:
    if ((v8 & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field(v5, self->_fachMeasOccInfoPresent, 8);
  v8 = (__int16)self->_has;
  if ((v8 & 0x800) == 0)
  {
LABEL_15:
    if ((v8 & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteSint32Field(v5, self->_sRxlev, 9);
  v8 = (__int16)self->_has;
  if ((v8 & 0x400) == 0)
  {
LABEL_16:
    if ((v8 & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteSint32Field(v5, self->_sQual, 10);
  v8 = (__int16)self->_has;
  if ((v8 & 0x200) == 0)
  {
LABEL_17:
    if ((v8 & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteSint32Field(v5, self->_sIntrasearch, 11);
  v8 = (__int16)self->_has;
  if ((v8 & 0x100) == 0)
  {
LABEL_18:
    if ((v8 & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteSint32Field(v5, self->_sIntersearch, 12);
  v8 = (__int16)self->_has;
  if ((v8 & 0x1000) == 0)
  {
LABEL_19:
    if ((v8 & 0x80) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_56:
  PBDataWriterWriteSint32Field(v5, self->_sSearchRat, 13);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
LABEL_20:
    PBDataWriterWriteUint32Field(v5, self->_sCellPrio, 21);
LABEL_21:
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v9 = self->_eutraPrioInfos;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i), 22);
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    }
    while (v11);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = self->_utraPrioInfos;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j), 23);
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v16);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v19 = self->_gsmPrioInfos;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v25;
    do
    {
      for (k = 0; k != v21; k = (char *)k + 1)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v19);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)k), 24);
      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
    }
    while (v21);
  }

  if ((*(_WORD *)&self->_has & 0x2000) != 0)
    PBDataWriterWriteUint32Field(v5, self->_subsId, 127);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  __int16 v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t k;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t m;
  void *v21;
  id v22;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[4] = self->_timestamp;
    *((_WORD *)v4 + 64) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
LABEL_37:
      *((_DWORD *)v4 + 12) = self->_edchCapable;
      *((_WORD *)v4 + 64) |= 8u;
      if ((*(_WORD *)&self->_has & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 20) = self->_hsdpaCapable;
  *((_WORD *)v4 + 64) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_37;
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 11) = self->_duplexMode;
    *((_WORD *)v4 + 64) |= 4u;
  }
LABEL_6:
  v22 = v4;
  if (-[KCellularWcdmaSelReselCellInfo multiBandInfosCount](self, "multiBandInfosCount"))
  {
    objc_msgSend(v22, "clearMultiBandInfos");
    v6 = -[KCellularWcdmaSelReselCellInfo multiBandInfosCount](self, "multiBandInfosCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v22, "addMultiBandInfo:", -[KCellularWcdmaSelReselCellInfo multiBandInfoAtIndex:](self, "multiBandInfoAtIndex:", i));
    }
  }
  v9 = (__int16)self->_has;
  if ((v9 & 0x40) != 0)
  {
    *((_DWORD *)v22 + 21) = self->_imsEmergencySupport;
    *((_WORD *)v22 + 64) |= 0x40u;
    v9 = (__int16)self->_has;
    if ((v9 & 2) == 0)
    {
LABEL_12:
      if ((v9 & 0x10) == 0)
        goto LABEL_13;
      goto LABEL_41;
    }
  }
  else if ((v9 & 2) == 0)
  {
    goto LABEL_12;
  }
  *((_DWORD *)v22 + 10) = self->_cellBarred;
  *((_WORD *)v22 + 64) |= 2u;
  v9 = (__int16)self->_has;
  if ((v9 & 0x10) == 0)
  {
LABEL_13:
    if ((v9 & 0x800) == 0)
      goto LABEL_14;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v22 + 16) = self->_fachMeasOccInfoPresent;
  *((_WORD *)v22 + 64) |= 0x10u;
  v9 = (__int16)self->_has;
  if ((v9 & 0x800) == 0)
  {
LABEL_14:
    if ((v9 & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v22 + 26) = self->_sRxlev;
  *((_WORD *)v22 + 64) |= 0x800u;
  v9 = (__int16)self->_has;
  if ((v9 & 0x400) == 0)
  {
LABEL_15:
    if ((v9 & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v22 + 25) = self->_sQual;
  *((_WORD *)v22 + 64) |= 0x400u;
  v9 = (__int16)self->_has;
  if ((v9 & 0x200) == 0)
  {
LABEL_16:
    if ((v9 & 0x100) == 0)
      goto LABEL_17;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v22 + 24) = self->_sIntrasearch;
  *((_WORD *)v22 + 64) |= 0x200u;
  v9 = (__int16)self->_has;
  if ((v9 & 0x100) == 0)
  {
LABEL_17:
    if ((v9 & 0x1000) == 0)
      goto LABEL_18;
LABEL_46:
    *((_DWORD *)v22 + 27) = self->_sSearchRat;
    *((_WORD *)v22 + 64) |= 0x1000u;
    if ((*(_WORD *)&self->_has & 0x80) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_45:
  *((_DWORD *)v22 + 23) = self->_sIntersearch;
  *((_WORD *)v22 + 64) |= 0x100u;
  v9 = (__int16)self->_has;
  if ((v9 & 0x1000) != 0)
    goto LABEL_46;
LABEL_18:
  if ((v9 & 0x80) != 0)
  {
LABEL_19:
    *((_DWORD *)v22 + 22) = self->_sCellPrio;
    *((_WORD *)v22 + 64) |= 0x80u;
  }
LABEL_20:
  if (-[KCellularWcdmaSelReselCellInfo eutraPrioInfosCount](self, "eutraPrioInfosCount"))
  {
    objc_msgSend(v22, "clearEutraPrioInfos");
    v10 = -[KCellularWcdmaSelReselCellInfo eutraPrioInfosCount](self, "eutraPrioInfosCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularWcdmaSelReselCellInfo eutraPrioInfoAtIndex:](self, "eutraPrioInfoAtIndex:", j));
        objc_msgSend(v22, "addEutraPrioInfo:", v13);

      }
    }
  }
  if (-[KCellularWcdmaSelReselCellInfo utraPrioInfosCount](self, "utraPrioInfosCount"))
  {
    objc_msgSend(v22, "clearUtraPrioInfos");
    v14 = -[KCellularWcdmaSelReselCellInfo utraPrioInfosCount](self, "utraPrioInfosCount");
    if (v14)
    {
      v15 = v14;
      for (k = 0; k != v15; ++k)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularWcdmaSelReselCellInfo utraPrioInfoAtIndex:](self, "utraPrioInfoAtIndex:", k));
        objc_msgSend(v22, "addUtraPrioInfo:", v17);

      }
    }
  }
  if (-[KCellularWcdmaSelReselCellInfo gsmPrioInfosCount](self, "gsmPrioInfosCount"))
  {
    objc_msgSend(v22, "clearGsmPrioInfos");
    v18 = -[KCellularWcdmaSelReselCellInfo gsmPrioInfosCount](self, "gsmPrioInfosCount");
    if (v18)
    {
      v19 = v18;
      for (m = 0; m != v19; ++m)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularWcdmaSelReselCellInfo gsmPrioInfoAtIndex:](self, "gsmPrioInfoAtIndex:", m));
        objc_msgSend(v22, "addGsmPrioInfo:", v21);

      }
    }
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    *((_DWORD *)v22 + 28) = self->_subsId;
    *((_WORD *)v22 + 64) |= 0x2000u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _DWORD *v6;
  __int16 has;
  __int16 v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  id v14;
  NSMutableArray *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  id v20;
  NSMutableArray *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *k;
  id v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v5[4] = self->_timestamp;
    *((_WORD *)v5 + 64) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_42;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 20) = self->_hsdpaCapable;
  *((_WORD *)v5 + 64) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_42:
  *((_DWORD *)v5 + 12) = self->_edchCapable;
  *((_WORD *)v5 + 64) |= 8u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_5:
    *((_DWORD *)v5 + 11) = self->_duplexMode;
    *((_WORD *)v5 + 64) |= 4u;
  }
LABEL_6:
  PBRepeatedUInt32Copy(v5 + 1, &self->_multiBandInfos);
  v8 = (__int16)self->_has;
  if ((v8 & 0x40) != 0)
  {
    v6[21] = self->_imsEmergencySupport;
    *((_WORD *)v6 + 64) |= 0x40u;
    v8 = (__int16)self->_has;
    if ((v8 & 2) == 0)
    {
LABEL_8:
      if ((v8 & 0x10) == 0)
        goto LABEL_9;
      goto LABEL_46;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_8;
  }
  v6[10] = self->_cellBarred;
  *((_WORD *)v6 + 64) |= 2u;
  v8 = (__int16)self->_has;
  if ((v8 & 0x10) == 0)
  {
LABEL_9:
    if ((v8 & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_47;
  }
LABEL_46:
  v6[16] = self->_fachMeasOccInfoPresent;
  *((_WORD *)v6 + 64) |= 0x10u;
  v8 = (__int16)self->_has;
  if ((v8 & 0x800) == 0)
  {
LABEL_10:
    if ((v8 & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_48;
  }
LABEL_47:
  v6[26] = self->_sRxlev;
  *((_WORD *)v6 + 64) |= 0x800u;
  v8 = (__int16)self->_has;
  if ((v8 & 0x400) == 0)
  {
LABEL_11:
    if ((v8 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_49;
  }
LABEL_48:
  v6[25] = self->_sQual;
  *((_WORD *)v6 + 64) |= 0x400u;
  v8 = (__int16)self->_has;
  if ((v8 & 0x200) == 0)
  {
LABEL_12:
    if ((v8 & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_50;
  }
LABEL_49:
  v6[24] = self->_sIntrasearch;
  *((_WORD *)v6 + 64) |= 0x200u;
  v8 = (__int16)self->_has;
  if ((v8 & 0x100) == 0)
  {
LABEL_13:
    if ((v8 & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_51;
  }
LABEL_50:
  v6[23] = self->_sIntersearch;
  *((_WORD *)v6 + 64) |= 0x100u;
  v8 = (__int16)self->_has;
  if ((v8 & 0x1000) == 0)
  {
LABEL_14:
    if ((v8 & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_51:
  v6[27] = self->_sSearchRat;
  *((_WORD *)v6 + 64) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_15:
    v6[22] = self->_sCellPrio;
    *((_WORD *)v6 + 64) |= 0x80u;
  }
LABEL_16:
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v9 = self->_eutraPrioInfos;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(v9);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3);
        objc_msgSend(v6, "addEutraPrioInfo:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v11);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v15 = self->_utraPrioInfos;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(_QWORD *)v33 != v18)
          objc_enumerationMutation(v15);
        v20 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)j), "copyWithZone:", a3);
        objc_msgSend(v6, "addUtraPrioInfo:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v17);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = self->_gsmPrioInfos;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v29;
    do
    {
      for (k = 0; k != v23; k = (char *)k + 1)
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(v21);
        v26 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)k), "copyWithZone:", a3, (_QWORD)v28);
        objc_msgSend(v6, "addGsmPrioInfo:", v26);

      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v23);
  }

  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    v6[28] = self->_subsId;
    *((_WORD *)v6 + 64) |= 0x2000u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  __int16 has;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  NSMutableArray *eutraPrioInfos;
  NSMutableArray *utraPrioInfos;
  NSMutableArray *gsmPrioInfos;
  BOOL v13;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_79;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 64);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 4))
      goto LABEL_79;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_hsdpaCapable != *((_DWORD *)v4 + 20))
      goto LABEL_79;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_edchCapable != *((_DWORD *)v4 + 12))
      goto LABEL_79;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_duplexMode != *((_DWORD *)v4 + 11))
      goto LABEL_79;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_79;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_multiBandInfos, v4 + 8))
  {
LABEL_79:
    v13 = 0;
    goto LABEL_80;
  }
  v8 = (__int16)self->_has;
  v9 = *((_WORD *)v4 + 64);
  if ((v8 & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_imsEmergencySupport != *((_DWORD *)v4 + 21))
      goto LABEL_79;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_79;
  }
  if ((v8 & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_cellBarred != *((_DWORD *)v4 + 10))
      goto LABEL_79;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_79;
  }
  if ((v8 & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_fachMeasOccInfoPresent != *((_DWORD *)v4 + 16))
      goto LABEL_79;
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 64) & 0x800) == 0 || self->_sRxlev != *((_DWORD *)v4 + 26))
      goto LABEL_79;
  }
  else if ((*((_WORD *)v4 + 64) & 0x800) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 64) & 0x400) == 0 || self->_sQual != *((_DWORD *)v4 + 25))
      goto LABEL_79;
  }
  else if ((*((_WORD *)v4 + 64) & 0x400) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 64) & 0x200) == 0 || self->_sIntrasearch != *((_DWORD *)v4 + 24))
      goto LABEL_79;
  }
  else if ((*((_WORD *)v4 + 64) & 0x200) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 64) & 0x100) == 0 || self->_sIntersearch != *((_DWORD *)v4 + 23))
      goto LABEL_79;
  }
  else if ((*((_WORD *)v4 + 64) & 0x100) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 64) & 0x1000) == 0 || self->_sSearchRat != *((_DWORD *)v4 + 27))
      goto LABEL_79;
  }
  else if ((*((_WORD *)v4 + 64) & 0x1000) != 0)
  {
    goto LABEL_79;
  }
  if ((v8 & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_sCellPrio != *((_DWORD *)v4 + 22))
      goto LABEL_79;
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_79;
  }
  eutraPrioInfos = self->_eutraPrioInfos;
  if ((unint64_t)eutraPrioInfos | *((_QWORD *)v4 + 7)
    && !-[NSMutableArray isEqual:](eutraPrioInfos, "isEqual:"))
  {
    goto LABEL_79;
  }
  utraPrioInfos = self->_utraPrioInfos;
  if ((unint64_t)utraPrioInfos | *((_QWORD *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](utraPrioInfos, "isEqual:"))
      goto LABEL_79;
  }
  gsmPrioInfos = self->_gsmPrioInfos;
  if ((unint64_t)gsmPrioInfos | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](gsmPrioInfos, "isEqual:"))
      goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 64) & 0x2000) == 0 || self->_subsId != *((_DWORD *)v4 + 28))
      goto LABEL_79;
    v13 = 1;
  }
  else
  {
    v13 = (*((_WORD *)v4 + 64) & 0x2000) == 0;
  }
LABEL_80:

  return v13;
}

- (unint64_t)hash
{
  __int16 has;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v23 = 2654435761u * self->_timestamp;
    if ((has & 0x20) != 0)
    {
LABEL_3:
      v22 = 2654435761 * self->_hsdpaCapable;
      if ((has & 8) != 0)
        goto LABEL_4;
LABEL_8:
      v21 = 0;
      if ((has & 4) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v23 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_3;
  }
  v22 = 0;
  if ((has & 8) == 0)
    goto LABEL_8;
LABEL_4:
  v21 = 2654435761 * self->_edchCapable;
  if ((has & 4) != 0)
  {
LABEL_5:
    v20 = 2654435761 * self->_duplexMode;
    goto LABEL_10;
  }
LABEL_9:
  v20 = 0;
LABEL_10:
  v19 = PBRepeatedUInt32Hash(&self->_multiBandInfos);
  v4 = (__int16)self->_has;
  if ((v4 & 0x40) != 0)
  {
    v18 = 2654435761 * self->_imsEmergencySupport;
    if ((v4 & 2) != 0)
    {
LABEL_12:
      v17 = 2654435761 * self->_cellBarred;
      if ((v4 & 0x10) != 0)
        goto LABEL_13;
      goto LABEL_22;
    }
  }
  else
  {
    v18 = 0;
    if ((v4 & 2) != 0)
      goto LABEL_12;
  }
  v17 = 0;
  if ((v4 & 0x10) != 0)
  {
LABEL_13:
    v16 = 2654435761 * self->_fachMeasOccInfoPresent;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_14;
    goto LABEL_23;
  }
LABEL_22:
  v16 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_sRxlev;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_15;
    goto LABEL_24;
  }
LABEL_23:
  v15 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_15:
    v5 = 2654435761 * self->_sQual;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_16;
    goto LABEL_25;
  }
LABEL_24:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_16:
    v6 = 2654435761 * self->_sIntrasearch;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_17;
    goto LABEL_26;
  }
LABEL_25:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_17:
    v7 = 2654435761 * self->_sIntersearch;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_18;
LABEL_27:
    v8 = 0;
    if ((v4 & 0x80) != 0)
      goto LABEL_19;
    goto LABEL_28;
  }
LABEL_26:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
    goto LABEL_27;
LABEL_18:
  v8 = 2654435761 * self->_sSearchRat;
  if ((v4 & 0x80) != 0)
  {
LABEL_19:
    v9 = 2654435761 * self->_sCellPrio;
    goto LABEL_29;
  }
LABEL_28:
  v9 = 0;
LABEL_29:
  v10 = (unint64_t)-[NSMutableArray hash](self->_eutraPrioInfos, "hash");
  v11 = (unint64_t)-[NSMutableArray hash](self->_utraPrioInfos, "hash");
  v12 = (unint64_t)-[NSMutableArray hash](self->_gsmPrioInfos, "hash");
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
    v13 = 2654435761 * self->_subsId;
  else
    v13 = 0;
  return v22 ^ v23 ^ v21 ^ v20 ^ v18 ^ v17 ^ v16 ^ v15 ^ v5 ^ v19 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  __int16 v6;
  char *v7;
  char *v8;
  char *i;
  __int16 v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *k;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *m;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];

  v4 = a3;
  v5 = v4;
  v6 = *((_WORD *)v4 + 64);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 1u;
    v6 = *((_WORD *)v4 + 64);
    if ((v6 & 0x20) == 0)
    {
LABEL_3:
      if ((v6 & 8) == 0)
        goto LABEL_4;
      goto LABEL_45;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_hsdpaCapable = *((_DWORD *)v4 + 20);
  *(_WORD *)&self->_has |= 0x20u;
  v6 = *((_WORD *)v4 + 64);
  if ((v6 & 8) == 0)
  {
LABEL_4:
    if ((v6 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_45:
  self->_edchCapable = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 64) & 4) != 0)
  {
LABEL_5:
    self->_duplexMode = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_6:
  v7 = (char *)objc_msgSend(v4, "multiBandInfosCount");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
      -[KCellularWcdmaSelReselCellInfo addMultiBandInfo:](self, "addMultiBandInfo:", objc_msgSend(v5, "multiBandInfoAtIndex:", i));
  }
  v10 = *((_WORD *)v5 + 64);
  if ((v10 & 0x40) != 0)
  {
    self->_imsEmergencySupport = *((_DWORD *)v5 + 21);
    *(_WORD *)&self->_has |= 0x40u;
    v10 = *((_WORD *)v5 + 64);
    if ((v10 & 2) == 0)
    {
LABEL_11:
      if ((v10 & 0x10) == 0)
        goto LABEL_12;
      goto LABEL_49;
    }
  }
  else if ((v10 & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_cellBarred = *((_DWORD *)v5 + 10);
  *(_WORD *)&self->_has |= 2u;
  v10 = *((_WORD *)v5 + 64);
  if ((v10 & 0x10) == 0)
  {
LABEL_12:
    if ((v10 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_50;
  }
LABEL_49:
  self->_fachMeasOccInfoPresent = *((_DWORD *)v5 + 16);
  *(_WORD *)&self->_has |= 0x10u;
  v10 = *((_WORD *)v5 + 64);
  if ((v10 & 0x800) == 0)
  {
LABEL_13:
    if ((v10 & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_51;
  }
LABEL_50:
  self->_sRxlev = *((_DWORD *)v5 + 26);
  *(_WORD *)&self->_has |= 0x800u;
  v10 = *((_WORD *)v5 + 64);
  if ((v10 & 0x400) == 0)
  {
LABEL_14:
    if ((v10 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_52;
  }
LABEL_51:
  self->_sQual = *((_DWORD *)v5 + 25);
  *(_WORD *)&self->_has |= 0x400u;
  v10 = *((_WORD *)v5 + 64);
  if ((v10 & 0x200) == 0)
  {
LABEL_15:
    if ((v10 & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_53;
  }
LABEL_52:
  self->_sIntrasearch = *((_DWORD *)v5 + 24);
  *(_WORD *)&self->_has |= 0x200u;
  v10 = *((_WORD *)v5 + 64);
  if ((v10 & 0x100) == 0)
  {
LABEL_16:
    if ((v10 & 0x1000) == 0)
      goto LABEL_17;
    goto LABEL_54;
  }
LABEL_53:
  self->_sIntersearch = *((_DWORD *)v5 + 23);
  *(_WORD *)&self->_has |= 0x100u;
  v10 = *((_WORD *)v5 + 64);
  if ((v10 & 0x1000) == 0)
  {
LABEL_17:
    if ((v10 & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_54:
  self->_sSearchRat = *((_DWORD *)v5 + 27);
  *(_WORD *)&self->_has |= 0x1000u;
  if ((*((_WORD *)v5 + 64) & 0x80) != 0)
  {
LABEL_18:
    self->_sCellPrio = *((_DWORD *)v5 + 22);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_19:
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = *((id *)v5 + 7);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(v11);
        -[KCellularWcdmaSelReselCellInfo addEutraPrioInfo:](self, "addEutraPrioInfo:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v13);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v16 = *((id *)v5 + 15);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    do
    {
      for (k = 0; k != v18; k = (char *)k + 1)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v16);
        -[KCellularWcdmaSelReselCellInfo addUtraPrioInfo:](self, "addUtraPrioInfo:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)k));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v18);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = *((id *)v5 + 9);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v27;
    do
    {
      for (m = 0; m != v23; m = (char *)m + 1)
      {
        if (*(_QWORD *)v27 != v24)
          objc_enumerationMutation(v21);
        -[KCellularWcdmaSelReselCellInfo addGsmPrioInfo:](self, "addGsmPrioInfo:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)m), (_QWORD)v26);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v23);
  }

  if ((*((_WORD *)v5 + 64) & 0x2000) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 28);
    *(_WORD *)&self->_has |= 0x2000u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)hsdpaCapable
{
  return self->_hsdpaCapable;
}

- (unsigned)edchCapable
{
  return self->_edchCapable;
}

- (unsigned)imsEmergencySupport
{
  return self->_imsEmergencySupport;
}

- (unsigned)cellBarred
{
  return self->_cellBarred;
}

- (unsigned)fachMeasOccInfoPresent
{
  return self->_fachMeasOccInfoPresent;
}

- (int)sRxlev
{
  return self->_sRxlev;
}

- (int)sQual
{
  return self->_sQual;
}

- (int)sIntrasearch
{
  return self->_sIntrasearch;
}

- (int)sIntersearch
{
  return self->_sIntersearch;
}

- (int)sSearchRat
{
  return self->_sSearchRat;
}

- (unsigned)sCellPrio
{
  return self->_sCellPrio;
}

- (NSMutableArray)eutraPrioInfos
{
  return self->_eutraPrioInfos;
}

- (void)setEutraPrioInfos:(id)a3
{
  objc_storeStrong((id *)&self->_eutraPrioInfos, a3);
}

- (NSMutableArray)utraPrioInfos
{
  return self->_utraPrioInfos;
}

- (void)setUtraPrioInfos:(id)a3
{
  objc_storeStrong((id *)&self->_utraPrioInfos, a3);
}

- (NSMutableArray)gsmPrioInfos
{
  return self->_gsmPrioInfos;
}

- (void)setGsmPrioInfos:(id)a3
{
  objc_storeStrong((id *)&self->_gsmPrioInfos, a3);
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utraPrioInfos, 0);
  objc_storeStrong((id *)&self->_gsmPrioInfos, 0);
  objc_storeStrong((id *)&self->_eutraPrioInfos, 0);
}

@end
