@implementation GEOPDSearchParameters

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    -[GEOPDSearchParameters _readPreviousSearchViewport](result);
    if ((objc_msgSend(*(id *)(v3 + 192), "hasGreenTeaWithValue:", a2) & 1) != 0)
      return 1;
    -[GEOPDSearchParameters _readPunchInHints](v3);
    if ((-[GEOPDSPunchInHints hasGreenTeaWithValue:](*(_QWORD *)(v3 + 200), a2) & 1) != 0)
      return 1;
    -[GEOPDSearchParameters _readResultRefinementQuery](v3);
    if ((objc_msgSend(*(id *)(v3 + 216), "hasGreenTeaWithValue:", a2) & 1) != 0)
      return 1;
    -[GEOPDSearchParameters _readSearchFilter](v3);
    if ((-[GEOPDSSearchFilter hasGreenTeaWithValue:](*(_QWORD *)(v3 + 240), a2) & 1) != 0)
      return 1;
    -[GEOPDSearchParameters _readSearchOriginationInfo](v3);
    if (-[GEOPDSearchOriginationInfo hasGreenTeaWithValue:](*(_QWORD *)(v3 + 256), a2))
      return 1;
    -[GEOPDSearchParameters _readSuggestionEntry](v3);
    if ((objc_msgSend(*(id *)(v3 + 304), "hasGreenTeaWithValue:", a2) & 1) != 0)
    {
      return 1;
    }
    else
    {
      -[GEOPDSearchParameters _readViewportInfo](v3);
      return objc_msgSend(*(id *)(v3 + 320), "hasGreenTeaWithValue:", a2);
    }
  }
  return result;
}

- (GEOPDSearchParameters)init
{
  GEOPDSearchParameters *v2;
  GEOPDSearchParameters *v3;
  GEOPDSearchParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchParameters;
  v2 = -[GEOPDSearchParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchParameters)initWithData:(id)a3
{
  GEOPDSearchParameters *v3;
  GEOPDSearchParameters *v4;
  GEOPDSearchParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchParameters;
  v3 = -[GEOPDSearchParameters initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchParameters;
  -[GEOPDSearchParameters dealloc](&v3, sel_dealloc);
}

- (void)_readSearchString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(_BYTE *)(a1 + 376) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchString_tags_5166);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  }
}

- (id)searchString
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchParameters _readSearchString]((uint64_t)a1);
    a1 = (id *)v1[34];
  }
  return a1;
}

- (void)setSearchString:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 372) |= 0x20400000000uLL;
    objc_storeStrong((id *)(a1 + 272), a2);
  }

}

- (void)_readViewportInfo
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
  if ((*(_BYTE *)(a1 + 377) & 1) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readViewportInfo_tags_5167);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 372) |= 0x30000000000uLL;
    objc_storeStrong((id *)(a1 + 320), a2);
  }

}

- (void)setSuggestionMetadata:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 372) |= 0x28000000000uLL;
    objc_storeStrong((id *)(a1 + 312), a2);
  }

}

- (void)setSuggestionEntryMetadata:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 372) |= 0x22000000000uLL;
    objc_storeStrong((id *)(a1 + 296), a2);
  }

}

- (void)_readSuggestionEntry
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(_BYTE *)(a1 + 376) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSuggestionEntry_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  }
}

- (id)suggestionEntry
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchParameters _readSuggestionEntry]((uint64_t)a1);
    a1 = (id *)v1[38];
  }
  return a1;
}

- (void)setSuggestionEntry:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 372) |= 0x24000000000uLL;
    objc_storeStrong((id *)(a1 + 304), a2);
  }

}

- (uint64_t)searchType
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_QWORD *)(v1 + 372);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 336));
    if ((v2 & 8) != 0)
      return *(unsigned int *)(v1 + 352);
    else
      return 0;
  }
  return result;
}

- (void)setSearchStructureIntentType:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 372) |= 0x20800000000uLL;
  objc_storeStrong((id *)(a1 + 280), a2);

}

- (void)setSearchLocationParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 372) |= 0x20080000000uLL;
  objc_storeStrong((id *)(a1 + 248), a2);

}

- (void)_readRecentRouteInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(_BYTE *)(a1 + 375) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRecentRouteInfo_tags_5169);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  }
}

- (id)recentRouteInfo
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchParameters _readRecentRouteInfo]((uint64_t)a1);
    a1 = (id *)v1[26];
  }
  return a1;
}

- (void)setRecentRouteInfo:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 372) |= 0x20004000000uLL;
    objc_storeStrong((id *)(a1 + 208), a2);
  }

}

- (void)_readSearchFilter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(_BYTE *)(a1 + 375) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchFilter_tags_5170);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  }
}

- (id)searchFilter
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchParameters _readSearchFilter]((uint64_t)a1);
    a1 = (id *)v1[30];
  }
  return a1;
}

- (void)setSearchFilter:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 372) |= 0x20040000000uLL;
    objc_storeStrong((id *)(a1 + 240), a2);
  }

}

- (void)setRetainedSearch:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 372) |= 0x20010000000uLL;
    objc_storeStrong((id *)(a1 + 224), a2);
  }

}

- (void)setInferredSignals:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 372) |= 0x20000200000uLL;
  objc_storeStrong((id *)(a1 + 168), a2);

}

- (void)_readSupportedRelatedEntitySectionTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(_BYTE *)(a1 + 373) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedRelatedEntitySectionTypes_tags_5172);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  }
}

- (void)addSupportedRelatedEntitySectionType:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchParameters _readSupportedRelatedEntitySectionTypes](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(_QWORD *)(a1 + 372) |= 0x8000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    *(_QWORD *)(a1 + 372) |= 0x20000000000uLL;
  }
}

- (void)setEvChargingParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 372) |= 0x20000100000uLL;
    objc_storeStrong((id *)(a1 + 160), a2);
  }

}

- (void)_readEtaFilter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(_BYTE *)(a1 + 374) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEtaFilter_tags_5174);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  }
}

- (id)etaFilter
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchParameters _readEtaFilter]((uint64_t)a1);
    a1 = (id *)v1[19];
  }
  return a1;
}

- (void)setEtaFilter:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 372) |= 0x20000080000uLL;
    objc_storeStrong((id *)(a1 + 152), a2);
  }

}

- (void)_readSupportedSearchTierTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(_BYTE *)(a1 + 374) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedSearchTierTypes_tags_5175);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  }
}

- (void)addSupportedSearchTierType:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchParameters _readSupportedSearchTierTypes](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(_QWORD *)(a1 + 372) |= 0x20000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    *(_QWORD *)(a1 + 372) |= 0x20000000000uLL;
  }
}

- (void)_readResultRefinementQuery
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
  if ((*(_BYTE *)(a1 + 375) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResultRefinementQuery_tags_5176);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
}

- (void)setResultRefinementQuery:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 372) |= 0x20008000000uLL;
    objc_storeStrong((id *)(a1 + 216), a2);
  }

}

- (void)_readKnownRefinementTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(_BYTE *)(a1 + 373) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readKnownRefinementTypes_tags_5177);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  }
}

- (void)addKnownRefinementType:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchParameters _readKnownRefinementTypes](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(_QWORD *)(a1 + 372) |= 0x2000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    *(_QWORD *)(a1 + 372) |= 0x20000000000uLL;
  }
}

- (void)_readPreviousSearchViewport
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
  if ((*(_BYTE *)(a1 + 375) & 1) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPreviousSearchViewport_tags_5178);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
}

- (void)setPreviousSearchViewport:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 372) |= 0x20001000000uLL;
    objc_storeStrong((id *)(a1 + 192), a2);
  }

}

- (void)_readSupportedPlaceSummaryFormatTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(_BYTE *)(a1 + 373) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedPlaceSummaryFormatTypes_tags_5179);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  }
}

- (void)addSupportedPlaceSummaryFormatType:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchParameters _readSupportedPlaceSummaryFormatTypes](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(_QWORD *)(a1 + 372) |= 0x4000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    *(_QWORD *)(a1 + 372) |= 0x20000000000uLL;
  }
}

- (void)_readSupportedSearchSectionTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(_BYTE *)(a1 + 374) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedSearchSectionTypes_tags_5180);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  }
}

- (void)addSupportedSearchSectionType:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchParameters _readSupportedSearchSectionTypes](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(_QWORD *)(a1 + 372) |= 0x10000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    *(_QWORD *)(a1 + 372) |= 0x20000000000uLL;
  }
}

- (void)_readSearchOriginationInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(_BYTE *)(a1 + 376) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchOriginationInfo_tags_5181);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  }
}

- (id)searchOriginationInfo
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchParameters _readSearchOriginationInfo]((uint64_t)a1);
    a1 = (id *)v1[32];
  }
  return a1;
}

- (void)setSearchOriginationInfo:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 372) |= 0x20100000000uLL;
    objc_storeStrong((id *)(a1 + 256), a2);
  }

}

- (void)setEnrichmentCampaignNamespace:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 372) |= 0x20000040000uLL;
  objc_storeStrong((id *)(a1 + 144), a2);

}

- (void)addSearchEnrichmentRevisionMetadata:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    if ((*(_BYTE *)(a1 + 375) & 0x20) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchEnrichmentRevisionMetadatas_tags_5183);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    -[GEOPDSearchParameters _addNoFlagsSearchEnrichmentRevisionMetadata:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_QWORD *)(a1 + 372) |= 0x20000000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
    *(_QWORD *)(a1 + 372) |= 0x20000000000uLL;
  }
}

- (void)_addNoFlagsSearchEnrichmentRevisionMetadata:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 232);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 232);
      *(_QWORD *)(a1 + 232) = v5;

      v4 = *(void **)(a1 + 232);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)setSearchSessionData:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 372) |= 0x20200000000uLL;
    objc_storeStrong((id *)(a1 + 264), a2);
  }

}

- (void)setMostRecentAutocompleteRequestSessionData:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 372) |= 0x20000400000uLL;
    objc_storeStrong((id *)(a1 + 176), a2);
  }

}

- (void)_readPunchInHints
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
  if ((*(_BYTE *)(a1 + 375) & 2) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPunchInHints_tags_5185);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
}

- (void)setPunchInHints:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 372) |= 0x20002000000uLL;
    objc_storeStrong((id *)(a1 + 200), a2);
  }

}

- (void)setSessionUserActionMetadata:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 372) |= 0x21000000000uLL;
    objc_storeStrong((id *)(a1 + 288), a2);
  }

}

- (void)setPaginationParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 372) |= 0x20000800000uLL;
  objc_storeStrong((id *)(a1 + 184), a2);

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
  v8.super_class = (Class)GEOPDSearchParameters;
  -[GEOPDSearchParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  id v31;
  uint64_t v32;
  __CFString *v33;
  const __CFString *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  const __CFString *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  const __CFString *v57;
  id v58;
  uint64_t v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  const __CFString *v69;
  id v70;
  uint64_t v71;
  void *v72;
  const __CFString *v73;
  void *v74;
  const __CFString *v75;
  uint64_t v76;
  __CFString *v77;
  const __CFString *v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  void *v83;
  const __CFString *v84;
  id v85;
  void *v86;
  _QWORD *v87;
  unint64_t v88;
  uint64_t v89;
  __CFString *v90;
  const __CFString *v91;
  void *v92;
  id v93;
  id v94;
  void *v95;
  void *v96;
  const __CFString *v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  const __CFString *v102;
  id v103;
  void *v104;
  _QWORD *v105;
  unint64_t v106;
  uint64_t v107;
  __CFString *v108;
  const __CFString *v109;
  void *v110;
  const __CFString *v111;
  id v112;
  void *v113;
  void *v114;
  const __CFString *v115;
  id v116;
  void *v117;
  _QWORD *v118;
  unint64_t v119;
  uint64_t v120;
  __CFString *v121;
  const __CFString *v122;
  uint64_t v123;
  __CFString *v124;
  const __CFString *v125;
  id v126;
  void *v127;
  void *v128;
  const __CFString *v129;
  id v130;
  void *v131;
  _QWORD *v132;
  unint64_t v133;
  uint64_t v134;
  __CFString *v135;
  const __CFString *v136;
  void *v137;
  _QWORD *v138;
  unint64_t v139;
  uint64_t v140;
  __CFString *v141;
  const __CFString *v142;
  void *v143;
  const __CFString *v144;
  void *v145;
  void *v146;
  void *v147;
  const __CFString *v148;
  id v149;
  void *v150;
  const __CFString *v151;
  void *v152;
  id v153;
  id v154;
  const __CFString *v155;
  void *v156;
  id v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t i;
  void *v161;
  id v162;
  const __CFString *v163;
  void *v164;
  id v165;
  id v166;
  void *v167;
  void *v168;
  const __CFString *v169;
  id v170;
  void *v171;
  id v172;
  id v173;
  void *v174;
  void *v175;
  const __CFString *v176;
  id v177;
  id v178;
  void *v179;
  void *v180;
  const __CFString *v181;
  id v182;
  void *v183;
  id v184;
  id v185;
  void *v186;
  void *v187;
  const __CFString *v188;
  id v189;
  void *v190;
  id v191;
  id v192;
  void *v193;
  void *v194;
  const __CFString *v195;
  id v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  id v201;
  id v202;
  id v203;
  void *v205;
  _QWORD v206[4];
  id v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  _BYTE v212[128];
  uint64_t v213;

  v213 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDSearchParameters readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 372);
  if ((v4 & 0x20) != 0)
  {
    v5 = *(int *)(a1 + 360);
    if (v5 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 360));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C05188[v5];
    }
    if (a2)
      v7 = CFSTR("sortOrder");
    else
      v7 = CFSTR("sort_order");
    objc_msgSend(v205, "setObject:forKey:", v6, v7);

    v4 = *(_QWORD *)(a1 + 372);
  }
  if ((v4 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 344));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("maxResults");
    else
      v9 = CFSTR("max_results");
    objc_msgSend(v205, "setObject:forKey:", v8, v9);

  }
  -[GEOPDSearchParameters searchString]((id *)a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (a2)
      v11 = CFSTR("searchString");
    else
      v11 = CFSTR("search_string");
    objc_msgSend(v205, "setObject:forKey:", v10, v11);
  }

  -[GEOPDSearchParameters _readViewportInfo](a1);
  v12 = *(id *)(a1 + 320);
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "jsonRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("viewportInfo");
    }
    else
    {
      objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("viewport_info");
    }
    v16 = v14;

    objc_msgSend(v205, "setObject:forKey:", v16, v15);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
  if ((*(_BYTE *)(a1 + 376) & 0x80) == 0)
  {
    v17 = *(void **)(a1 + 8);
    if (v17)
    {
      v18 = v17;
      objc_sync_enter(v18);
      GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSuggestionMetadata_tags);
      objc_sync_exit(v18);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  v19 = *(id *)(a1 + 312);
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v19, "base64EncodedStringWithOptions:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKey:", v21, CFSTR("suggestionMetadata"));

    }
    else
    {
      objc_msgSend(v205, "setObject:forKey:", v19, CFSTR("suggestion_metadata"));
    }
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
  if ((*(_BYTE *)(a1 + 376) & 0x20) == 0)
  {
    v22 = *(void **)(a1 + 8);
    if (v22)
    {
      v23 = v22;
      objc_sync_enter(v23);
      GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSuggestionEntryMetadata_tags_5168);
      objc_sync_exit(v23);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  v24 = *(id *)(a1 + 296);
  v25 = v24;
  if (v24)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v24, "base64EncodedStringWithOptions:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setObject:forKey:", v26, CFSTR("suggestionEntryMetadata"));

    }
    else
    {
      objc_msgSend(v205, "setObject:forKey:", v24, CFSTR("suggestion_entry_metadata"));
    }
  }

  -[GEOPDSearchParameters suggestionEntry]((id *)a1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v27, "jsonRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("suggestionEntry");
    }
    else
    {
      objc_msgSend(v27, "dictionaryRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("suggestion_entry");
    }
    v31 = v29;

    objc_msgSend(v205, "setObject:forKey:", v31, v30);
  }

  if ((*(_BYTE *)(a1 + 372) & 8) != 0)
  {
    v32 = *(int *)(a1 + 352);
    if (v32 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 352));
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = off_1E1C04EF8[v32];
    }
    if (a2)
      v34 = CFSTR("searchType");
    else
      v34 = CFSTR("search_type");
    objc_msgSend(v205, "setObject:forKey:", v33, v34);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
  if ((*(_BYTE *)(a1 + 376) & 8) == 0)
  {
    v35 = *(void **)(a1 + 8);
    if (v35)
    {
      v36 = v35;
      objc_sync_enter(v36);
      GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchStructureIntentType_tags);
      objc_sync_exit(v36);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  v37 = *(id *)(a1 + 280);
  v38 = v37;
  if (v37)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v37, "jsonRepresentation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = CFSTR("searchStructureIntentType");
    }
    else
    {
      objc_msgSend(v37, "dictionaryRepresentation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = CFSTR("search_structure_intent_type");
    }
    v41 = v39;

    objc_msgSend(v205, "setObject:forKey:", v41, v40);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
  if ((*(_BYTE *)(a1 + 375) & 0x80) == 0)
  {
    v42 = *(void **)(a1 + 8);
    if (v42)
    {
      v43 = v42;
      objc_sync_enter(v43);
      GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchLocationParameters_tags);
      objc_sync_exit(v43);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  v44 = *(id *)(a1 + 248);
  v45 = v44;
  if (v44)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v44, "jsonRepresentation");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = CFSTR("searchLocationParameters");
    }
    else
    {
      objc_msgSend(v44, "dictionaryRepresentation");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = CFSTR("search_location_parameters");
    }
    v48 = v46;

    objc_msgSend(v205, "setObject:forKey:", v48, v47);
  }

  -[GEOPDSearchParameters recentRouteInfo]((id *)a1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v49;
  if (v49)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v49, "jsonRepresentation");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = CFSTR("recentRouteInfo");
    }
    else
    {
      objc_msgSend(v49, "dictionaryRepresentation");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = CFSTR("recent_route_info");
    }
    v53 = v51;

    objc_msgSend(v205, "setObject:forKey:", v53, v52);
  }

  -[GEOPDSearchParameters searchFilter]((id *)a1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  if (v54)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v54, "jsonRepresentation");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = CFSTR("searchFilter");
    }
    else
    {
      objc_msgSend(v54, "dictionaryRepresentation");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = CFSTR("search_filter");
    }
    v58 = v56;

    objc_msgSend(v205, "setObject:forKey:", v58, v57);
  }

  v59 = *(_QWORD *)(a1 + 372);
  if ((v59 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 365));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v61 = CFSTR("supportDymSuggestion");
    else
      v61 = CFSTR("support_dym_suggestion");
    objc_msgSend(v205, "setObject:forKey:", v60, v61);

    v59 = *(_QWORD *)(a1 + 372);
  }
  if ((v59 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 364));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v63 = CFSTR("supportDirectionIntentSearch");
    else
      v63 = CFSTR("support_direction_intent_search");
    objc_msgSend(v205, "setObject:forKey:", v62, v63);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
  if ((*(_BYTE *)(a1 + 375) & 0x10) == 0)
  {
    v64 = *(void **)(a1 + 8);
    if (v64)
    {
      v65 = v64;
      objc_sync_enter(v65);
      GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRetainedSearch_tags_5171);
      objc_sync_exit(v65);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  v66 = *(id *)(a1 + 224);
  v67 = v66;
  if (v66)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v66, "jsonRepresentation");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = CFSTR("retainedSearch");
    }
    else
    {
      objc_msgSend(v66, "dictionaryRepresentation");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = CFSTR("retained_search");
    }
    v70 = v68;

    objc_msgSend(v205, "setObject:forKey:", v70, v69);
  }

  v71 = *(_QWORD *)(a1 + 372);
  if ((v71 & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 369));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v73 = CFSTR("supportUnresolvedDirectionIntent");
    else
      v73 = CFSTR("support_unresolved_direction_intent");
    objc_msgSend(v205, "setObject:forKey:", v72, v73);

    v71 = *(_QWORD *)(a1 + 372);
  }
  if ((v71 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 367));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v75 = CFSTR("supportSearchResultSection");
    else
      v75 = CFSTR("support_search_result_section");
    objc_msgSend(v205, "setObject:forKey:", v74, v75);

    v71 = *(_QWORD *)(a1 + 372);
  }
  if ((v71 & 0x10) != 0)
  {
    v76 = *(int *)(a1 + 356);
    if (v76 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 356));
      v77 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v77 = off_1E1C04F28[v76];
    }
    if (a2)
      v78 = CFSTR("sortDirection");
    else
      v78 = CFSTR("sort_direction");
    objc_msgSend(v205, "setObject:forKey:", v77, v78);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
  if ((*(_BYTE *)(a1 + 374) & 0x20) == 0)
  {
    v79 = *(void **)(a1 + 8);
    if (v79)
    {
      v80 = v79;
      objc_sync_enter(v80);
      GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInferredSignals_tags);
      objc_sync_exit(v80);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  v81 = *(id *)(a1 + 168);
  v82 = v81;
  if (v81)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v81, "jsonRepresentation");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = CFSTR("inferredSignals");
    }
    else
    {
      objc_msgSend(v81, "dictionaryRepresentation");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = CFSTR("inferred_signals");
    }
    v85 = v83;

    objc_msgSend(v205, "setObject:forKey:", v85, v84);
  }

  if (*(_QWORD *)(a1 + 80))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = (_QWORD *)(a1 + 72);
    if (*(_QWORD *)(a1 + 80))
    {
      v88 = 0;
      do
      {
        v89 = *(unsigned int *)(*v87 + 4 * v88);
        if ((_DWORD)v89)
        {
          if ((_DWORD)v89 == 1)
          {
            v90 = CFSTR("RELATED_ENTITY_SECTION_TYPE_COLLECTION");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v89);
            v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v90 = CFSTR("RELATED_ENTITY_SECTION_TYPE_UNKNOWN");
        }
        objc_msgSend(v86, "addObject:", v90);

        ++v88;
        v87 = (_QWORD *)(a1 + 72);
      }
      while (v88 < *(_QWORD *)(a1 + 80));
    }
    if (a2)
      v91 = CFSTR("supportedRelatedEntitySectionType");
    else
      v91 = CFSTR("supported_related_entity_section_type");
    objc_msgSend(v205, "setObject:forKey:", v86, v91);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
  if ((*(_BYTE *)(a1 + 374) & 0x10) == 0)
  {
    v92 = *(void **)(a1 + 8);
    if (v92)
    {
      v93 = v92;
      objc_sync_enter(v93);
      GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEvChargingParameters_tags_5173);
      objc_sync_exit(v93);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  v94 = *(id *)(a1 + 160);
  v95 = v94;
  if (v94)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v94, "jsonRepresentation");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = CFSTR("evChargingParameters");
    }
    else
    {
      objc_msgSend(v94, "dictionaryRepresentation");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = CFSTR("ev_charging_parameters");
    }
    v98 = v96;

    objc_msgSend(v205, "setObject:forKey:", v98, v97);
  }

  -[GEOPDSearchParameters etaFilter]((id *)a1);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v99;
  if (v99)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v99, "jsonRepresentation");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = CFSTR("etaFilter");
    }
    else
    {
      objc_msgSend(v99, "dictionaryRepresentation");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = CFSTR("eta_filter");
    }
    v103 = v101;

    objc_msgSend(v205, "setObject:forKey:", v103, v102);
  }

  if (*(_QWORD *)(a1 + 128))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = (_QWORD *)(a1 + 120);
    if (*(_QWORD *)(a1 + 128))
    {
      v106 = 0;
      do
      {
        v107 = *(int *)(*v105 + 4 * v106);
        if (v107 >= 3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v107);
          v108 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v108 = off_1E1C04F40[v107];
        }
        objc_msgSend(v104, "addObject:", v108);

        ++v106;
        v105 = (_QWORD *)(a1 + 120);
      }
      while (v106 < *(_QWORD *)(a1 + 128));
    }
    if (a2)
      v109 = CFSTR("supportedSearchTierType");
    else
      v109 = CFSTR("supported_search_tier_type");
    objc_msgSend(v205, "setObject:forKey:", v104, v109);

  }
  if ((*(_BYTE *)(a1 + 372) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 340));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v111 = CFSTR("auxiliaryTierNumResults");
    else
      v111 = CFSTR("auxiliary_tier_num_results");
    objc_msgSend(v205, "setObject:forKey:", v110, v111);

  }
  -[GEOPDSearchParameters _readResultRefinementQuery](a1);
  v112 = *(id *)(a1 + 216);
  v113 = v112;
  if (v112)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v112, "jsonRepresentation");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = CFSTR("resultRefinementQuery");
    }
    else
    {
      objc_msgSend(v112, "dictionaryRepresentation");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = CFSTR("result_refinement_query");
    }
    v116 = v114;

    objc_msgSend(v205, "setObject:forKey:", v116, v115);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v119 = 0;
      do
      {
        v120 = *(int *)(*v118 + 4 * v119);
        if (v120 >= 7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v120);
          v121 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v121 = off_1E1C04F58[v120];
        }
        objc_msgSend(v117, "addObject:", v121);

        ++v119;
        v118 = (_QWORD *)(a1 + 24);
      }
      while (v119 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v122 = CFSTR("knownRefinementType");
    else
      v122 = CFSTR("known_refinement_type");
    objc_msgSend(v205, "setObject:forKey:", v117, v122);

  }
  if ((*(_BYTE *)(a1 + 372) & 4) != 0)
  {
    v123 = *(int *)(a1 + 348);
    if (v123 >= 0x24)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 348));
      v124 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v124 = off_1E1C04F90[v123];
    }
    if (a2)
      v125 = CFSTR("placeSummaryRevision");
    else
      v125 = CFSTR("place_summary_revision");
    objc_msgSend(v205, "setObject:forKey:", v124, v125);

  }
  -[GEOPDSearchParameters _readPreviousSearchViewport](a1);
  v126 = *(id *)(a1 + 192);
  v127 = v126;
  if (v126)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v126, "jsonRepresentation");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = CFSTR("previousSearchViewport");
    }
    else
    {
      objc_msgSend(v126, "dictionaryRepresentation");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = CFSTR("previous_search_viewport");
    }
    v130 = v128;

    objc_msgSend(v205, "setObject:forKey:", v130, v129);
  }

  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = (_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 56))
    {
      v133 = 0;
      do
      {
        v134 = *(int *)(*v132 + 4 * v133);
        if (v134 >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v134);
          v135 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v135 = off_1E1C050B0[v134];
        }
        objc_msgSend(v131, "addObject:", v135);

        ++v133;
        v132 = (_QWORD *)(a1 + 48);
      }
      while (v133 < *(_QWORD *)(a1 + 56));
    }
    if (a2)
      v136 = CFSTR("supportedPlaceSummaryFormatType");
    else
      v136 = CFSTR("supported_place_summary_format_type");
    objc_msgSend(v205, "setObject:forKey:", v131, v136);

  }
  if (*(_QWORD *)(a1 + 104))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = (_QWORD *)(a1 + 96);
    if (*(_QWORD *)(a1 + 104))
    {
      v139 = 0;
      do
      {
        v140 = *(int *)(*v138 + 4 * v139);
        if (v140 >= 3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v140);
          v141 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v141 = off_1E1C050D8[v140];
        }
        objc_msgSend(v137, "addObject:", v141);

        ++v139;
        v138 = (_QWORD *)(a1 + 96);
      }
      while (v139 < *(_QWORD *)(a1 + 104));
    }
    if (a2)
      v142 = CFSTR("supportedSearchSectionType");
    else
      v142 = CFSTR("supported_search_section_type");
    objc_msgSend(v205, "setObject:forKey:", v137, v142);

  }
  if ((*(_BYTE *)(a1 + 373) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 366));
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v144 = CFSTR("supportSearchEnrichment");
    else
      v144 = CFSTR("support_search_enrichment");
    objc_msgSend(v205, "setObject:forKey:", v143, v144);

  }
  -[GEOPDSearchParameters searchOriginationInfo]((id *)a1);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = v145;
  if (v145)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v145, "jsonRepresentation");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      v148 = CFSTR("searchOriginationInfo");
    }
    else
    {
      objc_msgSend(v145, "dictionaryRepresentation");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      v148 = CFSTR("search_origination_info");
    }
    v149 = v147;

    objc_msgSend(v205, "setObject:forKey:", v149, v148);
  }

  if ((*(_BYTE *)(a1 + 373) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 368));
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v151 = CFSTR("supportStructuredRapAffordance");
    else
      v151 = CFSTR("support_structured_rap_affordance");
    objc_msgSend(v205, "setObject:forKey:", v150, v151);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
  if ((*(_BYTE *)(a1 + 374) & 4) == 0)
  {
    v152 = *(void **)(a1 + 8);
    if (v152)
    {
      v153 = v152;
      objc_sync_enter(v153);
      GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEnrichmentCampaignNamespace_tags_5182);
      objc_sync_exit(v153);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  v154 = *(id *)(a1 + 144);
  if (v154)
  {
    if (a2)
      v155 = CFSTR("enrichmentCampaignNamespace");
    else
      v155 = CFSTR("enrichment_campaign_namespace");
    objc_msgSend(v205, "setObject:forKey:", v154, v155);
  }

  if (objc_msgSend(*(id *)(a1 + 232), "count"))
  {
    v156 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 232), "count"));
    v208 = 0u;
    v209 = 0u;
    v210 = 0u;
    v211 = 0u;
    v157 = *(id *)(a1 + 232);
    v158 = objc_msgSend(v157, "countByEnumeratingWithState:objects:count:", &v208, v212, 16);
    if (v158)
    {
      v159 = *(_QWORD *)v209;
      do
      {
        for (i = 0; i != v158; ++i)
        {
          if (*(_QWORD *)v209 != v159)
            objc_enumerationMutation(v157);
          v161 = *(void **)(*((_QWORD *)&v208 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v161, "jsonRepresentation");
          else
            objc_msgSend(v161, "dictionaryRepresentation");
          v162 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v156, "addObject:", v162);
        }
        v158 = objc_msgSend(v157, "countByEnumeratingWithState:objects:count:", &v208, v212, 16);
      }
      while (v158);
    }

    if (a2)
      v163 = CFSTR("searchEnrichmentRevisionMetadata");
    else
      v163 = CFSTR("search_enrichment_revision_metadata");
    objc_msgSend(v205, "setObject:forKey:", v156, v163);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
  if ((*(_BYTE *)(a1 + 376) & 2) == 0)
  {
    v164 = *(void **)(a1 + 8);
    if (v164)
    {
      v165 = v164;
      objc_sync_enter(v165);
      GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchSessionData_tags_5184);
      objc_sync_exit(v165);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  v166 = *(id *)(a1 + 264);
  v167 = v166;
  if (v166)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v166, "jsonRepresentation");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      v169 = CFSTR("searchSessionData");
    }
    else
    {
      objc_msgSend(v166, "dictionaryRepresentation");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      v169 = CFSTR("search_session_data");
    }
    v170 = v168;

    objc_msgSend(v205, "setObject:forKey:", v170, v169);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
  if ((*(_BYTE *)(a1 + 374) & 0x40) == 0)
  {
    v171 = *(void **)(a1 + 8);
    if (v171)
    {
      v172 = v171;
      objc_sync_enter(v172);
      GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMostRecentAutocompleteRequestSessionData_tags);
      objc_sync_exit(v172);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  v173 = *(id *)(a1 + 176);
  v174 = v173;
  if (v173)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v173, "jsonRepresentation");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      v176 = CFSTR("mostRecentAutocompleteRequestSessionData");
    }
    else
    {
      objc_msgSend(v173, "dictionaryRepresentation");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      v176 = CFSTR("most_recent_autocomplete_request_session_data");
    }
    v177 = v175;

    objc_msgSend(v205, "setObject:forKey:", v177, v176);
  }

  -[GEOPDSearchParameters _readPunchInHints](a1);
  v178 = *(id *)(a1 + 200);
  v179 = v178;
  if (v178)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v178, "jsonRepresentation");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      v181 = CFSTR("punchInHints");
    }
    else
    {
      objc_msgSend(v178, "dictionaryRepresentation");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      v181 = CFSTR("punch_in_hints");
    }
    v182 = v180;

    objc_msgSend(v205, "setObject:forKey:", v182, v181);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
  if ((*(_BYTE *)(a1 + 376) & 0x10) == 0)
  {
    v183 = *(void **)(a1 + 8);
    if (v183)
    {
      v184 = v183;
      objc_sync_enter(v184);
      GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSessionUserActionMetadata_tags_5186);
      objc_sync_exit(v184);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  v185 = *(id *)(a1 + 288);
  v186 = v185;
  if (v185)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v185, "jsonRepresentation");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      v188 = CFSTR("sessionUserActionMetadata");
    }
    else
    {
      objc_msgSend(v185, "dictionaryRepresentation");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      v188 = CFSTR("session_user_action_metadata");
    }
    v189 = v187;

    objc_msgSend(v205, "setObject:forKey:", v189, v188);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
  if ((*(_BYTE *)(a1 + 374) & 0x80) == 0)
  {
    v190 = *(void **)(a1 + 8);
    if (v190)
    {
      v191 = v190;
      objc_sync_enter(v191);
      GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPaginationParameters_tags_5187);
      objc_sync_exit(v191);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  v192 = *(id *)(a1 + 184);
  v193 = v192;
  if (v192)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v192, "jsonRepresentation");
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      v195 = CFSTR("paginationParameters");
    }
    else
    {
      objc_msgSend(v192, "dictionaryRepresentation");
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      v195 = CFSTR("pagination_parameters");
    }
    v196 = v194;

    objc_msgSend(v205, "setObject:forKey:", v196, v195);
  }

  v197 = *(void **)(a1 + 16);
  if (v197)
  {
    objc_msgSend(v197, "dictionaryRepresentation");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    v199 = v198;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v198, "count"));
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      v206[0] = MEMORY[0x1E0C809B0];
      v206[1] = 3221225472;
      v206[2] = __51__GEOPDSearchParameters__dictionaryRepresentation___block_invoke;
      v206[3] = &unk_1E1C00600;
      v201 = v200;
      v207 = v201;
      objc_msgSend(v199, "enumerateKeysAndObjectsUsingBlock:", v206);
      v202 = v201;

    }
    else
    {
      v202 = v198;
    }
    objc_msgSend(v205, "setObject:forKey:", v202, CFSTR("Unknown Fields"));

  }
  v203 = v205;

  return v203;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 336));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_5231;
      else
        v6 = (int *)&readAll__nonRecursiveTag_5232;
      GEOPDSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSearchParametersCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 336));
  }
}

void __51__GEOPDSearchParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (char)_initWithDictionary:(uint64_t)a3 isJSON:
{
  id v5;
  char *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  int v10;
  const __CFString *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  GEOPDViewportInfo *v19;
  GEOPDViewportInfo *v20;
  GEOPDViewportInfo *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  GEOPDAutocompleteEntry *v30;
  GEOPDAutocompleteEntry *v31;
  GEOPDAutocompleteEntry *v32;
  const __CFString *v33;
  void *v34;
  id v35;
  int v36;
  const __CFString *v37;
  void *v38;
  GEOPDSSearchStructureIntentRequestType *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  GEOPDSSearchLocationParameters *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  GEOPDRecentRouteInfo *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  GEOPDSSearchFilter *v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  char v55;
  const __CFString *v56;
  void *v57;
  char v58;
  const __CFString *v59;
  void *v60;
  GEOPDRetainedSearchMetadata *v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  char v65;
  const __CFString *v66;
  void *v67;
  char v68;
  const __CFString *v69;
  void *v70;
  id v71;
  int v72;
  const __CFString *v73;
  void *v74;
  GEOPDSInferredSignals *v75;
  void *v76;
  const __CFString *v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t i;
  void *v84;
  id v85;
  const __CFString *v86;
  void *v87;
  GEOPDSSearchEvChargingParameters *v88;
  void *v89;
  const __CFString *v90;
  void *v91;
  GEOPDETAFilter *v92;
  void *v93;
  const __CFString *v94;
  void *v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t j;
  void *v101;
  id v102;
  const __CFString *v103;
  void *v104;
  int v105;
  const __CFString *v106;
  void *v107;
  GEOPDResultRefinementQuery *v108;
  GEOPDResultRefinementQuery *v109;
  GEOPDResultRefinementQuery *v110;
  const __CFString *v111;
  void *v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t k;
  void *v118;
  id v119;
  const __CFString *v120;
  void *v121;
  id v122;
  int v123;
  const __CFString *v124;
  void *v125;
  GEOPDViewportInfo *v126;
  GEOPDViewportInfo *v127;
  GEOPDViewportInfo *v128;
  const __CFString *v129;
  void *v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t m;
  void *v136;
  id v137;
  const __CFString *v138;
  void *v139;
  id v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t n;
  void *v145;
  id v146;
  const __CFString *v147;
  void *v148;
  char v149;
  const __CFString *v150;
  void *v151;
  GEOPDSearchOriginationInfo *v152;
  void *v153;
  const __CFString *v154;
  void *v155;
  char v156;
  const __CFString *v157;
  void *v158;
  void *v159;
  const __CFString *v160;
  void *v161;
  id v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  GEOPDSearchEnrichmentRevisionMetadata *v168;
  void *v169;
  uint64_t v170;
  const __CFString *v171;
  void *v172;
  void *v173;
  const __CFString *v174;
  void *v175;
  GEOPDAutocompleteSessionData *v176;
  GEOPDAutocompleteSessionData *v177;
  GEOPDAutocompleteSessionData *v178;
  const __CFString *v179;
  void *v180;
  GEOPDSPunchInHints *v181;
  void *v182;
  const __CFString *v183;
  void *v184;
  GEOPDSSessionUserActionMetadata *v185;
  GEOPDSSessionUserActionMetadata *v186;
  GEOPDSSessionUserActionMetadata *v187;
  const __CFString *v188;
  void *v189;
  GEOPDPaginationParameters *v190;
  void *v191;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  id v198;
  int v199;
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
  __int128 v210;
  __int128 v211;
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
  _BYTE v224[128];
  _BYTE v225[128];
  _BYTE v226[128];
  _BYTE v227[128];
  _BYTE v228[128];
  _BYTE v229[128];
  uint64_t v230;

  v230 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (char *)(id)objc_msgSend(a1, "init");

  if (!v6)
    goto LABEL_464;
  if ((_DWORD)a3)
    v7 = CFSTR("sortOrder");
  else
    v7 = CFSTR("sort_order");
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RELEVANCE")) & 1) != 0)
    {
      v10 = 0;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("RATING")) & 1) != 0)
    {
      v10 = 1;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("DISTANCE")) & 1) != 0)
    {
      v10 = 2;
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("PRICE")))
    {
      v10 = 3;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_19;
    v10 = objc_msgSend(v8, "intValue");
  }
  *(_QWORD *)(v6 + 372) |= 0x20000000020uLL;
  *((_DWORD *)v6 + 90) = v10;
LABEL_19:

  if ((_DWORD)a3)
    v11 = CFSTR("maxResults");
  else
    v11 = CFSTR("max_results");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_msgSend(v12, "unsignedIntValue");
    *(_QWORD *)(v6 + 372) |= 0x20000000002uLL;
    *((_DWORD *)v6 + 86) = v13;
  }

  if ((_DWORD)a3)
    v14 = CFSTR("searchString");
  else
    v14 = CFSTR("search_string");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = (void *)objc_msgSend(v15, "copy");
    -[GEOPDSearchParameters setSearchString:]((uint64_t)v6, v16);

  }
  if ((_DWORD)a3)
    v17 = CFSTR("viewportInfo");
  else
    v17 = CFSTR("viewport_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = [GEOPDViewportInfo alloc];
    if ((a3 & 1) != 0)
      v20 = -[GEOPDViewportInfo initWithJSON:](v19, "initWithJSON:", v18);
    else
      v20 = -[GEOPDViewportInfo initWithDictionary:](v19, "initWithDictionary:", v18);
    v21 = v20;
    -[GEOPDSearchParameters setViewportInfo:]((uint64_t)v6, v20);

  }
  if ((_DWORD)a3)
    v22 = CFSTR("suggestionMetadata");
  else
    v22 = CFSTR("suggestion_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v23, 0);
    -[GEOPDSearchParameters setSuggestionMetadata:]((uint64_t)v6, v24);

  }
  if ((_DWORD)a3)
    v25 = CFSTR("suggestionEntryMetadata");
  else
    v25 = CFSTR("suggestion_entry_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v26, 0);
    -[GEOPDSearchParameters setSuggestionEntryMetadata:]((uint64_t)v6, v27);

  }
  if ((_DWORD)a3)
    v28 = CFSTR("suggestionEntry");
  else
    v28 = CFSTR("suggestion_entry");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = [GEOPDAutocompleteEntry alloc];
    if ((a3 & 1) != 0)
      v31 = -[GEOPDAutocompleteEntry initWithJSON:](v30, "initWithJSON:", v29);
    else
      v31 = -[GEOPDAutocompleteEntry initWithDictionary:](v30, "initWithDictionary:", v29);
    v32 = v31;
    -[GEOPDSearchParameters setSuggestionEntry:]((uint64_t)v6, v31);

  }
  if ((_DWORD)a3)
    v33 = CFSTR("searchType");
  else
    v33 = CFSTR("search_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = v34;
    if ((objc_msgSend(v35, "isEqualToString:", CFSTR("SEARCH_TYPE_UNKNOWN")) & 1) != 0)
    {
      v36 = 0;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("SEARCH_TYPE_DEFAULT")) & 1) != 0)
    {
      v36 = 1;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("SEARCH_TYPE_REDO")) & 1) != 0)
    {
      v36 = 2;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("SEARCH_TYPE_BRAND_PROFILE")) & 1) != 0)
    {
      v36 = 3;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("SEARCH_TYPE_AUTO_REDO")) & 1) != 0)
    {
      v36 = 4;
    }
    else if (objc_msgSend(v35, "isEqualToString:", CFSTR("SEARCH_TYPE_BEACH_AND_RELATED_CONCEPT")))
    {
      v36 = 5;
    }
    else
    {
      v36 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_76;
    v36 = objc_msgSend(v34, "intValue");
  }
  *(_QWORD *)(v6 + 372) |= 0x20000000008uLL;
  *((_DWORD *)v6 + 88) = v36;
LABEL_76:

  if ((_DWORD)a3)
    v37 = CFSTR("searchStructureIntentType");
  else
    v37 = CFSTR("search_structure_intent_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = [GEOPDSSearchStructureIntentRequestType alloc];
    if (v39)
      v40 = (void *)-[GEOPDSSearchStructureIntentRequestType _initWithDictionary:isJSON:]((uint64_t)v39, v38, a3);
    else
      v40 = 0;
    -[GEOPDSearchParameters setSearchStructureIntentType:]((uint64_t)v6, v40);

  }
  if ((_DWORD)a3)
    v41 = CFSTR("searchLocationParameters");
  else
    v41 = CFSTR("search_location_parameters");
  objc_msgSend(v5, "objectForKeyedSubscript:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = [GEOPDSSearchLocationParameters alloc];
    if (v43)
      v44 = (void *)-[GEOPDSSearchLocationParameters _initWithDictionary:isJSON:]((uint64_t)v43, v42, a3);
    else
      v44 = 0;
    -[GEOPDSearchParameters setSearchLocationParameters:]((uint64_t)v6, v44);

  }
  if ((_DWORD)a3)
    v45 = CFSTR("recentRouteInfo");
  else
    v45 = CFSTR("recent_route_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v47 = [GEOPDRecentRouteInfo alloc];
    if (v47)
      v48 = (void *)-[GEOPDRecentRouteInfo _initWithDictionary:isJSON:](v47, v46, a3);
    else
      v48 = 0;
    -[GEOPDSearchParameters setRecentRouteInfo:]((uint64_t)v6, v48);

  }
  if ((_DWORD)a3)
    v49 = CFSTR("searchFilter");
  else
    v49 = CFSTR("search_filter");
  objc_msgSend(v5, "objectForKeyedSubscript:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v51 = [GEOPDSSearchFilter alloc];
    if (v51)
      v52 = (void *)-[GEOPDSSearchFilter _initWithDictionary:isJSON:](v51, v50, a3);
    else
      v52 = 0;
    -[GEOPDSearchParameters setSearchFilter:]((uint64_t)v6, v52);

  }
  if ((_DWORD)a3)
    v53 = CFSTR("supportDymSuggestion");
  else
    v53 = CFSTR("support_dym_suggestion");
  objc_msgSend(v5, "objectForKeyedSubscript:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v55 = objc_msgSend(v54, "BOOLValue");
    *(_QWORD *)(v6 + 372) |= 0x20000000080uLL;
    v6[365] = v55;
  }

  if ((_DWORD)a3)
    v56 = CFSTR("supportDirectionIntentSearch");
  else
    v56 = CFSTR("support_direction_intent_search");
  objc_msgSend(v5, "objectForKeyedSubscript:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v58 = objc_msgSend(v57, "BOOLValue");
    *(_QWORD *)(v6 + 372) |= 0x20000000040uLL;
    v6[364] = v58;
  }

  if ((_DWORD)a3)
    v59 = CFSTR("retainedSearch");
  else
    v59 = CFSTR("retained_search");
  objc_msgSend(v5, "objectForKeyedSubscript:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v61 = [GEOPDRetainedSearchMetadata alloc];
    if (v61)
      v62 = (void *)-[GEOPDRetainedSearchMetadata _initWithDictionary:isJSON:]((uint64_t)v61, v60, a3);
    else
      v62 = 0;
    -[GEOPDSearchParameters setRetainedSearch:]((uint64_t)v6, v62);

  }
  if ((_DWORD)a3)
    v63 = CFSTR("supportUnresolvedDirectionIntent");
  else
    v63 = CFSTR("support_unresolved_direction_intent");
  objc_msgSend(v5, "objectForKeyedSubscript:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v65 = objc_msgSend(v64, "BOOLValue");
    *(_QWORD *)(v6 + 372) |= 0x20000000800uLL;
    v6[369] = v65;
  }

  if ((_DWORD)a3)
    v66 = CFSTR("supportSearchResultSection");
  else
    v66 = CFSTR("support_search_result_section");
  objc_msgSend(v5, "objectForKeyedSubscript:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v68 = objc_msgSend(v67, "BOOLValue");
    *(_QWORD *)(v6 + 372) |= 0x20000000200uLL;
    v6[367] = v68;
  }

  if ((_DWORD)a3)
    v69 = CFSTR("sortDirection");
  else
    v69 = CFSTR("sort_direction");
  objc_msgSend(v5, "objectForKeyedSubscript:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v71 = v70;
    if ((objc_msgSend(v71, "isEqualToString:", CFSTR("SORT_DIRECTION_UNKNOWN")) & 1) != 0)
    {
      v72 = 0;
    }
    else if ((objc_msgSend(v71, "isEqualToString:", CFSTR("SORT_DIRECTION_ASCENDING")) & 1) != 0)
    {
      v72 = 1;
    }
    else if (objc_msgSend(v71, "isEqualToString:", CFSTR("SORT_DIRECTION_DESCENDING")))
    {
      v72 = 2;
    }
    else
    {
      v72 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_146;
    v72 = objc_msgSend(v70, "intValue");
  }
  *(_QWORD *)(v6 + 372) |= 0x20000000010uLL;
  *((_DWORD *)v6 + 89) = v72;
LABEL_146:

  if ((_DWORD)a3)
    v73 = CFSTR("inferredSignals");
  else
    v73 = CFSTR("inferred_signals");
  objc_msgSend(v5, "objectForKeyedSubscript:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v75 = [GEOPDSInferredSignals alloc];
    if (v75)
      v76 = -[GEOPDSInferredSignals _initWithDictionary:isJSON:](v75, v74, a3);
    else
      v76 = 0;
    -[GEOPDSearchParameters setInferredSignals:]((uint64_t)v6, v76);

  }
  if ((_DWORD)a3)
    v77 = CFSTR("supportedRelatedEntitySectionType");
  else
    v77 = CFSTR("supported_related_entity_section_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v198 = v5;
  v199 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v222 = 0u;
    v223 = 0u;
    v220 = 0u;
    v221 = 0u;
    v193 = v78;
    v79 = v78;
    v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v220, v229, 16);
    if (!v80)
      goto LABEL_172;
    v81 = v80;
    v82 = *(_QWORD *)v221;
    while (1)
    {
      for (i = 0; i != v81; ++i)
      {
        if (*(_QWORD *)v221 != v82)
          objc_enumerationMutation(v79);
        v84 = *(void **)(*((_QWORD *)&v220 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v85 = v84;
          if ((objc_msgSend(v85, "isEqualToString:", CFSTR("RELATED_ENTITY_SECTION_TYPE_UNKNOWN")) & 1) == 0)
            objc_msgSend(v85, "isEqualToString:", CFSTR("RELATED_ENTITY_SECTION_TYPE_COLLECTION"));

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          objc_msgSend(v84, "intValue");
        }
        -[GEOPDSearchParameters addSupportedRelatedEntitySectionType:]((uint64_t)v6);
      }
      v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v220, v229, 16);
      if (!v81)
      {
LABEL_172:

        v78 = v193;
        LODWORD(a3) = v199;
        break;
      }
    }
  }

  if ((_DWORD)a3)
    v86 = CFSTR("evChargingParameters");
  else
    v86 = CFSTR("ev_charging_parameters");
  objc_msgSend(v5, "objectForKeyedSubscript:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v88 = [GEOPDSSearchEvChargingParameters alloc];
    if (v88)
      v89 = -[GEOPDSSearchEvChargingParameters _initWithDictionary:isJSON:](v88, v87, a3);
    else
      v89 = 0;
    -[GEOPDSearchParameters setEvChargingParameters:]((uint64_t)v6, v89);

  }
  if ((_DWORD)a3)
    v90 = CFSTR("etaFilter");
  else
    v90 = CFSTR("eta_filter");
  objc_msgSend(v5, "objectForKeyedSubscript:", v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v92 = [GEOPDETAFilter alloc];
    if (v92)
      v93 = (void *)-[GEOPDETAFilter _initWithDictionary:isJSON:](v92, v91, a3);
    else
      v93 = 0;
    -[GEOPDSearchParameters setEtaFilter:]((uint64_t)v6, v93);

  }
  if ((_DWORD)a3)
    v94 = CFSTR("supportedSearchTierType");
  else
    v94 = CFSTR("supported_search_tier_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v218 = 0u;
    v219 = 0u;
    v216 = 0u;
    v217 = 0u;
    v194 = v95;
    v96 = v95;
    v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v216, v228, 16);
    if (!v97)
      goto LABEL_207;
    v98 = v97;
    v99 = *(_QWORD *)v217;
    while (1)
    {
      for (j = 0; j != v98; ++j)
      {
        if (*(_QWORD *)v217 != v99)
          objc_enumerationMutation(v96);
        v101 = *(void **)(*((_QWORD *)&v216 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v102 = v101;
          if ((objc_msgSend(v102, "isEqualToString:", CFSTR("SEARCH_TIER_METADATA_UNKNOWN")) & 1) == 0
            && (objc_msgSend(v102, "isEqualToString:", CFSTR("SEARCH_TIER_METADATA_PRIMARY")) & 1) == 0)
          {
            objc_msgSend(v102, "isEqualToString:", CFSTR("SEARCH_TIER_METADATA_AUXILIARY"));
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          objc_msgSend(v101, "intValue");
        }
        -[GEOPDSearchParameters addSupportedSearchTierType:]((uint64_t)v6);
      }
      v98 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v216, v228, 16);
      if (!v98)
      {
LABEL_207:

        v95 = v194;
        LODWORD(a3) = v199;
        break;
      }
    }
  }

  if ((_DWORD)a3)
    v103 = CFSTR("auxiliaryTierNumResults");
  else
    v103 = CFSTR("auxiliary_tier_num_results");
  objc_msgSend(v5, "objectForKeyedSubscript:", v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v105 = objc_msgSend(v104, "unsignedIntValue");
    *(_QWORD *)(v6 + 372) |= 0x20000000001uLL;
    *((_DWORD *)v6 + 85) = v105;
  }

  if ((_DWORD)a3)
    v106 = CFSTR("resultRefinementQuery");
  else
    v106 = CFSTR("result_refinement_query");
  objc_msgSend(v5, "objectForKeyedSubscript:", v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v108 = [GEOPDResultRefinementQuery alloc];
    if ((a3 & 1) != 0)
      v109 = -[GEOPDResultRefinementQuery initWithJSON:](v108, "initWithJSON:", v107);
    else
      v109 = -[GEOPDResultRefinementQuery initWithDictionary:](v108, "initWithDictionary:", v107);
    v110 = v109;
    -[GEOPDSearchParameters setResultRefinementQuery:]((uint64_t)v6, v109);

  }
  if ((_DWORD)a3)
    v111 = CFSTR("knownRefinementType");
  else
    v111 = CFSTR("known_refinement_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v214 = 0u;
    v215 = 0u;
    v212 = 0u;
    v213 = 0u;
    v195 = v112;
    v113 = v112;
    v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v212, v227, 16);
    if (!v114)
      goto LABEL_245;
    v115 = v114;
    v116 = *(_QWORD *)v213;
    while (1)
    {
      for (k = 0; k != v115; ++k)
      {
        if (*(_QWORD *)v213 != v116)
          objc_enumerationMutation(v113);
        v118 = *(void **)(*((_QWORD *)&v212 + 1) + 8 * k);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v119 = v118;
          if ((objc_msgSend(v119, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_UNKNOWN")) & 1) == 0
            && (objc_msgSend(v119, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_TOGGLE")) & 1) == 0
            && (objc_msgSend(v119, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_RANGE")) & 1) == 0
            && (objc_msgSend(v119, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_MULTI_SELECT")) & 1) == 0
            && (objc_msgSend(v119, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_SORT")) & 1) == 0
            && (objc_msgSend(v119, "isEqualToString:", CFSTR("RESULT_REFINEMENT_GUIDES_HOME")) & 1) == 0)
          {
            objc_msgSend(v119, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_OPEN_OPTIONS"));
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          objc_msgSend(v118, "intValue");
        }
        -[GEOPDSearchParameters addKnownRefinementType:]((uint64_t)v6);
      }
      v115 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v212, v227, 16);
      if (!v115)
      {
LABEL_245:

        v112 = v195;
        LODWORD(a3) = v199;
        break;
      }
    }
  }

  if ((_DWORD)a3)
    v120 = CFSTR("placeSummaryRevision");
  else
    v120 = CFSTR("place_summary_revision");
  objc_msgSend(v5, "objectForKeyedSubscript:", v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v122 = v121;
    if ((objc_msgSend(v122, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v123 = 0;
    }
    else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("NAME")) & 1) != 0)
    {
      v123 = 1;
    }
    else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("CATEGORY")) & 1) != 0)
    {
      v123 = 2;
    }
    else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("DISTANCE")) & 1) != 0)
    {
      v123 = 3;
    }
    else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("PRICE")) & 1) != 0)
    {
      v123 = 4;
    }
    else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("HOURS")) & 1) != 0)
    {
      v123 = 5;
    }
    else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
    {
      v123 = 6;
    }
    else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("RATINGS")) & 1) != 0)
    {
      v123 = 7;
    }
    else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("TRANSIT_SHIELDS")) & 1) != 0)
    {
      v123 = 8;
    }
    else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("USER_GENERATED_GUIDES")) & 1) != 0)
    {
      v123 = 9;
    }
    else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("CURATED_GUIDES")) & 1) != 0)
    {
      v123 = 10;
    }
    else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("EV_CHARGERS_NUMBER")) & 1) != 0)
    {
      v123 = 11;
    }
    else
    {
      if ((objc_msgSend(v122, "isEqualToString:", CFSTR("UGC_USER_SUBMITTED_RECOMMENDATIONS")) & 1) != 0)
      {
        v123 = 12;
      }
      else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("STRING")) & 1) != 0)
      {
        v123 = 13;
      }
      else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("SERVER_OVERRIDE")) & 1) != 0)
      {
        v123 = 14;
      }
      else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("CONTAINMENT")) & 1) != 0)
      {
        v123 = 15;
      }
      else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("RECENT")) & 1) != 0)
      {
        v123 = 16;
      }
      else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("HIGHLIGHT_MAIN")) & 1) != 0)
      {
        v123 = 17;
      }
      else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("HIGHLIGHT_EXTRA")) & 1) != 0)
      {
        v123 = 18;
      }
      else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("PUBLISHER_NAME_FOR_GUIDE")) & 1) != 0)
      {
        v123 = 19;
      }
      else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("NUM_PLACES_IN_GUIDE")) & 1) != 0)
      {
        v123 = 20;
      }
      else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("PUBLISHER_DESCRIPTION")) & 1) != 0)
      {
        v123 = 21;
      }
      else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("SECONDARY_NAME")) & 1) != 0)
      {
        v123 = 22;
      }
      else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("FACTOID")) & 1) != 0)
      {
        v123 = 23;
      }
      else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("ARP_RATINGS")) & 1) != 0)
      {
        v123 = 24;
      }
      else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("REAL_TIME_EV_CHARGER_AVAILABILITY")) & 1) != 0)
      {
        v123 = 25;
      }
      else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("DETOUR_TIME")) & 1) != 0)
      {
        v123 = 26;
      }
      else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("HIKING_DIFFICULTY")) & 1) != 0)
      {
        v123 = 27;
      }
      else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("HIKING_TRAIL_LENGTH")) & 1) != 0)
      {
        v123 = 28;
      }
      else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("PHOTO_CAROUSEL")) & 1) != 0)
      {
        v123 = 29;
      }
      else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("IN_USER_LIBRARY")) & 1) != 0)
      {
        v123 = 30;
      }
      else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("USER_NOTE")) & 1) != 0)
      {
        v123 = 31;
      }
      else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("HIKE_ROUTE_FACTOID_ELEVATION_GAIN_LOSS")) & 1) != 0)
      {
        v123 = 32;
      }
      else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("HIKE_ROUTE_TYPE")) & 1) != 0)
      {
        v123 = 33;
      }
      else if ((objc_msgSend(v122, "isEqualToString:", CFSTR("HIKE_ROUTE_DURATION")) & 1) != 0)
      {
        v123 = 34;
      }
      else if (objc_msgSend(v122, "isEqualToString:", CFSTR("HIKE_ROUTE_LENGTH")))
      {
        v123 = 35;
      }
      else
      {
        v123 = 0;
      }
      LODWORD(a3) = v199;
    }

    goto LABEL_335;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v123 = objc_msgSend(v121, "intValue");
LABEL_335:
    *(_QWORD *)(v6 + 372) |= 0x20000000004uLL;
    *((_DWORD *)v6 + 87) = v123;
  }

  if ((_DWORD)a3)
    v124 = CFSTR("previousSearchViewport");
  else
    v124 = CFSTR("previous_search_viewport");
  objc_msgSend(v5, "objectForKeyedSubscript:", v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v126 = [GEOPDViewportInfo alloc];
    if ((a3 & 1) != 0)
      v127 = -[GEOPDViewportInfo initWithJSON:](v126, "initWithJSON:", v125);
    else
      v127 = -[GEOPDViewportInfo initWithDictionary:](v126, "initWithDictionary:", v125);
    v128 = v127;
    -[GEOPDSearchParameters setPreviousSearchViewport:]((uint64_t)v6, v127);

  }
  if ((_DWORD)a3)
    v129 = CFSTR("supportedPlaceSummaryFormatType");
  else
    v129 = CFSTR("supported_place_summary_format_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v210 = 0u;
    v211 = 0u;
    v208 = 0u;
    v209 = 0u;
    v196 = v130;
    v131 = v130;
    v132 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v208, v226, 16);
    if (!v132)
      goto LABEL_366;
    v133 = v132;
    v134 = *(_QWORD *)v209;
    while (1)
    {
      for (m = 0; m != v133; ++m)
      {
        if (*(_QWORD *)v209 != v134)
          objc_enumerationMutation(v131);
        v136 = *(void **)(*((_QWORD *)&v208 + 1) + 8 * m);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v137 = v136;
          if ((objc_msgSend(v137, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_UNKNOWN")) & 1) == 0
            && (objc_msgSend(v137, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_BOLD")) & 1) == 0
            && (objc_msgSend(v137, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_ITALICS")) & 1) == 0
            && (objc_msgSend(v137, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_STRIKETHROUGH")) & 1) == 0)
          {
            objc_msgSend(v137, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_TAPPABLE_ENTITY"));
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          objc_msgSend(v136, "intValue");
        }
        -[GEOPDSearchParameters addSupportedPlaceSummaryFormatType:]((uint64_t)v6);
      }
      v133 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v208, v226, 16);
      if (!v133)
      {
LABEL_366:

        v130 = v196;
        LODWORD(a3) = v199;
        break;
      }
    }
  }

  if ((_DWORD)a3)
    v138 = CFSTR("supportedSearchSectionType");
  else
    v138 = CFSTR("supported_search_section_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v138);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v206 = 0u;
    v207 = 0u;
    v204 = 0u;
    v205 = 0u;
    v197 = v139;
    v140 = v139;
    v141 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v204, v225, 16);
    if (!v141)
      goto LABEL_387;
    v142 = v141;
    v143 = *(_QWORD *)v205;
    while (1)
    {
      for (n = 0; n != v142; ++n)
      {
        if (*(_QWORD *)v205 != v143)
          objc_enumerationMutation(v140);
        v145 = *(void **)(*((_QWORD *)&v204 + 1) + 8 * n);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v146 = v145;
          if ((objc_msgSend(v146, "isEqualToString:", CFSTR("SEARCH_SECTION_TYPE_UNKNOWN")) & 1) == 0
            && (objc_msgSend(v146, "isEqualToString:", CFSTR("SEARCH_SECTION_TYPE_PLACE")) & 1) == 0)
          {
            objc_msgSend(v146, "isEqualToString:", CFSTR("SEARCH_SECTION_TYPE_GUIDE"));
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          objc_msgSend(v145, "intValue");
        }
        -[GEOPDSearchParameters addSupportedSearchSectionType:]((uint64_t)v6);
      }
      v142 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v204, v225, 16);
      if (!v142)
      {
LABEL_387:

        v139 = v197;
        LODWORD(a3) = v199;
        break;
      }
    }
  }

  if ((_DWORD)a3)
    v147 = CFSTR("supportSearchEnrichment");
  else
    v147 = CFSTR("support_search_enrichment");
  objc_msgSend(v5, "objectForKeyedSubscript:", v147);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v149 = objc_msgSend(v148, "BOOLValue");
    *(_QWORD *)(v6 + 372) |= 0x20000000100uLL;
    v6[366] = v149;
  }

  if ((_DWORD)a3)
    v150 = CFSTR("searchOriginationInfo");
  else
    v150 = CFSTR("search_origination_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v150);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v152 = [GEOPDSearchOriginationInfo alloc];
    if (v152)
      v153 = (void *)-[GEOPDSearchOriginationInfo _initWithDictionary:isJSON:]((uint64_t)v152, v151, a3);
    else
      v153 = 0;
    -[GEOPDSearchParameters setSearchOriginationInfo:]((uint64_t)v6, v153);

  }
  if ((_DWORD)a3)
    v154 = CFSTR("supportStructuredRapAffordance");
  else
    v154 = CFSTR("support_structured_rap_affordance");
  objc_msgSend(v5, "objectForKeyedSubscript:", v154);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v156 = objc_msgSend(v155, "BOOLValue");
    *(_QWORD *)(v6 + 372) |= 0x20000000400uLL;
    v6[368] = v156;
  }

  if ((_DWORD)a3)
    v157 = CFSTR("enrichmentCampaignNamespace");
  else
    v157 = CFSTR("enrichment_campaign_namespace");
  objc_msgSend(v5, "objectForKeyedSubscript:", v157);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v159 = (void *)objc_msgSend(v158, "copy");
    -[GEOPDSearchParameters setEnrichmentCampaignNamespace:]((uint64_t)v6, v159);

  }
  if ((_DWORD)a3)
    v160 = CFSTR("searchEnrichmentRevisionMetadata");
  else
    v160 = CFSTR("search_enrichment_revision_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v160);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v202 = 0u;
    v203 = 0u;
    v200 = 0u;
    v201 = 0u;
    v162 = v161;
    v163 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v200, v224, 16);
    if (v163)
    {
      v164 = v163;
      v165 = *(_QWORD *)v201;
      do
      {
        v166 = 0;
        do
        {
          if (*(_QWORD *)v201 != v165)
            objc_enumerationMutation(v162);
          v167 = *(void **)(*((_QWORD *)&v200 + 1) + 8 * v166);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v168 = [GEOPDSearchEnrichmentRevisionMetadata alloc];
            if (v168)
              v169 = (void *)-[GEOPDSearchEnrichmentRevisionMetadata _initWithDictionary:isJSON:]((uint64_t)v168, v167, v199);
            else
              v169 = 0;
            -[GEOPDSearchParameters addSearchEnrichmentRevisionMetadata:]((uint64_t)v6, v169);

          }
          ++v166;
        }
        while (v164 != v166);
        v170 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v200, v224, 16);
        v164 = v170;
      }
      while (v170);
    }

    v5 = v198;
    LODWORD(a3) = v199;
  }

  if ((_DWORD)a3)
    v171 = CFSTR("searchSessionData");
  else
    v171 = CFSTR("search_session_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v171);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v173 = -[GEOACResult _initWithDictionary:isJSON:]([GEOPDSSearchSessionData alloc], v172);
    -[GEOPDSearchParameters setSearchSessionData:]((uint64_t)v6, v173);

  }
  if ((_DWORD)a3)
    v174 = CFSTR("mostRecentAutocompleteRequestSessionData");
  else
    v174 = CFSTR("most_recent_autocomplete_request_session_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v174);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v176 = [GEOPDAutocompleteSessionData alloc];
    if ((a3 & 1) != 0)
      v177 = -[GEOPDAutocompleteSessionData initWithJSON:](v176, "initWithJSON:", v175);
    else
      v177 = -[GEOPDAutocompleteSessionData initWithDictionary:](v176, "initWithDictionary:", v175);
    v178 = v177;
    -[GEOPDSearchParameters setMostRecentAutocompleteRequestSessionData:]((uint64_t)v6, v177);

  }
  if ((_DWORD)a3)
    v179 = CFSTR("punchInHints");
  else
    v179 = CFSTR("punch_in_hints");
  objc_msgSend(v5, "objectForKeyedSubscript:", v179);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v181 = [GEOPDSPunchInHints alloc];
    if (v181)
      v182 = -[GEOPDSPunchInHints _initWithDictionary:isJSON:](v181, v180, a3);
    else
      v182 = 0;
    -[GEOPDSearchParameters setPunchInHints:]((uint64_t)v6, v182);

  }
  if ((_DWORD)a3)
    v183 = CFSTR("sessionUserActionMetadata");
  else
    v183 = CFSTR("session_user_action_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v183);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v185 = [GEOPDSSessionUserActionMetadata alloc];
    if ((a3 & 1) != 0)
      v186 = -[GEOPDSSessionUserActionMetadata initWithJSON:](v185, "initWithJSON:", v184);
    else
      v186 = -[GEOPDSSessionUserActionMetadata initWithDictionary:](v185, "initWithDictionary:", v184);
    v187 = v186;
    -[GEOPDSearchParameters setSessionUserActionMetadata:]((uint64_t)v6, v186);

  }
  if ((_DWORD)a3)
    v188 = CFSTR("paginationParameters");
  else
    v188 = CFSTR("pagination_parameters");
  objc_msgSend(v5, "objectForKeyedSubscript:", v188);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v190 = [GEOPDPaginationParameters alloc];
    if (v190)
      v191 = (void *)-[GEOPDPaginationParameters _initWithDictionary:isJSON:](v190, v189, a3);
    else
      v191 = 0;
    -[GEOPDSearchParameters setPaginationParameters:]((uint64_t)v6, v191);

  }
LABEL_464:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $6960C9CD4445C07EDE163A4FBB4CEEA7 flags;
  $6960C9CD4445C07EDE163A4FBB4CEEA7 v7;
  $6960C9CD4445C07EDE163A4FBB4CEEA7 v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  PBDataReader *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchParametersIsDirty((uint64_t)self) & 1) == 0)
  {
    v18 = self->_reader;
    objc_sync_enter(v18);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v19);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
    goto LABEL_96;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchParameters readAll:]((uint64_t)self, 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_searchString)
    PBDataWriterWriteStringField();
  if (self->_viewportInfo)
    PBDataWriterWriteSubmessage();
  if (self->_suggestionMetadata)
    PBDataWriterWriteDataField();
  if (self->_suggestionEntryMetadata)
    PBDataWriterWriteDataField();
  if (self->_suggestionEntry)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_searchStructureIntentType)
    PBDataWriterWriteSubmessage();
  if (self->_searchLocationParameters)
    PBDataWriterWriteSubmessage();
  if (self->_recentRouteInfo)
    PBDataWriterWriteSubmessage();
  if (self->_searchFilter)
    PBDataWriterWriteSubmessage();
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = self->_flags;
  }
  if ((*(_BYTE *)&v7 & 0x40) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_retainedSearch)
    PBDataWriterWriteSubmessage();
  v8 = self->_flags;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
    if ((*(_WORD *)&v8 & 0x200) == 0)
      goto LABEL_35;
LABEL_93:
    PBDataWriterWriteBOOLField();
    if ((*(_QWORD *)&self->_flags & 0x10) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
  PBDataWriterWriteBOOLField();
  v8 = self->_flags;
  if ((*(_WORD *)&v8 & 0x200) != 0)
    goto LABEL_93;
LABEL_35:
  if ((*(_BYTE *)&v8 & 0x10) != 0)
LABEL_36:
    PBDataWriterWriteInt32Field();
LABEL_37:
  if (self->_inferredSignals)
    PBDataWriterWriteSubmessage();
  if (self->_supportedRelatedEntitySectionTypes.count)
  {
    v9 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v9;
    }
    while (v9 < self->_supportedRelatedEntitySectionTypes.count);
  }
  if (self->_evChargingParameters)
    PBDataWriterWriteSubmessage();
  if (self->_etaFilter)
    PBDataWriterWriteSubmessage();
  if (self->_supportedSearchTierTypes.count)
  {
    v10 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v10;
    }
    while (v10 < self->_supportedSearchTierTypes.count);
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_resultRefinementQuery)
    PBDataWriterWriteSubmessage();
  if (self->_knownRefinementTypes.count)
  {
    v11 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v11;
    }
    while (v11 < self->_knownRefinementTypes.count);
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_previousSearchViewport)
    PBDataWriterWriteSubmessage();
  if (self->_supportedPlaceSummaryFormatTypes.count)
  {
    v12 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v12;
    }
    while (v12 < self->_supportedPlaceSummaryFormatTypes.count);
  }
  if (self->_supportedSearchSectionTypes.count)
  {
    v13 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v13;
    }
    while (v13 < self->_supportedSearchSectionTypes.count);
  }
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_searchOriginationInfo)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_flags + 1) & 4) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_enrichmentCampaignNamespace)
    PBDataWriterWriteStringField();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = self->_searchEnrichmentRevisionMetadatas;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v14);
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  if (self->_searchSessionData)
    PBDataWriterWriteSubmessage();
  if (self->_mostRecentAutocompleteRequestSessionData)
    PBDataWriterWriteSubmessage();
  if (self->_punchInHints)
    PBDataWriterWriteSubmessage();
  if (self->_sessionUserActionMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_paginationParameters)
    PBDataWriterWriteSubmessage();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
LABEL_96:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  $6960C9CD4445C07EDE163A4FBB4CEEA7 flags;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  $6960C9CD4445C07EDE163A4FBB4CEEA7 v28;
  id v29;
  void *v30;
  $6960C9CD4445C07EDE163A4FBB4CEEA7 v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  NSMutableArray *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  PBUnknownFields *v61;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 5) & 2) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSearchParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_35;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchParameters readAll:]((uint64_t)self, 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 360) = self->_sortOrder;
    *(_QWORD *)(v5 + 372) |= 0x20uLL;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 344) = self->_maxResults;
    *(_QWORD *)(v5 + 372) |= 2uLL;
  }
  v10 = -[NSString copyWithZone:](self->_searchString, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 272);
  *(_QWORD *)(v5 + 272) = v10;

  v12 = -[GEOPDViewportInfo copyWithZone:](self->_viewportInfo, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 320);
  *(_QWORD *)(v5 + 320) = v12;

  v14 = -[NSData copyWithZone:](self->_suggestionMetadata, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 312);
  *(_QWORD *)(v5 + 312) = v14;

  v16 = -[NSData copyWithZone:](self->_suggestionEntryMetadata, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 296);
  *(_QWORD *)(v5 + 296) = v16;

  v18 = -[GEOPDAutocompleteEntry copyWithZone:](self->_suggestionEntry, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 304);
  *(_QWORD *)(v5 + 304) = v18;

  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 352) = self->_searchType;
    *(_QWORD *)(v5 + 372) |= 8uLL;
  }
  v20 = -[GEOPDSSearchStructureIntentRequestType copyWithZone:](self->_searchStructureIntentType, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 280);
  *(_QWORD *)(v5 + 280) = v20;

  v22 = -[GEOPDSSearchLocationParameters copyWithZone:](self->_searchLocationParameters, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = v22;

  v24 = -[GEOPDRecentRouteInfo copyWithZone:](self->_recentRouteInfo, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v24;

  v26 = -[GEOPDSSearchFilter copyWithZone:](self->_searchFilter, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v26;

  v28 = self->_flags;
  if ((*(_BYTE *)&v28 & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 365) = self->_supportDymSuggestion;
    *(_QWORD *)(v5 + 372) |= 0x80uLL;
    v28 = self->_flags;
  }
  if ((*(_BYTE *)&v28 & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 364) = self->_supportDirectionIntentSearch;
    *(_QWORD *)(v5 + 372) |= 0x40uLL;
  }
  v29 = -[GEOPDRetainedSearchMetadata copyWithZone:](self->_retainedSearch, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v29;

  v31 = self->_flags;
  if ((*(_WORD *)&v31 & 0x800) == 0)
  {
    if ((*(_WORD *)&v31 & 0x200) == 0)
      goto LABEL_17;
LABEL_37:
    *(_BYTE *)(v5 + 367) = self->_supportSearchResultSection;
    *(_QWORD *)(v5 + 372) |= 0x200uLL;
    if ((*(_QWORD *)&self->_flags & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  *(_BYTE *)(v5 + 369) = self->_supportUnresolvedDirectionIntent;
  *(_QWORD *)(v5 + 372) |= 0x800uLL;
  v31 = self->_flags;
  if ((*(_WORD *)&v31 & 0x200) != 0)
    goto LABEL_37;
LABEL_17:
  if ((*(_BYTE *)&v31 & 0x10) != 0)
  {
LABEL_18:
    *(_DWORD *)(v5 + 356) = self->_sortDirection;
    *(_QWORD *)(v5 + 372) |= 0x10uLL;
  }
LABEL_19:
  v32 = -[GEOPDSInferredSignals copyWithZone:](self->_inferredSignals, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v32;

  PBRepeatedInt32Copy();
  v34 = -[GEOPDSSearchEvChargingParameters copyWithZone:](self->_evChargingParameters, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v34;

  v36 = -[GEOPDETAFilter copyWithZone:](self->_etaFilter, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v36;

  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 340) = self->_auxiliaryTierNumResults;
    *(_QWORD *)(v5 + 372) |= 1uLL;
  }
  v38 = -[GEOPDResultRefinementQuery copyWithZone:](self->_resultRefinementQuery, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v38;

  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 348) = self->_placeSummaryRevision;
    *(_QWORD *)(v5 + 372) |= 4uLL;
  }
  v40 = -[GEOPDViewportInfo copyWithZone:](self->_previousSearchViewport, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v40;

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    *(_BYTE *)(v5 + 366) = self->_supportSearchEnrichment;
    *(_QWORD *)(v5 + 372) |= 0x100uLL;
  }
  v42 = -[GEOPDSearchOriginationInfo copyWithZone:](self->_searchOriginationInfo, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 256);
  *(_QWORD *)(v5 + 256) = v42;

  if ((*((_BYTE *)&self->_flags + 1) & 4) != 0)
  {
    *(_BYTE *)(v5 + 368) = self->_supportStructuredRapAffordance;
    *(_QWORD *)(v5 + 372) |= 0x400uLL;
  }
  v44 = -[NSString copyWithZone:](self->_enrichmentCampaignNamespace, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v44;

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v46 = self->_searchEnrichmentRevisionMetadatas;
  v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
  if (v47)
  {
    v48 = *(_QWORD *)v64;
    do
    {
      v49 = 0;
      do
      {
        if (*(_QWORD *)v64 != v48)
          objc_enumerationMutation(v46);
        v50 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * v49), "copyWithZone:", a3, (_QWORD)v63);
        -[GEOPDSearchParameters addSearchEnrichmentRevisionMetadata:](v5, v50);

        ++v49;
      }
      while (v47 != v49);
      v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    }
    while (v47);
  }

  v51 = -[GEOPDSSearchSessionData copyWithZone:](self->_searchSessionData, "copyWithZone:", a3);
  v52 = *(void **)(v5 + 264);
  *(_QWORD *)(v5 + 264) = v51;

  v53 = -[GEOPDAutocompleteSessionData copyWithZone:](self->_mostRecentAutocompleteRequestSessionData, "copyWithZone:", a3);
  v54 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v53;

  v55 = -[GEOPDSPunchInHints copyWithZone:](self->_punchInHints, "copyWithZone:", a3);
  v56 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v55;

  v57 = -[GEOPDSSessionUserActionMetadata copyWithZone:](self->_sessionUserActionMetadata, "copyWithZone:", a3);
  v58 = *(void **)(v5 + 288);
  *(_QWORD *)(v5 + 288) = v57;

  v59 = -[GEOPDPaginationParameters copyWithZone:](self->_paginationParameters, "copyWithZone:", a3);
  v60 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v59;

  v61 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v61;
LABEL_35:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  $6960C9CD4445C07EDE163A4FBB4CEEA7 flags;
  uint64_t v6;
  NSString *searchString;
  GEOPDViewportInfo *viewportInfo;
  NSData *suggestionMetadata;
  NSData *suggestionEntryMetadata;
  GEOPDAutocompleteEntry *suggestionEntry;
  uint64_t v12;
  GEOPDSSearchStructureIntentRequestType *searchStructureIntentType;
  GEOPDSSearchLocationParameters *searchLocationParameters;
  GEOPDRecentRouteInfo *recentRouteInfo;
  GEOPDSSearchFilter *searchFilter;
  $6960C9CD4445C07EDE163A4FBB4CEEA7 v17;
  uint64_t v18;
  GEOPDRetainedSearchMetadata *retainedSearch;
  GEOPDSInferredSignals *inferredSignals;
  GEOPDSSearchEvChargingParameters *evChargingParameters;
  GEOPDETAFilter *etaFilter;
  uint64_t v23;
  GEOPDResultRefinementQuery *resultRefinementQuery;
  uint64_t v25;
  GEOPDViewportInfo *previousSearchViewport;
  $6960C9CD4445C07EDE163A4FBB4CEEA7 v27;
  uint64_t v28;
  GEOPDSearchOriginationInfo *searchOriginationInfo;
  NSString *enrichmentCampaignNamespace;
  NSMutableArray *searchEnrichmentRevisionMetadatas;
  GEOPDSSearchSessionData *searchSessionData;
  GEOPDAutocompleteSessionData *mostRecentAutocompleteRequestSessionData;
  GEOPDSPunchInHints *punchInHints;
  GEOPDSSessionUserActionMetadata *sessionUserActionMetadata;
  GEOPDPaginationParameters *paginationParameters;
  char v37;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_133;
  -[GEOPDSearchParameters readAll:]((uint64_t)self, 1);
  -[GEOPDSearchParameters readAll:]((uint64_t)v4, 1);
  flags = self->_flags;
  v6 = *(_QWORD *)(v4 + 372);
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_sortOrder != *((_DWORD *)v4 + 90))
      goto LABEL_133;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_maxResults != *((_DWORD *)v4 + 86))
      goto LABEL_133;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_133;
  }
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((_QWORD *)v4 + 34)
    && !-[NSString isEqual:](searchString, "isEqual:"))
  {
    goto LABEL_133;
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((_QWORD *)v4 + 40))
  {
    if (!-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:"))
      goto LABEL_133;
  }
  suggestionMetadata = self->_suggestionMetadata;
  if ((unint64_t)suggestionMetadata | *((_QWORD *)v4 + 39))
  {
    if (!-[NSData isEqual:](suggestionMetadata, "isEqual:"))
      goto LABEL_133;
  }
  suggestionEntryMetadata = self->_suggestionEntryMetadata;
  if ((unint64_t)suggestionEntryMetadata | *((_QWORD *)v4 + 37))
  {
    if (!-[NSData isEqual:](suggestionEntryMetadata, "isEqual:"))
      goto LABEL_133;
  }
  suggestionEntry = self->_suggestionEntry;
  if ((unint64_t)suggestionEntry | *((_QWORD *)v4 + 38))
  {
    if (!-[GEOPDAutocompleteEntry isEqual:](suggestionEntry, "isEqual:"))
      goto LABEL_133;
  }
  v12 = *(_QWORD *)(v4 + 372);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_searchType != *((_DWORD *)v4 + 88))
      goto LABEL_133;
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_133;
  }
  searchStructureIntentType = self->_searchStructureIntentType;
  if ((unint64_t)searchStructureIntentType | *((_QWORD *)v4 + 35)
    && !-[GEOPDSSearchStructureIntentRequestType isEqual:](searchStructureIntentType, "isEqual:"))
  {
    goto LABEL_133;
  }
  searchLocationParameters = self->_searchLocationParameters;
  if ((unint64_t)searchLocationParameters | *((_QWORD *)v4 + 31))
  {
    if (!-[GEOPDSSearchLocationParameters isEqual:](searchLocationParameters, "isEqual:"))
      goto LABEL_133;
  }
  recentRouteInfo = self->_recentRouteInfo;
  if ((unint64_t)recentRouteInfo | *((_QWORD *)v4 + 26))
  {
    if (!-[GEOPDRecentRouteInfo isEqual:](recentRouteInfo, "isEqual:"))
      goto LABEL_133;
  }
  searchFilter = self->_searchFilter;
  if ((unint64_t)searchFilter | *((_QWORD *)v4 + 30))
  {
    if (!-[GEOPDSSearchFilter isEqual:](searchFilter, "isEqual:"))
      goto LABEL_133;
  }
  v17 = self->_flags;
  v18 = *(_QWORD *)(v4 + 372);
  if ((*(_BYTE *)&v17 & 0x80) != 0)
  {
    if ((v18 & 0x80) == 0)
      goto LABEL_133;
    if (self->_supportDymSuggestion)
    {
      if (!v4[365])
        goto LABEL_133;
    }
    else if (v4[365])
    {
      goto LABEL_133;
    }
  }
  else if ((v18 & 0x80) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_BYTE *)&v17 & 0x40) != 0)
  {
    if ((v18 & 0x40) == 0)
      goto LABEL_133;
    if (self->_supportDirectionIntentSearch)
    {
      if (!v4[364])
        goto LABEL_133;
    }
    else if (v4[364])
    {
      goto LABEL_133;
    }
  }
  else if ((v18 & 0x40) != 0)
  {
    goto LABEL_133;
  }
  retainedSearch = self->_retainedSearch;
  if ((unint64_t)retainedSearch | *((_QWORD *)v4 + 28))
  {
    if (!-[GEOPDRetainedSearchMetadata isEqual:](retainedSearch, "isEqual:"))
      goto LABEL_133;
    v17 = self->_flags;
    v18 = *(_QWORD *)(v4 + 372);
  }
  if ((*(_WORD *)&v17 & 0x800) != 0)
  {
    if ((v18 & 0x800) == 0)
      goto LABEL_133;
    if (self->_supportUnresolvedDirectionIntent)
    {
      if (!v4[369])
        goto LABEL_133;
    }
    else if (v4[369])
    {
      goto LABEL_133;
    }
  }
  else if ((v18 & 0x800) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_WORD *)&v17 & 0x200) != 0)
  {
    if ((v18 & 0x200) == 0)
      goto LABEL_133;
    if (self->_supportSearchResultSection)
    {
      if (!v4[367])
        goto LABEL_133;
    }
    else if (v4[367])
    {
      goto LABEL_133;
    }
  }
  else if ((v18 & 0x200) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_BYTE *)&v17 & 0x10) != 0)
  {
    if ((v18 & 0x10) == 0 || self->_sortDirection != *((_DWORD *)v4 + 89))
      goto LABEL_133;
  }
  else if ((v18 & 0x10) != 0)
  {
    goto LABEL_133;
  }
  inferredSignals = self->_inferredSignals;
  if ((unint64_t)inferredSignals | *((_QWORD *)v4 + 21)
    && !-[GEOPDSInferredSignals isEqual:](inferredSignals, "isEqual:"))
  {
    goto LABEL_133;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_133;
  evChargingParameters = self->_evChargingParameters;
  if ((unint64_t)evChargingParameters | *((_QWORD *)v4 + 20))
  {
    if (!-[GEOPDSSearchEvChargingParameters isEqual:](evChargingParameters, "isEqual:"))
      goto LABEL_133;
  }
  etaFilter = self->_etaFilter;
  if ((unint64_t)etaFilter | *((_QWORD *)v4 + 19))
  {
    if (!-[GEOPDETAFilter isEqual:](etaFilter, "isEqual:"))
      goto LABEL_133;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_133;
  v23 = *(_QWORD *)(v4 + 372);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v23 & 1) == 0 || self->_auxiliaryTierNumResults != *((_DWORD *)v4 + 85))
      goto LABEL_133;
  }
  else if ((v23 & 1) != 0)
  {
    goto LABEL_133;
  }
  resultRefinementQuery = self->_resultRefinementQuery;
  if ((unint64_t)resultRefinementQuery | *((_QWORD *)v4 + 27)
    && !-[GEOPDResultRefinementQuery isEqual:](resultRefinementQuery, "isEqual:")
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_133;
  }
  v25 = *(_QWORD *)(v4 + 372);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((v25 & 4) == 0 || self->_placeSummaryRevision != *((_DWORD *)v4 + 87))
      goto LABEL_133;
  }
  else if ((v25 & 4) != 0)
  {
    goto LABEL_133;
  }
  previousSearchViewport = self->_previousSearchViewport;
  if ((unint64_t)previousSearchViewport | *((_QWORD *)v4 + 24)
    && !-[GEOPDViewportInfo isEqual:](previousSearchViewport, "isEqual:")
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_133;
  }
  v27 = self->_flags;
  v28 = *(_QWORD *)(v4 + 372);
  if ((*(_WORD *)&v27 & 0x100) != 0)
  {
    if ((v28 & 0x100) == 0)
      goto LABEL_133;
    if (self->_supportSearchEnrichment)
    {
      if (!v4[366])
        goto LABEL_133;
    }
    else if (v4[366])
    {
      goto LABEL_133;
    }
  }
  else if ((v28 & 0x100) != 0)
  {
    goto LABEL_133;
  }
  searchOriginationInfo = self->_searchOriginationInfo;
  if ((unint64_t)searchOriginationInfo | *((_QWORD *)v4 + 32))
  {
    if (!-[GEOPDSearchOriginationInfo isEqual:](searchOriginationInfo, "isEqual:"))
      goto LABEL_133;
    v27 = self->_flags;
    v28 = *(_QWORD *)(v4 + 372);
  }
  if ((*(_WORD *)&v27 & 0x400) != 0)
  {
    if ((v28 & 0x400) != 0)
    {
      if (self->_supportStructuredRapAffordance)
      {
        if (!v4[368])
          goto LABEL_133;
        goto LABEL_119;
      }
      if (!v4[368])
        goto LABEL_119;
    }
LABEL_133:
    v37 = 0;
    goto LABEL_134;
  }
  if ((v28 & 0x400) != 0)
    goto LABEL_133;
LABEL_119:
  enrichmentCampaignNamespace = self->_enrichmentCampaignNamespace;
  if ((unint64_t)enrichmentCampaignNamespace | *((_QWORD *)v4 + 18)
    && !-[NSString isEqual:](enrichmentCampaignNamespace, "isEqual:"))
  {
    goto LABEL_133;
  }
  searchEnrichmentRevisionMetadatas = self->_searchEnrichmentRevisionMetadatas;
  if ((unint64_t)searchEnrichmentRevisionMetadatas | *((_QWORD *)v4 + 29))
  {
    if (!-[NSMutableArray isEqual:](searchEnrichmentRevisionMetadatas, "isEqual:"))
      goto LABEL_133;
  }
  searchSessionData = self->_searchSessionData;
  if ((unint64_t)searchSessionData | *((_QWORD *)v4 + 33))
  {
    if (!-[GEOPDSSearchSessionData isEqual:](searchSessionData, "isEqual:"))
      goto LABEL_133;
  }
  mostRecentAutocompleteRequestSessionData = self->_mostRecentAutocompleteRequestSessionData;
  if ((unint64_t)mostRecentAutocompleteRequestSessionData | *((_QWORD *)v4 + 22))
  {
    if (!-[GEOPDAutocompleteSessionData isEqual:](mostRecentAutocompleteRequestSessionData, "isEqual:"))
      goto LABEL_133;
  }
  punchInHints = self->_punchInHints;
  if ((unint64_t)punchInHints | *((_QWORD *)v4 + 25))
  {
    if (!-[GEOPDSPunchInHints isEqual:](punchInHints, "isEqual:"))
      goto LABEL_133;
  }
  sessionUserActionMetadata = self->_sessionUserActionMetadata;
  if ((unint64_t)sessionUserActionMetadata | *((_QWORD *)v4 + 36))
  {
    if (!-[GEOPDSSessionUserActionMetadata isEqual:](sessionUserActionMetadata, "isEqual:"))
      goto LABEL_133;
  }
  paginationParameters = self->_paginationParameters;
  if ((unint64_t)paginationParameters | *((_QWORD *)v4 + 23))
    v37 = -[GEOPDPaginationParameters isEqual:](paginationParameters, "isEqual:");
  else
    v37 = 1;
LABEL_134:

  return v37;
}

- (unint64_t)hash
{
  $6960C9CD4445C07EDE163A4FBB4CEEA7 flags;
  $6960C9CD4445C07EDE163A4FBB4CEEA7 v4;
  $6960C9CD4445C07EDE163A4FBB4CEEA7 v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  NSUInteger v43;
  uint64_t v44;
  uint64_t v45;

  -[GEOPDSearchParameters readAll:]((uint64_t)self, 1);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    v45 = 2654435761 * self->_sortOrder;
    if ((*(_BYTE *)&flags & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v45 = 0;
    if ((*(_BYTE *)&flags & 2) != 0)
    {
LABEL_3:
      v44 = 2654435761 * self->_maxResults;
      goto LABEL_6;
    }
  }
  v44 = 0;
LABEL_6:
  v43 = -[NSString hash](self->_searchString, "hash");
  v42 = -[GEOPDViewportInfo hash](self->_viewportInfo, "hash");
  v41 = -[NSData hash](self->_suggestionMetadata, "hash");
  v40 = -[NSData hash](self->_suggestionEntryMetadata, "hash");
  v39 = -[GEOPDAutocompleteEntry hash](self->_suggestionEntry, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    v38 = 2654435761 * self->_searchType;
  else
    v38 = 0;
  v37 = -[GEOPDSSearchStructureIntentRequestType hash](self->_searchStructureIntentType, "hash");
  v36 = -[GEOPDSSearchLocationParameters hash](self->_searchLocationParameters, "hash");
  v35 = -[GEOPDRecentRouteInfo hash](self->_recentRouteInfo, "hash");
  v34 = -[GEOPDSSearchFilter hash](self->_searchFilter, "hash");
  v4 = self->_flags;
  if ((*(_BYTE *)&v4 & 0x80) != 0)
  {
    v33 = 2654435761 * self->_supportDymSuggestion;
    if ((*(_BYTE *)&v4 & 0x40) != 0)
      goto LABEL_11;
  }
  else
  {
    v33 = 0;
    if ((*(_BYTE *)&v4 & 0x40) != 0)
    {
LABEL_11:
      v32 = 2654435761 * self->_supportDirectionIntentSearch;
      goto LABEL_14;
    }
  }
  v32 = 0;
LABEL_14:
  v31 = -[GEOPDRetainedSearchMetadata hash](self->_retainedSearch, "hash");
  v5 = self->_flags;
  if ((*(_WORD *)&v5 & 0x800) == 0)
  {
    v30 = 0;
    if ((*(_WORD *)&v5 & 0x200) != 0)
      goto LABEL_16;
LABEL_19:
    v29 = 0;
    if ((*(_BYTE *)&v5 & 0x10) != 0)
      goto LABEL_17;
    goto LABEL_20;
  }
  v30 = 2654435761 * self->_supportUnresolvedDirectionIntent;
  if ((*(_WORD *)&v5 & 0x200) == 0)
    goto LABEL_19;
LABEL_16:
  v29 = 2654435761 * self->_supportSearchResultSection;
  if ((*(_BYTE *)&v5 & 0x10) != 0)
  {
LABEL_17:
    v28 = 2654435761 * self->_sortDirection;
    goto LABEL_21;
  }
LABEL_20:
  v28 = 0;
LABEL_21:
  v27 = -[GEOPDSInferredSignals hash](self->_inferredSignals, "hash");
  v26 = PBRepeatedInt32Hash();
  v25 = -[GEOPDSSearchEvChargingParameters hash](self->_evChargingParameters, "hash");
  v24 = -[GEOPDETAFilter hash](self->_etaFilter, "hash");
  v23 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v22 = 2654435761 * self->_auxiliaryTierNumResults;
  else
    v22 = 0;
  v6 = -[GEOPDResultRefinementQuery hash](self->_resultRefinementQuery, "hash");
  v7 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v8 = 2654435761 * self->_placeSummaryRevision;
  else
    v8 = 0;
  v9 = -[GEOPDViewportInfo hash](self->_previousSearchViewport, "hash");
  v10 = PBRepeatedInt32Hash();
  v11 = PBRepeatedInt32Hash();
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
    v12 = 2654435761 * self->_supportSearchEnrichment;
  else
    v12 = 0;
  v13 = -[GEOPDSearchOriginationInfo hash](self->_searchOriginationInfo, "hash");
  if ((*((_BYTE *)&self->_flags + 1) & 4) != 0)
    v14 = 2654435761 * self->_supportStructuredRapAffordance;
  else
    v14 = 0;
  v15 = v12 ^ v13 ^ v14 ^ -[NSString hash](self->_enrichmentCampaignNamespace, "hash");
  v16 = v15 ^ -[NSMutableArray hash](self->_searchEnrichmentRevisionMetadatas, "hash");
  v17 = v16 ^ -[GEOPDSSearchSessionData hash](self->_searchSessionData, "hash");
  v18 = v17 ^ -[GEOPDAutocompleteSessionData hash](self->_mostRecentAutocompleteRequestSessionData, "hash");
  v19 = v44 ^ v45 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v18 ^ -[GEOPDSPunchInHints hash](self->_punchInHints, "hash");
  v20 = -[GEOPDSSessionUserActionMetadata hash](self->_sessionUserActionMetadata, "hash");
  return v19 ^ v20 ^ -[GEOPDPaginationParameters hash](self->_paginationParameters, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_suggestionMetadata, 0);
  objc_storeStrong((id *)&self->_suggestionEntry, 0);
  objc_storeStrong((id *)&self->_suggestionEntryMetadata, 0);
  objc_storeStrong((id *)&self->_sessionUserActionMetadata, 0);
  objc_storeStrong((id *)&self->_searchStructureIntentType, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_searchSessionData, 0);
  objc_storeStrong((id *)&self->_searchOriginationInfo, 0);
  objc_storeStrong((id *)&self->_searchLocationParameters, 0);
  objc_storeStrong((id *)&self->_searchFilter, 0);
  objc_storeStrong((id *)&self->_searchEnrichmentRevisionMetadatas, 0);
  objc_storeStrong((id *)&self->_retainedSearch, 0);
  objc_storeStrong((id *)&self->_resultRefinementQuery, 0);
  objc_storeStrong((id *)&self->_recentRouteInfo, 0);
  objc_storeStrong((id *)&self->_punchInHints, 0);
  objc_storeStrong((id *)&self->_previousSearchViewport, 0);
  objc_storeStrong((id *)&self->_paginationParameters, 0);
  objc_storeStrong((id *)&self->_mostRecentAutocompleteRequestSessionData, 0);
  objc_storeStrong((id *)&self->_inferredSignals, 0);
  objc_storeStrong((id *)&self->_evChargingParameters, 0);
  objc_storeStrong((id *)&self->_etaFilter, 0);
  objc_storeStrong((id *)&self->_enrichmentCampaignNamespace, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)addPlaceSummaryRevision:(id)a3
{
  int v4;
  unint64_t v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "placeSummaryRevision"))
  {
    v4 = objc_msgSend(v6, "placeSummaryRevision");
    if (self)
    {
      *(_QWORD *)&self->_flags |= 0x20000000004uLL;
      self->_placeSummaryRevision = v4;
    }
    if (objc_msgSend(v6, "supportedPlaceSummaryFormatTypesCount"))
    {
      v5 = 0;
      do
      {
        objc_msgSend(v6, "supportedPlaceSummaryFormatTypeAtIndex:", v5);
        -[GEOPDSearchParameters addSupportedPlaceSummaryFormatType:]((uint64_t)self);
        ++v5;
      }
      while (v5 < objc_msgSend(v6, "supportedPlaceSummaryFormatTypesCount"));
    }
  }

}

- (GEOPDSearchParameters)initWithGeoMapItemIdentifier:(id)a3 categoryID:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6 searchSessionData:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  GEOPDSSearchEvChargingParameters *v20;
  void *v21;
  GEOPDSearchOriginationInfo *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v29.receiver = self;
  v29.super_class = (Class)GEOPDSearchParameters;
  v16 = -[GEOPDSearchParameters init](&v29, sel_init);
  v17 = (uint64_t)v16;
  if (!v16)
    goto LABEL_13;
  *(_QWORD *)(v16 + 372) |= 0x20000000002uLL;
  *((_DWORD *)v16 + 86) = a5;
  objc_msgSend(v14, "evChargingPorts");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count"))
  {

LABEL_5:
    v20 = objc_alloc_init(GEOPDSSearchEvChargingParameters);
    objc_msgSend(v14, "evChargingPorts");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSSearchEvChargingParameters setPorts:]((uint64_t)v20, v21);

    if (objc_msgSend(v14, "preferredBrandsCount"))
    {
      objc_msgSend(v14, "preferredBrands");
      objc_msgSend(v14, "preferredBrandsCount");
      -[GEOPDSSearchEvChargingParameters setPreferredBrands:count:]((uint64_t)v20);
    }
    -[GEOPDSearchParameters setEvChargingParameters:](v17, v20);

    goto LABEL_8;
  }
  v19 = objc_msgSend(v14, "preferredBrandsCount");

  if (v19)
    goto LABEL_5;
LABEL_8:
  objc_msgSend((id)v17, "addPlaceSummaryRevision:", v14);
  v22 = -[GEOPDSearchOriginationInfo initWithTraits:]([GEOPDSearchOriginationInfo alloc], "initWithTraits:", v14);
  -[GEOPDSearchParameters setSearchOriginationInfo:](v17, v22);
  objc_msgSend((id)v17, "addSearchImplicitInfo:idenitfier:categoryID:", v14, v12, v13);
  v23 = objc_msgSend(v14, "supportStructuredRapAffordance");
  *(_QWORD *)(v17 + 372) |= 0x20000000400uLL;
  *(_BYTE *)(v17 + 368) = v23;
  if (GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1EDF4B218))
  {
    if (v15)
    {
      objc_msgSend(v15, "searchSessionData");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDSearchParameters setSearchSessionData:](v17, v24);

    }
    objc_msgSend(v14, "recentAutocompleteSessionData");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSearchParameters setMostRecentAutocompleteRequestSessionData:](v17, v25);

    objc_msgSend(v14, "userActionMetadata");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSearchParameters setSessionUserActionMetadata:](v17, v26);

  }
  v27 = (id)v17;

LABEL_13:
  return (GEOPDSearchParameters *)v17;
}

- (GEOPDSearchParameters)initWithSearchQuery:(id)a3 entryMetadata:(id)a4 metadata:(id)a5 autocompleteEntry:(id)a6 retainedSearch:(id)a7 maxResults:(unsigned int)a8 traits:(id)a9 routeInfo:(id)a10 searchSessionData:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  char *v24;
  uint64_t v25;
  char v26;
  char v27;
  char v28;
  void *v29;
  unsigned int v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;
  GEOPDSSearchEvChargingParameters *v36;
  void *v37;
  id v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  unint64_t v44;
  unint64_t v45;
  void *v46;
  void *v47;
  GEOPDSearchOriginationInfo *v48;
  char v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  GEOPDSPunchInHints *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v60;
  id v61;
  id v62;
  id v63;
  objc_super v64;

  v17 = a3;
  v18 = a4;
  v63 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v64.receiver = self;
  v64.super_class = (Class)GEOPDSearchParameters;
  v24 = -[GEOPDSearchParameters init](&v64, sel_init);
  v25 = (uint64_t)v24;
  if (!v24)
    goto LABEL_48;
  if (a8)
  {
    *(_QWORD *)(v24 + 372) |= 0x20000000002uLL;
    *((_DWORD *)v24 + 86) = a8;
  }
  if (objc_msgSend(v17, "length", v23))
    -[GEOPDSearchParameters setSearchString:](v25, v17);
  if (objc_msgSend(v18, "length"))
    -[GEOPDSearchParameters setSuggestionEntryMetadata:](v25, v18);
  if (objc_msgSend(v63, "length"))
    -[GEOPDSearchParameters setSuggestionMetadata:](v25, v63);
  if (v19)
    -[GEOPDSearchParameters setSuggestionEntry:](v25, v19);
  v62 = v17;
  if (v20)
    -[GEOPDSearchParameters setRetainedSearch:](v25, v20);
  v26 = objc_msgSend(v21, "supportDirectionIntentSearch");
  *(_QWORD *)(v25 + 372) |= 0x20000000040uLL;
  *(_BYTE *)(v25 + 364) = v26;
  v27 = objc_msgSend(v21, "supportUnresolvedDirectionIntent");
  *(_QWORD *)(v25 + 372) |= 0x20000000800uLL;
  *(_BYTE *)(v25 + 369) = v27;
  v28 = objc_msgSend(v21, "supportDymSuggestion");
  *(_QWORD *)(v25 + 372) |= 0x20000000080uLL;
  *(_BYTE *)(v25 + 365) = v28;
  +[GEOPDViewportInfo viewportInfoForTraits:](GEOPDViewportInfo, "viewportInfoForTraits:", v21);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchParameters setViewportInfo:](v25, v29);

  v30 = objc_msgSend(v21, "searchRequestType");
  if (v30 > 3)
    v31 = 0;
  else
    v31 = dword_189CE3D00[v30];
  *(_QWORD *)(v25 + 372) |= 0x20000000008uLL;
  *(_DWORD *)(v25 + 352) = v31;
  +[GEOPDETAFilter etaFilterForTraits:](GEOPDETAFilter, "etaFilterForTraits:", v21);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchParameters setEtaFilter:](v25, v32);

  v33 = objc_msgSend(v21, "navigating");
  *(_QWORD *)(v25 + 372) |= 0x20000000200uLL;
  *(_BYTE *)(v25 + 367) = v33 ^ 1;
  objc_msgSend(v21, "evChargingPorts");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "count"))
  {

LABEL_20:
    v36 = objc_alloc_init(GEOPDSSearchEvChargingParameters);
    objc_msgSend(v21, "evChargingPorts");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSSearchEvChargingParameters setPorts:]((uint64_t)v36, v37);

    if (objc_msgSend(v21, "preferredBrandsCount"))
    {
      objc_msgSend(v21, "preferredBrands");
      objc_msgSend(v21, "preferredBrandsCount");
      -[GEOPDSSearchEvChargingParameters setPreferredBrands:count:]((uint64_t)v36);
    }
    -[GEOPDSearchParameters setEvChargingParameters:](v25, v36);

    goto LABEL_23;
  }
  v35 = objc_msgSend(v21, "preferredBrandsCount");

  if (v35)
    goto LABEL_20;
LABEL_23:
  v61 = v19;
  v38 = v18;
  v39 = objc_msgSend(v21, "navigating");
  if (v22 && v39)
  {
    -[GEOPDSearchParameters setRecentRouteInfo:](v25, v22);
    -[GEOPDSearchParameters etaFilter]((id *)v25);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "data");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSearchParameters recentRouteInfo]((id *)v25);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDRecentRouteInfo setEtaFilter:]((uint64_t)v42, v41);

  }
  if (((v33 | GEOConfigGetBOOL(MapsFeaturesConfig_ShelbyvilleSearch, (uint64_t)off_1EDF4B018) ^ 1) & 1) == 0)
  {
    if (objc_msgSend(v21, "hasAuxiliaryTierNumResults"))
    {
      v43 = objc_msgSend(v21, "auxiliaryTierNumResults");
      *(_QWORD *)(v25 + 372) |= 0x20000000001uLL;
      *(_DWORD *)(v25 + 340) = v43;
    }
    if (objc_msgSend(v21, "supportedSearchTierTypesCount"))
    {
      v44 = 0;
      do
      {
        objc_msgSend(v21, "supportedSearchTierTypeAtIndex:", v44);
        -[GEOPDSearchParameters addSupportedSearchTierType:](v25);
        ++v44;
      }
      while (v44 < objc_msgSend(v21, "supportedSearchTierTypesCount"));
    }
    if (objc_msgSend(v21, "knownRefinementTypesCount"))
    {
      v45 = 0;
      do
      {
        objc_msgSend(v21, "knownRefinementTypeAtIndex:", v45);
        -[GEOPDSearchParameters addKnownRefinementType:](v25);
        ++v45;
      }
      while (v45 < objc_msgSend(v21, "knownRefinementTypesCount"));
    }
    objc_msgSend(v21, "resultRefinementQuery");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSearchParameters setResultRefinementQuery:](v25, v46);

    objc_msgSend(v21, "previousSearchViewport");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSearchParameters setPreviousSearchViewport:](v25, v47);

  }
  objc_msgSend((id)v25, "addPlaceSummaryRevision:", v21);
  if (GEOConfigGetBOOL(MapsFeaturesConfig_ShelbyvilleSearch, (uint64_t)off_1EDF4B018))
  {
    -[GEOPDSearchParameters addSupportedSearchSectionType:](v25);
    v17 = v62;
    v18 = v38;
    if ((objc_msgSend(v21, "navigating") & 1) == 0)
      -[GEOPDSearchParameters addSupportedSearchSectionType:](v25);
  }
  else
  {
    v17 = v62;
    v18 = v38;
    if ((objc_msgSend(v21, "navigating") & 1) == 0)
      -[GEOPDSearchParameters addSupportedRelatedEntitySectionType:](v25);
  }
  v48 = -[GEOPDSearchOriginationInfo initWithTraits:]([GEOPDSearchOriginationInfo alloc], "initWithTraits:", v21);
  -[GEOPDSearchParameters setSearchOriginationInfo:](v25, v48);
  v49 = objc_msgSend(v21, "supportStructuredRapAffordance");
  *(_QWORD *)(v25 + 372) |= 0x20000000400uLL;
  *(_BYTE *)(v25 + 368) = v49;
  objc_msgSend((id)v25, "addSearchImplicitInfo:idenitfier:categoryID:", v21, 0, 0);
  objc_msgSend(v21, "spotlightSearchPunchinEncodedString");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    v51 = objc_alloc(MEMORY[0x1E0C99D50]);
    objc_msgSend(v21, "spotlightSearchPunchinEncodedString");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v51, "initWithBase64EncodedString:options:", v52, 0);

    v54 = -[GEOPDSPunchInHints initWithData:]([GEOPDSPunchInHints alloc], "initWithData:", v53);
    -[GEOPDSearchParameters setPunchInHints:](v25, v54);

    v18 = v38;
  }
  v23 = v60;
  v19 = v61;
  if (GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1EDF4B218))
  {
    if (v60)
    {
      objc_msgSend(v60, "searchSessionData");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDSearchParameters setSearchSessionData:](v25, v55);

    }
    objc_msgSend(v21, "recentAutocompleteSessionData");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSearchParameters setMostRecentAutocompleteRequestSessionData:](v25, v56);

    objc_msgSend(v21, "userActionMetadata");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSearchParameters setSessionUserActionMetadata:](v25, v57);

  }
  v58 = (id)v25;

LABEL_48:
  return (GEOPDSearchParameters *)v25;
}

- (void)addSearchImplicitInfo:(id)a3 idenitfier:(id)a4 categoryID:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id *v15;
  GEOPDSImplicitQueryCategoryFilter *v16;
  void *v17;
  GEOPDSSearchFilter *v18;
  void *v19;
  int v20;
  GEOPDSImplicitQuerySearchForEVCharger *v21;
  uint64_t v22;
  void *v23;
  GEOPDSImplicitQuerySearchAroundPOI *v24;
  GEOLatLng *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  void *v31;
  GEOPDSImplicitQueryIntroTipForHiking *v32;
  GEOLatLng *v33;
  void *v34;
  void *v35;
  id v36;

  v36 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v36, "searchImplicitFilterInfo");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[GEOPDSearchParameters searchOriginationInfo]((id *)&self->super.super.isa);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[GEOPDSearchOriginationInfo searchOriginationType]((uint64_t)v12);

    if (v13 == 3)
    {
      objc_msgSend(v36, "searchImplicitFilterInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        -[GEOPDSearchParameters searchFilter]((id *)&self->super.super.isa);
        v15 = (id *)objc_claimAutoreleasedReturnValue();
        -[GEOPDSSearchFilter implictQueryCategoryFilter](v15);
        v16 = (GEOPDSImplicitQueryCategoryFilter *)objc_claimAutoreleasedReturnValue();

        if (!v16)
          v16 = objc_alloc_init(GEOPDSImplicitQueryCategoryFilter);
        -[GEOPDSearchParameters searchFilter]((id *)&self->super.super.isa);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          v18 = objc_alloc_init(GEOPDSSearchFilter);
          -[GEOPDSearchParameters setSearchFilter:]((uint64_t)self, v18);

        }
        objc_msgSend(v36, "searchImplicitFilterInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "searchImplicitType");

        switch(v20)
        {
          case 1:
            v21 = objc_alloc_init(GEOPDSImplicitQuerySearchForEVCharger);
            if (v16)
            {
              *(_BYTE *)&v16->_flags |= 0x20u;
              *(_BYTE *)&v16->_flags |= 1u;
              v16->_implicitQueryType = 1;
            }
            v22 = objc_msgSend(v14, "searchAlongRouteMuid");
            if (v21)
            {
              *(_BYTE *)&v21->_flags |= 1u;
              v21->_encryptedCurrentEvchargerStopMuid = v22;
            }
            -[GEOPDSImplicitQueryCategoryFilter setImplicitQuerySearchForEvcharger:]((uint64_t)v16, v21);
            goto LABEL_28;
          case 2:
            -[GEOPDSImplicitQueryCategoryFilter implicitQuerySearchAroundPoi]((id *)&v16->super.super.isa);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v23)
            {
              v24 = objc_alloc_init(GEOPDSImplicitQuerySearchAroundPOI);
              -[GEOPDSImplicitQueryCategoryFilter setImplicitQuerySearchAroundPoi:]((uint64_t)v16, v24);

            }
            if (v16)
            {
              *(_BYTE *)&v16->_flags |= 0x20u;
              *(_BYTE *)&v16->_flags |= 1u;
              v16->_implicitQueryType = 2;
            }
            v25 = [GEOLatLng alloc];
            objc_msgSend(v8, "coordinate");
            v21 = -[GEOLatLng initWithCoordinate:](v25, "initWithCoordinate:");
            -[GEOPDSImplicitQueryCategoryFilter implicitQuerySearchAroundPoi]((id *)&v16->super.super.isa);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOPDSImplicitQuerySearchAroundPOI setReferenceLocation:]((uint64_t)v26, v21);

            -[GEOPDSImplicitQueryCategoryFilter implicitQuerySearchAroundPoi]((id *)&v16->super.super.isa);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOPDSImplicitQuerySearchAroundPOI setCategoryIdOfPoi:]((uint64_t)v27, v9);

            v28 = objc_msgSend(v8, "muid");
            -[GEOPDSImplicitQueryCategoryFilter implicitQuerySearchAroundPoi]((id *)&v16->super.super.isa);
            v29 = (_BYTE *)objc_claimAutoreleasedReturnValue();
            if (!v29)
              goto LABEL_27;
            v29[60] |= 0x10u;
            v29[60] |= 1u;
            v30 = 32;
            break;
          case 3:
            -[GEOPDSImplicitQueryCategoryFilter implicitQueryIntroTipForHiking]((id *)&v16->super.super.isa);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v31)
            {
              v32 = objc_alloc_init(GEOPDSImplicitQueryIntroTipForHiking);
              -[GEOPDSImplicitQueryCategoryFilter setImplicitQueryIntroTipForHiking:]((uint64_t)v16, v32);

            }
            v33 = [GEOLatLng alloc];
            objc_msgSend(v8, "coordinate");
            v21 = -[GEOLatLng initWithCoordinate:](v33, "initWithCoordinate:");
            if (v16)
            {
              *(_BYTE *)&v16->_flags |= 0x20u;
              *(_BYTE *)&v16->_flags |= 1u;
              v16->_implicitQueryType = 3;
            }
            -[GEOPDSImplicitQueryCategoryFilter implicitQueryIntroTipForHiking]((id *)&v16->super.super.isa);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOPDSImplicitQueryIntroTipForHiking setReferenceLocation:]((uint64_t)v34, v21);

            v28 = objc_msgSend(v14, "searchAlongRouteMuid");
            -[GEOPDSImplicitQueryCategoryFilter implicitQueryIntroTipForHiking]((id *)&v16->super.super.isa);
            v29 = (_BYTE *)objc_claimAutoreleasedReturnValue();
            if (!v29)
              goto LABEL_27;
            v29[32] |= 1u;
            v30 = 16;
            break;
          case 4:
            if (v16)
            {
              *(_BYTE *)&v16->_flags |= 0x20u;
              *(_BYTE *)&v16->_flags |= 1u;
              v16->_implicitQueryType = 4;
            }
            goto LABEL_31;
          default:
            goto LABEL_31;
        }
        *(_QWORD *)&v29[v30] = v28;
LABEL_27:

LABEL_28:
LABEL_31:
        -[GEOPDSearchParameters searchFilter]((id *)&self->super.super.isa);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPDSSearchFilter setImplictQueryCategoryFilter:]((uint64_t)v35, v16);

      }
    }
  }

}

@end
