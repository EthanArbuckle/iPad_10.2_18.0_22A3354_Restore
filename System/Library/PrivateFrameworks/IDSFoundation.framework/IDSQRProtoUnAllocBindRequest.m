@implementation IDSQRProtoUnAllocBindRequest

- (int)reason
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_reason;
  else
    return 0;
}

- (void)setReason:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)reasonAsString:(int)a3
{
  double v3;

  if (a3 < 3)
    return off_1E3C21888[a3];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), v3, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsReason:(id)a3
{
  id v3;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  int v8;
  const char *v9;
  double v10;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("VOLUNTARY_LEAVE"), v5) & 1) != 0)
  {
    v8 = 0;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("CLIENT_LEAVING"), v7) & 1) != 0)
  {
    v8 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("GO_AWAY_INDICATION"), v10))
  {
    v8 = 2;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)hasClientContextBlob
{
  return self->_clientContextBlob != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoUnAllocBindRequest;
  -[IDSQRProtoUnAllocBindRequest description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("%@ %@"), v10, v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  void *v7;
  double v8;
  uint64_t reason;
  __CFString *v10;
  IDSQRProtoMaterial *clientContextBlob;
  void *v12;
  const char *v13;
  double v14;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    reason = self->_reason;
    if (reason >= 3)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), v8, self->_reason);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E3C21888[reason];
    }
    objc_msgSend_setObject_forKey_(v7, v5, (uint64_t)v10, v8, CFSTR("reason"));

  }
  clientContextBlob = self->_clientContextBlob;
  if (clientContextBlob)
  {
    objc_msgSend_dictionaryRepresentation(clientContextBlob, v5, v6, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v13, (uint64_t)v12, v14, CFSTR("client_context_blob"));

  }
  return v7;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoUnAllocBindRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_clientContextBlob)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  double v6;
  IDSQRProtoMaterial *clientContextBlob;
  _DWORD *v8;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_reason;
    *((_BYTE *)v4 + 20) |= 1u;
  }
  clientContextBlob = self->_clientContextBlob;
  if (clientContextBlob)
  {
    v8 = v4;
    objc_msgSend_setClientContextBlob_(v4, v5, (uint64_t)clientContextBlob, v6);
    v4 = v8;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = (_QWORD *)v12;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v12 + 16) = self->_reason;
    *(_BYTE *)(v12 + 20) |= 1u;
  }
  v16 = objc_msgSend_copyWithZone_(self->_clientContextBlob, v13, (uint64_t)a3, v14);
  v17 = (void *)v15[1];
  v15[1] = v16;

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  IDSQRProtoMaterial *clientContextBlob;
  uint64_t v11;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_reason != *((_DWORD *)v4 + 4))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    isEqual = 0;
    goto LABEL_10;
  }
  clientContextBlob = self->_clientContextBlob;
  v11 = v4[1];
  if ((unint64_t)clientContextBlob | v11)
    isEqual = objc_msgSend_isEqual_(clientContextBlob, v8, v11, v9);
  else
    isEqual = 1;
LABEL_10:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_reason;
  else
    v4 = 0;
  return objc_msgSend_hash(self->_clientContextBlob, a2, v2, v3) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  double v5;
  _QWORD *v6;
  IDSQRProtoMaterial *clientContextBlob;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v6 = v4;
  if ((v4[5] & 1) != 0)
  {
    self->_reason = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  clientContextBlob = self->_clientContextBlob;
  v8 = v6[1];
  if (clientContextBlob)
  {
    if (v8)
    {
      v9 = v6;
      objc_msgSend_mergeFrom_(clientContextBlob, (const char *)v6, v8, v5);
LABEL_8:
      v6 = v9;
    }
  }
  else if (v8)
  {
    v9 = v6;
    objc_msgSend_setClientContextBlob_(self, (const char *)v6, v8, v5);
    goto LABEL_8;
  }

}

- (IDSQRProtoMaterial)clientContextBlob
{
  return self->_clientContextBlob;
}

- (void)setClientContextBlob:(id)a3
{
  objc_storeStrong((id *)&self->_clientContextBlob, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContextBlob, 0);
}

@end
