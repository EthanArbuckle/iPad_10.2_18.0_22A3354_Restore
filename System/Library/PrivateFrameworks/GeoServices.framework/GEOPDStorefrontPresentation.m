@implementation GEOPDStorefrontPresentation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standOffView, 0);
  objc_storeStrong((id *)&self->_overlayImageUrl, 0);
  objc_storeStrong((id *)&self->_closeUpView, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDStorefrontPresentation)init
{
  GEOPDStorefrontPresentation *v2;
  GEOPDStorefrontPresentation *v3;
  GEOPDStorefrontPresentation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDStorefrontPresentation;
  v2 = -[GEOPDStorefrontPresentation init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
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
  if (self->_reader && (_GEOPDStorefrontPresentationIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDStorefrontPresentation readAll:](self, "readAll:", 0);
    if (self->_closeUpView)
      PBDataWriterWriteSubmessage();
    if (self->_standOffView)
      PBDataWriterWriteSubmessage();
    if (self->_overlayImageUrl)
      PBDataWriterWriteStringField();
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDStorefrontPresentation readAll:](self, "readAll:", 0);
    v8 = -[GEOPDStorefrontView copyWithZone:](self->_closeUpView, "copyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

    v10 = -[GEOPDStorefrontView copyWithZone:](self->_standOffView, "copyWithZone:", a3);
    v11 = (void *)v5[4];
    v5[4] = v10;

    v12 = -[NSString copyWithZone:](self->_overlayImageUrl, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[3];
    v5[3] = v12;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDStorefrontPresentationReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (GEOPDStorefrontView)standOffView
{
  -[GEOPDStorefrontPresentation _readStandOffView]((uint64_t)self);
  return self->_standOffView;
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
      v8 = (int *)&readAll__recursiveTag_193;
    else
      v8 = (int *)&readAll__nonRecursiveTag_194;
    GEOPDStorefrontPresentationReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOPDStorefrontView readAll:](self->_closeUpView, "readAll:", 1);
    -[GEOPDStorefrontView readAll:](self->_standOffView, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

- (NSString)overlayImageUrl
{
  -[GEOPDStorefrontPresentation _readOverlayImageUrl]((uint64_t)self);
  return self->_overlayImageUrl;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDStorefrontPresentation _dictionaryRepresentation:](self, 0);
}

- (GEOPDStorefrontView)closeUpView
{
  -[GEOPDStorefrontPresentation _readCloseUpView]((uint64_t)self);
  return self->_closeUpView;
}

- (void)_readStandOffView
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDStorefrontPresentationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStandOffView_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void)_readOverlayImageUrl
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDStorefrontPresentationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOverlayImageUrl_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void)_readCloseUpView
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDStorefrontPresentationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCloseUpView_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)_dictionaryRepresentation:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "closeUpView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "jsonRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("closeUpView");
      }
      else
      {
        objc_msgSend(v5, "dictionaryRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("close_up_view");
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

    }
    objc_msgSend(a1, "standOffView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v9, "jsonRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("standOffView");
      }
      else
      {
        objc_msgSend(v9, "dictionaryRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("stand_off_view");
      }
      objc_msgSend(v4, "setObject:forKey:", v11, v12);

    }
    objc_msgSend(a1, "overlayImageUrl");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (a2)
        v14 = CFSTR("overlayImageUrl");
      else
        v14 = CFSTR("overlay_image_url");
      objc_msgSend(v4, "setObject:forKey:", v13, v14);
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (GEOPDStorefrontPresentation)initWithData:(id)a3
{
  GEOPDStorefrontPresentation *v3;
  GEOPDStorefrontPresentation *v4;
  GEOPDStorefrontPresentation *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDStorefrontPresentation;
  v3 = -[GEOPDStorefrontPresentation initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (BOOL)hasCloseUpView
{
  -[GEOPDStorefrontPresentation _readCloseUpView]((uint64_t)self);
  return self->_closeUpView != 0;
}

- (void)setCloseUpView:(id)a3
{
  *(_BYTE *)&self->_flags |= 9u;
  objc_storeStrong((id *)&self->_closeUpView, a3);
}

- (BOOL)hasStandOffView
{
  -[GEOPDStorefrontPresentation _readStandOffView]((uint64_t)self);
  return self->_standOffView != 0;
}

- (void)setStandOffView:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_standOffView, a3);
}

- (BOOL)hasOverlayImageUrl
{
  -[GEOPDStorefrontPresentation _readOverlayImageUrl]((uint64_t)self);
  return self->_overlayImageUrl != 0;
}

- (void)setOverlayImageUrl:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_overlayImageUrl, a3);
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
  v8.super_class = (Class)GEOPDStorefrontPresentation;
  -[GEOPDStorefrontPresentation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDStorefrontPresentation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)jsonRepresentation
{
  return -[GEOPDStorefrontPresentation _dictionaryRepresentation:](self, 1);
}

- (GEOPDStorefrontPresentation)initWithDictionary:(id)a3
{
  return (GEOPDStorefrontPresentation *)-[GEOPDStorefrontPresentation _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOPDStorefrontView *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEOPDStorefrontView *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("closeUpView");
      else
        v6 = CFSTR("close_up_view");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOPDStorefrontView alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOPDStorefrontView initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOPDStorefrontView initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setCloseUpView:", v9);

      }
      if (a3)
        v11 = CFSTR("standOffView");
      else
        v11 = CFSTR("stand_off_view");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEOPDStorefrontView alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEOPDStorefrontView initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEOPDStorefrontView initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setStandOffView:", v14);

      }
      if (a3)
        v16 = CFSTR("overlayImageUrl");
      else
        v16 = CFSTR("overlay_image_url");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = (void *)objc_msgSend(v17, "copy");
        objc_msgSend(a1, "setOverlayImageUrl:", v18);

      }
    }
  }

  return a1;
}

- (GEOPDStorefrontPresentation)initWithJSON:(id)a3
{
  return (GEOPDStorefrontPresentation *)-[GEOPDStorefrontPresentation _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDStorefrontPresentationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDStorefrontPresentationReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOPDStorefrontPresentation readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_closeUpView)
    objc_msgSend(v5, "setCloseUpView:");
  if (self->_standOffView)
    objc_msgSend(v5, "setStandOffView:");
  v4 = v5;
  if (self->_overlayImageUrl)
  {
    objc_msgSend(v5, "setOverlayImageUrl:");
    v4 = v5;
  }

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOPDStorefrontView *closeUpView;
  GEOPDStorefrontView *standOffView;
  NSString *overlayImageUrl;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDStorefrontPresentation readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         closeUpView = self->_closeUpView,
         !((unint64_t)closeUpView | v4[2]))
     || -[GEOPDStorefrontView isEqual:](closeUpView, "isEqual:"))
    && ((standOffView = self->_standOffView, !((unint64_t)standOffView | v4[4]))
     || -[GEOPDStorefrontView isEqual:](standOffView, "isEqual:")))
  {
    overlayImageUrl = self->_overlayImageUrl;
    if ((unint64_t)overlayImageUrl | v4[3])
      v8 = -[NSString isEqual:](overlayImageUrl, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  -[GEOPDStorefrontPresentation readAll:](self, "readAll:", 1);
  v3 = -[GEOPDStorefrontView hash](self->_closeUpView, "hash");
  v4 = -[GEOPDStorefrontView hash](self->_standOffView, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_overlayImageUrl, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEOPDStorefrontView *closeUpView;
  uint64_t v5;
  GEOPDStorefrontView *standOffView;
  uint64_t v7;
  _QWORD *v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  closeUpView = self->_closeUpView;
  v5 = v8[2];
  if (closeUpView)
  {
    if (v5)
      -[GEOPDStorefrontView mergeFrom:](closeUpView, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOPDStorefrontPresentation setCloseUpView:](self, "setCloseUpView:");
  }
  standOffView = self->_standOffView;
  v7 = v8[4];
  if (standOffView)
  {
    if (v7)
      -[GEOPDStorefrontView mergeFrom:](standOffView, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOPDStorefrontPresentation setStandOffView:](self, "setStandOffView:");
  }
  if (v8[3])
    -[GEOPDStorefrontPresentation setOverlayImageUrl:](self, "setOverlayImageUrl:");

}

@end
