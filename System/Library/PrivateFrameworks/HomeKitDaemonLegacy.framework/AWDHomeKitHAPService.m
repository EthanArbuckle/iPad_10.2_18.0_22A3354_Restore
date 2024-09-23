@implementation AWDHomeKitHAPService

- (BOOL)hasServiceType
{
  return self->_serviceType != 0;
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
  v8.super_class = (Class)AWDHomeKitHAPService;
  -[AWDHomeKitHAPService description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitHAPService dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  serviceType = self->_serviceType;
  if (serviceType)
    objc_msgSend(v3, "setObject:forKey:", serviceType, CFSTR("serviceType"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDHomeKitHAPServiceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_serviceType)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  NSString *serviceType;

  serviceType = self->_serviceType;
  if (serviceType)
    objc_msgSend(a3, "setServiceType:", serviceType);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_serviceType, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *serviceType;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    serviceType = self->_serviceType;
    if ((unint64_t)serviceType | v4[1])
      v6 = -[NSString isEqual:](serviceType, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_serviceType, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[AWDHomeKitHAPService setServiceType:](self, "setServiceType:");
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_serviceType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
}

@end
