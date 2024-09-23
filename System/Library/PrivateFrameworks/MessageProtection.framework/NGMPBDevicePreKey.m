@implementation NGMPBDevicePreKey

- (BOOL)hasDhKey
{
  return self->_dhKey != 0;
}

- (BOOL)hasTetraPrivateKey
{
  return self->_tetraPrivateKey != 0;
}

- (BOOL)hasTetraRegistrationData
{
  return self->_tetraRegistrationData != 0;
}

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
  v8.super_class = (Class)NGMPBDevicePreKey;
  -[NGMPBDevicePreKey description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NGMPBDevicePreKey dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NGMPBP256Key *dhKey;
  void *v5;
  void *v6;
  NSData *prekeySignature;
  NSData *tetraPrivateKey;
  NSData *tetraRegistrationData;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dhKey = self->_dhKey;
  if (dhKey)
  {
    -[NGMPBP256Key dictionaryRepresentation](dhKey, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("dhKey"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_timestamp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("timestamp"));

  prekeySignature = self->_prekeySignature;
  if (prekeySignature)
    objc_msgSend(v3, "setObject:forKey:", prekeySignature, CFSTR("prekeySignature"));
  tetraPrivateKey = self->_tetraPrivateKey;
  if (tetraPrivateKey)
    objc_msgSend(v3, "setObject:forKey:", tetraPrivateKey, CFSTR("tetraPrivateKey"));
  tetraRegistrationData = self->_tetraRegistrationData;
  if (tetraRegistrationData)
    objc_msgSend(v3, "setObject:forKey:", tetraRegistrationData, CFSTR("tetraRegistrationData"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_tetraVersion);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("tetraVersion"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NGMPBDevicePreKeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (self->_dhKey)
    PBDataWriterWriteSubmessage();
  PBDataWriterWriteDoubleField();
  if (!self->_prekeySignature)
    -[NGMPBDevicePreKey writeTo:].cold.1();
  PBDataWriterWriteDataField();
  if (self->_tetraPrivateKey)
    PBDataWriterWriteDataField();
  if (self->_tetraRegistrationData)
    PBDataWriterWriteDataField();
  v4 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  double *v4;
  double *v5;

  v4 = (double *)a3;
  v5 = v4;
  if (self->_dhKey)
  {
    objc_msgSend(v4, "setDhKey:");
    v4 = v5;
  }
  v4[1] = self->_timestamp;
  objc_msgSend(v4, "setPrekeySignature:", self->_prekeySignature);
  if (self->_tetraPrivateKey)
    objc_msgSend(v5, "setTetraPrivateKey:");
  if (self->_tetraRegistrationData)
    objc_msgSend(v5, "setTetraRegistrationData:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 12) = self->_tetraVersion;
    *((_BYTE *)v5 + 52) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NGMPBP256Key copyWithZone:](self->_dhKey, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(double *)(v5 + 8) = self->_timestamp;
  v8 = -[NSData copyWithZone:](self->_prekeySignature, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSData copyWithZone:](self->_tetraPrivateKey, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSData copyWithZone:](self->_tetraRegistrationData, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_tetraVersion;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NGMPBP256Key *dhKey;
  NSData *prekeySignature;
  NSData *tetraPrivateKey;
  NSData *tetraRegistrationData;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  dhKey = self->_dhKey;
  if ((unint64_t)dhKey | *((_QWORD *)v4 + 2))
  {
    if (!-[NGMPBP256Key isEqual:](dhKey, "isEqual:"))
      goto LABEL_15;
  }
  if (self->_timestamp != *((double *)v4 + 1))
    goto LABEL_15;
  prekeySignature = self->_prekeySignature;
  if ((unint64_t)prekeySignature | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](prekeySignature, "isEqual:"))
      goto LABEL_15;
  }
  tetraPrivateKey = self->_tetraPrivateKey;
  if ((unint64_t)tetraPrivateKey | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](tetraPrivateKey, "isEqual:"))
      goto LABEL_15;
  }
  tetraRegistrationData = self->_tetraRegistrationData;
  if ((unint64_t)tetraRegistrationData | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](tetraRegistrationData, "isEqual:"))
      goto LABEL_15;
  }
  v9 = (*((_BYTE *)v4 + 52) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) != 0 && self->_tetraVersion == *((_DWORD *)v4 + 12))
    {
      v9 = 1;
      goto LABEL_16;
    }
LABEL_15:
    v9 = 0;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  double timestamp;
  double v5;
  long double v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = -[NGMPBP256Key hash](self->_dhKey, "hash");
  timestamp = self->_timestamp;
  v5 = -timestamp;
  if (timestamp >= 0.0)
    v5 = self->_timestamp;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = fmod(v6, 1.84467441e19);
  v9 = 2654435761u * (unint64_t)v8;
  v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0)
    v10 = 2654435761u * (unint64_t)v8;
  v11 = v9 - (unint64_t)fabs(v7);
  if (v7 < 0.0)
    v12 = v11;
  else
    v12 = v10;
  v13 = -[NSData hash](self->_prekeySignature, "hash");
  v14 = -[NSData hash](self->_tetraPrivateKey, "hash");
  v15 = -[NSData hash](self->_tetraRegistrationData, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v16 = 2654435761 * self->_tetraVersion;
  else
    v16 = 0;
  return v12 ^ v3 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  NGMPBP256Key *dhKey;
  uint64_t v6;
  id v7;

  v4 = a3;
  dhKey = self->_dhKey;
  v6 = *((_QWORD *)v4 + 2);
  v7 = v4;
  if (dhKey)
  {
    if (!v6)
      goto LABEL_7;
    -[NGMPBP256Key mergeFrom:](dhKey, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[NGMPBDevicePreKey setDhKey:](self, "setDhKey:");
  }
  v4 = v7;
LABEL_7:
  self->_timestamp = *((double *)v4 + 1);
  if (*((_QWORD *)v4 + 3))
  {
    -[NGMPBDevicePreKey setPrekeySignature:](self, "setPrekeySignature:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NGMPBDevicePreKey setTetraPrivateKey:](self, "setTetraPrivateKey:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[NGMPBDevicePreKey setTetraRegistrationData:](self, "setTetraRegistrationData:");
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    self->_tetraVersion = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NGMPBP256Key)dhKey
{
  return self->_dhKey;
}

- (void)setDhKey:(id)a3
{
  objc_storeStrong((id *)&self->_dhKey, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSData)prekeySignature
{
  return self->_prekeySignature;
}

- (void)setPrekeySignature:(id)a3
{
  objc_storeStrong((id *)&self->_prekeySignature, a3);
}

- (NSData)tetraPrivateKey
{
  return self->_tetraPrivateKey;
}

- (void)setTetraPrivateKey:(id)a3
{
  objc_storeStrong((id *)&self->_tetraPrivateKey, a3);
}

- (NSData)tetraRegistrationData
{
  return self->_tetraRegistrationData;
}

- (void)setTetraRegistrationData:(id)a3
{
  objc_storeStrong((id *)&self->_tetraRegistrationData, a3);
}

- (unsigned)tetraVersion
{
  return self->_tetraVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tetraRegistrationData, 0);
  objc_storeStrong((id *)&self->_tetraPrivateKey, 0);
  objc_storeStrong((id *)&self->_prekeySignature, 0);
  objc_storeStrong((id *)&self->_dhKey, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NGMPBDevicePreKey writeTo:]", "NGMPBDevicePreKey.m", 173, "nil != self->_prekeySignature");
}

@end
