@implementation NPKProtoShowPaymentSetupRequest

- (BOOL)hasAppDisplayName
{
  return self->_appDisplayName != 0;
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
  v8.super_class = (Class)NPKProtoShowPaymentSetupRequest;
  -[NPKProtoShowPaymentSetupRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoShowPaymentSetupRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *appDisplayName;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  appDisplayName = self->_appDisplayName;
  if (appDisplayName)
    objc_msgSend(v3, "setObject:forKey:", appDisplayName, CFSTR("appDisplayName"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoShowPaymentSetupRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_appDisplayName)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  NSString *appDisplayName;

  appDisplayName = self->_appDisplayName;
  if (appDisplayName)
    objc_msgSend(a3, "setAppDisplayName:", appDisplayName);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_appDisplayName, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *appDisplayName;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    appDisplayName = self->_appDisplayName;
    if ((unint64_t)appDisplayName | v4[1])
      v6 = -[NSString isEqual:](appDisplayName, "isEqual:");
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
  return -[NSString hash](self->_appDisplayName, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[NPKProtoShowPaymentSetupRequest setAppDisplayName:](self, "setAppDisplayName:");
}

- (NSString)appDisplayName
{
  return self->_appDisplayName;
}

- (void)setAppDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_appDisplayName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appDisplayName, 0);
}

@end
