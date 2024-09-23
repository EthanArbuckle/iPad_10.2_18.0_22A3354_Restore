@implementation HMPBServiceReference

- (BOOL)hasAccessoryReference
{
  return self->_accessoryReference != 0;
}

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
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
  v8.super_class = (Class)HMPBServiceReference;
  -[HMPBServiceReference description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPBServiceReference dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HMPBAccessoryReference *accessoryReference;
  void *v5;
  NSData *uniqueIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessoryReference = self->_accessoryReference;
  if (accessoryReference)
  {
    -[HMPBAccessoryReference dictionaryRepresentation](accessoryReference, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("accessoryReference"));

  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
    objc_msgSend(v3, "setObject:forKey:", uniqueIdentifier, CFSTR("uniqueIdentifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HMPBServiceReferenceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_accessoryReference)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_uniqueIdentifier)
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
  if (self->_accessoryReference)
  {
    objc_msgSend(v4, "setAccessoryReference:");
    v4 = v5;
  }
  if (self->_uniqueIdentifier)
  {
    objc_msgSend(v5, "setUniqueIdentifier:");
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
  v6 = -[HMPBAccessoryReference copyWithZone:](self->_accessoryReference, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_uniqueIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  HMPBAccessoryReference *accessoryReference;
  NSData *uniqueIdentifier;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((accessoryReference = self->_accessoryReference, !((unint64_t)accessoryReference | v4[1]))
     || -[HMPBAccessoryReference isEqual:](accessoryReference, "isEqual:")))
  {
    uniqueIdentifier = self->_uniqueIdentifier;
    if ((unint64_t)uniqueIdentifier | v4[2])
      v7 = -[NSData isEqual:](uniqueIdentifier, "isEqual:");
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

  v3 = -[HMPBAccessoryReference hash](self->_accessoryReference, "hash");
  return -[NSData hash](self->_uniqueIdentifier, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HMPBAccessoryReference *accessoryReference;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  accessoryReference = self->_accessoryReference;
  v6 = v4[1];
  v7 = v4;
  if (accessoryReference)
  {
    if (!v6)
      goto LABEL_7;
    -[HMPBAccessoryReference mergeFrom:](accessoryReference, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HMPBServiceReference setAccessoryReference:](self, "setAccessoryReference:");
  }
  v4 = v7;
LABEL_7:
  if (v4[2])
  {
    -[HMPBServiceReference setUniqueIdentifier:](self, "setUniqueIdentifier:");
    v4 = v7;
  }

}

- (HMPBAccessoryReference)accessoryReference
{
  return self->_accessoryReference;
}

- (void)setAccessoryReference:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryReference, a3);
}

- (NSData)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryReference, 0);
}

+ (HMPBServiceReference)serviceReferenceWithData:(id)a3
{
  id v3;
  HMPBServiceReference *v4;

  v3 = a3;
  v4 = -[HMPBServiceReference initWithData:]([HMPBServiceReference alloc], "initWithData:", v3);

  return v4;
}

+ (HMPBServiceReference)serviceReferenceWithService:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  HMPBServiceReference *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMPBAccessoryReference accessoryReferenceWithAccessory:](HMPBAccessoryReference, "accessoryReferenceWithAccessory:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(HMPBServiceReference);
  objc_msgSend(v3, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "hm_convertToData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPBServiceReference setUniqueIdentifier:](v6, "setUniqueIdentifier:", v8);

  -[HMPBServiceReference setAccessoryReference:](v6, "setAccessoryReference:", v5);
  return v6;
}

@end
