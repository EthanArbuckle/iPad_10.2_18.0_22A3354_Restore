@implementation NGMPBPublicDevicePrekey

- (BOOL)hasTetraPreKey
{
  return self->_tetraPreKey != 0;
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
  v8.super_class = (Class)NGMPBPublicDevicePrekey;
  -[NGMPBPublicDevicePrekey description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NGMPBPublicDevicePrekey dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *prekey;
  NSData *prekeySignature;
  void *v7;
  NSData *tetraPreKey;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  prekey = self->_prekey;
  if (prekey)
    objc_msgSend(v3, "setObject:forKey:", prekey, CFSTR("prekey"));
  prekeySignature = self->_prekeySignature;
  if (prekeySignature)
    objc_msgSend(v4, "setObject:forKey:", prekeySignature, CFSTR("prekeySignature"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_timestamp);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("timestamp"));

  tetraPreKey = self->_tetraPreKey;
  if (tetraPreKey)
    objc_msgSend(v4, "setObject:forKey:", tetraPreKey, CFSTR("tetraPreKey"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NGMPBPublicDevicePrekeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_prekey)
    -[NGMPBPublicDevicePrekey writeTo:].cold.1();
  PBDataWriterWriteDataField();
  if (!self->_prekeySignature)
    -[NGMPBPublicDevicePrekey writeTo:].cold.2();
  PBDataWriterWriteDataField();
  PBDataWriterWriteDoubleField();
  if (self->_tetraPreKey)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  double *v4;
  double *v5;

  v5 = (double *)a3;
  objc_msgSend(v5, "setPrekey:", self->_prekey);
  objc_msgSend(v5, "setPrekeySignature:", self->_prekeySignature);
  v4 = v5;
  v5[1] = self->_timestamp;
  if (self->_tetraPreKey)
  {
    objc_msgSend(v5, "setTetraPreKey:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_prekey, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSData copyWithZone:](self->_prekeySignature, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  *(double *)(v5 + 8) = self->_timestamp;
  v10 = -[NSData copyWithZone:](self->_tetraPreKey, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *prekey;
  NSData *prekeySignature;
  NSData *tetraPreKey;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((prekey = self->_prekey, !((unint64_t)prekey | v4[2]))
     || -[NSData isEqual:](prekey, "isEqual:"))
    && ((prekeySignature = self->_prekeySignature, !((unint64_t)prekeySignature | v4[3]))
     || -[NSData isEqual:](prekeySignature, "isEqual:"))
    && self->_timestamp == *((double *)v4 + 1))
  {
    tetraPreKey = self->_tetraPreKey;
    if ((unint64_t)tetraPreKey | v4[4])
      v8 = -[NSData isEqual:](tetraPreKey, "isEqual:");
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
  double timestamp;
  double v6;
  long double v7;
  double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = -[NSData hash](self->_prekey, "hash");
  v4 = -[NSData hash](self->_prekeySignature, "hash");
  timestamp = self->_timestamp;
  v6 = -timestamp;
  if (timestamp >= 0.0)
    v6 = self->_timestamp;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = fmod(v7, 1.84467441e19);
  v10 = 2654435761u * (unint64_t)v9;
  v11 = v10 + (unint64_t)v8;
  if (v8 <= 0.0)
    v11 = 2654435761u * (unint64_t)v9;
  v12 = v10 - (unint64_t)fabs(v8);
  if (v8 < 0.0)
    v13 = v12;
  else
    v13 = v11;
  return v4 ^ v3 ^ v13 ^ -[NSData hash](self->_tetraPreKey, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;

  v4 = a3;
  if (*((_QWORD *)v4 + 2))
    -[NGMPBPublicDevicePrekey setPrekey:](self, "setPrekey:");
  if (*((_QWORD *)v4 + 3))
    -[NGMPBPublicDevicePrekey setPrekeySignature:](self, "setPrekeySignature:");
  self->_timestamp = *((double *)v4 + 1);
  if (*((_QWORD *)v4 + 4))
    -[NGMPBPublicDevicePrekey setTetraPreKey:](self, "setTetraPreKey:");

}

- (NSData)prekey
{
  return self->_prekey;
}

- (void)setPrekey:(id)a3
{
  objc_storeStrong((id *)&self->_prekey, a3);
}

- (NSData)prekeySignature
{
  return self->_prekeySignature;
}

- (void)setPrekeySignature:(id)a3
{
  objc_storeStrong((id *)&self->_prekeySignature, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSData)tetraPreKey
{
  return self->_tetraPreKey;
}

- (void)setTetraPreKey:(id)a3
{
  objc_storeStrong((id *)&self->_tetraPreKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tetraPreKey, 0);
  objc_storeStrong((id *)&self->_prekeySignature, 0);
  objc_storeStrong((id *)&self->_prekey, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NGMPBPublicDevicePrekey writeTo:]", "NGMPBPublicDevicePrekey.m", 105, "nil != self->_prekey");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[NGMPBPublicDevicePrekey writeTo:]", "NGMPBPublicDevicePrekey.m", 110, "nil != self->_prekeySignature");
}

@end
