@implementation CellularNrRrcConnCount

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  PBRepeatedUInt32Clear(&self->_rrcConnSetupReqs, a2);
  PBRepeatedUInt32Clear(&self->_rrcConnRejects, v3);
  PBRepeatedUInt32Clear(&self->_rrcConnRlfs, v4);
  PBRepeatedUInt32Clear(&self->_rrcConnReestReqs, v5);
  PBRepeatedUInt32Clear(&self->_rrcConnRels, v6);
  PBRepeatedUInt32Clear(&self->_rrcResumeReqs, v7);
  v8.receiver = self;
  v8.super_class = (Class)CellularNrRrcConnCount;
  -[CellularNrRrcConnCount dealloc](&v8, "dealloc");
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

- (void)setDurationSeconds:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_durationSeconds = a3;
}

- (void)setHasDurationSeconds:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDurationSeconds
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (unint64_t)rrcConnSetupReqsCount
{
  return self->_rrcConnSetupReqs.count;
}

- (unsigned)rrcConnSetupReqs
{
  return self->_rrcConnSetupReqs.list;
}

- (void)clearRrcConnSetupReqs
{
  PBRepeatedUInt32Clear(&self->_rrcConnSetupReqs, a2);
}

- (void)addRrcConnSetupReq:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_rrcConnSetupReqs, *(_QWORD *)&a3);
}

- (unsigned)rrcConnSetupReqAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rrcConnSetupReqs;
  unint64_t count;
  void *v6;
  void *v7;

  p_rrcConnSetupReqs = &self->_rrcConnSetupReqs;
  count = self->_rrcConnSetupReqs.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_rrcConnSetupReqs->list[a3];
}

- (void)setRrcConnSetupReqs:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_rrcConnSetupReqs, a3, a4);
}

- (void)setRrcConnSetupComp:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_rrcConnSetupComp = a3;
}

- (void)setHasRrcConnSetupComp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRrcConnSetupComp
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (unint64_t)rrcConnRejectsCount
{
  return self->_rrcConnRejects.count;
}

- (unsigned)rrcConnRejects
{
  return self->_rrcConnRejects.list;
}

- (void)clearRrcConnRejects
{
  PBRepeatedUInt32Clear(&self->_rrcConnRejects, a2);
}

- (void)addRrcConnReject:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_rrcConnRejects, *(_QWORD *)&a3);
}

- (unsigned)rrcConnRejectAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rrcConnRejects;
  unint64_t count;
  void *v6;
  void *v7;

  p_rrcConnRejects = &self->_rrcConnRejects;
  count = self->_rrcConnRejects.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_rrcConnRejects->list[a3];
}

- (void)setRrcConnRejects:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_rrcConnRejects, a3, a4);
}

- (unint64_t)rrcConnRlfsCount
{
  return self->_rrcConnRlfs.count;
}

- (unsigned)rrcConnRlfs
{
  return self->_rrcConnRlfs.list;
}

- (void)clearRrcConnRlfs
{
  PBRepeatedUInt32Clear(&self->_rrcConnRlfs, a2);
}

- (void)addRrcConnRlf:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_rrcConnRlfs, *(_QWORD *)&a3);
}

- (unsigned)rrcConnRlfAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rrcConnRlfs;
  unint64_t count;
  void *v6;
  void *v7;

  p_rrcConnRlfs = &self->_rrcConnRlfs;
  count = self->_rrcConnRlfs.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_rrcConnRlfs->list[a3];
}

- (void)setRrcConnRlfs:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_rrcConnRlfs, a3, a4);
}

- (unint64_t)rrcConnReestReqsCount
{
  return self->_rrcConnReestReqs.count;
}

- (unsigned)rrcConnReestReqs
{
  return self->_rrcConnReestReqs.list;
}

- (void)clearRrcConnReestReqs
{
  PBRepeatedUInt32Clear(&self->_rrcConnReestReqs, a2);
}

- (void)addRrcConnReestReq:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_rrcConnReestReqs, *(_QWORD *)&a3);
}

- (unsigned)rrcConnReestReqAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rrcConnReestReqs;
  unint64_t count;
  void *v6;
  void *v7;

  p_rrcConnReestReqs = &self->_rrcConnReestReqs;
  count = self->_rrcConnReestReqs.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_rrcConnReestReqs->list[a3];
}

- (void)setRrcConnReestReqs:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_rrcConnReestReqs, a3, a4);
}

- (void)setRrcConnDrbEstComp:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_rrcConnDrbEstComp = a3;
}

- (void)setHasRrcConnDrbEstComp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRrcConnDrbEstComp
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (unint64_t)rrcConnRelsCount
{
  return self->_rrcConnRels.count;
}

- (unsigned)rrcConnRels
{
  return self->_rrcConnRels.list;
}

- (void)clearRrcConnRels
{
  PBRepeatedUInt32Clear(&self->_rrcConnRels, a2);
}

- (void)addRrcConnRel:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_rrcConnRels, *(_QWORD *)&a3);
}

- (unsigned)rrcConnRelAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rrcConnRels;
  unint64_t count;
  void *v6;
  void *v7;

  p_rrcConnRels = &self->_rrcConnRels;
  count = self->_rrcConnRels.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_rrcConnRels->list[a3];
}

- (void)setRrcConnRels:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_rrcConnRels, a3, a4);
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSubsId
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPsPref
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (unint64_t)rrcResumeReqsCount
{
  return self->_rrcResumeReqs.count;
}

- (unsigned)rrcResumeReqs
{
  return self->_rrcResumeReqs.list;
}

- (void)clearRrcResumeReqs
{
  PBRepeatedUInt32Clear(&self->_rrcResumeReqs, a2);
}

- (void)addRrcResumeReq:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_rrcResumeReqs, *(_QWORD *)&a3);
}

- (unsigned)rrcResumeReqAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rrcResumeReqs;
  unint64_t count;
  void *v6;
  void *v7;

  p_rrcResumeReqs = &self->_rrcResumeReqs;
  count = self->_rrcResumeReqs.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_rrcResumeReqs->list[a3];
}

- (void)setRrcResumeReqs:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_rrcResumeReqs, a3, a4);
}

- (void)setRrcResumeComp:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rrcResumeComp = a3;
}

- (void)setHasRrcResumeComp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRrcResumeComp
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setRrcConnReestComp:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_rrcConnReestComp = a3;
}

- (void)setHasRrcConnReestComp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasRrcConnReestComp
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularNrRrcConnCount;
  v3 = -[CellularNrRrcConnCount description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularNrRrcConnCount dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSData *plmn;
  __int16 v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __int16 v26;
  void *v27;
  void *v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_durationSeconds));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("duration_seconds"));

  }
  v7 = PBRepeatedUInt32NSArray(&self->_rrcConnSetupReqs);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("rrc_conn_setup_req"));

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rrcConnSetupComp));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("rrc_conn_setup_comp"));

  }
  v10 = PBRepeatedUInt32NSArray(&self->_rrcConnRejects);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("rrc_conn_reject"));

  v12 = PBRepeatedUInt32NSArray(&self->_rrcConnRlfs);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("rrc_conn_rlf"));

  v14 = PBRepeatedUInt32NSArray(&self->_rrcConnReestReqs);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("rrc_conn_reest_req"));

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rrcConnDrbEstComp));
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("rrc_conn_drb_est_comp"));

  }
  v17 = PBRepeatedUInt32NSArray(&self->_rrcConnRels);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("rrc_conn_rel"));

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("num_subs"));

  }
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  v21 = (__int16)self->_has;
  if ((v21 & 0x100) != 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("subs_id"));

    v21 = (__int16)self->_has;
  }
  if ((v21 & 8) != 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("ps_pref"));

  }
  v24 = PBRepeatedUInt32NSArray(&self->_rrcResumeReqs);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("rrc_resume_req"));

  v26 = (__int16)self->_has;
  if ((v26 & 0x80) != 0)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rrcResumeComp));
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("rrc_resume_comp"));

    v26 = (__int16)self->_has;
  }
  if ((v26 & 0x20) != 0)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rrcConnReestComp));
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("rrc_conn_reest_comp"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000C2C00((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSData *plmn;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  id v15;

  v4 = a3;
  has = (__int16)self->_has;
  v15 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    v4 = v15;
    has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v15, self->_durationSeconds, 3);
    v4 = v15;
  }
  if (self->_rrcConnSetupReqs.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field(v15, self->_rrcConnSetupReqs.list[v6], 4);
      v4 = v15;
      ++v6;
    }
    while (v6 < self->_rrcConnSetupReqs.count);
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field(v15, self->_rrcConnSetupComp, 5);
    v4 = v15;
  }
  if (self->_rrcConnRejects.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field(v15, self->_rrcConnRejects.list[v7], 6);
      v4 = v15;
      ++v7;
    }
    while (v7 < self->_rrcConnRejects.count);
  }
  if (self->_rrcConnRlfs.count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field(v15, self->_rrcConnRlfs.list[v8], 7);
      v4 = v15;
      ++v8;
    }
    while (v8 < self->_rrcConnRlfs.count);
  }
  if (self->_rrcConnReestReqs.count)
  {
    v9 = 0;
    do
    {
      PBDataWriterWriteUint32Field(v15, self->_rrcConnReestReqs.list[v9], 8);
      v4 = v15;
      ++v9;
    }
    while (v9 < self->_rrcConnReestReqs.count);
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field(v15, self->_rrcConnDrbEstComp, 9);
    v4 = v15;
  }
  if (self->_rrcConnRels.count)
  {
    v10 = 0;
    do
    {
      PBDataWriterWriteUint32Field(v15, self->_rrcConnRels.list[v10], 10);
      v4 = v15;
      ++v10;
    }
    while (v10 < self->_rrcConnRels.count);
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint32Field(v15, self->_numSubs, 13);
    v4 = v15;
  }
  plmn = self->_plmn;
  if (plmn)
  {
    PBDataWriterWriteDataField(v15, plmn, 14);
    v4 = v15;
  }
  v12 = (__int16)self->_has;
  if ((v12 & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field(v15, self->_subsId, 15);
    v4 = v15;
    v12 = (__int16)self->_has;
  }
  if ((v12 & 8) != 0)
  {
    PBDataWriterWriteUint32Field(v15, self->_psPref, 16);
    v4 = v15;
  }
  if (self->_rrcResumeReqs.count)
  {
    v13 = 0;
    do
    {
      PBDataWriterWriteUint32Field(v15, self->_rrcResumeReqs.list[v13], 17);
      v4 = v15;
      ++v13;
    }
    while (v13 < self->_rrcResumeReqs.count);
  }
  v14 = (__int16)self->_has;
  if ((v14 & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field(v15, self->_rrcResumeComp, 18);
    v4 = v15;
    v14 = (__int16)self->_has;
  }
  if ((v14 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field(v15, self->_rrcConnReestComp, 19);
    v4 = v15;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  unint64_t v15;
  unint64_t v16;
  uint64_t m;
  unint64_t v18;
  unint64_t v19;
  uint64_t n;
  _DWORD *v21;
  __int16 v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t ii;
  __int16 v26;
  id v27;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[19] = self->_timestamp;
    *((_WORD *)v4 + 100) |= 1u;
    has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 40) = self->_durationSeconds;
    *((_WORD *)v4 + 100) |= 2u;
  }
  v27 = v4;
  if (-[CellularNrRrcConnCount rrcConnSetupReqsCount](self, "rrcConnSetupReqsCount"))
  {
    objc_msgSend(v27, "clearRrcConnSetupReqs");
    v6 = -[CellularNrRrcConnCount rrcConnSetupReqsCount](self, "rrcConnSetupReqsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v27, "addRrcConnSetupReq:", -[CellularNrRrcConnCount rrcConnSetupReqAtIndex:](self, "rrcConnSetupReqAtIndex:", i));
    }
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *((_DWORD *)v27 + 47) = self->_rrcConnSetupComp;
    *((_WORD *)v27 + 100) |= 0x40u;
  }
  if (-[CellularNrRrcConnCount rrcConnRejectsCount](self, "rrcConnRejectsCount"))
  {
    objc_msgSend(v27, "clearRrcConnRejects");
    v9 = -[CellularNrRrcConnCount rrcConnRejectsCount](self, "rrcConnRejectsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(v27, "addRrcConnReject:", -[CellularNrRrcConnCount rrcConnRejectAtIndex:](self, "rrcConnRejectAtIndex:", j));
    }
  }
  if (-[CellularNrRrcConnCount rrcConnRlfsCount](self, "rrcConnRlfsCount"))
  {
    objc_msgSend(v27, "clearRrcConnRlfs");
    v12 = -[CellularNrRrcConnCount rrcConnRlfsCount](self, "rrcConnRlfsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
        objc_msgSend(v27, "addRrcConnRlf:", -[CellularNrRrcConnCount rrcConnRlfAtIndex:](self, "rrcConnRlfAtIndex:", k));
    }
  }
  if (-[CellularNrRrcConnCount rrcConnReestReqsCount](self, "rrcConnReestReqsCount"))
  {
    objc_msgSend(v27, "clearRrcConnReestReqs");
    v15 = -[CellularNrRrcConnCount rrcConnReestReqsCount](self, "rrcConnReestReqsCount");
    if (v15)
    {
      v16 = v15;
      for (m = 0; m != v16; ++m)
        objc_msgSend(v27, "addRrcConnReestReq:", -[CellularNrRrcConnCount rrcConnReestReqAtIndex:](self, "rrcConnReestReqAtIndex:", m));
    }
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v27 + 45) = self->_rrcConnDrbEstComp;
    *((_WORD *)v27 + 100) |= 0x10u;
  }
  if (-[CellularNrRrcConnCount rrcConnRelsCount](self, "rrcConnRelsCount"))
  {
    objc_msgSend(v27, "clearRrcConnRels");
    v18 = -[CellularNrRrcConnCount rrcConnRelsCount](self, "rrcConnRelsCount");
    if (v18)
    {
      v19 = v18;
      for (n = 0; n != v19; ++n)
        objc_msgSend(v27, "addRrcConnRel:", -[CellularNrRrcConnCount rrcConnRelAtIndex:](self, "rrcConnRelAtIndex:", n));
    }
  }
  v21 = v27;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v27 + 41) = self->_numSubs;
    *((_WORD *)v27 + 100) |= 4u;
  }
  if (self->_plmn)
  {
    objc_msgSend(v27, "setPlmn:");
    v21 = v27;
  }
  v22 = (__int16)self->_has;
  if ((v22 & 0x100) != 0)
  {
    v21[49] = self->_subsId;
    *((_WORD *)v21 + 100) |= 0x100u;
    v22 = (__int16)self->_has;
  }
  if ((v22 & 8) != 0)
  {
    v21[44] = self->_psPref;
    *((_WORD *)v21 + 100) |= 8u;
  }
  if (-[CellularNrRrcConnCount rrcResumeReqsCount](self, "rrcResumeReqsCount"))
  {
    objc_msgSend(v27, "clearRrcResumeReqs");
    v23 = -[CellularNrRrcConnCount rrcResumeReqsCount](self, "rrcResumeReqsCount");
    if (v23)
    {
      v24 = v23;
      for (ii = 0; ii != v24; ++ii)
        objc_msgSend(v27, "addRrcResumeReq:", -[CellularNrRrcConnCount rrcResumeReqAtIndex:](self, "rrcResumeReqAtIndex:", ii));
    }
  }
  v26 = (__int16)self->_has;
  if ((v26 & 0x80) != 0)
  {
    *((_DWORD *)v27 + 48) = self->_rrcResumeComp;
    *((_WORD *)v27 + 100) |= 0x80u;
    v26 = (__int16)self->_has;
  }
  if ((v26 & 0x20) != 0)
  {
    *((_DWORD *)v27 + 46) = self->_rrcConnReestComp;
    *((_WORD *)v27 + 100) |= 0x20u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _DWORD *v6;
  __int16 has;
  id v8;
  void *v9;
  __int16 v10;
  __int16 v11;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v5[19] = self->_timestamp;
    *((_WORD *)v5 + 100) |= 1u;
    has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 40) = self->_durationSeconds;
    *((_WORD *)v5 + 100) |= 2u;
  }
  PBRepeatedUInt32Copy(v5 + 13, &self->_rrcConnSetupReqs);
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    v6[47] = self->_rrcConnSetupComp;
    *((_WORD *)v6 + 100) |= 0x40u;
  }
  PBRepeatedUInt32Copy(v6 + 8, &self->_rrcConnRejects);
  PBRepeatedUInt32Copy(v6 + 20, &self->_rrcConnRlfs);
  PBRepeatedUInt32Copy(v6 + 2, &self->_rrcConnReestReqs);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v6[45] = self->_rrcConnDrbEstComp;
    *((_WORD *)v6 + 100) |= 0x10u;
  }
  PBRepeatedUInt32Copy(v6 + 14, &self->_rrcConnRels);
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    v6[41] = self->_numSubs;
    *((_WORD *)v6 + 100) |= 4u;
  }
  v8 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v6 + 21);
  *((_QWORD *)v6 + 21) = v8;

  v10 = (__int16)self->_has;
  if ((v10 & 0x100) != 0)
  {
    v6[49] = self->_subsId;
    *((_WORD *)v6 + 100) |= 0x100u;
    v10 = (__int16)self->_has;
  }
  if ((v10 & 8) != 0)
  {
    v6[44] = self->_psPref;
    *((_WORD *)v6 + 100) |= 8u;
  }
  PBRepeatedUInt32Copy(v6 + 32, &self->_rrcResumeReqs);
  v11 = (__int16)self->_has;
  if ((v11 & 0x80) != 0)
  {
    v6[48] = self->_rrcResumeComp;
    *((_WORD *)v6 + 100) |= 0x80u;
    v11 = (__int16)self->_has;
  }
  if ((v11 & 0x20) != 0)
  {
    v6[46] = self->_rrcConnReestComp;
    *((_WORD *)v6 + 100) |= 0x20u;
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
  __int16 v10;
  __int16 v11;
  NSData *plmn;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  BOOL v16;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_56;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 100);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 19))
      goto LABEL_56;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_56;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_durationSeconds != *((_DWORD *)v4 + 40))
      goto LABEL_56;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_56;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_rrcConnSetupReqs, v4 + 104))
    goto LABEL_56;
  v8 = *((_WORD *)v4 + 100);
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_rrcConnSetupComp != *((_DWORD *)v4 + 47))
      goto LABEL_56;
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_56;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_rrcConnRejects, v4 + 32)
    || !PBRepeatedUInt32IsEqual(&self->_rrcConnRlfs, v4 + 80)
    || !PBRepeatedUInt32IsEqual(&self->_rrcConnReestReqs, v4 + 8))
  {
    goto LABEL_56;
  }
  v9 = *((_WORD *)v4 + 100);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_rrcConnDrbEstComp != *((_DWORD *)v4 + 45))
      goto LABEL_56;
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_56;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_rrcConnRels, v4 + 56))
    goto LABEL_56;
  v10 = (__int16)self->_has;
  v11 = *((_WORD *)v4 + 100);
  if ((v10 & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_numSubs != *((_DWORD *)v4 + 41))
      goto LABEL_56;
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_56;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 21))
  {
    if (!-[NSData isEqual:](plmn, "isEqual:"))
      goto LABEL_56;
    v10 = (__int16)self->_has;
  }
  v13 = *((_WORD *)v4 + 100);
  if ((v10 & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 100) & 0x100) == 0 || self->_subsId != *((_DWORD *)v4 + 49))
      goto LABEL_56;
  }
  else if ((*((_WORD *)v4 + 100) & 0x100) != 0)
  {
    goto LABEL_56;
  }
  if ((v10 & 8) != 0)
  {
    if ((v13 & 8) == 0 || self->_psPref != *((_DWORD *)v4 + 44))
      goto LABEL_56;
  }
  else if ((v13 & 8) != 0)
  {
    goto LABEL_56;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_rrcResumeReqs, v4 + 128))
  {
LABEL_56:
    v16 = 0;
    goto LABEL_57;
  }
  v14 = (__int16)self->_has;
  v15 = *((_WORD *)v4 + 100);
  if ((v14 & 0x80) != 0)
  {
    if ((v15 & 0x80) == 0 || self->_rrcResumeComp != *((_DWORD *)v4 + 48))
      goto LABEL_56;
  }
  else if ((v15 & 0x80) != 0)
  {
    goto LABEL_56;
  }
  if ((v14 & 0x20) != 0)
  {
    if ((v15 & 0x20) == 0 || self->_rrcConnReestComp != *((_DWORD *)v4 + 46))
      goto LABEL_56;
    v16 = 1;
  }
  else
  {
    v16 = (v15 & 0x20) == 0;
  }
LABEL_57:

  return v16;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;
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
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v23 = 0;
    if ((has & 2) != 0)
    {
LABEL_3:
      v22 = 2654435761 * self->_durationSeconds;
      goto LABEL_6;
    }
  }
  v22 = 0;
LABEL_6:
  v21 = PBRepeatedUInt32Hash(&self->_rrcConnSetupReqs);
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    v20 = 2654435761 * self->_rrcConnSetupComp;
  else
    v20 = 0;
  v19 = PBRepeatedUInt32Hash(&self->_rrcConnRejects);
  v17 = PBRepeatedUInt32Hash(&self->_rrcConnRlfs);
  v4 = PBRepeatedUInt32Hash(&self->_rrcConnReestReqs);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    v5 = 2654435761 * self->_rrcConnDrbEstComp;
  else
    v5 = 0;
  v6 = PBRepeatedUInt32Hash(&self->_rrcConnRels);
  if ((*(_WORD *)&self->_has & 4) != 0)
    v7 = 2654435761 * self->_numSubs;
  else
    v7 = 0;
  v8 = (unint64_t)-[NSData hash](self->_plmn, "hash", v17);
  v9 = (__int16)self->_has;
  if ((v9 & 0x100) != 0)
  {
    v10 = 2654435761 * self->_subsId;
    if ((v9 & 8) != 0)
      goto LABEL_17;
  }
  else
  {
    v10 = 0;
    if ((v9 & 8) != 0)
    {
LABEL_17:
      v11 = 2654435761 * self->_psPref;
      goto LABEL_20;
    }
  }
  v11 = 0;
LABEL_20:
  v12 = PBRepeatedUInt32Hash(&self->_rrcResumeReqs);
  v13 = (__int16)self->_has;
  if ((v13 & 0x80) != 0)
  {
    v14 = 2654435761 * self->_rrcResumeComp;
    if ((v13 & 0x20) != 0)
      goto LABEL_22;
LABEL_24:
    v15 = 0;
    return v22 ^ v23 ^ v20 ^ v21 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15;
  }
  v14 = 0;
  if ((v13 & 0x20) == 0)
    goto LABEL_24;
LABEL_22:
  v15 = 2654435761 * self->_rrcConnReestComp;
  return v22 ^ v23 ^ v20 ^ v21 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  char *v6;
  char *v7;
  char *i;
  char *v9;
  char *v10;
  char *j;
  char *v12;
  char *v13;
  char *k;
  char *v15;
  char *v16;
  char *m;
  char *v18;
  char *v19;
  char *n;
  unsigned int *v21;
  __int16 v22;
  char *v23;
  char *v24;
  char *ii;
  __int16 v26;
  unsigned int *v27;

  v4 = a3;
  v5 = *((_WORD *)v4 + 100);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 19);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)v4 + 100);
  }
  if ((v5 & 2) != 0)
  {
    self->_durationSeconds = *((_DWORD *)v4 + 40);
    *(_WORD *)&self->_has |= 2u;
  }
  v27 = (unsigned int *)v4;
  v6 = (char *)objc_msgSend(v4, "rrcConnSetupReqsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[CellularNrRrcConnCount addRrcConnSetupReq:](self, "addRrcConnSetupReq:", objc_msgSend(v27, "rrcConnSetupReqAtIndex:", i));
  }
  if ((v27[50] & 0x40) != 0)
  {
    self->_rrcConnSetupComp = v27[47];
    *(_WORD *)&self->_has |= 0x40u;
  }
  v9 = (char *)objc_msgSend(v27, "rrcConnRejectsCount");
  if (v9)
  {
    v10 = v9;
    for (j = 0; j != v10; ++j)
      -[CellularNrRrcConnCount addRrcConnReject:](self, "addRrcConnReject:", objc_msgSend(v27, "rrcConnRejectAtIndex:", j));
  }
  v12 = (char *)objc_msgSend(v27, "rrcConnRlfsCount");
  if (v12)
  {
    v13 = v12;
    for (k = 0; k != v13; ++k)
      -[CellularNrRrcConnCount addRrcConnRlf:](self, "addRrcConnRlf:", objc_msgSend(v27, "rrcConnRlfAtIndex:", k));
  }
  v15 = (char *)objc_msgSend(v27, "rrcConnReestReqsCount");
  if (v15)
  {
    v16 = v15;
    for (m = 0; m != v16; ++m)
      -[CellularNrRrcConnCount addRrcConnReestReq:](self, "addRrcConnReestReq:", objc_msgSend(v27, "rrcConnReestReqAtIndex:", m));
  }
  if ((v27[50] & 0x10) != 0)
  {
    self->_rrcConnDrbEstComp = v27[45];
    *(_WORD *)&self->_has |= 0x10u;
  }
  v18 = (char *)objc_msgSend(v27, "rrcConnRelsCount");
  if (v18)
  {
    v19 = v18;
    for (n = 0; n != v19; ++n)
      -[CellularNrRrcConnCount addRrcConnRel:](self, "addRrcConnRel:", objc_msgSend(v27, "rrcConnRelAtIndex:", n));
  }
  v21 = v27;
  if ((v27[50] & 4) != 0)
  {
    self->_numSubs = v27[41];
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v27 + 21))
  {
    -[CellularNrRrcConnCount setPlmn:](self, "setPlmn:");
    v21 = v27;
  }
  v22 = *((_WORD *)v21 + 100);
  if ((v22 & 0x100) != 0)
  {
    self->_subsId = v21[49];
    *(_WORD *)&self->_has |= 0x100u;
    v22 = *((_WORD *)v21 + 100);
  }
  if ((v22 & 8) != 0)
  {
    self->_psPref = v21[44];
    *(_WORD *)&self->_has |= 8u;
  }
  v23 = (char *)objc_msgSend(v21, "rrcResumeReqsCount");
  if (v23)
  {
    v24 = v23;
    for (ii = 0; ii != v24; ++ii)
      -[CellularNrRrcConnCount addRrcResumeReq:](self, "addRrcResumeReq:", objc_msgSend(v27, "rrcResumeReqAtIndex:", ii));
  }
  v26 = *((_WORD *)v27 + 100);
  if ((v26 & 0x80) != 0)
  {
    self->_rrcResumeComp = v27[48];
    *(_WORD *)&self->_has |= 0x80u;
    v26 = *((_WORD *)v27 + 100);
  }
  if ((v26 & 0x20) != 0)
  {
    self->_rrcConnReestComp = v27[46];
    *(_WORD *)&self->_has |= 0x20u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationSeconds
{
  return self->_durationSeconds;
}

- (unsigned)rrcConnSetupComp
{
  return self->_rrcConnSetupComp;
}

- (unsigned)rrcConnDrbEstComp
{
  return self->_rrcConnDrbEstComp;
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

- (unsigned)rrcResumeComp
{
  return self->_rrcResumeComp;
}

- (unsigned)rrcConnReestComp
{
  return self->_rrcConnReestComp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plmn, 0);
}

@end
