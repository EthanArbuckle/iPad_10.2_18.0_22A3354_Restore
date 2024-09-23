@implementation IDSQRProtoPluginControlRequest

- (void)setPluginStreamId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_pluginStreamId = a3;
}

- (void)setHasPluginStreamId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPluginStreamId
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasPluginClientRawPublicKey
{
  return self->_pluginClientRawPublicKey != 0;
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
  v13.super_class = (Class)IDSQRProtoPluginControlRequest;
  -[IDSQRProtoPluginControlRequest description](&v13, sel_description);
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
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  NSString *pluginName;
  void *v14;
  const char *v15;
  double v16;
  NSData *pluginClientRawPublicKey;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v6, self->_pluginOperation, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v9, (uint64_t)v8, v10, CFSTR("plugin_operation"));

  pluginName = self->_pluginName;
  if (pluginName)
    objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)pluginName, v12, CFSTR("plugin_name"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v11, self->_pluginStreamId, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v15, (uint64_t)v14, v16, CFSTR("plugin_stream_id"));

  }
  pluginClientRawPublicKey = self->_pluginClientRawPublicKey;
  if (pluginClientRawPublicKey)
    objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)pluginClientRawPublicKey, v12, CFSTR("plugin_client_raw_public_key"));
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoPluginControlRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint32Field();
  if (!self->_pluginName)
    sub_19BAF626C();
  PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  v4 = v5;
  if (self->_pluginClientRawPublicKey)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  void *v8;
  NSData *pluginClientRawPublicKey;
  _DWORD *v10;

  v10 = a3;
  v10[6] = self->_pluginOperation;
  objc_msgSend_setPluginName_(v10, v4, (uint64_t)self->_pluginName, v5);
  v8 = v10;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v10[7] = self->_pluginStreamId;
    *((_BYTE *)v10 + 32) |= 1u;
  }
  pluginClientRawPublicKey = self->_pluginClientRawPublicKey;
  if (pluginClientRawPublicKey)
  {
    objc_msgSend_setPluginClientRawPublicKey_(v10, v6, (uint64_t)pluginClientRawPublicKey, v7);
    v8 = v10;
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
  uint64_t v15;
  void *v16;
  const char *v17;
  double v18;
  uint64_t v19;
  void *v20;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  *(_DWORD *)(v12 + 24) = self->_pluginOperation;
  v15 = objc_msgSend_copyWithZone_(self->_pluginName, v13, (uint64_t)a3, v14);
  v16 = *(void **)(v12 + 16);
  *(_QWORD *)(v12 + 16) = v15;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v12 + 28) = self->_pluginStreamId;
    *(_BYTE *)(v12 + 32) |= 1u;
  }
  v19 = objc_msgSend_copyWithZone_(self->_pluginClientRawPublicKey, v17, (uint64_t)a3, v18);
  v20 = *(void **)(v12 + 8);
  *(_QWORD *)(v12 + 8) = v19;

  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  NSString *pluginName;
  uint64_t v11;
  NSData *pluginClientRawPublicKey;
  uint64_t v13;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_12;
  if (self->_pluginOperation != *((_DWORD *)v4 + 6))
    goto LABEL_12;
  pluginName = self->_pluginName;
  v11 = v4[2];
  if ((unint64_t)pluginName | v11)
  {
    if (!objc_msgSend_isEqual_(pluginName, v8, v11, v9))
      goto LABEL_12;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[4] & 1) == 0 || self->_pluginStreamId != *((_DWORD *)v4 + 7))
      goto LABEL_12;
  }
  else if ((v4[4] & 1) != 0)
  {
LABEL_12:
    isEqual = 0;
    goto LABEL_13;
  }
  pluginClientRawPublicKey = self->_pluginClientRawPublicKey;
  v13 = v4[1];
  if ((unint64_t)pluginClientRawPublicKey | v13)
    isEqual = objc_msgSend_isEqual_(pluginClientRawPublicKey, v8, v13, v9);
  else
    isEqual = 1;
LABEL_13:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  unsigned int pluginOperation;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;

  pluginOperation = self->_pluginOperation;
  v6 = objc_msgSend_hash(self->_pluginName, a2, v2, v3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v10 = 2654435761 * self->_pluginStreamId;
  else
    v10 = 0;
  return v6 ^ v10 ^ objc_msgSend_hash(self->_pluginClientRawPublicKey, v7, v8, v9) ^ (2654435761 * pluginOperation);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  self->_pluginOperation = *((_DWORD *)v4 + 6);
  v7 = *((_QWORD *)v4 + 2);
  v9 = v4;
  if (v7)
  {
    objc_msgSend_setPluginName_(self, v5, v7, v6);
    v4 = v9;
  }
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_pluginStreamId = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 1u;
  }
  v8 = *((_QWORD *)v4 + 1);
  if (v8)
  {
    objc_msgSend_setPluginClientRawPublicKey_(self, v5, v8, v6);
    v4 = v9;
  }

}

- (unsigned)pluginOperation
{
  return self->_pluginOperation;
}

- (void)setPluginOperation:(unsigned int)a3
{
  self->_pluginOperation = a3;
}

- (NSString)pluginName
{
  return self->_pluginName;
}

- (void)setPluginName:(id)a3
{
  objc_storeStrong((id *)&self->_pluginName, a3);
}

- (unsigned)pluginStreamId
{
  return self->_pluginStreamId;
}

- (NSData)pluginClientRawPublicKey
{
  return self->_pluginClientRawPublicKey;
}

- (void)setPluginClientRawPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_pluginClientRawPublicKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginName, 0);
  objc_storeStrong((id *)&self->_pluginClientRawPublicKey, 0);
}

@end
