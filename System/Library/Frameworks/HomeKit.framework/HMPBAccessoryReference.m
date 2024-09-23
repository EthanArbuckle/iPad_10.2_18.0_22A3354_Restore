@implementation HMPBAccessoryReference

- (BOOL)hasHomeReference
{
  return self->_homeReference != 0;
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
  v8.super_class = (Class)HMPBAccessoryReference;
  -[HMPBAccessoryReference description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPBAccessoryReference dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HMPBHomeReference *homeReference;
  void *v5;
  NSData *uniqueIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  homeReference = self->_homeReference;
  if (homeReference)
  {
    -[HMPBHomeReference dictionaryRepresentation](homeReference, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("homeReference"));

  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
    objc_msgSend(v3, "setObject:forKey:", uniqueIdentifier, CFSTR("uniqueIdentifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HMPBAccessoryReferenceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_homeReference)
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
  if (self->_homeReference)
  {
    objc_msgSend(v4, "setHomeReference:");
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
  v6 = -[HMPBHomeReference copyWithZone:](self->_homeReference, "copyWithZone:", a3);
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
  HMPBHomeReference *homeReference;
  NSData *uniqueIdentifier;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((homeReference = self->_homeReference, !((unint64_t)homeReference | v4[1]))
     || -[HMPBHomeReference isEqual:](homeReference, "isEqual:")))
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

  v3 = -[HMPBHomeReference hash](self->_homeReference, "hash");
  return -[NSData hash](self->_uniqueIdentifier, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HMPBHomeReference *homeReference;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  homeReference = self->_homeReference;
  v6 = v4[1];
  v7 = v4;
  if (homeReference)
  {
    if (!v6)
      goto LABEL_7;
    -[HMPBHomeReference mergeFrom:](homeReference, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HMPBAccessoryReference setHomeReference:](self, "setHomeReference:");
  }
  v4 = v7;
LABEL_7:
  if (v4[2])
  {
    -[HMPBAccessoryReference setUniqueIdentifier:](self, "setUniqueIdentifier:");
    v4 = v7;
  }

}

- (HMPBHomeReference)homeReference
{
  return self->_homeReference;
}

- (void)setHomeReference:(id)a3
{
  objc_storeStrong((id *)&self->_homeReference, a3);
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
  objc_storeStrong((id *)&self->_homeReference, 0);
}

+ (id)accessoryReferenceWithData:(id)a3
{
  id v3;
  HMPBAccessoryReference *v4;

  v3 = a3;
  v4 = -[HMPBAccessoryReference initWithData:]([HMPBAccessoryReference alloc], "initWithData:", v3);

  return v4;
}

+ (id)accessoryReferenceWithAccessory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  HMPBAccessoryReference *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMPBHomeReference homeReferenceWithHome:](HMPBHomeReference, "homeReferenceWithHome:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(HMPBAccessoryReference);
  objc_msgSend(v3, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "hm_convertToData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPBAccessoryReference setUniqueIdentifier:](v6, "setUniqueIdentifier:", v8);

  -[HMPBAccessoryReference setHomeReference:](v6, "setHomeReference:", v5);
  return v6;
}

@end
