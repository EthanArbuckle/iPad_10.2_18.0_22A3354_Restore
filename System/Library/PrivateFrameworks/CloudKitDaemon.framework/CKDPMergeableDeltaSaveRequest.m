@implementation CKDPMergeableDeltaSaveRequest

+ (id)options
{
  if (qword_1ED702AF0 != -1)
    dispatch_once(&qword_1ED702AF0, &unk_1E7835F30);
  return (id)qword_1ED702AE8;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasDelta
{
  return self->_delta != 0;
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
  v11.super_class = (Class)CKDPMergeableDeltaSaveRequest;
  -[CKDPMergeableDeltaSaveRequest description](&v11, sel_description);
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
  CKDPMergeableValueIdentifier *identifier;
  void *v8;
  const char *v9;
  CKDPMergeableDelta *delta;
  void *v11;
  const char *v12;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  if (identifier)
  {
    objc_msgSend_dictionaryRepresentation(identifier, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("identifier"));

  }
  delta = self->_delta;
  if (delta)
  {
    objc_msgSend_dictionaryRepresentation(delta, v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("delta"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPMergeableDeltaSaveRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_delta)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (unsigned)requestTypeCode
{
  return 74;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPMergeableValueIdentifier *identifier;
  CKDPMergeableDelta *delta;
  id v8;

  v4 = a3;
  identifier = self->_identifier;
  v8 = v4;
  if (identifier)
  {
    objc_msgSend_setIdentifier_(v4, v5, (uint64_t)identifier);
    v4 = v8;
  }
  delta = self->_delta;
  if (delta)
  {
    objc_msgSend_setDelta_(v8, v5, (uint64_t)delta);
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
  v12 = objc_msgSend_copyWithZone_(self->_identifier, v11, (uint64_t)a3);
  v13 = (void *)v10[2];
  v10[2] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_delta, v14, (uint64_t)a3);
  v16 = (void *)v10[1];
  v10[1] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPMergeableValueIdentifier *identifier;
  uint64_t v9;
  CKDPMergeableDelta *delta;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((identifier = self->_identifier, v9 = v4[2], !((unint64_t)identifier | v9))
     || objc_msgSend_isEqual_(identifier, v7, v9)))
  {
    delta = self->_delta;
    v11 = v4[1];
    if ((unint64_t)delta | v11)
      isEqual = objc_msgSend_isEqual_(delta, v7, v11);
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

  v4 = objc_msgSend_hash(self->_identifier, a2, v2);
  return objc_msgSend_hash(self->_delta, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  CKDPMergeableValueIdentifier *identifier;
  uint64_t v6;
  CKDPMergeableDelta *delta;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  identifier = self->_identifier;
  v6 = v4[2];
  v9 = v4;
  if (identifier)
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(identifier, (const char *)v4, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_setIdentifier_(self, (const char *)v4, v6);
  }
  v4 = v9;
LABEL_7:
  delta = self->_delta;
  v8 = v4[1];
  if (delta)
  {
    if (v8)
    {
      objc_msgSend_mergeFrom_(delta, (const char *)v4, v8);
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    objc_msgSend_setDelta_(self, (const char *)v4, v8);
    goto LABEL_12;
  }

}

- (CKDPMergeableValueIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (CKDPMergeableDelta)delta
{
  return self->_delta;
}

- (void)setDelta:(id)a3
{
  objc_storeStrong((id *)&self->_delta, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_delta, 0);
}

@end
