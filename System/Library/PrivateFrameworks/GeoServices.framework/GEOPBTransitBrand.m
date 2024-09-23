@implementation GEOPBTransitBrand

- (GEOPBTransitBrand)init
{
  GEOPBTransitBrand *v2;
  GEOPBTransitBrand *v3;
  GEOPBTransitBrand *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitBrand;
  v2 = -[GEOPBTransitBrand init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBTransitBrand)initWithData:(id)a3
{
  GEOPBTransitBrand *v3;
  GEOPBTransitBrand *v4;
  GEOPBTransitBrand *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitBrand;
  v3 = -[GEOPBTransitBrand initWithData:](&v7, sel_initWithData_, a3);
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
  v8.super_class = (Class)GEOPBTransitBrand;
  -[GEOPBTransitBrand description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBTransitBrand dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitBrand _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  id v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;

  if (!a1)
    return 0;
  -[GEOPBTransitBrand readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 64);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 60));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("brandIndex");
    else
      v7 = CFSTR("brand_index");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 64);
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("muid"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_BYTE *)(a1 + 64) & 0x10) == 0)
  {
    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = v9;
      objc_sync_enter(v10);
      GEOPBTransitBrandReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleAttributes_tags_5);
      objc_sync_exit(v10);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  v11 = *(id *)(a1 + 40);
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("styleAttributes");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("style_attributes");
    }
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_BYTE *)(a1 + 64) & 8) == 0)
  {
    v15 = *(void **)(a1 + 8);
    if (v15)
    {
      v16 = v15;
      objc_sync_enter(v16);
      GEOPBTransitBrandReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNameDisplayString_tags);
      objc_sync_exit(v16);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  v17 = *(id *)(a1 + 32);
  if (v17)
  {
    if (a2)
      v18 = CFSTR("nameDisplayString");
    else
      v18 = CFSTR("name_display_string");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);
  }

  v19 = *(void **)(a1 + 16);
  if (v19)
  {
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __47__GEOPBTransitBrand__dictionaryRepresentation___block_invoke;
      v26[3] = &unk_1E1C00600;
      v23 = v22;
      v27 = v23;
      objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v26);
      v24 = v23;

      v21 = v24;
    }
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitBrand _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_174;
      else
        v6 = (int *)&readAll__nonRecursiveTag_175;
      GEOPBTransitBrandReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      objc_msgSend(*(id *)(a1 + 40), "readAll:", 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __47__GEOPBTransitBrand__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPBTransitBrandReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  id v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x38) == 0))
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
    -[GEOPBTransitBrand readAll:]((uint64_t)self, 0);
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (char)self->_flags;
    }
    v6 = v9;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint64Field();
      v6 = v9;
    }
    if (self->_styleAttributes)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
    }
    if (self->_nameDisplayString)
    {
      PBDataWriterWriteStringField();
      v6 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  char flags;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  PBUnknownFields *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPBTransitBrandReadAllFrom(v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBTransitBrand readAll:]((uint64_t)self, 0);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_brandIndex;
    *(_BYTE *)(v5 + 64) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_muid;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v10 = -[GEOStyleAttributes copyWithZone:](self->_styleAttributes, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[NSString copyWithZone:](self->_nameDisplayString, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v14 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOStyleAttributes *styleAttributes;
  NSString *nameDisplayString;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEOPBTransitBrand readAll:]((uint64_t)self, 1);
  -[GEOPBTransitBrand readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_brandIndex != *((_DWORD *)v4 + 15))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
LABEL_16:
    v7 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_muid != *((_QWORD *)v4 + 3))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_16;
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((_QWORD *)v4 + 5)
    && !-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
  {
    goto LABEL_16;
  }
  nameDisplayString = self->_nameDisplayString;
  if ((unint64_t)nameDisplayString | *((_QWORD *)v4 + 4))
    v7 = -[NSString isEqual:](nameDisplayString, "isEqual:");
  else
    v7 = 1;
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  -[GEOPBTransitBrand readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_brandIndex;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761u * self->_muid;
LABEL_6:
  v5 = v4 ^ v3 ^ -[GEOStyleAttributes hash](self->_styleAttributes, "hash");
  return v5 ^ -[NSString hash](self->_nameDisplayString, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_nameDisplayString, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
