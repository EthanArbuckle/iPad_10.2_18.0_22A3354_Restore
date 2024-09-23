@implementation GEOPDTemplateData

- (id)mapsId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTemplateData _readMapsId]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)_readMapsId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTemplateDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsId_tags_6595);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)timezone
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTemplateData _readTimezone]((uint64_t)a1);
    a1 = (id *)v1[8];
  }
  return a1;
}

- (void)setMapsId:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 96) |= 8u;
    *(_WORD *)(a1 + 96) |= 0x200u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }

}

- (GEOPDTemplateData)init
{
  GEOPDTemplateData *v2;
  GEOPDTemplateData *v3;
  GEOPDTemplateData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDTemplateData;
  v2 = -[GEOPDTemplateData init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)_readTimezone
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTemplateDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimezone_tags_6598);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_poiIcon, 0);
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)placeName
{
  void *v2;
  void *v3;

  -[GEOPDTemplateData titles]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOLocalizedString bestStringForCurrentLocale:fallbackToFirstAvailable:](GEOLocalizedString, "bestStringForCurrentLocale:fallbackToFirstAvailable:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (GEOPDTemplateData)initWithData:(id)a3
{
  GEOPDTemplateData *v3;
  GEOPDTemplateData *v4;
  GEOPDTemplateData *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDTemplateData;
  v3 = -[GEOPDTemplateData initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTitles
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTemplateDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTitles_tags_6596);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)titles
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTemplateData _readTitles]((uint64_t)a1);
    a1 = (id *)v1[9];
  }
  return a1;
}

- (void)addTitle:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDTemplateData _readTitles](a1);
    -[GEOPDTemplateData _addNoFlagsTitle:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_WORD *)(a1 + 96) |= 0x200u;
  }
}

- (void)_addNoFlagsTitle:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 72);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v5;

      v4 = *(void **)(a1 + 72);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readSubtitle
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTemplateDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSubtitle_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)subtitle
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTemplateData _readSubtitle]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)_readPoiIcon
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTemplateDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPoiIcon_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)poiIcon
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTemplateData _readPoiIcon]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)_readPhoto
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTemplateDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhoto_tags_6597);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)photo
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTemplateData _readPhoto]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)_readFooter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTemplateDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFooter_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)footer
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTemplateData _readFooter]((uint64_t)a1);
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
  v8.super_class = (Class)GEOPDTemplateData;
  -[GEOPDTemplateData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTemplateData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTemplateData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  _QWORD v42[4];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDTemplateData readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTemplateData mapsId]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("mapsId");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("maps_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  if ((*(_WORD *)(a1 + 96) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 92));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("areaHighlight");
    else
      v10 = CFSTR("area_highlight");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v12 = *(id *)(a1 + 72);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v45 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v17, "jsonRepresentation");
          else
            objc_msgSend(v17, "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v14);
    }

    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("title"));
  }
  -[GEOPDTemplateData subtitle]((id *)a1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v19, "jsonRepresentation");
    else
      objc_msgSend(v19, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("subtitle"));

  }
  -[GEOPDTemplateData poiIcon]((id *)a1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v22, "jsonRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("poiIcon");
    }
    else
    {
      objc_msgSend(v22, "dictionaryRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("poi_icon");
    }
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

  }
  -[GEOPDTemplateData photo]((id *)a1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v26, "jsonRepresentation");
    else
      objc_msgSend(v26, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("photo"));

  }
  -[GEOPDTemplateData footer]((id *)a1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v29, "jsonRepresentation");
    else
      objc_msgSend(v29, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("footer"));

  }
  -[GEOPDTemplateData timezone]((id *)a1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v32, "jsonRepresentation");
    else
      objc_msgSend(v32, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("timezone"));

  }
  v35 = *(void **)(a1 + 16);
  if (v35)
  {
    objc_msgSend(v35, "dictionaryRepresentation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v36, "count"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __47__GEOPDTemplateData__dictionaryRepresentation___block_invoke;
      v42[3] = &unk_1E1C00600;
      v39 = v38;
      v43 = v39;
      objc_msgSend(v37, "enumerateKeysAndObjectsUsingBlock:", v42);
      v40 = v39;

      v37 = v40;
    }
    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDTemplateData _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_6612;
      else
        v6 = (int *)&readAll__nonRecursiveTag_6613;
      GEOPDTemplateDataReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDTemplateDataCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

void __47__GEOPDTemplateData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDTemplateDataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  PBDataReader *v14;
  void *v15;
  NSMutableArray *obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader)
    goto LABEL_3;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = (__int16)self->_flags;
  if ((flags & 0x308) != 0)
    goto LABEL_3;
  if ((flags & 0x40) != 0)
  {
    if ((GEOPDDataItemIsDirty((os_unfair_lock_s *)self->_subtitle) & 1) != 0)
      goto LABEL_3;
    flags = (__int16)self->_flags;
  }
  if ((flags & 0x20) != 0)
    goto LABEL_3;
  if ((flags & 0x10) != 0)
  {
    if (GEOPDPhotoIsDirty((uint64_t)self->_photo))
      goto LABEL_3;
    flags = (__int16)self->_flags;
  }
  if ((flags & 4) == 0)
    goto LABEL_36;
  if ((GEOPDDataItemIsDirty((os_unfair_lock_s *)self->_footer) & 1) != 0)
  {
LABEL_3:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDTemplateData readAll:]((uint64_t)self, 0);
    if (self->_mapsId)
      PBDataWriterWriteSubmessage();
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteBOOLField();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = self->_titles;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteSubmessage();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v8);
    }

    if (self->_subtitle)
      PBDataWriterWriteSubmessage();
    if (self->_poiIcon)
      PBDataWriterWriteSubmessage();
    if (self->_photo)
      PBDataWriterWriteSubmessage();
    if (self->_footer)
      PBDataWriterWriteSubmessage();
    if (self->_timezone)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
    goto LABEL_25;
  }
  flags = (__int16)self->_flags;
LABEL_36:
  if ((flags & 0x80) != 0)
    goto LABEL_3;
  if ((flags & 0x100) != 0)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = self->_titles;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v22;
      while (2)
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(obj);
          if (GEOLocalizedStringIsDirty(*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j)))
          {

            goto LABEL_3;
          }
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v11)
          continue;
        break;
      }
    }

  }
  v14 = self->_reader;
  objc_sync_enter(v14);
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeData:", v15);
  os_unfair_lock_unlock(p_readerLock);

  objc_sync_exit(v14);
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
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  PBUnknownFields *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDTemplateDataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTemplateData readAll:]((uint64_t)self, 0);
  v9 = -[GEOPDMapsIdentifier copyWithZone:](self->_mapsId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 92) = self->_areaHighlight;
    *(_WORD *)(v5 + 96) |= 1u;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = self->_titles;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v28);
        -[GEOPDTemplateData addTitle:](v5, v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v12);
  }

  v16 = -[GEOPDDataItem copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v16;

  v18 = -[GEOStyleAttributes copyWithZone:](self->_poiIcon, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v18;

  v20 = -[GEOPDPhoto copyWithZone:](self->_photo, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v20;

  v22 = -[GEOPDDataItem copyWithZone:](self->_footer, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v22;

  v24 = -[GEOTimezone copyWithZone:](self->_timezone, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v24;

  v26 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v26;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDMapsIdentifier *mapsId;
  __int16 v6;
  NSMutableArray *titles;
  GEOPDDataItem *subtitle;
  GEOStyleAttributes *poiIcon;
  GEOPDPhoto *photo;
  GEOPDDataItem *footer;
  GEOTimezone *timezone;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[GEOPDTemplateData readAll:]((uint64_t)self, 1);
  -[GEOPDTemplateData readAll:]((uint64_t)v4, 1);
  mapsId = self->_mapsId;
  if ((unint64_t)mapsId | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:"))
      goto LABEL_24;
  }
  v6 = *((_WORD *)v4 + 48);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v6 & 1) != 0)
    {
      if (self->_areaHighlight)
      {
        if (!*((_BYTE *)v4 + 92))
          goto LABEL_24;
        goto LABEL_12;
      }
      if (!*((_BYTE *)v4 + 92))
        goto LABEL_12;
    }
LABEL_24:
    v13 = 0;
    goto LABEL_25;
  }
  if ((v6 & 1) != 0)
    goto LABEL_24;
LABEL_12:
  titles = self->_titles;
  if ((unint64_t)titles | *((_QWORD *)v4 + 9) && !-[NSMutableArray isEqual:](titles, "isEqual:"))
    goto LABEL_24;
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOPDDataItem isEqual:](subtitle, "isEqual:"))
      goto LABEL_24;
  }
  poiIcon = self->_poiIcon;
  if ((unint64_t)poiIcon | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOStyleAttributes isEqual:](poiIcon, "isEqual:"))
      goto LABEL_24;
  }
  photo = self->_photo;
  if ((unint64_t)photo | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDPhoto isEqual:](photo, "isEqual:"))
      goto LABEL_24;
  }
  footer = self->_footer;
  if ((unint64_t)footer | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDDataItem isEqual:](footer, "isEqual:"))
      goto LABEL_24;
  }
  timezone = self->_timezone;
  if ((unint64_t)timezone | *((_QWORD *)v4 + 8))
    v13 = -[GEOTimezone isEqual:](timezone, "isEqual:");
  else
    v13 = 1;
LABEL_25:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  -[GEOPDTemplateData readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDMapsIdentifier hash](self->_mapsId, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_areaHighlight;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NSMutableArray hash](self->_titles, "hash");
  v7 = v5 ^ v6 ^ -[GEOPDDataItem hash](self->_subtitle, "hash");
  v8 = -[GEOStyleAttributes hash](self->_poiIcon, "hash");
  v9 = v8 ^ -[GEOPDPhoto hash](self->_photo, "hash");
  v10 = v7 ^ v9 ^ -[GEOPDDataItem hash](self->_footer, "hash");
  return v10 ^ -[GEOTimezone hash](self->_timezone, "hash");
}

@end
