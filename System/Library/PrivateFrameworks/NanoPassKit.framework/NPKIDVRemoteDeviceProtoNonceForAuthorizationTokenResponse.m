@implementation NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenResponse

- (BOOL)hasNonceData
{
  return self->_nonceData != 0;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenResponse;
  -[NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *nonceData;
  NSData *errorData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  nonceData = self->_nonceData;
  if (nonceData)
    objc_msgSend(v3, "setObject:forKey:", nonceData, CFSTR("nonceData"));
  errorData = self->_errorData;
  if (errorData)
    objc_msgSend(v4, "setObject:forKey:", errorData, CFSTR("errorData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_nonceData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_errorData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_nonceData)
  {
    objc_msgSend(v4, "setNonceData:");
    v4 = v5;
  }
  if (self->_errorData)
  {
    objc_msgSend(v5, "setErrorData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_nonceData, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_errorData, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *nonceData;
  NSData *errorData;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((nonceData = self->_nonceData, !((unint64_t)nonceData | v4[2]))
     || -[NSData isEqual:](nonceData, "isEqual:")))
  {
    errorData = self->_errorData;
    if ((unint64_t)errorData | v4[1])
      v7 = -[NSData isEqual:](errorData, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSData hash](self->_nonceData, "hash");
  return -[NSData hash](self->_errorData, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenResponse setNonceData:](self, "setNonceData:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenResponse setErrorData:](self, "setErrorData:");
    v4 = v5;
  }

}

- (NSData)nonceData
{
  return self->_nonceData;
}

- (void)setNonceData:(id)a3
{
  objc_storeStrong((id *)&self->_nonceData, a3);
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
  objc_storeStrong((id *)&self->_errorData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonceData, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end
