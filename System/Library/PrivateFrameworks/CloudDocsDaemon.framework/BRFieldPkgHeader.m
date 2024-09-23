@implementation BRFieldPkgHeader

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)BRFieldPkgHeader;
  -[BRFieldPkgHeader description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRFieldPkgHeader dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BRFieldPkgHeaderReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_version;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_version;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  BOOL v5;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    v5 = self->_version == v4[2];
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return 2654435761 * self->_version;
}

- (void)mergeFrom:(id)a3
{
  self->_version = *((_DWORD *)a3 + 2);
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

@end
