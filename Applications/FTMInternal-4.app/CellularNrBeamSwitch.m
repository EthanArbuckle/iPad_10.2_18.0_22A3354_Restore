@implementation CellularNrBeamSwitch

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDurationBeforeSwitch:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_durationBeforeSwitch = a3;
}

- (void)setHasDurationBeforeSwitch:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDurationBeforeSwitch
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)clearOldBeamInfos
{
  -[NSMutableArray removeAllObjects](self->_oldBeamInfos, "removeAllObjects");
}

- (void)addOldBeamInfo:(id)a3
{
  id v4;
  NSMutableArray *oldBeamInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  oldBeamInfos = self->_oldBeamInfos;
  v8 = v4;
  if (!oldBeamInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_oldBeamInfos;
    self->_oldBeamInfos = v6;

    v4 = v8;
    oldBeamInfos = self->_oldBeamInfos;
  }
  -[NSMutableArray addObject:](oldBeamInfos, "addObject:", v4);

}

- (unint64_t)oldBeamInfosCount
{
  return (unint64_t)-[NSMutableArray count](self->_oldBeamInfos, "count");
}

- (id)oldBeamInfoAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_oldBeamInfos, "objectAtIndex:", a3);
}

+ (Class)oldBeamInfoType
{
  return (Class)objc_opt_class(ServingCellBeamInfo, a2);
}

- (void)clearNewBeamInfos
{
  -[NSMutableArray removeAllObjects](self->_thenewBeamInfos, "removeAllObjects");
}

- (void)addNewBeamInfo:(id)a3
{
  id v4;
  NSMutableArray *thenewBeamInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  thenewBeamInfos = self->_thenewBeamInfos;
  v8 = v4;
  if (!thenewBeamInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_thenewBeamInfos;
    self->_thenewBeamInfos = v6;

    v4 = v8;
    thenewBeamInfos = self->_thenewBeamInfos;
  }
  -[NSMutableArray addObject:](thenewBeamInfos, "addObject:", v4);

}

- (unint64_t)newBeamInfosCount
{
  return (unint64_t)-[NSMutableArray count](self->_thenewBeamInfos, "count");
}

- (id)newBeamInfoAtIndex:(unint64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_thenewBeamInfos, "objectAtIndex:", a3));
}

+ (Class)newBeamInfoType
{
  uint64_t v2;

  v2 = objc_opt_class(ServingCellBeamInfo, a2);
  return (Class)objc_claimAutoreleasedReturnValue(v2);
}

- (int)motionState
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_motionState;
  else
    return 0;
}

- (void)setMotionState:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_motionState = a3;
}

- (void)setHasMotionState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMotionState
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)motionStateAsString:(int)a3
{
  if (a3 >= 5)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025F9A0 + a3);
}

- (int)StringAsMotionState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOTION_ST_STATIONARY")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOTION_ST_MOVING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOTION_ST_PEDESTRIAN")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOTION_ST_DRIVING")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MOTION_ST_SEMISTATIONARY")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDopplerEstimate:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_dopplerEstimate = a3;
}

- (void)setHasDopplerEstimate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDopplerEstimate
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setBandInd:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_bandInd = a3;
}

- (void)setHasBandInd:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBandInd
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasSubsId
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasPsPref
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
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
  v8.super_class = (Class)CellularNrBeamSwitch;
  v3 = -[CellularNrBeamSwitch description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularNrBeamSwitch dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  id v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  NSMutableArray *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  char v21;
  void *v22;
  NSData *plmn;
  uint64_t motionState;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_durationBeforeSwitch));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("duration_before_switch"));

  }
  if (-[NSMutableArray count](self->_oldBeamInfos, "count"))
  {
    v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_oldBeamInfos, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v8 = self->_oldBeamInfos;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("old_beam_info"));
  }
  if (-[NSMutableArray count](self->_thenewBeamInfos, "count"))
  {
    v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_thenewBeamInfos, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v15 = self->_thenewBeamInfos;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(_QWORD *)v32 != v18)
            objc_enumerationMutation(v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)j), "dictionaryRepresentation"));
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("new_beam_info"));
  }
  v21 = (char)self->_has;
  if ((v21 & 0x10) != 0)
  {
    motionState = self->_motionState;
    if (motionState >= 5)
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_motionState));
    else
      v26 = *(&off_10025F9A0 + motionState);
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("motion_state"));

    v21 = (char)self->_has;
    if ((v21 & 4) == 0)
    {
LABEL_25:
      if ((v21 & 2) == 0)
        goto LABEL_26;
      goto LABEL_38;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_25;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dopplerEstimate));
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("doppler_estimate"));

  v21 = (char)self->_has;
  if ((v21 & 2) == 0)
  {
LABEL_26:
    if ((v21 & 0x80) == 0)
      goto LABEL_27;
    goto LABEL_39;
  }
LABEL_38:
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_bandInd));
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("band_ind"));

  v21 = (char)self->_has;
  if ((v21 & 0x80) == 0)
  {
LABEL_27:
    if ((v21 & 0x20) == 0)
      goto LABEL_28;
    goto LABEL_40;
  }
LABEL_39:
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("subs_id"));

  v21 = (char)self->_has;
  if ((v21 & 0x20) == 0)
  {
LABEL_28:
    if ((v21 & 0x40) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_40:
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("num_subs"));

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_29:
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("ps_pref"));

  }
LABEL_30:
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000E34C4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
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
  char v17;
  NSData *plmn;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v4 = a3;
  v5 = v4;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
    PBDataWriterWriteUint32Field(v5, self->_durationBeforeSwitch, 2);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = self->_oldBeamInfos;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), 3);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v9);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_thenewBeamInfos;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j), 4);
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  v17 = (char)self->_has;
  if ((v17 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field(v5, self->_motionState, 5);
    v17 = (char)self->_has;
    if ((v17 & 4) == 0)
    {
LABEL_21:
      if ((v17 & 2) == 0)
        goto LABEL_22;
      goto LABEL_32;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteUint32Field(v5, self->_dopplerEstimate, 6);
  v17 = (char)self->_has;
  if ((v17 & 2) == 0)
  {
LABEL_22:
    if ((v17 & 0x20) == 0)
      goto LABEL_23;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field(v5, self->_bandInd, 7);
  v17 = (char)self->_has;
  if ((v17 & 0x20) == 0)
  {
LABEL_23:
    if ((v17 & 0x40) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_33:
  PBDataWriterWriteUint32Field(v5, self->_numSubs, 12);
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
LABEL_24:
    PBDataWriterWriteUint32Field(v5, self->_psPref, 13);
LABEL_25:
  plmn = self->_plmn;
  if (plmn)
    PBDataWriterWriteDataField(v5, plmn, 14);
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    PBDataWriterWriteUint32Field(v5, self->_subsId, 15);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  id v13;
  char v14;
  _DWORD *v15;
  id v16;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 72) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_durationBeforeSwitch;
    *((_BYTE *)v4 + 72) |= 8u;
  }
  v16 = v4;
  if (-[CellularNrBeamSwitch oldBeamInfosCount](self, "oldBeamInfosCount"))
  {
    objc_msgSend(v16, "clearOldBeamInfos");
    v6 = -[CellularNrBeamSwitch oldBeamInfosCount](self, "oldBeamInfosCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CellularNrBeamSwitch oldBeamInfoAtIndex:](self, "oldBeamInfoAtIndex:", i));
        objc_msgSend(v16, "addOldBeamInfo:", v9);

      }
    }
  }
  if (-[CellularNrBeamSwitch newBeamInfosCount](self, "newBeamInfosCount"))
  {
    objc_msgSend(v16, "clearNewBeamInfos");
    v10 = -[CellularNrBeamSwitch newBeamInfosCount](self, "newBeamInfosCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        v13 = -[CellularNrBeamSwitch newBeamInfoAtIndex:](self, "newBeamInfoAtIndex:", j);
        objc_msgSend(v16, "addNewBeamInfo:", v13);

      }
    }
  }
  v14 = (char)self->_has;
  v15 = v16;
  if ((v14 & 0x10) != 0)
  {
    *((_DWORD *)v16 + 7) = self->_motionState;
    *((_BYTE *)v16 + 72) |= 0x10u;
    v14 = (char)self->_has;
    if ((v14 & 4) == 0)
    {
LABEL_15:
      if ((v14 & 2) == 0)
        goto LABEL_16;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v16 + 5) = self->_dopplerEstimate;
  *((_BYTE *)v16 + 72) |= 4u;
  v14 = (char)self->_has;
  if ((v14 & 2) == 0)
  {
LABEL_16:
    if ((v14 & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v16 + 4) = self->_bandInd;
  *((_BYTE *)v16 + 72) |= 2u;
  v14 = (char)self->_has;
  if ((v14 & 0x20) == 0)
  {
LABEL_17:
    if ((v14 & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_27:
  *((_DWORD *)v16 + 10) = self->_numSubs;
  *((_BYTE *)v16 + 72) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_18:
    *((_DWORD *)v16 + 16) = self->_psPref;
    *((_BYTE *)v16 + 72) |= 0x40u;
  }
LABEL_19:
  if (self->_plmn)
  {
    objc_msgSend(v16, "setPlmn:");
    v15 = v16;
  }
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    v15[17] = self->_subsId;
    *((_BYTE *)v15 + 72) |= 0x80u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  char has;
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
  char v20;
  id v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_BYTE *)v5 + 72) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_durationBeforeSwitch;
    *((_BYTE *)v5 + 72) |= 8u;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = self->_oldBeamInfos;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3);
        objc_msgSend(v6, "addOldBeamInfo:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v10);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = self->_thenewBeamInfos;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend(v6, "addNewBeamInfo:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v16);
  }

  v20 = (char)self->_has;
  if ((v20 & 0x10) != 0)
  {
    *((_DWORD *)v6 + 7) = self->_motionState;
    *((_BYTE *)v6 + 72) |= 0x10u;
    v20 = (char)self->_has;
    if ((v20 & 4) == 0)
    {
LABEL_21:
      if ((v20 & 2) == 0)
        goto LABEL_22;
      goto LABEL_30;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_21;
  }
  *((_DWORD *)v6 + 5) = self->_dopplerEstimate;
  *((_BYTE *)v6 + 72) |= 4u;
  v20 = (char)self->_has;
  if ((v20 & 2) == 0)
  {
LABEL_22:
    if ((v20 & 0x20) == 0)
      goto LABEL_23;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v6 + 4) = self->_bandInd;
  *((_BYTE *)v6 + 72) |= 2u;
  v20 = (char)self->_has;
  if ((v20 & 0x20) == 0)
  {
LABEL_23:
    if ((v20 & 0x40) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_31:
  *((_DWORD *)v6 + 10) = self->_numSubs;
  *((_BYTE *)v6 + 72) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_24:
    *((_DWORD *)v6 + 16) = self->_psPref;
    *((_BYTE *)v6 + 72) |= 0x40u;
  }
LABEL_25:
  v21 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3, (_QWORD)v24);
  v22 = (void *)*((_QWORD *)v6 + 7);
  *((_QWORD *)v6 + 7) = v21;

  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *((_DWORD *)v6 + 17) = self->_subsId;
    *((_BYTE *)v6 + 72) |= 0x80u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  NSMutableArray *oldBeamInfos;
  NSMutableArray *thenewBeamInfos;
  char has;
  NSData *plmn;
  int v10;
  BOOL v11;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_49;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[72] & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_49;
  }
  else if ((v4[72] & 1) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[72] & 8) == 0 || self->_durationBeforeSwitch != *((_DWORD *)v4 + 6))
      goto LABEL_49;
  }
  else if ((v4[72] & 8) != 0)
  {
    goto LABEL_49;
  }
  oldBeamInfos = self->_oldBeamInfos;
  if ((unint64_t)oldBeamInfos | *((_QWORD *)v4 + 6)
    && !-[NSMutableArray isEqual:](oldBeamInfos, "isEqual:"))
  {
    goto LABEL_49;
  }
  thenewBeamInfos = self->_thenewBeamInfos;
  if ((unint64_t)thenewBeamInfos | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](thenewBeamInfos, "isEqual:"))
      goto LABEL_49;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    if ((v4[72] & 0x10) == 0 || self->_motionState != *((_DWORD *)v4 + 7))
      goto LABEL_49;
  }
  else if ((v4[72] & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[72] & 4) == 0 || self->_dopplerEstimate != *((_DWORD *)v4 + 5))
      goto LABEL_49;
  }
  else if ((v4[72] & 4) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[72] & 2) == 0 || self->_bandInd != *((_DWORD *)v4 + 4))
      goto LABEL_49;
  }
  else if ((v4[72] & 2) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((v4[72] & 0x20) == 0 || self->_numSubs != *((_DWORD *)v4 + 10))
      goto LABEL_49;
  }
  else if ((v4[72] & 0x20) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((v4[72] & 0x40) == 0 || self->_psPref != *((_DWORD *)v4 + 16))
      goto LABEL_49;
  }
  else if ((v4[72] & 0x40) != 0)
  {
    goto LABEL_49;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](plmn, "isEqual:"))
    {
LABEL_49:
      v11 = 0;
      goto LABEL_50;
    }
    has = (char)self->_has;
  }
  v10 = v4[72];
  if (has < 0)
  {
    if ((v10 & 0x80000000) == 0 || self->_subsId != *((_DWORD *)v4 + 17))
      goto LABEL_49;
    v11 = 1;
  }
  else
  {
    v11 = v10 >= 0;
  }
LABEL_50:

  return v11;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  unint64_t v15;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v15 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  else
  {
    v15 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v3 = -[NSMutableArray hash](self->_oldBeamInfos, "hash", 2654435761 * self->_durationBeforeSwitch);
      goto LABEL_6;
    }
  }
  v3 = -[NSMutableArray hash](self->_oldBeamInfos, "hash", 0);
LABEL_6:
  v4 = (unint64_t)v3;
  v5 = (unint64_t)-[NSMutableArray hash](self->_thenewBeamInfos, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v6 = 2654435761 * self->_motionState;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_8:
      v7 = 2654435761 * self->_dopplerEstimate;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_9;
      goto LABEL_14;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_8;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_9:
    v8 = 2654435761 * self->_bandInd;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_10;
LABEL_15:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_11;
    goto LABEL_16;
  }
LABEL_14:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_15;
LABEL_10:
  v9 = 2654435761 * self->_numSubs;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_11:
    v10 = 2654435761 * self->_psPref;
    goto LABEL_17;
  }
LABEL_16:
  v10 = 0;
LABEL_17:
  v11 = (unint64_t)-[NSData hash](self->_plmn, "hash");
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    v12 = 2654435761 * self->_subsId;
  else
    v12 = 0;
  return v14 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  char *v5;
  char v6;
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
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  v4 = (char *)a3;
  v5 = v4;
  v6 = v4[72];
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = v4[72];
  }
  if ((v6 & 8) != 0)
  {
    self->_durationBeforeSwitch = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 8u;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = *((id *)v4 + 6);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        -[CellularNrBeamSwitch addOldBeamInfo:](self, "addOldBeamInfo:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v9);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = *((id *)v5 + 4);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        -[CellularNrBeamSwitch addNewBeamInfo:](self, "addNewBeamInfo:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)j), (_QWORD)v18);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

  v17 = v5[72];
  if ((v17 & 0x10) != 0)
  {
    self->_motionState = *((_DWORD *)v5 + 7);
    *(_BYTE *)&self->_has |= 0x10u;
    v17 = v5[72];
    if ((v17 & 4) == 0)
    {
LABEL_21:
      if ((v17 & 2) == 0)
        goto LABEL_22;
      goto LABEL_32;
    }
  }
  else if ((v5[72] & 4) == 0)
  {
    goto LABEL_21;
  }
  self->_dopplerEstimate = *((_DWORD *)v5 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v17 = v5[72];
  if ((v17 & 2) == 0)
  {
LABEL_22:
    if ((v17 & 0x20) == 0)
      goto LABEL_23;
    goto LABEL_33;
  }
LABEL_32:
  self->_bandInd = *((_DWORD *)v5 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v17 = v5[72];
  if ((v17 & 0x20) == 0)
  {
LABEL_23:
    if ((v17 & 0x40) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_33:
  self->_numSubs = *((_DWORD *)v5 + 10);
  *(_BYTE *)&self->_has |= 0x20u;
  if ((v5[72] & 0x40) != 0)
  {
LABEL_24:
    self->_psPref = *((_DWORD *)v5 + 16);
    *(_BYTE *)&self->_has |= 0x40u;
  }
LABEL_25:
  if (*((_QWORD *)v5 + 7))
    -[CellularNrBeamSwitch setPlmn:](self, "setPlmn:");
  if (v5[72] < 0)
  {
    self->_subsId = *((_DWORD *)v5 + 17);
    *(_BYTE *)&self->_has |= 0x80u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationBeforeSwitch
{
  return self->_durationBeforeSwitch;
}

- (NSMutableArray)oldBeamInfos
{
  return self->_oldBeamInfos;
}

- (void)setOldBeamInfos:(id)a3
{
  objc_storeStrong((id *)&self->_oldBeamInfos, a3);
}

- (NSMutableArray)thenewBeamInfos
{
  return self->_thenewBeamInfos;
}

- (void)setThenewBeamInfos:(id)a3
{
  objc_storeStrong((id *)&self->_thenewBeamInfos, a3);
}

- (unsigned)dopplerEstimate
{
  return self->_dopplerEstimate;
}

- (unsigned)bandInd
{
  return self->_bandInd;
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
  objc_storeStrong((id *)&self->_oldBeamInfos, 0);
  objc_storeStrong((id *)&self->_thenewBeamInfos, 0);
}

@end
