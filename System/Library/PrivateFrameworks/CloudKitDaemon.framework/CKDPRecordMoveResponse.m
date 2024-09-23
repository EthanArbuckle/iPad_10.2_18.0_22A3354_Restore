@implementation CKDPRecordMoveResponse

- (BOOL)hasMoveMarker
{
  return self->_moveMarker != 0;
}

- (BOOL)hasMovedRecord
{
  return self->_movedRecord != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKDPRecordMoveResponse;
  -[CKDPRecordMoveResponse description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  CKDPRecord *moveMarker;
  void *v8;
  const char *v9;
  CKDPRecord *movedRecord;
  void *v11;
  const char *v12;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  moveMarker = self->_moveMarker;
  if (moveMarker)
  {
    objc_msgSend_dictionaryRepresentation(moveMarker, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("moveMarker"));

  }
  movedRecord = self->_movedRecord;
  if (movedRecord)
  {
    objc_msgSend_dictionaryRepresentation(movedRecord, v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("movedRecord"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEBFFD50((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_moveMarker)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_movedRecord)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPRecord *moveMarker;
  CKDPRecord *movedRecord;
  id v8;

  v4 = a3;
  moveMarker = self->_moveMarker;
  v8 = v4;
  if (moveMarker)
  {
    objc_msgSend_setMoveMarker_(v4, v5, (uint64_t)moveMarker);
    v4 = v8;
  }
  movedRecord = self->_movedRecord;
  if (movedRecord)
  {
    objc_msgSend_setMovedRecord_(v8, v5, (uint64_t)movedRecord);
    v4 = v8;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_moveMarker, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_movedRecord, v14, (uint64_t)a3);
  v16 = (void *)v10[2];
  v10[2] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPRecord *moveMarker;
  uint64_t v9;
  CKDPRecord *movedRecord;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((moveMarker = self->_moveMarker, v9 = v4[1], !((unint64_t)moveMarker | v9))
     || objc_msgSend_isEqual_(moveMarker, v7, v9)))
  {
    movedRecord = self->_movedRecord;
    v11 = v4[2];
    if ((unint64_t)movedRecord | v11)
      isEqual = objc_msgSend_isEqual_(movedRecord, v7, v11);
    else
      isEqual = 1;
  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_hash(self->_moveMarker, a2, v2);
  return objc_msgSend_hash(self->_movedRecord, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  CKDPRecord *moveMarker;
  uint64_t v6;
  CKDPRecord *movedRecord;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  moveMarker = self->_moveMarker;
  v6 = v4[1];
  v9 = v4;
  if (moveMarker)
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(moveMarker, (const char *)v4, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_setMoveMarker_(self, (const char *)v4, v6);
  }
  v4 = v9;
LABEL_7:
  movedRecord = self->_movedRecord;
  v8 = v4[2];
  if (movedRecord)
  {
    if (v8)
    {
      objc_msgSend_mergeFrom_(movedRecord, (const char *)v4, v8);
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    objc_msgSend_setMovedRecord_(self, (const char *)v4, v8);
    goto LABEL_12;
  }

}

- (CKDPRecord)moveMarker
{
  return self->_moveMarker;
}

- (void)setMoveMarker:(id)a3
{
  objc_storeStrong((id *)&self->_moveMarker, a3);
}

- (CKDPRecord)movedRecord
{
  return self->_movedRecord;
}

- (void)setMovedRecord:(id)a3
{
  objc_storeStrong((id *)&self->_movedRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movedRecord, 0);
  objc_storeStrong((id *)&self->_moveMarker, 0);
}

@end
