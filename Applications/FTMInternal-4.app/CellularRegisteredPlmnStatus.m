@implementation CellularRegisteredPlmnStatus

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

- (int)roamStatus
{
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    return self->_roamStatus;
  else
    return -1;
}

- (void)setRoamStatus:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_roamStatus = a3;
}

- (void)setHasRoamStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRoamStatus
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)roamStatusAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("SYS_ROAM_STATUS_NONE");
  switch(a3)
  {
    case -1:
      return v3;
    case 0:
      v3 = CFSTR("SYS_ROAM_STATUS_OFF");
      return v3;
    case 1:
      return CFSTR("SYS_ROAM_STATUS_ON");
    case 2:
      return CFSTR("SYS_ROAM_STATUS_BLINK");
    case 3:
      return CFSTR("SYS_ROAM_STATUS_OUT_OF_NEIGHBORHOOD");
    case 4:
      return CFSTR("SYS_ROAM_STATUS_OUT_OF_BLDG");
    case 5:
      return CFSTR("SYS_ROAM_STATUS_PREF_SYS");
    case 6:
      return CFSTR("SYS_ROAM_STATUS_AVAIL_SYS");
    case 7:
      return CFSTR("SYS_ROAM_STATUS_ALLIANCE_PARTNER");
    case 8:
      return CFSTR("SYS_ROAM_STATUS_PREMIUM_PARTNER");
    case 9:
      return CFSTR("SYS_ROAM_STATUS_FULL_SVC");
    case 10:
      return CFSTR("SYS_ROAM_STATUS_PARTIAL_SVC");
    case 11:
      return CFSTR("SYS_ROAM_STATUS_BANNER_ON");
    case 12:
      return CFSTR("SYS_ROAM_STATUS_BANNER_OFF");
    default:
      if (a3 == 64)
        return CFSTR("SYS_ROAM_STATUS_HOME_SYSTEM");
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
      return v3;
  }
}

- (int)StringAsRoamStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_NONE")) & 1) != 0)
  {
    v4 = -1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_OFF")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_ON")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_BLINK")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_OUT_OF_NEIGHBORHOOD")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_OUT_OF_BLDG")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_PREF_SYS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_AVAIL_SYS")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_ALLIANCE_PARTNER")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_PREMIUM_PARTNER")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_FULL_SVC")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_PARTIAL_SVC")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_BANNER_ON")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_BANNER_OFF")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_ROAM_STATUS_HOME_SYSTEM")))
  {
    v4 = 64;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (void)setHMCC:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_hMCC = a3;
}

- (void)setHasHMCC:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasHMCC
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHMNC:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_hMNC = a3;
}

- (void)setHasHMNC:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasHMNC
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRMCC:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_rMCC = a3;
}

- (void)setHasRMCC:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasRMCC
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRMNC:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_rMNC = a3;
}

- (void)setHasRMNC:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRMNC
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRSID:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rSID = a3;
}

- (void)setHasRSID:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRSID
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRNID:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rNID = a3;
}

- (void)setHasRNID:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRNID
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)clearHomeSidNidLists
{
  -[NSMutableArray removeAllObjects](self->_homeSidNidLists, "removeAllObjects");
}

- (void)addHomeSidNidList:(id)a3
{
  id v4;
  NSMutableArray *homeSidNidLists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  homeSidNidLists = self->_homeSidNidLists;
  v8 = v4;
  if (!homeSidNidLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_homeSidNidLists;
    self->_homeSidNidLists = v6;

    v4 = v8;
    homeSidNidLists = self->_homeSidNidLists;
  }
  -[NSMutableArray addObject:](homeSidNidLists, "addObject:", v4);

}

- (unint64_t)homeSidNidListsCount
{
  return (unint64_t)-[NSMutableArray count](self->_homeSidNidLists, "count");
}

- (id)homeSidNidListAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_homeSidNidLists, "objectAtIndex:", a3);
}

+ (Class)homeSidNidListType
{
  return (Class)objc_opt_class(HSIDNIDPair, a2);
}

- (void)clearEplmnLists
{
  -[NSMutableArray removeAllObjects](self->_eplmnLists, "removeAllObjects");
}

- (void)addEplmnList:(id)a3
{
  id v4;
  NSMutableArray *eplmnLists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  eplmnLists = self->_eplmnLists;
  v8 = v4;
  if (!eplmnLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_eplmnLists;
    self->_eplmnLists = v6;

    v4 = v8;
    eplmnLists = self->_eplmnLists;
  }
  -[NSMutableArray addObject:](eplmnLists, "addObject:", v4);

}

- (unint64_t)eplmnListsCount
{
  return (unint64_t)-[NSMutableArray count](self->_eplmnLists, "count");
}

- (id)eplmnListAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_eplmnLists, "objectAtIndex:", a3);
}

+ (Class)eplmnListType
{
  return (Class)objc_opt_class(MCCMNCPair, a2);
}

- (void)clearEhplmnLists
{
  -[NSMutableArray removeAllObjects](self->_ehplmnLists, "removeAllObjects");
}

- (void)addEhplmnList:(id)a3
{
  id v4;
  NSMutableArray *ehplmnLists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  ehplmnLists = self->_ehplmnLists;
  v8 = v4;
  if (!ehplmnLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_ehplmnLists;
    self->_ehplmnLists = v6;

    v4 = v8;
    ehplmnLists = self->_ehplmnLists;
  }
  -[NSMutableArray addObject:](ehplmnLists, "addObject:", v4);

}

- (unint64_t)ehplmnListsCount
{
  return (unint64_t)-[NSMutableArray count](self->_ehplmnLists, "count");
}

- (id)ehplmnListAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_ehplmnLists, "objectAtIndex:", a3);
}

+ (Class)ehplmnListType
{
  return (Class)objc_opt_class(MCCMNCPair, a2);
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPsPref
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularRegisteredPlmnStatus;
  v3 = -[CellularRegisteredPlmnStatus description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularRegisteredPlmnStatus dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  id v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  NSMutableArray *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  id v20;
  NSMutableArray *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *k;
  void *v26;
  __int16 v27;
  void *v28;
  NSData *plmn;
  void *v31;
  int roamStatus;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_66;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  roamStatus = self->_roamStatus;
  v33 = CFSTR("SYS_ROAM_STATUS_NONE");
  switch(roamStatus)
  {
    case -1:
      break;
    case 0:
      v33 = CFSTR("SYS_ROAM_STATUS_OFF");
      break;
    case 1:
      v33 = CFSTR("SYS_ROAM_STATUS_ON");
      break;
    case 2:
      v33 = CFSTR("SYS_ROAM_STATUS_BLINK");
      break;
    case 3:
      v33 = CFSTR("SYS_ROAM_STATUS_OUT_OF_NEIGHBORHOOD");
      break;
    case 4:
      v33 = CFSTR("SYS_ROAM_STATUS_OUT_OF_BLDG");
      break;
    case 5:
      v33 = CFSTR("SYS_ROAM_STATUS_PREF_SYS");
      break;
    case 6:
      v33 = CFSTR("SYS_ROAM_STATUS_AVAIL_SYS");
      break;
    case 7:
      v33 = CFSTR("SYS_ROAM_STATUS_ALLIANCE_PARTNER");
      break;
    case 8:
      v33 = CFSTR("SYS_ROAM_STATUS_PREMIUM_PARTNER");
      break;
    case 9:
      v33 = CFSTR("SYS_ROAM_STATUS_FULL_SVC");
      break;
    case 10:
      v33 = CFSTR("SYS_ROAM_STATUS_PARTIAL_SVC");
      break;
    case 11:
      v33 = CFSTR("SYS_ROAM_STATUS_BANNER_ON");
      break;
    case 12:
      v33 = CFSTR("SYS_ROAM_STATUS_BANNER_OFF");
      break;
    default:
      if (roamStatus == 64)
        v33 = CFSTR("SYS_ROAM_STATUS_HOME_SYSTEM");
      else
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_roamStatus));
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("roam_status"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_67;
  }
LABEL_66:
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_hMCC));
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("h_MCC"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_68;
  }
LABEL_67:
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_hMNC));
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("h_MNC"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_69;
  }
LABEL_68:
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rMCC));
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("r_MCC"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_70;
  }
LABEL_69:
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rMNC));
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("r_MNC"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_70:
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rSID));
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("r_SID"));

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_9:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rNID));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("r_NID"));

  }
LABEL_10:
  if (-[NSMutableArray count](self->_homeSidNidLists, "count"))
  {
    v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_homeSidNidLists, "count"));
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v7 = self->_homeSidNidLists;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v50 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("home_sid_nid_list"));
  }
  if (-[NSMutableArray count](self->_eplmnLists, "count"))
  {
    v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_eplmnLists, "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v14 = self->_eplmnLists;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(_QWORD *)v46 != v17)
            objc_enumerationMutation(v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j), "dictionaryRepresentation"));
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("eplmn_list"));
  }
  if (-[NSMutableArray count](self->_ehplmnLists, "count"))
  {
    v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_ehplmnLists, "count"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v21 = self->_ehplmnLists;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v42;
      do
      {
        for (k = 0; k != v23; k = (char *)k + 1)
        {
          if (*(_QWORD *)v42 != v24)
            objc_enumerationMutation(v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)k), "dictionaryRepresentation"));
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
      }
      while (v23);
    }

    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("ehplmn_list"));
  }
  v27 = (__int16)self->_has;
  if ((v27 & 0x400) != 0)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("subs_id"));

    v27 = (__int16)self->_has;
    if ((v27 & 8) == 0)
    {
LABEL_39:
      if ((v27 & 0x10) == 0)
        goto LABEL_41;
      goto LABEL_40;
    }
  }
  else if ((v27 & 8) == 0)
  {
    goto LABEL_39;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("num_subs"));

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_40:
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("ps_pref"));

  }
LABEL_41:
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10012BEFC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  __int16 has;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  NSMutableArray *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *k;
  __int16 v22;
  NSData *plmn;
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
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];

  v4 = a3;
  v5 = v4;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_40;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(v5, self->_roamStatus, 2);
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field(v5, self->_hMCC, 3);
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field(v5, self->_hMNC, 4);
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field(v5, self->_rMCC, 5);
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field(v5, self->_rMNC, 6);
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_44:
  PBDataWriterWriteUint32Field(v5, self->_rSID, 7);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
LABEL_9:
    PBDataWriterWriteUint32Field(v5, self->_rNID, 8);
LABEL_10:
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = self->_homeSidNidLists;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i), 9);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v9);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = self->_eplmnLists;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j), 10);
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v14);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = self->_ehplmnLists;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
    do
    {
      for (k = 0; k != v19; k = (char *)k + 1)
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v17);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)k), 11);
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v19);
  }

  v22 = (__int16)self->_has;
  if ((v22 & 0x400) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_subsId, 12);
    v22 = (__int16)self->_has;
    if ((v22 & 8) == 0)
    {
LABEL_33:
      if ((v22 & 0x10) == 0)
        goto LABEL_35;
      goto LABEL_34;
    }
  }
  else if ((v22 & 8) == 0)
  {
    goto LABEL_33;
  }
  PBDataWriterWriteUint32Field(v5, self->_numSubs, 13);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
LABEL_34:
    PBDataWriterWriteUint32Field(v5, self->_psPref, 14);
LABEL_35:
  plmn = self->_plmn;
  if (plmn)
    PBDataWriterWriteDataField(v5, plmn, 15);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t k;
  void *v17;
  __int16 v18;
  void *v19;
  id v20;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 46) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 21) = self->_roamStatus;
  *((_WORD *)v4 + 46) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v4 + 8) = self->_hMCC;
  *((_WORD *)v4 + 46) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v4 + 9) = self->_hMNC;
  *((_WORD *)v4 + 46) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 17) = self->_rMCC;
  *((_WORD *)v4 + 46) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
LABEL_35:
    *((_DWORD *)v4 + 20) = self->_rSID;
    *((_WORD *)v4 + 46) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_34:
  *((_DWORD *)v4 + 18) = self->_rMNC;
  *((_WORD *)v4 + 46) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
    goto LABEL_35;
LABEL_8:
  if ((has & 0x80) != 0)
  {
LABEL_9:
    *((_DWORD *)v4 + 19) = self->_rNID;
    *((_WORD *)v4 + 46) |= 0x80u;
  }
LABEL_10:
  v20 = v4;
  if (-[CellularRegisteredPlmnStatus homeSidNidListsCount](self, "homeSidNidListsCount"))
  {
    objc_msgSend(v20, "clearHomeSidNidLists");
    v6 = -[CellularRegisteredPlmnStatus homeSidNidListsCount](self, "homeSidNidListsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CellularRegisteredPlmnStatus homeSidNidListAtIndex:](self, "homeSidNidListAtIndex:", i));
        objc_msgSend(v20, "addHomeSidNidList:", v9);

      }
    }
  }
  if (-[CellularRegisteredPlmnStatus eplmnListsCount](self, "eplmnListsCount"))
  {
    objc_msgSend(v20, "clearEplmnLists");
    v10 = -[CellularRegisteredPlmnStatus eplmnListsCount](self, "eplmnListsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CellularRegisteredPlmnStatus eplmnListAtIndex:](self, "eplmnListAtIndex:", j));
        objc_msgSend(v20, "addEplmnList:", v13);

      }
    }
  }
  if (-[CellularRegisteredPlmnStatus ehplmnListsCount](self, "ehplmnListsCount"))
  {
    objc_msgSend(v20, "clearEhplmnLists");
    v14 = -[CellularRegisteredPlmnStatus ehplmnListsCount](self, "ehplmnListsCount");
    if (v14)
    {
      v15 = v14;
      for (k = 0; k != v15; ++k)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CellularRegisteredPlmnStatus ehplmnListAtIndex:](self, "ehplmnListAtIndex:", k));
        objc_msgSend(v20, "addEhplmnList:", v17);

      }
    }
  }
  v18 = (__int16)self->_has;
  v19 = v20;
  if ((v18 & 0x400) != 0)
  {
    *((_DWORD *)v20 + 22) = self->_subsId;
    *((_WORD *)v20 + 46) |= 0x400u;
    v18 = (__int16)self->_has;
    if ((v18 & 8) == 0)
    {
LABEL_24:
      if ((v18 & 0x10) == 0)
        goto LABEL_26;
      goto LABEL_25;
    }
  }
  else if ((v18 & 8) == 0)
  {
    goto LABEL_24;
  }
  *((_DWORD *)v20 + 12) = self->_numSubs;
  *((_WORD *)v20 + 46) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_25:
    *((_DWORD *)v20 + 16) = self->_psPref;
    *((_WORD *)v20 + 46) |= 0x10u;
  }
LABEL_26:
  if (self->_plmn)
  {
    objc_msgSend(v20, "setPlmn:");
    v19 = v20;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  __int16 has;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  id v13;
  NSMutableArray *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  id v19;
  NSMutableArray *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *k;
  id v25;
  __int16 v26;
  id v27;
  void *v28;
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
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_WORD *)v5 + 46) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_38;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 21) = self->_roamStatus;
  *((_WORD *)v5 + 46) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v5 + 8) = self->_hMCC;
  *((_WORD *)v5 + 46) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v5 + 9) = self->_hMNC;
  *((_WORD *)v5 + 46) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v5 + 17) = self->_rMCC;
  *((_WORD *)v5 + 46) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v5 + 18) = self->_rMNC;
  *((_WORD *)v5 + 46) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_42:
  *((_DWORD *)v5 + 20) = self->_rSID;
  *((_WORD *)v5 + 46) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_9:
    *((_DWORD *)v5 + 19) = self->_rNID;
    *((_WORD *)v5 + 46) |= 0x80u;
  }
LABEL_10:
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v8 = self->_homeSidNidLists;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3);
        objc_msgSend(v6, "addHomeSidNidList:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v10);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v14 = self->_eplmnLists;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(v14);
        v19 = objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)j), "copyWithZone:", a3);
        objc_msgSend(v6, "addEplmnList:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v16);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = self->_ehplmnLists;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v31;
    do
    {
      for (k = 0; k != v22; k = (char *)k + 1)
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v20);
        v25 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)k), "copyWithZone:", a3, (_QWORD)v30);
        objc_msgSend(v6, "addEhplmnList:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v22);
  }

  v26 = (__int16)self->_has;
  if ((v26 & 0x400) == 0)
  {
    if ((v26 & 8) == 0)
      goto LABEL_33;
LABEL_45:
    *((_DWORD *)v6 + 12) = self->_numSubs;
    *((_WORD *)v6 + 46) |= 8u;
    if ((*(_WORD *)&self->_has & 0x10) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
  *((_DWORD *)v6 + 22) = self->_subsId;
  *((_WORD *)v6 + 46) |= 0x400u;
  v26 = (__int16)self->_has;
  if ((v26 & 8) != 0)
    goto LABEL_45;
LABEL_33:
  if ((v26 & 0x10) != 0)
  {
LABEL_34:
    *((_DWORD *)v6 + 16) = self->_psPref;
    *((_WORD *)v6 + 46) |= 0x10u;
  }
LABEL_35:
  v27 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3, (_QWORD)v30);
  v28 = (void *)*((_QWORD *)v6 + 7);
  *((_QWORD *)v6 + 7) = v27;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  __int16 has;
  __int16 v7;
  NSMutableArray *homeSidNidLists;
  NSMutableArray *eplmnLists;
  NSMutableArray *ehplmnLists;
  __int16 v11;
  __int16 v12;
  NSData *plmn;
  unsigned __int8 v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_65;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 46);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_65;
  }
  else if ((v7 & 1) != 0)
  {
LABEL_65:
    v14 = 0;
    goto LABEL_66;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x200) == 0 || self->_roamStatus != *((_DWORD *)v4 + 21))
      goto LABEL_65;
  }
  else if ((*((_WORD *)v4 + 46) & 0x200) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_hMCC != *((_DWORD *)v4 + 8))
      goto LABEL_65;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_hMNC != *((_DWORD *)v4 + 9))
      goto LABEL_65;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_rMCC != *((_DWORD *)v4 + 17))
      goto LABEL_65;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_rMNC != *((_DWORD *)v4 + 18))
      goto LABEL_65;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_65;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x100) == 0 || self->_rSID != *((_DWORD *)v4 + 20))
      goto LABEL_65;
  }
  else if ((*((_WORD *)v4 + 46) & 0x100) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_rNID != *((_DWORD *)v4 + 19))
      goto LABEL_65;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_65;
  }
  homeSidNidLists = self->_homeSidNidLists;
  if ((unint64_t)homeSidNidLists | *((_QWORD *)v4 + 5)
    && !-[NSMutableArray isEqual:](homeSidNidLists, "isEqual:"))
  {
    goto LABEL_65;
  }
  eplmnLists = self->_eplmnLists;
  if ((unint64_t)eplmnLists | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](eplmnLists, "isEqual:"))
      goto LABEL_65;
  }
  ehplmnLists = self->_ehplmnLists;
  if ((unint64_t)ehplmnLists | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](ehplmnLists, "isEqual:"))
      goto LABEL_65;
  }
  v11 = (__int16)self->_has;
  v12 = *((_WORD *)v4 + 46);
  if ((v11 & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x400) == 0 || self->_subsId != *((_DWORD *)v4 + 22))
      goto LABEL_65;
  }
  else if ((*((_WORD *)v4 + 46) & 0x400) != 0)
  {
    goto LABEL_65;
  }
  if ((v11 & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_numSubs != *((_DWORD *)v4 + 12))
      goto LABEL_65;
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_65;
  }
  if ((v11 & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0 || self->_psPref != *((_DWORD *)v4 + 16))
      goto LABEL_65;
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_65;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 7))
    v14 = -[NSData isEqual:](plmn, "isEqual:");
  else
    v14 = 1;
LABEL_66:

  return v14;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v19 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_3:
      v18 = 2654435761 * self->_roamStatus;
      if ((has & 2) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v19 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_3;
  }
  v18 = 0;
  if ((has & 2) != 0)
  {
LABEL_4:
    v17 = 2654435761 * self->_hMCC;
    if ((has & 4) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v17 = 0;
  if ((has & 4) != 0)
  {
LABEL_5:
    v4 = 2654435761 * self->_hMNC;
    if ((has & 0x20) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v4 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    v5 = 2654435761 * self->_rMCC;
    if ((has & 0x40) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v5 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_7:
    v6 = 2654435761 * self->_rMNC;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_8;
LABEL_16:
    v7 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_15:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_16;
LABEL_8:
  v7 = 2654435761 * self->_rSID;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    v8 = 2654435761 * self->_rNID;
    goto LABEL_18;
  }
LABEL_17:
  v8 = 0;
LABEL_18:
  v9 = (unint64_t)-[NSMutableArray hash](self->_homeSidNidLists, "hash");
  v10 = (unint64_t)-[NSMutableArray hash](self->_eplmnLists, "hash");
  v11 = (unint64_t)-[NSMutableArray hash](self->_ehplmnLists, "hash");
  v12 = (__int16)self->_has;
  if ((v12 & 0x400) == 0)
  {
    v13 = 0;
    if ((v12 & 8) != 0)
      goto LABEL_20;
LABEL_23:
    v14 = 0;
    if ((v12 & 0x10) != 0)
      goto LABEL_21;
LABEL_24:
    v15 = 0;
    return v18 ^ v19 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ (unint64_t)-[NSData hash](self->_plmn, "hash");
  }
  v13 = 2654435761 * self->_subsId;
  if ((v12 & 8) == 0)
    goto LABEL_23;
LABEL_20:
  v14 = 2654435761 * self->_numSubs;
  if ((v12 & 0x10) == 0)
    goto LABEL_24;
LABEL_21:
  v15 = 2654435761 * self->_psPref;
  return v18 ^ v19 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ (unint64_t)-[NSData hash](self->_plmn, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  __int16 v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *k;
  __int16 v22;
  __int128 v23;
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
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];

  v4 = a3;
  v5 = v4;
  v6 = *((_WORD *)v4 + 46);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v6 = *((_WORD *)v4 + 46);
    if ((v6 & 0x200) == 0)
    {
LABEL_3:
      if ((v6 & 2) == 0)
        goto LABEL_4;
      goto LABEL_40;
    }
  }
  else if ((*((_WORD *)v4 + 46) & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_roamStatus = *((_DWORD *)v4 + 21);
  *(_WORD *)&self->_has |= 0x200u;
  v6 = *((_WORD *)v4 + 46);
  if ((v6 & 2) == 0)
  {
LABEL_4:
    if ((v6 & 4) == 0)
      goto LABEL_5;
    goto LABEL_41;
  }
LABEL_40:
  self->_hMCC = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 2u;
  v6 = *((_WORD *)v4 + 46);
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_42;
  }
LABEL_41:
  self->_hMNC = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 4u;
  v6 = *((_WORD *)v4 + 46);
  if ((v6 & 0x20) == 0)
  {
LABEL_6:
    if ((v6 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_43;
  }
LABEL_42:
  self->_rMCC = *((_DWORD *)v4 + 17);
  *(_WORD *)&self->_has |= 0x20u;
  v6 = *((_WORD *)v4 + 46);
  if ((v6 & 0x40) == 0)
  {
LABEL_7:
    if ((v6 & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_44;
  }
LABEL_43:
  self->_rMNC = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_has |= 0x40u;
  v6 = *((_WORD *)v4 + 46);
  if ((v6 & 0x100) == 0)
  {
LABEL_8:
    if ((v6 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_44:
  self->_rSID = *((_DWORD *)v4 + 20);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)v4 + 46) & 0x80) != 0)
  {
LABEL_9:
    self->_rNID = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_10:
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = *((id *)v4 + 5);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v7);
        -[CellularRegisteredPlmnStatus addHomeSidNidList:](self, "addHomeSidNidList:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v9);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = *((id *)v5 + 3);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        -[CellularRegisteredPlmnStatus addEplmnList:](self, "addEplmnList:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v14);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v17 = *((id *)v5 + 2);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      for (k = 0; k != v19; k = (char *)k + 1)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        -[CellularRegisteredPlmnStatus addEhplmnList:](self, "addEhplmnList:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)k), (_QWORD)v23);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v19);
  }

  v22 = *((_WORD *)v5 + 46);
  if ((v22 & 0x400) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 22);
    *(_WORD *)&self->_has |= 0x400u;
    v22 = *((_WORD *)v5 + 46);
    if ((v22 & 8) == 0)
    {
LABEL_33:
      if ((v22 & 0x10) == 0)
        goto LABEL_35;
      goto LABEL_34;
    }
  }
  else if ((v22 & 8) == 0)
  {
    goto LABEL_33;
  }
  self->_numSubs = *((_DWORD *)v5 + 12);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v5 + 46) & 0x10) != 0)
  {
LABEL_34:
    self->_psPref = *((_DWORD *)v5 + 16);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_35:
  if (*((_QWORD *)v5 + 7))
    -[CellularRegisteredPlmnStatus setPlmn:](self, "setPlmn:");

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)hMCC
{
  return self->_hMCC;
}

- (unsigned)hMNC
{
  return self->_hMNC;
}

- (unsigned)rMCC
{
  return self->_rMCC;
}

- (unsigned)rMNC
{
  return self->_rMNC;
}

- (unsigned)rSID
{
  return self->_rSID;
}

- (unsigned)rNID
{
  return self->_rNID;
}

- (NSMutableArray)homeSidNidLists
{
  return self->_homeSidNidLists;
}

- (void)setHomeSidNidLists:(id)a3
{
  objc_storeStrong((id *)&self->_homeSidNidLists, a3);
}

- (NSMutableArray)eplmnLists
{
  return self->_eplmnLists;
}

- (void)setEplmnLists:(id)a3
{
  objc_storeStrong((id *)&self->_eplmnLists, a3);
}

- (NSMutableArray)ehplmnLists
{
  return self->_ehplmnLists;
}

- (void)setEhplmnLists:(id)a3
{
  objc_storeStrong((id *)&self->_ehplmnLists, a3);
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (NSData)plmn
{
  return self->_plmn;
}

- (void)setPlmn:(id)a3
{
  objc_storeStrong((id *)&self->_plmn, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plmn, 0);
  objc_storeStrong((id *)&self->_homeSidNidLists, 0);
  objc_storeStrong((id *)&self->_eplmnLists, 0);
  objc_storeStrong((id *)&self->_ehplmnLists, 0);
}

@end
