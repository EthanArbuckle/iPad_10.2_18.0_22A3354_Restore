@implementation NSPPrivacyProxyBAAValidation

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxyBAAValidation;
  -[NSPPrivacyProxyBAAValidation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPPrivacyProxyBAAValidation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *baaSignature;
  NSData *leafCertificate;
  NSData *intermediateCertificate;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  baaSignature = self->_baaSignature;
  if (baaSignature)
    objc_msgSend(v3, "setObject:forKey:", baaSignature, CFSTR("baaSignature"));
  leafCertificate = self->_leafCertificate;
  if (leafCertificate)
    objc_msgSend(v4, "setObject:forKey:", leafCertificate, CFSTR("leafCertificate"));
  intermediateCertificate = self->_intermediateCertificate;
  if (intermediateCertificate)
    objc_msgSend(v4, "setObject:forKey:", intermediateCertificate, CFSTR("intermediateCertificate"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyBAAValidationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_baaSignature)
    __assert_rtn("-[NSPPrivacyProxyBAAValidation writeTo:]", "NSPPrivacyProxyBAAValidation.m", 111, "nil != self->_baaSignature");
  PBDataWriterWriteDataField();
  if (!self->_leafCertificate)
    __assert_rtn("-[NSPPrivacyProxyBAAValidation writeTo:]", "NSPPrivacyProxyBAAValidation.m", 116, "nil != self->_leafCertificate");
  PBDataWriterWriteDataField();
  if (!self->_intermediateCertificate)
    __assert_rtn("-[NSPPrivacyProxyBAAValidation writeTo:]", "NSPPrivacyProxyBAAValidation.m", 121, "nil != self->_intermediateCertificate");
  PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  NSData *baaSignature;
  id v5;

  baaSignature = self->_baaSignature;
  v5 = a3;
  objc_msgSend(v5, "setBaaSignature:", baaSignature);
  objc_msgSend(v5, "setLeafCertificate:", self->_leafCertificate);
  objc_msgSend(v5, "setIntermediateCertificate:", self->_intermediateCertificate);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_baaSignature, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_leafCertificate, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSData copyWithZone:](self->_intermediateCertificate, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *baaSignature;
  NSData *leafCertificate;
  NSData *intermediateCertificate;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((baaSignature = self->_baaSignature, !((unint64_t)baaSignature | v4[1]))
     || -[NSData isEqual:](baaSignature, "isEqual:"))
    && ((leafCertificate = self->_leafCertificate, !((unint64_t)leafCertificate | v4[3]))
     || -[NSData isEqual:](leafCertificate, "isEqual:")))
  {
    intermediateCertificate = self->_intermediateCertificate;
    if ((unint64_t)intermediateCertificate | v4[2])
      v8 = -[NSData isEqual:](intermediateCertificate, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSData hash](self->_baaSignature, "hash");
  v4 = -[NSData hash](self->_leafCertificate, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_intermediateCertificate, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[NSPPrivacyProxyBAAValidation setBaaSignature:](self, "setBaaSignature:");
  if (v4[3])
    -[NSPPrivacyProxyBAAValidation setLeafCertificate:](self, "setLeafCertificate:");
  if (v4[2])
    -[NSPPrivacyProxyBAAValidation setIntermediateCertificate:](self, "setIntermediateCertificate:");

}

- (NSData)baaSignature
{
  return self->_baaSignature;
}

- (void)setBaaSignature:(id)a3
{
  objc_storeStrong((id *)&self->_baaSignature, a3);
}

- (NSData)leafCertificate
{
  return self->_leafCertificate;
}

- (void)setLeafCertificate:(id)a3
{
  objc_storeStrong((id *)&self->_leafCertificate, a3);
}

- (NSData)intermediateCertificate
{
  return self->_intermediateCertificate;
}

- (void)setIntermediateCertificate:(id)a3
{
  objc_storeStrong((id *)&self->_intermediateCertificate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leafCertificate, 0);
  objc_storeStrong((id *)&self->_intermediateCertificate, 0);
  objc_storeStrong((id *)&self->_baaSignature, 0);
}

@end
