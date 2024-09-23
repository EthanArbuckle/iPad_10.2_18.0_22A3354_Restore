@implementation GEOPDSearchResult

- (id)resultDetourInfos
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchResult _readResultDetourInfos]((uint64_t)a1);
    a1 = (id *)v1[17];
  }
  return a1;
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    -[GEOPDSearchResult _readDisplayMapRegion](result);
    if ((objc_msgSend(*(id *)(v3 + 72), "hasGreenTeaWithValue:", a2) & 1) != 0)
      return 1;
    -[GEOPDSearchResult _readOpenPlaceCardForResultWithId](v3);
    if ((objc_msgSend(*(id *)(v3 + 88), "hasGreenTeaWithValue:", a2) & 1) != 0)
      return 1;
    -[GEOPDSearchResult _readPlaceSummaryLayoutMetadata](v3);
    if ((objc_msgSend(*(id *)(v3 + 104), "hasGreenTeaWithValue:", a2) & 1) != 0)
      return 1;
    -[GEOPDSearchResult _readRelatedEntitySections](v3);
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = *(id *)(v3 + 120);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          if ((-[GEOPDRelatedEntitySection hasGreenTeaWithValue:](*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8), a2) & 1) != 0)
          {

            return 1;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v6)
          continue;
        break;
      }
    }

    -[GEOPDSearchResult _readResultRefinementGroup](v3);
    if ((-[GEOPDResultRefinementGroup hasGreenTeaWithValue:](*(_QWORD *)(v3 + 152), a2) & 1) != 0)
    {
      return 1;
    }
    else
    {
      -[GEOPDSearchResult _readSectionList](v3);
      return -[GEOPDSearchSectionList hasGreenTeaWithValue:](*(_QWORD *)(v3 + 200), a2);
    }
  }
  return result;
}

- (GEOPDSearchResult)init
{
  GEOPDSearchResult *v2;
  GEOPDSearchResult *v3;
  GEOPDSearchResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchResult;
  v2 = -[GEOPDSearchResult init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchResult)initWithData:(id)a3
{
  GEOPDSearchResult *v3;
  GEOPDSearchResult *v4;
  GEOPDSearchResult *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchResult;
  v3 = -[GEOPDSearchResult initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDisplayMapRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 250) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayMapRegion_tags_5253);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)displayMapRegion
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchResult _readDisplayMapRegion]((uint64_t)a1);
    a1 = (id *)v1[9];
  }
  return a1;
}

- (void)setDisplayMapRegion:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 248) |= 0x400020000uLL;
  objc_storeStrong((id *)(a1 + 72), a2);

}

- (void)_readDisambiguationLabels
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 249) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisambiguationLabels_tags_5254);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)disambiguationLabels
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchResult _readDisambiguationLabels]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)addDisambiguationLabel:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchResult _readDisambiguationLabels](a1);
    -[GEOPDSearchResult _addNoFlagsDisambiguationLabel:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_QWORD *)(a1 + 248) |= 0x8000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
    *(_QWORD *)(a1 + 248) |= 0x400000000uLL;
  }
}

- (void)_addNoFlagsDisambiguationLabel:(uint64_t)a1
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

- (void)_readRelatedSearchSuggestions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 251) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRelatedSearchSuggestions_tags_5255);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)relatedSearchSuggestions
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchResult _readRelatedSearchSuggestions]((uint64_t)a1);
    a1 = (id *)v1[16];
  }
  return a1;
}

- (void)addRelatedSearchSuggestion:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchResult _readRelatedSearchSuggestions](a1);
    -[GEOPDSearchResult _addNoFlagsRelatedSearchSuggestion:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_QWORD *)(a1 + 248) |= 0x1000000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
    *(_QWORD *)(a1 + 248) |= 0x400000000uLL;
  }
}

- (void)_addNoFlagsRelatedSearchSuggestion:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 128);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 128);
      *(_QWORD *)(a1 + 128) = v5;

      v4 = *(void **)(a1 + 128);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)searchResultType
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_QWORD *)(v1 + 248);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 216));
    if ((v2 & 8) != 0)
      return *(unsigned int *)(v1 + 232);
    else
      return 0;
  }
  return result;
}

- (void)_readResultDisplayHeader
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 251) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResultDisplayHeader_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)resultDisplayHeader
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchResult _readResultDisplayHeader]((uint64_t)a1);
    a1 = (id *)v1[18];
  }
  return a1;
}

- (void)setResultDisplayHeader:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 248) |= 0x404000000uLL;
  objc_storeStrong((id *)(a1 + 144), a2);

}

- (void)_readDefaultRelatedSearchSuggestion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 249) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDefaultRelatedSearchSuggestion_tags_5256);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)defaultRelatedSearchSuggestion
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchResult _readDefaultRelatedSearchSuggestion]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)setDefaultRelatedSearchSuggestion:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 248) |= 0x400002000uLL;
  objc_storeStrong((id *)(a1 + 40), a2);

}

- (void)_readSearchClientBehavior
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 251) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchClientBehavior_tags_5257);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)searchClientBehavior
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchResult _readSearchClientBehavior]((uint64_t)a1);
    a1 = (id *)v1[21];
  }
  return a1;
}

- (void)setSearchClientBehavior:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 248) |= 0x420000000uLL;
  objc_storeStrong((id *)(a1 + 168), a2);

}

- (void)_readResultDetourInfos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 251) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResultDetourInfos_tags_5258);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (void)addResultDetourInfo:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchResult _readResultDetourInfos](a1);
    -[GEOPDSearchResult _addNoFlagsResultDetourInfo:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_QWORD *)(a1 + 248) |= 0x2000000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
    *(_QWORD *)(a1 + 248) |= 0x400000000uLL;
  }
}

- (void)_addNoFlagsResultDetourInfo:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 136);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 136);
      *(_QWORD *)(a1 + 136) = v5;

      v4 = *(void **)(a1 + 136);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readDirectionIntent
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 249) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionIntent_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)directionIntent
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchResult _readDirectionIntent]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)setDirectionIntent:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 248) |= 0x400004000uLL;
  objc_storeStrong((id *)(a1 + 48), a2);

}

- (void)_readClientResolvedResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 249) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientResolvedResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)clientResolvedResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchResult _readClientResolvedResult]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setClientResolvedResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 248) |= 0x400001000uLL;
    objc_storeStrong((id *)(a1 + 32), a2);
  }

}

- (void)_readDisplayHeaderSubstitutes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 250) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayHeaderSubstitutes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)displayHeaderSubstitutes
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchResult _readDisplayHeaderSubstitutes]((uint64_t)a1);
    a1 = (id *)v1[8];
  }
  return a1;
}

- (void)addDisplayHeaderSubstitute:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchResult _readDisplayHeaderSubstitutes](a1);
    -[GEOPDSearchResult _addNoFlagsDisplayHeaderSubstitute:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_QWORD *)(a1 + 248) |= 0x10000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
    *(_QWORD *)(a1 + 248) |= 0x400000000uLL;
  }
}

- (void)_addNoFlagsDisplayHeaderSubstitute:(uint64_t)a1
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

- (uint64_t)dymSuggestionVisibleTime
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_QWORD *)(v1 + 248);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 216));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 220);
    else
      return 10;
  }
  return result;
}

- (BOOL)showDymSuggestionCloseButton
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_QWORD *)(v1 + 248);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 216));
    return (v2 & 0x200) == 0 || *(_BYTE *)(v1 + 244) != 0;
  }
  return result;
}

- (void)_readRetainSearchs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 251) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRetainSearchs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (void)addRetainSearch:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchResult _readRetainSearchs](a1);
    -[GEOPDSearchResult _addNoFlagsRetainSearch:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_QWORD *)(a1 + 248) |= 0x10000000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
    *(_QWORD *)(a1 + 248) |= 0x400000000uLL;
  }
}

- (void)_addNoFlagsRetainSearch:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 160);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 160);
      *(_QWORD *)(a1 + 160) = v5;

      v4 = *(void **)(a1 + 160);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (id)retainSearchAtIndex:(id *)a1
{
  id *v3;

  if (a1)
  {
    v3 = a1;
    -[GEOPDSearchResult _readRetainSearchs]((uint64_t)a1);
    objc_msgSend(v3[20], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)_readSearchResultSections
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 251) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchResultSections_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)searchResultSections
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchResult _readSearchResultSections]((uint64_t)a1);
    a1 = (id *)v1[22];
  }
  return a1;
}

- (void)addSearchResultSection:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchResult _readSearchResultSections](a1);
    -[GEOPDSearchResult _addNoFlagsSearchResultSection:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_QWORD *)(a1 + 248) |= 0x40000000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
    *(_QWORD *)(a1 + 248) |= 0x400000000uLL;
  }
}

- (void)_addNoFlagsSearchResultSection:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 176);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 176);
      *(_QWORD *)(a1 + 176) = v5;

      v4 = *(void **)(a1 + 176);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readRelatedEntitySections
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 250) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRelatedEntitySections_tags_5261);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)relatedEntitySections
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchResult _readRelatedEntitySections]((uint64_t)a1);
    a1 = (id *)v1[15];
  }
  return a1;
}

- (void)addRelatedEntitySection:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchResult _readRelatedEntitySections](a1);
    -[GEOPDSearchResult _addNoFlagsRelatedEntitySection:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_QWORD *)(a1 + 248) |= 0x800000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
    *(_QWORD *)(a1 + 248) |= 0x400000000uLL;
  }
}

- (void)_addNoFlagsRelatedEntitySection:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 120);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 120);
      *(_QWORD *)(a1 + 120) = v5;

      v4 = *(void **)(a1 + 120);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)addSearchTierMetadata:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 252) & 1) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchTierMetadatas_tags_5262);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
    -[GEOPDSearchResult _addNoFlagsSearchTierMetadata:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_QWORD *)(a1 + 248) |= 0x100000000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
    *(_QWORD *)(a1 + 248) |= 0x400000000uLL;
  }
}

- (void)_addNoFlagsSearchTierMetadata:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 192);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 192);
      *(_QWORD *)(a1 + 192) = v5;

      v4 = *(void **)(a1 + 192);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readResultRefinementGroup
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 251) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResultRefinementGroup_tags_5263);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)resultRefinementGroup
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchResult _readResultRefinementGroup]((uint64_t)a1);
    a1 = (id *)v1[19];
  }
  return a1;
}

- (void)setResultRefinementGroup:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 248) |= 0x408000000uLL;
  objc_storeStrong((id *)(a1 + 152), a2);

}

- (void)_readAutoRedoSearchThreshold
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 249) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAutoRedoSearchThreshold_tags_5264);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)autoRedoSearchThreshold
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchResult _readAutoRedoSearchThreshold]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setAutoRedoSearchThreshold:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 248) |= 0x400000800uLL;
  objc_storeStrong((id *)(a1 + 24), a2);

}

- (void)_readPlaceSummaryLayoutMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 250) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceSummaryLayoutMetadata_tags_5265);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)placeSummaryLayoutMetadata
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchResult _readPlaceSummaryLayoutMetadata]((uint64_t)a1);
    a1 = (id *)v1[13];
  }
  return a1;
}

- (void)setPlaceSummaryLayoutMetadata:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 248) |= 0x400200000uLL;
  objc_storeStrong((id *)(a1 + 104), a2);

}

- (void)_readSectionList
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 252) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSectionList_tags_5266);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)sectionList
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchResult _readSectionList]((uint64_t)a1);
    a1 = (id *)v1[25];
  }
  return a1;
}

- (void)setSectionList:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 248) |= 0x600000000uLL;
  objc_storeStrong((id *)(a1 + 200), a2);

}

- (uint64_t)searchResultViewType
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_QWORD *)(v1 + 248);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 216));
    if ((v2 & 0x10) != 0)
      return *(unsigned int *)(v1 + 236);
    else
      return 0;
  }
  return result;
}

- (void)_readSearchSessionData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 251) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchSessionData_tags_5267);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)searchSessionData
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchResult _readSearchSessionData]((uint64_t)a1);
    a1 = (id *)v1[23];
  }
  return a1;
}

- (void)setSearchSessionData:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 248) |= 0x480000000uLL;
  objc_storeStrong((id *)(a1 + 184), a2);

}

- (void)_readOpenPlaceCardForResultWithId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 250) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOpenPlaceCardForResultWithId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)openPlaceCardForResultWithId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchResult _readOpenPlaceCardForResultWithId]((uint64_t)a1);
    a1 = (id *)v1[11];
  }
  return a1;
}

- (void)setOpenPlaceCardForResultWithId:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 248) |= 0x400080000uLL;
  objc_storeStrong((id *)(a1 + 88), a2);

}

- (uint64_t)mapDisplayType
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_QWORD *)(v1 + 248);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 216));
    if ((v2 & 2) != 0)
      return *(unsigned int *)(v1 + 224);
    else
      return 0;
  }
  return result;
}

- (void)_readGuideSummaryLayoutMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 250) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGuideSummaryLayoutMetadata_tags_5268);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)guideSummaryLayoutMetadata
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchResult _readGuideSummaryLayoutMetadata]((uint64_t)a1);
    a1 = (id *)v1[10];
  }
  return a1;
}

- (void)setGuideSummaryLayoutMetadata:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 248) |= 0x400040000uLL;
  objc_storeStrong((id *)(a1 + 80), a2);

}

- (void)setPaginationInfo:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 248) |= 0x400100000uLL;
  objc_storeStrong((id *)(a1 + 96), a2);

}

- (void)_readRedoButtonThreshold
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    if ((*(_BYTE *)(a1 + 250) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRedoButtonThreshold_tags_5270);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

- (id)redoButtonThreshold
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchResult _readRedoButtonThreshold]((uint64_t)a1);
    a1 = (id *)v1[14];
  }
  return a1;
}

- (void)setRedoButtonThreshold:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 248) |= 0x400400000uLL;
  objc_storeStrong((id *)(a1 + 112), a2);

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
  v8.super_class = (Class)GEOPDSearchResult;
  -[GEOPDSearchResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  id v26;
  const __CFString *v27;
  uint64_t v28;
  __CFString *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  id v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  void *v48;
  id v49;
  const __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  const __CFString *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  const __CFString *v59;
  id v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t m;
  void *v66;
  id v67;
  const __CFString *v68;
  uint64_t v69;
  void *v70;
  const __CFString *v71;
  void *v72;
  const __CFString *v73;
  void *v74;
  const __CFString *v75;
  void *v76;
  const __CFString *v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t n;
  void *v83;
  id v84;
  const __CFString *v85;
  void *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t ii;
  void *v91;
  id v92;
  const __CFString *v93;
  void *v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t jj;
  void *v99;
  id v100;
  const __CFString *v101;
  void *v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t kk;
  void *v107;
  id v108;
  const __CFString *v109;
  void *v110;
  void *v111;
  void *v112;
  const __CFString *v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  const __CFString *v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  const __CFString *v123;
  id v124;
  void *v125;
  void *v126;
  void *v127;
  const __CFString *v128;
  id v129;
  uint64_t v130;
  void *v131;
  const __CFString *v132;
  uint64_t v133;
  __CFString *v134;
  const __CFString *v135;
  void *v136;
  const __CFString *v137;
  void *v138;
  void *v139;
  void *v140;
  const __CFString *v141;
  id v142;
  void *v143;
  void *v144;
  void *v145;
  const __CFString *v146;
  id v147;
  int v148;
  __CFString *v149;
  const __CFString *v150;
  void *v151;
  void *v152;
  void *v153;
  const __CFString *v154;
  id v155;
  void *v156;
  id v157;
  id v158;
  void *v159;
  void *v160;
  const __CFString *v161;
  id v162;
  void *v163;
  void *v164;
  void *v165;
  const __CFString *v166;
  id v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  id v172;
  id v173;
  id v174;
  _QWORD v176[4];
  id v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  _BYTE v210[128];
  _BYTE v211[128];
  _BYTE v212[128];
  _BYTE v213[128];
  _BYTE v214[128];
  _BYTE v215[128];
  _BYTE v216[128];
  _BYTE v217[128];
  uint64_t v218;

  v218 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDSearchResult readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchResult displayMapRegion]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("displayMapRegion");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("display_map_region");
    }
    v9 = v7;

    objc_msgSend(v4, "setObject:forKey:", v9, v8);
  }

  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v206 = 0u;
    v207 = 0u;
    v208 = 0u;
    v209 = 0u;
    v11 = *(id *)(a1 + 56);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v206, v217, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v207;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v207 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v206 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v15, "jsonRepresentation");
          else
            objc_msgSend(v15, "dictionaryRepresentation");
          v16 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "addObject:", v16);
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v206, v217, 16);
      }
      while (v12);
    }

    if (a2)
      v17 = CFSTR("disambiguationLabel");
    else
      v17 = CFSTR("disambiguation_label");
    objc_msgSend(v4, "setObject:forKey:", v10, v17);

  }
  if ((*(_BYTE *)(a1 + 249) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 243));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v19 = CFSTR("isChainResultSet");
    else
      v19 = CFSTR("is_chain_result_set");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  if (objc_msgSend(*(id *)(a1 + 128), "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 128), "count"));
    v204 = 0u;
    v205 = 0u;
    v202 = 0u;
    v203 = 0u;
    v21 = *(id *)(a1 + 128);
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v202, v216, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v203;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v203 != v23)
            objc_enumerationMutation(v21);
          v25 = *(void **)(*((_QWORD *)&v202 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v25, "jsonRepresentation");
          else
            objc_msgSend(v25, "dictionaryRepresentation");
          v26 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "addObject:", v26);
        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v202, v216, 16);
      }
      while (v22);
    }

    if (a2)
      v27 = CFSTR("relatedSearchSuggestion");
    else
      v27 = CFSTR("related_search_suggestion");
    objc_msgSend(v4, "setObject:forKey:", v20, v27);

  }
  if ((*(_BYTE *)(a1 + 248) & 8) != 0)
  {
    v28 = *(int *)(a1 + 232);
    if (v28 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 232));
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_1E1C050F0[v28];
    }
    if (a2)
      v30 = CFSTR("searchResultType");
    else
      v30 = CFSTR("search_result_type");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
  -[GEOPDSearchResult resultDisplayHeader]((id *)a1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    if (a2)
      v32 = CFSTR("resultDisplayHeader");
    else
      v32 = CFSTR("result_display_header");
    objc_msgSend(v4, "setObject:forKey:", v31, v32);
  }

  -[GEOPDSearchResult defaultRelatedSearchSuggestion]((id *)a1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v33, "jsonRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("defaultRelatedSearchSuggestion");
    }
    else
    {
      objc_msgSend(v33, "dictionaryRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("default_related_search_suggestion");
    }
    v37 = v35;

    objc_msgSend(v4, "setObject:forKey:", v37, v36);
  }

  -[GEOPDSearchResult searchClientBehavior]((id *)a1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v38)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v38, "jsonRepresentation");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = CFSTR("searchClientBehavior");
    }
    else
    {
      objc_msgSend(v38, "dictionaryRepresentation");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = CFSTR("search_client_behavior");
    }
    v42 = v40;

    objc_msgSend(v4, "setObject:forKey:", v42, v41);
  }

  if (objc_msgSend(*(id *)(a1 + 136), "count"))
  {
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 136), "count"));
    v200 = 0u;
    v201 = 0u;
    v198 = 0u;
    v199 = 0u;
    v44 = *(id *)(a1 + 136);
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v198, v215, 16);
    if (v45)
    {
      v46 = *(_QWORD *)v199;
      do
      {
        for (k = 0; k != v45; ++k)
        {
          if (*(_QWORD *)v199 != v46)
            objc_enumerationMutation(v44);
          v48 = *(void **)(*((_QWORD *)&v198 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v48, "jsonRepresentation");
          else
            objc_msgSend(v48, "dictionaryRepresentation");
          v49 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v43, "addObject:", v49);
        }
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v198, v215, 16);
      }
      while (v45);
    }

    if (a2)
      v50 = CFSTR("resultDetourInfo");
    else
      v50 = CFSTR("result_detour_info");
    objc_msgSend(v4, "setObject:forKey:", v43, v50);

  }
  -[GEOPDSearchResult directionIntent]((id *)a1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51;
  if (v51)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v51, "jsonRepresentation");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = CFSTR("directionIntent");
    }
    else
    {
      objc_msgSend(v51, "dictionaryRepresentation");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = CFSTR("direction_intent");
    }
    v55 = v53;

    objc_msgSend(v4, "setObject:forKey:", v55, v54);
  }

  -[GEOPDSearchResult clientResolvedResult]((id *)a1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v56;
  if (v56)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v56, "jsonRepresentation");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = CFSTR("clientResolvedResult");
    }
    else
    {
      objc_msgSend(v56, "dictionaryRepresentation");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = CFSTR("client_resolved_result");
    }
    v60 = v58;

    objc_msgSend(v4, "setObject:forKey:", v60, v59);
  }

  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v196 = 0u;
    v197 = 0u;
    v194 = 0u;
    v195 = 0u;
    v62 = *(id *)(a1 + 64);
    v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v194, v214, 16);
    if (v63)
    {
      v64 = *(_QWORD *)v195;
      do
      {
        for (m = 0; m != v63; ++m)
        {
          if (*(_QWORD *)v195 != v64)
            objc_enumerationMutation(v62);
          v66 = *(void **)(*((_QWORD *)&v194 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v66, "jsonRepresentation");
          else
            objc_msgSend(v66, "dictionaryRepresentation");
          v67 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v61, "addObject:", v67);
        }
        v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v194, v214, 16);
      }
      while (v63);
    }

    if (a2)
      v68 = CFSTR("displayHeaderSubstitute");
    else
      v68 = CFSTR("display_header_substitute");
    objc_msgSend(v4, "setObject:forKey:", v61, v68);

  }
  v69 = *(_QWORD *)(a1 + 248);
  if ((v69 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 241));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v71 = CFSTR("enablePartialClientization");
    else
      v71 = CFSTR("enable_partial_clientization");
    objc_msgSend(v4, "setObject:forKey:", v70, v71);

    v69 = *(_QWORD *)(a1 + 248);
  }
  if ((v69 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 220));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v73 = CFSTR("dymSuggestionVisibleTime");
    else
      v73 = CFSTR("dym_suggestion_visible_time");
    objc_msgSend(v4, "setObject:forKey:", v72, v73);

    v69 = *(_QWORD *)(a1 + 248);
  }
  if ((v69 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 244));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v75 = CFSTR("showDymSuggestionCloseButton");
    else
      v75 = CFSTR("show_dym_suggestion_close_button");
    objc_msgSend(v4, "setObject:forKey:", v74, v75);

    v69 = *(_QWORD *)(a1 + 248);
  }
  if ((v69 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 228));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v77 = CFSTR("retainSearchTime");
    else
      v77 = CFSTR("retain_search_time");
    objc_msgSend(v4, "setObject:forKey:", v76, v77);

  }
  if (objc_msgSend(*(id *)(a1 + 160), "count"))
  {
    v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 160), "count"));
    v192 = 0u;
    v193 = 0u;
    v190 = 0u;
    v191 = 0u;
    v79 = *(id *)(a1 + 160);
    v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v190, v213, 16);
    if (v80)
    {
      v81 = *(_QWORD *)v191;
      do
      {
        for (n = 0; n != v80; ++n)
        {
          if (*(_QWORD *)v191 != v81)
            objc_enumerationMutation(v79);
          v83 = *(void **)(*((_QWORD *)&v190 + 1) + 8 * n);
          if ((a2 & 1) != 0)
            objc_msgSend(v83, "jsonRepresentation");
          else
            objc_msgSend(v83, "dictionaryRepresentation");
          v84 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v78, "addObject:", v84);
        }
        v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v190, v213, 16);
      }
      while (v80);
    }

    if (a2)
      v85 = CFSTR("retainSearch");
    else
      v85 = CFSTR("retain_search");
    objc_msgSend(v4, "setObject:forKey:", v78, v85);

  }
  if (objc_msgSend(*(id *)(a1 + 176), "count"))
  {
    v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 176), "count"));
    v188 = 0u;
    v189 = 0u;
    v186 = 0u;
    v187 = 0u;
    v87 = *(id *)(a1 + 176);
    v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v186, v212, 16);
    if (v88)
    {
      v89 = *(_QWORD *)v187;
      do
      {
        for (ii = 0; ii != v88; ++ii)
        {
          if (*(_QWORD *)v187 != v89)
            objc_enumerationMutation(v87);
          v91 = *(void **)(*((_QWORD *)&v186 + 1) + 8 * ii);
          if ((a2 & 1) != 0)
            objc_msgSend(v91, "jsonRepresentation");
          else
            objc_msgSend(v91, "dictionaryRepresentation");
          v92 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v86, "addObject:", v92);
        }
        v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v186, v212, 16);
      }
      while (v88);
    }

    if (a2)
      v93 = CFSTR("searchResultSection");
    else
      v93 = CFSTR("search_result_section");
    objc_msgSend(v4, "setObject:forKey:", v86, v93);

  }
  if (objc_msgSend(*(id *)(a1 + 120), "count"))
  {
    v94 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 120), "count"));
    v184 = 0u;
    v185 = 0u;
    v182 = 0u;
    v183 = 0u;
    v95 = *(id *)(a1 + 120);
    v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v182, v211, 16);
    if (v96)
    {
      v97 = *(_QWORD *)v183;
      do
      {
        for (jj = 0; jj != v96; ++jj)
        {
          if (*(_QWORD *)v183 != v97)
            objc_enumerationMutation(v95);
          v99 = *(void **)(*((_QWORD *)&v182 + 1) + 8 * jj);
          if ((a2 & 1) != 0)
            objc_msgSend(v99, "jsonRepresentation");
          else
            objc_msgSend(v99, "dictionaryRepresentation");
          v100 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v94, "addObject:", v100);
        }
        v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v182, v211, 16);
      }
      while (v96);
    }

    if (a2)
      v101 = CFSTR("relatedEntitySection");
    else
      v101 = CFSTR("related_entity_section");
    objc_msgSend(v4, "setObject:forKey:", v94, v101);

  }
  if (objc_msgSend(*(id *)(a1 + 192), "count"))
  {
    v102 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 192), "count"));
    v180 = 0u;
    v181 = 0u;
    v178 = 0u;
    v179 = 0u;
    v103 = *(id *)(a1 + 192);
    v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v178, v210, 16);
    if (v104)
    {
      v105 = *(_QWORD *)v179;
      do
      {
        for (kk = 0; kk != v104; ++kk)
        {
          if (*(_QWORD *)v179 != v105)
            objc_enumerationMutation(v103);
          v107 = *(void **)(*((_QWORD *)&v178 + 1) + 8 * kk);
          if ((a2 & 1) != 0)
            objc_msgSend(v107, "jsonRepresentation");
          else
            objc_msgSend(v107, "dictionaryRepresentation");
          v108 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v102, "addObject:", v108);
        }
        v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v178, v210, 16);
      }
      while (v104);
    }

    if (a2)
      v109 = CFSTR("searchTierMetadata");
    else
      v109 = CFSTR("search_tier_metadata");
    objc_msgSend(v4, "setObject:forKey:", v102, v109);

  }
  -[GEOPDSearchResult resultRefinementGroup]((id *)a1);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = v110;
  if (v110)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v110, "jsonRepresentation");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = CFSTR("resultRefinementGroup");
    }
    else
    {
      objc_msgSend(v110, "dictionaryRepresentation");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = CFSTR("result_refinement_group");
    }
    v114 = v112;

    objc_msgSend(v4, "setObject:forKey:", v114, v113);
  }

  -[GEOPDSearchResult autoRedoSearchThreshold]((id *)a1);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = v115;
  if (v115)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v115, "jsonRepresentation");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = CFSTR("autoRedoSearchThreshold");
    }
    else
    {
      objc_msgSend(v115, "dictionaryRepresentation");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = CFSTR("auto_redo_search_threshold");
    }
    v119 = v117;

    objc_msgSend(v4, "setObject:forKey:", v119, v118);
  }

  -[GEOPDSearchResult placeSummaryLayoutMetadata]((id *)a1);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = v120;
  if (v120)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v120, "jsonRepresentation");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = CFSTR("placeSummaryLayoutMetadata");
    }
    else
    {
      objc_msgSend(v120, "dictionaryRepresentation");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = CFSTR("place_summary_layout_metadata");
    }
    v124 = v122;

    objc_msgSend(v4, "setObject:forKey:", v124, v123);
  }

  -[GEOPDSearchResult sectionList]((id *)a1);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = v125;
  if (v125)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v125, "jsonRepresentation");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = CFSTR("sectionList");
    }
    else
    {
      objc_msgSend(v125, "dictionaryRepresentation");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = CFSTR("section_list");
    }
    v129 = v127;

    objc_msgSend(v4, "setObject:forKey:", v129, v128);
  }

  v130 = *(_QWORD *)(a1 + 248);
  if ((v130 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 240));
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v132 = CFSTR("disableAddingAdditionalPaddingOnViewport");
    else
      v132 = CFSTR("disable_adding_additional_padding_on_viewport");
    objc_msgSend(v4, "setObject:forKey:", v131, v132);

    v130 = *(_QWORD *)(a1 + 248);
  }
  if ((v130 & 0x10) != 0)
  {
    v133 = *(int *)(a1 + 236);
    if (v133 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 236));
      v134 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v134 = off_1E1C05118[v133];
    }
    if (a2)
      v135 = CFSTR("searchResultViewType");
    else
      v135 = CFSTR("search_result_view_type");
    objc_msgSend(v4, "setObject:forKey:", v134, v135);

    v130 = *(_QWORD *)(a1 + 248);
  }
  if ((v130 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 242));
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v137 = CFSTR("enableStructuredRapAffordance");
    else
      v137 = CFSTR("enable_structured_rap_affordance");
    objc_msgSend(v4, "setObject:forKey:", v136, v137);

  }
  -[GEOPDSearchResult searchSessionData]((id *)a1);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = v138;
  if (v138)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v138, "jsonRepresentation");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = CFSTR("searchSessionData");
    }
    else
    {
      objc_msgSend(v138, "dictionaryRepresentation");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = CFSTR("search_session_data");
    }
    v142 = v140;

    objc_msgSend(v4, "setObject:forKey:", v142, v141);
  }

  -[GEOPDSearchResult openPlaceCardForResultWithId]((id *)a1);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = v143;
  if (v143)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v143, "jsonRepresentation");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v146 = CFSTR("openPlaceCardForResultWithId");
    }
    else
    {
      objc_msgSend(v143, "dictionaryRepresentation");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v146 = CFSTR("open_place_card_for_result_with_id");
    }
    v147 = v145;

    objc_msgSend(v4, "setObject:forKey:", v147, v146);
  }

  if ((*(_BYTE *)(a1 + 248) & 2) != 0)
  {
    v148 = *(_DWORD *)(a1 + 224);
    if (v148)
    {
      if (v148 == 1)
      {
        v149 = CFSTR("TOPOGRAPHIC");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 224));
        v149 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v149 = CFSTR("DEFAULT");
    }
    if (a2)
      v150 = CFSTR("mapDisplayType");
    else
      v150 = CFSTR("map_display_type");
    objc_msgSend(v4, "setObject:forKey:", v149, v150);

  }
  -[GEOPDSearchResult guideSummaryLayoutMetadata]((id *)a1);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = v151;
  if (v151)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v151, "jsonRepresentation");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      v154 = CFSTR("guideSummaryLayoutMetadata");
    }
    else
    {
      objc_msgSend(v151, "dictionaryRepresentation");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      v154 = CFSTR("guide_summary_layout_metadata");
    }
    v155 = v153;

    objc_msgSend(v4, "setObject:forKey:", v155, v154);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
  if ((*(_BYTE *)(a1 + 250) & 0x10) == 0)
  {
    v156 = *(void **)(a1 + 8);
    if (v156)
    {
      v157 = v156;
      objc_sync_enter(v157);
      GEOPDSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPaginationInfo_tags_5269);
      objc_sync_exit(v157);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  v158 = *(id *)(a1 + 96);
  v159 = v158;
  if (v158)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v158, "jsonRepresentation");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      v161 = CFSTR("paginationInfo");
    }
    else
    {
      objc_msgSend(v158, "dictionaryRepresentation");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      v161 = CFSTR("pagination_info");
    }
    v162 = v160;

    objc_msgSend(v4, "setObject:forKey:", v162, v161);
  }

  -[GEOPDSearchResult redoButtonThreshold]((id *)a1);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = v163;
  if (v163)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v163, "jsonRepresentation");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      v166 = CFSTR("redoButtonThreshold");
    }
    else
    {
      objc_msgSend(v163, "dictionaryRepresentation");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      v166 = CFSTR("redo_button_threshold");
    }
    v167 = v165;

    objc_msgSend(v4, "setObject:forKey:", v167, v166);
  }

  v168 = *(void **)(a1 + 16);
  if (v168)
  {
    objc_msgSend(v168, "dictionaryRepresentation");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v170 = v169;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v169, "count"));
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      v176[0] = MEMORY[0x1E0C809B0];
      v176[1] = 3221225472;
      v176[2] = __47__GEOPDSearchResult__dictionaryRepresentation___block_invoke;
      v176[3] = &unk_1E1C00600;
      v172 = v171;
      v177 = v172;
      objc_msgSend(v170, "enumerateKeysAndObjectsUsingBlock:", v176);
      v173 = v172;

    }
    else
    {
      v173 = v169;
    }
    objc_msgSend(v4, "setObject:forKey:", v173, CFSTR("Unknown Fields"));

  }
  v174 = v4;

  return v174;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 216));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_5313;
      else
        v6 = (int *)&readAll__nonRecursiveTag_5314;
      GEOPDSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSearchResultCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 216));
  }
}

void __47__GEOPDSearchResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  id v6;
  const __CFString *v7;
  void *v8;
  unint64_t v9;
  GEOMapRegion *v10;
  GEOMapRegion *v11;
  GEOMapRegion *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  GEOPDMultiLocalizedString *v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  char v26;
  const __CFString *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  GEOPDRelatedSearchSuggestion *v35;
  void *v36;
  uint64_t v37;
  const __CFString *v38;
  void *v39;
  id v40;
  int v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  GEOPDRelatedSearchSuggestion *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  GEOPDSearchClientBehavior *v51;
  _BYTE *v52;
  const __CFString *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  uint64_t v60;
  GEOPDResultDetourInfo *v61;
  GEOPDResultDetourInfo *v62;
  GEOPDResultDetourInfo *v63;
  const __CFString *v64;
  void *v65;
  GEOPDDirectionIntent *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  GEOPDResolvedItem *v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const __CFString *v77;
  const __CFString *v78;
  uint64_t v79;
  void *v80;
  GEOPDDisplayHeaderSubstitute *v81;
  GEOPDDisplayHeaderSubstitute *v82;
  id v83;
  uint64_t v84;
  unint64_t v85;
  void *v86;
  id v87;
  int v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  GEOPDRelatedSearchSuggestion *v93;
  void *v94;
  id v95;
  uint64_t v96;
  const __CFString *v97;
  void *v98;
  char v99;
  const __CFString *v100;
  void *v101;
  int v102;
  const __CFString *v103;
  void *v104;
  char v105;
  const __CFString *v106;
  void *v107;
  int v108;
  const __CFString *v109;
  void *v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  GEOPDRetainedSearchMetadata *v117;
  void *v118;
  uint64_t v119;
  const __CFString *v120;
  void *v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  GEOPDSSearchResultSection *v128;
  void *v129;
  uint64_t v130;
  const __CFString *v131;
  void *v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  GEOPDRelatedEntitySection *v139;
  void *v140;
  uint64_t v141;
  const __CFString *v142;
  void *v143;
  id v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  GEOPDSSearchTierMetadata *v150;
  void *v151;
  uint64_t v152;
  const __CFString *v153;
  void *v154;
  GEOPDResultRefinementGroup *v155;
  void *v156;
  const __CFString *v157;
  void *v158;
  GEOPDSSearchAutoRedoThreshold *v159;
  void *v160;
  const __CFString *v161;
  void *v162;
  GEOPDPlaceSummaryLayoutMetadata *v163;
  GEOPDPlaceSummaryLayoutMetadata *v164;
  GEOPDPlaceSummaryLayoutMetadata *v165;
  const __CFString *v166;
  void *v167;
  GEOPDSearchSectionList *v168;
  void *v169;
  const __CFString *v170;
  void *v171;
  char v172;
  const __CFString *v173;
  void *v174;
  id v175;
  int v176;
  const __CFString *v177;
  void *v178;
  char v179;
  const __CFString *v180;
  void *v181;
  void *v182;
  const __CFString *v183;
  void *v184;
  GEOPDMapsIdentifier *v185;
  GEOPDMapsIdentifier *v186;
  GEOPDMapsIdentifier *v187;
  const __CFString *v188;
  void *v189;
  id v190;
  int v191;
  const __CFString *v192;
  void *v193;
  GEOPDGuideSummaryLayoutMetadata *v194;
  void *v195;
  const __CFString *v196;
  void *v197;
  GEOPDPaginationInfo *v198;
  void *v199;
  const __CFString *v200;
  void *v201;
  GEOPDSSearchRedoButtonThreshold *v202;
  void *v203;
  void *v205;
  id v206;
  const __CFString *v207;
  const __CFString *v208;
  id v209;
  const __CFString *v210;
  id obj;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  _BYTE v244[128];
  _BYTE v245[128];
  _BYTE v246[128];
  _BYTE v247[128];
  _BYTE v248[128];
  _BYTE v249[128];
  _BYTE v250[128];
  _BYTE v251[128];
  uint64_t v252;

  v252 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (id)objc_msgSend(a1, "init");

  if (!v6)
    goto LABEL_356;
  if (a3)
    v7 = CFSTR("displayMapRegion");
  else
    v7 = CFSTR("display_map_region");
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0x1E0C99000uLL;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = [GEOMapRegion alloc];
    if ((a3 & 1) != 0)
      v11 = -[GEOMapRegion initWithJSON:](v10, "initWithJSON:", v8);
    else
      v11 = -[GEOMapRegion initWithDictionary:](v10, "initWithDictionary:", v8);
    v12 = v11;
    -[GEOPDSearchResult setDisplayMapRegion:]((uint64_t)v6, v11);

  }
  if (a3)
    v13 = CFSTR("disambiguationLabel");
  else
    v13 = CFSTR("disambiguation_label");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v206 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v242 = 0u;
    v243 = 0u;
    v240 = 0u;
    v241 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v240, v251, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v241;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v241 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v240 + 1) + 8 * v19);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = [GEOPDMultiLocalizedString alloc];
            if (v21)
              v22 = (void *)-[GEOPDMultiLocalizedString _initWithDictionary:isJSON:](v21, v20, a3);
            else
              v22 = 0;
            -[GEOPDSearchResult addDisambiguationLabel:]((uint64_t)v6, v22);

          }
          ++v19;
        }
        while (v17 != v19);
        v23 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v240, v251, 16);
        v17 = v23;
      }
      while (v23);
    }

    v5 = v206;
  }

  if (a3)
    v24 = CFSTR("isChainResultSet");
  else
    v24 = CFSTR("is_chain_result_set");
  objc_msgSend(v5, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = objc_msgSend(v25, "BOOLValue");
    *((_QWORD *)v6 + 31) |= 0x400000100uLL;
    *((_BYTE *)v6 + 243) = v26;
  }

  if (a3)
    v27 = CFSTR("relatedSearchSuggestion");
  else
    v27 = CFSTR("related_search_suggestion");
  v210 = v27;
  objc_msgSend(v5, "objectForKeyedSubscript:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v238 = 0u;
    v239 = 0u;
    v236 = 0u;
    v237 = 0u;
    v29 = v28;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v236, v250, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v237;
      do
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v237 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v236 + 1) + 8 * v33);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v35 = [GEOPDRelatedSearchSuggestion alloc];
            if (v35)
              v36 = -[GEOPDRelatedSearchSuggestion _initWithDictionary:isJSON:](v35, v34, a3);
            else
              v36 = 0;
            -[GEOPDSearchResult addRelatedSearchSuggestion:]((uint64_t)v6, v36);

          }
          ++v33;
        }
        while (v31 != v33);
        v37 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v236, v250, 16);
        v31 = v37;
      }
      while (v37);
    }

    v5 = v206;
  }

  if (a3)
    v38 = CFSTR("searchResultType");
  else
    v38 = CFSTR("search_result_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v40 = v39;
    if ((objc_msgSend(v40, "isEqualToString:", CFSTR("SEARCH_RESULT_TYPE_UNKNOWN")) & 1) != 0)
    {
      v41 = 0;
    }
    else if ((objc_msgSend(v40, "isEqualToString:", CFSTR("SEARCH_RESULT_TYPE_DEFAULT")) & 1) != 0)
    {
      v41 = 1;
    }
    else if ((objc_msgSend(v40, "isEqualToString:", CFSTR("SEARCH_RESULT_TYPE_NO_RESULT")) & 1) != 0)
    {
      v41 = 2;
    }
    else if ((objc_msgSend(v40, "isEqualToString:", CFSTR("SEARCH_RESULT_TYPE_WITH_HINT")) & 1) != 0)
    {
      v41 = 3;
    }
    else if (objc_msgSend(v40, "isEqualToString:", CFSTR("SEARCH_RESULT_TYPE_DYM")))
    {
      v41 = 4;
    }
    else
    {
      v41 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_70;
    v41 = objc_msgSend(v39, "intValue");
  }
  *((_QWORD *)v6 + 31) |= 0x400000008uLL;
  *((_DWORD *)v6 + 58) = v41;
LABEL_70:

  if (a3)
    v42 = CFSTR("resultDisplayHeader");
  else
    v42 = CFSTR("result_display_header");
  objc_msgSend(v5, "objectForKeyedSubscript:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v44 = (void *)objc_msgSend(v43, "copy");
    -[GEOPDSearchResult setResultDisplayHeader:]((uint64_t)v6, v44);

  }
  if (a3)
    v45 = CFSTR("defaultRelatedSearchSuggestion");
  else
    v45 = CFSTR("default_related_search_suggestion");
  objc_msgSend(v5, "objectForKeyedSubscript:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v47 = [GEOPDRelatedSearchSuggestion alloc];
    if (v47)
      v48 = -[GEOPDRelatedSearchSuggestion _initWithDictionary:isJSON:](v47, v46, a3);
    else
      v48 = 0;
    -[GEOPDSearchResult setDefaultRelatedSearchSuggestion:]((uint64_t)v6, v48);

  }
  if (a3)
    v49 = CFSTR("searchClientBehavior");
  else
    v49 = CFSTR("search_client_behavior");
  objc_msgSend(v5, "objectForKeyedSubscript:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v51 = [GEOPDSearchClientBehavior alloc];
    if (v51)
      v52 = -[GEOPDSearchClientBehavior _initWithDictionary:isJSON:](v51, v50, a3);
    else
      v52 = 0;
    -[GEOPDSearchResult setSearchClientBehavior:]((uint64_t)v6, v52);

  }
  if (a3)
    v53 = CFSTR("resultDetourInfo");
  else
    v53 = CFSTR("result_detour_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v234 = 0u;
    v235 = 0u;
    v232 = 0u;
    v233 = 0u;
    v55 = v54;
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v232, v249, 16);
    if (v56)
    {
      v57 = v56;
      v58 = *(_QWORD *)v233;
      do
      {
        for (i = 0; i != v57; ++i)
        {
          if (*(_QWORD *)v233 != v58)
            objc_enumerationMutation(v55);
          v60 = *(_QWORD *)(*((_QWORD *)&v232 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v61 = [GEOPDResultDetourInfo alloc];
            if ((a3 & 1) != 0)
              v62 = -[GEOPDResultDetourInfo initWithJSON:](v61, "initWithJSON:", v60);
            else
              v62 = -[GEOPDResultDetourInfo initWithDictionary:](v61, "initWithDictionary:", v60);
            v63 = v62;
            -[GEOPDSearchResult addResultDetourInfo:]((uint64_t)v6, v62);

          }
        }
        v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v232, v249, 16);
      }
      while (v57);
    }

    v5 = v206;
  }

  if (a3)
    v64 = CFSTR("directionIntent");
  else
    v64 = CFSTR("direction_intent");
  objc_msgSend(v5, "objectForKeyedSubscript:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v66 = [GEOPDDirectionIntent alloc];
    if (v66)
      v67 = (void *)-[GEOPDDirectionIntent _initWithDictionary:isJSON:]((uint64_t)v66, v65, a3);
    else
      v67 = 0;
    -[GEOPDSearchResult setDirectionIntent:]((uint64_t)v6, v67);

  }
  if (a3)
    v68 = CFSTR("clientResolvedResult");
  else
    v68 = CFSTR("client_resolved_result");
  objc_msgSend(v5, "objectForKeyedSubscript:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v70 = [GEOPDResolvedItem alloc];
    if (v70)
      v71 = (void *)-[GEOPDResolvedItem _initWithDictionary:isJSON:]((uint64_t)v70, v69, a3);
    else
      v71 = 0;
    -[GEOPDSearchResult setClientResolvedResult:]((uint64_t)v6, v71);

  }
  if (a3)
    v72 = CFSTR("displayHeaderSubstitute");
  else
    v72 = CFSTR("display_header_substitute");
  objc_msgSend(v5, "objectForKeyedSubscript:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v230 = 0u;
    v231 = 0u;
    v228 = 0u;
    v229 = 0u;
    v205 = v73;
    obj = v73;
    v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v228, v248, 16);
    if (!v74)
      goto LABEL_163;
    v75 = v74;
    v76 = *(_QWORD *)v229;
    if (a3)
      v77 = CFSTR("substituteType");
    else
      v77 = CFSTR("substitute_type");
    v78 = CFSTR("interpreted_query");
    if (a3)
      v78 = CFSTR("interpretedQuery");
    v207 = v78;
    v208 = v77;
    v209 = v6;
    while (1)
    {
      v79 = 0;
      do
      {
        if (*(_QWORD *)v229 != v76)
          objc_enumerationMutation(obj);
        v80 = *(void **)(*((_QWORD *)&v228 + 1) + 8 * v79);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v81 = [GEOPDDisplayHeaderSubstitute alloc];
          if (v81)
          {
            v82 = v81;
            v83 = v80;
            v84 = -[GEOPDDisplayHeaderSubstitute init](v82, "init");
            if (v84)
            {
              v85 = v9;
              objc_msgSend(v83, "objectForKeyedSubscript:", v208);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v87 = v86;
                if ((objc_msgSend(v87, "isEqualToString:", CFSTR("SUBSTITUTE_TYPE_UNKNOWN")) & 1) != 0)
                {
                  v88 = 0;
                }
                else if ((objc_msgSend(v87, "isEqualToString:", CFSTR("SUBSTITUTE_TYPE_INTERPRETED_QUERY")) & 1) != 0)
                {
                  v88 = 1;
                }
                else if (objc_msgSend(v87, "isEqualToString:", CFSTR("SUBSTITUTE_TYPE_RELATED_SEARCH_SUGGESTION")))
                {
                  v88 = 2;
                }
                else
                {
                  v88 = 0;
                }

LABEL_148:
                *(_BYTE *)(v84 + 56) |= 0x10u;
                *(_BYTE *)(v84 + 56) |= 1u;
                *(_DWORD *)(v84 + 52) = v88;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v88 = objc_msgSend(v86, "intValue");
                  goto LABEL_148;
                }
              }

              objc_msgSend(v83, "objectForKeyedSubscript:", v207);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v90 = (void *)objc_msgSend(v89, "copy");
                v91 = v90;
                *(_BYTE *)(v84 + 56) |= 4u;
                *(_BYTE *)(v84 + 56) |= 0x10u;
                objc_storeStrong((id *)(v84 + 24), v90);

              }
              objc_msgSend(v83, "objectForKeyedSubscript:", v210);
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v93 = [GEOPDRelatedSearchSuggestion alloc];
                if (v93)
                  v94 = -[GEOPDRelatedSearchSuggestion _initWithDictionary:isJSON:](v93, v92, a3);
                else
                  v94 = 0;
                v95 = v94;
                *(_BYTE *)(v84 + 56) |= 8u;
                *(_BYTE *)(v84 + 56) |= 0x10u;
                objc_storeStrong((id *)(v84 + 32), v94);

              }
              v6 = v209;
              v9 = v85;
            }

          }
          else
          {
            v84 = 0;
          }
          -[GEOPDSearchResult addDisplayHeaderSubstitute:]((uint64_t)v6, (void *)v84);

        }
        ++v79;
      }
      while (v75 != v79);
      v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v228, v248, 16);
      v75 = v96;
      if (!v96)
      {
LABEL_163:

        v73 = v205;
        v5 = v206;
        break;
      }
    }
  }

  if (a3)
    v97 = CFSTR("enablePartialClientization");
  else
    v97 = CFSTR("enable_partial_clientization");
  objc_msgSend(v5, "objectForKeyedSubscript:", v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v99 = objc_msgSend(v98, "BOOLValue");
    *((_QWORD *)v6 + 31) |= 0x400000040uLL;
    *((_BYTE *)v6 + 241) = v99;
  }

  if (a3)
    v100 = CFSTR("dymSuggestionVisibleTime");
  else
    v100 = CFSTR("dym_suggestion_visible_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v102 = objc_msgSend(v101, "unsignedIntValue");
    *((_QWORD *)v6 + 31) |= 0x400000001uLL;
    *((_DWORD *)v6 + 55) = v102;
  }

  if (a3)
    v103 = CFSTR("showDymSuggestionCloseButton");
  else
    v103 = CFSTR("show_dym_suggestion_close_button");
  objc_msgSend(v5, "objectForKeyedSubscript:", v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v105 = objc_msgSend(v104, "BOOLValue");
    *((_QWORD *)v6 + 31) |= 0x400000200uLL;
    *((_BYTE *)v6 + 244) = v105;
  }

  if (a3)
    v106 = CFSTR("retainSearchTime");
  else
    v106 = CFSTR("retain_search_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v108 = objc_msgSend(v107, "unsignedIntValue");
    *((_QWORD *)v6 + 31) |= 0x400000004uLL;
    *((_DWORD *)v6 + 57) = v108;
  }

  if (a3)
    v109 = CFSTR("retainSearch");
  else
    v109 = CFSTR("retain_search");
  objc_msgSend(v5, "objectForKeyedSubscript:", v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v226 = 0u;
    v227 = 0u;
    v224 = 0u;
    v225 = 0u;
    v111 = v110;
    v112 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v224, v247, 16);
    if (v112)
    {
      v113 = v112;
      v114 = *(_QWORD *)v225;
      do
      {
        v115 = 0;
        do
        {
          if (*(_QWORD *)v225 != v114)
            objc_enumerationMutation(v111);
          v116 = *(void **)(*((_QWORD *)&v224 + 1) + 8 * v115);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v117 = [GEOPDRetainedSearchMetadata alloc];
            if (v117)
              v118 = (void *)-[GEOPDRetainedSearchMetadata _initWithDictionary:isJSON:]((uint64_t)v117, v116, a3);
            else
              v118 = 0;
            -[GEOPDSearchResult addRetainSearch:]((uint64_t)v6, v118);

          }
          ++v115;
        }
        while (v113 != v115);
        v119 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v224, v247, 16);
        v113 = v119;
      }
      while (v119);
    }

    v5 = v206;
  }

  if (a3)
    v120 = CFSTR("searchResultSection");
  else
    v120 = CFSTR("search_result_section");
  objc_msgSend(v5, "objectForKeyedSubscript:", v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v222 = 0u;
    v223 = 0u;
    v220 = 0u;
    v221 = 0u;
    v122 = v121;
    v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v220, v246, 16);
    if (v123)
    {
      v124 = v123;
      v125 = *(_QWORD *)v221;
      do
      {
        v126 = 0;
        do
        {
          if (*(_QWORD *)v221 != v125)
            objc_enumerationMutation(v122);
          v127 = *(void **)(*((_QWORD *)&v220 + 1) + 8 * v126);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v128 = [GEOPDSSearchResultSection alloc];
            if (v128)
              v129 = (void *)-[GEOPDSSearchResultSection _initWithDictionary:isJSON:]((uint64_t)v128, v127, a3);
            else
              v129 = 0;
            -[GEOPDSearchResult addSearchResultSection:]((uint64_t)v6, v129);

          }
          ++v126;
        }
        while (v124 != v126);
        v130 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v220, v246, 16);
        v124 = v130;
      }
      while (v130);
    }

    v5 = v206;
  }

  if (a3)
    v131 = CFSTR("relatedEntitySection");
  else
    v131 = CFSTR("related_entity_section");
  objc_msgSend(v5, "objectForKeyedSubscript:", v131);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v218 = 0u;
    v219 = 0u;
    v216 = 0u;
    v217 = 0u;
    v133 = v132;
    v134 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v216, v245, 16);
    if (v134)
    {
      v135 = v134;
      v136 = *(_QWORD *)v217;
      do
      {
        v137 = 0;
        do
        {
          if (*(_QWORD *)v217 != v136)
            objc_enumerationMutation(v133);
          v138 = *(void **)(*((_QWORD *)&v216 + 1) + 8 * v137);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v139 = [GEOPDRelatedEntitySection alloc];
            if (v139)
              v140 = (void *)-[GEOPDRelatedEntitySection _initWithDictionary:isJSON:]((uint64_t)v139, v138, a3);
            else
              v140 = 0;
            -[GEOPDSearchResult addRelatedEntitySection:]((uint64_t)v6, v140);

          }
          ++v137;
        }
        while (v135 != v137);
        v141 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v216, v245, 16);
        v135 = v141;
      }
      while (v141);
    }

    v5 = v206;
  }

  if (a3)
    v142 = CFSTR("searchTierMetadata");
  else
    v142 = CFSTR("search_tier_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v142);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v214 = 0u;
    v215 = 0u;
    v212 = 0u;
    v213 = 0u;
    v144 = v143;
    v145 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v212, v244, 16);
    if (v145)
    {
      v146 = v145;
      v147 = *(_QWORD *)v213;
      do
      {
        v148 = 0;
        do
        {
          if (*(_QWORD *)v213 != v147)
            objc_enumerationMutation(v144);
          v149 = *(void **)(*((_QWORD *)&v212 + 1) + 8 * v148);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v150 = [GEOPDSSearchTierMetadata alloc];
            if (v150)
              v151 = (void *)-[GEOPDSSearchTierMetadata _initWithDictionary:isJSON:]((uint64_t)v150, v149, a3);
            else
              v151 = 0;
            -[GEOPDSearchResult addSearchTierMetadata:]((uint64_t)v6, v151);

          }
          ++v148;
        }
        while (v146 != v148);
        v152 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v212, v244, 16);
        v146 = v152;
      }
      while (v152);
    }

    v5 = v206;
  }

  if (a3)
    v153 = CFSTR("resultRefinementGroup");
  else
    v153 = CFSTR("result_refinement_group");
  objc_msgSend(v5, "objectForKeyedSubscript:", v153);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v155 = [GEOPDResultRefinementGroup alloc];
    if (v155)
      v156 = -[GEOPDResultRefinementGroup _initWithDictionary:isJSON:](v155, v154, a3);
    else
      v156 = 0;
    -[GEOPDSearchResult setResultRefinementGroup:]((uint64_t)v6, v156);

  }
  if (a3)
    v157 = CFSTR("autoRedoSearchThreshold");
  else
    v157 = CFSTR("auto_redo_search_threshold");
  objc_msgSend(v5, "objectForKeyedSubscript:", v157);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v159 = [GEOPDSSearchAutoRedoThreshold alloc];
    if (v159)
      v160 = (void *)-[GEOPDSSearchAutoRedoThreshold _initWithDictionary:isJSON:]((uint64_t)v159, v158, a3);
    else
      v160 = 0;
    -[GEOPDSearchResult setAutoRedoSearchThreshold:]((uint64_t)v6, v160);

  }
  if (a3)
    v161 = CFSTR("placeSummaryLayoutMetadata");
  else
    v161 = CFSTR("place_summary_layout_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v161);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v163 = [GEOPDPlaceSummaryLayoutMetadata alloc];
    if ((a3 & 1) != 0)
      v164 = -[GEOPDPlaceSummaryLayoutMetadata initWithJSON:](v163, "initWithJSON:", v162);
    else
      v164 = -[GEOPDPlaceSummaryLayoutMetadata initWithDictionary:](v163, "initWithDictionary:", v162);
    v165 = v164;
    -[GEOPDSearchResult setPlaceSummaryLayoutMetadata:]((uint64_t)v6, v164);

  }
  if (a3)
    v166 = CFSTR("sectionList");
  else
    v166 = CFSTR("section_list");
  objc_msgSend(v5, "objectForKeyedSubscript:", v166);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v168 = [GEOPDSearchSectionList alloc];
    if (v168)
      v169 = (void *)-[GEOPDSearchSectionList _initWithDictionary:isJSON:](v168, v167, a3);
    else
      v169 = 0;
    -[GEOPDSearchResult setSectionList:]((uint64_t)v6, v169);

  }
  if (a3)
    v170 = CFSTR("disableAddingAdditionalPaddingOnViewport");
  else
    v170 = CFSTR("disable_adding_additional_padding_on_viewport");
  objc_msgSend(v5, "objectForKeyedSubscript:", v170);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v172 = objc_msgSend(v171, "BOOLValue");
    *((_QWORD *)v6 + 31) |= 0x400000020uLL;
    *((_BYTE *)v6 + 240) = v172;
  }

  if (a3)
    v173 = CFSTR("searchResultViewType");
  else
    v173 = CFSTR("search_result_view_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v173);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v175 = v174;
    if ((objc_msgSend(v175, "isEqualToString:", CFSTR("SEARCH_RESULT_VIEW_TYPE_DEFAULT")) & 1) != 0)
    {
      v176 = 0;
    }
    else if ((objc_msgSend(v175, "isEqualToString:", CFSTR("SEARCH_RESULT_VIEW_TYPE_RESULT_LIST")) & 1) != 0)
    {
      v176 = 1;
    }
    else if (objc_msgSend(v175, "isEqualToString:", CFSTR("SEARCH_RESULT_VIEW_TYPE_PLACE_CARD")))
    {
      v176 = 2;
    }
    else
    {
      v176 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_305;
    v176 = objc_msgSend(v174, "intValue");
  }
  *((_QWORD *)v6 + 31) |= 0x400000010uLL;
  *((_DWORD *)v6 + 59) = v176;
LABEL_305:

  if (a3)
    v177 = CFSTR("enableStructuredRapAffordance");
  else
    v177 = CFSTR("enable_structured_rap_affordance");
  objc_msgSend(v5, "objectForKeyedSubscript:", v177);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v179 = objc_msgSend(v178, "BOOLValue");
    *((_QWORD *)v6 + 31) |= 0x400000080uLL;
    *((_BYTE *)v6 + 242) = v179;
  }

  if (a3)
    v180 = CFSTR("searchSessionData");
  else
    v180 = CFSTR("search_session_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v180);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v182 = -[GEOACResult _initWithDictionary:isJSON:]([GEOPDSSearchSessionData alloc], v181);
    -[GEOPDSearchResult setSearchSessionData:]((uint64_t)v6, v182);

  }
  if (a3)
    v183 = CFSTR("openPlaceCardForResultWithId");
  else
    v183 = CFSTR("open_place_card_for_result_with_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v183);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v185 = [GEOPDMapsIdentifier alloc];
    if ((a3 & 1) != 0)
      v186 = -[GEOPDMapsIdentifier initWithJSON:](v185, "initWithJSON:", v184);
    else
      v186 = -[GEOPDMapsIdentifier initWithDictionary:](v185, "initWithDictionary:", v184);
    v187 = v186;
    -[GEOPDSearchResult setOpenPlaceCardForResultWithId:]((uint64_t)v6, v186);

  }
  if (a3)
    v188 = CFSTR("mapDisplayType");
  else
    v188 = CFSTR("map_display_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v188);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v190 = v189;
    if ((objc_msgSend(v190, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
      v191 = 0;
    else
      v191 = objc_msgSend(v190, "isEqualToString:", CFSTR("TOPOGRAPHIC"));

    goto LABEL_333;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v191 = objc_msgSend(v189, "intValue");
LABEL_333:
    *((_QWORD *)v6 + 31) |= 0x400000002uLL;
    *((_DWORD *)v6 + 56) = v191;
  }

  if (a3)
    v192 = CFSTR("guideSummaryLayoutMetadata");
  else
    v192 = CFSTR("guide_summary_layout_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v192);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v194 = [GEOPDGuideSummaryLayoutMetadata alloc];
    if (v194)
      v195 = (void *)-[GEOPDGuideSummaryLayoutMetadata _initWithDictionary:isJSON:]((uint64_t)v194, v193, a3);
    else
      v195 = 0;
    -[GEOPDSearchResult setGuideSummaryLayoutMetadata:]((uint64_t)v6, v195);

  }
  if (a3)
    v196 = CFSTR("paginationInfo");
  else
    v196 = CFSTR("pagination_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v196);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v198 = [GEOPDPaginationInfo alloc];
    if (v198)
      v199 = (void *)-[GEOPDPaginationInfo _initWithDictionary:isJSON:](v198, v197, a3);
    else
      v199 = 0;
    -[GEOPDSearchResult setPaginationInfo:]((uint64_t)v6, v199);

  }
  if (a3)
    v200 = CFSTR("redoButtonThreshold");
  else
    v200 = CFSTR("redo_button_threshold");
  objc_msgSend(v5, "objectForKeyedSubscript:", v200);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v202 = [GEOPDSSearchRedoButtonThreshold alloc];
    if (v202)
      v203 = (void *)-[GEOPDSSearchRedoButtonThreshold _initWithDictionary:isJSON:]((uint64_t)v202, v201, a3);
    else
      v203 = 0;
    -[GEOPDSearchResult setRedoButtonThreshold:]((uint64_t)v6, v203);

  }
LABEL_356:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchResultReadAllFrom((uint64_t)self, a3, 0);
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
  $A1FAD422473D1390BB4F551D8B8DF0D1 flags;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  $A1FAD422473D1390BB4F551D8B8DF0D1 v39;
  PBDataReader *v40;
  void *v41;
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
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchResultIsDirty((uint64_t)self) & 1) == 0)
  {
    v40 = self->_reader;
    objc_sync_enter(v40);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v41);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v40);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchResult readAll:]((uint64_t)self, 0);
    if (self->_displayMapRegion)
      PBDataWriterWriteSubmessage();
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v6 = self->_disambiguationLabels;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v71;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v71 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
      }
      while (v7);
    }

    if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
      PBDataWriterWriteBOOLField();
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v10 = self->_relatedSearchSuggestions;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v67;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v67 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
      }
      while (v11);
    }

    if ((*(_BYTE *)&self->_flags & 8) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_resultDisplayHeader)
      PBDataWriterWriteStringField();
    if (self->_defaultRelatedSearchSuggestion)
      PBDataWriterWriteSubmessage();
    if (self->_searchClientBehavior)
      PBDataWriterWriteSubmessage();
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v14 = self->_resultDetourInfos;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v63;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v63 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
      }
      while (v15);
    }

    if (self->_directionIntent)
      PBDataWriterWriteSubmessage();
    if (self->_clientResolvedResult)
      PBDataWriterWriteSubmessage();
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v18 = self->_displayHeaderSubstitutes;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v58, v78, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v59;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v59 != v20)
            objc_enumerationMutation(v18);
          PBDataWriterWriteSubmessage();
          ++v21;
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v58, v78, 16);
      }
      while (v19);
    }

    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x40) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = self->_flags;
    }
    if ((*(_WORD *)&flags & 0x200) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 4) != 0)
      PBDataWriterWriteUint32Field();
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v23 = self->_retainSearchs;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v54, v77, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v55;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v55 != v25)
            objc_enumerationMutation(v23);
          PBDataWriterWriteSubmessage();
          ++v26;
        }
        while (v24 != v26);
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v54, v77, 16);
      }
      while (v24);
    }

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v27 = self->_searchResultSections;
    v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v50, v76, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v51;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v51 != v29)
            objc_enumerationMutation(v27);
          PBDataWriterWriteSubmessage();
          ++v30;
        }
        while (v28 != v30);
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v50, v76, 16);
      }
      while (v28);
    }

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v31 = self->_relatedEntitySections;
    v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v46, v75, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v47;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v47 != v33)
            objc_enumerationMutation(v31);
          PBDataWriterWriteSubmessage();
          ++v34;
        }
        while (v32 != v34);
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v46, v75, 16);
      }
      while (v32);
    }

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v35 = self->_searchTierMetadatas;
    v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v42, v74, 16);
    if (v36)
    {
      v37 = *(_QWORD *)v43;
      do
      {
        v38 = 0;
        do
        {
          if (*(_QWORD *)v43 != v37)
            objc_enumerationMutation(v35);
          PBDataWriterWriteSubmessage();
          ++v38;
        }
        while (v36 != v38);
        v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v42, v74, 16);
      }
      while (v36);
    }

    if (self->_resultRefinementGroup)
      PBDataWriterWriteSubmessage();
    if (self->_autoRedoSearchThreshold)
      PBDataWriterWriteSubmessage();
    if (self->_placeSummaryLayoutMetadata)
      PBDataWriterWriteSubmessage();
    if (self->_sectionList)
      PBDataWriterWriteSubmessage();
    v39 = self->_flags;
    if ((*(_BYTE *)&v39 & 0x20) != 0)
    {
      PBDataWriterWriteBOOLField();
      v39 = self->_flags;
    }
    if ((*(_BYTE *)&v39 & 0x10) != 0)
    {
      PBDataWriterWriteInt32Field();
      v39 = self->_flags;
    }
    if ((*(_BYTE *)&v39 & 0x80) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_searchSessionData)
      PBDataWriterWriteSubmessage();
    if (self->_openPlaceCardForResultWithId)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_guideSummaryLayoutMetadata)
      PBDataWriterWriteSubmessage();
    if (self->_paginationInfo)
      PBDataWriterWriteSubmessage();
    if (self->_redoButtonThreshold)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v42);
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
  id v23;
  void *v24;
  id v25;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  void *v40;
  $A1FAD422473D1390BB4F551D8B8DF0D1 flags;
  NSMutableArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t n;
  void *v46;
  NSMutableArray *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t ii;
  void *v51;
  NSMutableArray *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t jj;
  void *v56;
  NSMutableArray *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t kk;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  $A1FAD422473D1390BB4F551D8B8DF0D1 v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  PBUnknownFields *v81;
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
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 4) & 4) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSearchResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_77;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchResult readAll:]((uint64_t)self, 0);
  v9 = -[GEOMapRegion copyWithZone:](self->_displayMapRegion, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v9;

  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v11 = self->_disambiguationLabels;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v111, v122, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v112;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v112 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v111 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDSearchResult addDisambiguationLabel:](v5, v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v111, v122, 16);
    }
    while (v12);
  }

  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    *(_BYTE *)(v5 + 243) = self->_isChainResultSet;
    *(_QWORD *)(v5 + 248) |= 0x100uLL;
  }
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v16 = self->_relatedSearchSuggestions;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v107, v121, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v108;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v108 != v18)
          objc_enumerationMutation(v16);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * j), "copyWithZone:", a3);
        -[GEOPDSearchResult addRelatedSearchSuggestion:](v5, v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v107, v121, 16);
    }
    while (v17);
  }

  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 232) = self->_searchResultType;
    *(_QWORD *)(v5 + 248) |= 8uLL;
  }
  v21 = -[NSString copyWithZone:](self->_resultDisplayHeader, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v21;

  v23 = -[GEOPDRelatedSearchSuggestion copyWithZone:](self->_defaultRelatedSearchSuggestion, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v23;

  v25 = -[GEOPDSearchClientBehavior copyWithZone:](self->_searchClientBehavior, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v25;

  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v27 = self->_resultDetourInfos;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v103, v120, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v104;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v104 != v29)
          objc_enumerationMutation(v27);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * k), "copyWithZone:", a3);
        -[GEOPDSearchResult addResultDetourInfo:](v5, v31);

      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v103, v120, 16);
    }
    while (v28);
  }

  v32 = -[GEOPDDirectionIntent copyWithZone:](self->_directionIntent, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v32;

  v34 = -[GEOPDResolvedItem copyWithZone:](self->_clientResolvedResult, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v34;

  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v36 = self->_displayHeaderSubstitutes;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v99, v119, 16);
  if (v37)
  {
    v38 = *(_QWORD *)v100;
    do
    {
      for (m = 0; m != v37; ++m)
      {
        if (*(_QWORD *)v100 != v38)
          objc_enumerationMutation(v36);
        v40 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * m), "copyWithZone:", a3);
        -[GEOPDSearchResult addDisplayHeaderSubstitute:](v5, v40);

      }
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v99, v119, 16);
    }
    while (v37);
  }

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 241) = self->_enablePartialClientization;
    *(_QWORD *)(v5 + 248) |= 0x40uLL;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) == 0)
    {
LABEL_39:
      if ((*(_WORD *)&flags & 0x200) == 0)
        goto LABEL_40;
      goto LABEL_80;
    }
  }
  else if ((*(_BYTE *)&flags & 1) == 0)
  {
    goto LABEL_39;
  }
  *(_DWORD *)(v5 + 220) = self->_dymSuggestionVisibleTime;
  *(_QWORD *)(v5 + 248) |= 1uLL;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_40:
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_42;
    goto LABEL_41;
  }
LABEL_80:
  *(_BYTE *)(v5 + 244) = self->_showDymSuggestionCloseButton;
  *(_QWORD *)(v5 + 248) |= 0x200uLL;
  if ((*(_QWORD *)&self->_flags & 4) != 0)
  {
LABEL_41:
    *(_DWORD *)(v5 + 228) = self->_retainSearchTime;
    *(_QWORD *)(v5 + 248) |= 4uLL;
  }
LABEL_42:
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v42 = self->_retainSearchs;
  v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v95, v118, 16);
  if (v43)
  {
    v44 = *(_QWORD *)v96;
    do
    {
      for (n = 0; n != v43; ++n)
      {
        if (*(_QWORD *)v96 != v44)
          objc_enumerationMutation(v42);
        v46 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * n), "copyWithZone:", a3);
        -[GEOPDSearchResult addRetainSearch:](v5, v46);

      }
      v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v95, v118, 16);
    }
    while (v43);
  }

  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v47 = self->_searchResultSections;
  v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v91, v117, 16);
  if (v48)
  {
    v49 = *(_QWORD *)v92;
    do
    {
      for (ii = 0; ii != v48; ++ii)
      {
        if (*(_QWORD *)v92 != v49)
          objc_enumerationMutation(v47);
        v51 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * ii), "copyWithZone:", a3);
        -[GEOPDSearchResult addSearchResultSection:](v5, v51);

      }
      v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v91, v117, 16);
    }
    while (v48);
  }

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v52 = self->_relatedEntitySections;
  v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v87, v116, 16);
  if (v53)
  {
    v54 = *(_QWORD *)v88;
    do
    {
      for (jj = 0; jj != v53; ++jj)
      {
        if (*(_QWORD *)v88 != v54)
          objc_enumerationMutation(v52);
        v56 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * jj), "copyWithZone:", a3);
        -[GEOPDSearchResult addRelatedEntitySection:](v5, v56);

      }
      v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v87, v116, 16);
    }
    while (v53);
  }

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v57 = self->_searchTierMetadatas;
  v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v83, v115, 16);
  if (v58)
  {
    v59 = *(_QWORD *)v84;
    do
    {
      for (kk = 0; kk != v58; ++kk)
      {
        if (*(_QWORD *)v84 != v59)
          objc_enumerationMutation(v57);
        v61 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * kk), "copyWithZone:", a3, (_QWORD)v83);
        -[GEOPDSearchResult addSearchTierMetadata:](v5, v61);

      }
      v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v83, v115, 16);
    }
    while (v58);
  }

  v62 = -[GEOPDResultRefinementGroup copyWithZone:](self->_resultRefinementGroup, "copyWithZone:", a3);
  v63 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v62;

  v64 = -[GEOPDSSearchAutoRedoThreshold copyWithZone:](self->_autoRedoSearchThreshold, "copyWithZone:", a3);
  v65 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v64;

  v66 = -[GEOPDPlaceSummaryLayoutMetadata copyWithZone:](self->_placeSummaryLayoutMetadata, "copyWithZone:", a3);
  v67 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v66;

  v68 = -[GEOPDSearchSectionList copyWithZone:](self->_sectionList, "copyWithZone:", a3);
  v69 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v68;

  v70 = self->_flags;
  if ((*(_BYTE *)&v70 & 0x20) == 0)
  {
    if ((*(_BYTE *)&v70 & 0x10) == 0)
      goto LABEL_72;
LABEL_83:
    *(_DWORD *)(v5 + 236) = self->_searchResultViewType;
    *(_QWORD *)(v5 + 248) |= 0x10uLL;
    if ((*(_QWORD *)&self->_flags & 0x80) == 0)
      goto LABEL_74;
    goto LABEL_73;
  }
  *(_BYTE *)(v5 + 240) = self->_disableAddingAdditionalPaddingOnViewport;
  *(_QWORD *)(v5 + 248) |= 0x20uLL;
  v70 = self->_flags;
  if ((*(_BYTE *)&v70 & 0x10) != 0)
    goto LABEL_83;
LABEL_72:
  if ((*(_BYTE *)&v70 & 0x80) != 0)
  {
LABEL_73:
    *(_BYTE *)(v5 + 242) = self->_enableStructuredRapAffordance;
    *(_QWORD *)(v5 + 248) |= 0x80uLL;
  }
LABEL_74:
  v71 = -[GEOPDSSearchSessionData copyWithZone:](self->_searchSessionData, "copyWithZone:", a3, (_QWORD)v83);
  v72 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v71;

  v73 = -[GEOPDMapsIdentifier copyWithZone:](self->_openPlaceCardForResultWithId, "copyWithZone:", a3);
  v74 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v73;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 224) = self->_mapDisplayType;
    *(_QWORD *)(v5 + 248) |= 2uLL;
  }
  v75 = -[GEOPDGuideSummaryLayoutMetadata copyWithZone:](self->_guideSummaryLayoutMetadata, "copyWithZone:", a3);
  v76 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v75;

  v77 = -[GEOPDPaginationInfo copyWithZone:](self->_paginationInfo, "copyWithZone:", a3);
  v78 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v77;

  v79 = -[GEOPDSSearchRedoButtonThreshold copyWithZone:](self->_redoButtonThreshold, "copyWithZone:", a3);
  v80 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v79;

  v81 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v81;
LABEL_77:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOMapRegion *displayMapRegion;
  NSMutableArray *disambiguationLabels;
  $A1FAD422473D1390BB4F551D8B8DF0D1 flags;
  uint64_t v8;
  NSMutableArray *relatedSearchSuggestions;
  NSString *resultDisplayHeader;
  GEOPDRelatedSearchSuggestion *defaultRelatedSearchSuggestion;
  GEOPDSearchClientBehavior *searchClientBehavior;
  NSMutableArray *resultDetourInfos;
  GEOPDDirectionIntent *directionIntent;
  GEOPDResolvedItem *clientResolvedResult;
  NSMutableArray *displayHeaderSubstitutes;
  $A1FAD422473D1390BB4F551D8B8DF0D1 v17;
  uint64_t v18;
  NSMutableArray *retainSearchs;
  NSMutableArray *searchResultSections;
  NSMutableArray *relatedEntitySections;
  NSMutableArray *searchTierMetadatas;
  GEOPDResultRefinementGroup *resultRefinementGroup;
  GEOPDSSearchAutoRedoThreshold *autoRedoSearchThreshold;
  GEOPDPlaceSummaryLayoutMetadata *placeSummaryLayoutMetadata;
  GEOPDSearchSectionList *sectionList;
  $A1FAD422473D1390BB4F551D8B8DF0D1 v27;
  uint64_t v28;
  GEOPDSSearchSessionData *searchSessionData;
  GEOPDMapsIdentifier *openPlaceCardForResultWithId;
  uint64_t v31;
  GEOPDGuideSummaryLayoutMetadata *guideSummaryLayoutMetadata;
  GEOPDPaginationInfo *paginationInfo;
  GEOPDSSearchRedoButtonThreshold *redoButtonThreshold;
  char v35;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_114;
  -[GEOPDSearchResult readAll:]((uint64_t)self, 1);
  -[GEOPDSearchResult readAll:]((uint64_t)v4, 1);
  displayMapRegion = self->_displayMapRegion;
  if ((unint64_t)displayMapRegion | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOMapRegion isEqual:](displayMapRegion, "isEqual:"))
      goto LABEL_114;
  }
  disambiguationLabels = self->_disambiguationLabels;
  if ((unint64_t)disambiguationLabels | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](disambiguationLabels, "isEqual:"))
      goto LABEL_114;
  }
  flags = self->_flags;
  v8 = *((_QWORD *)v4 + 31);
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0)
      goto LABEL_114;
    if (self->_isChainResultSet)
    {
      if (!*((_BYTE *)v4 + 243))
        goto LABEL_114;
    }
    else if (*((_BYTE *)v4 + 243))
    {
      goto LABEL_114;
    }
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_114;
  }
  relatedSearchSuggestions = self->_relatedSearchSuggestions;
  if ((unint64_t)relatedSearchSuggestions | *((_QWORD *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](relatedSearchSuggestions, "isEqual:"))
      goto LABEL_114;
    flags = self->_flags;
    v8 = *((_QWORD *)v4 + 31);
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_searchResultType != *((_DWORD *)v4 + 58))
      goto LABEL_114;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_114;
  }
  resultDisplayHeader = self->_resultDisplayHeader;
  if ((unint64_t)resultDisplayHeader | *((_QWORD *)v4 + 18)
    && !-[NSString isEqual:](resultDisplayHeader, "isEqual:"))
  {
    goto LABEL_114;
  }
  defaultRelatedSearchSuggestion = self->_defaultRelatedSearchSuggestion;
  if ((unint64_t)defaultRelatedSearchSuggestion | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDRelatedSearchSuggestion isEqual:](defaultRelatedSearchSuggestion, "isEqual:"))
      goto LABEL_114;
  }
  searchClientBehavior = self->_searchClientBehavior;
  if ((unint64_t)searchClientBehavior | *((_QWORD *)v4 + 21))
  {
    if (!-[GEOPDSearchClientBehavior isEqual:](searchClientBehavior, "isEqual:"))
      goto LABEL_114;
  }
  resultDetourInfos = self->_resultDetourInfos;
  if ((unint64_t)resultDetourInfos | *((_QWORD *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](resultDetourInfos, "isEqual:"))
      goto LABEL_114;
  }
  directionIntent = self->_directionIntent;
  if ((unint64_t)directionIntent | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPDDirectionIntent isEqual:](directionIntent, "isEqual:"))
      goto LABEL_114;
  }
  clientResolvedResult = self->_clientResolvedResult;
  if ((unint64_t)clientResolvedResult | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDResolvedItem isEqual:](clientResolvedResult, "isEqual:"))
      goto LABEL_114;
  }
  displayHeaderSubstitutes = self->_displayHeaderSubstitutes;
  if ((unint64_t)displayHeaderSubstitutes | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](displayHeaderSubstitutes, "isEqual:"))
      goto LABEL_114;
  }
  v17 = self->_flags;
  v18 = *((_QWORD *)v4 + 31);
  if ((*(_BYTE *)&v17 & 0x40) != 0)
  {
    if ((v18 & 0x40) == 0)
      goto LABEL_114;
    if (self->_enablePartialClientization)
    {
      if (!*((_BYTE *)v4 + 241))
        goto LABEL_114;
    }
    else if (*((_BYTE *)v4 + 241))
    {
      goto LABEL_114;
    }
  }
  else if ((v18 & 0x40) != 0)
  {
    goto LABEL_114;
  }
  if ((*(_BYTE *)&v17 & 1) != 0)
  {
    if ((v18 & 1) == 0 || self->_dymSuggestionVisibleTime != *((_DWORD *)v4 + 55))
      goto LABEL_114;
  }
  else if ((v18 & 1) != 0)
  {
    goto LABEL_114;
  }
  if ((*(_WORD *)&v17 & 0x200) != 0)
  {
    if ((v18 & 0x200) == 0)
      goto LABEL_114;
    if (self->_showDymSuggestionCloseButton)
    {
      if (!*((_BYTE *)v4 + 244))
        goto LABEL_114;
    }
    else if (*((_BYTE *)v4 + 244))
    {
      goto LABEL_114;
    }
  }
  else if ((v18 & 0x200) != 0)
  {
    goto LABEL_114;
  }
  if ((*(_BYTE *)&v17 & 4) != 0)
  {
    if ((v18 & 4) == 0 || self->_retainSearchTime != *((_DWORD *)v4 + 57))
      goto LABEL_114;
  }
  else if ((v18 & 4) != 0)
  {
    goto LABEL_114;
  }
  retainSearchs = self->_retainSearchs;
  if ((unint64_t)retainSearchs | *((_QWORD *)v4 + 20)
    && !-[NSMutableArray isEqual:](retainSearchs, "isEqual:"))
  {
    goto LABEL_114;
  }
  searchResultSections = self->_searchResultSections;
  if ((unint64_t)searchResultSections | *((_QWORD *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](searchResultSections, "isEqual:"))
      goto LABEL_114;
  }
  relatedEntitySections = self->_relatedEntitySections;
  if ((unint64_t)relatedEntitySections | *((_QWORD *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](relatedEntitySections, "isEqual:"))
      goto LABEL_114;
  }
  searchTierMetadatas = self->_searchTierMetadatas;
  if ((unint64_t)searchTierMetadatas | *((_QWORD *)v4 + 24))
  {
    if (!-[NSMutableArray isEqual:](searchTierMetadatas, "isEqual:"))
      goto LABEL_114;
  }
  resultRefinementGroup = self->_resultRefinementGroup;
  if ((unint64_t)resultRefinementGroup | *((_QWORD *)v4 + 19))
  {
    if (!-[GEOPDResultRefinementGroup isEqual:](resultRefinementGroup, "isEqual:"))
      goto LABEL_114;
  }
  autoRedoSearchThreshold = self->_autoRedoSearchThreshold;
  if ((unint64_t)autoRedoSearchThreshold | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDSSearchAutoRedoThreshold isEqual:](autoRedoSearchThreshold, "isEqual:"))
      goto LABEL_114;
  }
  placeSummaryLayoutMetadata = self->_placeSummaryLayoutMetadata;
  if ((unint64_t)placeSummaryLayoutMetadata | *((_QWORD *)v4 + 13))
  {
    if (!-[GEOPDPlaceSummaryLayoutMetadata isEqual:](placeSummaryLayoutMetadata, "isEqual:"))
      goto LABEL_114;
  }
  sectionList = self->_sectionList;
  if ((unint64_t)sectionList | *((_QWORD *)v4 + 25))
  {
    if (!-[GEOPDSearchSectionList isEqual:](sectionList, "isEqual:"))
      goto LABEL_114;
  }
  v27 = self->_flags;
  v28 = *((_QWORD *)v4 + 31);
  if ((*(_BYTE *)&v27 & 0x20) != 0)
  {
    if ((v28 & 0x20) == 0)
      goto LABEL_114;
    if (self->_disableAddingAdditionalPaddingOnViewport)
    {
      if (!*((_BYTE *)v4 + 240))
        goto LABEL_114;
    }
    else if (*((_BYTE *)v4 + 240))
    {
      goto LABEL_114;
    }
  }
  else if ((v28 & 0x20) != 0)
  {
    goto LABEL_114;
  }
  if ((*(_BYTE *)&v27 & 0x10) != 0)
  {
    if ((v28 & 0x10) == 0 || self->_searchResultViewType != *((_DWORD *)v4 + 59))
      goto LABEL_114;
  }
  else if ((v28 & 0x10) != 0)
  {
    goto LABEL_114;
  }
  if ((*(_BYTE *)&v27 & 0x80) != 0)
  {
    if ((v28 & 0x80) != 0)
    {
      if (self->_enableStructuredRapAffordance)
      {
        if (!*((_BYTE *)v4 + 242))
          goto LABEL_114;
        goto LABEL_99;
      }
      if (!*((_BYTE *)v4 + 242))
        goto LABEL_99;
    }
LABEL_114:
    v35 = 0;
    goto LABEL_115;
  }
  if ((v28 & 0x80) != 0)
    goto LABEL_114;
LABEL_99:
  searchSessionData = self->_searchSessionData;
  if ((unint64_t)searchSessionData | *((_QWORD *)v4 + 23)
    && !-[GEOPDSSearchSessionData isEqual:](searchSessionData, "isEqual:"))
  {
    goto LABEL_114;
  }
  openPlaceCardForResultWithId = self->_openPlaceCardForResultWithId;
  if ((unint64_t)openPlaceCardForResultWithId | *((_QWORD *)v4 + 11))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](openPlaceCardForResultWithId, "isEqual:"))
      goto LABEL_114;
  }
  v31 = *((_QWORD *)v4 + 31);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((v31 & 2) == 0 || self->_mapDisplayType != *((_DWORD *)v4 + 56))
      goto LABEL_114;
  }
  else if ((v31 & 2) != 0)
  {
    goto LABEL_114;
  }
  guideSummaryLayoutMetadata = self->_guideSummaryLayoutMetadata;
  if ((unint64_t)guideSummaryLayoutMetadata | *((_QWORD *)v4 + 10)
    && !-[GEOPDGuideSummaryLayoutMetadata isEqual:](guideSummaryLayoutMetadata, "isEqual:"))
  {
    goto LABEL_114;
  }
  paginationInfo = self->_paginationInfo;
  if ((unint64_t)paginationInfo | *((_QWORD *)v4 + 12))
  {
    if (!-[GEOPDPaginationInfo isEqual:](paginationInfo, "isEqual:"))
      goto LABEL_114;
  }
  redoButtonThreshold = self->_redoButtonThreshold;
  if ((unint64_t)redoButtonThreshold | *((_QWORD *)v4 + 14))
    v35 = -[GEOPDSSearchRedoButtonThreshold isEqual:](redoButtonThreshold, "isEqual:");
  else
    v35 = 1;
LABEL_115:

  return v35;
}

- (unint64_t)hash
{
  $A1FAD422473D1390BB4F551D8B8DF0D1 flags;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  $A1FAD422473D1390BB4F551D8B8DF0D1 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  NSUInteger v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;

  -[GEOPDSearchResult readAll:]((uint64_t)self, 1);
  v38 = -[GEOMapRegion hash](self->_displayMapRegion, "hash");
  v37 = -[NSMutableArray hash](self->_disambiguationLabels, "hash");
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
    v36 = 2654435761 * self->_isChainResultSet;
  else
    v36 = 0;
  v35 = -[NSMutableArray hash](self->_relatedSearchSuggestions, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    v34 = 2654435761 * self->_searchResultType;
  else
    v34 = 0;
  v33 = -[NSString hash](self->_resultDisplayHeader, "hash");
  v32 = -[GEOPDRelatedSearchSuggestion hash](self->_defaultRelatedSearchSuggestion, "hash");
  v31 = -[GEOPDSearchClientBehavior hash](self->_searchClientBehavior, "hash");
  v30 = -[NSMutableArray hash](self->_resultDetourInfos, "hash");
  v29 = -[GEOPDDirectionIntent hash](self->_directionIntent, "hash");
  v28 = -[GEOPDResolvedItem hash](self->_clientResolvedResult, "hash");
  v27 = -[NSMutableArray hash](self->_displayHeaderSubstitutes, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    v26 = 2654435761 * self->_enablePartialClientization;
    if ((*(_BYTE *)&flags & 1) != 0)
    {
LABEL_9:
      v25 = 2654435761 * self->_dymSuggestionVisibleTime;
      if ((*(_WORD *)&flags & 0x200) != 0)
        goto LABEL_10;
LABEL_14:
      v24 = 0;
      if ((*(_BYTE *)&flags & 4) != 0)
        goto LABEL_11;
      goto LABEL_15;
    }
  }
  else
  {
    v26 = 0;
    if ((*(_BYTE *)&flags & 1) != 0)
      goto LABEL_9;
  }
  v25 = 0;
  if ((*(_WORD *)&flags & 0x200) == 0)
    goto LABEL_14;
LABEL_10:
  v24 = 2654435761 * self->_showDymSuggestionCloseButton;
  if ((*(_BYTE *)&flags & 4) != 0)
  {
LABEL_11:
    v23 = 2654435761 * self->_retainSearchTime;
    goto LABEL_16;
  }
LABEL_15:
  v23 = 0;
LABEL_16:
  v22 = -[NSMutableArray hash](self->_retainSearchs, "hash");
  v21 = -[NSMutableArray hash](self->_searchResultSections, "hash");
  v20 = -[NSMutableArray hash](self->_relatedEntitySections, "hash");
  v19 = -[NSMutableArray hash](self->_searchTierMetadatas, "hash");
  v18 = -[GEOPDResultRefinementGroup hash](self->_resultRefinementGroup, "hash");
  v4 = -[GEOPDSSearchAutoRedoThreshold hash](self->_autoRedoSearchThreshold, "hash");
  v5 = -[GEOPDPlaceSummaryLayoutMetadata hash](self->_placeSummaryLayoutMetadata, "hash");
  v6 = -[GEOPDSearchSectionList hash](self->_sectionList, "hash");
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 0x20) == 0)
  {
    v8 = 0;
    if ((*(_BYTE *)&v7 & 0x10) != 0)
      goto LABEL_18;
LABEL_21:
    v9 = 0;
    if ((*(_BYTE *)&v7 & 0x80) != 0)
      goto LABEL_19;
    goto LABEL_22;
  }
  v8 = 2654435761 * self->_disableAddingAdditionalPaddingOnViewport;
  if ((*(_BYTE *)&v7 & 0x10) == 0)
    goto LABEL_21;
LABEL_18:
  v9 = 2654435761 * self->_searchResultViewType;
  if ((*(_BYTE *)&v7 & 0x80) != 0)
  {
LABEL_19:
    v10 = 2654435761 * self->_enableStructuredRapAffordance;
    goto LABEL_23;
  }
LABEL_22:
  v10 = 0;
LABEL_23:
  v11 = -[GEOPDSSearchSessionData hash](self->_searchSessionData, "hash");
  v12 = -[GEOPDMapsIdentifier hash](self->_openPlaceCardForResultWithId, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v13 = 2654435761 * self->_mapDisplayType;
  else
    v13 = 0;
  v14 = v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  v15 = v13 ^ -[GEOPDGuideSummaryLayoutMetadata hash](self->_guideSummaryLayoutMetadata, "hash");
  v16 = v15 ^ -[GEOPDPaginationInfo hash](self->_paginationInfo, "hash");
  return v14 ^ v16 ^ -[GEOPDSSearchRedoButtonThreshold hash](self->_redoButtonThreshold, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionList, 0);
  objc_storeStrong((id *)&self->_searchTierMetadatas, 0);
  objc_storeStrong((id *)&self->_searchSessionData, 0);
  objc_storeStrong((id *)&self->_searchResultSections, 0);
  objc_storeStrong((id *)&self->_searchClientBehavior, 0);
  objc_storeStrong((id *)&self->_retainSearchs, 0);
  objc_storeStrong((id *)&self->_resultRefinementGroup, 0);
  objc_storeStrong((id *)&self->_resultDisplayHeader, 0);
  objc_storeStrong((id *)&self->_resultDetourInfos, 0);
  objc_storeStrong((id *)&self->_relatedSearchSuggestions, 0);
  objc_storeStrong((id *)&self->_relatedEntitySections, 0);
  objc_storeStrong((id *)&self->_redoButtonThreshold, 0);
  objc_storeStrong((id *)&self->_placeSummaryLayoutMetadata, 0);
  objc_storeStrong((id *)&self->_paginationInfo, 0);
  objc_storeStrong((id *)&self->_openPlaceCardForResultWithId, 0);
  objc_storeStrong((id *)&self->_guideSummaryLayoutMetadata, 0);
  objc_storeStrong((id *)&self->_displayMapRegion, 0);
  objc_storeStrong((id *)&self->_displayHeaderSubstitutes, 0);
  objc_storeStrong((id *)&self->_disambiguationLabels, 0);
  objc_storeStrong((id *)&self->_directionIntent, 0);
  objc_storeStrong((id *)&self->_defaultRelatedSearchSuggestion, 0);
  objc_storeStrong((id *)&self->_clientResolvedResult, 0);
  objc_storeStrong((id *)&self->_autoRedoSearchThreshold, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
