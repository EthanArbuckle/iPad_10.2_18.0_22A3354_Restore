@implementation NGMPBPublicDeviceIdentity

- (void)setTetraVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_tetraVersion = a3;
}

- (void)setHasTetraVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTetraVersion
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)NGMPBPublicDeviceIdentity;
  -[NGMPBPublicDeviceIdentity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NGMPBPublicDeviceIdentity dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *signingKey;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  signingKey = self->_signingKey;
  if (signingKey)
    objc_msgSend(v3, "setObject:forKey:", signingKey, CFSTR("signing_key"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tetraVersion);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("tetraVersion"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NGMPBPublicDeviceIdentityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_signingKey)
    -[NGMPBPublicDeviceIdentity writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setSigningKey:", self->_signingKey);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_tetraVersion;
    *((_BYTE *)v4 + 20) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_signingKey, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_tetraVersion;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *signingKey;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  signingKey = self->_signingKey;
  if ((unint64_t)signingKey | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](signingKey, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0 && self->_tetraVersion == *((_DWORD *)v4 + 4))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSData hash](self->_signingKey, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_tetraVersion;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  unsigned int *v5;

  v4 = (unsigned int *)a3;
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[NGMPBPublicDeviceIdentity setSigningKey:](self, "setSigningKey:");
    v4 = v5;
  }
  if ((v4[5] & 1) != 0)
  {
    self->_tetraVersion = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSData)signingKey
{
  return self->_signingKey;
}

- (void)setSigningKey:(id)a3
{
  objc_storeStrong((id *)&self->_signingKey, a3);
}

- (unsigned)tetraVersion
{
  return self->_tetraVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingKey, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NGMPBPublicDeviceIdentity writeTo:]", "NGMPBPublicDeviceIdentity.m", 96, "nil != self->_signingKey");
}

@end
