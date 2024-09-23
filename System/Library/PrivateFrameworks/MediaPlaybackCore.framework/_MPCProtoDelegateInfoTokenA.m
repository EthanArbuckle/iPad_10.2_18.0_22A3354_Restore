@implementation _MPCProtoDelegateInfoTokenA

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)_MPCProtoDelegateInfoTokenA;
  -[_MPCProtoDelegateInfoTokenA description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCProtoDelegateInfoTokenA dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *picRequestData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  picRequestData = self->_picRequestData;
  if (picRequestData)
    objc_msgSend(v3, "setObject:forKey:", picRequestData, CFSTR("picRequestData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MPCProtoDelegateInfoTokenAReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_picRequestData)
    PBDataWriterWriteDataField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_picRequestData, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *picRequestData;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    picRequestData = self->_picRequestData;
    if ((unint64_t)picRequestData | v4[1])
      v6 = -[NSData isEqual:](picRequestData, "isEqual:");
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
  return -[NSData hash](self->_picRequestData, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_picRequestData, 0);
}

- (void)setPicRequestData:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (uint64_t)picRequestData
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

@end
