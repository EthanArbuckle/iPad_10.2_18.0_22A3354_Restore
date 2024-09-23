@implementation GEOPDSearchAttributeIntent

- (GEOPDSearchAttributeIntent)init
{
  GEOPDSearchAttributeIntent *v2;
  GEOPDSearchAttributeIntent *v3;
  GEOPDSearchAttributeIntent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchAttributeIntent;
  v2 = -[GEOPDSearchAttributeIntent init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchAttributeIntent)initWithData:(id)a3
{
  GEOPDSearchAttributeIntent *v3;
  GEOPDSearchAttributeIntent *v4;
  GEOPDSearchAttributeIntent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchAttributeIntent;
  v3 = -[GEOPDSearchAttributeIntent initWithData:](&v7, sel_initWithData_, a3);
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
  v8.super_class = (Class)GEOPDSearchAttributeIntent;
  -[GEOPDSearchAttributeIntent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchAttributeIntent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchAttributeIntent _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v22;
  const __CFString *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  const __CFString *v29;

  if (a1)
  {
    -[GEOPDSearchAttributeIntent readAll:](a1, 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 8) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchAttributeIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_173);
        objc_sync_exit(v6);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v7 = *(id *)(a1 + 32);
    if (v7)
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("name"));

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 2) == 0)
    {
      v8 = *(void **)(a1 + 8);
      if (v8)
      {
        v9 = v8;
        objc_sync_enter(v9);
        GEOPDSearchAttributeIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAttributeId_tags_174);
        objc_sync_exit(v9);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v10 = *(id *)(a1 + 16);
    if (v10)
    {
      if (a2)
        v11 = CFSTR("attributeId");
      else
        v11 = CFSTR("attribute_id");
      objc_msgSend(v4, "setObject:forKey:", v10, v11);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 0x20) == 0)
    {
      v12 = *(void **)(a1 + 8);
      if (v12)
      {
        v13 = v12;
        objc_sync_enter(v13);
        GEOPDSearchAttributeIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTokenSet_tags_175);
        objc_sync_exit(v13);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v14 = *(id *)(a1 + 48);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 4) == 0)
    {
      v18 = *(void **)(a1 + 8);
      if (v18)
      {
        v19 = v18;
        objc_sync_enter(v19);
        GEOPDSearchAttributeIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAttributeValue_tags_176);
        objc_sync_exit(v19);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v20 = *(id *)(a1 + 24);
    if (v20)
    {
      if (a2)
        v21 = CFSTR("attributeValue");
      else
        v21 = CFSTR("attribute_value");
      objc_msgSend(v4, "setObject:forKey:", v20, v21);
    }

    if ((*(_BYTE *)(a1 + 72) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 68));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v23 = CFSTR("isOptionalAttribute");
      else
        v23 = CFSTR("is_optional_attribute");
      objc_msgSend(v4, "setObject:forKey:", v22, v23);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 0x10) == 0)
    {
      v24 = *(void **)(a1 + 8);
      if (v24)
      {
        v25 = v24;
        objc_sync_enter(v25);
        GEOPDSearchAttributeIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStructuredAttribute_tags);
        objc_sync_exit(v25);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v26 = *(id *)(a1 + 40);
    v27 = v26;
    if (v26)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v26, "jsonRepresentation");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = CFSTR("structuredAttribute");
      }
      else
      {
        objc_msgSend(v26, "dictionaryRepresentation");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = CFSTR("structured_attribute");
      }
      objc_msgSend(v4, "setObject:forKey:", v28, v29);

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
  return -[GEOPDSearchAttributeIntent _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_182;
      else
        v6 = (int *)&readAll__nonRecursiveTag_183;
      GEOPDSearchAttributeIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
    {
      -[GEOPDSearchTokenSet readAll:](*(_QWORD *)(a1 + 48), 1);
      -[GEOPDSearchStructuredAttribute readAll:](*(_QWORD *)(a1 + 40), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchAttributeIntentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *v5;
  void *v6;
  id v7;

  v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchAttributeIntentIsDirty((uint64_t)self) & 1) == 0)
  {
    v5 = self->_reader;
    objc_sync_enter(v5);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeData:", v6);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchAttributeIntent readAll:]((uint64_t)self, 0);
    if (self->_name)
      PBDataWriterWriteStringField();
    if (self->_attributeId)
      PBDataWriterWriteStringField();
    if (self->_tokenSet)
      PBDataWriterWriteSubmessage();
    if (self->_attributeValue)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_structuredAttribute)
      PBDataWriterWriteSubmessage();
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
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

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
      GEOPDSearchAttributeIntentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchAttributeIntent readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[NSString copyWithZone:](self->_attributeId, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;

  v13 = -[GEOPDSearchTokenSet copyWithZone:](self->_tokenSet, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v13;

  v15 = -[NSString copyWithZone:](self->_attributeValue, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v15;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 68) = self->_isOptionalAttribute;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v17 = -[GEOPDSearchStructuredAttribute copyWithZone:](self->_structuredAttribute, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v17;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  NSString *attributeId;
  GEOPDSearchTokenSet *tokenSet;
  NSString *attributeValue;
  char v9;
  GEOPDSearchStructuredAttribute *structuredAttribute;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEOPDSearchAttributeIntent readAll:]((uint64_t)self, 1);
  -[GEOPDSearchAttributeIntent readAll:]((uint64_t)v4, 1);
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_14;
  }
  attributeId = self->_attributeId;
  if ((unint64_t)attributeId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](attributeId, "isEqual:"))
      goto LABEL_14;
  }
  tokenSet = self->_tokenSet;
  if ((unint64_t)tokenSet | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPDSearchTokenSet isEqual:](tokenSet, "isEqual:"))
      goto LABEL_14;
  }
  attributeValue = self->_attributeValue;
  if ((unint64_t)attributeValue | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](attributeValue, "isEqual:"))
      goto LABEL_14;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) != 0)
    {
      if (self->_isOptionalAttribute)
      {
        if (*((_BYTE *)v4 + 68))
          goto LABEL_20;
      }
      else if (!*((_BYTE *)v4 + 68))
      {
        goto LABEL_20;
      }
    }
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  if ((*((_BYTE *)v4 + 72) & 1) != 0)
    goto LABEL_14;
LABEL_20:
  structuredAttribute = self->_structuredAttribute;
  if ((unint64_t)structuredAttribute | *((_QWORD *)v4 + 5))
    v9 = -[GEOPDSearchStructuredAttribute isEqual:](structuredAttribute, "isEqual:");
  else
    v9 = 1;
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  NSUInteger v6;
  uint64_t v7;

  -[GEOPDSearchAttributeIntent readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_attributeId, "hash");
  v5 = -[GEOPDSearchTokenSet hash](self->_tokenSet, "hash");
  v6 = -[NSString hash](self->_attributeValue, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v7 = 2654435761 * self->_isOptionalAttribute;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[GEOPDSearchStructuredAttribute hash](self->_structuredAttribute, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenSet, 0);
  objc_storeStrong((id *)&self->_structuredAttribute, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_attributeValue, 0);
  objc_storeStrong((id *)&self->_attributeId, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
