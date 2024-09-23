@implementation IDSQRProtoH3EndToEndChannelRegisterE2EChannelInfo

- (BOOL)hasQuicClientConnectionId
{
  return self->_quicClientConnectionId != 0;
}

- (BOOL)hasQuicServerConnectionId
{
  return self->_quicServerConnectionId != 0;
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
  v13.super_class = (Class)IDSQRProtoH3EndToEndChannelRegisterE2EChannelInfo;
  -[IDSQRProtoH3EndToEndChannelRegisterE2EChannelInfo description](&v13, sel_description);
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
  NSData *quicClientConnectionId;
  NSData *quicServerConnectionId;
  void *v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  quicClientConnectionId = self->_quicClientConnectionId;
  if (quicClientConnectionId)
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)quicClientConnectionId, v7, CFSTR("quic_client_connection_id"));
  quicServerConnectionId = self->_quicServerConnectionId;
  if (quicServerConnectionId)
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)quicServerConnectionId, v7, CFSTR("quic_server_connection_id"));
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v6, self->_quicClientLinkId, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v8, v12, (uint64_t)v11, v13, CFSTR("quic_client_link_id"));

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v14, self->_quicServerLinkId, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v8, v17, (uint64_t)v16, v18, CFSTR("quic_server_link_id"));

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v19, self->_serverGeneratedConnectionIds, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v8, v22, (uint64_t)v21, v23, CFSTR("server_generated_connection_ids"));

  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoH3EndToEndChannelRegisterE2EChannelInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_quicClientConnectionId)
    PBDataWriterWriteDataField();
  if (self->_quicServerConnectionId)
    PBDataWriterWriteDataField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  NSData *quicClientConnectionId;
  NSData *quicServerConnectionId;
  id v9;

  v4 = a3;
  quicClientConnectionId = self->_quicClientConnectionId;
  v9 = v4;
  if (quicClientConnectionId)
  {
    objc_msgSend_setQuicClientConnectionId_(v4, v5, (uint64_t)quicClientConnectionId, v6);
    v4 = v9;
  }
  quicServerConnectionId = self->_quicServerConnectionId;
  if (quicServerConnectionId)
  {
    objc_msgSend_setQuicServerConnectionId_(v9, v5, (uint64_t)quicServerConnectionId, v6);
    v4 = v9;
  }
  *((_DWORD *)v4 + 4) = self->_quicClientLinkId;
  *((_DWORD *)v4 + 8) = self->_quicServerLinkId;
  *((_BYTE *)v4 + 36) = self->_serverGeneratedConnectionIds;

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
  v15 = objc_msgSend_copyWithZone_(self->_quicClientConnectionId, v13, (uint64_t)a3, v14);
  v16 = *(void **)(v12 + 8);
  *(_QWORD *)(v12 + 8) = v15;

  v19 = objc_msgSend_copyWithZone_(self->_quicServerConnectionId, v17, (uint64_t)a3, v18);
  v20 = *(void **)(v12 + 24);
  *(_QWORD *)(v12 + 24) = v19;

  *(_DWORD *)(v12 + 16) = self->_quicClientLinkId;
  *(_DWORD *)(v12 + 32) = self->_quicServerLinkId;
  *(_BYTE *)(v12 + 36) = self->_serverGeneratedConnectionIds;
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  NSData *quicClientConnectionId;
  uint64_t v11;
  NSData *quicServerConnectionId;
  uint64_t v13;
  BOOL v14;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    && ((quicClientConnectionId = self->_quicClientConnectionId,
         v11 = *((_QWORD *)v4 + 1),
         !((unint64_t)quicClientConnectionId | v11))
     || objc_msgSend_isEqual_(quicClientConnectionId, v8, v11, v9))
    && ((quicServerConnectionId = self->_quicServerConnectionId,
         v13 = *((_QWORD *)v4 + 3),
         !((unint64_t)quicServerConnectionId | v13))
     || objc_msgSend_isEqual_(quicServerConnectionId, v8, v13, v9))
    && self->_quicClientLinkId == *((_DWORD *)v4 + 4)
    && self->_quicServerLinkId == *((_DWORD *)v4 + 8))
  {
    if (self->_serverGeneratedConnectionIds)
      v14 = *((_BYTE *)v4 + 36) != 0;
    else
      v14 = *((_BYTE *)v4 + 36) == 0;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  double v8;

  v5 = objc_msgSend_hash(self->_quicClientConnectionId, a2, v2, v3);
  return objc_msgSend_hash(self->_quicServerConnectionId, v6, v7, v8) ^ v5 ^ (2654435761 * self->_quicClientLinkId) ^ (2654435761 * self->_quicServerLinkId) ^ (2654435761 * self->_serverGeneratedConnectionIds);
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
  v7 = *((_QWORD *)v4 + 1);
  v9 = v4;
  if (v7)
  {
    objc_msgSend_setQuicClientConnectionId_(self, v5, v7, v6);
    v4 = v9;
  }
  v8 = *((_QWORD *)v4 + 3);
  if (v8)
  {
    objc_msgSend_setQuicServerConnectionId_(self, v5, v8, v6);
    v4 = v9;
  }
  self->_quicClientLinkId = *((_DWORD *)v4 + 4);
  self->_quicServerLinkId = *((_DWORD *)v4 + 8);
  self->_serverGeneratedConnectionIds = *((_BYTE *)v4 + 36);

}

- (NSData)quicClientConnectionId
{
  return self->_quicClientConnectionId;
}

- (void)setQuicClientConnectionId:(id)a3
{
  objc_storeStrong((id *)&self->_quicClientConnectionId, a3);
}

- (NSData)quicServerConnectionId
{
  return self->_quicServerConnectionId;
}

- (void)setQuicServerConnectionId:(id)a3
{
  objc_storeStrong((id *)&self->_quicServerConnectionId, a3);
}

- (unsigned)quicClientLinkId
{
  return self->_quicClientLinkId;
}

- (void)setQuicClientLinkId:(unsigned int)a3
{
  self->_quicClientLinkId = a3;
}

- (unsigned)quicServerLinkId
{
  return self->_quicServerLinkId;
}

- (void)setQuicServerLinkId:(unsigned int)a3
{
  self->_quicServerLinkId = a3;
}

- (BOOL)serverGeneratedConnectionIds
{
  return self->_serverGeneratedConnectionIds;
}

- (void)setServerGeneratedConnectionIds:(BOOL)a3
{
  self->_serverGeneratedConnectionIds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quicServerConnectionId, 0);
  objc_storeStrong((id *)&self->_quicClientConnectionId, 0);
}

@end
