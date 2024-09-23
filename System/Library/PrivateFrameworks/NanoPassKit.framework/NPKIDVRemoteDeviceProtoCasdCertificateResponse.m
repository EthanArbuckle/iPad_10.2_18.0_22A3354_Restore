@implementation NPKIDVRemoteDeviceProtoCasdCertificateResponse

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (BOOL)hasCasdCertificate
{
  return self->_casdCertificate != 0;
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
  v8.super_class = (Class)NPKIDVRemoteDeviceProtoCasdCertificateResponse;
  -[NPKIDVRemoteDeviceProtoCasdCertificateResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKIDVRemoteDeviceProtoCasdCertificateResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *errorData;
  NSData *casdCertificate;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  errorData = self->_errorData;
  if (errorData)
    objc_msgSend(v3, "setObject:forKey:", errorData, CFSTR("errorData"));
  casdCertificate = self->_casdCertificate;
  if (casdCertificate)
    objc_msgSend(v4, "setObject:forKey:", casdCertificate, CFSTR("casdCertificate"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKIDVRemoteDeviceProtoCasdCertificateResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_errorData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_casdCertificate)
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
  if (self->_errorData)
  {
    objc_msgSend(v4, "setErrorData:");
    v4 = v5;
  }
  if (self->_casdCertificate)
  {
    objc_msgSend(v5, "setCasdCertificate:");
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
  v6 = -[NSData copyWithZone:](self->_errorData, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_casdCertificate, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *errorData;
  NSData *casdCertificate;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((errorData = self->_errorData, !((unint64_t)errorData | v4[2]))
     || -[NSData isEqual:](errorData, "isEqual:")))
  {
    casdCertificate = self->_casdCertificate;
    if ((unint64_t)casdCertificate | v4[1])
      v7 = -[NSData isEqual:](casdCertificate, "isEqual:");
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

  v3 = -[NSData hash](self->_errorData, "hash");
  return -[NSData hash](self->_casdCertificate, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[NPKIDVRemoteDeviceProtoCasdCertificateResponse setErrorData:](self, "setErrorData:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[NPKIDVRemoteDeviceProtoCasdCertificateResponse setCasdCertificate:](self, "setCasdCertificate:");
    v4 = v5;
  }

}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
  objc_storeStrong((id *)&self->_errorData, a3);
}

- (NSData)casdCertificate
{
  return self->_casdCertificate;
}

- (void)setCasdCertificate:(id)a3
{
  objc_storeStrong((id *)&self->_casdCertificate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorData, 0);
  objc_storeStrong((id *)&self->_casdCertificate, 0);
}

@end
