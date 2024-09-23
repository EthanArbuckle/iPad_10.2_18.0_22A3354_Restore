@implementation HMPBMetadataCharacteristic

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidStr, 0);
  objc_storeStrong((id *)&self->_chrDescription, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_uuidStr)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_chrDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

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
  v8.super_class = (Class)HMPBMetadataCharacteristic;
  -[HMPBMetadataCharacteristic description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPBMetadataCharacteristic dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uuidStr;
  NSString *chrDescription;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuidStr = self->_uuidStr;
  if (uuidStr)
    objc_msgSend(v3, "setObject:forKey:", uuidStr, CFSTR("uuidStr"));
  chrDescription = self->_chrDescription;
  if (chrDescription)
    objc_msgSend(v4, "setObject:forKey:", chrDescription, CFSTR("chrDescription"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMPBMetadataCharacteristicReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uuidStr, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_chrDescription, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *uuidStr;
  NSString *chrDescription;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((uuidStr = self->_uuidStr, !((unint64_t)uuidStr | v4[2]))
     || -[NSString isEqual:](uuidStr, "isEqual:")))
  {
    chrDescription = self->_chrDescription;
    if ((unint64_t)chrDescription | v4[1])
      v7 = -[NSString isEqual:](chrDescription, "isEqual:");
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

  v3 = -[NSString hash](self->_uuidStr, "hash");
  return -[NSString hash](self->_chrDescription, "hash") ^ v3;
}

@end
