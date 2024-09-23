@implementation GEOPDPictureItem

- (GEOPDPictureItem)init
{
  GEOPDPictureItem *v2;
  GEOPDPictureItem *v3;
  GEOPDPictureItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPictureItem;
  v2 = -[GEOPDPictureItem init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPictureItem)initWithData:(id)a3
{
  GEOPDPictureItem *v3;
  GEOPDPictureItem *v4;
  GEOPDPictureItem *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPictureItem;
  v3 = -[GEOPDPictureItem initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPhoto
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPictureItemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhoto_tags_5231);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)photo
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPictureItem _readPhoto]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)_readPrimaryText
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPictureItemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrimaryText_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)primaryText
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPictureItem _readPrimaryText]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)_readSecondaryText
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPictureItemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSecondaryText_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)secondaryText
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPictureItem _readSecondaryText]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (uint64_t)photoItemType
{
  uint64_t v1;
  char v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_BYTE *)(v1 + 64);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 56));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 60);
    else
      return 0;
  }
  return result;
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
  v8.super_class = (Class)GEOPDPictureItem;
  -[GEOPDPictureItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPictureItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPictureItem _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;

  if (!a1)
    return 0;
  -[GEOPDPictureItem readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPictureItem photo]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("photo"));

  }
  -[GEOPDPictureItem primaryText]((id *)a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (a2)
      v9 = CFSTR("primaryText");
    else
      v9 = CFSTR("primary_text");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);
  }

  -[GEOPDPictureItem secondaryText]((id *)a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (a2)
      v11 = CFSTR("secondaryText");
    else
      v11 = CFSTR("secondary_text");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

  if ((*(_BYTE *)(a1 + 64) & 1) != 0)
  {
    v12 = *(int *)(a1 + 60);
    if (v12 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 60));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E1C0BF00[v12];
    }
    if (a2)
      v14 = CFSTR("photoItemType");
    else
      v14 = CFSTR("photo_item_type");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  v15 = *(void **)(a1 + 16);
  if (v15)
  {
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __46__GEOPDPictureItem__dictionaryRepresentation___block_invoke;
      v22[3] = &unk_1E1C00600;
      v19 = v18;
      v23 = v19;
      objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v22);
      v20 = v19;

      v17 = v20;
    }
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPictureItem _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_5244;
      else
        v6 = (int *)&readAll__nonRecursiveTag_5245;
      GEOPDPictureItemReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      -[GEOPDPhoto readAll:](*(_QWORD *)(a1 + 24), 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __46__GEOPDPictureItem__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDPictureItemReadAllFrom((uint64_t)self, a3, 0);
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
  if (!self->_reader)
    goto LABEL_7;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = (char)self->_flags;
  if ((flags & 0x20) != 0)
    goto LABEL_7;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if (GEOPDPhotoIsDirty((uint64_t)self->_photo))
      goto LABEL_7;
    flags = (char)self->_flags;
  }
  if ((flags & 0x18) == 0)
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
    goto LABEL_16;
  }
LABEL_7:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPictureItem readAll:]((uint64_t)self, 0);
  if (self->_photo)
    PBDataWriterWriteSubmessage();
  v6 = v9;
  if (self->_primaryText)
  {
    PBDataWriterWriteStringField();
    v6 = v9;
  }
  if (self->_secondaryText)
  {
    PBDataWriterWriteStringField();
    v6 = v9;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = v9;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
LABEL_16:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  PBUnknownFields *v15;

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
      GEOPDPictureItemReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPictureItem readAll:]((uint64_t)self, 0);
  v9 = -[GEOPDPhoto copyWithZone:](self->_photo, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[NSString copyWithZone:](self->_primaryText, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  v13 = -[NSString copyWithZone:](self->_secondaryText, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_photoItemType;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v15 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v15;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDPhoto *photo;
  NSString *primaryText;
  NSString *secondaryText;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[GEOPDPictureItem readAll:]((uint64_t)self, 1);
  -[GEOPDPictureItem readAll:]((uint64_t)v4, 1);
  photo = self->_photo;
  if ((unint64_t)photo | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDPhoto isEqual:](photo, "isEqual:"))
      goto LABEL_12;
  }
  primaryText = self->_primaryText;
  if ((unint64_t)primaryText | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](primaryText, "isEqual:"))
      goto LABEL_12;
  }
  secondaryText = self->_secondaryText;
  if ((unint64_t)secondaryText | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](secondaryText, "isEqual:"))
      goto LABEL_12;
  }
  v8 = (*((_BYTE *)v4 + 64) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) != 0 && self->_photoItemType == *((_DWORD *)v4 + 15))
    {
      v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  -[GEOPDPictureItem readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDPhoto hash](self->_photo, "hash");
  v4 = -[NSString hash](self->_primaryText, "hash");
  v5 = -[NSString hash](self->_secondaryText, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v6 = 2654435761 * self->_photoItemType;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
