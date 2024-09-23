@implementation NPKProtoStandaloneImageSize

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandaloneImageSize;
  -[NPKProtoStandaloneImageSize description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandaloneImageSize dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_width);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("width"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("height"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandaloneImageSizeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 3) = self->_width;
  *((_DWORD *)a3 + 2) = self->_height;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 3) = self->_width;
  *((_DWORD *)result + 2) = self->_height;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  BOOL v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_width == v4[3]
    && self->_height == v4[2];

  return v5;
}

- (unint64_t)hash
{
  return (2654435761 * self->_height) ^ (2654435761 * self->_width);
}

- (void)mergeFrom:(id)a3
{
  self->_width = *((_DWORD *)a3 + 3);
  self->_height = *((_DWORD *)a3 + 2);
}

- (int)width
{
  return self->_width;
}

- (void)setWidth:(int)a3
{
  self->_width = a3;
}

- (int)height
{
  return self->_height;
}

- (void)setHeight:(int)a3
{
  self->_height = a3;
}

@end
