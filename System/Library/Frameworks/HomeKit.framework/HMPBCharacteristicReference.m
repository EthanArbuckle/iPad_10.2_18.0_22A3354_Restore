@implementation HMPBCharacteristicReference

- (BOOL)hasServiceReference
{
  return self->_serviceReference != 0;
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
  v8.super_class = (Class)HMPBCharacteristicReference;
  -[HMPBCharacteristicReference description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPBCharacteristicReference dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HMPBServiceReference *serviceReference;
  void *v5;
  NSData *uniqueIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  serviceReference = self->_serviceReference;
  if (serviceReference)
  {
    -[HMPBServiceReference dictionaryRepresentation](serviceReference, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("serviceReference"));

  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
    objc_msgSend(v3, "setObject:forKey:", uniqueIdentifier, CFSTR("uniqueIdentifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HMPBCharacteristicReferenceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_serviceReference)
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
  if (self->_serviceReference)
  {
    objc_msgSend(v4, "setServiceReference:");
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
  v6 = -[HMPBServiceReference copyWithZone:](self->_serviceReference, "copyWithZone:", a3);
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
  HMPBServiceReference *serviceReference;
  NSData *uniqueIdentifier;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((serviceReference = self->_serviceReference, !((unint64_t)serviceReference | v4[1]))
     || -[HMPBServiceReference isEqual:](serviceReference, "isEqual:")))
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

  v3 = -[HMPBServiceReference hash](self->_serviceReference, "hash");
  return -[NSData hash](self->_uniqueIdentifier, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HMPBServiceReference *serviceReference;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  serviceReference = self->_serviceReference;
  v6 = v4[1];
  v7 = v4;
  if (serviceReference)
  {
    if (!v6)
      goto LABEL_7;
    -[HMPBServiceReference mergeFrom:](serviceReference, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HMPBCharacteristicReference setServiceReference:](self, "setServiceReference:");
  }
  v4 = v7;
LABEL_7:
  if (v4[2])
  {
    -[HMPBCharacteristicReference setUniqueIdentifier:](self, "setUniqueIdentifier:");
    v4 = v7;
  }

}

- (HMPBServiceReference)serviceReference
{
  return self->_serviceReference;
}

- (void)setServiceReference:(id)a3
{
  objc_storeStrong((id *)&self->_serviceReference, a3);
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
  objc_storeStrong((id *)&self->_serviceReference, 0);
}

+ (id)characteristicReferenceWithData:(id)a3
{
  id v3;
  HMPBCharacteristicReference *v4;

  v3 = a3;
  v4 = -[HMPBCharacteristicReference initWithData:]([HMPBCharacteristicReference alloc], "initWithData:", v3);

  return v4;
}

+ (id)characteristicReferenceWithCharacteristic:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  HMPBCharacteristicReference *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMPBServiceReference serviceReferenceWithService:](HMPBServiceReference, "serviceReferenceWithService:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(HMPBCharacteristicReference);
  objc_msgSend(v3, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "hm_convertToData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPBCharacteristicReference setUniqueIdentifier:](v6, "setUniqueIdentifier:", v8);

  -[HMPBCharacteristicReference setServiceReference:](v6, "setServiceReference:", v5);
  return v6;
}

@end
