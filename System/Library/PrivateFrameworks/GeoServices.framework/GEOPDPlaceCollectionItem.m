@implementation GEOPDPlaceCollectionItem

- (id)itemDescription
{
  void *v2;
  void *v3;

  -[GEOPDPlaceCollectionItem itemDescriptions]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOLocalizedString bestStringForCurrentLocale:fallbackToFirstAvailable:](GEOLocalizedString, "bestStringForCurrentLocale:fallbackToFirstAvailable:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)itemHTMLDescription
{
  void *v2;
  void *v3;

  -[GEOPDPlaceCollectionItem itemDescriptionHtmls]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOLocalizedString bestStringForCurrentLocale:fallbackToFirstAvailable:](GEOLocalizedString, "bestStringForCurrentLocale:fallbackToFirstAvailable:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)punchOutText
{
  void *v2;
  void *v3;

  -[GEOPDPlaceCollectionItem punchOutTexts]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOLocalizedString bestStringForCurrentLocale:fallbackToFirstAvailable:](GEOLocalizedString, "bestStringForCurrentLocale:fallbackToFirstAvailable:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 104) |= 4u;
    *(_WORD *)(a1 + 104) |= 0x800u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    -[GEOPDPlaceCollectionItem readAll:](a1, 0);
    objc_msgSend(*(id *)(a1 + 56), "clearUnknownFields:", 1);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v3 = *(id *)(a1 + 64);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v45;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v45 != v6)
            objc_enumerationMutation(v3);
          -[GEOPDCaptionedPhoto clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      }
      while (v5);
    }

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v8 = *(id *)(a1 + 48);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v41;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v41 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v12++), "clearUnknownFields:", 1);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
      }
      while (v10);
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v13 = *(id *)(a1 + 72);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v37;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v37 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v17++), "clearUnknownFields:", 1);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
      }
      while (v15);
    }

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v18 = *(id *)(a1 + 32);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v49, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v33;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v33 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v22++), "clearUnknownFields:", 1);
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v49, 16);
      }
      while (v20);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v23 = *(id *)(a1 + 40);
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v48, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v29;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v29 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v27++), "clearUnknownFields:", 1, (_QWORD)v28);
        }
        while (v25 != v27);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v48, 16);
      }
      while (v25);
    }

    -[GEOPDQuickLinkItem clearUnknownFields:](*(_QWORD *)(a1 + 24));
  }
}

- (GEOPDPlaceCollectionItem)init
{
  GEOPDPlaceCollectionItem *v2;
  GEOPDPlaceCollectionItem *v3;
  GEOPDPlaceCollectionItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceCollectionItem;
  v2 = -[GEOPDPlaceCollectionItem init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPlaceCollectionItem)initWithData:(id)a3
{
  GEOPDPlaceCollectionItem *v3;
  GEOPDPlaceCollectionItem *v4;
  GEOPDPlaceCollectionItem *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceCollectionItem;
  v3 = -[GEOPDPlaceCollectionItem initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readItemId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionItemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readItemId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)itemId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceCollectionItem _readItemId]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)_readPhotos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionItemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhotos_tags_5622);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)photos
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceCollectionItem _readPhotos]((uint64_t)a1);
    a1 = (id *)v1[8];
  }
  return a1;
}

- (void)addPhoto:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDPlaceCollectionItem _readPhotos](a1);
    -[GEOPDPlaceCollectionItem _addNoFlagsPhoto:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 104) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    *(_WORD *)(a1 + 104) |= 0x800u;
  }
}

- (void)_addNoFlagsPhoto:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readItemDescriptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionItemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readItemDescriptions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)itemDescriptions
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceCollectionItem _readItemDescriptions]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)addItemDescription:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDPlaceCollectionItem _readItemDescriptions](a1);
    -[GEOPDPlaceCollectionItem _addNoFlagsItemDescription:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 104) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    *(_WORD *)(a1 + 104) |= 0x800u;
  }
}

- (void)_addNoFlagsItemDescription:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readUrl
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionItemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUrl_tags_5623);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)url
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceCollectionItem _readUrl]((uint64_t)a1);
    a1 = (id *)v1[10];
  }
  return a1;
}

- (void)_readPunchOutTexts
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionItemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPunchOutTexts_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)punchOutTexts
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceCollectionItem _readPunchOutTexts]((uint64_t)a1);
    a1 = (id *)v1[9];
  }
  return a1;
}

- (void)addPunchOutText:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDPlaceCollectionItem _readPunchOutTexts](a1);
    -[GEOPDPlaceCollectionItem _addNoFlagsPunchOutText:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 104) |= 0x200u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    *(_WORD *)(a1 + 104) |= 0x800u;
  }
}

- (void)_addNoFlagsPunchOutText:(uint64_t)a1
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

- (void)addItemDescriptionBytes:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x10) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDPlaceCollectionItemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readItemDescriptionBytes_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    -[GEOPDPlaceCollectionItem _addNoFlagsItemDescriptionBytes:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 104) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    *(_WORD *)(a1 + 104) |= 0x800u;
  }
}

- (void)_addNoFlagsItemDescriptionBytes:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readItemDescriptionHtmls
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionItemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readItemDescriptionHtmls_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)itemDescriptionHtmls
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceCollectionItem _readItemDescriptionHtmls]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)addItemDescriptionHtml:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDPlaceCollectionItem _readItemDescriptionHtmls](a1);
    -[GEOPDPlaceCollectionItem _addNoFlagsItemDescriptionHtml:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 104) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    *(_WORD *)(a1 + 104) |= 0x800u;
  }
}

- (void)_addNoFlagsItemDescriptionHtml:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readAppClip
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceCollectionItemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAppClip_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)appClip
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceCollectionItem _readAppClip]((uint64_t)a1);
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
  v8.super_class = (Class)GEOPDPlaceCollectionItem;
  -[GEOPDPlaceCollectionItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceCollectionItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceCollectionItem _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  void *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t n;
  void *v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  void *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  _QWORD v69[4];
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDPlaceCollectionItem readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceCollectionItem itemId]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("itemId");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("item_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v10 = *(id *)(a1 + 64);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v88;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v88 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v15, "jsonRepresentation");
          else
            objc_msgSend(v15, "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
      }
      while (v12);
    }

    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("photo"));
  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v18 = *(id *)(a1 + 48);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v84;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v84 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v23, "jsonRepresentation");
          else
            objc_msgSend(v23, "dictionaryRepresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v24);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
      }
      while (v20);
    }

    if (a2)
      v25 = CFSTR("itemDescription");
    else
      v25 = CFSTR("item_description");
    objc_msgSend(v4, "setObject:forKey:", v17, v25);

  }
  -[GEOPDPlaceCollectionItem url]((id *)a1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("url"));

  if ((*(_WORD *)(a1 + 104) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 101));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v28 = CFSTR("enableImageFallback");
    else
      v28 = CFSTR("enable_image_fallback");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

  }
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v30 = *(id *)(a1 + 72);
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v80;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v80 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v35, "jsonRepresentation");
          else
            objc_msgSend(v35, "dictionaryRepresentation");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v36);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
      }
      while (v32);
    }

    if (a2)
      v37 = CFSTR("punchOutText");
    else
      v37 = CFSTR("punch_out_text");
    objc_msgSend(v4, "setObject:forKey:", v29, v37);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v39 = *(id *)(a1 + 32);
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v75, v92, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v76;
      do
      {
        for (m = 0; m != v41; ++m)
        {
          if (*(_QWORD *)v76 != v42)
            objc_enumerationMutation(v39);
          v44 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v44, "jsonRepresentation");
          else
            objc_msgSend(v44, "dictionaryRepresentation");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v45);

        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v75, v92, 16);
      }
      while (v41);
    }

    if (a2)
      v46 = CFSTR("itemDescriptionBytes");
    else
      v46 = CFSTR("item_description_bytes");
    objc_msgSend(v4, "setObject:forKey:", v38, v46);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v48 = *(id *)(a1 + 40);
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v71, v91, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v72;
      do
      {
        for (n = 0; n != v50; ++n)
        {
          if (*(_QWORD *)v72 != v51)
            objc_enumerationMutation(v48);
          v53 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * n);
          if ((a2 & 1) != 0)
            objc_msgSend(v53, "jsonRepresentation");
          else
            objc_msgSend(v53, "dictionaryRepresentation");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "addObject:", v54);

        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v71, v91, 16);
      }
      while (v50);
    }

    if (a2)
      v55 = CFSTR("itemDescriptionHtml");
    else
      v55 = CFSTR("item_description_html");
    objc_msgSend(v4, "setObject:forKey:", v47, v55);

  }
  -[GEOPDPlaceCollectionItem appClip]((id *)a1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v56;
  if (v56)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v56, "jsonRepresentation");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = CFSTR("appClip");
    }
    else
    {
      objc_msgSend(v56, "dictionaryRepresentation");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = CFSTR("app_clip");
    }
    objc_msgSend(v4, "setObject:forKey:", v58, v59);

  }
  if ((*(_WORD *)(a1 + 104) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 100));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v61 = CFSTR("disableAppClipFallback");
    else
      v61 = CFSTR("disable_app_clip_fallback");
    objc_msgSend(v4, "setObject:forKey:", v60, v61);

  }
  v62 = *(void **)(a1 + 16);
  if (v62)
  {
    objc_msgSend(v62, "dictionaryRepresentation");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v63;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v63, "count"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v69[0] = MEMORY[0x1E0C809B0];
      v69[1] = 3221225472;
      v69[2] = __54__GEOPDPlaceCollectionItem__dictionaryRepresentation___block_invoke;
      v69[3] = &unk_1E1C00600;
      v66 = v65;
      v70 = v66;
      objc_msgSend(v64, "enumerateKeysAndObjectsUsingBlock:", v69);
      v67 = v66;

      v64 = v67;
    }
    objc_msgSend(v4, "setObject:forKey:", v64, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceCollectionItem _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_5653;
      else
        v6 = (int *)&readAll__nonRecursiveTag_5654;
      GEOPDPlaceCollectionItemReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDPlaceCollectionItemCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

void __54__GEOPDPlaceCollectionItem__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  GEOPDMapsIdentifier *v9;
  GEOPDMapsIdentifier *v10;
  GEOPDMapsIdentifier *v11;
  GEOPDMapsIdentifier *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  GEOPDCaptionedPhoto *v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  GEOLocalizedString *v31;
  GEOLocalizedString *v32;
  GEOLocalizedString *v33;
  void *v34;
  void *v35;
  id v36;
  const __CFString *v37;
  void *v38;
  char v39;
  const __CFString *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  uint64_t v47;
  GEOLocalizedString *v48;
  GEOLocalizedString *v49;
  GEOLocalizedString *v50;
  const __CFString *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  uint64_t v58;
  GEOLocalizedBytes *v59;
  GEOLocalizedBytes *v60;
  GEOLocalizedBytes *v61;
  const __CFString *v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t m;
  uint64_t v69;
  GEOLocalizedString *v70;
  GEOLocalizedString *v71;
  GEOLocalizedString *v72;
  const __CFString *v73;
  void *v74;
  GEOPDQuickLinkItem *v75;
  void *v76;
  id v77;
  const __CFString *v78;
  void *v79;
  char v80;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("itemId");
    else
      v7 = CFSTR("item_id");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = [GEOPDMapsIdentifier alloc];
      if ((a3 & 1) != 0)
        v10 = -[GEOPDMapsIdentifier initWithJSON:](v9, "initWithJSON:", v8);
      else
        v10 = -[GEOPDMapsIdentifier initWithDictionary:](v9, "initWithDictionary:", v8);
      v11 = v10;
      v12 = v10;
      *(_WORD *)(v6 + 104) |= 0x80u;
      *(_WORD *)(v6 + 104) |= 0x800u;
      objc_storeStrong((id *)(v6 + 56), v11);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("photo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v82 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v99, v107, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v100;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v100 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v18);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v20 = [GEOPDCaptionedPhoto alloc];
              if (v20)
                v21 = (void *)-[GEOPDCaptionedPhoto _initWithDictionary:isJSON:](v20, v19, a3);
              else
                v21 = 0;
              -[GEOPDPlaceCollectionItem addPhoto:](v6, v21);

            }
            ++v18;
          }
          while (v16 != v18);
          v22 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v99, v107, 16);
          v16 = v22;
        }
        while (v22);
      }

      v5 = v82;
    }

    if (a3)
      v23 = CFSTR("itemDescription");
    else
      v23 = CFSTR("item_description");
    objc_msgSend(v5, "objectForKeyedSubscript:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      v25 = v24;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v95, v106, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v96;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v96 != v28)
              objc_enumerationMutation(v25);
            v30 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v31 = [GEOLocalizedString alloc];
              if ((a3 & 1) != 0)
                v32 = -[GEOLocalizedString initWithJSON:](v31, "initWithJSON:", v30);
              else
                v32 = -[GEOLocalizedString initWithDictionary:](v31, "initWithDictionary:", v30);
              v33 = v32;
              -[GEOPDPlaceCollectionItem addItemDescription:](v6, v32);

            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v95, v106, 16);
        }
        while (v27);
      }

      v5 = v82;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("url"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = (void *)objc_msgSend(v34, "copy");
      v36 = v35;
      *(_WORD *)(v6 + 104) |= 0x400u;
      *(_WORD *)(v6 + 104) |= 0x800u;
      objc_storeStrong((id *)(v6 + 80), v35);

    }
    if (a3)
      v37 = CFSTR("enableImageFallback");
    else
      v37 = CFSTR("enable_image_fallback");
    objc_msgSend(v5, "objectForKeyedSubscript:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = objc_msgSend(v38, "BOOLValue");
      *(_WORD *)(v6 + 104) |= 0x800u;
      *(_WORD *)(v6 + 104) |= 2u;
      *(_BYTE *)(v6 + 101) = v39;
    }

    if (a3)
      v40 = CFSTR("punchOutText");
    else
      v40 = CFSTR("punch_out_text");
    objc_msgSend(v5, "objectForKeyedSubscript:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      v42 = v41;
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v92;
        do
        {
          for (j = 0; j != v44; ++j)
          {
            if (*(_QWORD *)v92 != v45)
              objc_enumerationMutation(v42);
            v47 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v48 = [GEOLocalizedString alloc];
              if ((a3 & 1) != 0)
                v49 = -[GEOLocalizedString initWithJSON:](v48, "initWithJSON:", v47);
              else
                v49 = -[GEOLocalizedString initWithDictionary:](v48, "initWithDictionary:", v47);
              v50 = v49;
              -[GEOPDPlaceCollectionItem addPunchOutText:](v6, v49);

            }
          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
        }
        while (v44);
      }

      v5 = v82;
    }

    if (a3)
      v51 = CFSTR("itemDescriptionBytes");
    else
      v51 = CFSTR("item_description_bytes");
    objc_msgSend(v5, "objectForKeyedSubscript:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      v53 = v52;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v87, v104, 16);
      if (v54)
      {
        v55 = v54;
        v56 = *(_QWORD *)v88;
        do
        {
          for (k = 0; k != v55; ++k)
          {
            if (*(_QWORD *)v88 != v56)
              objc_enumerationMutation(v53);
            v58 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v59 = [GEOLocalizedBytes alloc];
              if ((a3 & 1) != 0)
                v60 = -[GEOLocalizedBytes initWithJSON:](v59, "initWithJSON:", v58);
              else
                v60 = -[GEOLocalizedBytes initWithDictionary:](v59, "initWithDictionary:", v58);
              v61 = v60;
              -[GEOPDPlaceCollectionItem addItemDescriptionBytes:](v6, v60);

            }
          }
          v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v87, v104, 16);
        }
        while (v55);
      }

      v5 = v82;
    }

    if (a3)
      v62 = CFSTR("itemDescriptionHtml");
    else
      v62 = CFSTR("item_description_html");
    objc_msgSend(v5, "objectForKeyedSubscript:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v64 = v63;
      v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v83, v103, 16);
      if (v65)
      {
        v66 = v65;
        v67 = *(_QWORD *)v84;
        do
        {
          for (m = 0; m != v66; ++m)
          {
            if (*(_QWORD *)v84 != v67)
              objc_enumerationMutation(v64);
            v69 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v70 = [GEOLocalizedString alloc];
              if ((a3 & 1) != 0)
                v71 = -[GEOLocalizedString initWithJSON:](v70, "initWithJSON:", v69);
              else
                v71 = -[GEOLocalizedString initWithDictionary:](v70, "initWithDictionary:", v69);
              v72 = v71;
              -[GEOPDPlaceCollectionItem addItemDescriptionHtml:](v6, v71);

            }
          }
          v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v83, v103, 16);
        }
        while (v66);
      }

      v5 = v82;
    }

    if (a3)
      v73 = CFSTR("appClip");
    else
      v73 = CFSTR("app_clip");
    objc_msgSend(v5, "objectForKeyedSubscript:", v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v75 = [GEOPDQuickLinkItem alloc];
      if (v75)
        v76 = (void *)-[GEOPDQuickLinkItem _initWithDictionary:isJSON:](v75, v74, a3);
      else
        v76 = 0;
      v77 = v76;
      *(_WORD *)(v6 + 104) |= 8u;
      *(_WORD *)(v6 + 104) |= 0x800u;
      objc_storeStrong((id *)(v6 + 24), v76);

    }
    if (a3)
      v78 = CFSTR("disableAppClipFallback");
    else
      v78 = CFSTR("disable_app_clip_fallback");
    objc_msgSend(v5, "objectForKeyedSubscript:", v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v80 = objc_msgSend(v79, "BOOLValue");
      *(_WORD *)(v6 + 104) |= 0x800u;
      *(_WORD *)(v6 + 104) |= 1u;
      *(_BYTE *)(v6 + 100) = v80;
    }

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceCollectionItemReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  PBDataReader *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDPlaceCollectionItemIsDirty((uint64_t)self) & 1) == 0)
  {
    v26 = self->_reader;
    objc_sync_enter(v26);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v27);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v26);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlaceCollectionItem readAll:]((uint64_t)self, 0);
    if (self->_itemId)
      PBDataWriterWriteSubmessage();
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v6 = self->_photos;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v45;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v45 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      }
      while (v7);
    }

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v10 = self->_itemDescriptions;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v41;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v41 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
      }
      while (v11);
    }

    if (self->_url)
      PBDataWriterWriteStringField();
    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteBOOLField();
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v14 = self->_punchOutTexts;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v37;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v37 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
      }
      while (v15);
    }

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v18 = self->_itemDescriptionBytes;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v49, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v33;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(v18);
          PBDataWriterWriteSubmessage();
          ++v21;
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v49, 16);
      }
      while (v19);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v22 = self->_itemDescriptionHtmls;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v28, v48, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v29;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v29 != v24)
            objc_enumerationMutation(v22);
          PBDataWriterWriteSubmessage();
          ++v25;
        }
        while (v23 != v25);
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v28, v48, 16);
      }
      while (v23);
    }

    if (self->_appClip)
      PBDataWriterWriteSubmessage();
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteBOOLField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v28);
  }

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
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t n;
  void *v37;
  id v38;
  void *v39;
  PBUnknownFields *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDPlaceCollectionItemReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_45;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlaceCollectionItem readAll:]((uint64_t)self, 0);
  v9 = -[GEOPDMapsIdentifier copyWithZone:](self->_itemId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v9;

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v11 = self->_photos;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v59 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDPlaceCollectionItem addPhoto:](v5, v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    }
    while (v12);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v16 = self->_itemDescriptions;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v55 != v18)
          objc_enumerationMutation(v16);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * j), "copyWithZone:", a3);
        -[GEOPDPlaceCollectionItem addItemDescription:](v5, v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    }
    while (v17);
  }

  v21 = -[NSString copyWithZone:](self->_url, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v21;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 101) = self->_enableImageFallback;
    *(_WORD *)(v5 + 104) |= 2u;
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v23 = self->_punchOutTexts;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v51;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v51 != v25)
          objc_enumerationMutation(v23);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * k), "copyWithZone:", a3);
        -[GEOPDPlaceCollectionItem addPunchOutText:](v5, v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
    }
    while (v24);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v28 = self->_itemDescriptionBytes;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v47;
    do
    {
      for (m = 0; m != v29; ++m)
      {
        if (*(_QWORD *)v47 != v30)
          objc_enumerationMutation(v28);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * m), "copyWithZone:", a3);
        -[GEOPDPlaceCollectionItem addItemDescriptionBytes:](v5, v32);

      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
    }
    while (v29);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v33 = self->_itemDescriptionHtmls;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v42, v62, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v43;
    do
    {
      for (n = 0; n != v34; ++n)
      {
        if (*(_QWORD *)v43 != v35)
          objc_enumerationMutation(v33);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * n), "copyWithZone:", a3, (_QWORD)v42);
        -[GEOPDPlaceCollectionItem addItemDescriptionHtml:](v5, v37);

      }
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v42, v62, 16);
    }
    while (v34);
  }

  v38 = -[GEOPDQuickLinkItem copyWithZone:](self->_appClip, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v38;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 100) = self->_disableAppClipFallback;
    *(_WORD *)(v5 + 104) |= 1u;
  }
  v40 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v40;
LABEL_45:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDMapsIdentifier *itemId;
  NSMutableArray *photos;
  NSMutableArray *itemDescriptions;
  NSString *url;
  __int16 v9;
  NSMutableArray *punchOutTexts;
  NSMutableArray *itemDescriptionBytes;
  NSMutableArray *itemDescriptionHtmls;
  GEOPDQuickLinkItem *appClip;
  __int16 v14;
  BOOL v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  -[GEOPDPlaceCollectionItem readAll:]((uint64_t)self, 1);
  -[GEOPDPlaceCollectionItem readAll:]((uint64_t)v4, 1);
  itemId = self->_itemId;
  if ((unint64_t)itemId | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](itemId, "isEqual:"))
      goto LABEL_28;
  }
  photos = self->_photos;
  if ((unint64_t)photos | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](photos, "isEqual:"))
      goto LABEL_28;
  }
  itemDescriptions = self->_itemDescriptions;
  if ((unint64_t)itemDescriptions | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](itemDescriptions, "isEqual:"))
      goto LABEL_28;
  }
  url = self->_url;
  if ((unint64_t)url | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](url, "isEqual:"))
      goto LABEL_28;
  }
  v9 = *((_WORD *)v4 + 52);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v9 & 2) == 0)
      goto LABEL_28;
    if (self->_enableImageFallback)
    {
      if (!*((_BYTE *)v4 + 101))
        goto LABEL_28;
    }
    else if (*((_BYTE *)v4 + 101))
    {
      goto LABEL_28;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_28;
  }
  punchOutTexts = self->_punchOutTexts;
  if ((unint64_t)punchOutTexts | *((_QWORD *)v4 + 9)
    && !-[NSMutableArray isEqual:](punchOutTexts, "isEqual:"))
  {
    goto LABEL_28;
  }
  itemDescriptionBytes = self->_itemDescriptionBytes;
  if ((unint64_t)itemDescriptionBytes | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](itemDescriptionBytes, "isEqual:"))
      goto LABEL_28;
  }
  itemDescriptionHtmls = self->_itemDescriptionHtmls;
  if ((unint64_t)itemDescriptionHtmls | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](itemDescriptionHtmls, "isEqual:"))
      goto LABEL_28;
  }
  appClip = self->_appClip;
  if ((unint64_t)appClip | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDQuickLinkItem isEqual:](appClip, "isEqual:"))
      goto LABEL_28;
  }
  v14 = *((_WORD *)v4 + 52);
  v15 = (v14 & 1) == 0;
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v14 & 1) != 0)
    {
      if (self->_disableAppClipFallback)
      {
        if (!*((_BYTE *)v4 + 100))
          goto LABEL_28;
      }
      else if (*((_BYTE *)v4 + 100))
      {
        goto LABEL_28;
      }
      v15 = 1;
      goto LABEL_29;
    }
LABEL_28:
    v15 = 0;
  }
LABEL_29:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v13;

  -[GEOPDPlaceCollectionItem readAll:]((uint64_t)self, 1);
  v13 = -[GEOPDMapsIdentifier hash](self->_itemId, "hash");
  v3 = -[NSMutableArray hash](self->_photos, "hash");
  v4 = -[NSMutableArray hash](self->_itemDescriptions, "hash");
  v5 = -[NSString hash](self->_url, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v6 = 2654435761 * self->_enableImageFallback;
  else
    v6 = 0;
  v7 = -[NSMutableArray hash](self->_punchOutTexts, "hash");
  v8 = -[NSMutableArray hash](self->_itemDescriptionBytes, "hash");
  v9 = -[NSMutableArray hash](self->_itemDescriptionHtmls, "hash");
  v10 = -[GEOPDQuickLinkItem hash](self->_appClip, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v11 = 2654435761 * self->_disableAppClipFallback;
  else
    v11 = 0;
  return v3 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_punchOutTexts, 0);
  objc_storeStrong((id *)&self->_photos, 0);
  objc_storeStrong((id *)&self->_itemId, 0);
  objc_storeStrong((id *)&self->_itemDescriptions, 0);
  objc_storeStrong((id *)&self->_itemDescriptionHtmls, 0);
  objc_storeStrong((id *)&self->_itemDescriptionBytes, 0);
  objc_storeStrong((id *)&self->_appClip, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
