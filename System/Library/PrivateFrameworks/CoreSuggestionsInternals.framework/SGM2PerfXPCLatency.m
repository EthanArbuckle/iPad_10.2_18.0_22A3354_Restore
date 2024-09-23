@implementation SGM2PerfXPCLatency

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("PerfXPCLatency");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (int)method
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_method;
  else
    return 0;
}

- (void)setMethod:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_method = a3;
}

- (void)setHasMethod:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMethod
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)methodAsString:(int)a3
{
  if (!a3)
    return CFSTR("SGMSuggestionsFromMessage");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMethod:(id)a3
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("SGMSuggestionsFromMessage"));
  return 0;
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
  v8.super_class = (Class)SGM2PerfXPCLatency;
  -[SGM2PerfXPCLatency description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGM2PerfXPCLatency dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *key;
  __CFString *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if (self->_method)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_method);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = CFSTR("SGMSuggestionsFromMessage");
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("method"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SGM2PerfXPCLatencyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (self->_key)
  {
    v5 = v4;
    objc_msgSend(v4, "setKey:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_method;
    *((_BYTE *)v4 + 20) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_method;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0 && self->_method == *((_DWORD *)v4 + 4))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_key, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_method;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[SGM2PerfXPCLatency setKey:](self, "setKey:");
    v4 = v5;
  }
  if ((v4[5] & 1) != 0)
  {
    self->_method = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
