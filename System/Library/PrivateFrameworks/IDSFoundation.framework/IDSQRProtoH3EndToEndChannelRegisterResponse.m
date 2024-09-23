@implementation IDSQRProtoH3EndToEndChannelRegisterResponse

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
  v13.super_class = (Class)IDSQRProtoH3EndToEndChannelRegisterResponse;
  -[IDSQRProtoH3EndToEndChannelRegisterResponse description](&v13, sel_description);
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
  NSData *virtualQuicServerConnectionId;
  IDSQRProtoH3EndToEndChannelRegisterE2EChannelInfo *channelInfo;
  void *v11;
  const char *v12;
  double v13;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  virtualQuicServerConnectionId = self->_virtualQuicServerConnectionId;
  if (virtualQuicServerConnectionId)
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)virtualQuicServerConnectionId, v7, CFSTR("virtual_quic_server_connection_id"));
  channelInfo = self->_channelInfo;
  if (channelInfo)
  {
    objc_msgSend_dictionaryRepresentation(channelInfo, v6, (uint64_t)virtualQuicServerConnectionId, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v12, (uint64_t)v11, v13, CFSTR("channel_info"));

  }
  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoH3EndToEndChannelRegisterResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_virtualQuicServerConnectionId)
    sub_19BAF68F8();
  v5 = v4;
  PBDataWriterWriteDataField();
  if (!self->_channelInfo)
    sub_19BAF6920();
  PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  NSData *virtualQuicServerConnectionId;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  id v9;

  virtualQuicServerConnectionId = self->_virtualQuicServerConnectionId;
  v9 = a3;
  objc_msgSend_setVirtualQuicServerConnectionId_(v9, v5, (uint64_t)virtualQuicServerConnectionId, v6);
  objc_msgSend_setChannelInfo_(v9, v7, (uint64_t)self->_channelInfo, v8);

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
  _QWORD *v12;
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
  v12 = (_QWORD *)objc_msgSend_init(v8, v9, v10, v11);
  v15 = objc_msgSend_copyWithZone_(self->_virtualQuicServerConnectionId, v13, (uint64_t)a3, v14);
  v16 = (void *)v12[2];
  v12[2] = v15;

  v19 = objc_msgSend_copyWithZone_(self->_channelInfo, v17, (uint64_t)a3, v18);
  v20 = (void *)v12[1];
  v12[1] = v19;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  NSData *virtualQuicServerConnectionId;
  uint64_t v11;
  IDSQRProtoH3EndToEndChannelRegisterE2EChannelInfo *channelInfo;
  uint64_t v13;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    && ((virtualQuicServerConnectionId = self->_virtualQuicServerConnectionId,
         v11 = v4[2],
         !((unint64_t)virtualQuicServerConnectionId | v11))
     || objc_msgSend_isEqual_(virtualQuicServerConnectionId, v8, v11, v9)))
  {
    channelInfo = self->_channelInfo;
    v13 = v4[1];
    if ((unint64_t)channelInfo | v13)
      isEqual = objc_msgSend_isEqual_(channelInfo, v8, v13, v9);
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
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  double v8;

  v5 = objc_msgSend_hash(self->_virtualQuicServerConnectionId, a2, v2, v3);
  return objc_msgSend_hash(self->_channelInfo, v6, v7, v8) ^ v5;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  double v5;
  uint64_t v6;
  IDSQRProtoH3EndToEndChannelRegisterE2EChannelInfo *channelInfo;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v6 = v4[2];
  v9 = v4;
  if (v6)
  {
    objc_msgSend_setVirtualQuicServerConnectionId_(self, (const char *)v4, v6, v5);
    v4 = v9;
  }
  channelInfo = self->_channelInfo;
  v8 = v4[1];
  if (channelInfo)
  {
    if (v8)
    {
      objc_msgSend_mergeFrom_(channelInfo, (const char *)v4, v8, v5);
LABEL_8:
      v4 = v9;
    }
  }
  else if (v8)
  {
    objc_msgSend_setChannelInfo_(self, (const char *)v4, v8, v5);
    goto LABEL_8;
  }

}

- (NSData)virtualQuicServerConnectionId
{
  return self->_virtualQuicServerConnectionId;
}

- (void)setVirtualQuicServerConnectionId:(id)a3
{
  objc_storeStrong((id *)&self->_virtualQuicServerConnectionId, a3);
}

- (IDSQRProtoH3EndToEndChannelRegisterE2EChannelInfo)channelInfo
{
  return self->_channelInfo;
}

- (void)setChannelInfo:(id)a3
{
  objc_storeStrong((id *)&self->_channelInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualQuicServerConnectionId, 0);
  objc_storeStrong((id *)&self->_channelInfo, 0);
}

@end
