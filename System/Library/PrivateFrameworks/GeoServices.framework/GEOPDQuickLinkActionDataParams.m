@implementation GEOPDQuickLinkActionDataParams

- (GEOPDQuickLinkActionDataParams)init
{
  GEOPDQuickLinkActionDataParams *v2;
  GEOPDQuickLinkActionDataParams *v3;
  GEOPDQuickLinkActionDataParams *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDQuickLinkActionDataParams;
  v2 = -[GEOPDQuickLinkActionDataParams init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDQuickLinkActionDataParams)initWithData:(id)a3
{
  GEOPDQuickLinkActionDataParams *v3;
  GEOPDQuickLinkActionDataParams *v4;
  GEOPDQuickLinkActionDataParams *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDQuickLinkActionDataParams;
  v3 = -[GEOPDQuickLinkActionDataParams initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readUrl
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDQuickLinkActionDataParamsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUrl_tags_5999);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)url
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDQuickLinkActionDataParams _readUrl]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)_readAppAdamId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDQuickLinkActionDataParamsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAppAdamId_tags_6000);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)appAdamId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDQuickLinkActionDataParams _readAppAdamId]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
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
  v8.super_class = (Class)GEOPDQuickLinkActionDataParams;
  -[GEOPDQuickLinkActionDataParams description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDQuickLinkActionDataParams dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDQuickLinkActionDataParams _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  id v13;
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
  -[GEOPDQuickLinkActionDataParams readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 68) & 8) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDQuickLinkActionDataParamsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTitle_tags_5998);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v7 = *(id *)(a1 + 40);
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("title"));

  -[GEOPDQuickLinkActionDataParams url]((id *)a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("url"));

  -[GEOPDQuickLinkActionDataParams appAdamId]((id *)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a2)
      v10 = CFSTR("appAdamId");
    else
      v10 = CFSTR("app_adam_id");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 68) & 4) == 0)
  {
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = v11;
      objc_sync_enter(v12);
      GEOPDQuickLinkActionDataParamsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSymbolImageName_tags_6001);
      objc_sync_exit(v12);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v13 = *(id *)(a1 + 32);
  if (v13)
  {
    if (a2)
      v14 = CFSTR("symbolImageName");
    else
      v14 = CFSTR("symbol_image_name");
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
      v22[2] = __60__GEOPDQuickLinkActionDataParams__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDQuickLinkActionDataParams _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_6002;
      else
        v6 = (int *)&readAll__nonRecursiveTag_6003;
      GEOPDQuickLinkActionDataParamsReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __60__GEOPDQuickLinkActionDataParams__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDQuickLinkActionDataParamsReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x3E) == 0))
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
    -[GEOPDQuickLinkActionDataParams readAll:]((uint64_t)self, 0);
    if (self->_title)
      PBDataWriterWriteStringField();
    v5 = v8;
    if (self->_url)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_appAdamId)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_symbolImageName)
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
  uint64_t v10;
  void *v11;
  uint64_t v12;
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
    -[GEOPDQuickLinkActionDataParams readAll:]((uint64_t)self, 0);
    v8 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v8;

    v10 = -[NSString copyWithZone:](self->_url, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v10;

    v12 = -[NSString copyWithZone:](self->_appAdamId, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v12;

    v14 = -[NSString copyWithZone:](self->_symbolImageName, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDQuickLinkActionDataParamsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *title;
  NSString *url;
  NSString *appAdamId;
  NSString *symbolImageName;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDQuickLinkActionDataParams readAll:]((uint64_t)self, 1),
         -[GEOPDQuickLinkActionDataParams readAll:]((uint64_t)v4, 1),
         title = self->_title,
         !((unint64_t)title | v4[5]))
     || -[NSString isEqual:](title, "isEqual:"))
    && ((url = self->_url, !((unint64_t)url | v4[6])) || -[NSString isEqual:](url, "isEqual:"))
    && ((appAdamId = self->_appAdamId, !((unint64_t)appAdamId | v4[3]))
     || -[NSString isEqual:](appAdamId, "isEqual:")))
  {
    symbolImageName = self->_symbolImageName;
    if ((unint64_t)symbolImageName | v4[4])
      v9 = -[NSString isEqual:](symbolImageName, "isEqual:");
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
  NSUInteger v4;
  NSUInteger v5;

  -[GEOPDQuickLinkActionDataParams readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[NSString hash](self->_url, "hash");
  v5 = v4 ^ -[NSString hash](self->_appAdamId, "hash") ^ v3;
  return v5 ^ -[NSString hash](self->_symbolImageName, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_symbolImageName, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
