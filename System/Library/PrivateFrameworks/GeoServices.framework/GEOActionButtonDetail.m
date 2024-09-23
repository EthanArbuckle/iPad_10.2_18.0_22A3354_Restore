@implementation GEOActionButtonDetail

- (GEOActionButtonDetail)init
{
  GEOActionButtonDetail *v2;
  GEOActionButtonDetail *v3;
  GEOActionButtonDetail *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOActionButtonDetail;
  v2 = -[GEOActionButtonDetail init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOActionButtonDetail)initWithData:(id)a3
{
  GEOActionButtonDetail *v3;
  GEOActionButtonDetail *v4;
  GEOActionButtonDetail *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOActionButtonDetail;
  v3 = -[GEOActionButtonDetail initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCategory
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActionButtonDetailReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategory_tags_4);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasCategory
{
  -[GEOActionButtonDetail _readCategory]((uint64_t)self);
  return self->_category != 0;
}

- (NSString)category
{
  -[GEOActionButtonDetail _readCategory]((uint64_t)self);
  return self->_category;
}

- (void)setCategory:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_category, a3);
}

- (void)_readProviderId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 52) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOActionButtonDetailReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProviderId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasProviderId
{
  -[GEOActionButtonDetail _readProviderId]((uint64_t)self);
  return self->_providerId != 0;
}

- (NSString)providerId
{
  -[GEOActionButtonDetail _readProviderId]((uint64_t)self);
  return self->_providerId;
}

- (void)setProviderId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_providerId, a3);
}

- (int)linkType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_linkType;
  else
    return 0;
}

- (void)setLinkType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_linkType = a3;
}

- (void)setHasLinkType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasLinkType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)linkTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C237F0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLinkType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LINK_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LINK_TYPE_QUICK_LINK")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LINK_TYPE_APP_CLIP_LINK")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LINK_TYPE_APP_EXTENSION")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)dropDown
{
  return self->_dropDown;
}

- (void)setDropDown:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  self->_dropDown = a3;
}

- (void)setHasDropDown:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 18;
  else
    v3 = 16;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDropDown
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEOActionButtonDetail;
  -[GEOActionButtonDetail description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOActionButtonDetail dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOActionButtonDetail _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  char v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "category");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("category"));

    objc_msgSend((id)a1, "providerId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (a2)
        v7 = CFSTR("providerId");
      else
        v7 = CFSTR("provider_id");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);
    }

    v8 = *(_BYTE *)(a1 + 52);
    if ((v8 & 1) != 0)
    {
      v9 = *(int *)(a1 + 44);
      if (v9 >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 44));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E1C237F0[v9];
      }
      if (a2)
        v11 = CFSTR("linkType");
      else
        v11 = CFSTR("link_type");
      objc_msgSend(v4, "setObject:forKey:", v10, v11);

      v8 = *(_BYTE *)(a1 + 52);
    }
    if ((v8 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v13 = CFSTR("dropDown");
      else
        v13 = CFSTR("drop_down");
      objc_msgSend(v4, "setObject:forKey:", v12, v13);

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
  return -[GEOActionButtonDetail _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOActionButtonDetail)initWithDictionary:(id)a3
{
  return (GEOActionButtonDetail *)-[GEOActionButtonDetail _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;

  v5 = a2;
  if (!a1)
    goto LABEL_33;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_33;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("category"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(a1, "setCategory:", v7);

  }
  if (a3)
    v8 = CFSTR("providerId");
  else
    v8 = CFSTR("provider_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(a1, "setProviderId:", v10);

  }
  if (a3)
    v11 = CFSTR("linkType");
  else
    v11 = CFSTR("link_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v12;
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("LINK_TYPE_UNKNOWN")) & 1) != 0)
    {
      v14 = 0;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("LINK_TYPE_QUICK_LINK")) & 1) != 0)
    {
      v14 = 1;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("LINK_TYPE_APP_CLIP_LINK")) & 1) != 0)
    {
      v14 = 2;
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("LINK_TYPE_APP_EXTENSION")))
    {
      v14 = 3;
    }
    else
    {
      v14 = 0;
    }

    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = objc_msgSend(v12, "intValue");
LABEL_26:
    objc_msgSend(a1, "setLinkType:", v14);
  }

  if (a3)
    v15 = CFSTR("dropDown");
  else
    v15 = CFSTR("drop_down");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDropDown:", objc_msgSend(v16, "BOOLValue"));

LABEL_33:
  return a1;
}

- (GEOActionButtonDetail)initWithJSON:(id)a3
{
  return (GEOActionButtonDetail *)-[GEOActionButtonDetail _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_90;
    else
      v8 = (int *)&readAll__nonRecursiveTag_90;
    GEOActionButtonDetailReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOActionButtonDetailIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOActionButtonDetailReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1C) == 0))
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
    -[GEOActionButtonDetail readAll:](self, "readAll:", 0);
    if (self->_category)
      PBDataWriterWriteStringField();
    if (self->_providerId)
      PBDataWriterWriteStringField();
    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteBOOLField();
  }

}

- (void)copyTo:(id)a3
{
  char flags;
  id *v5;

  v5 = (id *)a3;
  -[GEOActionButtonDetail readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 8) = self->_readerMarkPos;
  *((_DWORD *)v5 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_category)
    objc_msgSend(v5, "setCategory:");
  if (self->_providerId)
    objc_msgSend(v5, "setProviderId:");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v5 + 11) = self->_linkType;
    *((_BYTE *)v5 + 52) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_BYTE *)v5 + 48) = self->_dropDown;
    *((_BYTE *)v5 + 52) |= 2u;
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
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOActionButtonDetailReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOActionButtonDetail readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_category, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  v11 = -[NSString copyWithZone:](self->_providerId, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_linkType;
    *(_BYTE *)(v5 + 52) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 48) = self->_dropDown;
    *(_BYTE *)(v5 + 52) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *category;
  NSString *providerId;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEOActionButtonDetail readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  category = self->_category;
  if ((unint64_t)category | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](category, "isEqual:"))
      goto LABEL_13;
  }
  providerId = self->_providerId;
  if ((unint64_t)providerId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](providerId, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_linkType != *((_DWORD *)v4 + 11))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_13;
  }
  v7 = (*((_BYTE *)v4 + 52) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0)
    {
LABEL_13:
      v7 = 0;
      goto LABEL_14;
    }
    if (self->_dropDown)
    {
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_13;
    }
    else if (*((_BYTE *)v4 + 48))
    {
      goto LABEL_13;
    }
    v7 = 1;
  }
LABEL_14:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOActionButtonDetail readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_category, "hash");
  v4 = -[NSString hash](self->_providerId, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v5 = 2654435761 * self->_linkType;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_dropDown;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  char v5;
  _QWORD *v6;

  v6 = a3;
  objc_msgSend(v6, "readAll:", 0);
  v4 = v6;
  if (v6[2])
  {
    -[GEOActionButtonDetail setCategory:](self, "setCategory:");
    v4 = v6;
  }
  if (v4[3])
  {
    -[GEOActionButtonDetail setProviderId:](self, "setProviderId:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 1) != 0)
  {
    self->_linkType = *((_DWORD *)v4 + 11);
    *(_BYTE *)&self->_flags |= 1u;
    v5 = *((_BYTE *)v4 + 52);
  }
  if ((v5 & 2) != 0)
  {
    self->_dropDown = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_flags |= 2u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerId, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
