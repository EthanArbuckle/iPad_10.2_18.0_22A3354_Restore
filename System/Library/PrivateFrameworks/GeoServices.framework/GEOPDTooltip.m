@implementation GEOPDTooltip

+ (id)tooltipFromPlaceData:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__36;
  v11 = __Block_byref_object_dispose__36;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__GEOPDTooltip_PlaceDataExtras__tooltipFromPlaceData___block_invoke;
  v6[3] = &unk_1E1C09718;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateValidComponentValuesOfType:usingBlock:", 99, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __54__GEOPDTooltip_PlaceDataExtras__tooltipFromPlaceData___block_invoke(uint64_t a1, id *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue toolTip](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = 1;
}

- (GEOPDTooltip)init
{
  GEOPDTooltip *v2;
  GEOPDTooltip *v3;
  GEOPDTooltip *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDTooltip;
  v2 = -[GEOPDTooltip init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDTooltip)initWithData:(id)a3
{
  GEOPDTooltip *v3;
  GEOPDTooltip *v4;
  GEOPDTooltip *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDTooltip;
  v3 = -[GEOPDTooltip initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTitle
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTooltipReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTitle_tags_6780);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)title
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTooltip _readTitle]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)_readSubtitle
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTooltipReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSubtitle_tags_6781);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)subtitle
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTooltip _readSubtitle]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)_readActionLink
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTooltipReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readActionLink_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)actionLink
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTooltip _readActionLink]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)_readPhoto
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTooltipReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhoto_tags_6782);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)photo
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTooltip _readPhoto]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (uint64_t)toolTipType
{
  uint64_t v1;
  char v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_BYTE *)(v1 + 72);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 64));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 68);
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
  v8.super_class = (Class)GEOPDTooltip;
  -[GEOPDTooltip description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTooltip dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTooltip _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  __CFString *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v28[4];
  id v29;

  if (!a1)
    return 0;
  -[GEOPDTooltip readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTooltip title]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("title"));

  }
  -[GEOPDTooltip subtitle]((id *)a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("subtitle"));

  }
  -[GEOPDTooltip actionLink]((id *)a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("actionLink");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("action_link");
    }
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  -[GEOPDTooltip photo]((id *)a1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v15, "jsonRepresentation");
    else
      objc_msgSend(v15, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("photo"));

  }
  if ((*(_BYTE *)(a1 + 72) & 1) != 0)
  {
    v18 = *(_DWORD *)(a1 + 68);
    if (v18)
    {
      if (v18 == 1)
      {
        v19 = CFSTR("HIKE_SUGGESTION");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 68));
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v19 = CFSTR("DEFAULT");
    }
    if (a2)
      v20 = CFSTR("toolTipType");
    else
      v20 = CFSTR("tool_tip_type");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  v21 = *(void **)(a1 + 16);
  if (v21)
  {
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __42__GEOPDTooltip__dictionaryRepresentation___block_invoke;
      v28[3] = &unk_1E1C00600;
      v25 = v24;
      v29 = v25;
      objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v28);
      v26 = v25;

      v23 = v26;
    }
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDTooltip _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_6787;
      else
        v6 = (int *)&readAll__nonRecursiveTag_6788;
      GEOPDTooltipReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDTooltipCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __42__GEOPDTooltip__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDTooltipReadAllFrom((uint64_t)self, a3, 0);
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
    goto LABEL_14;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = (char)self->_flags;
  if ((flags & 0x40) != 0)
    goto LABEL_14;
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if (GEOLocalizedStringIsDirty((uint64_t)self->_title))
      goto LABEL_14;
    flags = (char)self->_flags;
  }
  if ((flags & 0x10) != 0)
  {
    if (GEOLocalizedStringIsDirty((uint64_t)self->_subtitle))
      goto LABEL_14;
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    if (GEOLocalizedStringIsDirty((uint64_t)self->_actionLink))
      goto LABEL_14;
    flags = (char)self->_flags;
  }
  if ((flags & 8) == 0 || !GEOPDPhotoIsDirty((uint64_t)self->_photo))
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
    goto LABEL_25;
  }
LABEL_14:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTooltip readAll:]((uint64_t)self, 0);
  if (self->_title)
    PBDataWriterWriteSubmessage();
  v6 = v9;
  if (self->_subtitle)
  {
    PBDataWriterWriteSubmessage();
    v6 = v9;
  }
  if (self->_actionLink)
  {
    PBDataWriterWriteSubmessage();
    v6 = v9;
  }
  if (self->_photo)
  {
    PBDataWriterWriteSubmessage();
    v6 = v9;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = v9;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
LABEL_25:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  PBUnknownFields *v17;

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
      GEOPDTooltipReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTooltip readAll:]((uint64_t)self, 0);
  v9 = -[GEOLocalizedString copyWithZone:](self->_title, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  v11 = -[GEOLocalizedString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  v13 = -[GEOLocalizedString copyWithZone:](self->_actionLink, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  v15 = -[GEOPDPhoto copyWithZone:](self->_photo, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v15;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_toolTipType;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v17 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v17;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLocalizedString *title;
  GEOLocalizedString *subtitle;
  GEOLocalizedString *actionLink;
  GEOPDPhoto *photo;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEOPDTooltip readAll:]((uint64_t)self, 1);
  -[GEOPDTooltip readAll:]((uint64_t)v4, 1);
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOLocalizedString isEqual:](title, "isEqual:"))
      goto LABEL_14;
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOLocalizedString isEqual:](subtitle, "isEqual:"))
      goto LABEL_14;
  }
  actionLink = self->_actionLink;
  if ((unint64_t)actionLink | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOLocalizedString isEqual:](actionLink, "isEqual:"))
      goto LABEL_14;
  }
  photo = self->_photo;
  if ((unint64_t)photo | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDPhoto isEqual:](photo, "isEqual:"))
      goto LABEL_14;
  }
  v9 = (*((_BYTE *)v4 + 72) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) != 0 && self->_toolTipType == *((_DWORD *)v4 + 17))
    {
      v9 = 1;
      goto LABEL_15;
    }
LABEL_14:
    v9 = 0;
  }
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  -[GEOPDTooltip readAll:]((uint64_t)self, 1);
  v3 = -[GEOLocalizedString hash](self->_title, "hash");
  v4 = -[GEOLocalizedString hash](self->_subtitle, "hash");
  v5 = -[GEOLocalizedString hash](self->_actionLink, "hash");
  v6 = -[GEOPDPhoto hash](self->_photo, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v7 = 2654435761 * self->_toolTipType;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_actionLink, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
