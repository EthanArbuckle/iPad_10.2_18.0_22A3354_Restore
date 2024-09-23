@implementation GEONamedFieldValue

- (GEONamedFieldValue)init
{
  GEONamedFieldValue *v2;
  GEONamedFieldValue *v3;
  GEONamedFieldValue *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEONamedFieldValue;
  v2 = -[GEONamedFieldValue init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEONamedFieldValue)initWithData:(id)a3
{
  GEONamedFieldValue *v3;
  GEONamedFieldValue *v4;
  GEONamedFieldValue *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEONamedFieldValue;
  v3 = -[GEONamedFieldValue initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
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
  v8.super_class = (Class)GEONamedFieldValue;
  -[GEONamedFieldValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONamedFieldValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONamedFieldValue _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  id v9;
  const __CFString *v10;
  char v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v29[4];
  id v30;

  if (!a1)
    return 0;
  -[GEONamedFieldValue readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 72) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("doubleValue");
    else
      v6 = CFSTR("double_value");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 72) & 0x20) == 0)
  {
    v7 = *(void **)(a1 + 8);
    if (v7)
    {
      v8 = v7;
      objc_sync_enter(v8);
      GEONamedFieldValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStringValue_tags_0);
      objc_sync_exit(v8);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v9 = *(id *)(a1 + 48);
  if (v9)
  {
    if (a2)
      v10 = CFSTR("stringValue");
    else
      v10 = CFSTR("string_value");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);
  }

  v11 = *(_BYTE *)(a1 + 72);
  if ((v11 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("intValue");
    else
      v13 = CFSTR("int_value");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

    v11 = *(_BYTE *)(a1 + 72);
  }
  if ((v11 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 68));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("BOOLValue");
    else
      v15 = CFSTR("BOOL_value");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 72) & 0x10) == 0)
  {
    v16 = *(void **)(a1 + 8);
    if (v16)
    {
      v17 = v16;
      objc_sync_enter(v17);
      GEONamedFieldValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapValue_tags);
      objc_sync_exit(v17);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v18 = *(id *)(a1 + 40);
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v18, "jsonRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("mapValue");
    }
    else
    {
      objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("map_value");
    }
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  v22 = *(void **)(a1 + 16);
  if (v22)
  {
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __48__GEONamedFieldValue__dictionaryRepresentation___block_invoke;
      v29[3] = &unk_1E1C00600;
      v26 = v25;
      v30 = v26;
      objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v29);
      v27 = v26;

      v24 = v27;
    }
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEONamedFieldValue _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_1412;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1413;
      GEONamedFieldValueReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      -[GEONamedField readAll:](*(_QWORD *)(a1 + 40), 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __48__GEONamedFieldValue__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (BOOL)readFrom:(id)a3
{
  return GEONamedFieldValueReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  char flags;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEONamedFieldValueIsDirty((uint64_t)self) & 1) == 0)
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEONamedFieldValue readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteDoubleField();
    v5 = v9;
    if (self->_stringValue)
    {
      PBDataWriterWriteStringField();
      v5 = v9;
    }
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt64Field();
      v5 = v9;
      flags = (char)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v9;
    }
    if (self->_mapValue)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  char flags;
  id v12;
  void *v13;
  PBUnknownFields *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEONamedFieldValueReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEONamedFieldValue readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 24) = self->_doubleValue;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_stringValue, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_intValue;
    *(_BYTE *)(v5 + 72) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 68) = self->_BOOLValue;
    *(_BYTE *)(v5 + 72) |= 4u;
  }
  v12 = -[GEONamedField copyWithZone:](self->_mapValue, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v14 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSString *stringValue;
  char v8;
  GEONamedField *mapValue;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEONamedFieldValue readAll:]((uint64_t)self, 1);
  -[GEONamedFieldValue readAll:]((uint64_t)v4, 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 72);
  if ((flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_doubleValue != *((double *)v4 + 3))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    goto LABEL_19;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:"))
      goto LABEL_19;
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 72);
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_intValue != *((_QWORD *)v4 + 4))
      goto LABEL_19;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_19;
  }
  if ((flags & 4) == 0)
  {
    if ((v6 & 4) == 0)
      goto LABEL_25;
LABEL_19:
    v8 = 0;
    goto LABEL_20;
  }
  if ((v6 & 4) == 0)
    goto LABEL_19;
  if (!self->_BOOLValue)
  {
    if (!*((_BYTE *)v4 + 68))
      goto LABEL_25;
    goto LABEL_19;
  }
  if (!*((_BYTE *)v4 + 68))
    goto LABEL_19;
LABEL_25:
  mapValue = self->_mapValue;
  if ((unint64_t)mapValue | *((_QWORD *)v4 + 5))
    v8 = -[GEONamedField isEqual:](mapValue, "isEqual:");
  else
    v8 = 1;
LABEL_20:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  double doubleValue;
  double v5;
  long double v6;
  double v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;

  -[GEONamedFieldValue readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    doubleValue = self->_doubleValue;
    v5 = -doubleValue;
    if (doubleValue >= 0.0)
      v5 = self->_doubleValue;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[NSString hash](self->_stringValue, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v9 = 2654435761 * self->_intValue;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_11;
LABEL_13:
    v10 = 0;
    return v8 ^ v3 ^ v9 ^ v10 ^ -[GEONamedField hash](self->_mapValue, "hash");
  }
  v9 = 0;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_13;
LABEL_11:
  v10 = 2654435761 * self->_BOOLValue;
  return v8 ^ v3 ^ v9 ^ v10 ^ -[GEONamedField hash](self->_mapValue, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_mapValue, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
