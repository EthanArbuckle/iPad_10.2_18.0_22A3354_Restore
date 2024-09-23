@implementation HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo

- (BOOL)hasUuidString
{
  return self->_uuidString != 0;
}

- (BOOL)hasPublicPairingIdentity
{
  return self->_publicPairingIdentity != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo;
  -[HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uuidString;
  HMAccessoryInfoProtoPublicPairingIdentity *publicPairingIdentity;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuidString = self->_uuidString;
  if (uuidString)
    objc_msgSend(v3, "setObject:forKey:", uuidString, CFSTR("uuidString"));
  publicPairingIdentity = self->_publicPairingIdentity;
  if (publicPairingIdentity)
  {
    -[HMAccessoryInfoProtoPublicPairingIdentity dictionaryRepresentation](publicPairingIdentity, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("publicPairingIdentity"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_uuidString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_publicPairingIdentity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_uuidString)
  {
    objc_msgSend(v4, "setUuidString:");
    v4 = v5;
  }
  if (self->_publicPairingIdentity)
  {
    objc_msgSend(v5, "setPublicPairingIdentity:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uuidString, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[HMAccessoryInfoProtoPublicPairingIdentity copyWithZone:](self->_publicPairingIdentity, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *uuidString;
  HMAccessoryInfoProtoPublicPairingIdentity *publicPairingIdentity;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((uuidString = self->_uuidString, !((unint64_t)uuidString | v4[2]))
     || -[NSString isEqual:](uuidString, "isEqual:")))
  {
    publicPairingIdentity = self->_publicPairingIdentity;
    if ((unint64_t)publicPairingIdentity | v4[1])
      v7 = -[HMAccessoryInfoProtoPublicPairingIdentity isEqual:](publicPairingIdentity, "isEqual:");
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
  NSUInteger v3;

  v3 = -[NSString hash](self->_uuidString, "hash");
  return -[HMAccessoryInfoProtoPublicPairingIdentity hash](self->_publicPairingIdentity, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HMAccessoryInfoProtoPublicPairingIdentity *publicPairingIdentity;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo setUuidString:](self, "setUuidString:");
    v4 = v7;
  }
  publicPairingIdentity = self->_publicPairingIdentity;
  v6 = v4[1];
  if (publicPairingIdentity)
  {
    if (v6)
    {
      -[HMAccessoryInfoProtoPublicPairingIdentity mergeFrom:](publicPairingIdentity, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[HMAccessoryDiagnosticInfoProtoCurrentAccessoryInfo setPublicPairingIdentity:](self, "setPublicPairingIdentity:");
    goto LABEL_8;
  }

}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setUuidString:(id)a3
{
  objc_storeStrong((id *)&self->_uuidString, a3);
}

- (HMAccessoryInfoProtoPublicPairingIdentity)publicPairingIdentity
{
  return self->_publicPairingIdentity;
}

- (void)setPublicPairingIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_publicPairingIdentity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_publicPairingIdentity, 0);
}

@end
