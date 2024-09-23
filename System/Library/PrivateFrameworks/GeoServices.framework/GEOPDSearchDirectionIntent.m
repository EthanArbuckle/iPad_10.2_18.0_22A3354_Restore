@implementation GEOPDSearchDirectionIntent

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchDirectionIntent;
  -[GEOPDSearchDirectionIntent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchDirectionIntent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchDirectionIntent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(id *)(a1 + 8);
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "jsonRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("directionIntent");
      }
      else
      {
        objc_msgSend(v5, "dictionaryRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("direction_intent");
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchDirectionIntent _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchDirectionIntentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  if (self->_directionIntent)
    PBDataWriterWriteSubmessage();
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOPDDirectionIntent copyWithZone:](self->_directionIntent, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOPDDirectionIntent *directionIntent;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    directionIntent = self->_directionIntent;
    if ((unint64_t)directionIntent | v4[1])
      v6 = -[GEOPDDirectionIntent isEqual:](directionIntent, "isEqual:");
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
  return -[GEOPDDirectionIntent hash](self->_directionIntent, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionIntent, 0);
}

@end
