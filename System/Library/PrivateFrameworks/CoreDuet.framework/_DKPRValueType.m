@implementation _DKPRValueType

- (uint64_t)setType:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 16) = a2;
  return result;
}

- (uint64_t)setTypeCode:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 8) = a2;
  return result;
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt64Field();

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
  v8.super_class = (Class)_DKPRValueType;
  -[_DKPRValueType description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPRValueType dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t type;
  __CFString *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  if (type >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E26E5878[type];
  }
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_typeCode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("typeCode"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _DKPRValueTypeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 4) = self->_type;
  *((_QWORD *)result + 1) = self->_typeCode;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_type == *((_DWORD *)v4 + 4)
    && self->_typeCode == *((_QWORD *)v4 + 1);

  return v5;
}

- (unint64_t)hash
{
  return (2654435761 * self->_typeCode) ^ (2654435761 * self->_type);
}

- (uint64_t)type
{
  if (result)
    return *(unsigned int *)(result + 16);
  return result;
}

- (uint64_t)typeCode
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

@end
