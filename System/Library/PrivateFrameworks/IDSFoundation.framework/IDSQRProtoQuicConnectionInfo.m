@implementation IDSQRProtoQuicConnectionInfo

- (id)quicConnectionTypeAsString:(int)a3
{
  double v3;
  __CFString *v4;

  if (!a3)
    return CFSTR("AVC");
  if (a3 == 1)
  {
    v4 = CFSTR("IDS");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), v3, a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsQuicConnectionType:(id)a3
{
  id v3;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  int isEqualToString;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("AVC"), v5) & 1) != 0)
    isEqualToString = 0;
  else
    isEqualToString = objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("IDS"), v7);

  return isEqualToString;
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
  v13.super_class = (Class)IDSQRProtoQuicConnectionInfo;
  -[IDSQRProtoQuicConnectionInfo description](&v13, sel_description);
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
  void *v6;
  double v7;
  int quicConnectionType;
  __CFString *v9;
  const char *v10;
  double v11;
  const char *v12;
  double v13;
  NSData *quicConnectionId;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  quicConnectionType = self->_quicConnectionType;
  if (quicConnectionType)
  {
    if (quicConnectionType == 1)
    {
      v9 = CFSTR("IDS");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("IDS"), v7, CFSTR("quic_connection_type"));
    }
    else
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), v7, self->_quicConnectionType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, v11, CFSTR("quic_connection_type"));
    }
  }
  else
  {
    v9 = CFSTR("AVC");
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("AVC"), v7, CFSTR("quic_connection_type"));
  }

  quicConnectionId = self->_quicConnectionId;
  if (quicConnectionId)
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)quicConnectionId, v13, CFSTR("quic_connection_id"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoQuicConnectionInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteInt32Field();
  if (!self->_quicConnectionId)
    sub_19BAFA414();
  PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  double v3;

  *((_DWORD *)a3 + 4) = self->_quicConnectionType;
  objc_msgSend_setQuicConnectionId_(a3, a2, (uint64_t)self->_quicConnectionId, v3);
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
  uint64_t v15;
  void *v16;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  *(_DWORD *)(v12 + 16) = self->_quicConnectionType;
  v15 = objc_msgSend_copyWithZone_(self->_quicConnectionId, v13, (uint64_t)a3, v14);
  v16 = *(void **)(v12 + 8);
  *(_QWORD *)(v12 + 8) = v15;

  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  NSData *quicConnectionId;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7) && self->_quicConnectionType == *((_DWORD *)v4 + 4))
  {
    quicConnectionId = self->_quicConnectionId;
    v11 = v4[1];
    if ((unint64_t)quicConnectionId | v11)
      isEqual = objc_msgSend_isEqual_(quicConnectionId, v8, v11, v9);
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
  double v3;
  uint64_t v4;

  v4 = 2654435761 * self->_quicConnectionType;
  return objc_msgSend_hash(self->_quicConnectionId, a2, v2, v3) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  double v3;
  uint64_t v4;

  self->_quicConnectionType = *((_DWORD *)a3 + 4);
  v4 = *((_QWORD *)a3 + 1);
  if (v4)
    objc_msgSend_setQuicConnectionId_(self, a2, v4, v3);
}

- (int)quicConnectionType
{
  return self->_quicConnectionType;
}

- (void)setQuicConnectionType:(int)a3
{
  self->_quicConnectionType = a3;
}

- (NSData)quicConnectionId
{
  return self->_quicConnectionId;
}

- (void)setQuicConnectionId:(id)a3
{
  objc_storeStrong((id *)&self->_quicConnectionId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quicConnectionId, 0);
}

@end
