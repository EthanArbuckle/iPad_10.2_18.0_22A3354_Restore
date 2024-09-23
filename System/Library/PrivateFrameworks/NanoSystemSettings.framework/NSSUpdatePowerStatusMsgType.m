@implementation NSSUpdatePowerStatusMsgType

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NSSUpdatePowerStatusMsgType;
  -[NSSUpdatePowerStatusMsgType description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSUpdatePowerStatusMsgType dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_notificationType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("notificationType"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSSUpdatePowerStatusMsgTypeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  *((_QWORD *)a3 + 1) = self->_notificationType;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = self->_notificationType;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    v5 = self->_notificationType == v4[1];
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return 2654435761u * self->_notificationType;
}

- (void)mergeFrom:(id)a3
{
  self->_notificationType = *((_QWORD *)a3 + 1);
}

- (unint64_t)notificationType
{
  return self->_notificationType;
}

- (void)setNotificationType:(unint64_t)a3
{
  self->_notificationType = a3;
}

@end
