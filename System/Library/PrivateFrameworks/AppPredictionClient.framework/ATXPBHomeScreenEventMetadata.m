@implementation ATXPBHomeScreenEventMetadata

- (uint64_t)widgetInStackIdentifiables
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

- (uint64_t)widgetIdentifiables
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (uint64_t)visibleRect
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (uint64_t)suggestedPageType
{
  if (result)
  {
    if ((*(_BYTE *)(result + 76) & 2) != 0)
      return *(unsigned int *)(result + 40);
    else
      return 0;
  }
  return result;
}

- (uint64_t)stackIds
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (uint64_t)pageIndex
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (uint64_t)hasPageIndex
{
  if (result)
    return *(_BYTE *)(result + 76) & 1;
  return result;
}

- (uint64_t)hasIsWidgetInTodayView
{
  if (result)
    return (*(unsigned __int8 *)(result + 76) >> 4) & 1;
  return result;
}

- (uint64_t)hasIsSuggestionInAddWidgetSheet
{
  if (result)
    return (*(unsigned __int8 *)(result + 76) >> 3) & 1;
  return result;
}

- (uint64_t)hasIsStalenessRotation
{
  if (result)
    return (*(unsigned __int8 *)(result + 76) >> 2) & 1;
  return result;
}

- (uint64_t)engagedUrl
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (uint64_t)bundleIds
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (void)setWidgetInStackIdentifiables:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

- (void)setWidgetIdentifiables:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)setVisibleRect:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

- (uint64_t)setSuggestedPageType:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 76) |= 2u;
    *(_DWORD *)(result + 40) = a2;
  }
  return result;
}

- (void)setStackIds:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (uint64_t)setPageIndex:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 76) |= 1u;
    *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

- (void)setEngagedUrl:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setBundleIds:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetInStackIdentifiables, 0);
  objc_storeStrong((id *)&self->_widgetIdentifiables, 0);
  objc_storeStrong((id *)&self->_visibleRect, 0);
  objc_storeStrong((id *)&self->_stackIds, 0);
  objc_storeStrong((id *)&self->_engagedUrl, 0);
  objc_storeStrong((id *)&self->_bundleIds, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  char has;
  char v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  __int128 v27;
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
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = self->_stackIds;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v7);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = self->_widgetIdentifiables;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v12);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v15 = self->_widgetInStackIdentifiables;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    }
    while (v17);
  }

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_visibleRect)
    PBDataWriterWriteSubmessage();
  if (self->_engagedUrl)
    PBDataWriterWriteStringField();
  v21 = (char)self->_has;
  if ((v21 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v21 = (char)self->_has;
  }
  if ((v21 & 2) != 0)
    PBDataWriterWriteInt32Field();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v22 = self->_bundleIds;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v28;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(v22);
        PBDataWriterWriteStringField();
      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    }
    while (v24);
  }

}

- (uint64_t)setHasPageIndex:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 76) = *(_BYTE *)(result + 76) & 0xFE | a2;
  return result;
}

- (uint64_t)clearStackIds
{
  if (result)
    return objc_msgSend(*(id *)(result + 32), "removeAllObjects");
  return result;
}

- (void)addStackIds:(uint64_t)a1
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

- (uint64_t)stackIdsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 32), "count");
  return result;
}

- (id)stackIdsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[4], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)clearWidgetIdentifiables
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "removeAllObjects");
  return result;
}

- (void)addWidgetIdentifiables:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)widgetIdentifiablesCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "count");
  return result;
}

- (id)widgetIdentifiablesAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[7], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (uint64_t)widgetIdentifiablesType
{
  objc_opt_self();
  return objc_opt_class();
}

- (uint64_t)clearWidgetInStackIdentifiables
{
  if (result)
    return objc_msgSend(*(id *)(result + 64), "removeAllObjects");
  return result;
}

- (void)addWidgetInStackIdentifiables:(uint64_t)a1
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

- (uint64_t)widgetInStackIdentifiablesCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 64), "count");
  return result;
}

- (id)widgetInStackIdentifiablesAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[8], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)setIsSuggestionInAddWidgetSheet:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 76) |= 8u;
    *(_BYTE *)(result + 73) = a2;
  }
  return result;
}

- (uint64_t)setHasIsSuggestionInAddWidgetSheet:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 8;
    else
      v2 = 0;
    *(_BYTE *)(result + 76) = *(_BYTE *)(result + 76) & 0xF7 | v2;
  }
  return result;
}

- (uint64_t)setIsWidgetInTodayView:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 76) |= 0x10u;
    *(_BYTE *)(result + 74) = a2;
  }
  return result;
}

- (uint64_t)setHasIsWidgetInTodayView:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 16;
    else
      v2 = 0;
    *(_BYTE *)(result + 76) = *(_BYTE *)(result + 76) & 0xEF | v2;
  }
  return result;
}

- (BOOL)hasVisibleRect
{
  if (result)
    return *(_QWORD *)(result + 48) != 0;
  return result;
}

- (BOOL)hasEngagedUrl
{
  if (result)
    return *(_QWORD *)(result + 24) != 0;
  return result;
}

- (uint64_t)setIsStalenessRotation:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 76) |= 4u;
    *(_BYTE *)(result + 72) = a2;
  }
  return result;
}

- (uint64_t)setHasIsStalenessRotation:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 4;
    else
      v2 = 0;
    *(_BYTE *)(result + 76) = *(_BYTE *)(result + 76) & 0xFB | v2;
  }
  return result;
}

- (uint64_t)setHasSuggestedPageType:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 2;
    else
      v2 = 0;
    *(_BYTE *)(result + 76) = *(_BYTE *)(result + 76) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasSuggestedPageType
{
  if (result)
    return (*(unsigned __int8 *)(result + 76) >> 1) & 1;
  return result;
}

- (__CFString)suggestedPageTypeAsString:(void *)a1
{
  if (a1)
  {
    if (a2 < 0xC)
      return off_1E4D588E0[(int)a2];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (__CFString *)a1;
}

- (uint64_t)StringAsSuggestedPageType:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = v3;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Unspecified")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Default")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Custom")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("DND")) & 1) != 0)
    {
      v6 = 3;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Sleep")) & 1) != 0)
    {
      v6 = 4;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Driving")) & 1) != 0)
    {
      v6 = 5;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Exercise")) & 1) != 0)
    {
      v6 = 6;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Work")) & 1) != 0)
    {
      v6 = 7;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Personal")) & 1) != 0)
    {
      v6 = 8;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Reading")) & 1) != 0)
    {
      v6 = 9;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Gaming")) & 1) != 0)
    {
      v6 = 10;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Mindfulness")))
    {
      v6 = 11;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)clearBundleIds
{
  if (result)
    return objc_msgSend(*(id *)(result + 16), "removeAllObjects");
  return result;
}

- (void)addBundleIds:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)bundleIdsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 16), "count");
  return result;
}

- (id)bundleIdsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[2], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
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
  v8.super_class = (Class)ATXPBHomeScreenEventMetadata;
  -[ATXPBHomeScreenEventMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenEventMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *stackIds;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  char has;
  void *v21;
  void *v22;
  ATXPBCGRectWrapper *visibleRect;
  void *v24;
  NSString *engagedUrl;
  char v26;
  void *v27;
  uint64_t suggestedPageType;
  __CFString *v29;
  NSMutableArray *bundleIds;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_pageIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("pageIndex"));

  }
  stackIds = self->_stackIds;
  if (stackIds)
    objc_msgSend(v3, "setObject:forKey:", stackIds, CFSTR("stackIds"));
  if (-[NSMutableArray count](self->_widgetIdentifiables, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_widgetIdentifiables, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v7 = self->_widgetIdentifiables;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v37 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("widgetIdentifiables"));
  }
  if (-[NSMutableArray count](self->_widgetInStackIdentifiables, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_widgetInStackIdentifiables, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v14 = self->_widgetInStackIdentifiables;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("widgetInStackIdentifiables"));
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSuggestionInAddWidgetSheet);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("isSuggestionInAddWidgetSheet"));

    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isWidgetInTodayView);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("isWidgetInTodayView"));

  }
  visibleRect = self->_visibleRect;
  if (visibleRect)
  {
    -[ATXPBCGRectWrapper dictionaryRepresentation](visibleRect, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("visibleRect"));

  }
  engagedUrl = self->_engagedUrl;
  if (engagedUrl)
    objc_msgSend(v3, "setObject:forKey:", engagedUrl, CFSTR("engagedUrl"));
  v26 = (char)self->_has;
  if ((v26 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isStalenessRotation);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("isStalenessRotation"));

    v26 = (char)self->_has;
  }
  if ((v26 & 2) != 0)
  {
    suggestedPageType = self->_suggestedPageType;
    if (suggestedPageType >= 0xC)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_suggestedPageType);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_1E4D588E0[suggestedPageType];
    }
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("suggestedPageType"));

  }
  bundleIds = self->_bundleIds;
  if (bundleIds)
    objc_msgSend(v3, "setObject:forKey:", bundleIds, CFSTR("bundleIds"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBHomeScreenEventMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(uint64_t)a1
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t k;
  void *v14;
  char v15;
  _BYTE *v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t m;
  void *v23;
  id v24;

  v24 = a2;
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 76) & 1) != 0)
    {
      *((_QWORD *)v24 + 1) = *(_QWORD *)(a1 + 8);
      *((_BYTE *)v24 + 76) |= 1u;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      if (v24)
        objc_msgSend(*((id *)v24 + 4), "removeAllObjects");
      v3 = objc_msgSend(*(id *)(a1 + 32), "count");
      if (v3)
      {
        v4 = v3;
        for (i = 0; i != v4; ++i)
        {
          -[ATXPBHomeScreenEventMetadata stackIdsAtIndex:]((id *)a1, i);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXPBHomeScreenEventMetadata addStackIds:]((uint64_t)v24, v6);

        }
      }
    }
    if (objc_msgSend(*(id *)(a1 + 56), "count"))
    {
      if (v24)
        objc_msgSend(*((id *)v24 + 7), "removeAllObjects");
      v7 = objc_msgSend(*(id *)(a1 + 56), "count");
      if (v7)
      {
        v8 = v7;
        for (j = 0; j != v8; ++j)
        {
          -[ATXPBHomeScreenEventMetadata widgetIdentifiablesAtIndex:]((id *)a1, j);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXPBHomeScreenEventMetadata addWidgetIdentifiables:]((uint64_t)v24, v10);

        }
      }
    }
    if (objc_msgSend(*(id *)(a1 + 64), "count"))
    {
      if (v24)
        objc_msgSend(*((id *)v24 + 8), "removeAllObjects");
      v11 = objc_msgSend(*(id *)(a1 + 64), "count");
      if (v11)
      {
        v12 = v11;
        for (k = 0; k != v12; ++k)
        {
          -[ATXPBHomeScreenEventMetadata widgetInStackIdentifiablesAtIndex:]((id *)a1, k);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXPBHomeScreenEventMetadata addWidgetInStackIdentifiables:]((uint64_t)v24, v14);

        }
      }
    }
    v15 = *(_BYTE *)(a1 + 76);
    v16 = v24;
    if ((v15 & 8) != 0)
    {
      *((_BYTE *)v24 + 73) = *(_BYTE *)(a1 + 73);
      *((_BYTE *)v24 + 76) |= 8u;
      v15 = *(_BYTE *)(a1 + 76);
    }
    if ((v15 & 0x10) != 0)
    {
      *((_BYTE *)v24 + 74) = *(_BYTE *)(a1 + 74);
      *((_BYTE *)v24 + 76) |= 0x10u;
    }
    v17 = *(void **)(a1 + 48);
    if (v17)
    {
      -[ATXPBHomeScreenEventMetadata setVisibleRect:]((uint64_t)v24, v17);
      v16 = v24;
    }
    v18 = *(void **)(a1 + 24);
    if (v18)
    {
      -[ATXPBHomeScreenEventMetadata setEngagedUrl:]((uint64_t)v24, v18);
      v16 = v24;
    }
    v19 = *(_BYTE *)(a1 + 76);
    if ((v19 & 4) != 0)
    {
      v16[72] = *(_BYTE *)(a1 + 72);
      v16[76] |= 4u;
      v19 = *(_BYTE *)(a1 + 76);
    }
    if ((v19 & 2) != 0)
    {
      *((_DWORD *)v16 + 10) = *(_DWORD *)(a1 + 40);
      v16[76] |= 2u;
    }
    if (objc_msgSend(*(id *)(a1 + 16), "count"))
    {
      if (v24)
        objc_msgSend(*((id *)v24 + 2), "removeAllObjects");
      v20 = objc_msgSend(*(id *)(a1 + 16), "count");
      if (v20)
      {
        v21 = v20;
        for (m = 0; m != v21; ++m)
        {
          -[ATXPBHomeScreenEventMetadata bundleIdsAtIndex:]((id *)a1, m);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXPBHomeScreenEventMetadata addBundleIds:]((uint64_t)v24, v23);

        }
      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  char has;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  char v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  void *v36;
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
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_pageIndex;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v7 = self->_stackIds;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v51 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "copyWithZone:", a3);
        -[ATXPBHomeScreenEventMetadata addStackIds:](v6, v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    }
    while (v9);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v13 = self->_widgetIdentifiables;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v47 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "copyWithZone:", a3);
        -[ATXPBHomeScreenEventMetadata addWidgetIdentifiables:](v6, v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    }
    while (v15);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v19 = self->_widgetInStackIdentifiables;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v43;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v43 != v22)
          objc_enumerationMutation(v19);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * k), "copyWithZone:", a3);
        -[ATXPBHomeScreenEventMetadata addWidgetInStackIdentifiables:](v6, v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
    }
    while (v21);
  }

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_BYTE *)(v6 + 73) = self->_isSuggestionInAddWidgetSheet;
    *(_BYTE *)(v6 + 76) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(_BYTE *)(v6 + 74) = self->_isWidgetInTodayView;
    *(_BYTE *)(v6 + 76) |= 0x10u;
  }
  v26 = -[ATXPBCGRectWrapper copyWithZone:](self->_visibleRect, "copyWithZone:", a3);
  v27 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v26;

  v28 = -[NSString copyWithZone:](self->_engagedUrl, "copyWithZone:", a3);
  v29 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v28;

  v30 = (char)self->_has;
  if ((v30 & 4) != 0)
  {
    *(_BYTE *)(v6 + 72) = self->_isStalenessRotation;
    *(_BYTE *)(v6 + 76) |= 4u;
    v30 = (char)self->_has;
  }
  if ((v30 & 2) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_suggestedPageType;
    *(_BYTE *)(v6 + 76) |= 2u;
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v31 = self->_bundleIds;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v39;
    do
    {
      for (m = 0; m != v33; ++m)
      {
        if (*(_QWORD *)v39 != v34)
          objc_enumerationMutation(v31);
        v36 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * m), "copyWithZone:", a3, (_QWORD)v38);
        -[ATXPBHomeScreenEventMetadata addBundleIds:](v6, v36);

      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
    }
    while (v33);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *stackIds;
  NSMutableArray *widgetIdentifiables;
  NSMutableArray *widgetInStackIdentifiables;
  ATXPBCGRectWrapper *visibleRect;
  NSString *engagedUrl;
  NSMutableArray *bundleIds;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_48;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_pageIndex != *((_QWORD *)v4 + 1))
      goto LABEL_48;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    goto LABEL_48;
  }
  stackIds = self->_stackIds;
  if ((unint64_t)stackIds | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](stackIds, "isEqual:"))
  {
    goto LABEL_48;
  }
  widgetIdentifiables = self->_widgetIdentifiables;
  if ((unint64_t)widgetIdentifiables | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](widgetIdentifiables, "isEqual:"))
      goto LABEL_48;
  }
  widgetInStackIdentifiables = self->_widgetInStackIdentifiables;
  if ((unint64_t)widgetInStackIdentifiables | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](widgetInStackIdentifiables, "isEqual:"))
      goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 8) == 0)
      goto LABEL_48;
    if (self->_isSuggestionInAddWidgetSheet)
    {
      if (!*((_BYTE *)v4 + 73))
        goto LABEL_48;
    }
    else if (*((_BYTE *)v4 + 73))
    {
      goto LABEL_48;
    }
  }
  else if ((*((_BYTE *)v4 + 76) & 8) != 0)
  {
    goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 0x10) == 0)
      goto LABEL_48;
    if (self->_isWidgetInTodayView)
    {
      if (!*((_BYTE *)v4 + 74))
        goto LABEL_48;
    }
    else if (*((_BYTE *)v4 + 74))
    {
      goto LABEL_48;
    }
  }
  else if ((*((_BYTE *)v4 + 76) & 0x10) != 0)
  {
    goto LABEL_48;
  }
  visibleRect = self->_visibleRect;
  if ((unint64_t)visibleRect | *((_QWORD *)v4 + 6) && !-[ATXPBCGRectWrapper isEqual:](visibleRect, "isEqual:"))
    goto LABEL_48;
  engagedUrl = self->_engagedUrl;
  if ((unint64_t)engagedUrl | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](engagedUrl, "isEqual:"))
      goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 4) != 0)
    {
      if (self->_isStalenessRotation)
      {
        if (!*((_BYTE *)v4 + 72))
          goto LABEL_48;
        goto LABEL_41;
      }
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_41;
    }
LABEL_48:
    v11 = 0;
    goto LABEL_49;
  }
  if ((*((_BYTE *)v4 + 76) & 4) != 0)
    goto LABEL_48;
LABEL_41:
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_suggestedPageType != *((_DWORD *)v4 + 10))
      goto LABEL_48;
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    goto LABEL_48;
  }
  bundleIds = self->_bundleIds;
  if ((unint64_t)bundleIds | *((_QWORD *)v4 + 2))
    v11 = -[NSMutableArray isEqual:](bundleIds, "isEqual:");
  else
    v11 = 1;
LABEL_49:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_pageIndex;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_stackIds, "hash");
  v5 = -[NSMutableArray hash](self->_widgetIdentifiables, "hash");
  v6 = -[NSMutableArray hash](self->_widgetInStackIdentifiables, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v7 = 2654435761 * self->_isSuggestionInAddWidgetSheet;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
  }
  else
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_6:
      v8 = 2654435761 * self->_isWidgetInTodayView;
      goto LABEL_9;
    }
  }
  v8 = 0;
LABEL_9:
  v9 = -[ATXPBCGRectWrapper hash](self->_visibleRect, "hash");
  v10 = -[NSString hash](self->_engagedUrl, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v11 = 2654435761 * self->_isStalenessRotation;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_11;
LABEL_13:
    v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[NSMutableArray hash](self->_bundleIds, "hash");
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_13;
LABEL_11:
  v12 = 2654435761 * self->_suggestedPageType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[NSMutableArray hash](self->_bundleIds, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  id *v3;
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  char v20;
  id v21;
  id v22;
  char v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
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
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if ((*((_BYTE *)v3 + 76) & 1) != 0)
    {
      *(_QWORD *)(a1 + 8) = v3[1];
      *(_BYTE *)(a1 + 76) |= 1u;
    }
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v5 = v3[4];
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v42 != v8)
            objc_enumerationMutation(v5);
          -[ATXPBHomeScreenEventMetadata addStackIds:](a1, *(void **)(*((_QWORD *)&v41 + 1) + 8 * i));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
      }
      while (v7);
    }

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v10 = v4[7];
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v38 != v13)
            objc_enumerationMutation(v10);
          -[ATXPBHomeScreenEventMetadata addWidgetIdentifiables:](a1, *(void **)(*((_QWORD *)&v37 + 1) + 8 * j));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      }
      while (v12);
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v15 = v4[8];
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v34;
      do
      {
        for (k = 0; k != v17; ++k)
        {
          if (*(_QWORD *)v34 != v18)
            objc_enumerationMutation(v15);
          -[ATXPBHomeScreenEventMetadata addWidgetInStackIdentifiables:](a1, *(void **)(*((_QWORD *)&v33 + 1) + 8 * k));
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
      }
      while (v17);
    }

    v20 = *((_BYTE *)v4 + 76);
    if ((v20 & 8) != 0)
    {
      *(_BYTE *)(a1 + 73) = *((_BYTE *)v4 + 73);
      *(_BYTE *)(a1 + 76) |= 8u;
      v20 = *((_BYTE *)v4 + 76);
    }
    if ((v20 & 0x10) != 0)
    {
      *(_BYTE *)(a1 + 74) = *((_BYTE *)v4 + 74);
      *(_BYTE *)(a1 + 76) |= 0x10u;
    }
    v21 = v4[6];
    if (*(_QWORD *)(a1 + 48))
    {
      if (v21)
        -[ATXPBCGRectWrapper mergeFrom:](*(_QWORD *)(a1 + 48), (uint64_t)v21);
    }
    else if (v21)
    {
      objc_storeStrong((id *)(a1 + 48), v21);
    }
    v22 = v4[3];
    if (v22)
      objc_storeStrong((id *)(a1 + 24), v22);
    v23 = *((_BYTE *)v4 + 76);
    if ((v23 & 4) != 0)
    {
      *(_BYTE *)(a1 + 72) = *((_BYTE *)v4 + 72);
      *(_BYTE *)(a1 + 76) |= 4u;
      v23 = *((_BYTE *)v4 + 76);
    }
    if ((v23 & 2) != 0)
    {
      *(_DWORD *)(a1 + 40) = *((_DWORD *)v4 + 10);
      *(_BYTE *)(a1 + 76) |= 2u;
    }
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v24 = v4[2];
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v30;
      do
      {
        for (m = 0; m != v26; ++m)
        {
          if (*(_QWORD *)v30 != v27)
            objc_enumerationMutation(v24);
          -[ATXPBHomeScreenEventMetadata addBundleIds:](a1, *(void **)(*((_QWORD *)&v29 + 1) + 8 * m));
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
      }
      while (v26);
    }

  }
}

- (BOOL)isSuggestionInAddWidgetSheet
{
  if (result)
    return *(_BYTE *)(result + 73) != 0;
  return result;
}

- (BOOL)isWidgetInTodayView
{
  if (result)
    return *(_BYTE *)(result + 74) != 0;
  return result;
}

- (BOOL)isStalenessRotation
{
  if (result)
    return *(_BYTE *)(result + 72) != 0;
  return result;
}

@end
