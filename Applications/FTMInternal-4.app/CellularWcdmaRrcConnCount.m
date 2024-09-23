@implementation CellularWcdmaRrcConnCount

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  PBRepeatedUInt32Clear(&self->_rrcConnReqCauses, a2);
  PBRepeatedUInt32Clear(&self->_rlfCauseSensors, v3);
  PBRepeatedUInt32Clear(&self->_establishCauses, v4);
  PBRepeatedUInt32Clear(&self->_releaseCauses, v5);
  PBRepeatedUInt32Clear(&self->_rlfCauses, v6);
  v7.receiver = self;
  v7.super_class = (Class)CellularWcdmaRrcConnCount;
  -[CellularWcdmaRrcConnCount dealloc](&v7, "dealloc");
}

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

- (void)setDurationSeconds:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_durationSeconds = a3;
}

- (void)setHasDurationSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDurationSeconds
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (unint64_t)rrcConnReqCausesCount
{
  return self->_rrcConnReqCauses.count;
}

- (unsigned)rrcConnReqCauses
{
  return self->_rrcConnReqCauses.list;
}

- (void)clearRrcConnReqCauses
{
  PBRepeatedUInt32Clear(&self->_rrcConnReqCauses, a2);
}

- (void)addRrcConnReqCause:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_rrcConnReqCauses, *(_QWORD *)&a3);
}

- (unsigned)rrcConnReqCauseAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rrcConnReqCauses;
  unint64_t count;
  void *v6;
  void *v7;

  p_rrcConnReqCauses = &self->_rrcConnReqCauses;
  count = self->_rrcConnReqCauses.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_rrcConnReqCauses->list[a3];
}

- (void)setRrcConnReqCauses:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_rrcConnReqCauses, a3, a4);
}

- (void)setRrcSetupComp:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_rrcSetupComp = a3;
}

- (void)setHasRrcSetupComp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRrcSetupComp
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setDrbEstComp:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_drbEstComp = a3;
}

- (void)setHasDrbEstComp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDrbEstComp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (unint64_t)rlfCauseSensorsCount
{
  return self->_rlfCauseSensors.count;
}

- (unsigned)rlfCauseSensors
{
  return self->_rlfCauseSensors.list;
}

- (void)clearRlfCauseSensors
{
  PBRepeatedUInt32Clear(&self->_rlfCauseSensors, a2);
}

- (void)addRlfCauseSensor:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_rlfCauseSensors, *(_QWORD *)&a3);
}

- (unsigned)rlfCauseSensorAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rlfCauseSensors;
  unint64_t count;
  void *v6;
  void *v7;

  p_rlfCauseSensors = &self->_rlfCauseSensors;
  count = self->_rlfCauseSensors.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_rlfCauseSensors->list[a3];
}

- (void)setRlfCauseSensors:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_rlfCauseSensors, a3, a4);
}

- (unint64_t)establishCausesCount
{
  return self->_establishCauses.count;
}

- (unsigned)establishCauses
{
  return self->_establishCauses.list;
}

- (void)clearEstablishCauses
{
  PBRepeatedUInt32Clear(&self->_establishCauses, a2);
}

- (void)addEstablishCause:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_establishCauses, *(_QWORD *)&a3);
}

- (unsigned)establishCauseAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_establishCauses;
  unint64_t count;
  void *v6;
  void *v7;

  p_establishCauses = &self->_establishCauses;
  count = self->_establishCauses.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_establishCauses->list[a3];
}

- (void)setEstablishCauses:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_establishCauses, a3, a4);
}

- (unint64_t)releaseCausesCount
{
  return self->_releaseCauses.count;
}

- (unsigned)releaseCauses
{
  return self->_releaseCauses.list;
}

- (void)clearReleaseCauses
{
  PBRepeatedUInt32Clear(&self->_releaseCauses, a2);
}

- (void)addReleaseCause:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_releaseCauses, *(_QWORD *)&a3);
}

- (unsigned)releaseCauseAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_releaseCauses;
  unint64_t count;
  void *v6;
  void *v7;

  p_releaseCauses = &self->_releaseCauses;
  count = self->_releaseCauses.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_releaseCauses->list[a3];
}

- (void)setReleaseCauses:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_releaseCauses, a3, a4);
}

- (unint64_t)rlfCausesCount
{
  return self->_rlfCauses.count;
}

- (unsigned)rlfCauses
{
  return self->_rlfCauses.list;
}

- (void)clearRlfCauses
{
  PBRepeatedUInt32Clear(&self->_rlfCauses, a2);
}

- (void)addRlfCause:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_rlfCauses, *(_QWORD *)&a3);
}

- (unsigned)rlfCauseAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rlfCauses;
  unint64_t count;
  void *v6;
  void *v7;

  p_rlfCauses = &self->_rlfCauses;
  count = self->_rlfCauses.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_rlfCauses->list[a3];
}

- (void)setRlfCauses:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_rlfCauses, a3, a4);
}

- (void)clearConnReqRels
{
  -[NSMutableArray removeAllObjects](self->_connReqRels, "removeAllObjects");
}

- (void)addConnReqRel:(id)a3
{
  id v4;
  NSMutableArray *connReqRels;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  connReqRels = self->_connReqRels;
  v8 = v4;
  if (!connReqRels)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_connReqRels;
    self->_connReqRels = v6;

    v4 = v8;
    connReqRels = self->_connReqRels;
  }
  -[NSMutableArray addObject:](connReqRels, "addObject:", v4);

}

- (unint64_t)connReqRelsCount
{
  return (unint64_t)-[NSMutableArray count](self->_connReqRels, "count");
}

- (id)connReqRelAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_connReqRels, "objectAtIndex:", a3);
}

+ (Class)connReqRelType
{
  return (Class)objc_opt_class(RrcConnReqRel, a2);
}

- (void)setSubsId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPsPref
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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
  v8.super_class = (Class)CellularWcdmaRrcConnCount;
  v3 = -[CellularWcdmaRrcConnCount description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularWcdmaRrcConnCount dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSMutableArray *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  char v27;
  void *v28;
  NSData *plmn;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_durationSeconds));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("duration_seconds"));

  }
  v7 = PBRepeatedUInt32NSArray(&self->_rrcConnReqCauses);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("rrc_conn_req_cause"));

  v9 = (char)self->_has;
  if ((v9 & 0x20) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rrcSetupComp));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("rrc_setup_comp"));

    v9 = (char)self->_has;
  }
  if ((v9 & 2) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_drbEstComp));
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("drb_est_comp"));

  }
  v12 = PBRepeatedUInt32NSArray(&self->_rlfCauseSensors);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("rlf_cause_sensor"));

  v14 = PBRepeatedUInt32NSArray(&self->_establishCauses);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("establish_cause"));

  v16 = PBRepeatedUInt32NSArray(&self->_releaseCauses);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("release_cause"));

  v18 = PBRepeatedUInt32NSArray(&self->_rlfCauses);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("rlf_cause"));

  if (-[NSMutableArray count](self->_connReqRels, "count"))
  {
    v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_connReqRels, "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v21 = self->_connReqRels;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v24)
            objc_enumerationMutation(v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation", (_QWORD)v33));
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v23);
    }

    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("conn_req_rel"));
  }
  v27 = (char)self->_has;
  if ((v27 & 0x40) != 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("subs_id"));

    v27 = (char)self->_has;
    if ((v27 & 8) == 0)
    {
LABEL_20:
      if ((v27 & 0x10) == 0)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_20;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs, (_QWORD)v33));
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("num_subs"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_21:
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref, (_QWORD)v33));
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("ps_pref"));

  }
LABEL_22:
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000453A4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  unint64_t v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  char v18;
  NSData *plmn;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _BYTE v25[128];

  v4 = a3;
  v5 = v4;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteUint32Field(v5, self->_durationSeconds, 2);
  if (self->_rrcConnReqCauses.count)
  {
    v24 = 0;
    PBDataWriterPlaceMark(v5, &v24, 3);
    if (self->_rrcConnReqCauses.count)
    {
      v7 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_rrcConnReqCauses.list[v7++], 0xFFFFFFFFLL);
      while (v7 < self->_rrcConnReqCauses.count);
    }
    PBDataWriterRecallMark(v5, &v24);
  }
  v8 = (char)self->_has;
  if ((v8 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_rrcSetupComp, 5);
    v8 = (char)self->_has;
  }
  if ((v8 & 2) != 0)
    PBDataWriterWriteUint32Field(v5, self->_drbEstComp, 6);
  if (self->_rlfCauseSensors.count)
  {
    v9 = 0;
    do
      PBDataWriterWriteUint32Field(v5, self->_rlfCauseSensors.list[v9++], 10);
    while (v9 < self->_rlfCauseSensors.count);
  }
  if (self->_establishCauses.count)
  {
    v10 = 0;
    do
      PBDataWriterWriteUint32Field(v5, self->_establishCauses.list[v10++], 11);
    while (v10 < self->_establishCauses.count);
  }
  if (self->_releaseCauses.count)
  {
    v11 = 0;
    do
      PBDataWriterWriteUint32Field(v5, self->_releaseCauses.list[v11++], 12);
    while (v11 < self->_releaseCauses.count);
  }
  if (self->_rlfCauses.count)
  {
    v12 = 0;
    do
      PBDataWriterWriteUint32Field(v5, self->_rlfCauses.list[v12++], 13);
    while (v12 < self->_rlfCauses.count);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = self->_connReqRels;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), 15);
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v15);
  }

  v18 = (char)self->_has;
  if ((v18 & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_subsId, 16);
    v18 = (char)self->_has;
    if ((v18 & 8) == 0)
    {
LABEL_35:
      if ((v18 & 0x10) == 0)
        goto LABEL_37;
      goto LABEL_36;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_35;
  }
  PBDataWriterWriteUint32Field(v5, self->_numSubs, 17);
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_36:
    PBDataWriterWriteUint32Field(v5, self->_psPref, 18);
LABEL_37:
  plmn = self->_plmn;
  if (plmn)
    PBDataWriterWriteDataField(v5, plmn, 19);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  char v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  unint64_t v19;
  unint64_t v20;
  uint64_t n;
  unint64_t v22;
  unint64_t v23;
  uint64_t ii;
  void *v25;
  char v26;
  void *v27;
  id v28;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[16] = self->_timestamp;
    *((_BYTE *)v4 + 180) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 37) = self->_durationSeconds;
    *((_BYTE *)v4 + 180) |= 4u;
  }
  v28 = v4;
  if (-[CellularWcdmaRrcConnCount rrcConnReqCausesCount](self, "rrcConnReqCausesCount"))
  {
    objc_msgSend(v28, "clearRrcConnReqCauses");
    v6 = -[CellularWcdmaRrcConnCount rrcConnReqCausesCount](self, "rrcConnReqCausesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v28, "addRrcConnReqCause:", -[CellularWcdmaRrcConnCount rrcConnReqCauseAtIndex:](self, "rrcConnReqCauseAtIndex:", i));
    }
  }
  v9 = (char)self->_has;
  if ((v9 & 0x20) != 0)
  {
    *((_DWORD *)v28 + 43) = self->_rrcSetupComp;
    *((_BYTE *)v28 + 180) |= 0x20u;
    v9 = (char)self->_has;
  }
  if ((v9 & 2) != 0)
  {
    *((_DWORD *)v28 + 36) = self->_drbEstComp;
    *((_BYTE *)v28 + 180) |= 2u;
  }
  if (-[CellularWcdmaRrcConnCount rlfCauseSensorsCount](self, "rlfCauseSensorsCount"))
  {
    objc_msgSend(v28, "clearRlfCauseSensors");
    v10 = -[CellularWcdmaRrcConnCount rlfCauseSensorsCount](self, "rlfCauseSensorsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
        objc_msgSend(v28, "addRlfCauseSensor:", -[CellularWcdmaRrcConnCount rlfCauseSensorAtIndex:](self, "rlfCauseSensorAtIndex:", j));
    }
  }
  if (-[CellularWcdmaRrcConnCount establishCausesCount](self, "establishCausesCount"))
  {
    objc_msgSend(v28, "clearEstablishCauses");
    v13 = -[CellularWcdmaRrcConnCount establishCausesCount](self, "establishCausesCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
        objc_msgSend(v28, "addEstablishCause:", -[CellularWcdmaRrcConnCount establishCauseAtIndex:](self, "establishCauseAtIndex:", k));
    }
  }
  if (-[CellularWcdmaRrcConnCount releaseCausesCount](self, "releaseCausesCount"))
  {
    objc_msgSend(v28, "clearReleaseCauses");
    v16 = -[CellularWcdmaRrcConnCount releaseCausesCount](self, "releaseCausesCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
        objc_msgSend(v28, "addReleaseCause:", -[CellularWcdmaRrcConnCount releaseCauseAtIndex:](self, "releaseCauseAtIndex:", m));
    }
  }
  if (-[CellularWcdmaRrcConnCount rlfCausesCount](self, "rlfCausesCount"))
  {
    objc_msgSend(v28, "clearRlfCauses");
    v19 = -[CellularWcdmaRrcConnCount rlfCausesCount](self, "rlfCausesCount");
    if (v19)
    {
      v20 = v19;
      for (n = 0; n != v20; ++n)
        objc_msgSend(v28, "addRlfCause:", -[CellularWcdmaRrcConnCount rlfCauseAtIndex:](self, "rlfCauseAtIndex:", n));
    }
  }
  if (-[CellularWcdmaRrcConnCount connReqRelsCount](self, "connReqRelsCount"))
  {
    objc_msgSend(v28, "clearConnReqRels");
    v22 = -[CellularWcdmaRrcConnCount connReqRelsCount](self, "connReqRelsCount");
    if (v22)
    {
      v23 = v22;
      for (ii = 0; ii != v23; ++ii)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[CellularWcdmaRrcConnCount connReqRelAtIndex:](self, "connReqRelAtIndex:", ii));
        objc_msgSend(v28, "addConnReqRel:", v25);

      }
    }
  }
  v26 = (char)self->_has;
  v27 = v28;
  if ((v26 & 0x40) != 0)
  {
    *((_DWORD *)v28 + 44) = self->_subsId;
    *((_BYTE *)v28 + 180) |= 0x40u;
    v26 = (char)self->_has;
    if ((v26 & 8) == 0)
    {
LABEL_35:
      if ((v26 & 0x10) == 0)
        goto LABEL_37;
      goto LABEL_36;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_35;
  }
  *((_DWORD *)v28 + 38) = self->_numSubs;
  *((_BYTE *)v28 + 180) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_36:
    *((_DWORD *)v28 + 42) = self->_psPref;
    *((_BYTE *)v28 + 180) |= 0x10u;
  }
LABEL_37:
  if (self->_plmn)
  {
    objc_msgSend(v28, "setPlmn:");
    v27 = v28;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _DWORD *v6;
  char has;
  char v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  id v14;
  char v15;
  id v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[16] = self->_timestamp;
    *((_BYTE *)v5 + 180) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v5 + 37) = self->_durationSeconds;
    *((_BYTE *)v5 + 180) |= 4u;
  }
  PBRepeatedUInt32Copy(v5 + 13, &self->_rrcConnReqCauses);
  v8 = (char)self->_has;
  if ((v8 & 0x20) != 0)
  {
    v6[43] = self->_rrcSetupComp;
    *((_BYTE *)v6 + 180) |= 0x20u;
    v8 = (char)self->_has;
  }
  if ((v8 & 2) != 0)
  {
    v6[36] = self->_drbEstComp;
    *((_BYTE *)v6 + 180) |= 2u;
  }
  PBRepeatedUInt32Copy(v6 + 14, &self->_rlfCauseSensors);
  PBRepeatedUInt32Copy(v6 + 2, &self->_establishCauses);
  PBRepeatedUInt32Copy(v6 + 8, &self->_releaseCauses);
  PBRepeatedUInt32Copy(v6 + 20, &self->_rlfCauses);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = self->_connReqRels;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend(v6, "addConnReqRel:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  v15 = (char)self->_has;
  if ((v15 & 0x40) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_18;
LABEL_22:
    v6[38] = self->_numSubs;
    *((_BYTE *)v6 + 180) |= 8u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
  v6[44] = self->_subsId;
  *((_BYTE *)v6 + 180) |= 0x40u;
  v15 = (char)self->_has;
  if ((v15 & 8) != 0)
    goto LABEL_22;
LABEL_18:
  if ((v15 & 0x10) != 0)
  {
LABEL_19:
    v6[42] = self->_psPref;
    *((_BYTE *)v6 + 180) |= 0x10u;
  }
LABEL_20:
  v16 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3, (_QWORD)v19);
  v17 = (void *)*((_QWORD *)v6 + 20);
  *((_QWORD *)v6 + 20) = v16;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  NSMutableArray *connReqRels;
  NSData *plmn;
  unsigned __int8 v8;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_46;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[180] & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 16))
      goto LABEL_46;
  }
  else if ((v4[180] & 1) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[180] & 4) == 0 || self->_durationSeconds != *((_DWORD *)v4 + 37))
      goto LABEL_46;
  }
  else if ((v4[180] & 4) != 0)
  {
    goto LABEL_46;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_rrcConnReqCauses, v4 + 104))
  {
LABEL_46:
    v8 = 0;
    goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((v4[180] & 0x20) == 0 || self->_rrcSetupComp != *((_DWORD *)v4 + 43))
      goto LABEL_46;
  }
  else if ((v4[180] & 0x20) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[180] & 2) == 0 || self->_drbEstComp != *((_DWORD *)v4 + 36))
      goto LABEL_46;
  }
  else if ((v4[180] & 2) != 0)
  {
    goto LABEL_46;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_rlfCauseSensors, v4 + 56))
    goto LABEL_46;
  if (!PBRepeatedUInt32IsEqual(&self->_establishCauses, v4 + 8))
    goto LABEL_46;
  if (!PBRepeatedUInt32IsEqual(&self->_releaseCauses, v4 + 32))
    goto LABEL_46;
  if (!PBRepeatedUInt32IsEqual(&self->_rlfCauses, v4 + 80))
    goto LABEL_46;
  connReqRels = self->_connReqRels;
  if ((unint64_t)connReqRels | *((_QWORD *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](connReqRels, "isEqual:"))
      goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((v4[180] & 0x40) == 0 || self->_subsId != *((_DWORD *)v4 + 44))
      goto LABEL_46;
  }
  else if ((v4[180] & 0x40) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[180] & 8) == 0 || self->_numSubs != *((_DWORD *)v4 + 38))
      goto LABEL_46;
  }
  else if ((v4[180] & 8) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((v4[180] & 0x10) == 0 || self->_psPref != *((_DWORD *)v4 + 42))
      goto LABEL_46;
  }
  else if ((v4[180] & 0x10) != 0)
  {
    goto LABEL_46;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 20))
    v8 = -[NSData isEqual:](plmn, "isEqual:");
  else
    v8 = 1;
LABEL_47:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v16;
  unint64_t v17;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v17 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v17 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v16 = 2654435761 * self->_durationSeconds;
      goto LABEL_6;
    }
  }
  v16 = 0;
LABEL_6:
  v3 = PBRepeatedUInt32Hash(&self->_rrcConnReqCauses);
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v4 = 2654435761 * self->_rrcSetupComp;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_8;
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_8:
      v5 = 2654435761 * self->_drbEstComp;
      goto LABEL_11;
    }
  }
  v5 = 0;
LABEL_11:
  v6 = PBRepeatedUInt32Hash(&self->_rlfCauseSensors);
  v7 = PBRepeatedUInt32Hash(&self->_establishCauses);
  v8 = PBRepeatedUInt32Hash(&self->_releaseCauses);
  v9 = PBRepeatedUInt32Hash(&self->_rlfCauses);
  v10 = (unint64_t)-[NSMutableArray hash](self->_connReqRels, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    v11 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_13;
LABEL_16:
    v12 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_14;
LABEL_17:
    v13 = 0;
    goto LABEL_18;
  }
  v11 = 2654435761 * self->_subsId;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_16;
LABEL_13:
  v12 = 2654435761 * self->_numSubs;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_17;
LABEL_14:
  v13 = 2654435761 * self->_psPref;
LABEL_18:
  v14 = v16 ^ v17 ^ v4 ^ v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v10;
  return v14 ^ v12 ^ v13 ^ (unint64_t)-[NSData hash](self->_plmn, "hash", v16);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  char *v7;
  char *v8;
  char *i;
  char v10;
  char *v11;
  char *v12;
  char *j;
  char *v14;
  char *v15;
  char *k;
  char *v17;
  char *v18;
  char *m;
  char *v20;
  char *v21;
  char *n;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *ii;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 180);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 180);
  }
  if ((v6 & 4) != 0)
  {
    self->_durationSeconds = *((_DWORD *)v4 + 37);
    *(_BYTE *)&self->_has |= 4u;
  }
  v7 = (char *)objc_msgSend(v4, "rrcConnReqCausesCount");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
      -[CellularWcdmaRrcConnCount addRrcConnReqCause:](self, "addRrcConnReqCause:", objc_msgSend(v5, "rrcConnReqCauseAtIndex:", i));
  }
  v10 = *((_BYTE *)v5 + 180);
  if ((v10 & 0x20) != 0)
  {
    self->_rrcSetupComp = *((_DWORD *)v5 + 43);
    *(_BYTE *)&self->_has |= 0x20u;
    v10 = *((_BYTE *)v5 + 180);
  }
  if ((v10 & 2) != 0)
  {
    self->_drbEstComp = *((_DWORD *)v5 + 36);
    *(_BYTE *)&self->_has |= 2u;
  }
  v11 = (char *)objc_msgSend(v5, "rlfCauseSensorsCount");
  if (v11)
  {
    v12 = v11;
    for (j = 0; j != v12; ++j)
      -[CellularWcdmaRrcConnCount addRlfCauseSensor:](self, "addRlfCauseSensor:", objc_msgSend(v5, "rlfCauseSensorAtIndex:", j));
  }
  v14 = (char *)objc_msgSend(v5, "establishCausesCount");
  if (v14)
  {
    v15 = v14;
    for (k = 0; k != v15; ++k)
      -[CellularWcdmaRrcConnCount addEstablishCause:](self, "addEstablishCause:", objc_msgSend(v5, "establishCauseAtIndex:", k));
  }
  v17 = (char *)objc_msgSend(v5, "releaseCausesCount");
  if (v17)
  {
    v18 = v17;
    for (m = 0; m != v18; ++m)
      -[CellularWcdmaRrcConnCount addReleaseCause:](self, "addReleaseCause:", objc_msgSend(v5, "releaseCauseAtIndex:", m));
  }
  v20 = (char *)objc_msgSend(v5, "rlfCausesCount");
  if (v20)
  {
    v21 = v20;
    for (n = 0; n != v21; ++n)
      -[CellularWcdmaRrcConnCount addRlfCause:](self, "addRlfCause:", objc_msgSend(v5, "rlfCauseAtIndex:", n));
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v23 = *((id *)v5 + 17);
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v30;
    do
    {
      for (ii = 0; ii != v25; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v30 != v26)
          objc_enumerationMutation(v23);
        -[CellularWcdmaRrcConnCount addConnReqRel:](self, "addConnReqRel:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)ii), (_QWORD)v29);
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v25);
  }

  v28 = *((_BYTE *)v5 + 180);
  if ((v28 & 0x40) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 44);
    *(_BYTE *)&self->_has |= 0x40u;
    v28 = *((_BYTE *)v5 + 180);
    if ((v28 & 8) == 0)
    {
LABEL_33:
      if ((v28 & 0x10) == 0)
        goto LABEL_35;
      goto LABEL_34;
    }
  }
  else if ((*((_BYTE *)v5 + 180) & 8) == 0)
  {
    goto LABEL_33;
  }
  self->_numSubs = *((_DWORD *)v5 + 38);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v5 + 180) & 0x10) != 0)
  {
LABEL_34:
    self->_psPref = *((_DWORD *)v5 + 42);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_35:
  if (*((_QWORD *)v5 + 20))
    -[CellularWcdmaRrcConnCount setPlmn:](self, "setPlmn:");

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationSeconds
{
  return self->_durationSeconds;
}

- (unsigned)rrcSetupComp
{
  return self->_rrcSetupComp;
}

- (unsigned)drbEstComp
{
  return self->_drbEstComp;
}

- (NSMutableArray)connReqRels
{
  return self->_connReqRels;
}

- (void)setConnReqRels:(id)a3
{
  objc_storeStrong((id *)&self->_connReqRels, a3);
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
  objc_storeStrong((id *)&self->_connReqRels, 0);
}

@end
