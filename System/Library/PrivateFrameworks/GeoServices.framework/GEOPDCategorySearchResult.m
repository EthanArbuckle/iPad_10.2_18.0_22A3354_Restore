@implementation GEOPDCategorySearchResult

- (GEOPDCategorySearchResult)init
{
  GEOPDCategorySearchResult *v2;
  GEOPDCategorySearchResult *v3;
  GEOPDCategorySearchResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDCategorySearchResult;
  v2 = -[GEOPDCategorySearchResult init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDCategorySearchResult)initWithData:(id)a3
{
  GEOPDCategorySearchResult *v3;
  GEOPDCategorySearchResult *v4;
  GEOPDCategorySearchResult *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDCategorySearchResult;
  v3 = -[GEOPDCategorySearchResult initWithData:](&v7, sel_initWithData_, a3);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 185) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayMapRegion_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)displayMapRegion
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDCategorySearchResult _readDisplayMapRegion]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)setDisplayMapRegion:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_DWORD *)(a1 + 184) |= 0x800u;
  *(_DWORD *)(a1 + 184) |= 0x1000000u;
  objc_storeStrong((id *)(a1 + 56), a2);

}

- (void)_readRelatedSearchSuggestions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 186) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRelatedSearchSuggestions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)relatedSearchSuggestions
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDCategorySearchResult _readRelatedSearchSuggestions]((uint64_t)a1);
    a1 = (id *)v1[13];
  }
  return a1;
}

- (void)addRelatedSearchSuggestion:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDCategorySearchResult _readRelatedSearchSuggestions]((uint64_t)a1);
    -[GEOPDCategorySearchResult _addNoFlagsRelatedSearchSuggestion:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[46]._os_unfair_lock_opaque |= 0x20000u;
    os_unfair_lock_unlock(a1 + 42);
    a1[46]._os_unfair_lock_opaque |= 0x1000000u;
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
    v4 = *(void **)(a1 + 104);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v5;

      v4 = *(void **)(a1 + 104);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readResultDetourInfos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 186) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResultDetourInfos_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)resultDetourInfos
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDCategorySearchResult _readResultDetourInfos]((uint64_t)a1);
    a1 = (id *)v1[14];
  }
  return a1;
}

- (void)addResultDetourInfo:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDCategorySearchResult _readResultDetourInfos]((uint64_t)a1);
    -[GEOPDCategorySearchResult _addNoFlagsResultDetourInfo:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[46]._os_unfair_lock_opaque |= 0x40000u;
    os_unfair_lock_unlock(a1 + 42);
    a1[46]._os_unfair_lock_opaque |= 0x1000000u;
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
    v4 = *(void **)(a1 + 112);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = v5;

      v4 = *(void **)(a1 + 112);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readDefaultRelatedSearchSuggestion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 185) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDefaultRelatedSearchSuggestion_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)defaultRelatedSearchSuggestion
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDCategorySearchResult _readDefaultRelatedSearchSuggestion]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)setDefaultRelatedSearchSuggestion:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_DWORD *)(a1 + 184) |= 0x400u;
  *(_DWORD *)(a1 + 184) |= 0x1000000u;
  objc_storeStrong((id *)(a1 + 48), a2);

}

- (void)_readSearchClientBehavior
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 186) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchClientBehavior_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)searchClientBehavior
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDCategorySearchResult _readSearchClientBehavior]((uint64_t)a1);
    a1 = (id *)v1[16];
  }
  return a1;
}

- (void)setSearchClientBehavior:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_DWORD *)(a1 + 184) |= 0x100000u;
  *(_DWORD *)(a1 + 184) |= 0x1000000u;
  objc_storeStrong((id *)(a1 + 128), a2);

}

- (void)_readBrowseCategorys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 185) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBrowseCategorys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)browseCategorys
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDCategorySearchResult _readBrowseCategorys]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)addBrowseCategory:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDCategorySearchResult _readBrowseCategorys]((uint64_t)a1);
    -[GEOPDCategorySearchResult _addNoFlagsBrowseCategory:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[46]._os_unfair_lock_opaque |= 0x100u;
    os_unfair_lock_unlock(a1 + 42);
    a1[46]._os_unfair_lock_opaque |= 0x1000000u;
  }
}

- (void)_addNoFlagsBrowseCategory:(uint64_t)a1
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

- (void)_readCategorySearchResultSection
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 185) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategorySearchResultSection_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)categorySearchResultSection
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDCategorySearchResult _readCategorySearchResultSection]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)setCategorySearchResultSection:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_DWORD *)(a1 + 184) |= 0x200u;
  *(_DWORD *)(a1 + 184) |= 0x1000000u;
  objc_storeStrong((id *)(a1 + 40), a2);

}

- (void)_readRelatedEntitySections
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 186) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRelatedEntitySections_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)relatedEntitySections
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDCategorySearchResult _readRelatedEntitySections]((uint64_t)a1);
    a1 = (id *)v1[12];
  }
  return a1;
}

- (void)addRelatedEntitySection:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDCategorySearchResult _readRelatedEntitySections]((uint64_t)a1);
    -[GEOPDCategorySearchResult _addNoFlagsRelatedEntitySection:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[46]._os_unfair_lock_opaque |= 0x10000u;
    os_unfair_lock_unlock(a1 + 42);
    a1[46]._os_unfair_lock_opaque |= 0x1000000u;
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
    v4 = *(void **)(a1 + 96);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = v5;

      v4 = *(void **)(a1 + 96);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 186) & 0x40) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDCategorySearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchTierMetadatas_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
    -[GEOPDCategorySearchResult _addNoFlagsSearchTierMetadata:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 184) |= 0x400000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
    *(_DWORD *)(a1 + 184) |= 0x1000000u;
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
    v4 = *(void **)(a1 + 144);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 144);
      *(_QWORD *)(a1 + 144) = v5;

      v4 = *(void **)(a1 + 144);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 186) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResultRefinementGroup_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)resultRefinementGroup
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDCategorySearchResult _readResultRefinementGroup]((uint64_t)a1);
    a1 = (id *)v1[15];
  }
  return a1;
}

- (void)setResultRefinementGroup:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_DWORD *)(a1 + 184) |= 0x80000u;
  *(_DWORD *)(a1 + 184) |= 0x1000000u;
  objc_storeStrong((id *)(a1 + 120), a2);

}

- (void)_readAutoRedoSearchThreshold
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 184) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAutoRedoSearchThreshold_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)autoRedoSearchThreshold
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDCategorySearchResult _readAutoRedoSearchThreshold]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setAutoRedoSearchThreshold:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_DWORD *)(a1 + 184) |= 0x80u;
  *(_DWORD *)(a1 + 184) |= 0x1000000u;
  objc_storeStrong((id *)(a1 + 24), a2);

}

- (void)_readPlaceSummaryLayoutMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 185) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceSummaryLayoutMetadata_tags_2003);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)placeSummaryLayoutMetadata
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDCategorySearchResult _readPlaceSummaryLayoutMetadata]((uint64_t)a1);
    a1 = (id *)v1[10];
  }
  return a1;
}

- (void)setPlaceSummaryLayoutMetadata:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_DWORD *)(a1 + 184) |= 0x4000u;
  *(_DWORD *)(a1 + 184) |= 0x1000000u;
  objc_storeStrong((id *)(a1 + 80), a2);

}

- (void)_readSectionList
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 186) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSectionList_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)sectionList
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDCategorySearchResult _readSectionList]((uint64_t)a1);
    a1 = (id *)v1[19];
  }
  return a1;
}

- (void)setSectionList:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_DWORD *)(a1 + 184) |= 0x800000u;
  *(_DWORD *)(a1 + 184) |= 0x1000000u;
  objc_storeStrong((id *)(a1 + 152), a2);

}

- (os_unfair_lock_s)searchResultViewType
{
  os_unfair_lock_s *v1;
  uint32_t os_unfair_lock_opaque;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    os_unfair_lock_opaque = v1[46]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v1 + 42);
    if ((os_unfair_lock_opaque & 2) != 0)
      return (os_unfair_lock_s *)v1[44]._os_unfair_lock_opaque;
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 186) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchSessionData_tags_2004);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)searchSessionData
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDCategorySearchResult _readSearchSessionData]((uint64_t)a1);
    a1 = (id *)v1[17];
  }
  return a1;
}

- (void)setSearchSessionData:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_DWORD *)(a1 + 184) |= 0x200000u;
  *(_DWORD *)(a1 + 184) |= 0x1000000u;
  objc_storeStrong((id *)(a1 + 136), a2);

}

- (os_unfair_lock_s)mapDisplayType
{
  os_unfair_lock_s *v1;
  uint32_t os_unfair_lock_opaque;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    os_unfair_lock_opaque = v1[46]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v1 + 42);
    if ((os_unfair_lock_opaque & 1) != 0)
      return (os_unfair_lock_s *)v1[43]._os_unfair_lock_opaque;
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 185) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGuideSummaryLayoutMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)guideSummaryLayoutMetadata
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDCategorySearchResult _readGuideSummaryLayoutMetadata]((uint64_t)a1);
    a1 = (id *)v1[8];
  }
  return a1;
}

- (void)setGuideSummaryLayoutMetadata:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_DWORD *)(a1 + 184) |= 0x1000u;
  *(_DWORD *)(a1 + 184) |= 0x1000000u;
  objc_storeStrong((id *)(a1 + 64), a2);

}

- (void)setPaginationInfo:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_DWORD *)(a1 + 184) |= 0x2000u;
  *(_DWORD *)(a1 + 184) |= 0x1000000u;
  objc_storeStrong((id *)(a1 + 72), a2);

}

- (void)_readRedoButtonThreshold
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(_BYTE *)(a1 + 185) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRedoButtonThreshold_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (id)redoButtonThreshold
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDCategorySearchResult _readRedoButtonThreshold]((uint64_t)a1);
    a1 = (id *)v1[11];
  }
  return a1;
}

- (void)setRedoButtonThreshold:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_DWORD *)(a1 + 184) |= 0x8000u;
  *(_DWORD *)(a1 + 184) |= 0x1000000u;
  objc_storeStrong((id *)(a1 + 88), a2);

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
  v8.super_class = (Class)GEOPDCategorySearchResult;
  -[GEOPDCategorySearchResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDCategorySearchResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDCategorySearchResult _dictionaryRepresentation:]((uint64_t)self, 0);
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
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  id v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  id v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  id v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  const __CFString *v51;
  id v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t m;
  void *v58;
  id v59;
  const __CFString *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t n;
  void *v66;
  id v67;
  const __CFString *v68;
  void *v69;
  void *v70;
  void *v71;
  const __CFString *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  const __CFString *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  const __CFString *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  const __CFString *v87;
  id v88;
  int v89;
  void *v90;
  const __CFString *v91;
  uint64_t v92;
  __CFString *v93;
  const __CFString *v94;
  void *v95;
  const __CFString *v96;
  void *v97;
  void *v98;
  void *v99;
  const __CFString *v100;
  id v101;
  int v102;
  __CFString *v103;
  const __CFString *v104;
  void *v105;
  void *v106;
  void *v107;
  const __CFString *v108;
  id v109;
  void *v110;
  id v111;
  id v112;
  void *v113;
  void *v114;
  const __CFString *v115;
  id v116;
  void *v117;
  void *v118;
  void *v119;
  const __CFString *v120;
  id v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  id v127;
  id v128;
  _QWORD v130[4];
  id v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  uint64_t v157;

  v157 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDCategorySearchResult readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDCategorySearchResult displayMapRegion]((id *)a1);
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

  if ((*(_BYTE *)(a1 + 184) & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 183));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("isChainResultSet");
    else
      v11 = CFSTR("is_chain_result_set");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  if (objc_msgSend(*(id *)(a1 + 104), "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
    v148 = 0u;
    v149 = 0u;
    v150 = 0u;
    v151 = 0u;
    v13 = *(id *)(a1 + 104);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v148, v156, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v149;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v149 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v17, "jsonRepresentation");
          else
            objc_msgSend(v17, "dictionaryRepresentation");
          v18 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "addObject:", v18);
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v148, v156, 16);
      }
      while (v14);
    }

    if (a2)
      v19 = CFSTR("relatedSearchSuggestion");
    else
      v19 = CFSTR("related_search_suggestion");
    objc_msgSend(v4, "setObject:forKey:", v12, v19);

  }
  if (objc_msgSend(*(id *)(a1 + 112), "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
    v146 = 0u;
    v147 = 0u;
    v144 = 0u;
    v145 = 0u;
    v21 = *(id *)(a1 + 112);
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v144, v155, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v145;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v145 != v23)
            objc_enumerationMutation(v21);
          v25 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v25, "jsonRepresentation");
          else
            objc_msgSend(v25, "dictionaryRepresentation");
          v26 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "addObject:", v26);
        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v144, v155, 16);
      }
      while (v22);
    }

    if (a2)
      v27 = CFSTR("resultDetourInfo");
    else
      v27 = CFSTR("result_detour_info");
    objc_msgSend(v4, "setObject:forKey:", v20, v27);

  }
  -[GEOPDCategorySearchResult defaultRelatedSearchSuggestion]((id *)a1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v28, "jsonRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("defaultRelatedSearchSuggestion");
    }
    else
    {
      objc_msgSend(v28, "dictionaryRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("default_related_search_suggestion");
    }
    v32 = v30;

    objc_msgSend(v4, "setObject:forKey:", v32, v31);
  }

  -[GEOPDCategorySearchResult searchClientBehavior]((id *)a1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v33, "jsonRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("searchClientBehavior");
    }
    else
    {
      objc_msgSend(v33, "dictionaryRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("search_client_behavior");
    }
    v37 = v35;

    objc_msgSend(v4, "setObject:forKey:", v37, v36);
  }

  if ((*(_BYTE *)(a1 + 184) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 181));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v39 = CFSTR("enablePartialClientization");
    else
      v39 = CFSTR("enable_partial_clientization");
    objc_msgSend(v4, "setObject:forKey:", v38, v39);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v142 = 0u;
    v143 = 0u;
    v140 = 0u;
    v141 = 0u;
    v41 = *(id *)(a1 + 32);
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v140, v154, 16);
    if (v42)
    {
      v43 = *(_QWORD *)v141;
      do
      {
        for (k = 0; k != v42; ++k)
        {
          if (*(_QWORD *)v141 != v43)
            objc_enumerationMutation(v41);
          v45 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v45, "jsonRepresentation");
          else
            objc_msgSend(v45, "dictionaryRepresentation");
          v46 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v40, "addObject:", v46);
        }
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v140, v154, 16);
      }
      while (v42);
    }

    if (a2)
      v47 = CFSTR("browseCategory");
    else
      v47 = CFSTR("browse_category");
    objc_msgSend(v4, "setObject:forKey:", v40, v47);

  }
  -[GEOPDCategorySearchResult categorySearchResultSection]((id *)a1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v48;
  if (v48)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v48, "jsonRepresentation");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = CFSTR("categorySearchResultSection");
    }
    else
    {
      objc_msgSend(v48, "dictionaryRepresentation");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = CFSTR("category_search_result_section");
    }
    v52 = v50;

    objc_msgSend(v4, "setObject:forKey:", v52, v51);
  }

  if (objc_msgSend(*(id *)(a1 + 96), "count"))
  {
    v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    v138 = 0u;
    v139 = 0u;
    v136 = 0u;
    v137 = 0u;
    v54 = *(id *)(a1 + 96);
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v136, v153, 16);
    if (v55)
    {
      v56 = *(_QWORD *)v137;
      do
      {
        for (m = 0; m != v55; ++m)
        {
          if (*(_QWORD *)v137 != v56)
            objc_enumerationMutation(v54);
          v58 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v58, "jsonRepresentation");
          else
            objc_msgSend(v58, "dictionaryRepresentation");
          v59 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v53, "addObject:", v59);
        }
        v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v136, v153, 16);
      }
      while (v55);
    }

    if (a2)
      v60 = CFSTR("relatedEntitySection");
    else
      v60 = CFSTR("related_entity_section");
    objc_msgSend(v4, "setObject:forKey:", v53, v60);

  }
  if (objc_msgSend(*(id *)(a1 + 144), "count"))
  {
    v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 144), "count"));
    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    v62 = *(id *)(a1 + 144);
    v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v132, v152, 16);
    if (v63)
    {
      v64 = *(_QWORD *)v133;
      do
      {
        for (n = 0; n != v63; ++n)
        {
          if (*(_QWORD *)v133 != v64)
            objc_enumerationMutation(v62);
          v66 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * n);
          if ((a2 & 1) != 0)
            objc_msgSend(v66, "jsonRepresentation");
          else
            objc_msgSend(v66, "dictionaryRepresentation");
          v67 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v61, "addObject:", v67);
        }
        v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v132, v152, 16);
      }
      while (v63);
    }

    if (a2)
      v68 = CFSTR("searchTierMetadata");
    else
      v68 = CFSTR("search_tier_metadata");
    objc_msgSend(v4, "setObject:forKey:", v61, v68);

  }
  -[GEOPDCategorySearchResult resultRefinementGroup]((id *)a1);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v69;
  if (v69)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v69, "jsonRepresentation");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = CFSTR("resultRefinementGroup");
    }
    else
    {
      objc_msgSend(v69, "dictionaryRepresentation");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = CFSTR("result_refinement_group");
    }
    v73 = v71;

    objc_msgSend(v4, "setObject:forKey:", v73, v72);
  }

  -[GEOPDCategorySearchResult autoRedoSearchThreshold]((id *)a1);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v74;
  if (v74)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v74, "jsonRepresentation");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = CFSTR("autoRedoSearchThreshold");
    }
    else
    {
      objc_msgSend(v74, "dictionaryRepresentation");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = CFSTR("auto_redo_search_threshold");
    }
    v78 = v76;

    objc_msgSend(v4, "setObject:forKey:", v78, v77);
  }

  -[GEOPDCategorySearchResult placeSummaryLayoutMetadata]((id *)a1);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v79;
  if (v79)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v79, "jsonRepresentation");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = CFSTR("placeSummaryLayoutMetadata");
    }
    else
    {
      objc_msgSend(v79, "dictionaryRepresentation");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = CFSTR("place_summary_layout_metadata");
    }
    v83 = v81;

    objc_msgSend(v4, "setObject:forKey:", v83, v82);
  }

  -[GEOPDCategorySearchResult sectionList]((id *)a1);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v84;
  if (v84)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v84, "jsonRepresentation");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = CFSTR("sectionList");
    }
    else
    {
      objc_msgSend(v84, "dictionaryRepresentation");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = CFSTR("section_list");
    }
    v88 = v86;

    objc_msgSend(v4, "setObject:forKey:", v88, v87);
  }

  v89 = *(_DWORD *)(a1 + 184);
  if ((v89 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 180));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v91 = CFSTR("disableAddingAdditionalPaddingOnViewport");
    else
      v91 = CFSTR("disable_adding_additional_padding_on_viewport");
    objc_msgSend(v4, "setObject:forKey:", v90, v91);

    v89 = *(_DWORD *)(a1 + 184);
  }
  if ((v89 & 2) != 0)
  {
    v92 = *(int *)(a1 + 176);
    if (v92 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 176));
      v93 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v93 = off_1E1C05118[v92];
    }
    if (a2)
      v94 = CFSTR("searchResultViewType");
    else
      v94 = CFSTR("search_result_view_type");
    objc_msgSend(v4, "setObject:forKey:", v93, v94);

    v89 = *(_DWORD *)(a1 + 184);
  }
  if ((v89 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 182));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v96 = CFSTR("enableStructuredRapAffordance");
    else
      v96 = CFSTR("enable_structured_rap_affordance");
    objc_msgSend(v4, "setObject:forKey:", v95, v96);

  }
  -[GEOPDCategorySearchResult searchSessionData]((id *)a1);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v97;
  if (v97)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v97, "jsonRepresentation");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = CFSTR("searchSessionData");
    }
    else
    {
      objc_msgSend(v97, "dictionaryRepresentation");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = CFSTR("search_session_data");
    }
    v101 = v99;

    objc_msgSend(v4, "setObject:forKey:", v101, v100);
  }

  if ((*(_BYTE *)(a1 + 184) & 1) != 0)
  {
    v102 = *(_DWORD *)(a1 + 172);
    if (v102)
    {
      if (v102 == 1)
      {
        v103 = CFSTR("TOPOGRAPHIC");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 172));
        v103 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v103 = CFSTR("DEFAULT");
    }
    if (a2)
      v104 = CFSTR("mapDisplayType");
    else
      v104 = CFSTR("map_display_type");
    objc_msgSend(v4, "setObject:forKey:", v103, v104);

  }
  -[GEOPDCategorySearchResult guideSummaryLayoutMetadata]((id *)a1);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = v105;
  if (v105)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v105, "jsonRepresentation");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = CFSTR("guideSummaryLayoutMetadata");
    }
    else
    {
      objc_msgSend(v105, "dictionaryRepresentation");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = CFSTR("guide_summary_layout_metadata");
    }
    v109 = v107;

    objc_msgSend(v4, "setObject:forKey:", v109, v108);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
  if ((*(_BYTE *)(a1 + 185) & 0x20) == 0)
  {
    v110 = *(void **)(a1 + 8);
    if (v110)
    {
      v111 = v110;
      objc_sync_enter(v111);
      GEOPDCategorySearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPaginationInfo_tags);
      objc_sync_exit(v111);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  v112 = *(id *)(a1 + 72);
  v113 = v112;
  if (v112)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v112, "jsonRepresentation");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = CFSTR("paginationInfo");
    }
    else
    {
      objc_msgSend(v112, "dictionaryRepresentation");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = CFSTR("pagination_info");
    }
    v116 = v114;

    objc_msgSend(v4, "setObject:forKey:", v116, v115);
  }

  -[GEOPDCategorySearchResult redoButtonThreshold]((id *)a1);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v117;
  if (v117)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v117, "jsonRepresentation");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = CFSTR("redoButtonThreshold");
    }
    else
    {
      objc_msgSend(v117, "dictionaryRepresentation");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = CFSTR("redo_button_threshold");
    }
    v121 = v119;

    objc_msgSend(v4, "setObject:forKey:", v121, v120);
  }

  v122 = *(void **)(a1 + 16);
  if (v122)
  {
    objc_msgSend(v122, "dictionaryRepresentation");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = v123;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v123, "count"));
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      v130[0] = MEMORY[0x1E0C809B0];
      v130[1] = 3221225472;
      v130[2] = __55__GEOPDCategorySearchResult__dictionaryRepresentation___block_invoke;
      v130[3] = &unk_1E1C00600;
      v126 = v125;
      v131 = v126;
      objc_msgSend(v124, "enumerateKeysAndObjectsUsingBlock:", v130);
      v127 = v126;

    }
    else
    {
      v127 = v123;
    }
    objc_msgSend(v4, "setObject:forKey:", v127, CFSTR("Unknown Fields"));

  }
  v128 = v4;

  return v128;
}

- (id)jsonRepresentation
{
  return -[GEOPDCategorySearchResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_2090;
      else
        v6 = (int *)&readAll__nonRecursiveTag_2091;
      GEOPDCategorySearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDCategorySearchResultCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

void __55__GEOPDCategorySearchResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDCategorySearchResultReadAllFrom((uint64_t)self, a3, 0);
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
  $F787DB4F2333CE8C44B2FCD1BF7F9C48 flags;
  PBDataReader *v27;
  void *v28;
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
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDCategorySearchResultIsDirty((uint64_t)self) & 1) == 0)
  {
    v27 = self->_reader;
    objc_sync_enter(v27);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v28);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v27);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDCategorySearchResult readAll:]((uint64_t)self, 0);
    if (self->_displayMapRegion)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
      PBDataWriterWriteBOOLField();
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v6 = self->_relatedSearchSuggestions;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v46;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v46 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      }
      while (v7);
    }

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v10 = self->_resultDetourInfos;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v42;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v42 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
      }
      while (v11);
    }

    if (self->_defaultRelatedSearchSuggestion)
      PBDataWriterWriteSubmessage();
    if (self->_searchClientBehavior)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      PBDataWriterWriteBOOLField();
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v14 = self->_browseCategorys;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v38;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v38 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
      }
      while (v15);
    }

    if (self->_categorySearchResultSection)
      PBDataWriterWriteSubmessage();
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v18 = self->_relatedEntitySections;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v33, v50, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v34;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v34 != v20)
            objc_enumerationMutation(v18);
          PBDataWriterWriteSubmessage();
          ++v21;
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v33, v50, 16);
      }
      while (v19);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v22 = self->_searchTierMetadatas;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v29, v49, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v30;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v30 != v24)
            objc_enumerationMutation(v22);
          PBDataWriterWriteSubmessage();
          ++v25;
        }
        while (v23 != v25);
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v29, v49, 16);
      }
      while (v23);
    }

    if (self->_resultRefinementGroup)
      PBDataWriterWriteSubmessage();
    if (self->_autoRedoSearchThreshold)
      PBDataWriterWriteSubmessage();
    if (self->_placeSummaryLayoutMetadata)
      PBDataWriterWriteSubmessage();
    if (self->_sectionList)
      PBDataWriterWriteSubmessage();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 0x10) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_searchSessionData)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_guideSummaryLayoutMetadata)
      PBDataWriterWriteSubmessage();
    if (self->_paginationInfo)
      PBDataWriterWriteSubmessage();
    if (self->_redoButtonThreshold)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v29);
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
  id v21;
  void *v22;
  id v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  id v30;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  void *v36;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t n;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  $F787DB4F2333CE8C44B2FCD1BF7F9C48 flags;
  id v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  PBUnknownFields *v59;
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
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 3) & 1) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDCategorySearchResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_51;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDCategorySearchResult readAll:]((uint64_t)self, 0);
  v9 = -[GEOMapRegion copyWithZone:](self->_displayMapRegion, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v9;

  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 183) = self->_isChainResultSet;
    *(_DWORD *)(v5 + 184) |= 0x20u;
  }
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v11 = self->_relatedSearchSuggestions;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v78 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDCategorySearchResult addRelatedSearchSuggestion:]((os_unfair_lock_s *)v5, v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
    }
    while (v12);
  }

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v16 = self->_resultDetourInfos;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v74;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v74 != v18)
          objc_enumerationMutation(v16);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * j), "copyWithZone:", a3);
        -[GEOPDCategorySearchResult addResultDetourInfo:]((os_unfair_lock_s *)v5, v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
    }
    while (v17);
  }

  v21 = -[GEOPDRelatedSearchSuggestion copyWithZone:](self->_defaultRelatedSearchSuggestion, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v21;

  v23 = -[GEOPDSearchClientBehavior copyWithZone:](self->_searchClientBehavior, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v23;

  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *(_BYTE *)(v5 + 181) = self->_enablePartialClientization;
    *(_DWORD *)(v5 + 184) |= 8u;
  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v25 = self->_browseCategorys;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v70;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v70 != v27)
          objc_enumerationMutation(v25);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * k), "copyWithZone:", a3);
        -[GEOPDCategorySearchResult addBrowseCategory:]((os_unfair_lock_s *)v5, v29);

      }
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
    }
    while (v26);
  }

  v30 = -[GEOPDSCategorySearchResultSection copyWithZone:](self->_categorySearchResultSection, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v30;

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v32 = self->_relatedEntitySections;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v65, v82, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v66;
    do
    {
      for (m = 0; m != v33; ++m)
      {
        if (*(_QWORD *)v66 != v34)
          objc_enumerationMutation(v32);
        v36 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * m), "copyWithZone:", a3);
        -[GEOPDCategorySearchResult addRelatedEntitySection:]((os_unfair_lock_s *)v5, v36);

      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v65, v82, 16);
    }
    while (v33);
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v37 = self->_searchTierMetadatas;
  v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v61, v81, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v62;
    do
    {
      for (n = 0; n != v38; ++n)
      {
        if (*(_QWORD *)v62 != v39)
          objc_enumerationMutation(v37);
        v41 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * n), "copyWithZone:", a3, (_QWORD)v61);
        -[GEOPDCategorySearchResult addSearchTierMetadata:](v5, v41);

      }
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v61, v81, 16);
    }
    while (v38);
  }

  v42 = -[GEOPDResultRefinementGroup copyWithZone:](self->_resultRefinementGroup, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v42;

  v44 = -[GEOPDSSearchAutoRedoThreshold copyWithZone:](self->_autoRedoSearchThreshold, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v44;

  v46 = -[GEOPDPlaceSummaryLayoutMetadata copyWithZone:](self->_placeSummaryLayoutMetadata, "copyWithZone:", a3);
  v47 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v46;

  v48 = -[GEOPDSearchSectionList copyWithZone:](self->_sectionList, "copyWithZone:", a3);
  v49 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v48;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
    if ((*(_BYTE *)&flags & 2) == 0)
      goto LABEL_46;
LABEL_53:
    *(_DWORD *)(v5 + 176) = self->_searchResultViewType;
    *(_DWORD *)(v5 + 184) |= 2u;
    if ((*(_DWORD *)&self->_flags & 0x10) == 0)
      goto LABEL_48;
    goto LABEL_47;
  }
  *(_BYTE *)(v5 + 180) = self->_disableAddingAdditionalPaddingOnViewport;
  *(_DWORD *)(v5 + 184) |= 4u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
    goto LABEL_53;
LABEL_46:
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
LABEL_47:
    *(_BYTE *)(v5 + 182) = self->_enableStructuredRapAffordance;
    *(_DWORD *)(v5 + 184) |= 0x10u;
  }
LABEL_48:
  v51 = -[GEOPDSSearchSessionData copyWithZone:](self->_searchSessionData, "copyWithZone:", a3, (_QWORD)v61);
  v52 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v51;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 172) = self->_mapDisplayType;
    *(_DWORD *)(v5 + 184) |= 1u;
  }
  v53 = -[GEOPDGuideSummaryLayoutMetadata copyWithZone:](self->_guideSummaryLayoutMetadata, "copyWithZone:", a3);
  v54 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v53;

  v55 = -[GEOPDPaginationInfo copyWithZone:](self->_paginationInfo, "copyWithZone:", a3);
  v56 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v55;

  v57 = -[GEOPDSSearchRedoButtonThreshold copyWithZone:](self->_redoButtonThreshold, "copyWithZone:", a3);
  v58 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v57;

  v59 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v59;
LABEL_51:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOMapRegion *displayMapRegion;
  int v6;
  NSMutableArray *relatedSearchSuggestions;
  NSMutableArray *resultDetourInfos;
  GEOPDRelatedSearchSuggestion *defaultRelatedSearchSuggestion;
  GEOPDSearchClientBehavior *searchClientBehavior;
  int v11;
  NSMutableArray *browseCategorys;
  GEOPDSCategorySearchResultSection *categorySearchResultSection;
  NSMutableArray *relatedEntitySections;
  NSMutableArray *searchTierMetadatas;
  GEOPDResultRefinementGroup *resultRefinementGroup;
  GEOPDSSearchAutoRedoThreshold *autoRedoSearchThreshold;
  GEOPDPlaceSummaryLayoutMetadata *placeSummaryLayoutMetadata;
  GEOPDSearchSectionList *sectionList;
  $F787DB4F2333CE8C44B2FCD1BF7F9C48 flags;
  int v21;
  GEOPDSSearchSessionData *searchSessionData;
  GEOPDGuideSummaryLayoutMetadata *guideSummaryLayoutMetadata;
  GEOPDPaginationInfo *paginationInfo;
  GEOPDSSearchRedoButtonThreshold *redoButtonThreshold;
  char v26;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_79;
  -[GEOPDCategorySearchResult readAll:]((uint64_t)self, 1);
  -[GEOPDCategorySearchResult readAll:]((uint64_t)v4, 1);
  displayMapRegion = self->_displayMapRegion;
  if ((unint64_t)displayMapRegion | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOMapRegion isEqual:](displayMapRegion, "isEqual:"))
      goto LABEL_79;
  }
  v6 = *((_DWORD *)v4 + 46);
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0)
      goto LABEL_79;
    if (self->_isChainResultSet)
    {
      if (!*((_BYTE *)v4 + 183))
        goto LABEL_79;
    }
    else if (*((_BYTE *)v4 + 183))
    {
      goto LABEL_79;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_79;
  }
  relatedSearchSuggestions = self->_relatedSearchSuggestions;
  if ((unint64_t)relatedSearchSuggestions | *((_QWORD *)v4 + 13)
    && !-[NSMutableArray isEqual:](relatedSearchSuggestions, "isEqual:"))
  {
    goto LABEL_79;
  }
  resultDetourInfos = self->_resultDetourInfos;
  if ((unint64_t)resultDetourInfos | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](resultDetourInfos, "isEqual:"))
      goto LABEL_79;
  }
  defaultRelatedSearchSuggestion = self->_defaultRelatedSearchSuggestion;
  if ((unint64_t)defaultRelatedSearchSuggestion | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPDRelatedSearchSuggestion isEqual:](defaultRelatedSearchSuggestion, "isEqual:"))
      goto LABEL_79;
  }
  searchClientBehavior = self->_searchClientBehavior;
  if ((unint64_t)searchClientBehavior | *((_QWORD *)v4 + 16))
  {
    if (!-[GEOPDSearchClientBehavior isEqual:](searchClientBehavior, "isEqual:"))
      goto LABEL_79;
  }
  v11 = *((_DWORD *)v4 + 46);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((v11 & 8) == 0)
      goto LABEL_79;
    if (self->_enablePartialClientization)
    {
      if (!*((_BYTE *)v4 + 181))
        goto LABEL_79;
    }
    else if (*((_BYTE *)v4 + 181))
    {
      goto LABEL_79;
    }
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_79;
  }
  browseCategorys = self->_browseCategorys;
  if ((unint64_t)browseCategorys | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](browseCategorys, "isEqual:"))
  {
    goto LABEL_79;
  }
  categorySearchResultSection = self->_categorySearchResultSection;
  if ((unint64_t)categorySearchResultSection | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDSCategorySearchResultSection isEqual:](categorySearchResultSection, "isEqual:"))
      goto LABEL_79;
  }
  relatedEntitySections = self->_relatedEntitySections;
  if ((unint64_t)relatedEntitySections | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](relatedEntitySections, "isEqual:"))
      goto LABEL_79;
  }
  searchTierMetadatas = self->_searchTierMetadatas;
  if ((unint64_t)searchTierMetadatas | *((_QWORD *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](searchTierMetadatas, "isEqual:"))
      goto LABEL_79;
  }
  resultRefinementGroup = self->_resultRefinementGroup;
  if ((unint64_t)resultRefinementGroup | *((_QWORD *)v4 + 15))
  {
    if (!-[GEOPDResultRefinementGroup isEqual:](resultRefinementGroup, "isEqual:"))
      goto LABEL_79;
  }
  autoRedoSearchThreshold = self->_autoRedoSearchThreshold;
  if ((unint64_t)autoRedoSearchThreshold | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDSSearchAutoRedoThreshold isEqual:](autoRedoSearchThreshold, "isEqual:"))
      goto LABEL_79;
  }
  placeSummaryLayoutMetadata = self->_placeSummaryLayoutMetadata;
  if ((unint64_t)placeSummaryLayoutMetadata | *((_QWORD *)v4 + 10))
  {
    if (!-[GEOPDPlaceSummaryLayoutMetadata isEqual:](placeSummaryLayoutMetadata, "isEqual:"))
      goto LABEL_79;
  }
  sectionList = self->_sectionList;
  if ((unint64_t)sectionList | *((_QWORD *)v4 + 19))
  {
    if (!-[GEOPDSearchSectionList isEqual:](sectionList, "isEqual:"))
      goto LABEL_79;
  }
  flags = self->_flags;
  v21 = *((_DWORD *)v4 + 46);
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v21 & 4) == 0)
      goto LABEL_79;
    if (self->_disableAddingAdditionalPaddingOnViewport)
    {
      if (!*((_BYTE *)v4 + 180))
        goto LABEL_79;
    }
    else if (*((_BYTE *)v4 + 180))
    {
      goto LABEL_79;
    }
  }
  else if ((v21 & 4) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v21 & 2) == 0 || self->_searchResultViewType != *((_DWORD *)v4 + 44))
      goto LABEL_79;
  }
  else if ((v21 & 2) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v21 & 0x10) == 0)
      goto LABEL_79;
    if (self->_enableStructuredRapAffordance)
    {
      if (!*((_BYTE *)v4 + 182))
        goto LABEL_79;
    }
    else if (*((_BYTE *)v4 + 182))
    {
      goto LABEL_79;
    }
  }
  else if ((v21 & 0x10) != 0)
  {
    goto LABEL_79;
  }
  searchSessionData = self->_searchSessionData;
  if (!((unint64_t)searchSessionData | *((_QWORD *)v4 + 17)))
    goto LABEL_68;
  if (!-[GEOPDSSearchSessionData isEqual:](searchSessionData, "isEqual:"))
  {
LABEL_79:
    v26 = 0;
    goto LABEL_80;
  }
  flags = self->_flags;
  v21 = *((_DWORD *)v4 + 46);
LABEL_68:
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v21 & 1) == 0 || self->_mapDisplayType != *((_DWORD *)v4 + 43))
      goto LABEL_79;
  }
  else if ((v21 & 1) != 0)
  {
    goto LABEL_79;
  }
  guideSummaryLayoutMetadata = self->_guideSummaryLayoutMetadata;
  if ((unint64_t)guideSummaryLayoutMetadata | *((_QWORD *)v4 + 8)
    && !-[GEOPDGuideSummaryLayoutMetadata isEqual:](guideSummaryLayoutMetadata, "isEqual:"))
  {
    goto LABEL_79;
  }
  paginationInfo = self->_paginationInfo;
  if ((unint64_t)paginationInfo | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOPDPaginationInfo isEqual:](paginationInfo, "isEqual:"))
      goto LABEL_79;
  }
  redoButtonThreshold = self->_redoButtonThreshold;
  if ((unint64_t)redoButtonThreshold | *((_QWORD *)v4 + 11))
    v26 = -[GEOPDSSearchRedoButtonThreshold isEqual:](redoButtonThreshold, "isEqual:");
  else
    v26 = 1;
LABEL_80:

  return v26;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  $F787DB4F2333CE8C44B2FCD1BF7F9C48 flags;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;

  -[GEOPDCategorySearchResult readAll:]((uint64_t)self, 1);
  v27 = -[GEOMapRegion hash](self->_displayMapRegion, "hash");
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
    v26 = 2654435761 * self->_isChainResultSet;
  else
    v26 = 0;
  v25 = -[NSMutableArray hash](self->_relatedSearchSuggestions, "hash");
  v24 = -[NSMutableArray hash](self->_resultDetourInfos, "hash");
  v23 = -[GEOPDRelatedSearchSuggestion hash](self->_defaultRelatedSearchSuggestion, "hash");
  v22 = -[GEOPDSearchClientBehavior hash](self->_searchClientBehavior, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    v21 = 2654435761 * self->_enablePartialClientization;
  else
    v21 = 0;
  v20 = -[NSMutableArray hash](self->_browseCategorys, "hash");
  v19 = -[GEOPDSCategorySearchResultSection hash](self->_categorySearchResultSection, "hash");
  v18 = -[NSMutableArray hash](self->_relatedEntitySections, "hash");
  v17 = -[NSMutableArray hash](self->_searchTierMetadatas, "hash");
  v3 = -[GEOPDResultRefinementGroup hash](self->_resultRefinementGroup, "hash");
  v4 = -[GEOPDSSearchAutoRedoThreshold hash](self->_autoRedoSearchThreshold, "hash");
  v5 = -[GEOPDPlaceSummaryLayoutMetadata hash](self->_placeSummaryLayoutMetadata, "hash");
  v6 = -[GEOPDSearchSectionList hash](self->_sectionList, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
    v8 = 0;
    if ((*(_BYTE *)&flags & 2) != 0)
      goto LABEL_9;
LABEL_12:
    v9 = 0;
    if ((*(_BYTE *)&flags & 0x10) != 0)
      goto LABEL_10;
    goto LABEL_13;
  }
  v8 = 2654435761 * self->_disableAddingAdditionalPaddingOnViewport;
  if ((*(_BYTE *)&flags & 2) == 0)
    goto LABEL_12;
LABEL_9:
  v9 = 2654435761 * self->_searchResultViewType;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
LABEL_10:
    v10 = 2654435761 * self->_enableStructuredRapAffordance;
    goto LABEL_14;
  }
LABEL_13:
  v10 = 0;
LABEL_14:
  v11 = -[GEOPDSSearchSessionData hash](self->_searchSessionData, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v12 = 2654435761 * self->_mapDisplayType;
  else
    v12 = 0;
  v13 = v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v3 ^ v4 ^ v5 ^ v6 ^ v8;
  v14 = v9 ^ v10 ^ v11 ^ v12 ^ -[GEOPDGuideSummaryLayoutMetadata hash](self->_guideSummaryLayoutMetadata, "hash");
  v15 = v14 ^ -[GEOPDPaginationInfo hash](self->_paginationInfo, "hash");
  return v13 ^ v15 ^ -[GEOPDSSearchRedoButtonThreshold hash](self->_redoButtonThreshold, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionList, 0);
  objc_storeStrong((id *)&self->_searchTierMetadatas, 0);
  objc_storeStrong((id *)&self->_searchSessionData, 0);
  objc_storeStrong((id *)&self->_searchClientBehavior, 0);
  objc_storeStrong((id *)&self->_resultRefinementGroup, 0);
  objc_storeStrong((id *)&self->_resultDetourInfos, 0);
  objc_storeStrong((id *)&self->_relatedSearchSuggestions, 0);
  objc_storeStrong((id *)&self->_relatedEntitySections, 0);
  objc_storeStrong((id *)&self->_redoButtonThreshold, 0);
  objc_storeStrong((id *)&self->_placeSummaryLayoutMetadata, 0);
  objc_storeStrong((id *)&self->_paginationInfo, 0);
  objc_storeStrong((id *)&self->_guideSummaryLayoutMetadata, 0);
  objc_storeStrong((id *)&self->_displayMapRegion, 0);
  objc_storeStrong((id *)&self->_defaultRelatedSearchSuggestion, 0);
  objc_storeStrong((id *)&self->_categorySearchResultSection, 0);
  objc_storeStrong((id *)&self->_browseCategorys, 0);
  objc_storeStrong((id *)&self->_autoRedoSearchThreshold, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
