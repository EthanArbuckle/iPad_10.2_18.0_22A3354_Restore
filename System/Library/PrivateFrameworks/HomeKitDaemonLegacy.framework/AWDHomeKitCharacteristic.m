@implementation AWDHomeKitCharacteristic

- (BOOL)hasServiceType
{
  return self->_serviceType != 0;
}

- (BOOL)hasCharacteristicType
{
  return self->_characteristicType != 0;
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
  v8.super_class = (Class)AWDHomeKitCharacteristic;
  -[AWDHomeKitCharacteristic description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitCharacteristic dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *serviceType;
  NSString *characteristicType;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  serviceType = self->_serviceType;
  if (serviceType)
    objc_msgSend(v3, "setObject:forKey:", serviceType, CFSTR("serviceType"));
  characteristicType = self->_characteristicType;
  if (characteristicType)
    objc_msgSend(v4, "setObject:forKey:", characteristicType, CFSTR("characteristicType"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDHomeKitCharacteristicReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_serviceType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_characteristicType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_serviceType)
  {
    objc_msgSend(v4, "setServiceType:");
    v4 = v5;
  }
  if (self->_characteristicType)
  {
    objc_msgSend(v5, "setCharacteristicType:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_serviceType, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_characteristicType, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *serviceType;
  NSString *characteristicType;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((serviceType = self->_serviceType, !((unint64_t)serviceType | v4[2]))
     || -[NSString isEqual:](serviceType, "isEqual:")))
  {
    characteristicType = self->_characteristicType;
    if ((unint64_t)characteristicType | v4[1])
      v7 = -[NSString isEqual:](characteristicType, "isEqual:");
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

  v3 = -[NSString hash](self->_serviceType, "hash");
  return -[NSString hash](self->_characteristicType, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[AWDHomeKitCharacteristic setServiceType:](self, "setServiceType:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[AWDHomeKitCharacteristic setCharacteristicType:](self, "setCharacteristicType:");
    v4 = v5;
  }

}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_serviceType, a3);
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (void)setCharacteristicType:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
}

@end
