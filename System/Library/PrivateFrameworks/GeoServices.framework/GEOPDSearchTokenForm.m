@implementation GEOPDSearchTokenForm

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchTokenForm;
  -[GEOPDSearchTokenForm description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchTokenForm dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = *(_QWORD *)(a1 + 8);
    if (v4)
      objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("value"));
    v5 = *(int *)(a1 + 16);
    if (v5 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C11CB8[v5];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("type"));

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchTokenFormReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_value, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  *(_DWORD *)(v5 + 16) = self->_type;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *value;
  BOOL v6;

  v4 = a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((value = self->_value, !((unint64_t)value | *((_QWORD *)v4 + 1)))
     || -[NSString isEqual:](value, "isEqual:"))
    && self->_type == *((_DWORD *)v4 + 4);

  return v6;
}

- (unint64_t)hash
{
  return (2654435761 * self->_type) ^ -[NSString hash](self->_value, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
