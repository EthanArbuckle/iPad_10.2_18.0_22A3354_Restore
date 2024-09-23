@implementation GEOPDResultRefinementSortElement

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 68) |= 1u;
    *(_BYTE *)(a1 + 68) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDResultRefinementSortElement readAll:](a1, 0);
      objc_msgSend(*(id *)(a1 + 48), "clearUnknownFields:", 1);
      objc_msgSend(*(id *)(a1 + 40), "clearUnknownFields:", 1);
    }
  }
}

- (GEOPDResultRefinementSortElement)init
{
  GEOPDResultRefinementSortElement *v2;
  GEOPDResultRefinementSortElement *v3;
  GEOPDResultRefinementSortElement *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinementSortElement;
  v2 = -[GEOPDResultRefinementSortElement init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDResultRefinementSortElement)initWithData:(id)a3
{
  GEOPDResultRefinementSortElement *v3;
  GEOPDResultRefinementSortElement *v4;
  GEOPDResultRefinementSortElement *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinementSortElement;
  v3 = -[GEOPDResultRefinementSortElement initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDisplayName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementSortElementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayName_tags_920);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)displayName
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDResultRefinementSortElement _readDisplayName]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setDisplayName:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 68) |= 4u;
    *(_BYTE *)(a1 + 68) |= 0x20u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }

}

- (void)_readMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementSortElementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMetadata_tags_922);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)metadata
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDResultRefinementSortElement _readMetadata]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)setMetadata:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 68) |= 8u;
    *(_BYTE *)(a1 + 68) |= 0x20u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }

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
  v8.super_class = (Class)GEOPDResultRefinementSortElement;
  -[GEOPDResultRefinementSortElement description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementSortElement dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementSortElement _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;

  if (!a1)
    return 0;
  -[GEOPDResultRefinementSortElement readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementSortElement displayName]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("displayName");
    else
      v6 = CFSTR("display_name");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
  {
    v7 = *(void **)(a1 + 8);
    if (v7)
    {
      v8 = v7;
      objc_sync_enter(v8);
      GEOPDResultRefinementSortElementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleAttributes_tags_921);
      objc_sync_exit(v8);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v9 = *(id *)(a1 + 48);
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("styleAttributes");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("style_attributes");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  -[GEOPDResultRefinementSortElement metadata]((id *)a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v13, "jsonRepresentation");
    else
      objc_msgSend(v13, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("metadata"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 68) & 2) == 0)
  {
    v16 = *(void **)(a1 + 8);
    if (v16)
    {
      v17 = v16;
      objc_sync_enter(v17);
      GEOPDResultRefinementSortElementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayNameInBar_tags);
      objc_sync_exit(v17);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v18 = *(id *)(a1 + 24);
  if (v18)
  {
    if (a2)
      v19 = CFSTR("displayNameInBar");
    else
      v19 = CFSTR("display_name_in_bar");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);
  }

  v20 = *(void **)(a1 + 16);
  if (v20)
  {
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __62__GEOPDResultRefinementSortElement__dictionaryRepresentation___block_invoke;
      v27[3] = &unk_1E1C00600;
      v24 = v23;
      v28 = v24;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v27);
      v25 = v24;

      v22 = v25;
    }
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDResultRefinementSortElement _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_927;
      else
        v6 = (int *)&readAll__nonRecursiveTag_928;
      GEOPDResultRefinementSortElementReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 48), "readAll:", 1);
      objc_msgSend(*(id *)(a1 + 40), "readAll:", 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __62__GEOPDResultRefinementSortElement__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDResultRefinementSortElementReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDResultRefinementSortElementIsDirty((uint64_t)self) & 1) == 0)
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
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDResultRefinementSortElement readAll:]((uint64_t)self, 0);
    if (self->_displayName)
      PBDataWriterWriteStringField();
    v5 = v8;
    if (self->_styleAttributes)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_metadata)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_displayNameInBar)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDResultRefinementSortElement readAll:]((uint64_t)self, 0);
    v8 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v8;

    v10 = -[GEOStyleAttributes copyWithZone:](self->_styleAttributes, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v10;

    v12 = -[GEOPDResultRefinementMetadata copyWithZone:](self->_metadata, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v12;

    v14 = -[NSString copyWithZone:](self->_displayNameInBar, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDResultRefinementSortElementReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *displayName;
  GEOStyleAttributes *styleAttributes;
  GEOPDResultRefinementMetadata *metadata;
  NSString *displayNameInBar;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDResultRefinementSortElement readAll:]((uint64_t)self, 1),
         -[GEOPDResultRefinementSortElement readAll:]((uint64_t)v4, 1),
         displayName = self->_displayName,
         !((unint64_t)displayName | v4[4]))
     || -[NSString isEqual:](displayName, "isEqual:"))
    && ((styleAttributes = self->_styleAttributes, !((unint64_t)styleAttributes | v4[6]))
     || -[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
    && ((metadata = self->_metadata, !((unint64_t)metadata | v4[5]))
     || -[GEOPDResultRefinementMetadata isEqual:](metadata, "isEqual:")))
  {
    displayNameInBar = self->_displayNameInBar;
    if ((unint64_t)displayNameInBar | v4[3])
      v9 = -[NSString isEqual:](displayNameInBar, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;

  -[GEOPDResultRefinementSortElement readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_displayName, "hash");
  v4 = -[GEOStyleAttributes hash](self->_styleAttributes, "hash") ^ v3;
  v5 = -[GEOPDResultRefinementMetadata hash](self->_metadata, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_displayNameInBar, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_displayNameInBar, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
