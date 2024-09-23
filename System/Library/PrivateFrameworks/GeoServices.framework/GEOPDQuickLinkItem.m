@implementation GEOPDQuickLinkItem

+ (id)quickLinksForPlaceData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__GEOPDQuickLinkItem_PlaceDataExtras__quickLinksForPlaceData___block_invoke;
  v10[3] = &unk_1E1C09968;
  v11 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateValidComponentValuesOfType:usingBlock:", 40, v10);

  if (objc_msgSend(v6, "count"))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

void __62__GEOPDQuickLinkItem_PlaceDataExtras__quickLinksForPlaceData___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id *v7;
  void *v8;
  id *v9;

  v9 = a2;
  -[GEOPDComponentValue quickLink](v9);
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDQuickLink quickLinkItems](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    -[GEOPDComponentValue quickLink](v9);
    v7 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDQuickLink quickLinkItems](v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v8);

  }
}

+ (id)secondaryQuickLinksForPlaceData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__GEOPDQuickLinkItem_PlaceDataExtras__secondaryQuickLinksForPlaceData___block_invoke;
  v10[3] = &unk_1E1C09968;
  v11 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateValidComponentValuesOfType:usingBlock:", 40, v10);

  if (objc_msgSend(v6, "count"))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

void __71__GEOPDQuickLinkItem_PlaceDataExtras__secondaryQuickLinksForPlaceData___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id *v7;
  void *v8;
  id *v9;

  v9 = a2;
  -[GEOPDComponentValue quickLink](v9);
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDQuickLink secondaryQuickLinkItems](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    -[GEOPDComponentValue quickLink](v9);
    v7 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDQuickLink secondaryQuickLinkItems](v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v8);

  }
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v2;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 84) |= 4u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    -[GEOPDQuickLinkItem readAll:](a1, 0);
  }
}

- (GEOPDQuickLinkItem)init
{
  GEOPDQuickLinkItem *v2;
  GEOPDQuickLinkItem *v3;
  GEOPDQuickLinkItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDQuickLinkItem;
  v2 = -[GEOPDQuickLinkItem init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDQuickLinkItem)initWithData:(id)a3
{
  GEOPDQuickLinkItem *v3;
  GEOPDQuickLinkItem *v4;
  GEOPDQuickLinkItem *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDQuickLinkItem;
  v3 = -[GEOPDQuickLinkItem initWithData:](&v7, sel_initWithData_, a3);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDQuickLinkItemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTitle_tags_6020);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)title
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDQuickLinkItem _readTitle]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)_readUrl
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDQuickLinkItemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUrl_tags_6021);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)url
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDQuickLinkItem _readUrl]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)setUrl:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 84) |= 0x80u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    objc_storeStrong((id *)(a1 + 56), a2);
  }

}

- (void)_readAppAdamId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDQuickLinkItemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAppAdamId_tags_6022);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)appAdamId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDQuickLinkItem _readAppAdamId]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setAppAdamId:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 84) |= 8u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }

}

- (void)_readBundleId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDQuickLinkItemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBundleId_tags_6023);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)bundleId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDQuickLinkItem _readBundleId]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setBundleId:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 84) |= 0x10u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }

}

- (uint64_t)linkType
{
  uint64_t v1;
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 84);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 72));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 76);
    else
      return 1;
  }
  return result;
}

- (void)_readSymbolImageName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDQuickLinkItemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSymbolImageName_tags_6024);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)symbolImageName
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDQuickLinkItem _readSymbolImageName]((uint64_t)a1);
    a1 = (id *)v1[5];
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
  v8.super_class = (Class)GEOPDQuickLinkItem;
  -[GEOPDQuickLinkItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDQuickLinkItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDQuickLinkItem _dictionaryRepresentation:]((uint64_t)self, 0);
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
  __int16 v11;
  uint64_t v12;
  __CFString *v13;
  const __CFString *v14;
  unsigned int v15;
  __CFString *v16;
  void *v17;
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
  -[GEOPDQuickLinkItem readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDQuickLinkItem title]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("title"));

  -[GEOPDQuickLinkItem url]((id *)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("url"));

  -[GEOPDQuickLinkItem appAdamId]((id *)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("appAdamId");
    else
      v8 = CFSTR("app_adam_id");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  -[GEOPDQuickLinkItem bundleId]((id *)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a2)
      v10 = CFSTR("bundleId");
    else
      v10 = CFSTR("bundle_id");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);
  }

  v11 = *(_WORD *)(a1 + 84);
  if ((v11 & 1) != 0)
  {
    v12 = *(int *)(a1 + 76);
    if (v12 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 76));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E1C0C030[v12];
    }
    if (a2)
      v14 = CFSTR("linkType");
    else
      v14 = CFSTR("link_type");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

    v11 = *(_WORD *)(a1 + 84);
  }
  if ((v11 & 2) != 0)
  {
    v15 = *(_DWORD *)(a1 + 80) - 1;
    if (v15 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 80));
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E1C0C048[v15];
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("relationship"));

  }
  -[GEOPDQuickLinkItem symbolImageName]((id *)a1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    if (a2)
      v18 = CFSTR("symbolImageName");
    else
      v18 = CFSTR("symbol_image_name");
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
      v26[2] = __48__GEOPDQuickLinkItem__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDQuickLinkItem _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_6027;
      else
        v6 = (int *)&readAll__nonRecursiveTag_6028;
      GEOPDQuickLinkItemReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __48__GEOPDQuickLinkItem__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  id v23;
  int v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  id v28;

  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (!v6)
    goto LABEL_49;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    v9 = v8;
    *(_WORD *)(v6 + 84) |= 0x40u;
    *(_WORD *)(v6 + 84) |= 0x100u;
    objc_storeStrong((id *)(v6 + 48), v8);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("url"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)objc_msgSend(v10, "copy");
    -[GEOPDQuickLinkItem setUrl:](v6, v11);

  }
  if (a3)
    v12 = CFSTR("appAdamId");
  else
    v12 = CFSTR("app_adam_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = (void *)objc_msgSend(v13, "copy");
    -[GEOPDQuickLinkItem setAppAdamId:](v6, v14);

  }
  if (a3)
    v15 = CFSTR("bundleId");
  else
    v15 = CFSTR("bundle_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = (void *)objc_msgSend(v16, "copy");
    -[GEOPDQuickLinkItem setBundleId:](v6, v17);

  }
  if (a3)
    v18 = CFSTR("linkType");
  else
    v18 = CFSTR("link_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = v19;
    if ((objc_msgSend(v20, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v21 = 0;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LINK_TYPE_QUICK_LINK")) & 1) != 0)
    {
      v21 = 1;
    }
    else if (objc_msgSend(v20, "isEqualToString:", CFSTR("LINK_TYPE_APP_CLIP_LINK")))
    {
      v21 = 2;
    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_31;
    v21 = objc_msgSend(v19, "intValue");
  }
  *(_WORD *)(v6 + 84) |= 0x100u;
  *(_WORD *)(v6 + 84) |= 1u;
  *(_DWORD *)(v6 + 76) = v21;
LABEL_31:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("relationship"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = v22;
    if ((objc_msgSend(v23, "isEqualToString:", CFSTR("RELATIONSHIP_OWNER")) & 1) != 0)
    {
      v24 = 1;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("RELATIONSHIP_AUTHORIZED")) & 1) != 0)
    {
      v24 = 2;
    }
    else if (objc_msgSend(v23, "isEqualToString:", CFSTR("RELATIONSHIP_OTHER")))
    {
      v24 = 3;
    }
    else
    {
      v24 = 1;
    }

    goto LABEL_42;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = objc_msgSend(v22, "intValue");
LABEL_42:
    *(_WORD *)(v6 + 84) |= 0x100u;
    *(_WORD *)(v6 + 84) |= 2u;
    *(_DWORD *)(v6 + 80) = v24;
  }

  if (a3)
    v25 = CFSTR("symbolImageName");
  else
    v25 = CFSTR("symbol_image_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = (void *)objc_msgSend(v26, "copy");
    v28 = v27;
    *(_WORD *)(v6 + 84) |= 0x20u;
    *(_WORD *)(v6 + 84) |= 0x100u;
    objc_storeStrong((id *)(v6 + 40), v27);

  }
LABEL_49:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDQuickLinkItemReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  __int16 flags;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1F8) == 0))
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
    -[GEOPDQuickLinkItem readAll:]((uint64_t)self, 0);
    if (self->_title)
      PBDataWriterWriteStringField();
    v5 = v9;
    if (self->_url)
    {
      PBDataWriterWriteStringField();
      v5 = v9;
    }
    if (self->_appAdamId)
    {
      PBDataWriterWriteStringField();
      v5 = v9;
    }
    if (self->_bundleId)
    {
      PBDataWriterWriteStringField();
      v5 = v9;
    }
    flags = (__int16)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v9;
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v9;
    }
    if (self->_symbolImageName)
    {
      PBDataWriterWriteStringField();
      v5 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
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
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int16 flags;
  uint64_t v18;
  void *v19;
  PBUnknownFields *v20;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDQuickLinkItemReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDQuickLinkItem readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  v11 = -[NSString copyWithZone:](self->_url, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v11;

  v13 = -[NSString copyWithZone:](self->_appAdamId, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  v15 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v15;

  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_linkType;
    *(_WORD *)(v5 + 84) |= 1u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_relationship;
    *(_WORD *)(v5 + 84) |= 2u;
  }
  v18 = -[NSString copyWithZone:](self->_symbolImageName, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v18;

  v20 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v20;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *title;
  NSString *url;
  NSString *appAdamId;
  NSString *bundleId;
  __int16 flags;
  __int16 v10;
  NSString *symbolImageName;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[GEOPDQuickLinkItem readAll:]((uint64_t)self, 1);
  -[GEOPDQuickLinkItem readAll:]((uint64_t)v4, 1);
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](title, "isEqual:"))
      goto LABEL_22;
  }
  url = self->_url;
  if ((unint64_t)url | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](url, "isEqual:"))
      goto LABEL_22;
  }
  appAdamId = self->_appAdamId;
  if ((unint64_t)appAdamId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](appAdamId, "isEqual:"))
      goto LABEL_22;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:"))
      goto LABEL_22;
  }
  flags = (__int16)self->_flags;
  v10 = *((_WORD *)v4 + 42);
  if ((flags & 1) != 0)
  {
    if ((v10 & 1) == 0 || self->_linkType != *((_DWORD *)v4 + 19))
      goto LABEL_22;
  }
  else if ((v10 & 1) != 0)
  {
LABEL_22:
    v12 = 0;
    goto LABEL_23;
  }
  if ((flags & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_relationship != *((_DWORD *)v4 + 20))
      goto LABEL_22;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_22;
  }
  symbolImageName = self->_symbolImageName;
  if ((unint64_t)symbolImageName | *((_QWORD *)v4 + 5))
    v12 = -[NSString isEqual:](symbolImageName, "isEqual:");
  else
    v12 = 1;
LABEL_23:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  __int16 flags;
  uint64_t v8;
  uint64_t v9;

  -[GEOPDQuickLinkItem readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[NSString hash](self->_url, "hash");
  v5 = -[NSString hash](self->_appAdamId, "hash");
  v6 = -[NSString hash](self->_bundleId, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    v8 = 2654435761 * self->_linkType;
    if ((flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ -[NSString hash](self->_symbolImageName, "hash");
  }
  v8 = 0;
  if ((flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v9 = 2654435761 * self->_relationship;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ -[NSString hash](self->_symbolImageName, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_symbolImageName, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
