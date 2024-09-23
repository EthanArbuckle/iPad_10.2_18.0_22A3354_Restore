@implementation HDCodableBinarySample

- (void)setSample:(id)a3
{
  objc_storeStrong((id *)&self->_sample, a3);
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_sample)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_payload)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (BOOL)hasPayload
{
  return self->_payload != 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDCodableBinarySample;
  -[HDCodableBinarySample description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableBinarySample dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HDCodableSample *sample;
  void *v5;
  NSData *payload;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sample = self->_sample;
  if (sample)
  {
    -[HDCodableSample dictionaryRepresentation](sample, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sample"));

  }
  payload = self->_payload;
  if (payload)
    objc_msgSend(v3, "setObject:forKey:", payload, CFSTR("payload"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableBinarySampleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    v4 = v5;
  }
  if (self->_payload)
  {
    objc_msgSend(v5, "setPayload:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableSample copyWithZone:](self->_sample, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_payload, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  HDCodableSample *sample;
  NSData *payload;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((sample = self->_sample, !((unint64_t)sample | v4[2])) || -[HDCodableSample isEqual:](sample, "isEqual:")))
  {
    payload = self->_payload;
    if ((unint64_t)payload | v4[1])
      v7 = -[NSData isEqual:](payload, "isEqual:");
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
  unint64_t v3;

  v3 = -[HDCodableSample hash](self->_sample, "hash");
  return -[NSData hash](self->_payload, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HDCodableSample *sample;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  sample = self->_sample;
  v6 = v4[2];
  v7 = v4;
  if (sample)
  {
    if (!v6)
      goto LABEL_7;
    -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HDCodableBinarySample setSample:](self, "setSample:");
  }
  v4 = v7;
LABEL_7:
  if (v4[1])
  {
    -[HDCodableBinarySample setPayload:](self, "setPayload:");
    v4 = v7;
  }

}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (NSData)payload
{
  return self->_payload;
}

- (BOOL)applyToObject:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EF2225B8))
  {
    -[HDCodableBinarySample sample](self, "sample");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "applyToObject:", v4);
    if (v6)
    {
      -[HDCodableBinarySample payload](self, "payload");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_setPayload:", v7);

    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

@end
