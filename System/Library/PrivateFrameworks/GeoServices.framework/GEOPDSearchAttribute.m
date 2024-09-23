@implementation GEOPDSearchAttribute

- (GEOPDSearchAttribute)init
{
  GEOPDSearchAttribute *v2;
  GEOPDSearchAttribute *v3;
  GEOPDSearchAttribute *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchAttribute;
  v2 = -[GEOPDSearchAttribute init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchAttribute)initWithData:(id)a3
{
  GEOPDSearchAttribute *v3;
  GEOPDSearchAttribute *v4;
  GEOPDSearchAttribute *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchAttribute;
  v3 = -[GEOPDSearchAttribute initWithData:](&v7, sel_initWithData_, a3);
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
  v8.super_class = (Class)GEOPDSearchAttribute;
  -[GEOPDSearchAttribute description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchAttribute dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchAttribute _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  const __CFString *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  id v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  uint64_t v27;
  __CFString *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  -[GEOPDSearchAttribute readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_WORD *)(a1 + 68) & 0x40) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDSearchAttributeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_8);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  v7 = *(id *)(a1 + 32);
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("name"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_WORD *)(a1 + 68) & 0x10) == 0)
  {
    v8 = *(void **)(a1 + 8);
    if (v8)
    {
      v9 = v8;
      objc_sync_enter(v9);
      GEOPDSearchAttributeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAttributeId_tags);
      objc_sync_exit(v9);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  v10 = *(id *)(a1 + 16);
  if (v10)
  {
    if (a2)
      v11 = CFSTR("attributeId");
    else
      v11 = CFSTR("attribute_id");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_WORD *)(a1 + 68) & 0x80) == 0)
  {
    v12 = *(void **)(a1 + 8);
    if (v12)
    {
      v13 = v12;
      objc_sync_enter(v13);
      GEOPDSearchAttributeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTokenSet_tags);
      objc_sync_exit(v13);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  v14 = *(id *)(a1 + 40);
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v14, "jsonRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("tokenSet");
    }
    else
    {
      objc_msgSend(v14, "dictionaryRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("token_set");
    }
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_WORD *)(a1 + 68) & 0x20) == 0)
  {
    v18 = *(void **)(a1 + 8);
    if (v18)
    {
      v19 = v18;
      objc_sync_enter(v19);
      GEOPDSearchAttributeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAttributeValue_tags);
      objc_sync_exit(v19);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  v20 = *(id *)(a1 + 24);
  if (v20)
  {
    if (a2)
      v21 = CFSTR("attributeValue");
    else
      v21 = CFSTR("attribute_value");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);
  }

  v22 = *(_WORD *)(a1 + 68);
  if ((v22 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v24 = CFSTR("isOptionalAttribute");
    else
      v24 = CFSTR("is_optional_attribute");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

    v22 = *(_WORD *)(a1 + 68);
    if ((v22 & 8) == 0)
    {
LABEL_33:
      if ((v22 & 1) == 0)
        goto LABEL_34;
      goto LABEL_44;
    }
  }
  else if ((v22 & 8) == 0)
  {
    goto LABEL_33;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 66));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v26 = CFSTR("negateAttribute");
  else
    v26 = CFSTR("negate_attribute");
  objc_msgSend(v4, "setObject:forKey:", v25, v26);

  v22 = *(_WORD *)(a1 + 68);
  if ((v22 & 1) == 0)
  {
LABEL_34:
    if ((v22 & 4) == 0)
      return v4;
    goto LABEL_51;
  }
LABEL_44:
  v27 = *(int *)(a1 + 60);
  if (v27 >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 60));
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = off_1E1C0A580[v27];
  }
  if (a2)
    v29 = CFSTR("rankingOrder");
  else
    v29 = CFSTR("ranking_order");
  objc_msgSend(v4, "setObject:forKey:", v28, v29);

  if ((*(_WORD *)(a1 + 68) & 4) != 0)
  {
LABEL_51:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 65));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v31 = CFSTR("isOptionalKeyword");
    else
      v31 = CFSTR("is_optional_keyword");
    objc_msgSend(v4, "setObject:forKey:", v30, v31);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchAttribute _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_155_0;
      else
        v6 = (int *)&readAll__nonRecursiveTag_156_0;
      GEOPDSearchAttributeReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      -[GEOPDSearchTokenSet readAll:](*(_QWORD *)(a1 + 40), 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchAttributeReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchAttributeIsDirty((uint64_t)self) & 1) == 0)
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
    goto LABEL_21;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchAttribute readAll:]((uint64_t)self, 0);
  if (self->_name)
    PBDataWriterWriteStringField();
  if (self->_attributeId)
    PBDataWriterWriteStringField();
  if (self->_tokenSet)
    PBDataWriterWriteSubmessage();
  if (self->_attributeValue)
    PBDataWriterWriteStringField();
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_13:
      if ((flags & 1) == 0)
        goto LABEL_14;
      goto LABEL_18;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_14:
    if ((flags & 4) == 0)
      goto LABEL_21;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_flags & 4) != 0)
LABEL_19:
    PBDataWriterWriteBOOLField();
LABEL_21:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int16 flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchAttribute readAll:]((uint64_t)self, 0);
    v9 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v9;

    v11 = -[NSString copyWithZone:](self->_attributeId, "copyWithZone:", a3);
    v12 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v11;

    v13 = -[GEOPDSearchTokenSet copyWithZone:](self->_tokenSet, "copyWithZone:", a3);
    v14 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v13;

    v15 = -[NSString copyWithZone:](self->_attributeValue, "copyWithZone:", a3);
    v16 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v15;

    flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      *(_BYTE *)(v5 + 64) = self->_isOptionalAttribute;
      *(_WORD *)(v5 + 68) |= 2u;
      flags = (__int16)self->_flags;
      if ((flags & 8) == 0)
      {
LABEL_7:
        if ((flags & 1) == 0)
          goto LABEL_8;
        goto LABEL_13;
      }
    }
    else if ((flags & 8) == 0)
    {
      goto LABEL_7;
    }
    *(_BYTE *)(v5 + 66) = self->_negateAttribute;
    *(_WORD *)(v5 + 68) |= 8u;
    flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_8:
      if ((flags & 4) == 0)
        return (id)v5;
LABEL_9:
      *(_BYTE *)(v5 + 65) = self->_isOptionalKeyword;
      *(_WORD *)(v5 + 68) |= 4u;
      return (id)v5;
    }
LABEL_13:
    *(_DWORD *)(v5 + 60) = self->_rankingOrder;
    *(_WORD *)(v5 + 68) |= 1u;
    if ((*(_WORD *)&self->_flags & 4) == 0)
      return (id)v5;
    goto LABEL_9;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDSearchAttributeReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  NSString *attributeId;
  GEOPDSearchTokenSet *tokenSet;
  NSString *attributeValue;
  __int16 flags;
  __int16 v10;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  -[GEOPDSearchAttribute readAll:]((uint64_t)self, 1);
  -[GEOPDSearchAttribute readAll:]((uint64_t)v4, 1);
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_33;
  }
  attributeId = self->_attributeId;
  if ((unint64_t)attributeId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](attributeId, "isEqual:"))
      goto LABEL_33;
  }
  tokenSet = self->_tokenSet;
  if ((unint64_t)tokenSet | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDSearchTokenSet isEqual:](tokenSet, "isEqual:"))
      goto LABEL_33;
  }
  attributeValue = self->_attributeValue;
  if ((unint64_t)attributeValue | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](attributeValue, "isEqual:"))
      goto LABEL_33;
  }
  flags = (__int16)self->_flags;
  v10 = *((_WORD *)v4 + 34);
  if ((flags & 2) != 0)
  {
    if ((v10 & 2) == 0)
      goto LABEL_33;
    if (self->_isOptionalAttribute)
    {
      if (!*((_BYTE *)v4 + 64))
        goto LABEL_33;
    }
    else if (*((_BYTE *)v4 + 64))
    {
      goto LABEL_33;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_33;
  }
  if ((flags & 8) != 0)
  {
    if ((v10 & 8) == 0)
      goto LABEL_33;
    if (self->_negateAttribute)
    {
      if (!*((_BYTE *)v4 + 66))
        goto LABEL_33;
    }
    else if (*((_BYTE *)v4 + 66))
    {
      goto LABEL_33;
    }
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_33;
  }
  if ((flags & 1) != 0)
  {
    if ((v10 & 1) == 0 || self->_rankingOrder != *((_DWORD *)v4 + 15))
      goto LABEL_33;
  }
  else if ((v10 & 1) != 0)
  {
    goto LABEL_33;
  }
  v11 = (v10 & 4) == 0;
  if ((flags & 4) != 0)
  {
    if ((v10 & 4) != 0)
    {
      if (self->_isOptionalKeyword)
      {
        if (!*((_BYTE *)v4 + 65))
          goto LABEL_33;
      }
      else if (*((_BYTE *)v4 + 65))
      {
        goto LABEL_33;
      }
      v11 = 1;
      goto LABEL_34;
    }
LABEL_33:
    v11 = 0;
  }
LABEL_34:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  NSUInteger v6;
  __int16 flags;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  -[GEOPDSearchAttribute readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_attributeId, "hash");
  v5 = -[GEOPDSearchTokenSet hash](self->_tokenSet, "hash");
  v6 = -[NSString hash](self->_attributeValue, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    v8 = 2654435761 * self->_isOptionalAttribute;
    if ((flags & 8) != 0)
    {
LABEL_3:
      v9 = 2654435761 * self->_negateAttribute;
      if ((flags & 1) != 0)
        goto LABEL_4;
LABEL_8:
      v10 = 0;
      if ((flags & 4) != 0)
        goto LABEL_5;
LABEL_9:
      v11 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11;
    }
  }
  else
  {
    v8 = 0;
    if ((flags & 8) != 0)
      goto LABEL_3;
  }
  v9 = 0;
  if ((flags & 1) == 0)
    goto LABEL_8;
LABEL_4:
  v10 = 2654435761 * self->_rankingOrder;
  if ((flags & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v11 = 2654435761 * self->_isOptionalKeyword;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenSet, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_attributeValue, 0);
  objc_storeStrong((id *)&self->_attributeId, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
