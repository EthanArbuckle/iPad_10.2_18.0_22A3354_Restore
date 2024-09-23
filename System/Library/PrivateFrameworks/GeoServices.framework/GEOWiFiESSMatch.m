@implementation GEOWiFiESSMatch

- (int)status
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_status;
  else
    return 0;
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasStatus
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C09FF0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OK")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_FOUND")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasEss
{
  return self->_ess != 0;
}

- (GEOWiFiESS)ess
{
  return self->_ess;
}

- (void)setEss:(id)a3
{
  objc_storeStrong((id *)&self->_ess, a3);
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
  v8.super_class = (Class)GEOWiFiESSMatch;
  -[GEOWiFiESSMatch description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiESSMatch dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWiFiESSMatch _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 20) & 1) != 0)
    {
      v5 = *(int *)(a1 + 16);
      if (v5 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E1C09FF0[v5];
      }
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("status"));

    }
    objc_msgSend((id)a1, "ess");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v7, "jsonRepresentation");
      else
        objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("ess"));

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
  return -[GEOWiFiESSMatch _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOWiFiESSMatch)initWithDictionary:(id)a3
{
  return (GEOWiFiESSMatch *)-[GEOWiFiESSMatch _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  GEOWiFiESS *v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  if (!a1)
    goto LABEL_21;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_21;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("OK")) & 1) != 0)
    {
      v8 = 1;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("NOT_FOUND")))
    {
      v8 = 2;
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_14:
    objc_msgSend(a1, "setStatus:", v8);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ess"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = [GEOWiFiESS alloc];
    if ((a3 & 1) != 0)
      v11 = -[GEOWiFiESS initWithJSON:](v10, "initWithJSON:", v9);
    else
      v11 = -[GEOWiFiESS initWithDictionary:](v10, "initWithDictionary:", v9);
    v12 = (void *)v11;
    objc_msgSend(a1, "setEss:", v11);

  }
LABEL_21:

  return a1;
}

- (GEOWiFiESSMatch)initWithJSON:(id)a3
{
  return (GEOWiFiESSMatch *)-[GEOWiFiESSMatch _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiESSMatchIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiESSMatchReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_ess)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return -[GEOWiFiESS hasGreenTeaWithValue:](self->_ess, "hasGreenTeaWithValue:", a3);
}

- (void)copyTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GEOWiFiESSMatch readAll:](self, "readAll:", 0);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_status;
    *((_BYTE *)v5 + 20) |= 1u;
  }
  if (self->_ess)
  {
    objc_msgSend(v5, "setEss:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_status;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v7 = -[GEOWiFiESS copyWithZone:](self->_ess, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOWiFiESS *ess;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[GEOWiFiESSMatch readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_status != *((_DWORD *)v4 + 4))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  ess = self->_ess;
  if ((unint64_t)ess | *((_QWORD *)v4 + 1))
    v6 = -[GEOWiFiESS isEqual:](ess, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  -[GEOWiFiESSMatch readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_status;
  else
    v3 = 0;
  return -[GEOWiFiESS hash](self->_ess, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  GEOWiFiESS *ess;
  uint64_t v6;
  int *v7;

  v7 = (int *)a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = v7;
  if ((v7[5] & 1) != 0)
  {
    self->_status = v7[4];
    *(_BYTE *)&self->_flags |= 1u;
  }
  ess = self->_ess;
  v6 = *((_QWORD *)v7 + 1);
  if (ess)
  {
    if (v6)
    {
      -[GEOWiFiESS mergeFrom:](ess, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[GEOWiFiESSMatch setEss:](self, "setEss:");
    goto LABEL_8;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ess, 0);
}

@end
