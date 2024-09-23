@implementation GEOPDPlaceGlobalResult

- (void)_readSearchResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(_BYTE *)(a1 + 449) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (void)_readCategorySearchResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(_BYTE *)(a1 + 445) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategorySearchResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (GEOPDPlaceGlobalResult)init
{
  GEOPDPlaceGlobalResult *v2;
  GEOPDPlaceGlobalResult *v3;
  GEOPDPlaceGlobalResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceGlobalResult;
  v2 = -[GEOPDPlaceGlobalResult init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (id)searchResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceGlobalResult _readSearchResult]((uint64_t)a1);
    a1 = (id *)v1[46];
  }
  return a1;
}

- (void)_readPopularNearbySearchResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(_BYTE *)(a1 + 448) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPopularNearbySearchResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
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
  if (self->_reader && (_GEOPDPlaceGlobalResultIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDPlaceGlobalResult readAll:]((uint64_t)self, 0);
    if (self->_searchResult)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_geocodingResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_canonicalSearchResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_reverseGeocodingResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_placeLookupResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_merchantLookupResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_placeRefinementResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_siriSearchResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_locationDirectedSearchResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_autocompleteResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_browseCategorySuggestionResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_categorySearchResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_popularNearbySearchResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_searchZeroKeywordCategorySuggestionResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_searchFieldPlaceholderResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_batchPopularNearbySearchResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_vendorSpecificPlaceRefinementResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_nearbySearchResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_addressObjectGeocodingResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_searchZeroKeywordWithSearchResultsSuggestionResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_externalTransitLookupResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_featureIdGeocodingResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_mapsIdentifierPlaceLookupResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_batchReverseGeocodingResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_brandLookupResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_wifiFingerprintResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_ipGeoLookupResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_groundViewLabelResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_batchSpatialLookupResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_placeGlobalCommonResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_placeCollectionLookupResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_transitScheduleLookupResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_batchCategoryLookupResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_batchMerchantLookupBrandResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_childPlaceLookupByCategoryResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_mapsSearchHomeResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_collectionSuggestionResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_publisherViewResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_allCollectionsViewResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_airportEntityPlaceLookupResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_territoryLookupResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_mapsHomeResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_allGuidesLocationsViewresult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_guidesHomeResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_extendedGeoLookupResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_queryUnderstandingResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_poiAtAddressLookupResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_placecardEnrichmentResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_offlineRegionNameResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_searchCapabilitiesResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_addressRecommendationResult)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiFingerprintResult, 0);
  objc_storeStrong((id *)&self->_vendorSpecificPlaceRefinementResult, 0);
  objc_storeStrong((id *)&self->_transitScheduleLookupResult, 0);
  objc_storeStrong((id *)&self->_territoryLookupResult, 0);
  objc_storeStrong((id *)&self->_siriSearchResult, 0);
  objc_storeStrong((id *)&self->_searchZeroKeywordWithSearchResultsSuggestionResult, 0);
  objc_storeStrong((id *)&self->_searchZeroKeywordCategorySuggestionResult, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_searchFieldPlaceholderResult, 0);
  objc_storeStrong((id *)&self->_searchCapabilitiesResult, 0);
  objc_storeStrong((id *)&self->_reverseGeocodingResult, 0);
  objc_storeStrong((id *)&self->_queryUnderstandingResult, 0);
  objc_storeStrong((id *)&self->_publisherViewResult, 0);
  objc_storeStrong((id *)&self->_popularNearbySearchResult, 0);
  objc_storeStrong((id *)&self->_poiAtAddressLookupResult, 0);
  objc_storeStrong((id *)&self->_placecardEnrichmentResult, 0);
  objc_storeStrong((id *)&self->_placeRefinementResult, 0);
  objc_storeStrong((id *)&self->_placeLookupResult, 0);
  objc_storeStrong((id *)&self->_placeGlobalCommonResult, 0);
  objc_storeStrong((id *)&self->_placeCollectionLookupResult, 0);
  objc_storeStrong((id *)&self->_offlineRegionNameResult, 0);
  objc_storeStrong((id *)&self->_nearbySearchResult, 0);
  objc_storeStrong((id *)&self->_merchantLookupResult, 0);
  objc_storeStrong((id *)&self->_mapsSearchHomeResult, 0);
  objc_storeStrong((id *)&self->_mapsIdentifierPlaceLookupResult, 0);
  objc_storeStrong((id *)&self->_mapsHomeResult, 0);
  objc_storeStrong((id *)&self->_locationDirectedSearchResult, 0);
  objc_storeStrong((id *)&self->_ipGeoLookupResult, 0);
  objc_storeStrong((id *)&self->_guidesHomeResult, 0);
  objc_storeStrong((id *)&self->_groundViewLabelResult, 0);
  objc_storeStrong((id *)&self->_geocodingResult, 0);
  objc_storeStrong((id *)&self->_featureIdGeocodingResult, 0);
  objc_storeStrong((id *)&self->_externalTransitLookupResult, 0);
  objc_storeStrong((id *)&self->_extendedGeoLookupResult, 0);
  objc_storeStrong((id *)&self->_collectionSuggestionResult, 0);
  objc_storeStrong((id *)&self->_childPlaceLookupByCategoryResult, 0);
  objc_storeStrong((id *)&self->_categorySearchResult, 0);
  objc_storeStrong((id *)&self->_canonicalSearchResult, 0);
  objc_storeStrong((id *)&self->_browseCategorySuggestionResult, 0);
  objc_storeStrong((id *)&self->_brandLookupResult, 0);
  objc_storeStrong((id *)&self->_batchSpatialLookupResult, 0);
  objc_storeStrong((id *)&self->_batchReverseGeocodingResult, 0);
  objc_storeStrong((id *)&self->_batchPopularNearbySearchResult, 0);
  objc_storeStrong((id *)&self->_batchMerchantLookupBrandResult, 0);
  objc_storeStrong((id *)&self->_batchCategoryLookupResult, 0);
  objc_storeStrong((id *)&self->_autocompleteResult, 0);
  objc_storeStrong((id *)&self->_allGuidesLocationsViewresult, 0);
  objc_storeStrong((id *)&self->_allCollectionsViewResult, 0);
  objc_storeStrong((id *)&self->_airportEntityPlaceLookupResult, 0);
  objc_storeStrong((id *)&self->_addressRecommendationResult, 0);
  objc_storeStrong((id *)&self->_addressObjectGeocodingResult, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)_readAutocompleteResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(_BYTE *)(a1 + 444) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAutocompleteResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (void)_readGeocodingResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(_BYTE *)(a1 + 446) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGeocodingResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (void)_readLocationDirectedSearchResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(_BYTE *)(a1 + 447) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocationDirectedSearchResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (void)_readMerchantLookupResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(_BYTE *)(a1 + 447) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantLookupResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (GEOPDPlaceGlobalResult)initWithData:(id)a3
{
  GEOPDPlaceGlobalResult *v3;
  GEOPDPlaceGlobalResult *v4;
  GEOPDPlaceGlobalResult *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceGlobalResult;
  v3 = -[GEOPDPlaceGlobalResult initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setSearchResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10100000000000uLL;
  objc_storeStrong((id *)(a1 + 368), a2);

}

- (id)geocodingResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceGlobalResult _readGeocodingResult]((uint64_t)a1);
    a1 = (id *)v1[23];
  }
  return a1;
}

- (void)setGeocodingResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000000200000uLL;
  objc_storeStrong((id *)(a1 + 184), a2);

}

- (void)setCanonicalSearchResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000000004000uLL;
  objc_storeStrong((id *)(a1 + 128), a2);

}

- (void)setReverseGeocodingResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10020000000000uLL;
  objc_storeStrong((id *)(a1 + 344), a2);

}

- (void)setPlaceLookupResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000400000000uLL;
  objc_storeStrong((id *)(a1 + 288), a2);

}

- (id)merchantLookupResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceGlobalResult _readMerchantLookupResult]((uint64_t)a1);
    a1 = (id *)v1[31];
  }
  return a1;
}

- (void)setMerchantLookupResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000020000000uLL;
  objc_storeStrong((id *)(a1 + 248), a2);

}

- (void)setPlaceRefinementResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000800000000uLL;
  objc_storeStrong((id *)(a1 + 296), a2);

}

- (void)setSiriSearchResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10800000000000uLL;
  objc_storeStrong((id *)(a1 + 392), a2);

}

- (id)locationDirectedSearchResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceGlobalResult _readLocationDirectedSearchResult]((uint64_t)a1);
    a1 = (id *)v1[27];
  }
  return a1;
}

- (void)setLocationDirectedSearchResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000002000000uLL;
  objc_storeStrong((id *)(a1 + 216), a2);

}

- (id)autocompleteResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceGlobalResult _readAutocompleteResult]((uint64_t)a1);
    a1 = (id *)v1[8];
  }
  return a1;
}

- (void)setAutocompleteResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 444) |= 0x10000000000040uLL;
    objc_storeStrong((id *)(a1 + 64), a2);
  }

}

- (void)_readBrowseCategorySuggestionResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(_BYTE *)(a1 + 445) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBrowseCategorySuggestionResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)browseCategorySuggestionResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceGlobalResult _readBrowseCategorySuggestionResult]((uint64_t)a1);
    a1 = (id *)v1[15];
  }
  return a1;
}

- (void)setBrowseCategorySuggestionResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000000002000uLL;
  objc_storeStrong((id *)(a1 + 120), a2);

}

- (id)categorySearchResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceGlobalResult _readCategorySearchResult]((uint64_t)a1);
    a1 = (id *)v1[17];
  }
  return a1;
}

- (void)setCategorySearchResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000000008000uLL;
  objc_storeStrong((id *)(a1 + 136), a2);

}

- (id)popularNearbySearchResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceGlobalResult _readPopularNearbySearchResult]((uint64_t)a1);
    a1 = (id *)v1[40];
  }
  return a1;
}

- (void)setPopularNearbySearchResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10004000000000uLL;
  objc_storeStrong((id *)(a1 + 320), a2);

}

- (void)_readSearchZeroKeywordCategorySuggestionResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(_BYTE *)(a1 + 449) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchZeroKeywordCategorySuggestionResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)searchZeroKeywordCategorySuggestionResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceGlobalResult _readSearchZeroKeywordCategorySuggestionResult]((uint64_t)a1);
    a1 = (id *)v1[47];
  }
  return a1;
}

- (void)setSearchZeroKeywordCategorySuggestionResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10200000000000uLL;
  objc_storeStrong((id *)(a1 + 376), a2);

}

- (void)_readSearchFieldPlaceholderResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(_BYTE *)(a1 + 449) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchFieldPlaceholderResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)searchFieldPlaceholderResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceGlobalResult _readSearchFieldPlaceholderResult]((uint64_t)a1);
    a1 = (id *)v1[45];
  }
  return a1;
}

- (void)setSearchFieldPlaceholderResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10080000000000uLL;
  objc_storeStrong((id *)(a1 + 360), a2);

}

- (void)_readBatchPopularNearbySearchResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(_BYTE *)(a1 + 445) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBatchPopularNearbySearchResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)batchPopularNearbySearchResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceGlobalResult _readBatchPopularNearbySearchResult]((uint64_t)a1);
    a1 = (id *)v1[11];
  }
  return a1;
}

- (void)setBatchPopularNearbySearchResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000000000200uLL;
  objc_storeStrong((id *)(a1 + 88), a2);

}

- (void)setVendorSpecificPlaceRefinementResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x14000000000000uLL;
  objc_storeStrong((id *)(a1 + 416), a2);

}

- (void)setNearbySearchResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000040000000uLL;
  objc_storeStrong((id *)(a1 + 256), a2);

}

- (void)setAddressObjectGeocodingResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000000000002uLL;
  objc_storeStrong((id *)(a1 + 24), a2);

}

- (void)setSearchZeroKeywordWithSearchResultsSuggestionResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10400000000000uLL;
  objc_storeStrong((id *)(a1 + 384), a2);

}

- (void)setExternalTransitLookupResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000000080000uLL;
  objc_storeStrong((id *)(a1 + 168), a2);

}

- (void)setFeatureIdGeocodingResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000000100000uLL;
  objc_storeStrong((id *)(a1 + 176), a2);

}

- (void)setMapsIdentifierPlaceLookupResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000008000000uLL;
  objc_storeStrong((id *)(a1 + 232), a2);

}

- (void)setBatchReverseGeocodingResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000000000400uLL;
  objc_storeStrong((id *)(a1 + 96), a2);

}

- (void)setBrandLookupResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000000001000uLL;
  objc_storeStrong((id *)(a1 + 112), a2);

}

- (void)setWifiFingerprintResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x18000000000000uLL;
  objc_storeStrong((id *)(a1 + 424), a2);

}

- (void)_readIpGeoLookupResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(_BYTE *)(a1 + 447) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIpGeoLookupResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)ipGeoLookupResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceGlobalResult _readIpGeoLookupResult]((uint64_t)a1);
    a1 = (id *)v1[26];
  }
  return a1;
}

- (void)setIpGeoLookupResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000001000000uLL;
  objc_storeStrong((id *)(a1 + 208), a2);

}

- (void)setGroundViewLabelResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000000400000uLL;
  objc_storeStrong((id *)(a1 + 192), a2);

}

- (void)_readBatchSpatialLookupResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(_BYTE *)(a1 + 445) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBatchSpatialLookupResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)batchSpatialLookupResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceGlobalResult _readBatchSpatialLookupResult]((uint64_t)a1);
    a1 = (id *)v1[13];
  }
  return a1;
}

- (void)setBatchSpatialLookupResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000000000800uLL;
  objc_storeStrong((id *)(a1 + 104), a2);

}

- (void)setPlaceGlobalCommonResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000200000000uLL;
  objc_storeStrong((id *)(a1 + 280), a2);

}

- (void)_readPlaceCollectionLookupResult
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 448) & 1) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceCollectionLookupResult_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
}

- (void)setPlaceCollectionLookupResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000100000000uLL;
  objc_storeStrong((id *)(a1 + 272), a2);

}

- (void)setTransitScheduleLookupResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x12000000000000uLL;
  objc_storeStrong((id *)(a1 + 408), a2);

}

- (void)setBatchCategoryLookupResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000000000080uLL;
  objc_storeStrong((id *)(a1 + 72), a2);

}

- (void)setBatchMerchantLookupBrandResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000000000100uLL;
  objc_storeStrong((id *)(a1 + 80), a2);

}

- (void)setChildPlaceLookupByCategoryResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000000010000uLL;
  objc_storeStrong((id *)(a1 + 144), a2);

}

- (void)_readMapsSearchHomeResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(_BYTE *)(a1 + 447) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsSearchHomeResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)mapsSearchHomeResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceGlobalResult _readMapsSearchHomeResult]((uint64_t)a1);
    a1 = (id *)v1[30];
  }
  return a1;
}

- (void)setMapsSearchHomeResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000010000000uLL;
  objc_storeStrong((id *)(a1 + 240), a2);

}

- (void)_readCollectionSuggestionResult
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 446) & 2) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCollectionSuggestionResult_tags_3544);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
}

- (void)setCollectionSuggestionResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000000020000uLL;
  objc_storeStrong((id *)(a1 + 152), a2);

}

- (void)_readPublisherViewResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(_BYTE *)(a1 + 448) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPublisherViewResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)publisherViewResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceGlobalResult _readPublisherViewResult]((uint64_t)a1);
    a1 = (id *)v1[41];
  }
  return a1;
}

- (void)setPublisherViewResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10008000000000uLL;
  objc_storeStrong((id *)(a1 + 328), a2);

}

- (void)_readAllCollectionsViewResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(_BYTE *)(a1 + 444) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAllCollectionsViewResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)allCollectionsViewResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceGlobalResult _readAllCollectionsViewResult]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)setAllCollectionsViewResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000000000010uLL;
  objc_storeStrong((id *)(a1 + 48), a2);

}

- (void)setAirportEntityPlaceLookupResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000000000008uLL;
  objc_storeStrong((id *)(a1 + 40), a2);

}

- (void)setTerritoryLookupResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x11000000000000uLL;
  objc_storeStrong((id *)(a1 + 400), a2);

}

- (void)_readMapsHomeResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(_BYTE *)(a1 + 447) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsHomeResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)mapsHomeResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceGlobalResult _readMapsHomeResult]((uint64_t)a1);
    a1 = (id *)v1[28];
  }
  return a1;
}

- (void)setMapsHomeResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000004000000uLL;
  objc_storeStrong((id *)(a1 + 224), a2);

}

- (void)_readAllGuidesLocationsViewresult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(_BYTE *)(a1 + 444) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAllGuidesLocationsViewresult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)allGuidesLocationsViewresult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceGlobalResult _readAllGuidesLocationsViewresult]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)setAllGuidesLocationsViewresult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000000000020uLL;
  objc_storeStrong((id *)(a1 + 56), a2);

}

- (void)_readGuidesHomeResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(_BYTE *)(a1 + 446) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGuidesHomeResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)guidesHomeResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceGlobalResult _readGuidesHomeResult]((uint64_t)a1);
    a1 = (id *)v1[25];
  }
  return a1;
}

- (void)setGuidesHomeResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000000800000uLL;
  objc_storeStrong((id *)(a1 + 200), a2);

}

- (void)setExtendedGeoLookupResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000000040000uLL;
  objc_storeStrong((id *)(a1 + 160), a2);

}

- (void)_readQueryUnderstandingResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(_BYTE *)(a1 + 449) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryUnderstandingResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)queryUnderstandingResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceGlobalResult _readQueryUnderstandingResult]((uint64_t)a1);
    a1 = (id *)v1[42];
  }
  return a1;
}

- (void)setQueryUnderstandingResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 444) |= 0x10010000000000uLL;
    objc_storeStrong((id *)(a1 + 336), a2);
  }

}

- (void)setPoiAtAddressLookupResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10002000000000uLL;
  objc_storeStrong((id *)(a1 + 312), a2);

}

- (void)setPlacecardEnrichmentResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10001000000000uLL;
  objc_storeStrong((id *)(a1 + 304), a2);

}

- (void)setOfflineRegionNameResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000080000000uLL;
  objc_storeStrong((id *)(a1 + 264), a2);

}

- (void)_readSearchCapabilitiesResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    if ((*(_BYTE *)(a1 + 449) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchCapabilitiesResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

- (id)searchCapabilitiesResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceGlobalResult _readSearchCapabilitiesResult]((uint64_t)a1);
    a1 = (id *)v1[44];
  }
  return a1;
}

- (void)setSearchCapabilitiesResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10040000000000uLL;
  objc_storeStrong((id *)(a1 + 352), a2);

}

- (void)setAddressRecommendationResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 444) |= 0x10000000000004uLL;
  objc_storeStrong((id *)(a1 + 32), a2);

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
  v8.super_class = (Class)GEOPDPlaceGlobalResult;
  -[GEOPDPlaceGlobalResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceGlobalResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceGlobalResult _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v11;
  void *v12;
  const __CFString *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  const __CFString *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  const __CFString *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  const __CFString *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  const __CFString *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  const __CFString *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  const __CFString *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  const __CFString *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  const __CFString *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  const __CFString *v93;
  id v94;
  void *v95;
  id v96;
  id v97;
  void *v98;
  void *v99;
  const __CFString *v100;
  id v101;
  void *v102;
  id v103;
  id v104;
  void *v105;
  void *v106;
  const __CFString *v107;
  id v108;
  void *v109;
  id v110;
  id v111;
  void *v112;
  void *v113;
  const __CFString *v114;
  id v115;
  void *v116;
  id v117;
  id v118;
  void *v119;
  void *v120;
  const __CFString *v121;
  id v122;
  void *v123;
  id v124;
  id v125;
  void *v126;
  void *v127;
  const __CFString *v128;
  id v129;
  void *v130;
  id v131;
  id v132;
  void *v133;
  void *v134;
  const __CFString *v135;
  id v136;
  void *v137;
  id v138;
  id v139;
  void *v140;
  void *v141;
  const __CFString *v142;
  id v143;
  void *v144;
  id v145;
  id v146;
  void *v147;
  void *v148;
  const __CFString *v149;
  id v150;
  void *v151;
  id v152;
  id v153;
  void *v154;
  void *v155;
  const __CFString *v156;
  id v157;
  void *v158;
  id v159;
  id v160;
  void *v161;
  void *v162;
  const __CFString *v163;
  id v164;
  void *v165;
  void *v166;
  void *v167;
  const __CFString *v168;
  id v169;
  void *v170;
  id v171;
  id v172;
  void *v173;
  void *v174;
  const __CFString *v175;
  id v176;
  void *v177;
  void *v178;
  void *v179;
  const __CFString *v180;
  id v181;
  void *v182;
  id v183;
  id v184;
  void *v185;
  void *v186;
  const __CFString *v187;
  id v188;
  id v189;
  void *v190;
  void *v191;
  const __CFString *v192;
  id v193;
  void *v194;
  id v195;
  id v196;
  void *v197;
  void *v198;
  const __CFString *v199;
  id v200;
  void *v201;
  id v202;
  id v203;
  void *v204;
  void *v205;
  const __CFString *v206;
  id v207;
  void *v208;
  id v209;
  id v210;
  void *v211;
  void *v212;
  const __CFString *v213;
  id v214;
  void *v215;
  id v216;
  id v217;
  void *v218;
  void *v219;
  const __CFString *v220;
  id v221;
  void *v222;
  void *v223;
  void *v224;
  const __CFString *v225;
  id v226;
  id v227;
  void *v228;
  void *v229;
  const __CFString *v230;
  id v231;
  void *v232;
  void *v233;
  void *v234;
  const __CFString *v235;
  id v236;
  void *v237;
  void *v238;
  void *v239;
  const __CFString *v240;
  id v241;
  void *v242;
  id v243;
  id v244;
  void *v245;
  void *v246;
  const __CFString *v247;
  id v248;
  void *v249;
  id v250;
  id v251;
  void *v252;
  void *v253;
  const __CFString *v254;
  id v255;
  void *v256;
  void *v257;
  void *v258;
  const __CFString *v259;
  id v260;
  void *v261;
  void *v262;
  void *v263;
  const __CFString *v264;
  id v265;
  void *v266;
  void *v267;
  void *v268;
  const __CFString *v269;
  id v270;
  void *v271;
  id v272;
  id v273;
  void *v274;
  void *v275;
  const __CFString *v276;
  id v277;
  void *v278;
  void *v279;
  void *v280;
  const __CFString *v281;
  id v282;
  void *v283;
  id v284;
  id v285;
  void *v286;
  void *v287;
  const __CFString *v288;
  id v289;
  void *v290;
  id v291;
  id v292;
  void *v293;
  void *v294;
  const __CFString *v295;
  id v296;
  void *v297;
  id v298;
  id v299;
  void *v300;
  void *v301;
  const __CFString *v302;
  id v303;
  void *v304;
  void *v305;
  void *v306;
  const __CFString *v307;
  id v308;
  void *v309;
  id v310;
  id v311;
  void *v312;
  void *v313;
  const __CFString *v314;
  id v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  id v320;
  id v321;
  id v322;
  _QWORD v324[4];
  id v325;

  if (!a1)
    return 0;
  -[GEOPDPlaceGlobalResult readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceGlobalResult searchResult]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("searchResult");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("search_result");
    }
    v9 = v7;

    objc_msgSend(v4, "setObject:forKey:", v9, v8);
  }

  -[GEOPDPlaceGlobalResult geocodingResult]((id *)a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v10, "jsonRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("geocodingResult");
    }
    else
    {
      objc_msgSend(v10, "dictionaryRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("geocoding_result");
    }
    v14 = v12;

    objc_msgSend(v4, "setObject:forKey:", v14, v13);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 445) & 0x40) == 0)
  {
    v15 = *(void **)(a1 + 8);
    if (v15)
    {
      v16 = v15;
      objc_sync_enter(v16);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCanonicalSearchResult_tags);
      objc_sync_exit(v16);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v17 = *(id *)(a1 + 128);
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "jsonRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("canonicalSearchResult");
    }
    else
    {
      objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("canonical_search_result");
    }
    v21 = v19;

    objc_msgSend(v4, "setObject:forKey:", v21, v20);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 449) & 2) == 0)
  {
    v22 = *(void **)(a1 + 8);
    if (v22)
    {
      v23 = v22;
      objc_sync_enter(v23);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readReverseGeocodingResult_tags);
      objc_sync_exit(v23);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v24 = *(id *)(a1 + 344);
  v25 = v24;
  if (v24)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v24, "jsonRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("reverseGeocodingResult");
    }
    else
    {
      objc_msgSend(v24, "dictionaryRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("reverse_geocoding_result");
    }
    v28 = v26;

    objc_msgSend(v4, "setObject:forKey:", v28, v27);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 448) & 4) == 0)
  {
    v29 = *(void **)(a1 + 8);
    if (v29)
    {
      v30 = v29;
      objc_sync_enter(v30);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceLookupResult_tags);
      objc_sync_exit(v30);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v31 = *(id *)(a1 + 288);
  v32 = v31;
  if (v31)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v31, "jsonRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("placeLookupResult");
    }
    else
    {
      objc_msgSend(v31, "dictionaryRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("place_lookup_result");
    }
    v35 = v33;

    objc_msgSend(v4, "setObject:forKey:", v35, v34);
  }

  -[GEOPDPlaceGlobalResult merchantLookupResult]((id *)a1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v36)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v36, "jsonRepresentation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("merchantLookupResult");
    }
    else
    {
      objc_msgSend(v36, "dictionaryRepresentation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("merchant_lookup_result");
    }
    v40 = v38;

    objc_msgSend(v4, "setObject:forKey:", v40, v39);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 448) & 8) == 0)
  {
    v41 = *(void **)(a1 + 8);
    if (v41)
    {
      v42 = v41;
      objc_sync_enter(v42);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceRefinementResult_tags);
      objc_sync_exit(v42);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v43 = *(id *)(a1 + 296);
  v44 = v43;
  if (v43)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v43, "jsonRepresentation");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = CFSTR("placeRefinementResult");
    }
    else
    {
      objc_msgSend(v43, "dictionaryRepresentation");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = CFSTR("place_refinement_result");
    }
    v47 = v45;

    objc_msgSend(v4, "setObject:forKey:", v47, v46);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 449) & 0x80) == 0)
  {
    v48 = *(void **)(a1 + 8);
    if (v48)
    {
      v49 = v48;
      objc_sync_enter(v49);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSiriSearchResult_tags);
      objc_sync_exit(v49);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v50 = *(id *)(a1 + 392);
  v51 = v50;
  if (v50)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v50, "jsonRepresentation");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = CFSTR("siriSearchResult");
    }
    else
    {
      objc_msgSend(v50, "dictionaryRepresentation");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = CFSTR("siri_search_result");
    }
    v54 = v52;

    objc_msgSend(v4, "setObject:forKey:", v54, v53);
  }

  -[GEOPDPlaceGlobalResult locationDirectedSearchResult]((id *)a1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55;
  if (v55)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v55, "jsonRepresentation");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = CFSTR("locationDirectedSearchResult");
    }
    else
    {
      objc_msgSend(v55, "dictionaryRepresentation");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = CFSTR("location_directed_search_result");
    }
    v59 = v57;

    objc_msgSend(v4, "setObject:forKey:", v59, v58);
  }

  -[GEOPDPlaceGlobalResult autocompleteResult]((id *)a1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v60;
  if (v60)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v60, "jsonRepresentation");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = CFSTR("autocompleteResult");
    }
    else
    {
      objc_msgSend(v60, "dictionaryRepresentation");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = CFSTR("autocomplete_result");
    }
    v64 = v62;

    objc_msgSend(v4, "setObject:forKey:", v64, v63);
  }

  -[GEOPDPlaceGlobalResult browseCategorySuggestionResult]((id *)a1);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v65;
  if (v65)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v65, "jsonRepresentation");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = CFSTR("browseCategorySuggestionResult");
    }
    else
    {
      objc_msgSend(v65, "dictionaryRepresentation");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = CFSTR("browse_category_suggestion_result");
    }
    v69 = v67;

    objc_msgSend(v4, "setObject:forKey:", v69, v68);
  }

  -[GEOPDPlaceGlobalResult categorySearchResult]((id *)a1);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v70;
  if (v70)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v70, "jsonRepresentation");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = CFSTR("categorySearchResult");
    }
    else
    {
      objc_msgSend(v70, "dictionaryRepresentation");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = CFSTR("category_search_result");
    }
    v74 = v72;

    objc_msgSend(v4, "setObject:forKey:", v74, v73);
  }

  -[GEOPDPlaceGlobalResult popularNearbySearchResult]((id *)a1);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v75;
  if (v75)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v75, "jsonRepresentation");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = CFSTR("popularNearbySearchResult");
    }
    else
    {
      objc_msgSend(v75, "dictionaryRepresentation");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = CFSTR("popular_nearby_search_result");
    }
    v79 = v77;

    objc_msgSend(v4, "setObject:forKey:", v79, v78);
  }

  -[GEOPDPlaceGlobalResult searchZeroKeywordCategorySuggestionResult]((id *)a1);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v80;
  if (v80)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v80, "jsonRepresentation");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = CFSTR("searchZeroKeywordCategorySuggestionResult");
    }
    else
    {
      objc_msgSend(v80, "dictionaryRepresentation");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = CFSTR("search_zero_keyword_category_suggestion_result");
    }
    v84 = v82;

    objc_msgSend(v4, "setObject:forKey:", v84, v83);
  }

  -[GEOPDPlaceGlobalResult searchFieldPlaceholderResult]((id *)a1);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v85;
  if (v85)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v85, "jsonRepresentation");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = CFSTR("searchFieldPlaceholderResult");
    }
    else
    {
      objc_msgSend(v85, "dictionaryRepresentation");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = CFSTR("search_field_placeholder_result");
    }
    v89 = v87;

    objc_msgSend(v4, "setObject:forKey:", v89, v88);
  }

  -[GEOPDPlaceGlobalResult batchPopularNearbySearchResult]((id *)a1);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v90;
  if (v90)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v90, "jsonRepresentation");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = CFSTR("batchPopularNearbySearchResult");
    }
    else
    {
      objc_msgSend(v90, "dictionaryRepresentation");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = CFSTR("batch_popular_nearby_search_result");
    }
    v94 = v92;

    objc_msgSend(v4, "setObject:forKey:", v94, v93);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 450) & 4) == 0)
  {
    v95 = *(void **)(a1 + 8);
    if (v95)
    {
      v96 = v95;
      objc_sync_enter(v96);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVendorSpecificPlaceRefinementResult_tags);
      objc_sync_exit(v96);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v97 = *(id *)(a1 + 416);
  v98 = v97;
  if (v97)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v97, "jsonRepresentation");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = CFSTR("vendorSpecificPlaceRefinementResult");
    }
    else
    {
      objc_msgSend(v97, "dictionaryRepresentation");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = CFSTR("vendor_specific_place_refinement_result");
    }
    v101 = v99;

    objc_msgSend(v4, "setObject:forKey:", v101, v100);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 447) & 0x40) == 0)
  {
    v102 = *(void **)(a1 + 8);
    if (v102)
    {
      v103 = v102;
      objc_sync_enter(v103);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNearbySearchResult_tags);
      objc_sync_exit(v103);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v104 = *(id *)(a1 + 256);
  v105 = v104;
  if (v104)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v104, "jsonRepresentation");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = CFSTR("nearbySearchResult");
    }
    else
    {
      objc_msgSend(v104, "dictionaryRepresentation");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = CFSTR("nearby_search_result");
    }
    v108 = v106;

    objc_msgSend(v4, "setObject:forKey:", v108, v107);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 444) & 2) == 0)
  {
    v109 = *(void **)(a1 + 8);
    if (v109)
    {
      v110 = v109;
      objc_sync_enter(v110);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressObjectGeocodingResult_tags);
      objc_sync_exit(v110);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v111 = *(id *)(a1 + 24);
  v112 = v111;
  if (v111)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v111, "jsonRepresentation");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = CFSTR("addressObjectGeocodingResult");
    }
    else
    {
      objc_msgSend(v111, "dictionaryRepresentation");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = CFSTR("address_object_geocoding_result");
    }
    v115 = v113;

    objc_msgSend(v4, "setObject:forKey:", v115, v114);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 449) & 0x40) == 0)
  {
    v116 = *(void **)(a1 + 8);
    if (v116)
    {
      v117 = v116;
      objc_sync_enter(v117);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchZeroKeywordWithSearchResultsSuggestionResult_tags);
      objc_sync_exit(v117);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v118 = *(id *)(a1 + 384);
  v119 = v118;
  if (v118)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v118, "jsonRepresentation");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = CFSTR("searchZeroKeywordWithSearchResultsSuggestionResult");
    }
    else
    {
      objc_msgSend(v118, "dictionaryRepresentation");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = CFSTR("search_zero_keyword_with_search_results_suggestion_result");
    }
    v122 = v120;

    objc_msgSend(v4, "setObject:forKey:", v122, v121);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 446) & 8) == 0)
  {
    v123 = *(void **)(a1 + 8);
    if (v123)
    {
      v124 = v123;
      objc_sync_enter(v124);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExternalTransitLookupResult_tags);
      objc_sync_exit(v124);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v125 = *(id *)(a1 + 168);
  v126 = v125;
  if (v125)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v125, "jsonRepresentation");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = CFSTR("externalTransitLookupResult");
    }
    else
    {
      objc_msgSend(v125, "dictionaryRepresentation");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = CFSTR("external_transit_lookup_result");
    }
    v129 = v127;

    objc_msgSend(v4, "setObject:forKey:", v129, v128);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 446) & 0x10) == 0)
  {
    v130 = *(void **)(a1 + 8);
    if (v130)
    {
      v131 = v130;
      objc_sync_enter(v131);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeatureIdGeocodingResult_tags);
      objc_sync_exit(v131);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v132 = *(id *)(a1 + 176);
  v133 = v132;
  if (v132)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v132, "jsonRepresentation");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = CFSTR("featureIdGeocodingResult");
    }
    else
    {
      objc_msgSend(v132, "dictionaryRepresentation");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = CFSTR("feature_id_geocoding_result");
    }
    v136 = v134;

    objc_msgSend(v4, "setObject:forKey:", v136, v135);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 447) & 8) == 0)
  {
    v137 = *(void **)(a1 + 8);
    if (v137)
    {
      v138 = v137;
      objc_sync_enter(v138);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsIdentifierPlaceLookupResult_tags);
      objc_sync_exit(v138);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v139 = *(id *)(a1 + 232);
  v140 = v139;
  if (v139)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v139, "jsonRepresentation");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v142 = CFSTR("mapsIdentifierPlaceLookupResult");
    }
    else
    {
      objc_msgSend(v139, "dictionaryRepresentation");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v142 = CFSTR("maps_identifier_place_lookup_result");
    }
    v143 = v141;

    objc_msgSend(v4, "setObject:forKey:", v143, v142);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 445) & 4) == 0)
  {
    v144 = *(void **)(a1 + 8);
    if (v144)
    {
      v145 = v144;
      objc_sync_enter(v145);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBatchReverseGeocodingResult_tags);
      objc_sync_exit(v145);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v146 = *(id *)(a1 + 96);
  v147 = v146;
  if (v146)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v146, "jsonRepresentation");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = CFSTR("batchReverseGeocodingResult");
    }
    else
    {
      objc_msgSend(v146, "dictionaryRepresentation");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = CFSTR("batch_reverse_geocoding_result");
    }
    v150 = v148;

    objc_msgSend(v4, "setObject:forKey:", v150, v149);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 445) & 0x10) == 0)
  {
    v151 = *(void **)(a1 + 8);
    if (v151)
    {
      v152 = v151;
      objc_sync_enter(v152);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBrandLookupResult_tags);
      objc_sync_exit(v152);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v153 = *(id *)(a1 + 112);
  v154 = v153;
  if (v153)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v153, "jsonRepresentation");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      v156 = CFSTR("brandLookupResult");
    }
    else
    {
      objc_msgSend(v153, "dictionaryRepresentation");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      v156 = CFSTR("brand_lookup_result");
    }
    v157 = v155;

    objc_msgSend(v4, "setObject:forKey:", v157, v156);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 450) & 8) == 0)
  {
    v158 = *(void **)(a1 + 8);
    if (v158)
    {
      v159 = v158;
      objc_sync_enter(v159);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWifiFingerprintResult_tags);
      objc_sync_exit(v159);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v160 = *(id *)(a1 + 424);
  v161 = v160;
  if (v160)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v160, "jsonRepresentation");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = CFSTR("wifiFingerprintResult");
    }
    else
    {
      objc_msgSend(v160, "dictionaryRepresentation");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = CFSTR("wifi_fingerprint_result");
    }
    v164 = v162;

    objc_msgSend(v4, "setObject:forKey:", v164, v163);
  }

  -[GEOPDPlaceGlobalResult ipGeoLookupResult]((id *)a1);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = v165;
  if (v165)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v165, "jsonRepresentation");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      v168 = CFSTR("ipGeoLookupResult");
    }
    else
    {
      objc_msgSend(v165, "dictionaryRepresentation");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      v168 = CFSTR("ip_geo_lookup_result");
    }
    v169 = v167;

    objc_msgSend(v4, "setObject:forKey:", v169, v168);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 446) & 0x40) == 0)
  {
    v170 = *(void **)(a1 + 8);
    if (v170)
    {
      v171 = v170;
      objc_sync_enter(v171);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGroundViewLabelResult_tags);
      objc_sync_exit(v171);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v172 = *(id *)(a1 + 192);
  v173 = v172;
  if (v172)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v172, "jsonRepresentation");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      v175 = CFSTR("groundViewLabelResult");
    }
    else
    {
      objc_msgSend(v172, "dictionaryRepresentation");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      v175 = CFSTR("ground_view_label_result");
    }
    v176 = v174;

    objc_msgSend(v4, "setObject:forKey:", v176, v175);
  }

  -[GEOPDPlaceGlobalResult batchSpatialLookupResult]((id *)a1);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = v177;
  if (v177)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v177, "jsonRepresentation");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      v180 = CFSTR("batchSpatialLookupResult");
    }
    else
    {
      objc_msgSend(v177, "dictionaryRepresentation");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      v180 = CFSTR("batch_spatial_lookup_result");
    }
    v181 = v179;

    objc_msgSend(v4, "setObject:forKey:", v181, v180);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 448) & 2) == 0)
  {
    v182 = *(void **)(a1 + 8);
    if (v182)
    {
      v183 = v182;
      objc_sync_enter(v183);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceGlobalCommonResult_tags);
      objc_sync_exit(v183);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v184 = *(id *)(a1 + 280);
  v185 = v184;
  if (v184)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v184, "jsonRepresentation");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      v187 = CFSTR("placeGlobalCommonResult");
    }
    else
    {
      objc_msgSend(v184, "dictionaryRepresentation");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      v187 = CFSTR("place_global_common_result");
    }
    v188 = v186;

    objc_msgSend(v4, "setObject:forKey:", v188, v187);
  }

  -[GEOPDPlaceGlobalResult _readPlaceCollectionLookupResult](a1);
  v189 = *(id *)(a1 + 272);
  v190 = v189;
  if (v189)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v189, "jsonRepresentation");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      v192 = CFSTR("placeCollectionLookupResult");
    }
    else
    {
      objc_msgSend(v189, "dictionaryRepresentation");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      v192 = CFSTR("place_collection_lookup_result");
    }
    v193 = v191;

    objc_msgSend(v4, "setObject:forKey:", v193, v192);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 450) & 2) == 0)
  {
    v194 = *(void **)(a1 + 8);
    if (v194)
    {
      v195 = v194;
      objc_sync_enter(v195);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitScheduleLookupResult_tags);
      objc_sync_exit(v195);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v196 = *(id *)(a1 + 408);
  v197 = v196;
  if (v196)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v196, "jsonRepresentation");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      v199 = CFSTR("transitScheduleLookupResult");
    }
    else
    {
      objc_msgSend(v196, "dictionaryRepresentation");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      v199 = CFSTR("transit_schedule_lookup_result");
    }
    v200 = v198;

    objc_msgSend(v4, "setObject:forKey:", v200, v199);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 444) & 0x80) == 0)
  {
    v201 = *(void **)(a1 + 8);
    if (v201)
    {
      v202 = v201;
      objc_sync_enter(v202);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBatchCategoryLookupResult_tags);
      objc_sync_exit(v202);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v203 = *(id *)(a1 + 72);
  v204 = v203;
  if (v203)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v203, "jsonRepresentation");
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      v206 = CFSTR("batchCategoryLookupResult");
    }
    else
    {
      objc_msgSend(v203, "dictionaryRepresentation");
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      v206 = CFSTR("batch_category_lookup_result");
    }
    v207 = v205;

    objc_msgSend(v4, "setObject:forKey:", v207, v206);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 445) & 1) == 0)
  {
    v208 = *(void **)(a1 + 8);
    if (v208)
    {
      v209 = v208;
      objc_sync_enter(v209);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBatchMerchantLookupBrandResult_tags);
      objc_sync_exit(v209);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v210 = *(id *)(a1 + 80);
  v211 = v210;
  if (v210)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v210, "jsonRepresentation");
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      v213 = CFSTR("batchMerchantLookupBrandResult");
    }
    else
    {
      objc_msgSend(v210, "dictionaryRepresentation");
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      v213 = CFSTR("batch_merchant_lookup_brand_result");
    }
    v214 = v212;

    objc_msgSend(v4, "setObject:forKey:", v214, v213);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 446) & 1) == 0)
  {
    v215 = *(void **)(a1 + 8);
    if (v215)
    {
      v216 = v215;
      objc_sync_enter(v216);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readChildPlaceLookupByCategoryResult_tags);
      objc_sync_exit(v216);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v217 = *(id *)(a1 + 144);
  v218 = v217;
  if (v217)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v217, "jsonRepresentation");
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      v220 = CFSTR("childPlaceLookupByCategoryResult");
    }
    else
    {
      objc_msgSend(v217, "dictionaryRepresentation");
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      v220 = CFSTR("child_place_lookup_by_category_result");
    }
    v221 = v219;

    objc_msgSend(v4, "setObject:forKey:", v221, v220);
  }

  -[GEOPDPlaceGlobalResult mapsSearchHomeResult]((id *)a1);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  v223 = v222;
  if (v222)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v222, "jsonRepresentation");
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      v225 = CFSTR("mapsSearchHomeResult");
    }
    else
    {
      objc_msgSend(v222, "dictionaryRepresentation");
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      v225 = CFSTR("maps_search_home_result");
    }
    v226 = v224;

    objc_msgSend(v4, "setObject:forKey:", v226, v225);
  }

  -[GEOPDPlaceGlobalResult _readCollectionSuggestionResult](a1);
  v227 = *(id *)(a1 + 152);
  v228 = v227;
  if (v227)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v227, "jsonRepresentation");
      v229 = (void *)objc_claimAutoreleasedReturnValue();
      v230 = CFSTR("collectionSuggestionResult");
    }
    else
    {
      objc_msgSend(v227, "dictionaryRepresentation");
      v229 = (void *)objc_claimAutoreleasedReturnValue();
      v230 = CFSTR("collection_suggestion_result");
    }
    v231 = v229;

    objc_msgSend(v4, "setObject:forKey:", v231, v230);
  }

  -[GEOPDPlaceGlobalResult publisherViewResult]((id *)a1);
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  v233 = v232;
  if (v232)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v232, "jsonRepresentation");
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      v235 = CFSTR("publisherViewResult");
    }
    else
    {
      objc_msgSend(v232, "dictionaryRepresentation");
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      v235 = CFSTR("publisher_view_result");
    }
    v236 = v234;

    objc_msgSend(v4, "setObject:forKey:", v236, v235);
  }

  -[GEOPDPlaceGlobalResult allCollectionsViewResult]((id *)a1);
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  v238 = v237;
  if (v237)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v237, "jsonRepresentation");
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      v240 = CFSTR("allCollectionsViewResult");
    }
    else
    {
      objc_msgSend(v237, "dictionaryRepresentation");
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      v240 = CFSTR("all_collections_view_result");
    }
    v241 = v239;

    objc_msgSend(v4, "setObject:forKey:", v241, v240);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 444) & 8) == 0)
  {
    v242 = *(void **)(a1 + 8);
    if (v242)
    {
      v243 = v242;
      objc_sync_enter(v243);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAirportEntityPlaceLookupResult_tags);
      objc_sync_exit(v243);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v244 = *(id *)(a1 + 40);
  v245 = v244;
  if (v244)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v244, "jsonRepresentation");
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      v247 = CFSTR("airportEntityPlaceLookupResult");
    }
    else
    {
      objc_msgSend(v244, "dictionaryRepresentation");
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      v247 = CFSTR("airport_entity_place_lookup_result");
    }
    v248 = v246;

    objc_msgSend(v4, "setObject:forKey:", v248, v247);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 450) & 1) == 0)
  {
    v249 = *(void **)(a1 + 8);
    if (v249)
    {
      v250 = v249;
      objc_sync_enter(v250);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTerritoryLookupResult_tags);
      objc_sync_exit(v250);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v251 = *(id *)(a1 + 400);
  v252 = v251;
  if (v251)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v251, "jsonRepresentation");
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      v254 = CFSTR("territoryLookupResult");
    }
    else
    {
      objc_msgSend(v251, "dictionaryRepresentation");
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      v254 = CFSTR("territory_lookup_result");
    }
    v255 = v253;

    objc_msgSend(v4, "setObject:forKey:", v255, v254);
  }

  -[GEOPDPlaceGlobalResult mapsHomeResult]((id *)a1);
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  v257 = v256;
  if (v256)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v256, "jsonRepresentation");
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      v259 = CFSTR("mapsHomeResult");
    }
    else
    {
      objc_msgSend(v256, "dictionaryRepresentation");
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      v259 = CFSTR("maps_home_result");
    }
    v260 = v258;

    objc_msgSend(v4, "setObject:forKey:", v260, v259);
  }

  -[GEOPDPlaceGlobalResult allGuidesLocationsViewresult]((id *)a1);
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  v262 = v261;
  if (v261)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v261, "jsonRepresentation");
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      v264 = CFSTR("allGuidesLocationsViewresult");
    }
    else
    {
      objc_msgSend(v261, "dictionaryRepresentation");
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      v264 = CFSTR("all_guides_locations_viewresult");
    }
    v265 = v263;

    objc_msgSend(v4, "setObject:forKey:", v265, v264);
  }

  -[GEOPDPlaceGlobalResult guidesHomeResult]((id *)a1);
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  v267 = v266;
  if (v266)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v266, "jsonRepresentation");
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      v269 = CFSTR("guidesHomeResult");
    }
    else
    {
      objc_msgSend(v266, "dictionaryRepresentation");
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      v269 = CFSTR("guides_home_result");
    }
    v270 = v268;

    objc_msgSend(v4, "setObject:forKey:", v270, v269);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 446) & 4) == 0)
  {
    v271 = *(void **)(a1 + 8);
    if (v271)
    {
      v272 = v271;
      objc_sync_enter(v272);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExtendedGeoLookupResult_tags);
      objc_sync_exit(v272);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v273 = *(id *)(a1 + 160);
  v274 = v273;
  if (v273)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v273, "jsonRepresentation");
      v275 = (void *)objc_claimAutoreleasedReturnValue();
      v276 = CFSTR("extendedGeoLookupResult");
    }
    else
    {
      objc_msgSend(v273, "dictionaryRepresentation");
      v275 = (void *)objc_claimAutoreleasedReturnValue();
      v276 = CFSTR("extended_geo_lookup_result");
    }
    v277 = v275;

    objc_msgSend(v4, "setObject:forKey:", v277, v276);
  }

  -[GEOPDPlaceGlobalResult queryUnderstandingResult]((id *)a1);
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  v279 = v278;
  if (v278)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v278, "jsonRepresentation");
      v280 = (void *)objc_claimAutoreleasedReturnValue();
      v281 = CFSTR("queryUnderstandingResult");
    }
    else
    {
      objc_msgSend(v278, "dictionaryRepresentation");
      v280 = (void *)objc_claimAutoreleasedReturnValue();
      v281 = CFSTR("query_understanding_result");
    }
    v282 = v280;

    objc_msgSend(v4, "setObject:forKey:", v282, v281);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 448) & 0x20) == 0)
  {
    v283 = *(void **)(a1 + 8);
    if (v283)
    {
      v284 = v283;
      objc_sync_enter(v284);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPoiAtAddressLookupResult_tags);
      objc_sync_exit(v284);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v285 = *(id *)(a1 + 312);
  v286 = v285;
  if (v285)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v285, "jsonRepresentation");
      v287 = (void *)objc_claimAutoreleasedReturnValue();
      v288 = CFSTR("poiAtAddressLookupResult");
    }
    else
    {
      objc_msgSend(v285, "dictionaryRepresentation");
      v287 = (void *)objc_claimAutoreleasedReturnValue();
      v288 = CFSTR("poi_at_address_lookup_result");
    }
    v289 = v287;

    objc_msgSend(v4, "setObject:forKey:", v289, v288);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 448) & 0x10) == 0)
  {
    v290 = *(void **)(a1 + 8);
    if (v290)
    {
      v291 = v290;
      objc_sync_enter(v291);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlacecardEnrichmentResult_tags);
      objc_sync_exit(v291);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v292 = *(id *)(a1 + 304);
  v293 = v292;
  if (v292)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v292, "jsonRepresentation");
      v294 = (void *)objc_claimAutoreleasedReturnValue();
      v295 = CFSTR("placecardEnrichmentResult");
    }
    else
    {
      objc_msgSend(v292, "dictionaryRepresentation");
      v294 = (void *)objc_claimAutoreleasedReturnValue();
      v295 = CFSTR("placecard_enrichment_result");
    }
    v296 = v294;

    objc_msgSend(v4, "setObject:forKey:", v296, v295);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 447) & 0x80) == 0)
  {
    v297 = *(void **)(a1 + 8);
    if (v297)
    {
      v298 = v297;
      objc_sync_enter(v298);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOfflineRegionNameResult_tags);
      objc_sync_exit(v298);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v299 = *(id *)(a1 + 264);
  v300 = v299;
  if (v299)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v299, "jsonRepresentation");
      v301 = (void *)objc_claimAutoreleasedReturnValue();
      v302 = CFSTR("offlineRegionNameResult");
    }
    else
    {
      objc_msgSend(v299, "dictionaryRepresentation");
      v301 = (void *)objc_claimAutoreleasedReturnValue();
      v302 = CFSTR("offline_region_name_result");
    }
    v303 = v301;

    objc_msgSend(v4, "setObject:forKey:", v303, v302);
  }

  -[GEOPDPlaceGlobalResult searchCapabilitiesResult]((id *)a1);
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  v305 = v304;
  if (v304)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v304, "jsonRepresentation");
      v306 = (void *)objc_claimAutoreleasedReturnValue();
      v307 = CFSTR("searchCapabilitiesResult");
    }
    else
    {
      objc_msgSend(v304, "dictionaryRepresentation");
      v306 = (void *)objc_claimAutoreleasedReturnValue();
      v307 = CFSTR("search_capabilities_result");
    }
    v308 = v306;

    objc_msgSend(v4, "setObject:forKey:", v308, v307);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
  if ((*(_BYTE *)(a1 + 444) & 4) == 0)
  {
    v309 = *(void **)(a1 + 8);
    if (v309)
    {
      v310 = v309;
      objc_sync_enter(v310);
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressRecommendationResult_tags);
      objc_sync_exit(v310);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  v311 = *(id *)(a1 + 32);
  v312 = v311;
  if (v311)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v311, "jsonRepresentation");
      v313 = (void *)objc_claimAutoreleasedReturnValue();
      v314 = CFSTR("addressRecommendationResult");
    }
    else
    {
      objc_msgSend(v311, "dictionaryRepresentation");
      v313 = (void *)objc_claimAutoreleasedReturnValue();
      v314 = CFSTR("address_recommendation_result");
    }
    v315 = v313;

    objc_msgSend(v4, "setObject:forKey:", v315, v314);
  }

  v316 = *(void **)(a1 + 16);
  if (v316)
  {
    objc_msgSend(v316, "dictionaryRepresentation");
    v317 = (void *)objc_claimAutoreleasedReturnValue();
    v318 = v317;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v317, "count"));
      v319 = (void *)objc_claimAutoreleasedReturnValue();
      v324[0] = MEMORY[0x1E0C809B0];
      v324[1] = 3221225472;
      v324[2] = __52__GEOPDPlaceGlobalResult__dictionaryRepresentation___block_invoke;
      v324[3] = &unk_1E1C00600;
      v320 = v319;
      v325 = v320;
      objc_msgSend(v318, "enumerateKeysAndObjectsUsingBlock:", v324);
      v321 = v320;

      v318 = v321;
    }
    objc_msgSend(v4, "setObject:forKey:", v318, CFSTR("Unknown Fields"));

  }
  v322 = v4;

  return v322;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceGlobalResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 440));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_3794;
      else
        v6 = (int *)&readAll__nonRecursiveTag_3795;
      GEOPDPlaceGlobalResultReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDPlaceGlobalResultCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 440));
  }
}

void __52__GEOPDPlaceGlobalResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_initWithDictionary:(unsigned int)a3 isJSON:
{
  id v4;
  const __CFString *v5;
  void *v6;
  GEOPDSearchResult *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  GEOPDGeocodingResult *v11;
  id v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  GEOPDMultiLocalizedString *v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  GEOPDCanonicalLocationSearchResult *v25;
  id v26;
  const __CFString *v27;
  void *v28;
  GEOPDReverseGeocodingResult *v29;
  id v30;
  const __CFString *v31;
  void *v32;
  GEOPDPlaceLookupResult *v33;
  id v34;
  const __CFString *v35;
  void *v36;
  GEOPDMerchantLookupResult *v37;
  GEOPDMerchantLookupResult *v38;
  GEOPDMerchantLookupResult *v39;
  const __CFString *v40;
  void *v41;
  GEOPDPlaceRefinementResult *v42;
  id v43;
  const __CFString *v44;
  void *v45;
  GEOPDSiriSearchResult *v46;
  id v47;
  const __CFString *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  GEOPDMultiLocalizedString *v55;
  void *v56;
  uint64_t v57;
  const __CFString *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  uint64_t v64;
  GEOPDResultDetourInfo *v65;
  GEOPDResultDetourInfo *v66;
  GEOPDResultDetourInfo *v67;
  const __CFString *v68;
  void *v69;
  char v70;
  const __CFString *v71;
  void *v72;
  GEOPDLocationDirectedSearchResult *v73;
  id v74;
  const __CFString *v75;
  void *v76;
  GEOMapRegion *v77;
  GEOMapRegion *v78;
  GEOMapRegion *v79;
  const __CFString *v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  GEOPDMultiLocalizedString *v87;
  void *v88;
  uint64_t v89;
  const __CFString *v90;
  void *v91;
  GEOPDPaginationInfo *v92;
  void *v93;
  const __CFString *v94;
  void *v95;
  GEOPDAutocompleteResult *v96;
  void *v97;
  const __CFString *v98;
  void *v99;
  GEOPDSearchBrowseCategorySuggestionResult *v100;
  void *v101;
  const __CFString *v102;
  void *v103;
  GEOPDCategorySearchResult *v104;
  GEOPDCategorySearchResult *v105;
  id v106;
  os_unfair_lock_s *v107;
  const __CFString *v108;
  void *v109;
  GEOMapRegion *v110;
  GEOMapRegion *v111;
  GEOMapRegion *v112;
  const __CFString *v113;
  void *v114;
  char v115;
  const __CFString *v116;
  void *v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  GEOPDRelatedSearchSuggestion *v123;
  void *v124;
  uint64_t v125;
  const __CFString *v126;
  void *v127;
  id v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t j;
  uint64_t v132;
  GEOPDResultDetourInfo *v133;
  GEOPDResultDetourInfo *v134;
  GEOPDResultDetourInfo *v135;
  const __CFString *v136;
  void *v137;
  GEOPDRelatedSearchSuggestion *v138;
  void *v139;
  const __CFString *v140;
  void *v141;
  GEOPDSearchClientBehavior *v142;
  _BYTE *v143;
  const __CFString *v144;
  void *v145;
  char v146;
  const __CFString *v147;
  void *v148;
  id v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  GEOPDBrowseCategory *v154;
  void *v155;
  uint64_t v156;
  const __CFString *v157;
  void *v158;
  GEOPDSCategorySearchResultSection *v159;
  void *v160;
  const __CFString *v161;
  void *v162;
  id v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  GEOPDRelatedEntitySection *v168;
  void *v169;
  uint64_t v170;
  const __CFString *v171;
  void *v172;
  id v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  GEOPDSSearchTierMetadata *v178;
  void *v179;
  uint64_t v180;
  const __CFString *v181;
  void *v182;
  GEOPDResultRefinementGroup *v183;
  void *v184;
  const __CFString *v185;
  void *v186;
  GEOPDSSearchAutoRedoThreshold *v187;
  void *v188;
  const __CFString *v189;
  void *v190;
  GEOPDPlaceSummaryLayoutMetadata *v191;
  GEOPDPlaceSummaryLayoutMetadata *v192;
  GEOPDPlaceSummaryLayoutMetadata *v193;
  const __CFString *v194;
  void *v195;
  GEOPDSearchSectionList *v196;
  void *v197;
  const __CFString *v198;
  void *v199;
  char v200;
  const __CFString *v201;
  void *v202;
  id v203;
  int v204;
  const __CFString *v205;
  void *v206;
  char v207;
  const __CFString *v208;
  void *v209;
  void *v210;
  const __CFString *v211;
  void *v212;
  id v213;
  uint32_t v214;
  const __CFString *v215;
  void *v216;
  GEOPDGuideSummaryLayoutMetadata *v217;
  void *v218;
  const __CFString *v219;
  void *v220;
  GEOPDPaginationInfo *v221;
  void *v222;
  const __CFString *v223;
  void *v224;
  GEOPDSSearchRedoButtonThreshold *v225;
  void *v226;
  const __CFString *v227;
  void *v228;
  GEOPDPopularNearbySearchResult *v229;
  id v230;
  const __CFString *v231;
  void *v232;
  GEOMapRegion *v233;
  GEOMapRegion *v234;
  GEOMapRegion *v235;
  const __CFString *v236;
  void *v237;
  void *v238;
  const __CFString *v239;
  void *v240;
  char v241;
  const __CFString *v242;
  void *v243;
  GEOPDSearchZeroKeywordCategorySuggestionResult *v244;
  GEOPDSearchZeroKeywordCategorySuggestionResult *v245;
  id v246;
  void *v247;
  id v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  void *v252;
  GEOPDBrowseCategory *v253;
  void *v254;
  uint64_t v255;
  const __CFString *v256;
  const __CFString *v257;
  const __CFString *v258;
  const __CFString *v259;
  void *k;
  void *v261;
  GEOPDSearchZeroKeywordEntry *v262;
  void *v263;
  unsigned int v264;
  void *v265;
  unsigned int v266;
  void *v267;
  id v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t m;
  void *v272;
  const __CFString *v273;
  void *v274;
  GEOPDSearchFieldPlaceholderResult *v275;
  id v276;
  const __CFString *v277;
  void *v278;
  void *v279;
  const __CFString *v280;
  void *v281;
  GEOPDBatchPopularNearbySearchResult *v282;
  GEOPDBatchPopularNearbySearchResult *v283;
  id v284;
  const __CFString *v285;
  void *v286;
  const __CFString *v287;
  const __CFString *v288;
  const __CFString *v289;
  uint64_t v290;
  uint64_t v291;
  void *v292;
  GEOPDPopularNearbyResult *v293;
  uint64_t v294;
  void *v295;
  void *v296;
  id v297;
  id v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t n;
  void *v302;
  id v303;
  void *v304;
  uint64_t v305;
  uint64_t v306;
  void *v307;
  uint64_t *v308;
  uint64_t v309;
  const __CFString *v310;
  void *v311;
  GEOPDVendorSpecificPlaceRefinementResult *v312;
  id v313;
  const __CFString *v314;
  void *v315;
  GEOPDNearbySearchResult *v316;
  id v317;
  const __CFString *v318;
  void *v319;
  GEOPDAddressObjectGeocodingResult *v320;
  id v321;
  const __CFString *v322;
  void *v323;
  id v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  void *v328;
  GEOPDMultiLocalizedString *v329;
  void *v330;
  uint64_t v331;
  const __CFString *v332;
  void *v333;
  GEOPDSearchZeroKeywordWithSearchResultsSuggestionResult *v334;
  GEOPDSearchZeroKeywordWithSearchResultsSuggestionResult *v335;
  id v336;
  const __CFString *v337;
  void *v338;
  const __CFString *v339;
  uint64_t v340;
  uint64_t v341;
  void *v342;
  GEOPDSearchResultsForCategoryEntry *v343;
  uint64_t v344;
  void *v345;
  GEOPDBrowseCategory *v346;
  void *v347;
  id v348;
  id v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t ii;
  void *v353;
  void *v354;
  id v355;
  uint64_t v356;
  const __CFString *v357;
  void *v358;
  GEOPDExternalTransitLookupResult *v359;
  id v360;
  const __CFString *v361;
  void *v362;
  void *v363;
  const __CFString *v364;
  void *v365;
  GEOPDFeatureIdGeocodingResult *v366;
  id v367;
  const __CFString *v368;
  void *v369;
  GEOPDMapsIdentifierPlaceLookupResult *v370;
  id v371;
  const __CFString *v372;
  void *v373;
  GEOPDBatchReverseGeocodingResult *v374;
  id v375;
  const __CFString *v376;
  void *v377;
  GEOPDBrandLookupResult *v378;
  id v379;
  const __CFString *v380;
  void *v381;
  GEOPDWifiFingerprintResult *v382;
  id v383;
  const __CFString *v384;
  void *v385;
  GEOPDIpGeoLookupResult *v386;
  id v387;
  void *v388;
  id v389;
  int v390;
  const __CFString *v391;
  void *v392;
  void *v393;
  void *v394;
  GEOLatLng *v395;
  GEOLatLng *v396;
  GEOLatLng *v397;
  const __CFString *v398;
  void *v399;
  void *v400;
  const __CFString *v401;
  void *v402;
  void *v403;
  const __CFString *v404;
  void *v405;
  GEOPDGroundViewLabelResult *v406;
  id v407;
  const __CFString *v408;
  void *v409;
  GEOPDBatchSpatialLookupResult *v410;
  GEOPDBatchSpatialLookupResult *v411;
  id v412;
  const __CFString *v413;
  void *v414;
  id v415;
  int v416;
  const __CFString *v417;
  void *v418;
  const __CFString *v419;
  uint64_t v420;
  void *v421;
  GEOPDSpatialPlaceLookupResult *v422;
  id v423;
  uint64_t v424;
  void *v425;
  id v426;
  int v427;
  void *v428;
  id v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t jj;
  uint64_t v433;
  GEOPDSpatialPlaceLookupResponse *v434;
  GEOPDSpatialPlaceLookupResponse *v435;
  GEOPDSpatialPlaceLookupResponse *v436;
  void *v437;
  GEOMapRegion *v438;
  GEOMapRegion *v439;
  GEOMapRegion *v440;
  GEOMapRegion *v441;
  uint64_t v442;
  const __CFString *v443;
  const __CFString *v444;
  uint64_t v445;
  void *v446;
  GEOPDSpatialEventLookupResult *v447;
  id v448;
  uint64_t v449;
  void *v450;
  id v451;
  int v452;
  void *v453;
  id v454;
  uint64_t v455;
  uint64_t v456;
  uint64_t kk;
  uint64_t v458;
  GEOPDSpatialEventLookupResponse *v459;
  GEOPDSpatialEventLookupResponse *v460;
  GEOPDSpatialEventLookupResponse *v461;
  void *v462;
  GEOMapRegion *v463;
  GEOMapRegion *v464;
  GEOMapRegion *v465;
  GEOMapRegion *v466;
  uint64_t v467;
  const __CFString *v468;
  void *v469;
  GEOPDPlaceGlobalCommonResult *v470;
  id v471;
  const __CFString *v472;
  void *v473;
  id v474;
  uint64_t v475;
  uint64_t v476;
  uint64_t v477;
  void *v478;
  GEOPDPlaceContextMetadata *v479;
  void *v480;
  uint64_t v481;
  const __CFString *v482;
  void *v483;
  GEOPDPlaceCollectionLookupResult *v484;
  id v485;
  const __CFString *v486;
  void *v487;
  GEOPDComponent *v488;
  char *v489;
  const __CFString *v490;
  void *v491;
  GEOPDTransitScheduleLookupResult *v492;
  id v493;
  const __CFString *v494;
  void *v495;
  GEOPDBatchCategoryLookupResult *v496;
  GEOPDBatchCategoryLookupResult *v497;
  id v498;
  const __CFString *v499;
  void *v500;
  id v501;
  uint64_t v502;
  uint64_t v503;
  const __CFString *v504;
  const __CFString *v505;
  uint64_t v506;
  void *v507;
  GEOPDCategoryLookupResult *v508;
  id v509;
  uint64_t v510;
  void *v511;
  GEOPDCategoryLookupParameters *v512;
  void *v513;
  id v514;
  void *v515;
  GEOPDCategoryInformation *v516;
  GEOPDCategoryInformation *v517;
  GEOPDCategoryInformation *v518;
  GEOPDCategoryInformation *v519;
  uint64_t v520;
  const __CFString *v521;
  void *v522;
  GEOPDBatchMerchantLookupBrandResult *v523;
  GEOPDBatchMerchantLookupBrandResult *v524;
  id v525;
  const __CFString *v526;
  void *v527;
  id v528;
  int v529;
  const __CFString *v530;
  void *v531;
  const __CFString *v532;
  uint64_t mm;
  void *v534;
  GEOPDMerchantLookupBrandResult *v535;
  id v536;
  void *v537;
  id v538;
  int v539;
  void *v540;
  id v541;
  uint64_t v542;
  uint64_t v543;
  uint64_t nn;
  uint64_t v545;
  GEOPDMerchantBrandLookupResponse *v546;
  GEOPDMerchantBrandLookupResponse *v547;
  GEOPDMerchantBrandLookupResponse *v548;
  const __CFString *v549;
  void *v550;
  GEOPDChildPlaceLookupByCategoryResult *v551;
  id v552;
  const __CFString *v553;
  void *v554;
  GEOPDMapsSearchHomeResult *v555;
  GEOPDMapsSearchHomeResult *v556;
  id v557;
  const __CFString *v558;
  void *v559;
  const __CFString *v560;
  const __CFString *v561;
  const __CFString *v562;
  const __CFString *v563;
  const __CFString *v564;
  const __CFString *v565;
  const __CFString *v566;
  const __CFString *v567;
  const __CFString *v568;
  uint64_t v569;
  void *v570;
  GEOPDMapsSearchHomeSection *v571;
  uint64_t v572;
  void *v573;
  id v574;
  int v575;
  void *v576;
  void *v577;
  id v578;
  void *v579;
  GEOPDSearchBrowseCategorySuggestionResult *v580;
  void *v581;
  id v582;
  void *v583;
  GEOPDCollectionSuggestionResult *v584;
  void *v585;
  id v586;
  void *v587;
  GEOPDPublisherSuggestionResult *v588;
  void *v589;
  id v590;
  void *v591;
  GEOPDPlaceSuggestionResult *v592;
  GEOPDPlaceSuggestionResult *v593;
  id v594;
  uint64_t v595;
  uint64_t v596;
  uint64_t i1;
  uint64_t v598;
  GEOPDMapsIdentifier *v599;
  GEOPDMapsIdentifier *v600;
  GEOPDMapsIdentifier *v601;
  GEOPDPlaceSuggestionResult *v602;
  void *v603;
  GEOPDGuidesLocationsSuggestionResult *v604;
  uint64_t v605;
  id v606;
  uint64_t v607;
  uint64_t v608;
  uint64_t v609;
  void *v610;
  GEOPDGuidesLocationEntry *v611;
  void *v612;
  uint64_t v613;
  void *v614;
  GEOPDGuidesLocationEntry *v615;
  void *v616;
  id v617;
  void *v618;
  void *v619;
  id v620;
  id v621;
  uint64_t v622;
  const __CFString *v623;
  void *v624;
  GEOPDCollectionSuggestionResult *v625;
  void *v626;
  const __CFString *v627;
  void *v628;
  GEOPDPublisherViewResult *v629;
  id v630;
  const __CFString *v631;
  void *v632;
  id v633;
  uint64_t v634;
  uint64_t v635;
  uint64_t v636;
  void *v637;
  GEOPDPublisherViewResultFilter *v638;
  void *v639;
  uint64_t v640;
  const __CFString *v641;
  void *v642;
  id v643;
  uint64_t v644;
  uint64_t v645;
  uint64_t i2;
  uint64_t v647;
  GEOPDMapsIdentifier *v648;
  GEOPDMapsIdentifier *v649;
  GEOPDMapsIdentifier *v650;
  const __CFString *v651;
  void *v652;
  GEOPDAllCollectionsViewResult *v653;
  id v654;
  const __CFString *v655;
  void *v656;
  GEOPDPublisherSuggestionResult *v657;
  void *v658;
  const __CFString *v659;
  void *v660;
  id v661;
  uint64_t v662;
  uint64_t v663;
  uint64_t v664;
  void *v665;
  GEOPDAllCollectionsViewResultFilter *v666;
  void *v667;
  uint64_t v668;
  const __CFString *v669;
  void *v670;
  id v671;
  uint64_t v672;
  uint64_t v673;
  uint64_t i3;
  uint64_t v675;
  GEOPDMapsIdentifier *v676;
  GEOPDMapsIdentifier *v677;
  GEOPDMapsIdentifier *v678;
  const __CFString *v679;
  void *v680;
  GEOPDAirportEntityPlaceLookupResult *v681;
  id v682;
  const __CFString *v683;
  void *v684;
  GEOPDTerritoryLookupResult *v685;
  id v686;
  const __CFString *v687;
  void *v688;
  GEOPDMapsHomeResult *v689;
  GEOPDMapsHomeResult *v690;
  id v691;
  const __CFString *v692;
  void *v693;
  id v694;
  uint64_t v695;
  const __CFString *v696;
  uint64_t v697;
  const __CFString *v698;
  const __CFString *v699;
  uint64_t v700;
  void *v701;
  GEOPDMapsHomeSection *v702;
  id v703;
  void *v704;
  id v705;
  int v706;
  void *v707;
  void *v708;
  id v709;
  void *v710;
  GEOPDCollectionSuggestionResult *v711;
  void *v712;
  id v713;
  void *v714;
  GEOPDGuidesLocationEntry *v715;
  void *v716;
  id v717;
  void *v718;
  void *v719;
  id v720;
  uint64_t v721;
  const __CFString *v722;
  void *v723;
  GEOPDAllGuidesLocationsViewResult *v724;
  GEOPDAllGuidesLocationsViewResult *v725;
  id v726;
  void *v727;
  void *v728;
  const __CFString *v729;
  void *v730;
  const __CFString *v731;
  const __CFString *v732;
  const __CFString *v733;
  const __CFString *v734;
  uint64_t v735;
  void *v736;
  GEOPDAllGuidesLocationsSection *v737;
  id v738;
  uint64_t v739;
  void *v740;
  GEOPDAllGuidesLocationsSectionHeader *v741;
  id v742;
  uint64_t v743;
  void *v744;
  id v745;
  int v746;
  void *v747;
  void *v748;
  id v749;
  void *v750;
  GEOPDMapsIdentifier *v751;
  GEOPDMapsIdentifier *v752;
  GEOPDMapsIdentifier *v753;
  GEOPDMapsIdentifier *v754;
  id v755;
  void *v756;
  id v757;
  uint64_t v758;
  uint64_t v759;
  uint64_t v760;
  void *v761;
  GEOPDGuidesLocationEntry *v762;
  void *v763;
  uint64_t v764;
  uint64_t v765;
  const __CFString *v766;
  void *v767;
  GEOPDGuidesHomeResult *v768;
  GEOPDGuidesHomeResult *v769;
  id v770;
  const __CFString *v771;
  void *v772;
  GEOPDGuidesHomeFixedSection *v773;
  void *v774;
  void *v775;
  GEOPDGuidesHomeFixedSection *v776;
  void *v777;
  const __CFString *v778;
  void *v779;
  GEOPDGuidesHomeFixedSection *v780;
  void *v781;
  const __CFString *v782;
  void *v783;
  const __CFString *v784;
  const __CFString *v785;
  const __CFString *v786;
  const __CFString *v787;
  const __CFString *v788;
  uint64_t v789;
  void *v790;
  GEOPDGuidesHomeRepeatableSection *v791;
  uint64_t v792;
  void *v793;
  id v794;
  int v795;
  void *v796;
  void *v797;
  id v798;
  void *v799;
  id v800;
  uint64_t v801;
  uint64_t v802;
  uint64_t i4;
  uint64_t v804;
  GEOPDMapsIdentifier *v805;
  GEOPDMapsIdentifier *v806;
  GEOPDMapsIdentifier *v807;
  void *v808;
  id v809;
  uint64_t v810;
  uint64_t v811;
  uint64_t i5;
  uint64_t v813;
  GEOPDMapsIdentifier *v814;
  GEOPDMapsIdentifier *v815;
  GEOPDMapsIdentifier *v816;
  void *v817;
  id v818;
  uint64_t v819;
  uint64_t v820;
  uint64_t v821;
  void *v822;
  GEOPDGuidesLocationEntry *v823;
  void *v824;
  uint64_t v825;
  void *v826;
  id v827;
  int v828;
  uint64_t v829;
  const __CFString *v830;
  void *v831;
  GEOPDExtendedGeoLookupResult *v832;
  id v833;
  const __CFString *v834;
  void *v835;
  char v836;
  const __CFString *v837;
  void *v838;
  void *v839;
  void *v840;
  id v841;
  int v842;
  const __CFString *v843;
  void *v844;
  GEOPDQueryUnderstandingResult *v845;
  GEOPDQueryUnderstandingResult *v846;
  id v847;
  const __CFString *v848;
  void *v849;
  id v850;
  uint64_t v851;
  uint64_t v852;
  uint64_t v853;
  void *v854;
  GEOPDSearchQueryIntent *v855;
  void *v856;
  uint64_t v857;
  const __CFString *v858;
  GEOPDQueryUnderstandingTaxonomyResult *v859;
  const __CFString *v860;
  const __CFString *v861;
  const __CFString *v862;
  const __CFString *v863;
  const __CFString *v864;
  const __CFString *v865;
  const __CFString *v866;
  const __CFString *v867;
  const __CFString *v868;
  const __CFString *v869;
  const __CFString *v870;
  const __CFString *v871;
  const __CFString *v872;
  const __CFString *v873;
  const __CFString *v874;
  const __CFString *v875;
  const __CFString *v876;
  const __CFString *v877;
  const __CFString *v878;
  uint64_t v879;
  uint64_t v880;
  void *v881;
  GEOPDQueryUnderstandingTaxonomyResultItem *v882;
  void *v883;
  id v884;
  int v885;
  void *v886;
  GEOPDQueryUnderstandingTaxonomyResultItemCategory *v887;
  id v888;
  GEOPDQueryUnderstandingTaxonomyResultItemCategory *v889;
  GEOPDQueryUnderstandingTaxonomyResultItemBrand *v890;
  char *v891;
  char *v892;
  void *v893;
  GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand *v894;
  uint64_t v895;
  void *v896;
  uint64_t v897;
  void *v898;
  void *v899;
  id v900;
  void *v901;
  void *v902;
  id v903;
  void *v904;
  GEOLocalizedString *v905;
  GEOLocalizedString *v906;
  GEOLocalizedString *v907;
  GEOLocalizedString *v908;
  void *v909;
  id v910;
  uint64_t v911;
  uint64_t v912;
  uint64_t i6;
  void *v914;
  void *v915;
  void *v916;
  void *v917;
  id v918;
  void *v919;
  char v920;
  void *v921;
  uint64_t v922;
  void *v923;
  void *v924;
  id v925;
  void *v926;
  GEOPDMultiLocalizedString *v927;
  void *v928;
  id v929;
  void *v930;
  id v931;
  uint64_t v932;
  uint64_t v933;
  uint64_t v934;
  void *v935;
  GEOPDIconMapping *v936;
  void *v937;
  uint64_t v938;
  void *v939;
  id v940;
  uint64_t v941;
  uint64_t v942;
  uint64_t i7;
  void *v944;
  void *v945;
  void *v946;
  void *v947;
  id v948;
  void *v949;
  id v950;
  uint64_t v951;
  uint64_t v952;
  uint64_t v953;
  void *v954;
  GEOPDIconMapping *v955;
  void *v956;
  uint64_t v957;
  void *v958;
  GEOPDMultiLocalizedString *v959;
  void *v960;
  id v961;
  void *v962;
  id v963;
  uint64_t v964;
  uint64_t v965;
  uint64_t i8;
  void *v967;
  void *v968;
  void *v969;
  GEOPDBusinessConnectAttributes *v970;
  id v971;
  void *v972;
  void *v973;
  id v974;
  void *v975;
  void *v976;
  id v977;
  GEOPDBusinessConnectAttributes *v978;
  uint64_t v979;
  GEOPDQueryUnderstandingTaxonomyResultItemBrand *v980;
  uint64_t v981;
  const __CFString *v982;
  void *v983;
  GEOPDPoiAtAddressLookupResult *v984;
  id v985;
  const __CFString *v986;
  void *v987;
  GEOPDPlacecardEnrichmentResult *v988;
  id v989;
  const __CFString *v990;
  void *v991;
  GEOPDOfflineRegionNameResult *v992;
  id v993;
  void *v994;
  GEOLocalizedString *v995;
  GEOLocalizedString *v996;
  GEOLocalizedString *v997;
  const __CFString *v998;
  void *v999;
  GEOPDSearchCapabilitiesResult *v1000;
  id v1001;
  const __CFString *v1002;
  void *v1003;
  GEOPDOfflineSearchCapabilities *v1004;
  id v1005;
  const __CFString *v1006;
  void *v1007;
  char v1008;
  const __CFString *v1009;
  void *v1010;
  GEOPDAddressRecommendationResult *v1011;
  id v1012;
  const __CFString *v1014;
  void *v1015;
  id v1016;
  void *v1017;
  id v1018;
  id v1019;
  void *v1020;
  void *v1021;
  GEOPDQueryUnderstandingTaxonomyResult *v1022;
  const __CFString *v1023;
  const __CFString *v1024;
  uint64_t v1025;
  void *v1026;
  uint64_t v1027;
  id v1028;
  uint64_t v1029;
  void *v1030;
  uint64_t v1031;
  const __CFString *v1032;
  const __CFString *v1033;
  const __CFString *v1034;
  id v1035;
  const __CFString *v1036;
  void *v1037;
  const __CFString *v1038;
  void *v1039;
  const __CFString *v1040;
  const __CFString *v1041;
  const __CFString *v1042;
  const __CFString *v1043;
  const __CFString *v1044;
  const __CFString *v1045;
  const __CFString *v1046;
  id v1047;
  const __CFString *v1048;
  void *v1049;
  const __CFString *v1050;
  void *v1051;
  const __CFString *v1052;
  const __CFString *v1053;
  void *v1054;
  void *v1055;
  id v1056;
  const __CFString *v1057;
  void *v1058;
  void *v1059;
  const __CFString *v1060;
  void *v1061;
  const __CFString *v1062;
  void *v1063;
  const __CFString *v1064;
  void *v1065;
  const __CFString *v1066;
  const __CFString *v1067;
  void *v1068;
  const __CFString *v1069;
  void *v1070;
  void *v1071;
  void *v1072;
  void *v1073;
  const __CFString *v1074;
  void *v1075;
  const __CFString *v1076;
  const __CFString *v1077;
  void *v1078;
  const __CFString *v1079;
  GEOPDBatchPopularNearbySearchResult *v1080;
  const __CFString *v1081;
  void *v1082;
  id v1083;
  const __CFString *v1084;
  const __CFString *v1085;
  const __CFString *v1086;
  const __CFString *v1087;
  const __CFString *v1088;
  id v1089;
  GEOPDSearchZeroKeywordWithSearchResultsSuggestionResult *v1090;
  id v1091;
  id v1092;
  id v1093;
  id v1094;
  id v1095;
  const __CFString *v1096;
  const __CFString *v1097;
  id v1098;
  id v1099;
  const __CFString *v1100;
  id v1101;
  id v1102;
  const __CFString *v1103;
  const __CFString *v1104;
  id v1105;
  const __CFString *v1106;
  GEOPDMapsSearchHomeResult *v1107;
  id v1108;
  const __CFString *v1109;
  const __CFString *v1110;
  GEOPDQueryUnderstandingTaxonomyResultItemBrand *v1111;
  id obj;
  id obja;
  id objb;
  id objc;
  id objd;
  id obje;
  const __CFString *objf;
  id objg;
  const __CFString *objh;
  const __CFString *obji;
  GEOPDGuidesHomeResult *objj;
  id objk;
  id v1124;
  id v1125;
  id v1126;
  const __CFString *v1127;
  id v1128;
  GEOPDBatchMerchantLookupBrandResult *v1129;
  id v1130;
  id v1131;
  const __CFString *v1132;
  GEOPDAllGuidesLocationsViewResult *v1133;
  id v1134;
  char *v1135;
  id v1136;
  id v1137;
  id v1138;
  GEOPDBatchSpatialLookupResult *v1139;
  const __CFString *v1140;
  id v1141;
  id v1142;
  const __CFString *v1143;
  id v1144;
  id v1145;
  char *v1146;
  GEOPDSearchZeroKeywordCategorySuggestionResult *v1147;
  uint64_t v1148;
  id v1149;
  uint64_t v1150;
  uint64_t v1151;
  const __CFString *v1152;
  uint64_t v1153;
  uint64_t v1154;
  const __CFString *v1155;
  uint64_t v1156;
  uint64_t v1157;
  GEOPDQueryUnderstandingResult *v1158;
  id v1159;
  const __CFString *v1160;
  uint64_t v1161;
  uint64_t v1162;
  uint64_t v1163;
  GEOPDBatchCategoryLookupResult *v1164;
  uint64_t v1165;
  id v1166;
  GEOPDMapsHomeResult *v1167;
  uint64_t v1168;
  id v1169;
  id v1170;
  __int128 v1172;
  __int128 v1173;
  __int128 v1174;
  __int128 v1175;
  __int128 v1176;
  __int128 v1177;
  __int128 v1178;
  __int128 v1179;
  __int128 v1180;
  __int128 v1181;
  __int128 v1182;
  __int128 v1183;
  __int128 v1184;
  __int128 v1185;
  __int128 v1186;
  __int128 v1187;
  __int128 v1188;
  __int128 v1189;
  __int128 v1190;
  __int128 v1191;
  __int128 v1192;
  __int128 v1193;
  __int128 v1194;
  __int128 v1195;
  __int128 v1196;
  __int128 v1197;
  __int128 v1198;
  __int128 v1199;
  __int128 v1200;
  __int128 v1201;
  __int128 v1202;
  __int128 v1203;
  __int128 v1204;
  __int128 v1205;
  __int128 v1206;
  __int128 v1207;
  __int128 v1208;
  __int128 v1209;
  __int128 v1210;
  __int128 v1211;
  __int128 v1212;
  __int128 v1213;
  __int128 v1214;
  __int128 v1215;
  __int128 v1216;
  __int128 v1217;
  __int128 v1218;
  __int128 v1219;
  __int128 v1220;
  __int128 v1221;
  __int128 v1222;
  __int128 v1223;
  __int128 v1224;
  __int128 v1225;
  __int128 v1226;
  __int128 v1227;
  __int128 v1228;
  __int128 v1229;
  __int128 v1230;
  __int128 v1231;
  _BYTE v1232[128];
  uint64_t v1233;

  v1233 = *MEMORY[0x1E0C80C00];
  v1099 = a2;
  v4 = (id)objc_msgSend(a1, "init");

  v1078 = v4;
  if (!v4)
    goto LABEL_1981;
  if (a3)
    v5 = CFSTR("searchResult");
  else
    v5 = CFSTR("search_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = [GEOPDSearchResult alloc];
    if (v7)
      v8 = -[GEOPDSearchResult _initWithDictionary:isJSON:](v7, v6, a3);
    else
      v8 = 0;
    -[GEOPDPlaceGlobalResult setSearchResult:]((uint64_t)v1078, v8);

  }
  if (a3)
    v9 = CFSTR("geocodingResult");
  else
    v9 = CFSTR("geocoding_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = [GEOPDGeocodingResult alloc];
    if (v11)
    {
      v12 = v10;
      v11 = -[GEOPDGeocodingResult init](v11, "init");
      if (v11)
      {
        if (a3)
          v13 = CFSTR("disambiguationLabel");
        else
          v13 = CFSTR("disambiguation_label");
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1231 = 0u;
          v1230 = 0u;
          v1229 = 0u;
          v1228 = 0u;
          v15 = v14;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v1228, v1232, 16);
          if (v16)
          {
            v17 = *(_QWORD *)v1229;
            do
            {
              v18 = 0;
              do
              {
                if (*(_QWORD *)v1229 != v17)
                  objc_enumerationMutation(v15);
                v19 = *(void **)(*((_QWORD *)&v1228 + 1) + 8 * v18);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v20 = [GEOPDMultiLocalizedString alloc];
                  if (v20)
                    v21 = (void *)-[GEOPDMultiLocalizedString _initWithDictionary:isJSON:](v20, v19, a3);
                  else
                    v21 = 0;
                  -[GEOPDGeocodingResult addDisambiguationLabel:]((uint64_t)v11, v21);

                }
                ++v18;
              }
              while (v16 != v18);
              v22 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v1228, v1232, 16);
              v16 = v22;
            }
            while (v22);
          }

        }
      }

    }
    -[GEOPDPlaceGlobalResult setGeocodingResult:]((uint64_t)v1078, v11);

  }
  if (a3)
    v23 = CFSTR("canonicalSearchResult");
  else
    v23 = CFSTR("canonical_search_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = [GEOPDCanonicalLocationSearchResult alloc];
    v26 = v24;
    if (v25)
      v25 = -[GEOPDCanonicalLocationSearchResult init](v25, "init");

    -[GEOPDPlaceGlobalResult setCanonicalSearchResult:]((uint64_t)v1078, v25);
  }

  if (a3)
    v27 = CFSTR("reverseGeocodingResult");
  else
    v27 = CFSTR("reverse_geocoding_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = [GEOPDReverseGeocodingResult alloc];
    v30 = v28;
    if (v29)
      v29 = -[GEOPDReverseGeocodingResult init](v29, "init");

    -[GEOPDPlaceGlobalResult setReverseGeocodingResult:]((uint64_t)v1078, v29);
  }

  if (a3)
    v31 = CFSTR("placeLookupResult");
  else
    v31 = CFSTR("place_lookup_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = [GEOPDPlaceLookupResult alloc];
    v34 = v32;
    if (v33)
      v33 = -[GEOPDPlaceLookupResult init](v33, "init");

    -[GEOPDPlaceGlobalResult setPlaceLookupResult:]((uint64_t)v1078, v33);
  }

  if (a3)
    v35 = CFSTR("merchantLookupResult");
  else
    v35 = CFSTR("merchant_lookup_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = [GEOPDMerchantLookupResult alloc];
    if ((a3 & 1) != 0)
      v38 = -[GEOPDMerchantLookupResult initWithJSON:](v37, "initWithJSON:", v36);
    else
      v38 = -[GEOPDMerchantLookupResult initWithDictionary:](v37, "initWithDictionary:", v36);
    v39 = v38;
    -[GEOPDPlaceGlobalResult setMerchantLookupResult:]((uint64_t)v1078, v38);

  }
  if (a3)
    v40 = CFSTR("placeRefinementResult");
  else
    v40 = CFSTR("place_refinement_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = [GEOPDPlaceRefinementResult alloc];
    v43 = v41;
    if (v42)
      v42 = -[GEOPDPlaceRefinementResult init](v42, "init");

    -[GEOPDPlaceGlobalResult setPlaceRefinementResult:]((uint64_t)v1078, v42);
  }

  if (a3)
    v44 = CFSTR("siriSearchResult");
  else
    v44 = CFSTR("siri_search_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v46 = [GEOPDSiriSearchResult alloc];
    if (v46)
    {
      v47 = v45;
      v46 = -[GEOPDSiriSearchResult init](v46, "init");
      if (v46)
      {
        if (a3)
          v48 = CFSTR("disambiguationLabel");
        else
          v48 = CFSTR("disambiguation_label");
        objc_msgSend(v47, "objectForKeyedSubscript:", v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1227 = 0u;
          v1226 = 0u;
          v1225 = 0u;
          v1224 = 0u;
          v50 = v49;
          v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v1224, v1232, 16);
          if (v51)
          {
            v52 = *(_QWORD *)v1225;
            do
            {
              v53 = 0;
              do
              {
                if (*(_QWORD *)v1225 != v52)
                  objc_enumerationMutation(v50);
                v54 = *(void **)(*((_QWORD *)&v1224 + 1) + 8 * v53);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v55 = [GEOPDMultiLocalizedString alloc];
                  if (v55)
                    v56 = (void *)-[GEOPDMultiLocalizedString _initWithDictionary:isJSON:](v55, v54, a3);
                  else
                    v56 = 0;
                  -[GEOPDSiriSearchResult addDisambiguationLabel:]((uint64_t)v46, v56);

                }
                ++v53;
              }
              while (v51 != v53);
              v57 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v1224, v1232, 16);
              v51 = v57;
            }
            while (v57);
          }

        }
        if (a3)
          v58 = CFSTR("resultDetourInfo");
        else
          v58 = CFSTR("result_detour_info");
        objc_msgSend(v47, "objectForKeyedSubscript:", v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1223 = 0u;
          v1222 = 0u;
          v1221 = 0u;
          v1220 = 0u;
          v60 = v59;
          v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v1220, &v1228, 16);
          if (v61)
          {
            v62 = *(_QWORD *)v1221;
            do
            {
              for (i = 0; i != v61; ++i)
              {
                if (*(_QWORD *)v1221 != v62)
                  objc_enumerationMutation(v60);
                v64 = *(_QWORD *)(*((_QWORD *)&v1220 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v65 = [GEOPDResultDetourInfo alloc];
                  if ((a3 & 1) != 0)
                    v66 = -[GEOPDResultDetourInfo initWithJSON:](v65, "initWithJSON:", v64);
                  else
                    v66 = -[GEOPDResultDetourInfo initWithDictionary:](v65, "initWithDictionary:", v64);
                  v67 = v66;
                  -[GEOPDSiriSearchResult addResultDetourInfo:]((uint64_t)v46, v66);

                }
              }
              v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v1220, &v1228, 16);
            }
            while (v61);
          }

        }
        if (a3)
          v68 = CFSTR("isChainResultSet");
        else
          v68 = CFSTR("is_chain_result_set");
        objc_msgSend(v47, "objectForKeyedSubscript:", v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v70 = objc_msgSend(v69, "BOOLValue");
          *(_BYTE *)&v46->_flags |= 0x10u;
          *(_BYTE *)&v46->_flags |= 1u;
          v46->_isChainResultSet = v70;
        }

      }
    }
    -[GEOPDPlaceGlobalResult setSiriSearchResult:]((uint64_t)v1078, v46);

  }
  if (a3)
    v71 = CFSTR("locationDirectedSearchResult");
  else
    v71 = CFSTR("location_directed_search_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v73 = [GEOPDLocationDirectedSearchResult alloc];
    if (v73)
    {
      v74 = v72;
      v73 = -[GEOPDLocationDirectedSearchResult init](v73, "init");
      if (v73)
      {
        if (a3)
          v75 = CFSTR("displayMapRegion");
        else
          v75 = CFSTR("display_map_region");
        objc_msgSend(v74, "objectForKeyedSubscript:", v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v77 = [GEOMapRegion alloc];
          if ((a3 & 1) != 0)
            v78 = -[GEOMapRegion initWithJSON:](v77, "initWithJSON:", v76);
          else
            v78 = -[GEOMapRegion initWithDictionary:](v77, "initWithDictionary:", v76);
          v79 = v78;
          -[GEOPDLocationDirectedSearchResult setDisplayMapRegion:]((uint64_t)v73, v78);

        }
        if (a3)
          v80 = CFSTR("disambiguationLabel");
        else
          v80 = CFSTR("disambiguation_label");
        objc_msgSend(v74, "objectForKeyedSubscript:", v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1231 = 0u;
          v1230 = 0u;
          v1229 = 0u;
          v1228 = 0u;
          v82 = v81;
          v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v1228, v1232, 16);
          if (v83)
          {
            v84 = *(_QWORD *)v1229;
            do
            {
              v85 = 0;
              do
              {
                if (*(_QWORD *)v1229 != v84)
                  objc_enumerationMutation(v82);
                v86 = *(void **)(*((_QWORD *)&v1228 + 1) + 8 * v85);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v87 = [GEOPDMultiLocalizedString alloc];
                  if (v87)
                    v88 = (void *)-[GEOPDMultiLocalizedString _initWithDictionary:isJSON:](v87, v86, a3);
                  else
                    v88 = 0;
                  -[GEOPDLocationDirectedSearchResult addDisambiguationLabel:]((uint64_t)v73, v88);

                }
                ++v85;
              }
              while (v83 != v85);
              v89 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v1228, v1232, 16);
              v83 = v89;
            }
            while (v89);
          }

        }
        if (a3)
          v90 = CFSTR("paginationInfo");
        else
          v90 = CFSTR("pagination_info");
        objc_msgSend(v74, "objectForKeyedSubscript:", v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v92 = [GEOPDPaginationInfo alloc];
          if (v92)
            v93 = (void *)-[GEOPDPaginationInfo _initWithDictionary:isJSON:](v92, v91, a3);
          else
            v93 = 0;
          -[GEOPDLocationDirectedSearchResult setPaginationInfo:]((uint64_t)v73, v93);

        }
      }

    }
    -[GEOPDPlaceGlobalResult setLocationDirectedSearchResult:]((uint64_t)v1078, v73);

  }
  if (a3)
    v94 = CFSTR("autocompleteResult");
  else
    v94 = CFSTR("autocomplete_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v96 = [GEOPDAutocompleteResult alloc];
    if (v96)
      v97 = (void *)-[GEOPDAutocompleteResult _initWithDictionary:isJSON:](v96, v95, a3);
    else
      v97 = 0;
    -[GEOPDPlaceGlobalResult setAutocompleteResult:]((uint64_t)v1078, v97);

  }
  if (a3)
    v98 = CFSTR("browseCategorySuggestionResult");
  else
    v98 = CFSTR("browse_category_suggestion_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v100 = [GEOPDSearchBrowseCategorySuggestionResult alloc];
    if (v100)
      v101 = (void *)-[GEOPDSearchBrowseCategorySuggestionResult _initWithDictionary:isJSON:](v100, v99, a3);
    else
      v101 = 0;
    -[GEOPDPlaceGlobalResult setBrowseCategorySuggestionResult:]((uint64_t)v1078, v101);

  }
  if (a3)
    v102 = CFSTR("categorySearchResult");
  else
    v102 = CFSTR("category_search_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v104 = [GEOPDCategorySearchResult alloc];
    if (!v104)
    {
      v107 = 0;
      goto LABEL_404;
    }
    v105 = v104;
    v106 = v103;
    v107 = -[GEOPDCategorySearchResult init](v105, "init");

    if (!v107)
    {
LABEL_403:

LABEL_404:
      -[GEOPDPlaceGlobalResult setCategorySearchResult:]((uint64_t)v1078, v107);

      goto LABEL_405;
    }
    if (a3)
      v108 = CFSTR("displayMapRegion");
    else
      v108 = CFSTR("display_map_region");
    objc_msgSend(v106, "objectForKeyedSubscript:", v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v110 = [GEOMapRegion alloc];
      if ((a3 & 1) != 0)
        v111 = -[GEOMapRegion initWithJSON:](v110, "initWithJSON:", v109);
      else
        v111 = -[GEOMapRegion initWithDictionary:](v110, "initWithDictionary:", v109);
      v112 = v111;
      -[GEOPDCategorySearchResult setDisplayMapRegion:]((uint64_t)v107, v111);

    }
    if (a3)
      v113 = CFSTR("isChainResultSet");
    else
      v113 = CFSTR("is_chain_result_set");
    objc_msgSend(v106, "objectForKeyedSubscript:", v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v115 = objc_msgSend(v114, "BOOLValue");
      v107[46]._os_unfair_lock_opaque |= 0x1000000u;
      v107[46]._os_unfair_lock_opaque |= 0x20u;
      HIBYTE(v107[45]._os_unfair_lock_opaque) = v115;
    }

    if (a3)
      v116 = CFSTR("relatedSearchSuggestion");
    else
      v116 = CFSTR("related_search_suggestion");
    objc_msgSend(v106, "objectForKeyedSubscript:", v116);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v1215 = 0u;
      v1214 = 0u;
      v1213 = 0u;
      v1212 = 0u;
      v118 = v117;
      v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v1212, v1232, 16);
      if (v119)
      {
        v120 = *(_QWORD *)v1213;
        do
        {
          v121 = 0;
          do
          {
            if (*(_QWORD *)v1213 != v120)
              objc_enumerationMutation(v118);
            v122 = *(void **)(*((_QWORD *)&v1212 + 1) + 8 * v121);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v123 = [GEOPDRelatedSearchSuggestion alloc];
              if (v123)
                v124 = -[GEOPDRelatedSearchSuggestion _initWithDictionary:isJSON:](v123, v122, a3);
              else
                v124 = 0;
              -[GEOPDCategorySearchResult addRelatedSearchSuggestion:](v107, v124);

            }
            ++v121;
          }
          while (v119 != v121);
          v125 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v1212, v1232, 16);
          v119 = v125;
        }
        while (v125);
      }

    }
    if (a3)
      v126 = CFSTR("resultDetourInfo");
    else
      v126 = CFSTR("result_detour_info");
    objc_msgSend(v106, "objectForKeyedSubscript:", v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v1211 = 0u;
      v1209 = 0u;
      v1210 = 0u;
      v1208 = 0u;
      v128 = v127;
      v129 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v1208, &v1228, 16);
      if (v129)
      {
        v130 = *(_QWORD *)v1209;
        do
        {
          for (j = 0; j != v129; ++j)
          {
            if (*(_QWORD *)v1209 != v130)
              objc_enumerationMutation(v128);
            v132 = *(_QWORD *)(*((_QWORD *)&v1208 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v133 = [GEOPDResultDetourInfo alloc];
              if ((a3 & 1) != 0)
                v134 = -[GEOPDResultDetourInfo initWithJSON:](v133, "initWithJSON:", v132);
              else
                v134 = -[GEOPDResultDetourInfo initWithDictionary:](v133, "initWithDictionary:", v132);
              v135 = v134;
              -[GEOPDCategorySearchResult addResultDetourInfo:](v107, v134);

            }
          }
          v129 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v1208, &v1228, 16);
        }
        while (v129);
      }

    }
    if (a3)
      v136 = CFSTR("defaultRelatedSearchSuggestion");
    else
      v136 = CFSTR("default_related_search_suggestion");
    objc_msgSend(v106, "objectForKeyedSubscript:", v136);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v138 = [GEOPDRelatedSearchSuggestion alloc];
      if (v138)
        v139 = -[GEOPDRelatedSearchSuggestion _initWithDictionary:isJSON:](v138, v137, a3);
      else
        v139 = 0;
      -[GEOPDCategorySearchResult setDefaultRelatedSearchSuggestion:]((uint64_t)v107, v139);

    }
    if (a3)
      v140 = CFSTR("searchClientBehavior");
    else
      v140 = CFSTR("search_client_behavior");
    objc_msgSend(v106, "objectForKeyedSubscript:", v140);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v142 = [GEOPDSearchClientBehavior alloc];
      if (v142)
        v143 = -[GEOPDSearchClientBehavior _initWithDictionary:isJSON:](v142, v141, a3);
      else
        v143 = 0;
      -[GEOPDCategorySearchResult setSearchClientBehavior:]((uint64_t)v107, v143);

    }
    if (a3)
      v144 = CFSTR("enablePartialClientization");
    else
      v144 = CFSTR("enable_partial_clientization");
    objc_msgSend(v106, "objectForKeyedSubscript:", v144);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v146 = objc_msgSend(v145, "BOOLValue");
      v107[46]._os_unfair_lock_opaque |= 0x1000000u;
      v107[46]._os_unfair_lock_opaque |= 8u;
      BYTE1(v107[45]._os_unfair_lock_opaque) = v146;
    }

    if (a3)
      v147 = CFSTR("browseCategory");
    else
      v147 = CFSTR("browse_category");
    objc_msgSend(v106, "objectForKeyedSubscript:", v147);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v1206 = 0u;
      v1207 = 0u;
      v1204 = 0u;
      v1205 = 0u;
      v149 = v148;
      v150 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v1204, &v1224, 16);
      if (v150)
      {
        v151 = *(_QWORD *)v1205;
        do
        {
          v152 = 0;
          do
          {
            if (*(_QWORD *)v1205 != v151)
              objc_enumerationMutation(v149);
            v153 = *(void **)(*((_QWORD *)&v1204 + 1) + 8 * v152);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v154 = [GEOPDBrowseCategory alloc];
              if (v154)
                v155 = (void *)-[GEOPDBrowseCategory _initWithDictionary:isJSON:]((uint64_t)v154, v153, a3);
              else
                v155 = 0;
              -[GEOPDCategorySearchResult addBrowseCategory:](v107, v155);

            }
            ++v152;
          }
          while (v150 != v152);
          v156 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v1204, &v1224, 16);
          v150 = v156;
        }
        while (v156);
      }

    }
    if (a3)
      v157 = CFSTR("categorySearchResultSection");
    else
      v157 = CFSTR("category_search_result_section");
    objc_msgSend(v106, "objectForKeyedSubscript:", v157);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v159 = [GEOPDSCategorySearchResultSection alloc];
      if (v159)
        v160 = (void *)-[GEOPDSCategorySearchResultSection _initWithDictionary:isJSON:]((uint64_t)v159, v158, a3);
      else
        v160 = 0;
      -[GEOPDCategorySearchResult setCategorySearchResultSection:]((uint64_t)v107, v160);

    }
    if (a3)
      v161 = CFSTR("relatedEntitySection");
    else
      v161 = CFSTR("related_entity_section");
    objc_msgSend(v106, "objectForKeyedSubscript:", v161);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v1202 = 0u;
      v1203 = 0u;
      v1200 = 0u;
      v1201 = 0u;
      v163 = v162;
      v164 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v1200, &v1220, 16);
      if (v164)
      {
        v165 = *(_QWORD *)v1201;
        do
        {
          v166 = 0;
          do
          {
            if (*(_QWORD *)v1201 != v165)
              objc_enumerationMutation(v163);
            v167 = *(void **)(*((_QWORD *)&v1200 + 1) + 8 * v166);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v168 = [GEOPDRelatedEntitySection alloc];
              if (v168)
                v169 = (void *)-[GEOPDRelatedEntitySection _initWithDictionary:isJSON:]((uint64_t)v168, v167, a3);
              else
                v169 = 0;
              -[GEOPDCategorySearchResult addRelatedEntitySection:](v107, v169);

            }
            ++v166;
          }
          while (v164 != v166);
          v170 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v1200, &v1220, 16);
          v164 = v170;
        }
        while (v170);
      }

    }
    if (a3)
      v171 = CFSTR("searchTierMetadata");
    else
      v171 = CFSTR("search_tier_metadata");
    objc_msgSend(v106, "objectForKeyedSubscript:", v171);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v1198 = 0u;
      v1199 = 0u;
      v1196 = 0u;
      v1197 = 0u;
      v173 = v172;
      v174 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v1196, &v1216, 16);
      if (v174)
      {
        v175 = *(_QWORD *)v1197;
        do
        {
          v176 = 0;
          do
          {
            if (*(_QWORD *)v1197 != v175)
              objc_enumerationMutation(v173);
            v177 = *(void **)(*((_QWORD *)&v1196 + 1) + 8 * v176);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v178 = [GEOPDSSearchTierMetadata alloc];
              if (v178)
                v179 = (void *)-[GEOPDSSearchTierMetadata _initWithDictionary:isJSON:]((uint64_t)v178, v177, a3);
              else
                v179 = 0;
              -[GEOPDCategorySearchResult addSearchTierMetadata:]((uint64_t)v107, v179);

            }
            ++v176;
          }
          while (v174 != v176);
          v180 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v1196, &v1216, 16);
          v174 = v180;
        }
        while (v180);
      }

    }
    if (a3)
      v181 = CFSTR("resultRefinementGroup");
    else
      v181 = CFSTR("result_refinement_group");
    objc_msgSend(v106, "objectForKeyedSubscript:", v181);
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v183 = [GEOPDResultRefinementGroup alloc];
      if (v183)
        v184 = -[GEOPDResultRefinementGroup _initWithDictionary:isJSON:](v183, v182, a3);
      else
        v184 = 0;
      -[GEOPDCategorySearchResult setResultRefinementGroup:]((uint64_t)v107, v184);

    }
    if (a3)
      v185 = CFSTR("autoRedoSearchThreshold");
    else
      v185 = CFSTR("auto_redo_search_threshold");
    objc_msgSend(v106, "objectForKeyedSubscript:", v185);
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v187 = [GEOPDSSearchAutoRedoThreshold alloc];
      if (v187)
        v188 = (void *)-[GEOPDSSearchAutoRedoThreshold _initWithDictionary:isJSON:]((uint64_t)v187, v186, a3);
      else
        v188 = 0;
      -[GEOPDCategorySearchResult setAutoRedoSearchThreshold:]((uint64_t)v107, v188);

    }
    if (a3)
      v189 = CFSTR("placeSummaryLayoutMetadata");
    else
      v189 = CFSTR("place_summary_layout_metadata");
    objc_msgSend(v106, "objectForKeyedSubscript:", v189);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v191 = [GEOPDPlaceSummaryLayoutMetadata alloc];
      if ((a3 & 1) != 0)
        v192 = -[GEOPDPlaceSummaryLayoutMetadata initWithJSON:](v191, "initWithJSON:", v190);
      else
        v192 = -[GEOPDPlaceSummaryLayoutMetadata initWithDictionary:](v191, "initWithDictionary:", v190);
      v193 = v192;
      -[GEOPDCategorySearchResult setPlaceSummaryLayoutMetadata:]((uint64_t)v107, v192);

    }
    if (a3)
      v194 = CFSTR("sectionList");
    else
      v194 = CFSTR("section_list");
    objc_msgSend(v106, "objectForKeyedSubscript:", v194);
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v196 = [GEOPDSearchSectionList alloc];
      if (v196)
        v197 = (void *)-[GEOPDSearchSectionList _initWithDictionary:isJSON:](v196, v195, a3);
      else
        v197 = 0;
      -[GEOPDCategorySearchResult setSectionList:]((uint64_t)v107, v197);

    }
    if (a3)
      v198 = CFSTR("disableAddingAdditionalPaddingOnViewport");
    else
      v198 = CFSTR("disable_adding_additional_padding_on_viewport");
    objc_msgSend(v106, "objectForKeyedSubscript:", v198);
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v200 = objc_msgSend(v199, "BOOLValue");
      v107[46]._os_unfair_lock_opaque |= 0x1000000u;
      v107[46]._os_unfair_lock_opaque |= 4u;
      LOBYTE(v107[45]._os_unfair_lock_opaque) = v200;
    }

    if (a3)
      v201 = CFSTR("searchResultViewType");
    else
      v201 = CFSTR("search_result_view_type");
    objc_msgSend(v106, "objectForKeyedSubscript:", v201);
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v203 = v202;
      if ((objc_msgSend(v203, "isEqualToString:", CFSTR("SEARCH_RESULT_VIEW_TYPE_DEFAULT")) & 1) != 0)
      {
        v204 = 0;
      }
      else if ((objc_msgSend(v203, "isEqualToString:", CFSTR("SEARCH_RESULT_VIEW_TYPE_RESULT_LIST")) & 1) != 0)
      {
        v204 = 1;
      }
      else if (objc_msgSend(v203, "isEqualToString:", CFSTR("SEARCH_RESULT_VIEW_TYPE_PLACE_CARD")))
      {
        v204 = 2;
      }
      else
      {
        v204 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_360;
      v204 = objc_msgSend(v202, "intValue");
    }
    v107[46]._os_unfair_lock_opaque |= 0x1000000u;
    v107[46]._os_unfair_lock_opaque |= 2u;
    v107[44]._os_unfair_lock_opaque = v204;
LABEL_360:

    if (a3)
      v205 = CFSTR("enableStructuredRapAffordance");
    else
      v205 = CFSTR("enable_structured_rap_affordance");
    objc_msgSend(v106, "objectForKeyedSubscript:", v205);
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v207 = objc_msgSend(v206, "BOOLValue");
      v107[46]._os_unfair_lock_opaque |= 0x1000000u;
      v107[46]._os_unfair_lock_opaque |= 0x10u;
      BYTE2(v107[45]._os_unfair_lock_opaque) = v207;
    }

    if (a3)
      v208 = CFSTR("searchSessionData");
    else
      v208 = CFSTR("search_session_data");
    objc_msgSend(v106, "objectForKeyedSubscript:", v208);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v210 = -[GEOACResult _initWithDictionary:isJSON:]([GEOPDSSearchSessionData alloc], v209);
      -[GEOPDCategorySearchResult setSearchSessionData:]((uint64_t)v107, v210);

    }
    if (a3)
      v211 = CFSTR("mapDisplayType");
    else
      v211 = CFSTR("map_display_type");
    objc_msgSend(v106, "objectForKeyedSubscript:", v211);
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v213 = v212;
      if ((objc_msgSend(v213, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
        v214 = 0;
      else
        v214 = objc_msgSend(v213, "isEqualToString:", CFSTR("TOPOGRAPHIC"));

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_381:

        if (a3)
          v215 = CFSTR("guideSummaryLayoutMetadata");
        else
          v215 = CFSTR("guide_summary_layout_metadata");
        objc_msgSend(v106, "objectForKeyedSubscript:", v215);
        v216 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v217 = [GEOPDGuideSummaryLayoutMetadata alloc];
          if (v217)
            v218 = (void *)-[GEOPDGuideSummaryLayoutMetadata _initWithDictionary:isJSON:]((uint64_t)v217, v216, a3);
          else
            v218 = 0;
          -[GEOPDCategorySearchResult setGuideSummaryLayoutMetadata:]((uint64_t)v107, v218);

        }
        if (a3)
          v219 = CFSTR("paginationInfo");
        else
          v219 = CFSTR("pagination_info");
        objc_msgSend(v106, "objectForKeyedSubscript:", v219);
        v220 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v221 = [GEOPDPaginationInfo alloc];
          if (v221)
            v222 = (void *)-[GEOPDPaginationInfo _initWithDictionary:isJSON:](v221, v220, a3);
          else
            v222 = 0;
          -[GEOPDCategorySearchResult setPaginationInfo:]((uint64_t)v107, v222);

        }
        if (a3)
          v223 = CFSTR("redoButtonThreshold");
        else
          v223 = CFSTR("redo_button_threshold");
        objc_msgSend(v106, "objectForKeyedSubscript:", v223);
        v224 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v225 = [GEOPDSSearchRedoButtonThreshold alloc];
          if (v225)
            v226 = (void *)-[GEOPDSSearchRedoButtonThreshold _initWithDictionary:isJSON:]((uint64_t)v225, v224, a3);
          else
            v226 = 0;
          -[GEOPDCategorySearchResult setRedoButtonThreshold:]((uint64_t)v107, v226);

        }
        goto LABEL_403;
      }
      v214 = objc_msgSend(v212, "intValue");
    }
    v107[46]._os_unfair_lock_opaque |= 0x1000000u;
    v107[46]._os_unfair_lock_opaque |= 1u;
    v107[43]._os_unfair_lock_opaque = v214;
    goto LABEL_381;
  }
LABEL_405:

  if (a3)
    v227 = CFSTR("popularNearbySearchResult");
  else
    v227 = CFSTR("popular_nearby_search_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v227);
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v229 = [GEOPDPopularNearbySearchResult alloc];
    if (v229)
    {
      v230 = v228;
      v229 = -[GEOPDPopularNearbySearchResult init](v229, "init");
      if (v229)
      {
        if (a3)
          v231 = CFSTR("displayMapRegion");
        else
          v231 = CFSTR("display_map_region");
        objc_msgSend(v230, "objectForKeyedSubscript:", v231);
        v232 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v233 = [GEOMapRegion alloc];
          if ((a3 & 1) != 0)
            v234 = -[GEOMapRegion initWithJSON:](v233, "initWithJSON:", v232);
          else
            v234 = -[GEOMapRegion initWithDictionary:](v233, "initWithDictionary:", v232);
          v235 = v234;
          -[GEOPDPopularNearbySearchResult setDisplayMapRegion:]((uint64_t)v229, v234);

        }
        if (a3)
          v236 = CFSTR("sectionHeader");
        else
          v236 = CFSTR("section_header");
        objc_msgSend(v230, "objectForKeyedSubscript:", v236);
        v237 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v238 = (void *)objc_msgSend(v237, "copy");
          -[GEOPDPopularNearbySearchResult setSectionHeader:]((uint64_t)v229, v238);

        }
        if (a3)
          v239 = CFSTR("isChainResultSet");
        else
          v239 = CFSTR("is_chain_result_set");
        objc_msgSend(v230, "objectForKeyedSubscript:", v239);
        v240 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v241 = objc_msgSend(v240, "BOOLValue");
          *(_BYTE *)&v229->_flags |= 0x10u;
          *(_BYTE *)&v229->_flags |= 1u;
          v229->_isChainResultSet = v241;
        }

      }
    }
    -[GEOPDPlaceGlobalResult setPopularNearbySearchResult:]((uint64_t)v1078, v229);

  }
  if (a3)
    v242 = CFSTR("searchZeroKeywordCategorySuggestionResult");
  else
    v242 = CFSTR("search_zero_keyword_category_suggestion_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v242);
  v1068 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v243 = v1068;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v244 = [GEOPDSearchZeroKeywordCategorySuggestionResult alloc];
    if (v244)
    {
      v245 = v244;
      v246 = v1068;
      v1147 = -[GEOPDSearchZeroKeywordCategorySuggestionResult init](v245, "init");
      if (v1147)
      {
        v1054 = v246;
        objc_msgSend(v246, "objectForKeyedSubscript:", CFSTR("category"));
        v247 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1219 = 0u;
          v1218 = 0u;
          v1217 = 0u;
          v1216 = 0u;
          v248 = v247;
          v249 = objc_msgSend(v248, "countByEnumeratingWithState:objects:count:", &v1216, &v1228, 16);
          if (v249)
          {
            v250 = *(_QWORD *)v1217;
            do
            {
              v251 = 0;
              do
              {
                if (*(_QWORD *)v1217 != v250)
                  objc_enumerationMutation(v248);
                v252 = *(void **)(*((_QWORD *)&v1216 + 1) + 8 * v251);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v253 = [GEOPDBrowseCategory alloc];
                  if (v253)
                    v254 = (void *)-[GEOPDBrowseCategory _initWithDictionary:isJSON:]((uint64_t)v253, v252, a3);
                  else
                    v254 = 0;
                  -[GEOPDSearchZeroKeywordCategorySuggestionResult addCategory:]((uint64_t)v1147, v254);

                }
                ++v251;
              }
              while (v249 != v251);
              v255 = objc_msgSend(v248, "countByEnumeratingWithState:objects:count:", &v1216, &v1228, 16);
              v249 = v255;
            }
            while (v255);
          }

        }
        if (a3)
          v256 = CFSTR("zeroKeywordEntry");
        else
          v256 = CFSTR("zero_keyword_entry");
        objc_msgSend(v1054, "objectForKeyedSubscript:", v256);
        v1061 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1215 = 0u;
          v1214 = 0u;
          v1213 = 0u;
          v1212 = 0u;
          obj = v1061;
          v1136 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v1212, &v1224, 16);
          if (v1136)
          {
            v257 = CFSTR("day_of_week");
            v1124 = *(id *)v1213;
            if (a3)
              v257 = CFSTR("dayOfWeek");
            v1100 = v257;
            if (a3)
              v258 = CFSTR("hourOfDay");
            else
              v258 = CFSTR("hour_of_day");
            v259 = CFSTR("categoryIndex");
            if (!a3)
              v259 = CFSTR("category_index");
            v1079 = v259;
            v1088 = v258;
            do
            {
              for (k = 0; k != v1136; k = (char *)k + 1)
              {
                if (*(id *)v1213 != v1124)
                  objc_enumerationMutation(obj);
                v261 = *(void **)(*((_QWORD *)&v1212 + 1) + 8 * (_QWORD)k);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v262 = [GEOPDSearchZeroKeywordEntry alloc];
                  if (v262)
                  {
                    v1159 = v261;
                    v262 = -[GEOPDSearchZeroKeywordEntry init](v262, "init");
                    if (v262)
                    {
                      objc_msgSend(v1159, "objectForKeyedSubscript:", v1100);
                      v263 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v264 = objc_msgSend(v263, "unsignedIntValue");
                        *(_BYTE *)&v262->_flags |= 1u;
                        v262->_dayOfWeek = v264;
                      }

                      objc_msgSend(v1159, "objectForKeyedSubscript:", v1088);
                      v265 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v266 = objc_msgSend(v265, "unsignedIntValue");
                        *(_BYTE *)&v262->_flags |= 2u;
                        v262->_hourOfDay = v266;
                      }

                      objc_msgSend(v1159, "objectForKeyedSubscript:", v1079);
                      v267 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v1223 = 0u;
                        v1222 = 0u;
                        v1221 = 0u;
                        v1220 = 0u;
                        v268 = v267;
                        v269 = objc_msgSend(v268, "countByEnumeratingWithState:objects:count:", &v1220, v1232, 16);
                        if (v269)
                        {
                          v270 = *(_QWORD *)v1221;
                          do
                          {
                            for (m = 0; m != v269; ++m)
                            {
                              if (*(_QWORD *)v1221 != v270)
                                objc_enumerationMutation(v268);
                              v272 = *(void **)(*((_QWORD *)&v1220 + 1) + 8 * m);
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                objc_msgSend(v272, "unsignedIntValue");
                                PBRepeatedUInt32Add();
                              }
                            }
                            v269 = objc_msgSend(v268, "countByEnumeratingWithState:objects:count:", &v1220, v1232, 16);
                          }
                          while (v269);
                        }

                      }
                    }

                  }
                  -[GEOPDSearchZeroKeywordCategorySuggestionResult addZeroKeywordEntry:]((uint64_t)v1147, v262);

                }
              }
              v1136 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v1212, &v1224, 16);
            }
            while (v1136);
          }

        }
        v246 = v1054;
      }

    }
    else
    {
      v1147 = 0;
    }
    -[GEOPDPlaceGlobalResult setSearchZeroKeywordCategorySuggestionResult:]((uint64_t)v1078, v1147);

    v243 = v1068;
  }

  if (a3)
    v273 = CFSTR("searchFieldPlaceholderResult");
  else
    v273 = CFSTR("search_field_placeholder_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v273);
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v275 = [GEOPDSearchFieldPlaceholderResult alloc];
    if (v275)
    {
      v276 = v274;
      v275 = -[GEOPDSearchFieldPlaceholderResult init](v275, "init");
      if (v275)
      {
        if (a3)
          v277 = CFSTR("displayString");
        else
          v277 = CFSTR("display_string");
        objc_msgSend(v276, "objectForKeyedSubscript:", v277);
        v278 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v279 = (void *)objc_msgSend(v278, "copy");
          -[GEOPDSearchFieldPlaceholderResult setDisplayString:]((uint64_t)v275, v279);

        }
      }

    }
    -[GEOPDPlaceGlobalResult setSearchFieldPlaceholderResult:]((uint64_t)v1078, v275);

  }
  if (a3)
    v280 = CFSTR("batchPopularNearbySearchResult");
  else
    v280 = CFSTR("batch_popular_nearby_search_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v280);
  v1055 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v281 = v1055;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v282 = [GEOPDBatchPopularNearbySearchResult alloc];
    if (v282)
    {
      v283 = v282;
      v284 = v1055;
      v1080 = -[GEOPDBatchPopularNearbySearchResult init](v283, "init");
      if (v1080)
      {
        if (a3)
          v285 = CFSTR("popularNearbyResult");
        else
          v285 = CFSTR("popular_nearby_result");
        v1047 = v284;
        objc_msgSend(v284, "objectForKeyedSubscript:", v285);
        v1051 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v286 = v1051;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1223 = 0u;
          v1222 = 0u;
          v1221 = 0u;
          v1220 = 0u;
          v1089 = v1051;
          obja = (id)objc_msgSend(v1089, "countByEnumeratingWithState:objects:count:", &v1220, &v1228, 16);
          if (obja)
          {
            v287 = CFSTR("section_header");
            v1101 = *(id *)v1221;
            if (a3)
              v287 = CFSTR("sectionHeader");
            v1069 = v287;
            if (a3)
              v288 = CFSTR("litePlaceResult");
            else
              v288 = CFSTR("lite_place_result");
            v1062 = v288;
            v289 = CFSTR("result_provider_id");
            if (a3)
              v289 = CFSTR("resultProviderId");
            v1160 = v289;
            do
            {
              v290 = 0;
              do
              {
                if (*(id *)v1221 != v1101)
                {
                  v291 = v290;
                  objc_enumerationMutation(v1089);
                  v290 = v291;
                }
                v1148 = v290;
                v292 = *(void **)(*((_QWORD *)&v1220 + 1) + 8 * v290);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v293 = [GEOPDPopularNearbyResult alloc];
                  if (v293)
                  {
                    v1137 = v292;
                    v294 = -[GEOPDPopularNearbyResult init](v293, "init");
                    if (v294)
                    {
                      objc_msgSend(v1137, "objectForKeyedSubscript:", v1069);
                      v295 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v296 = (void *)objc_msgSend(v295, "copy");
                        v297 = v296;
                        *(_BYTE *)(v294 + 68) |= 4u;
                        *(_BYTE *)(v294 + 68) |= 8u;
                        objc_storeStrong((id *)(v294 + 48), v296);

                      }
                      objc_msgSend(v1137, "objectForKeyedSubscript:", v1062);
                      v1125 = (id)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v1227 = 0u;
                        v1226 = 0u;
                        v1225 = 0u;
                        v1224 = 0u;
                        v298 = v1125;
                        v299 = objc_msgSend(v298, "countByEnumeratingWithState:objects:count:", &v1224, v1232, 16);
                        if (v299)
                        {
                          v300 = *(_QWORD *)v1225;
                          do
                          {
                            for (n = 0; n != v299; ++n)
                            {
                              if (*(_QWORD *)v1225 != v300)
                                objc_enumerationMutation(v298);
                              v302 = *(void **)(*((_QWORD *)&v1224 + 1) + 8 * n);
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v303 = v302;
                                objc_msgSend(v303, "objectForKeyedSubscript:", CFSTR("muid"));
                                v304 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v305 = objc_msgSend(v304, "unsignedLongLongValue");
                                  v306 = 0x100000000;
                                }
                                else
                                {
                                  v305 = 0;
                                  v306 = 0;
                                }

                                objc_msgSend(v303, "objectForKeyedSubscript:", v1160);
                                v307 = (void *)objc_claimAutoreleasedReturnValue();

                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                  v306 |= objc_msgSend(v307, "intValue") | 0x200000000;

                                -[GEOPDPopularNearbyResult _readLitePlaceResults](v294);
                                if (-[GEOPDPopularNearbyResult _reserveLitePlaceResults:](v294, 1uLL))
                                {
                                  v308 = (uint64_t *)(*(_QWORD *)(v294 + 24) + 16 * *(_QWORD *)(v294 + 32));
                                  *v308 = v305;
                                  v308[1] = v306;
                                  ++*(_QWORD *)(v294 + 32);
                                }
                                os_unfair_lock_lock_with_options();
                                *(_BYTE *)(v294 + 68) |= 2u;
                                os_unfair_lock_unlock((os_unfair_lock_t)(v294 + 64));
                                *(_BYTE *)(v294 + 68) |= 8u;
                              }
                            }
                            v299 = objc_msgSend(v298, "countByEnumeratingWithState:objects:count:", &v1224, v1232, 16);
                          }
                          while (v299);
                        }

                      }
                    }

                  }
                  else
                  {
                    v294 = 0;
                  }
                  -[GEOPDBatchPopularNearbySearchResult addPopularNearbyResult:]((uint64_t)v1080, (void *)v294);

                }
                v290 = v1148 + 1;
              }
              while ((id)(v1148 + 1) != obja);
              v309 = objc_msgSend(v1089, "countByEnumeratingWithState:objects:count:", &v1220, &v1228, 16);
              obja = (id)v309;
            }
            while (v309);
          }

          v286 = v1051;
        }

        v284 = v1047;
      }

    }
    else
    {
      v1080 = 0;
    }
    -[GEOPDPlaceGlobalResult setBatchPopularNearbySearchResult:]((uint64_t)v1078, v1080);

    v281 = v1055;
  }

  if (a3)
    v310 = CFSTR("vendorSpecificPlaceRefinementResult");
  else
    v310 = CFSTR("vendor_specific_place_refinement_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v310);
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v312 = [GEOPDVendorSpecificPlaceRefinementResult alloc];
    v313 = v311;
    if (v312)
      v312 = -[GEOPDVendorSpecificPlaceRefinementResult init](v312, "init");

    -[GEOPDPlaceGlobalResult setVendorSpecificPlaceRefinementResult:]((uint64_t)v1078, v312);
  }

  if (a3)
    v314 = CFSTR("nearbySearchResult");
  else
    v314 = CFSTR("nearby_search_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v314);
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v316 = [GEOPDNearbySearchResult alloc];
    v317 = v315;
    if (v316)
      v316 = -[GEOPDNearbySearchResult init](v316, "init");

    -[GEOPDPlaceGlobalResult setNearbySearchResult:]((uint64_t)v1078, v316);
  }

  if (a3)
    v318 = CFSTR("addressObjectGeocodingResult");
  else
    v318 = CFSTR("address_object_geocoding_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v318);
  v319 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v320 = [GEOPDAddressObjectGeocodingResult alloc];
    if (v320)
    {
      v321 = v319;
      v320 = -[GEOPDAddressObjectGeocodingResult init](v320, "init");
      if (v320)
      {
        if (a3)
          v322 = CFSTR("disambiguationLabel");
        else
          v322 = CFSTR("disambiguation_label");
        objc_msgSend(v321, "objectForKeyedSubscript:", v322);
        v323 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1231 = 0u;
          v1230 = 0u;
          v1229 = 0u;
          v1228 = 0u;
          v324 = v323;
          v325 = objc_msgSend(v324, "countByEnumeratingWithState:objects:count:", &v1228, v1232, 16);
          if (v325)
          {
            v326 = *(_QWORD *)v1229;
            do
            {
              v327 = 0;
              do
              {
                if (*(_QWORD *)v1229 != v326)
                  objc_enumerationMutation(v324);
                v328 = *(void **)(*((_QWORD *)&v1228 + 1) + 8 * v327);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v329 = [GEOPDMultiLocalizedString alloc];
                  if (v329)
                    v330 = (void *)-[GEOPDMultiLocalizedString _initWithDictionary:isJSON:](v329, v328, a3);
                  else
                    v330 = 0;
                  -[GEOPDAddressObjectGeocodingResult addDisambiguationLabel:]((uint64_t)v320, v330);

                }
                ++v327;
              }
              while (v325 != v327);
              v331 = objc_msgSend(v324, "countByEnumeratingWithState:objects:count:", &v1228, v1232, 16);
              v325 = v331;
            }
            while (v331);
          }

        }
      }

    }
    -[GEOPDPlaceGlobalResult setAddressObjectGeocodingResult:]((uint64_t)v1078, v320);

  }
  if (a3)
    v332 = CFSTR("searchZeroKeywordWithSearchResultsSuggestionResult");
  else
    v332 = CFSTR("search_zero_keyword_with_search_results_suggestion_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v332);
  v1070 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v333 = v1070;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v334 = [GEOPDSearchZeroKeywordWithSearchResultsSuggestionResult alloc];
    if (v334)
    {
      v335 = v334;
      v336 = v1070;
      v1090 = -[GEOPDSearchZeroKeywordWithSearchResultsSuggestionResult init](v335, "init");
      if (v1090)
      {
        if (a3)
          v337 = CFSTR("searchResultsForCategoryEntry");
        else
          v337 = CFSTR("search_results_for_category_entry");
        v1056 = v336;
        objc_msgSend(v336, "objectForKeyedSubscript:", v337);
        v1063 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v338 = v1063;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1223 = 0u;
          v1222 = 0u;
          v1221 = 0u;
          v1220 = 0u;
          v1102 = v1063;
          v1126 = (id)objc_msgSend(v1102, "countByEnumeratingWithState:objects:count:", &v1220, &v1228, 16);
          if (v1126)
          {
            v339 = CFSTR("place_index");
            objb = *(id *)v1221;
            if (a3)
              v339 = CFSTR("placeIndex");
            v1081 = v339;
            do
            {
              v340 = 0;
              do
              {
                if (*(id *)v1221 != objb)
                {
                  v341 = v340;
                  objc_enumerationMutation(v1102);
                  v340 = v341;
                }
                v1161 = v340;
                v342 = *(void **)(*((_QWORD *)&v1220 + 1) + 8 * v340);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v343 = [GEOPDSearchResultsForCategoryEntry alloc];
                  if (v343)
                  {
                    v1149 = v342;
                    v344 = -[GEOPDSearchResultsForCategoryEntry init](v343, "init");
                    if (v344)
                    {
                      objc_msgSend(v1149, "objectForKeyedSubscript:", CFSTR("category"));
                      v345 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v346 = [GEOPDBrowseCategory alloc];
                        if (v346)
                          v347 = (void *)-[GEOPDBrowseCategory _initWithDictionary:isJSON:]((uint64_t)v346, v345, a3);
                        else
                          v347 = 0;
                        v348 = v347;
                        *(_BYTE *)(v344 + 68) |= 4u;
                        *(_BYTE *)(v344 + 68) |= 8u;
                        objc_storeStrong((id *)(v344 + 48), v347);

                      }
                      objc_msgSend(v1149, "objectForKeyedSubscript:", v1081);
                      v1138 = (id)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v1227 = 0u;
                        v1226 = 0u;
                        v1225 = 0u;
                        v1224 = 0u;
                        v349 = v1138;
                        v350 = objc_msgSend(v349, "countByEnumeratingWithState:objects:count:", &v1224, v1232, 16);
                        if (v350)
                        {
                          v351 = *(_QWORD *)v1225;
                          do
                          {
                            for (ii = 0; ii != v350; ++ii)
                            {
                              if (*(_QWORD *)v1225 != v351)
                                objc_enumerationMutation(v349);
                              v353 = *(void **)(*((_QWORD *)&v1224 + 1) + 8 * ii);
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                objc_msgSend(v353, "unsignedIntValue");
                                os_unfair_lock_lock((os_unfair_lock_t)(v344 + 64));
                                if ((*(_BYTE *)(v344 + 68) & 2) == 0)
                                {
                                  v354 = *(void **)(v344 + 8);
                                  if (v354)
                                  {
                                    v355 = v354;
                                    objc_sync_enter(v355);
                                    GEOPDSearchResultsForCategoryEntryReadSpecified(v344, *(_QWORD *)(v344 + 8), (int *)&_readPlaceIndexs_tags);
                                    objc_sync_exit(v355);

                                  }
                                }
                                os_unfair_lock_unlock((os_unfair_lock_t)(v344 + 64));
                                PBRepeatedUInt32Add();
                                os_unfair_lock_lock_with_options();
                                *(_BYTE *)(v344 + 68) |= 2u;
                                os_unfair_lock_unlock((os_unfair_lock_t)(v344 + 64));
                                *(_BYTE *)(v344 + 68) |= 8u;
                              }
                            }
                            v350 = objc_msgSend(v349, "countByEnumeratingWithState:objects:count:", &v1224, v1232, 16);
                          }
                          while (v350);
                        }

                      }
                    }

                  }
                  else
                  {
                    v344 = 0;
                  }
                  -[GEOPDSearchZeroKeywordWithSearchResultsSuggestionResult addSearchResultsForCategoryEntry:]((uint64_t)v1090, (void *)v344);

                }
                v340 = v1161 + 1;
              }
              while ((id)(v1161 + 1) != v1126);
              v356 = objc_msgSend(v1102, "countByEnumeratingWithState:objects:count:", &v1220, &v1228, 16);
              v1126 = (id)v356;
            }
            while (v356);
          }

          v338 = v1063;
        }

        v336 = v1056;
      }

    }
    else
    {
      v1090 = 0;
    }
    -[GEOPDPlaceGlobalResult setSearchZeroKeywordWithSearchResultsSuggestionResult:]((uint64_t)v1078, v1090);

    v333 = v1070;
  }

  if (a3)
    v357 = CFSTR("externalTransitLookupResult");
  else
    v357 = CFSTR("external_transit_lookup_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v357);
  v358 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v359 = [GEOPDExternalTransitLookupResult alloc];
    if (v359)
    {
      v360 = v358;
      v359 = -[GEOPDExternalTransitLookupResult init](v359, "init");
      if (v359)
      {
        if (a3)
          v361 = CFSTR("providerId");
        else
          v361 = CFSTR("provider_id");
        objc_msgSend(v360, "objectForKeyedSubscript:", v361);
        v362 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v363 = (void *)objc_msgSend(v362, "copy");
          -[GEOPDExternalTransitLookupResult setProviderId:]((uint64_t)v359, v363);

        }
      }

    }
    -[GEOPDPlaceGlobalResult setExternalTransitLookupResult:]((uint64_t)v1078, v359);

  }
  if (a3)
    v364 = CFSTR("featureIdGeocodingResult");
  else
    v364 = CFSTR("feature_id_geocoding_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v364);
  v365 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v366 = [GEOPDFeatureIdGeocodingResult alloc];
    v367 = v365;
    if (v366)
      v366 = -[GEOPDFeatureIdGeocodingResult init](v366, "init");

    -[GEOPDPlaceGlobalResult setFeatureIdGeocodingResult:]((uint64_t)v1078, v366);
  }

  if (a3)
    v368 = CFSTR("mapsIdentifierPlaceLookupResult");
  else
    v368 = CFSTR("maps_identifier_place_lookup_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v368);
  v369 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v370 = [GEOPDMapsIdentifierPlaceLookupResult alloc];
    v371 = v369;
    if (v370)
      v370 = -[GEOPDMapsIdentifierPlaceLookupResult init](v370, "init");

    -[GEOPDPlaceGlobalResult setMapsIdentifierPlaceLookupResult:]((uint64_t)v1078, v370);
  }

  if (a3)
    v372 = CFSTR("batchReverseGeocodingResult");
  else
    v372 = CFSTR("batch_reverse_geocoding_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v372);
  v373 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v374 = [GEOPDBatchReverseGeocodingResult alloc];
    v375 = v373;
    if (v374)
      v374 = -[GEOPDBatchReverseGeocodingResult init](v374, "init");

    -[GEOPDPlaceGlobalResult setBatchReverseGeocodingResult:]((uint64_t)v1078, v374);
  }

  if (a3)
    v376 = CFSTR("brandLookupResult");
  else
    v376 = CFSTR("brand_lookup_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v376);
  v377 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v378 = [GEOPDBrandLookupResult alloc];
    v379 = v377;
    if (v378)
      v378 = -[GEOPDBrandLookupResult init](v378, "init");

    -[GEOPDPlaceGlobalResult setBrandLookupResult:]((uint64_t)v1078, v378);
  }

  if (a3)
    v380 = CFSTR("wifiFingerprintResult");
  else
    v380 = CFSTR("wifi_fingerprint_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v380);
  v381 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v382 = [GEOPDWifiFingerprintResult alloc];
    v383 = v381;
    if (v382)
      v382 = -[GEOPDWifiFingerprintResult init](v382, "init");

    -[GEOPDPlaceGlobalResult setWifiFingerprintResult:]((uint64_t)v1078, v382);
  }

  if (a3)
    v384 = CFSTR("ipGeoLookupResult");
  else
    v384 = CFSTR("ip_geo_lookup_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v384);
  v385 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v386 = [GEOPDIpGeoLookupResult alloc];
    if (!v386)
    {
LABEL_758:
      -[GEOPDPlaceGlobalResult setIpGeoLookupResult:]((uint64_t)v1078, v386);

      goto LABEL_759;
    }
    v387 = v385;
    v386 = -[GEOPDIpGeoLookupResult init](v386, "init");
    if (!v386)
    {
LABEL_757:

      goto LABEL_758;
    }
    objc_msgSend(v387, "objectForKeyedSubscript:", CFSTR("status"));
    v388 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v389 = v388;
      if ((objc_msgSend(v389, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
      {
        v390 = 0;
      }
      else if ((objc_msgSend(v389, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
      {
        v390 = 1;
      }
      else if ((objc_msgSend(v389, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
      {
        v390 = 2;
      }
      else if ((objc_msgSend(v389, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
      {
        v390 = 5;
      }
      else if ((objc_msgSend(v389, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
      {
        v390 = 20;
      }
      else if ((objc_msgSend(v389, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
      {
        v390 = 30;
      }
      else if ((objc_msgSend(v389, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
      {
        v390 = 40;
      }
      else if ((objc_msgSend(v389, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
      {
        v390 = 50;
      }
      else if (objc_msgSend(v389, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
      {
        v390 = 60;
      }
      else
      {
        v390 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_736:

        if (a3)
          v391 = CFSTR("ipAddress");
        else
          v391 = CFSTR("ip_address");
        objc_msgSend(v387, "objectForKeyedSubscript:", v391);
        v392 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v393 = (void *)objc_msgSend(v392, "copy");
          -[GEOPDIpGeoLookupResult setIpAddress:]((uint64_t)v386, v393);

        }
        objc_msgSend(v387, "objectForKeyedSubscript:", CFSTR("location"));
        v394 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v395 = [GEOLatLng alloc];
          if ((a3 & 1) != 0)
            v396 = -[GEOLatLng initWithJSON:](v395, "initWithJSON:", v394);
          else
            v396 = -[GEOLatLng initWithDictionary:](v395, "initWithDictionary:", v394);
          v397 = v396;
          -[GEOPDIpGeoLookupResult setLocation:]((uint64_t)v386, v396);

        }
        if (a3)
          v398 = CFSTR("countryCode");
        else
          v398 = CFSTR("country_code");
        objc_msgSend(v387, "objectForKeyedSubscript:", v398);
        v399 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v400 = (void *)objc_msgSend(v399, "copy");
          -[GEOPDIpGeoLookupResult setCountryCode:]((uint64_t)v386, v400);

        }
        if (a3)
          v401 = CFSTR("timeZome");
        else
          v401 = CFSTR("time_zome");
        objc_msgSend(v387, "objectForKeyedSubscript:", v401);
        v402 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v403 = (void *)objc_msgSend(v402, "copy");
          -[GEOPDIpGeoLookupResult setTimeZome:]((uint64_t)v386, v403);

        }
        goto LABEL_757;
      }
      v390 = objc_msgSend(v388, "intValue");
    }
    *(_BYTE *)&v386->_flags |= 0x40u;
    *(_BYTE *)&v386->_flags |= 1u;
    v386->_status = v390;
    goto LABEL_736;
  }
LABEL_759:

  if (a3)
    v404 = CFSTR("groundViewLabelResult");
  else
    v404 = CFSTR("ground_view_label_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v404);
  v405 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v406 = [GEOPDGroundViewLabelResult alloc];
    v407 = v405;
    if (v406)
      v406 = -[GEOPDGroundViewLabelResult init](v406, "init");

    -[GEOPDPlaceGlobalResult setGroundViewLabelResult:]((uint64_t)v1078, v406);
  }

  if (a3)
    v408 = CFSTR("batchSpatialLookupResult");
  else
    v408 = CFSTR("batch_spatial_lookup_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v408);
  v1091 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v409 = v1091;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v410 = [GEOPDBatchSpatialLookupResult alloc];
    if (!v410)
    {
      v1139 = 0;
      goto LABEL_931;
    }
    v411 = v410;
    v412 = v1091;
    v1139 = -[GEOPDBatchSpatialLookupResult init](v411, "init");
    if (!v1139)
    {
LABEL_930:

LABEL_931:
      -[GEOPDPlaceGlobalResult setBatchSpatialLookupResult:]((uint64_t)v1078, v1139);

      v409 = v1091;
      goto LABEL_932;
    }
    if (a3)
      v413 = CFSTR("statusCode");
    else
      v413 = CFSTR("status_code");
    v1082 = v412;
    v1127 = v413;
    objc_msgSend(v412, "objectForKeyedSubscript:");
    v414 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v415 = v414;
      if ((objc_msgSend(v415, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
      {
        v416 = 0;
      }
      else if ((objc_msgSend(v415, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
      {
        v416 = 1;
      }
      else if ((objc_msgSend(v415, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
      {
        v416 = 2;
      }
      else if ((objc_msgSend(v415, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
      {
        v416 = 5;
      }
      else if ((objc_msgSend(v415, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
      {
        v416 = 20;
      }
      else if ((objc_msgSend(v415, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
      {
        v416 = 30;
      }
      else if ((objc_msgSend(v415, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
      {
        v416 = 40;
      }
      else if ((objc_msgSend(v415, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
      {
        v416 = 50;
      }
      else if (objc_msgSend(v415, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
      {
        v416 = 60;
      }
      else
      {
        v416 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_799:

        if (a3)
          v417 = CFSTR("spatialPlaceLookupResult");
        else
          v417 = CFSTR("spatial_place_lookup_result");
        objc_msgSend(v1082, "objectForKeyedSubscript:", v417);
        v1071 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v418 = v1071;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1219 = 0u;
          v1218 = 0u;
          v1217 = 0u;
          v1216 = 0u;
          objc = v1071;
          v1162 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v1216, &v1228, 16);
          if (!v1162)
            goto LABEL_863;
          v419 = CFSTR("display_map_region");
          v1150 = *(_QWORD *)v1217;
          if (a3)
            v419 = CFSTR("displayMapRegion");
          v1103 = v419;
          while (1)
          {
            v420 = 0;
            do
            {
              if (*(_QWORD *)v1217 != v1150)
                objc_enumerationMutation(objc);
              v421 = *(void **)(*((_QWORD *)&v1216 + 1) + 8 * v420);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v422 = [GEOPDSpatialPlaceLookupResult alloc];
                if (v422)
                {
                  v423 = v421;
                  v424 = -[GEOPDSpatialPlaceLookupResult init](v422, "init");
                  if (v424)
                  {
                    objc_msgSend(v423, "objectForKeyedSubscript:", v1127);
                    v425 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v426 = v425;
                      if ((objc_msgSend(v426, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
                      {
                        v427 = 0;
                      }
                      else if ((objc_msgSend(v426, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
                      {
                        v427 = 1;
                      }
                      else if ((objc_msgSend(v426, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
                      {
                        v427 = 2;
                      }
                      else if ((objc_msgSend(v426, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
                      {
                        v427 = 5;
                      }
                      else if ((objc_msgSend(v426, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
                      {
                        v427 = 20;
                      }
                      else if ((objc_msgSend(v426, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
                      {
                        v427 = 30;
                      }
                      else if ((objc_msgSend(v426, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
                      {
                        v427 = 40;
                      }
                      else if ((objc_msgSend(v426, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
                      {
                        v427 = 50;
                      }
                      else if (objc_msgSend(v426, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
                      {
                        v427 = 60;
                      }
                      else
                      {
                        v427 = 0;
                      }

LABEL_836:
                      *(_BYTE *)(v424 + 56) |= 0x10u;
                      *(_BYTE *)(v424 + 56) |= 1u;
                      *(_DWORD *)(v424 + 52) = v427;
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v427 = objc_msgSend(v425, "intValue");
                        goto LABEL_836;
                      }
                    }

                    objc_msgSend(v423, "objectForKeyedSubscript:", CFSTR("place"));
                    v428 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v1227 = 0u;
                      v1226 = 0u;
                      v1225 = 0u;
                      v1224 = 0u;
                      v429 = v428;
                      v430 = objc_msgSend(v429, "countByEnumeratingWithState:objects:count:", &v1224, v1232, 16);
                      if (v430)
                      {
                        v431 = *(_QWORD *)v1225;
                        do
                        {
                          for (jj = 0; jj != v430; ++jj)
                          {
                            if (*(_QWORD *)v1225 != v431)
                              objc_enumerationMutation(v429);
                            v433 = *(_QWORD *)(*((_QWORD *)&v1224 + 1) + 8 * jj);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v434 = [GEOPDSpatialPlaceLookupResponse alloc];
                              if ((a3 & 1) != 0)
                                v435 = -[GEOPDSpatialPlaceLookupResponse initWithJSON:](v434, "initWithJSON:", v433);
                              else
                                v435 = -[GEOPDSpatialPlaceLookupResponse initWithDictionary:](v434, "initWithDictionary:", v433);
                              v436 = v435;
                              -[GEOPDSpatialPlaceLookupResult addPlace:](v424, v435);

                            }
                          }
                          v430 = objc_msgSend(v429, "countByEnumeratingWithState:objects:count:", &v1224, v1232, 16);
                        }
                        while (v430);
                      }

                    }
                    objc_msgSend(v423, "objectForKeyedSubscript:", v1103);
                    v437 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v438 = [GEOMapRegion alloc];
                      if ((a3 & 1) != 0)
                        v439 = -[GEOMapRegion initWithJSON:](v438, "initWithJSON:", v437);
                      else
                        v439 = -[GEOMapRegion initWithDictionary:](v438, "initWithDictionary:", v437);
                      v440 = v439;
                      v441 = v439;
                      *(_BYTE *)(v424 + 56) |= 4u;
                      *(_BYTE *)(v424 + 56) |= 0x10u;
                      objc_storeStrong((id *)(v424 + 24), v440);

                    }
                  }

                }
                else
                {
                  v424 = 0;
                }
                -[GEOPDBatchSpatialLookupResult addSpatialPlaceLookupResult:]((uint64_t)v1139, (void *)v424);

              }
              ++v420;
            }
            while (v420 != v1162);
            v442 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v1216, &v1228, 16);
            v1162 = v442;
            if (!v442)
            {
LABEL_863:

              v418 = v1071;
              break;
            }
          }
        }

        if (a3)
          v443 = CFSTR("spatialEventLookupResult");
        else
          v443 = CFSTR("spatial_event_lookup_result");
        objc_msgSend(v1082, "objectForKeyedSubscript:", v443);
        v1072 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1215 = 0u;
          v1214 = 0u;
          v1213 = 0u;
          v1212 = 0u;
          objd = v1072;
          v1163 = objc_msgSend(objd, "countByEnumeratingWithState:objects:count:", &v1212, &v1224, 16);
          if (!v1163)
            goto LABEL_928;
          v444 = CFSTR("display_map_region");
          v1151 = *(_QWORD *)v1213;
          if (a3)
            v444 = CFSTR("displayMapRegion");
          v1104 = v444;
          while (1)
          {
            v445 = 0;
            do
            {
              if (*(_QWORD *)v1213 != v1151)
                objc_enumerationMutation(objd);
              v446 = *(void **)(*((_QWORD *)&v1212 + 1) + 8 * v445);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v447 = [GEOPDSpatialEventLookupResult alloc];
                if (v447)
                {
                  v448 = v446;
                  v449 = -[GEOPDSpatialEventLookupResult init](v447, "init");
                  if (v449)
                  {
                    objc_msgSend(v448, "objectForKeyedSubscript:", v1127);
                    v450 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v451 = v450;
                      if ((objc_msgSend(v451, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
                      {
                        v452 = 0;
                      }
                      else if ((objc_msgSend(v451, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
                      {
                        v452 = 1;
                      }
                      else if ((objc_msgSend(v451, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
                      {
                        v452 = 2;
                      }
                      else if ((objc_msgSend(v451, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
                      {
                        v452 = 5;
                      }
                      else if ((objc_msgSend(v451, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
                      {
                        v452 = 20;
                      }
                      else if ((objc_msgSend(v451, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
                      {
                        v452 = 30;
                      }
                      else if ((objc_msgSend(v451, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
                      {
                        v452 = 40;
                      }
                      else if ((objc_msgSend(v451, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
                      {
                        v452 = 50;
                      }
                      else if (objc_msgSend(v451, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
                      {
                        v452 = 60;
                      }
                      else
                      {
                        v452 = 0;
                      }

LABEL_901:
                      *(_BYTE *)(v449 + 56) |= 0x10u;
                      *(_BYTE *)(v449 + 56) |= 1u;
                      *(_DWORD *)(v449 + 52) = v452;
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v452 = objc_msgSend(v450, "intValue");
                        goto LABEL_901;
                      }
                    }

                    objc_msgSend(v448, "objectForKeyedSubscript:", CFSTR("event"));
                    v453 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v1223 = 0u;
                      v1222 = 0u;
                      v1221 = 0u;
                      v1220 = 0u;
                      v454 = v453;
                      v455 = objc_msgSend(v454, "countByEnumeratingWithState:objects:count:", &v1220, v1232, 16);
                      if (v455)
                      {
                        v456 = *(_QWORD *)v1221;
                        do
                        {
                          for (kk = 0; kk != v455; ++kk)
                          {
                            if (*(_QWORD *)v1221 != v456)
                              objc_enumerationMutation(v454);
                            v458 = *(_QWORD *)(*((_QWORD *)&v1220 + 1) + 8 * kk);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v459 = [GEOPDSpatialEventLookupResponse alloc];
                              if ((a3 & 1) != 0)
                                v460 = -[GEOPDSpatialEventLookupResponse initWithJSON:](v459, "initWithJSON:", v458);
                              else
                                v460 = -[GEOPDSpatialEventLookupResponse initWithDictionary:](v459, "initWithDictionary:", v458);
                              v461 = v460;
                              -[GEOPDSpatialEventLookupResult addEvent:](v449, v460);

                            }
                          }
                          v455 = objc_msgSend(v454, "countByEnumeratingWithState:objects:count:", &v1220, v1232, 16);
                        }
                        while (v455);
                      }

                    }
                    objc_msgSend(v448, "objectForKeyedSubscript:", v1104);
                    v462 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v463 = [GEOMapRegion alloc];
                      if ((a3 & 1) != 0)
                        v464 = -[GEOMapRegion initWithJSON:](v463, "initWithJSON:", v462);
                      else
                        v464 = -[GEOMapRegion initWithDictionary:](v463, "initWithDictionary:", v462);
                      v465 = v464;
                      v466 = v464;
                      *(_BYTE *)(v449 + 56) |= 4u;
                      *(_BYTE *)(v449 + 56) |= 0x10u;
                      objc_storeStrong((id *)(v449 + 24), v465);

                    }
                  }

                }
                else
                {
                  v449 = 0;
                }
                -[GEOPDBatchSpatialLookupResult addSpatialEventLookupResult:]((uint64_t)v1139, (void *)v449);

              }
              ++v445;
            }
            while (v445 != v1163);
            v467 = objc_msgSend(objd, "countByEnumeratingWithState:objects:count:", &v1212, &v1224, 16);
            v1163 = v467;
            if (!v467)
            {
LABEL_928:

              break;
            }
          }
        }

        v412 = v1082;
        goto LABEL_930;
      }
      v416 = objc_msgSend(v414, "intValue");
    }
    *(_BYTE *)&v1139->_flags |= 0x10u;
    *(_BYTE *)&v1139->_flags |= 1u;
    v1139->_statusCode = v416;
    goto LABEL_799;
  }
LABEL_932:

  if (a3)
    v468 = CFSTR("placeGlobalCommonResult");
  else
    v468 = CFSTR("place_global_common_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v468);
  v469 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v470 = [GEOPDPlaceGlobalCommonResult alloc];
    if (v470)
    {
      v471 = v469;
      v470 = -[GEOPDPlaceGlobalCommonResult init](v470, "init");
      if (v470)
      {
        if (a3)
          v472 = CFSTR("placeContextMetadata");
        else
          v472 = CFSTR("place_context_metadata");
        objc_msgSend(v471, "objectForKeyedSubscript:", v472);
        v473 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1231 = 0u;
          v1230 = 0u;
          v1229 = 0u;
          v1228 = 0u;
          v474 = v473;
          v475 = objc_msgSend(v474, "countByEnumeratingWithState:objects:count:", &v1228, v1232, 16);
          if (v475)
          {
            v476 = *(_QWORD *)v1229;
            do
            {
              v477 = 0;
              do
              {
                if (*(_QWORD *)v1229 != v476)
                  objc_enumerationMutation(v474);
                v478 = *(void **)(*((_QWORD *)&v1228 + 1) + 8 * v477);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v479 = [GEOPDPlaceContextMetadata alloc];
                  if (v479)
                    v480 = (void *)-[GEOPDPlaceContextMetadata _initWithDictionary:isJSON:](v479, v478, a3);
                  else
                    v480 = 0;
                  -[GEOPDPlaceGlobalCommonResult addPlaceContextMetadata:]((uint64_t)v470, v480);

                }
                ++v477;
              }
              while (v475 != v477);
              v481 = objc_msgSend(v474, "countByEnumeratingWithState:objects:count:", &v1228, v1232, 16);
              v475 = v481;
            }
            while (v481);
          }

        }
      }

    }
    -[GEOPDPlaceGlobalResult setPlaceGlobalCommonResult:]((uint64_t)v1078, v470);

  }
  if (a3)
    v482 = CFSTR("placeCollectionLookupResult");
  else
    v482 = CFSTR("place_collection_lookup_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v482);
  v483 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v484 = [GEOPDPlaceCollectionLookupResult alloc];
    if (v484)
    {
      v485 = v483;
      v484 = -[GEOPDPlaceCollectionLookupResult init](v484, "init");
      if (v484)
      {
        if (a3)
          v486 = CFSTR("collectionComponent");
        else
          v486 = CFSTR("collection_component");
        objc_msgSend(v485, "objectForKeyedSubscript:", v486);
        v487 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v488 = [GEOPDComponent alloc];
          if (v488)
            v489 = -[GEOPDComponent _initWithDictionary:isJSON:]((char *)v488, v487, a3);
          else
            v489 = 0;
          -[GEOPDPlaceCollectionLookupResult setCollectionComponent:]((uint64_t)v484, v489);

        }
      }

    }
    -[GEOPDPlaceGlobalResult setPlaceCollectionLookupResult:]((uint64_t)v1078, v484);

  }
  if (a3)
    v490 = CFSTR("transitScheduleLookupResult");
  else
    v490 = CFSTR("transit_schedule_lookup_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v490);
  v491 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v492 = [GEOPDTransitScheduleLookupResult alloc];
    v493 = v491;
    if (v492)
      v492 = -[GEOPDTransitScheduleLookupResult init](v492, "init");

    -[GEOPDPlaceGlobalResult setTransitScheduleLookupResult:]((uint64_t)v1078, v492);
  }

  if (a3)
    v494 = CFSTR("batchCategoryLookupResult");
  else
    v494 = CFSTR("batch_category_lookup_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v494);
  v1128 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v495 = v1128;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v496 = [GEOPDBatchCategoryLookupResult alloc];
    if (v496)
    {
      v497 = v496;
      v498 = v1128;
      v1164 = -[GEOPDBatchCategoryLookupResult init](v497, "init");
      if (v1164)
      {
        if (a3)
          v499 = CFSTR("categoryLookupResult");
        else
          v499 = CFSTR("category_lookup_result");
        v1105 = v498;
        objc_msgSend(v498, "objectForKeyedSubscript:", v499);
        obje = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v500 = obje;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1231 = 0u;
          v1230 = 0u;
          v1229 = 0u;
          v1228 = 0u;
          v501 = obje;
          v502 = objc_msgSend(v501, "countByEnumeratingWithState:objects:count:", &v1228, v1232, 16);
          if (v502)
          {
            v503 = *(_QWORD *)v1229;
            if (a3)
              v504 = CFSTR("categoryLookupParam");
            else
              v504 = CFSTR("category_lookup_param");
            v505 = CFSTR("category_info");
            if (a3)
              v505 = CFSTR("categoryInfo");
            v1140 = v505;
            v1152 = v504;
            do
            {
              v506 = 0;
              do
              {
                if (*(_QWORD *)v1229 != v503)
                  objc_enumerationMutation(v501);
                v507 = *(void **)(*((_QWORD *)&v1228 + 1) + 8 * v506);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v508 = [GEOPDCategoryLookupResult alloc];
                  if (v508)
                  {
                    v509 = v507;
                    v510 = -[GEOPDCategoryLookupResult init](v508, "init");
                    if (v510)
                    {
                      objc_msgSend(v509, "objectForKeyedSubscript:", v1152);
                      v511 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v512 = [GEOPDCategoryLookupParameters alloc];
                        if (v512)
                          v513 = (void *)-[GEOPDCategoryLookupParameters _initWithDictionary:isJSON:]((uint64_t)v512, v511, a3);
                        else
                          v513 = 0;
                        v514 = v513;
                        *(_BYTE *)(v510 + 52) |= 4u;
                        *(_BYTE *)(v510 + 52) |= 8u;
                        objc_storeStrong((id *)(v510 + 32), v513);

                      }
                      objc_msgSend(v509, "objectForKeyedSubscript:", v1140);
                      v515 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v516 = [GEOPDCategoryInformation alloc];
                        if ((a3 & 1) != 0)
                          v517 = -[GEOPDCategoryInformation initWithJSON:](v516, "initWithJSON:", v515);
                        else
                          v517 = -[GEOPDCategoryInformation initWithDictionary:](v516, "initWithDictionary:", v515);
                        v518 = v517;
                        v519 = v517;
                        *(_BYTE *)(v510 + 52) |= 2u;
                        *(_BYTE *)(v510 + 52) |= 8u;
                        objc_storeStrong((id *)(v510 + 24), v518);

                      }
                    }

                  }
                  else
                  {
                    v510 = 0;
                  }
                  -[GEOPDBatchCategoryLookupResult addCategoryLookupResult:]((uint64_t)v1164, (void *)v510);

                }
                ++v506;
              }
              while (v502 != v506);
              v520 = objc_msgSend(v501, "countByEnumeratingWithState:objects:count:", &v1228, v1232, 16);
              v502 = v520;
            }
            while (v520);
          }

          v500 = obje;
        }

        v498 = v1105;
      }

    }
    else
    {
      v1164 = 0;
    }
    -[GEOPDPlaceGlobalResult setBatchCategoryLookupResult:]((uint64_t)v1078, v1164);

    v495 = v1128;
  }

  if (a3)
    v521 = CFSTR("batchMerchantLookupBrandResult");
  else
    v521 = CFSTR("batch_merchant_lookup_brand_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v521);
  v1092 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v522 = v1092;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v523 = [GEOPDBatchMerchantLookupBrandResult alloc];
    if (!v523)
    {
      v1129 = 0;
      goto LABEL_1119;
    }
    v524 = v523;
    v525 = v1092;
    v1129 = -[GEOPDBatchMerchantLookupBrandResult init](v524, "init");
    if (!v1129)
    {
LABEL_1118:

LABEL_1119:
      -[GEOPDPlaceGlobalResult setBatchMerchantLookupBrandResult:]((uint64_t)v1078, v1129);

      v522 = v1092;
      goto LABEL_1120;
    }
    if (a3)
      v526 = CFSTR("statusCode");
    else
      v526 = CFSTR("status_code");
    v1083 = v525;
    objf = v526;
    objc_msgSend(v525, "objectForKeyedSubscript:");
    v527 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v528 = v527;
      if ((objc_msgSend(v528, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
      {
        v529 = 0;
      }
      else if ((objc_msgSend(v528, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
      {
        v529 = 1;
      }
      else if ((objc_msgSend(v528, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
      {
        v529 = 2;
      }
      else if ((objc_msgSend(v528, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
      {
        v529 = 5;
      }
      else if ((objc_msgSend(v528, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
      {
        v529 = 20;
      }
      else if ((objc_msgSend(v528, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
      {
        v529 = 30;
      }
      else if ((objc_msgSend(v528, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
      {
        v529 = 40;
      }
      else if ((objc_msgSend(v528, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
      {
        v529 = 50;
      }
      else if (objc_msgSend(v528, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
      {
        v529 = 60;
      }
      else
      {
        v529 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_1059:

        if (a3)
          v530 = CFSTR("merchantLookupBrandResult");
        else
          v530 = CFSTR("merchant_lookup_brand_result");
        objc_msgSend(v525, "objectForKeyedSubscript:", v530);
        v1073 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v531 = v1073;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1223 = 0u;
          v1222 = 0u;
          v1221 = 0u;
          v1220 = 0u;
          v1141 = v1073;
          v1165 = objc_msgSend(v1141, "countByEnumeratingWithState:objects:count:", &v1220, &v1228, 16);
          if (!v1165)
            goto LABEL_1116;
          v532 = CFSTR("merchant_brand_lookup_response");
          v1153 = *(_QWORD *)v1221;
          if (a3)
            v532 = CFSTR("merchantBrandLookupResponse");
          v1106 = v532;
          while (1)
          {
            for (mm = 0; mm != v1165; ++mm)
            {
              if (*(_QWORD *)v1221 != v1153)
                objc_enumerationMutation(v1141);
              v534 = *(void **)(*((_QWORD *)&v1220 + 1) + 8 * mm);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v535 = [GEOPDMerchantLookupBrandResult alloc];
                if (v535)
                {
                  v536 = v534;
                  v535 = -[GEOPDMerchantLookupBrandResult init](v535, "init");
                  if (v535)
                  {
                    objc_msgSend(v536, "objectForKeyedSubscript:", objf);
                    v537 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v538 = v537;
                      if ((objc_msgSend(v538, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
                      {
                        v539 = 0;
                      }
                      else if ((objc_msgSend(v538, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
                      {
                        v539 = 1;
                      }
                      else if ((objc_msgSend(v538, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
                      {
                        v539 = 2;
                      }
                      else if ((objc_msgSend(v538, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
                      {
                        v539 = 5;
                      }
                      else if ((objc_msgSend(v538, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
                      {
                        v539 = 20;
                      }
                      else if ((objc_msgSend(v538, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
                      {
                        v539 = 30;
                      }
                      else if ((objc_msgSend(v538, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
                      {
                        v539 = 40;
                      }
                      else if ((objc_msgSend(v538, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
                      {
                        v539 = 50;
                      }
                      else if (objc_msgSend(v538, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
                      {
                        v539 = 60;
                      }
                      else
                      {
                        v539 = 0;
                      }

LABEL_1096:
                      *(_BYTE *)&v535->_flags |= 1u;
                      v535->_statusCode = v539;
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v539 = objc_msgSend(v537, "intValue");
                        goto LABEL_1096;
                      }
                    }

                    objc_msgSend(v536, "objectForKeyedSubscript:", v1106);
                    v540 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v1227 = 0u;
                      v1226 = 0u;
                      v1225 = 0u;
                      v1224 = 0u;
                      v541 = v540;
                      v542 = objc_msgSend(v541, "countByEnumeratingWithState:objects:count:", &v1224, v1232, 16);
                      if (v542)
                      {
                        v543 = *(_QWORD *)v1225;
                        do
                        {
                          for (nn = 0; nn != v542; ++nn)
                          {
                            if (*(_QWORD *)v1225 != v543)
                              objc_enumerationMutation(v541);
                            v545 = *(_QWORD *)(*((_QWORD *)&v1224 + 1) + 8 * nn);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v546 = [GEOPDMerchantBrandLookupResponse alloc];
                              if ((a3 & 1) != 0)
                                v547 = -[GEOPDMerchantBrandLookupResponse initWithJSON:](v546, "initWithJSON:", v545);
                              else
                                v547 = -[GEOPDMerchantBrandLookupResponse initWithDictionary:](v546, "initWithDictionary:", v545);
                              v548 = v547;
                              -[GEOPDMerchantLookupBrandResult addMerchantBrandLookupResponse:]((uint64_t)v535, v547);

                            }
                          }
                          v542 = objc_msgSend(v541, "countByEnumeratingWithState:objects:count:", &v1224, v1232, 16);
                        }
                        while (v542);
                      }

                    }
                  }

                }
                -[GEOPDBatchMerchantLookupBrandResult addMerchantLookupBrandResult:]((uint64_t)v1129, v535);

                continue;
              }
            }
            v1165 = objc_msgSend(v1141, "countByEnumeratingWithState:objects:count:", &v1220, &v1228, 16);
            if (!v1165)
            {
LABEL_1116:

              v531 = v1073;
              break;
            }
          }
        }

        v525 = v1083;
        goto LABEL_1118;
      }
      v529 = objc_msgSend(v527, "intValue");
    }
    *(_BYTE *)&v1129->_flags |= 1u;
    v1129->_statusCode = v529;
    goto LABEL_1059;
  }
LABEL_1120:

  if (a3)
    v549 = CFSTR("childPlaceLookupByCategoryResult");
  else
    v549 = CFSTR("child_place_lookup_by_category_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v549);
  v550 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v551 = [GEOPDChildPlaceLookupByCategoryResult alloc];
    v552 = v550;
    if (v551)
      v551 = -[GEOPDChildPlaceLookupByCategoryResult init](v551, "init");

    -[GEOPDPlaceGlobalResult setChildPlaceLookupByCategoryResult:]((uint64_t)v1078, v551);
  }

  if (a3)
    v553 = CFSTR("mapsSearchHomeResult");
  else
    v553 = CFSTR("maps_search_home_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v553);
  v1039 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v554 = v1039;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v555 = [GEOPDMapsSearchHomeResult alloc];
    if (v555)
    {
      v556 = v555;
      v557 = v1039;
      v1107 = -[GEOPDMapsSearchHomeResult init](v556, "init");
      if (v1107)
      {
        if (a3)
          v558 = CFSTR("mapsSearchHomeSection");
        else
          v558 = CFSTR("maps_search_home_section");
        v1035 = v557;
        objc_msgSend(v557, "objectForKeyedSubscript:", v558);
        v1037 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v559 = v1037;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1223 = 0u;
          v1222 = 0u;
          v1221 = 0u;
          v1220 = 0u;
          objg = v1037;
          v1154 = objc_msgSend(objg, "countByEnumeratingWithState:objects:count:", &v1220, &v1228, 16);
          if (!v1154)
            goto LABEL_1256;
          v560 = CFSTR("section_type");
          v1142 = *(id *)v1221;
          if (a3)
            v560 = CFSTR("sectionType");
          v1084 = v560;
          if (a3)
            v561 = CFSTR("searchBrowseCategorySuggestionResult");
          else
            v561 = CFSTR("search_browse_category_suggestion_result");
          v1074 = v561;
          v562 = CFSTR("publisher_suggestion_result");
          v563 = CFSTR("collection_suggestion_result");
          if (a3)
          {
            v563 = CFSTR("collectionSuggestionResult");
            v562 = CFSTR("publisherSuggestionResult");
          }
          v1057 = v562;
          v1064 = v563;
          if (a3)
            v564 = CFSTR("placeSuggestionResult");
          else
            v564 = CFSTR("place_suggestion_result");
          v565 = CFSTR("place_id");
          if (a3)
            v565 = CFSTR("placeId");
          v1045 = v565;
          v566 = CFSTR("guides_locations_suggestion_result");
          if (a3)
            v566 = CFSTR("guidesLocationsSuggestionResult");
          v1048 = v566;
          v1052 = v564;
          if (a3)
            v567 = CFSTR("exploreGuidesEntry");
          else
            v567 = CFSTR("explore_guides_entry");
          v568 = CFSTR("explore_image_url_template");
          if (a3)
            v568 = CFSTR("exploreImageUrlTemplate");
          v1041 = v568;
          v1043 = v567;
          while (1)
          {
            v569 = 0;
            do
            {
              if (*(id *)v1221 != v1142)
                objc_enumerationMutation(objg);
              v570 = *(void **)(*((_QWORD *)&v1220 + 1) + 8 * v569);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v571 = [GEOPDMapsSearchHomeSection alloc];
                if (v571)
                {
                  v1166 = v570;
                  v572 = -[GEOPDMapsSearchHomeSection init](v571, "init");
                  if (v572)
                  {
                    objc_msgSend(v1166, "objectForKeyedSubscript:", v1084);
                    v573 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v574 = v573;
                      if ((objc_msgSend(v574, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
                      {
                        v575 = 0;
                      }
                      else if ((objc_msgSend(v574, "isEqualToString:", CFSTR("SEARCH_BROWSE_CATEGORY_SUGGESTION_RESULT")) & 1) != 0)
                      {
                        v575 = 1;
                      }
                      else if ((objc_msgSend(v574, "isEqualToString:", CFSTR("COLLECTION_SUGGESTION_RESULT")) & 1) != 0)
                      {
                        v575 = 2;
                      }
                      else if ((objc_msgSend(v574, "isEqualToString:", CFSTR("PUBLISHER_SUGGESTION_RESULT")) & 1) != 0)
                      {
                        v575 = 3;
                      }
                      else if ((objc_msgSend(v574, "isEqualToString:", CFSTR("PLACE_SUGGESTION_RESULT")) & 1) != 0)
                      {
                        v575 = 4;
                      }
                      else if (objc_msgSend(v574, "isEqualToString:", CFSTR("GUIDE_LOCATION_SUGGESTION_RESULT")))
                      {
                        v575 = 5;
                      }
                      else
                      {
                        v575 = 0;
                      }

LABEL_1181:
                      *(_WORD *)(v572 + 88) |= 0x100u;
                      *(_WORD *)(v572 + 88) |= 1u;
                      *(_DWORD *)(v572 + 84) = v575;
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v575 = objc_msgSend(v573, "intValue");
                        goto LABEL_1181;
                      }
                    }

                    objc_msgSend(v1166, "objectForKeyedSubscript:", CFSTR("name"));
                    v576 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v577 = (void *)objc_msgSend(v576, "copy");
                      v578 = v577;
                      *(_WORD *)(v572 + 88) |= 0x10u;
                      *(_WORD *)(v572 + 88) |= 0x100u;
                      objc_storeStrong((id *)(v572 + 40), v577);

                    }
                    objc_msgSend(v1166, "objectForKeyedSubscript:", v1074);
                    v579 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v580 = [GEOPDSearchBrowseCategorySuggestionResult alloc];
                      if (v580)
                        v581 = (void *)-[GEOPDSearchBrowseCategorySuggestionResult _initWithDictionary:isJSON:](v580, v579, a3);
                      else
                        v581 = 0;
                      v582 = v581;
                      *(_WORD *)(v572 + 88) |= 0x80u;
                      *(_WORD *)(v572 + 88) |= 0x100u;
                      objc_storeStrong((id *)(v572 + 64), v581);

                    }
                    objc_msgSend(v1166, "objectForKeyedSubscript:", v1064);
                    v583 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v584 = [GEOPDCollectionSuggestionResult alloc];
                      if (v584)
                        v585 = (void *)-[GEOPDCollectionSuggestionResult _initWithDictionary:isJSON:](v584, v583, a3);
                      else
                        v585 = 0;
                      v586 = v585;
                      *(_WORD *)(v572 + 88) |= 4u;
                      *(_WORD *)(v572 + 88) |= 0x100u;
                      objc_storeStrong((id *)(v572 + 24), v585);

                    }
                    objc_msgSend(v1166, "objectForKeyedSubscript:", v1057);
                    v587 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v588 = [GEOPDPublisherSuggestionResult alloc];
                      if (v588)
                        v589 = (void *)-[GEOPDPublisherSuggestionResult _initWithDictionary:isJSON:](v588, v587, a3);
                      else
                        v589 = 0;
                      v590 = v589;
                      *(_WORD *)(v572 + 88) |= 0x40u;
                      *(_WORD *)(v572 + 88) |= 0x100u;
                      objc_storeStrong((id *)(v572 + 56), v589);

                    }
                    objc_msgSend(v1166, "objectForKeyedSubscript:", v1052);
                    v591 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v592 = [GEOPDPlaceSuggestionResult alloc];
                      if (v592)
                      {
                        v1130 = v591;
                        v593 = -[GEOPDPlaceSuggestionResult init](v592, "init");
                        if (v593)
                        {
                          objc_msgSend(v1130, "objectForKeyedSubscript:", v1045);
                          v1093 = (id)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v1227 = 0u;
                            v1226 = 0u;
                            v1225 = 0u;
                            v1224 = 0u;
                            v594 = v1093;
                            v595 = objc_msgSend(v594, "countByEnumeratingWithState:objects:count:", &v1224, v1232, 16);
                            if (v595)
                            {
                              v596 = *(_QWORD *)v1225;
                              do
                              {
                                for (i1 = 0; i1 != v595; ++i1)
                                {
                                  if (*(_QWORD *)v1225 != v596)
                                    objc_enumerationMutation(v594);
                                  v598 = *(_QWORD *)(*((_QWORD *)&v1224 + 1) + 8 * i1);
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v599 = [GEOPDMapsIdentifier alloc];
                                    if ((a3 & 1) != 0)
                                      v600 = -[GEOPDMapsIdentifier initWithJSON:](v599, "initWithJSON:", v598);
                                    else
                                      v600 = -[GEOPDMapsIdentifier initWithDictionary:](v599, "initWithDictionary:", v598);
                                    v601 = v600;
                                    -[GEOPDPlaceSuggestionResult addPlaceId:]((uint64_t)v593, v600);

                                  }
                                }
                                v595 = objc_msgSend(v594, "countByEnumeratingWithState:objects:count:", &v1224, v1232, 16);
                              }
                              while (v595);
                            }

                          }
                        }

                      }
                      else
                      {
                        v593 = 0;
                      }
                      v602 = v593;
                      *(_WORD *)(v572 + 88) |= 0x20u;
                      *(_WORD *)(v572 + 88) |= 0x100u;
                      objc_storeStrong((id *)(v572 + 48), v593);

                    }
                    objc_msgSend(v1166, "objectForKeyedSubscript:", v1048);
                    v603 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v604 = [GEOPDGuidesLocationsSuggestionResult alloc];
                      if (v604)
                      {
                        v1131 = v603;
                        v605 = -[GEOPDGuidesLocationsSuggestionResult init](v604, "init");
                        if (v605)
                        {
                          objc_msgSend(v1131, "objectForKeyedSubscript:", CFSTR("entry"));
                          v1094 = (id)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v1227 = 0u;
                            v1226 = 0u;
                            v1225 = 0u;
                            v1224 = 0u;
                            v606 = v1094;
                            v607 = objc_msgSend(v606, "countByEnumeratingWithState:objects:count:", &v1224, v1232, 16);
                            if (v607)
                            {
                              v608 = *(_QWORD *)v1225;
                              do
                              {
                                v609 = 0;
                                do
                                {
                                  if (*(_QWORD *)v1225 != v608)
                                    objc_enumerationMutation(v606);
                                  v610 = *(void **)(*((_QWORD *)&v1224 + 1) + 8 * v609);
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v611 = [GEOPDGuidesLocationEntry alloc];
                                    if (v611)
                                      v612 = (void *)-[GEOPDGuidesLocationEntry _initWithDictionary:isJSON:]((uint64_t)v611, v610, a3);
                                    else
                                      v612 = 0;
                                    -[GEOPDGuidesLocationsSuggestionResult addEntry:](v605, v612);

                                  }
                                  ++v609;
                                }
                                while (v607 != v609);
                                v613 = objc_msgSend(v606, "countByEnumeratingWithState:objects:count:", &v1224, v1232, 16);
                                v607 = v613;
                              }
                              while (v613);
                            }

                          }
                          objc_msgSend(v1131, "objectForKeyedSubscript:", v1043);
                          v614 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v615 = [GEOPDGuidesLocationEntry alloc];
                            if (v615)
                              v616 = (void *)-[GEOPDGuidesLocationEntry _initWithDictionary:isJSON:]((uint64_t)v615, v614, a3);
                            else
                              v616 = 0;
                            v617 = v616;
                            *(_BYTE *)(v605 + 60) |= 4u;
                            *(_BYTE *)(v605 + 60) |= 0x10u;
                            objc_storeStrong((id *)(v605 + 32), v616);

                          }
                          objc_msgSend(v1131, "objectForKeyedSubscript:", v1041);
                          v618 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v619 = (void *)objc_msgSend(v618, "copy");
                            v620 = v619;
                            *(_BYTE *)(v605 + 60) |= 8u;
                            *(_BYTE *)(v605 + 60) |= 0x10u;
                            objc_storeStrong((id *)(v605 + 40), v619);

                          }
                        }

                      }
                      else
                      {
                        v605 = 0;
                      }
                      v621 = (id)v605;
                      *(_WORD *)(v572 + 88) |= 8u;
                      *(_WORD *)(v572 + 88) |= 0x100u;
                      objc_storeStrong((id *)(v572 + 32), (id)v605);

                    }
                  }

                }
                else
                {
                  v572 = 0;
                }
                -[GEOPDMapsSearchHomeResult addMapsSearchHomeSection:]((uint64_t)v1107, (void *)v572);

              }
              ++v569;
            }
            while (v569 != v1154);
            v622 = objc_msgSend(objg, "countByEnumeratingWithState:objects:count:", &v1220, &v1228, 16);
            v1154 = v622;
            if (!v622)
            {
LABEL_1256:

              v559 = v1037;
              break;
            }
          }
        }

        v557 = v1035;
      }

    }
    else
    {
      v1107 = 0;
    }
    -[GEOPDPlaceGlobalResult setMapsSearchHomeResult:]((uint64_t)v1078, v1107);

    v554 = v1039;
  }

  if (a3)
    v623 = CFSTR("collectionSuggestionResult");
  else
    v623 = CFSTR("collection_suggestion_result");
  v1155 = v623;
  objc_msgSend(v1099, "objectForKeyedSubscript:");
  v624 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v625 = [GEOPDCollectionSuggestionResult alloc];
    if (v625)
      v626 = (void *)-[GEOPDCollectionSuggestionResult _initWithDictionary:isJSON:](v625, v624, a3);
    else
      v626 = 0;
    -[GEOPDPlaceGlobalResult setCollectionSuggestionResult:]((uint64_t)v1078, v626);

  }
  if (a3)
    v627 = CFSTR("publisherViewResult");
  else
    v627 = CFSTR("publisher_view_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v627);
  v628 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v629 = [GEOPDPublisherViewResult alloc];
    if (v629)
    {
      v630 = v628;
      v629 = -[GEOPDPublisherViewResult init](v629, "init");
      if (v629)
      {
        if (a3)
          v631 = CFSTR("resultFilter");
        else
          v631 = CFSTR("result_filter");
        objc_msgSend(v630, "objectForKeyedSubscript:", v631);
        v632 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1227 = 0u;
          v1226 = 0u;
          v1225 = 0u;
          v1224 = 0u;
          v633 = v632;
          v634 = objc_msgSend(v633, "countByEnumeratingWithState:objects:count:", &v1224, v1232, 16);
          if (v634)
          {
            v635 = *(_QWORD *)v1225;
            do
            {
              v636 = 0;
              do
              {
                if (*(_QWORD *)v1225 != v635)
                  objc_enumerationMutation(v633);
                v637 = *(void **)(*((_QWORD *)&v1224 + 1) + 8 * v636);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v638 = [GEOPDPublisherViewResultFilter alloc];
                  if (v638)
                    v639 = (void *)-[GEOPDPublisherViewResultFilter _initWithDictionary:isJSON:](v638, v637, a3);
                  else
                    v639 = 0;
                  -[GEOPDPublisherViewResult addResultFilter:]((uint64_t)v629, v639);

                }
                ++v636;
              }
              while (v634 != v636);
              v640 = objc_msgSend(v633, "countByEnumeratingWithState:objects:count:", &v1224, v1232, 16);
              v634 = v640;
            }
            while (v640);
          }

        }
        if (a3)
          v641 = CFSTR("collectionId");
        else
          v641 = CFSTR("collection_id");
        objc_msgSend(v630, "objectForKeyedSubscript:", v641);
        v642 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1223 = 0u;
          v1222 = 0u;
          v1221 = 0u;
          v1220 = 0u;
          v643 = v642;
          v644 = objc_msgSend(v643, "countByEnumeratingWithState:objects:count:", &v1220, &v1228, 16);
          if (v644)
          {
            v645 = *(_QWORD *)v1221;
            do
            {
              for (i2 = 0; i2 != v644; ++i2)
              {
                if (*(_QWORD *)v1221 != v645)
                  objc_enumerationMutation(v643);
                v647 = *(_QWORD *)(*((_QWORD *)&v1220 + 1) + 8 * i2);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v648 = [GEOPDMapsIdentifier alloc];
                  if ((a3 & 1) != 0)
                    v649 = -[GEOPDMapsIdentifier initWithJSON:](v648, "initWithJSON:", v647);
                  else
                    v649 = -[GEOPDMapsIdentifier initWithDictionary:](v648, "initWithDictionary:", v647);
                  v650 = v649;
                  -[GEOPDPublisherViewResult addCollectionId:]((uint64_t)v629, v649);

                }
              }
              v644 = objc_msgSend(v643, "countByEnumeratingWithState:objects:count:", &v1220, &v1228, 16);
            }
            while (v644);
          }

        }
      }

    }
    -[GEOPDPlaceGlobalResult setPublisherViewResult:]((uint64_t)v1078, v629);

  }
  if (a3)
    v651 = CFSTR("allCollectionsViewResult");
  else
    v651 = CFSTR("all_collections_view_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v651);
  v652 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v653 = [GEOPDAllCollectionsViewResult alloc];
    if (v653)
    {
      v654 = v652;
      v653 = -[GEOPDAllCollectionsViewResult init](v653, "init");
      if (v653)
      {
        if (a3)
          v655 = CFSTR("publisherSuggestionResult");
        else
          v655 = CFSTR("publisher_suggestion_result");
        objc_msgSend(v654, "objectForKeyedSubscript:", v655);
        v656 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v657 = [GEOPDPublisherSuggestionResult alloc];
          if (v657)
            v658 = (void *)-[GEOPDPublisherSuggestionResult _initWithDictionary:isJSON:](v657, v656, a3);
          else
            v658 = 0;
          -[GEOPDAllCollectionsViewResult setPublisherSuggestionResult:]((uint64_t)v653, v658);

        }
        if (a3)
          v659 = CFSTR("resultFilter");
        else
          v659 = CFSTR("result_filter");
        objc_msgSend(v654, "objectForKeyedSubscript:", v659);
        v660 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1227 = 0u;
          v1226 = 0u;
          v1225 = 0u;
          v1224 = 0u;
          v661 = v660;
          v662 = objc_msgSend(v661, "countByEnumeratingWithState:objects:count:", &v1224, v1232, 16);
          if (v662)
          {
            v663 = *(_QWORD *)v1225;
            do
            {
              v664 = 0;
              do
              {
                if (*(_QWORD *)v1225 != v663)
                  objc_enumerationMutation(v661);
                v665 = *(void **)(*((_QWORD *)&v1224 + 1) + 8 * v664);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v666 = [GEOPDAllCollectionsViewResultFilter alloc];
                  if (v666)
                    v667 = (void *)-[GEOPDAllCollectionsViewResultFilter _initWithDictionary:isJSON:](v666, v665, a3);
                  else
                    v667 = 0;
                  -[GEOPDAllCollectionsViewResult addResultFilter:]((uint64_t)v653, v667);

                }
                ++v664;
              }
              while (v662 != v664);
              v668 = objc_msgSend(v661, "countByEnumeratingWithState:objects:count:", &v1224, v1232, 16);
              v662 = v668;
            }
            while (v668);
          }

        }
        if (a3)
          v669 = CFSTR("collectionId");
        else
          v669 = CFSTR("collection_id");
        objc_msgSend(v654, "objectForKeyedSubscript:", v669);
        v670 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1223 = 0u;
          v1222 = 0u;
          v1221 = 0u;
          v1220 = 0u;
          v671 = v670;
          v672 = objc_msgSend(v671, "countByEnumeratingWithState:objects:count:", &v1220, &v1228, 16);
          if (v672)
          {
            v673 = *(_QWORD *)v1221;
            do
            {
              for (i3 = 0; i3 != v672; ++i3)
              {
                if (*(_QWORD *)v1221 != v673)
                  objc_enumerationMutation(v671);
                v675 = *(_QWORD *)(*((_QWORD *)&v1220 + 1) + 8 * i3);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v676 = [GEOPDMapsIdentifier alloc];
                  if ((a3 & 1) != 0)
                    v677 = -[GEOPDMapsIdentifier initWithJSON:](v676, "initWithJSON:", v675);
                  else
                    v677 = -[GEOPDMapsIdentifier initWithDictionary:](v676, "initWithDictionary:", v675);
                  v678 = v677;
                  -[GEOPDAllCollectionsViewResult addCollectionId:]((uint64_t)v653, v677);

                }
              }
              v672 = objc_msgSend(v671, "countByEnumeratingWithState:objects:count:", &v1220, &v1228, 16);
            }
            while (v672);
          }

        }
      }

    }
    -[GEOPDPlaceGlobalResult setAllCollectionsViewResult:]((uint64_t)v1078, v653);

  }
  if (a3)
    v679 = CFSTR("airportEntityPlaceLookupResult");
  else
    v679 = CFSTR("airport_entity_place_lookup_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v679);
  v680 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v681 = [GEOPDAirportEntityPlaceLookupResult alloc];
    v682 = v680;
    if (v681)
      v681 = -[GEOPDAirportEntityPlaceLookupResult init](v681, "init");

    -[GEOPDPlaceGlobalResult setAirportEntityPlaceLookupResult:]((uint64_t)v1078, v681);
  }

  if (a3)
    v683 = CFSTR("territoryLookupResult");
  else
    v683 = CFSTR("territory_lookup_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v683);
  v684 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v685 = [GEOPDTerritoryLookupResult alloc];
    v686 = v684;
    if (v685)
      v685 = -[GEOPDTerritoryLookupResult init](v685, "init");

    -[GEOPDPlaceGlobalResult setTerritoryLookupResult:]((uint64_t)v1078, v685);
  }

  if (a3)
    v687 = CFSTR("mapsHomeResult");
  else
    v687 = CFSTR("maps_home_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v687);
  v1108 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v688 = v1108;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v689 = [GEOPDMapsHomeResult alloc];
    if (v689)
    {
      v690 = v689;
      v691 = v1108;
      v1167 = -[GEOPDMapsHomeResult init](v690, "init");
      if (v1167)
      {
        if (a3)
          v692 = CFSTR("mapsHomeSection");
        else
          v692 = CFSTR("maps_home_section");
        objc_msgSend(v691, "objectForKeyedSubscript:", v692);
        v1095 = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v693 = v1095;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1231 = 0u;
          v1230 = 0u;
          v1229 = 0u;
          v1228 = 0u;
          v694 = v1095;
          v695 = objc_msgSend(v694, "countByEnumeratingWithState:objects:count:", &v1228, v1232, 16);
          if (!v695)
            goto LABEL_1429;
          v696 = CFSTR("section_type");
          v697 = *(_QWORD *)v1229;
          if (a3)
            v696 = CFSTR("sectionType");
          v1143 = v696;
          if (a3)
            v698 = CFSTR("exploreGuidesEntry");
          else
            v698 = CFSTR("explore_guides_entry");
          v699 = CFSTR("explore_image_url_template");
          if (a3)
            v699 = CFSTR("exploreImageUrlTemplate");
          objh = v699;
          v1132 = v698;
          while (1)
          {
            v700 = 0;
            do
            {
              if (*(_QWORD *)v1229 != v697)
                objc_enumerationMutation(v694);
              v701 = *(void **)(*((_QWORD *)&v1228 + 1) + 8 * v700);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v702 = [GEOPDMapsHomeSection alloc];
                if (v702)
                {
                  v703 = v701;
                  v702 = -[GEOPDMapsHomeSection init](v702, "init");
                  if (v702)
                  {
                    objc_msgSend(v703, "objectForKeyedSubscript:", v1143);
                    v704 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v705 = v704;
                      if ((objc_msgSend(v705, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
                        v706 = 0;
                      else
                        v706 = objc_msgSend(v705, "isEqualToString:", CFSTR("CURATED_GUIDES"));

LABEL_1408:
                      *(_BYTE *)&v702->_flags |= 0x40u;
                      *(_BYTE *)&v702->_flags |= 1u;
                      v702->_sectionType = v706;
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v706 = objc_msgSend(v704, "intValue");
                        goto LABEL_1408;
                      }
                    }

                    objc_msgSend(v703, "objectForKeyedSubscript:", CFSTR("name"));
                    v707 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v708 = (void *)objc_msgSend(v707, "copy");
                      v709 = v708;
                      *(_BYTE *)&v702->_flags |= 0x20u;
                      *(_BYTE *)&v702->_flags |= 0x40u;
                      objc_storeStrong((id *)&v702->_name, v708);

                    }
                    objc_msgSend(v703, "objectForKeyedSubscript:", v1155);
                    v710 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v711 = [GEOPDCollectionSuggestionResult alloc];
                      if (v711)
                        v712 = (void *)-[GEOPDCollectionSuggestionResult _initWithDictionary:isJSON:](v711, v710, a3);
                      else
                        v712 = 0;
                      v713 = v712;
                      *(_BYTE *)&v702->_flags |= 4u;
                      *(_BYTE *)&v702->_flags |= 0x40u;
                      objc_storeStrong((id *)&v702->_collectionSuggestionResult, v712);

                    }
                    objc_msgSend(v703, "objectForKeyedSubscript:", v1132);
                    v714 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v715 = [GEOPDGuidesLocationEntry alloc];
                      if (v715)
                        v716 = (void *)-[GEOPDGuidesLocationEntry _initWithDictionary:isJSON:]((uint64_t)v715, v714, a3);
                      else
                        v716 = 0;
                      v717 = v716;
                      *(_BYTE *)&v702->_flags |= 8u;
                      *(_BYTE *)&v702->_flags |= 0x40u;
                      objc_storeStrong((id *)&v702->_exploreGuidesEntry, v716);

                    }
                    objc_msgSend(v703, "objectForKeyedSubscript:", objh);
                    v718 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v719 = (void *)objc_msgSend(v718, "copy");
                      v720 = v719;
                      *(_BYTE *)&v702->_flags |= 0x10u;
                      *(_BYTE *)&v702->_flags |= 0x40u;
                      objc_storeStrong((id *)&v702->_exploreImageUrlTemplate, v719);

                    }
                  }

                }
                -[GEOPDMapsHomeResult addMapsHomeSection:]((uint64_t)v1167, v702);

              }
              ++v700;
            }
            while (v695 != v700);
            v721 = objc_msgSend(v694, "countByEnumeratingWithState:objects:count:", &v1228, v1232, 16);
            v695 = v721;
            if (!v721)
            {
LABEL_1429:

              v693 = v1095;
              break;
            }
          }
        }

      }
    }
    else
    {
      v1167 = 0;
    }
    -[GEOPDPlaceGlobalResult setMapsHomeResult:]((uint64_t)v1078, v1167);

    v688 = v1108;
  }

  if (a3)
    v722 = CFSTR("allGuidesLocationsViewresult");
  else
    v722 = CFSTR("all_guides_locations_viewresult");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v722);
  v1075 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v723 = v1075;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v724 = [GEOPDAllGuidesLocationsViewResult alloc];
    if (v724)
    {
      v725 = v724;
      v726 = v1075;
      v1133 = -[GEOPDAllGuidesLocationsViewResult init](v725, "init");
      if (v1133)
      {
        v1065 = v726;
        objc_msgSend(v726, "objectForKeyedSubscript:", CFSTR("header"));
        v727 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v728 = (void *)objc_msgSend(v727, "copy");
          -[GEOPDAllGuidesLocationsViewResult setHeader:]((uint64_t)v1133, v728);

        }
        if (a3)
          v729 = CFSTR("allGuidesLocationsSection");
        else
          v729 = CFSTR("all_guides_locations_section");
        objc_msgSend(v1065, "objectForKeyedSubscript:", v729);
        v1058 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v730 = v1058;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1223 = 0u;
          v1222 = 0u;
          v1221 = 0u;
          v1220 = 0u;
          v1144 = v1058;
          v1168 = objc_msgSend(v1144, "countByEnumeratingWithState:objects:count:", &v1220, &v1228, 16);
          if (!v1168)
            goto LABEL_1511;
          v1156 = *(_QWORD *)v1221;
          if (a3)
            v731 = CFSTR("sectionHeader");
          else
            v731 = CFSTR("section_header");
          v732 = CFSTR("section_header_type");
          if (a3)
            v732 = CFSTR("sectionHeaderType");
          v1109 = v732;
          obji = v731;
          if (a3)
            v733 = CFSTR("headerString");
          else
            v733 = CFSTR("header_string");
          v734 = CFSTR("place_id");
          if (a3)
            v734 = CFSTR("placeId");
          v1085 = v734;
          v1096 = v733;
          while (1)
          {
            v735 = 0;
            do
            {
              if (*(_QWORD *)v1221 != v1156)
                objc_enumerationMutation(v1144);
              v736 = *(void **)(*((_QWORD *)&v1220 + 1) + 8 * v735);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v737 = [GEOPDAllGuidesLocationsSection alloc];
                if (v737)
                {
                  v738 = v736;
                  v739 = -[GEOPDAllGuidesLocationsSection init](v737, "init");
                  if (v739)
                  {
                    objc_msgSend(v738, "objectForKeyedSubscript:", obji);
                    v740 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v741 = [GEOPDAllGuidesLocationsSectionHeader alloc];
                      if (v741)
                      {
                        v742 = v740;
                        v743 = -[GEOPDAllGuidesLocationsSectionHeader init](v741, "init");
                        if (v743)
                        {
                          objc_msgSend(v742, "objectForKeyedSubscript:", v1109);
                          v744 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v745 = v744;
                            if ((objc_msgSend(v745, "isEqualToString:", CFSTR("ALL_GUIDES_LOCATIONS_SECTION_HEADER_TYPE_UNKNOWN")) & 1) != 0)
                            {
                              v746 = 0;
                            }
                            else if ((objc_msgSend(v745, "isEqualToString:", CFSTR("ALL_GUIDES_LOCATIONS_SECTION_HEADER_TYPE_STRING")) & 1) != 0)
                            {
                              v746 = 1;
                            }
                            else if (objc_msgSend(v745, "isEqualToString:", CFSTR("ALL_GUIDES_LOCATIONS_SECTION_HEADER_TYPE_PLACE")))
                            {
                              v746 = 2;
                            }
                            else
                            {
                              v746 = 0;
                            }

LABEL_1477:
                            *(_BYTE *)(v743 + 56) |= 0x10u;
                            *(_BYTE *)(v743 + 56) |= 1u;
                            *(_DWORD *)(v743 + 52) = v746;
                          }
                          else
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v746 = objc_msgSend(v744, "intValue");
                              goto LABEL_1477;
                            }
                          }

                          objc_msgSend(v742, "objectForKeyedSubscript:", v1096);
                          v747 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v748 = (void *)objc_msgSend(v747, "copy");
                            v749 = v748;
                            *(_BYTE *)(v743 + 56) |= 4u;
                            *(_BYTE *)(v743 + 56) |= 0x10u;
                            objc_storeStrong((id *)(v743 + 24), v748);

                          }
                          objc_msgSend(v742, "objectForKeyedSubscript:", v1085);
                          v750 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v751 = [GEOPDMapsIdentifier alloc];
                            if ((a3 & 1) != 0)
                              v752 = -[GEOPDMapsIdentifier initWithJSON:](v751, "initWithJSON:", v750);
                            else
                              v752 = -[GEOPDMapsIdentifier initWithDictionary:](v751, "initWithDictionary:", v750);
                            v753 = v752;
                            v754 = v752;
                            *(_BYTE *)(v743 + 56) |= 8u;
                            *(_BYTE *)(v743 + 56) |= 0x10u;
                            objc_storeStrong((id *)(v743 + 32), v753);

                          }
                        }

                      }
                      else
                      {
                        v743 = 0;
                      }
                      v755 = (id)v743;
                      *(_BYTE *)(v739 + 52) |= 4u;
                      *(_BYTE *)(v739 + 52) |= 8u;
                      objc_storeStrong((id *)(v739 + 32), (id)v743);

                    }
                    objc_msgSend(v738, "objectForKeyedSubscript:", CFSTR("entry"));
                    v756 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v1227 = 0u;
                      v1226 = 0u;
                      v1225 = 0u;
                      v1224 = 0u;
                      v757 = v756;
                      v758 = objc_msgSend(v757, "countByEnumeratingWithState:objects:count:", &v1224, v1232, 16);
                      if (v758)
                      {
                        v759 = *(_QWORD *)v1225;
                        do
                        {
                          v760 = 0;
                          do
                          {
                            if (*(_QWORD *)v1225 != v759)
                              objc_enumerationMutation(v757);
                            v761 = *(void **)(*((_QWORD *)&v1224 + 1) + 8 * v760);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v762 = [GEOPDGuidesLocationEntry alloc];
                              if (v762)
                                v763 = (void *)-[GEOPDGuidesLocationEntry _initWithDictionary:isJSON:]((uint64_t)v762, v761, a3);
                              else
                                v763 = 0;
                              -[GEOPDAllGuidesLocationsSection addEntry:](v739, v763);

                            }
                            ++v760;
                          }
                          while (v758 != v760);
                          v764 = objc_msgSend(v757, "countByEnumeratingWithState:objects:count:", &v1224, v1232, 16);
                          v758 = v764;
                        }
                        while (v764);
                      }

                    }
                  }

                }
                else
                {
                  v739 = 0;
                }
                -[GEOPDAllGuidesLocationsViewResult addAllGuidesLocationsSection:]((uint64_t)v1133, (void *)v739);

              }
              ++v735;
            }
            while (v735 != v1168);
            v765 = objc_msgSend(v1144, "countByEnumeratingWithState:objects:count:", &v1220, &v1228, 16);
            v1168 = v765;
            if (!v765)
            {
LABEL_1511:

              v730 = v1058;
              break;
            }
          }
        }

        v726 = v1065;
      }

    }
    else
    {
      v1133 = 0;
    }
    -[GEOPDPlaceGlobalResult setAllGuidesLocationsViewresult:]((uint64_t)v1078, v1133);

    v723 = v1075;
  }

  if (a3)
    v766 = CFSTR("guidesHomeResult");
  else
    v766 = CFSTR("guides_home_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v766);
  v1059 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v767 = v1059;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v768 = [GEOPDGuidesHomeResult alloc];
    if (v768)
    {
      v769 = v768;
      v770 = v1059;
      objj = -[GEOPDGuidesHomeResult init](v769, "init");
      if (objj)
      {
        if (a3)
          v771 = CFSTR("featuredGuides");
        else
          v771 = CFSTR("featured_guides");
        objc_msgSend(v770, "objectForKeyedSubscript:", v771);
        v772 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v773 = [GEOPDGuidesHomeFixedSection alloc];
          if (v773)
            v774 = (void *)-[GEOPDGuidesHomeFixedSection _initWithDictionary:isJSON:](v773, v772, a3);
          else
            v774 = 0;
          -[GEOPDGuidesHomeResult setFeaturedGuides:]((uint64_t)objj, v774);

        }
        objc_msgSend(v770, "objectForKeyedSubscript:", CFSTR("filters"));
        v775 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v776 = [GEOPDGuidesHomeFixedSection alloc];
          if (v776)
            v777 = (void *)-[GEOPDGuidesHomeFixedSection _initWithDictionary:isJSON:](v776, v775, a3);
          else
            v777 = 0;
          -[GEOPDGuidesHomeResult setFilters:]((uint64_t)objj, v777);

        }
        if (a3)
          v778 = CFSTR("filteredGuides");
        else
          v778 = CFSTR("filtered_guides");
        objc_msgSend(v770, "objectForKeyedSubscript:", v778);
        v779 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v780 = [GEOPDGuidesHomeFixedSection alloc];
          if (v780)
            v781 = (void *)-[GEOPDGuidesHomeFixedSection _initWithDictionary:isJSON:](v780, v779, a3);
          else
            v781 = 0;
          -[GEOPDGuidesHomeResult setFilteredGuides:]((uint64_t)objj, v781);

        }
        if (a3)
          v782 = CFSTR("repeatableSection");
        else
          v782 = CFSTR("repeatable_section");
        objc_msgSend(v770, "objectForKeyedSubscript:", v782);
        v1049 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v783 = v1049;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1206 = 0u;
          v1207 = 0u;
          v1204 = 0u;
          v1205 = 0u;
          v1134 = v1049;
          v1157 = objc_msgSend(v1134, "countByEnumeratingWithState:objects:count:", &v1204, &v1220, 16);
          if (!v1157)
            goto LABEL_1643;
          v784 = CFSTR("section_type");
          v1145 = *(id *)v1205;
          if (a3)
            v784 = CFSTR("sectionType");
          v1110 = v784;
          v785 = CFSTR("carousel_guide_id");
          if (a3)
            v785 = CFSTR("carouselGuideId");
          v1097 = v785;
          if (a3)
            v786 = CFSTR("publisherId");
          else
            v786 = CFSTR("publisher_id");
          v1086 = v786;
          if (a3)
            v787 = CFSTR("guidesLocationEntry");
          else
            v787 = CFSTR("guides_location_entry");
          v788 = CFSTR("content_type");
          if (a3)
            v788 = CFSTR("contentType");
          v1066 = v788;
          v1076 = v787;
          while (1)
          {
            v789 = 0;
            do
            {
              if (*(id *)v1205 != v1145)
                objc_enumerationMutation(v1134);
              v790 = *(void **)(*((_QWORD *)&v1204 + 1) + 8 * v789);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v791 = [GEOPDGuidesHomeRepeatableSection alloc];
                if (v791)
                {
                  v1169 = v790;
                  v792 = -[GEOPDGuidesHomeRepeatableSection init](v791, "init");
                  if (v792)
                  {
                    objc_msgSend(v1169, "objectForKeyedSubscript:", v1110);
                    v793 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v794 = v793;
                      if ((objc_msgSend(v794, "isEqualToString:", CFSTR("GUIDES_HOME_REPEATABLE_SECTION_TYPE_UNKNOWN")) & 1) != 0)
                      {
                        v795 = 0;
                      }
                      else if ((objc_msgSend(v794, "isEqualToString:", CFSTR("GUIDES_HOME_REPEATABLE_SECTION_TYPE_GUIDES_HORIZONTAL_CAROUSEL")) & 1) != 0)
                      {
                        v795 = 1;
                      }
                      else if ((objc_msgSend(v794, "isEqualToString:", CFSTR("GUIDES_HOME_REPEATABLE_SECTION_TYPE_PUBLISHER")) & 1) != 0)
                      {
                        v795 = 2;
                      }
                      else if ((objc_msgSend(v794, "isEqualToString:", CFSTR("GUIDES_HOME_REPEATABLE_SECTION_TYPE_GUIDES_VERTICAL_CAROUSEL")) & 1) != 0)
                      {
                        v795 = 3;
                      }
                      else if (objc_msgSend(v794, "isEqualToString:", CFSTR("GUIDES_HOME_REPEATABLE_SECTION_TYPE_LOCATIONS")))
                      {
                        v795 = 4;
                      }
                      else
                      {
                        v795 = 0;
                      }

LABEL_1578:
                      *(_BYTE *)(v792 + 76) |= 0x80u;
                      *(_BYTE *)(v792 + 76) |= 2u;
                      *(_DWORD *)(v792 + 72) = v795;
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v795 = objc_msgSend(v793, "intValue");
                        goto LABEL_1578;
                      }
                    }

                    objc_msgSend(v1169, "objectForKeyedSubscript:", CFSTR("name"));
                    v796 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v797 = (void *)objc_msgSend(v796, "copy");
                      v798 = v797;
                      *(_BYTE *)(v792 + 76) |= 0x20u;
                      *(_BYTE *)(v792 + 76) |= 0x80u;
                      objc_storeStrong((id *)(v792 + 40), v797);

                    }
                    objc_msgSend(v1169, "objectForKeyedSubscript:", v1097);
                    v799 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v1219 = 0u;
                      v1218 = 0u;
                      v1217 = 0u;
                      v1216 = 0u;
                      v800 = v799;
                      v801 = objc_msgSend(v800, "countByEnumeratingWithState:objects:count:", &v1216, v1232, 16);
                      if (v801)
                      {
                        v802 = *(_QWORD *)v1217;
                        do
                        {
                          for (i4 = 0; i4 != v801; ++i4)
                          {
                            if (*(_QWORD *)v1217 != v802)
                              objc_enumerationMutation(v800);
                            v804 = *(_QWORD *)(*((_QWORD *)&v1216 + 1) + 8 * i4);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v805 = [GEOPDMapsIdentifier alloc];
                              if ((a3 & 1) != 0)
                                v806 = -[GEOPDMapsIdentifier initWithJSON:](v805, "initWithJSON:", v804);
                              else
                                v806 = -[GEOPDMapsIdentifier initWithDictionary:](v805, "initWithDictionary:", v804);
                              v807 = v806;
                              -[GEOPDGuidesHomeRepeatableSection addCarouselGuideId:](v792, v806);

                            }
                          }
                          v801 = objc_msgSend(v800, "countByEnumeratingWithState:objects:count:", &v1216, v1232, 16);
                        }
                        while (v801);
                      }

                    }
                    objc_msgSend(v1169, "objectForKeyedSubscript:", v1086);
                    v808 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v1215 = 0u;
                      v1214 = 0u;
                      v1213 = 0u;
                      v1212 = 0u;
                      v809 = v808;
                      v810 = objc_msgSend(v809, "countByEnumeratingWithState:objects:count:", &v1212, &v1228, 16);
                      if (v810)
                      {
                        v811 = *(_QWORD *)v1213;
                        do
                        {
                          for (i5 = 0; i5 != v810; ++i5)
                          {
                            if (*(_QWORD *)v1213 != v811)
                              objc_enumerationMutation(v809);
                            v813 = *(_QWORD *)(*((_QWORD *)&v1212 + 1) + 8 * i5);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v814 = [GEOPDMapsIdentifier alloc];
                              if ((a3 & 1) != 0)
                                v815 = -[GEOPDMapsIdentifier initWithJSON:](v814, "initWithJSON:", v813);
                              else
                                v815 = -[GEOPDMapsIdentifier initWithDictionary:](v814, "initWithDictionary:", v813);
                              v816 = v815;
                              -[GEOPDGuidesHomeRepeatableSection addPublisherId:](v792, v815);

                            }
                          }
                          v810 = objc_msgSend(v809, "countByEnumeratingWithState:objects:count:", &v1212, &v1228, 16);
                        }
                        while (v810);
                      }

                    }
                    objc_msgSend(v1169, "objectForKeyedSubscript:", v1076);
                    v817 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v1211 = 0u;
                      v1209 = 0u;
                      v1210 = 0u;
                      v1208 = 0u;
                      v818 = v817;
                      v819 = objc_msgSend(v818, "countByEnumeratingWithState:objects:count:", &v1208, &v1224, 16);
                      if (v819)
                      {
                        v820 = *(_QWORD *)v1209;
                        do
                        {
                          v821 = 0;
                          do
                          {
                            if (*(_QWORD *)v1209 != v820)
                              objc_enumerationMutation(v818);
                            v822 = *(void **)(*((_QWORD *)&v1208 + 1) + 8 * v821);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v823 = [GEOPDGuidesLocationEntry alloc];
                              if (v823)
                                v824 = (void *)-[GEOPDGuidesLocationEntry _initWithDictionary:isJSON:]((uint64_t)v823, v822, a3);
                              else
                                v824 = 0;
                              -[GEOPDGuidesHomeRepeatableSection addGuidesLocationEntry:](v792, v824);

                            }
                            ++v821;
                          }
                          while (v819 != v821);
                          v825 = objc_msgSend(v818, "countByEnumeratingWithState:objects:count:", &v1208, &v1224, 16);
                          v819 = v825;
                        }
                        while (v825);
                      }

                    }
                    objc_msgSend(v1169, "objectForKeyedSubscript:", v1066);
                    v826 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v827 = v826;
                      if ((objc_msgSend(v827, "isEqualToString:", CFSTR("GUIDES_HOME_REPEATABLE_SECTION_CONTENT_TYPE_UNKNOWN")) & 1) != 0)
                      {
                        v828 = 0;
                      }
                      else if ((objc_msgSend(v827, "isEqualToString:", CFSTR("GUIDES_HOME_REPEATABLE_SECTION_CONTENT_TYPE_EDITORS_PICKS_GUIDES")) & 1) != 0)
                      {
                        v828 = 1;
                      }
                      else if (objc_msgSend(v827, "isEqualToString:", CFSTR("GUIDES_HOME_REPEATABLE_SECTION_CONTENT_TYPE_EDITORIAL_GUIDES")))
                      {
                        v828 = 2;
                      }
                      else
                      {
                        v828 = 0;
                      }

LABEL_1635:
                      *(_BYTE *)(v792 + 76) |= 0x80u;
                      *(_BYTE *)(v792 + 76) |= 1u;
                      *(_DWORD *)(v792 + 68) = v828;
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v828 = objc_msgSend(v826, "intValue");
                        goto LABEL_1635;
                      }
                    }

                  }
                }
                else
                {
                  v792 = 0;
                }
                -[GEOPDGuidesHomeResult addRepeatableSection:]((uint64_t)objj, (void *)v792);

              }
              ++v789;
            }
            while (v789 != v1157);
            v829 = objc_msgSend(v1134, "countByEnumeratingWithState:objects:count:", &v1204, &v1220, 16);
            v1157 = v829;
            if (!v829)
            {
LABEL_1643:

              v783 = v1049;
              break;
            }
          }
        }

      }
    }
    else
    {
      objj = 0;
    }
    -[GEOPDPlaceGlobalResult setGuidesHomeResult:]((uint64_t)v1078, objj);

    v767 = v1059;
  }

  if (a3)
    v830 = CFSTR("extendedGeoLookupResult");
  else
    v830 = CFSTR("extended_geo_lookup_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v830);
  v831 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_1678;
  v832 = [GEOPDExtendedGeoLookupResult alloc];
  if (v832)
  {
    v833 = v831;
    v832 = -[GEOPDExtendedGeoLookupResult init](v832, "init");
    if (!v832)
    {
LABEL_1676:

      goto LABEL_1677;
    }
    if (a3)
      v834 = CFSTR("primaryFeatureMatched");
    else
      v834 = CFSTR("primary_feature_matched");
    objc_msgSend(v833, "objectForKeyedSubscript:", v834);
    v835 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v836 = objc_msgSend(v835, "BOOLValue");
      *(_BYTE *)&v832->_flags |= 2u;
      v832->_primaryFeatureMatched = v836;
    }

    if (a3)
      v837 = CFSTR("dataSourceId");
    else
      v837 = CFSTR("data_source_id");
    objc_msgSend(v833, "objectForKeyedSubscript:", v837);
    v838 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v839 = (void *)objc_msgSend(v838, "copy");
      -[GEOPDExtendedGeoLookupResult setDataSourceId:]((uint64_t)v832, v839);

    }
    objc_msgSend(v833, "objectForKeyedSubscript:", CFSTR("status"));
    v840 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v841 = v840;
      if ((objc_msgSend(v841, "isEqualToString:", CFSTR("EXTENDED_GEO_LOOKUP_RESULTS_STATUS_UNDEFINED")) & 1) != 0)
      {
        v842 = 0;
      }
      else if ((objc_msgSend(v841, "isEqualToString:", CFSTR("EXTENDED_GEO_LOOKUP_RESULTS_STATUS_SUCCESS")) & 1) != 0)
      {
        v842 = 1;
      }
      else if (objc_msgSend(v841, "isEqualToString:", CFSTR("EXTENDED_GEO_LOOKUP_RESULTS_STATUS_NO_CACHE_MATCH")))
      {
        v842 = 2;
      }
      else
      {
        v842 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_1675:

        goto LABEL_1676;
      }
      v842 = objc_msgSend(v840, "intValue");
    }
    *(_BYTE *)&v832->_flags |= 1u;
    v832->_status = v842;
    goto LABEL_1675;
  }
LABEL_1677:
  -[GEOPDPlaceGlobalResult setExtendedGeoLookupResult:]((uint64_t)v1078, v832);

LABEL_1678:
  if (a3)
    v843 = CFSTR("queryUnderstandingResult");
  else
    v843 = CFSTR("query_understanding_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v843);
  v1030 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v844 = v1030;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v845 = [GEOPDQueryUnderstandingResult alloc];
    if (v845)
    {
      v846 = v845;
      v847 = v1030;
      v1158 = -[GEOPDQueryUnderstandingResult init](v846, "init");
      if (v1158)
      {
        if (a3)
          v848 = CFSTR("queryIntent");
        else
          v848 = CFSTR("query_intent");
        v1020 = v847;
        objc_msgSend(v847, "objectForKeyedSubscript:", v848);
        v849 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1174 = 0u;
          v1175 = 0u;
          v1172 = 0u;
          v1173 = 0u;
          v850 = v849;
          v851 = objc_msgSend(v850, "countByEnumeratingWithState:objects:count:", &v1172, &v1204, 16);
          if (v851)
          {
            v852 = *(_QWORD *)v1173;
            do
            {
              v853 = 0;
              do
              {
                if (*(_QWORD *)v1173 != v852)
                  objc_enumerationMutation(v850);
                v854 = *(void **)(*((_QWORD *)&v1172 + 1) + 8 * v853);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v855 = [GEOPDSearchQueryIntent alloc];
                  if (v855)
                    v856 = (void *)-[GEOPDSearchQueryIntent _initWithDictionary:isJSON:]((uint64_t)v855, v854, a3);
                  else
                    v856 = 0;
                  -[GEOPDQueryUnderstandingResult addQueryIntent:]((uint64_t)v1158, v856);

                }
                ++v853;
              }
              while (v851 != v853);
              v857 = objc_msgSend(v850, "countByEnumeratingWithState:objects:count:", &v1172, &v1204, 16);
              v851 = v857;
            }
            while (v857);
          }

        }
        if (a3)
          v858 = CFSTR("taxonomyResult");
        else
          v858 = CFSTR("taxonomy_result");
        objc_msgSend(v1020, "objectForKeyedSubscript:", v858);
        v1021 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v859 = [GEOPDQueryUnderstandingTaxonomyResult alloc];
          if (v859)
          {
            v1016 = v1021;
            v1022 = -[GEOPDQueryUnderstandingTaxonomyResult init](v859, "init");
            if (v1022)
            {
              if (a3)
                v860 = CFSTR("resultItem");
              else
                v860 = CFSTR("result_item");
              objc_msgSend(v1016, "objectForKeyedSubscript:", v860);
              v1015 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v1178 = 0u;
                v1179 = 0u;
                v1176 = 0u;
                v1177 = 0u;
                v1019 = v1015;
                v1027 = objc_msgSend(v1019, "countByEnumeratingWithState:objects:count:", &v1176, &v1208, 16);
                if (!v1027)
                  goto LABEL_1915;
                v861 = CFSTR("localized_taxonomy_result_brand");
                v1025 = *(_QWORD *)v1177;
                if (a3)
                  v861 = CFSTR("localizedTaxonomyResultBrand");
                v1014 = v861;
                v862 = CFSTR("pref_phone");
                if (a3)
                  v862 = CFSTR("prefPhone");
                v1087 = v862;
                if (a3)
                  v863 = CFSTR("prefUrl");
                else
                  v863 = CFSTR("pref_url");
                v864 = CFSTR("prefDisplayName");
                if (!a3)
                  v864 = CFSTR("pref_display_name");
                v1067 = v864;
                v1077 = v863;
                v865 = CFSTR("country_code");
                if (a3)
                  v865 = CFSTR("countryCode");
                v1060 = v865;
                if (a3)
                  v866 = CFSTR("isUnclaimable");
                else
                  v866 = CFSTR("is_unclaimable");
                v1053 = v866;
                if (a3)
                  v867 = CFSTR("businessCardPoiIconType");
                else
                  v867 = CFSTR("business_card_poi_icon_type");
                v868 = CFSTR("business_card_pref_category");
                if (a3)
                  v868 = CFSTR("businessCardPrefCategory");
                v1046 = v868;
                v1050 = v867;
                if (a3)
                  v869 = CFSTR("prefCategoryNames");
                else
                  v869 = CFSTR("pref_category_names");
                v870 = CFSTR("prefCategoryIcon");
                if (!a3)
                  v870 = CFSTR("pref_category_icon");
                v1042 = v870;
                v1044 = v869;
                v871 = CFSTR("business_card_alt_categories");
                if (a3)
                  v871 = CFSTR("businessCardAltCategories");
                v1040 = v871;
                if (a3)
                  v872 = CFSTR("businessCardModernPrimaryCategory");
                else
                  v872 = CFSTR("business_card_modern_primary_category");
                v1038 = v872;
                if (a3)
                  v873 = CFSTR("modernPrimaryCategoryIcon");
                else
                  v873 = CFSTR("modern_primary_category_icon");
                v874 = CFSTR("modern_primary_category_names");
                if (a3)
                  v874 = CFSTR("modernPrimaryCategoryNames");
                v1034 = v874;
                v1036 = v873;
                if (a3)
                  v875 = CFSTR("businessCardModernAlternateCategories");
                else
                  v875 = CFSTR("business_card_modern_alternate_categories");
                v876 = CFSTR("businessConnectAttributes");
                if (!a3)
                  v876 = CFSTR("business_connect_attributes");
                v1032 = v876;
                v1033 = v875;
                v877 = CFSTR("chain_id");
                if (a3)
                  v877 = CFSTR("chainId");
                v1024 = v877;
                if (a3)
                  v878 = CFSTR("orgId");
                else
                  v878 = CFSTR("org_id");
                v1023 = v878;
                while (1)
                {
                  v879 = 0;
                  do
                  {
                    if (*(_QWORD *)v1177 != v1025)
                    {
                      v880 = v879;
                      objc_enumerationMutation(v1019);
                      v879 = v880;
                    }
                    v1029 = v879;
                    v881 = *(void **)(*((_QWORD *)&v1176 + 1) + 8 * v879);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v882 = [GEOPDQueryUnderstandingTaxonomyResultItem alloc];
                      if (v882)
                      {
                        v1028 = v881;
                        v1031 = -[GEOPDQueryUnderstandingTaxonomyResultItem init](v882, "init");
                        if (v1031)
                        {
                          objc_msgSend(v1028, "objectForKeyedSubscript:", CFSTR("type"));
                          v883 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v884 = v883;
                            if ((objc_msgSend(v884, "isEqualToString:", CFSTR("QUERY_UNDERSTANDING_TAXONOMY_TYPE_UNKNOWN")) & 1) != 0)
                            {
                              v885 = 0;
                            }
                            else if ((objc_msgSend(v884, "isEqualToString:", CFSTR("QUERY_UNDERSTANDING_TAXONOMY_TYPE_CATEGORY")) & 1) != 0)
                            {
                              v885 = 1;
                            }
                            else if (objc_msgSend(v884, "isEqualToString:", CFSTR("QUERY_UNDERSTANDING_TAXONOMY_TYPE_BRAND")))
                            {
                              v885 = 2;
                            }
                            else
                            {
                              v885 = 0;
                            }

LABEL_1775:
                            *(_BYTE *)(v1031 + 56) |= 0x10u;
                            *(_BYTE *)(v1031 + 56) |= 1u;
                            *(_DWORD *)(v1031 + 52) = v885;
                          }
                          else
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v885 = objc_msgSend(v883, "intValue");
                              goto LABEL_1775;
                            }
                          }

                          objc_msgSend(v1028, "objectForKeyedSubscript:", CFSTR("category"));
                          v886 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v887 = [GEOPDQueryUnderstandingTaxonomyResultItemCategory alloc];
                            v888 = v886;
                            if (v887)
                              v887 = -[GEOPDQueryUnderstandingTaxonomyResultItemCategory init](v887, "init");

                            v889 = v887;
                            *(_BYTE *)(v1031 + 56) |= 8u;
                            *(_BYTE *)(v1031 + 56) |= 0x10u;
                            objc_storeStrong((id *)(v1031 + 32), v887);

                          }
                          objc_msgSend(v1028, "objectForKeyedSubscript:", CFSTR("brand"));
                          v1026 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v890 = [GEOPDQueryUnderstandingTaxonomyResultItemBrand alloc];
                            if (v890)
                            {
                              v1018 = v1026;
                              v1111 = -[GEOPDQueryUnderstandingTaxonomyResultItemBrand init](v890, "init");
                              if (v1111)
                              {
                                objc_msgSend(v1018, "objectForKeyedSubscript:", v1014);
                                v1017 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v1182 = 0u;
                                  v1183 = 0u;
                                  v1180 = 0u;
                                  v1181 = 0u;
                                  v1098 = v1017;
                                  v1135 = (char *)objc_msgSend(v1098, "countByEnumeratingWithState:objects:count:", &v1180, &v1212, 16);
                                  if (v1135)
                                  {
                                    objk = *(id *)v1181;
                                    do
                                    {
                                      v891 = 0;
                                      do
                                      {
                                        if (*(id *)v1181 != objk)
                                        {
                                          v892 = v891;
                                          objc_enumerationMutation(v1098);
                                          v891 = v892;
                                        }
                                        v1146 = v891;
                                        v893 = *(void **)(*((_QWORD *)&v1180 + 1) + 8 * (_QWORD)v891);
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          v894 = [GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand alloc];
                                          if (v894)
                                          {
                                            v1170 = v893;
                                            v895 = -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand init](v894, "init");
                                            if (v895)
                                            {
                                              objc_msgSend(v1170, "objectForKeyedSubscript:", CFSTR("muid"));
                                              v896 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v897 = objc_msgSend(v896, "unsignedLongLongValue");
                                                *(_DWORD *)(v895 + 168) |= 0x40000u;
                                                *(_DWORD *)(v895 + 168) |= 2u;
                                                *(_QWORD *)(v895 + 104) = v897;
                                              }

                                              objc_msgSend(v1170, "objectForKeyedSubscript:", v1087);
                                              v898 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v899 = (void *)objc_msgSend(v898, "copy");
                                                v900 = v899;
                                                *(_DWORD *)(v895 + 168) |= 0x10000u;
                                                *(_DWORD *)(v895 + 168) |= 0x40000u;
                                                objc_storeStrong((id *)(v895 + 136), v899);

                                              }
                                              objc_msgSend(v1170, "objectForKeyedSubscript:", v1077);
                                              v901 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v902 = (void *)objc_msgSend(v901, "copy");
                                                v903 = v902;
                                                *(_DWORD *)(v895 + 168) |= 0x20000u;
                                                *(_DWORD *)(v895 + 168) |= 0x40000u;
                                                objc_storeStrong((id *)(v895 + 144), v902);

                                              }
                                              objc_msgSend(v1170, "objectForKeyedSubscript:", v1067);
                                              v904 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v905 = [GEOLocalizedString alloc];
                                                if ((a3 & 1) != 0)
                                                  v906 = -[GEOLocalizedString initWithJSON:](v905, "initWithJSON:", v904);
                                                else
                                                  v906 = -[GEOLocalizedString initWithDictionary:](v905, "initWithDictionary:", v904);
                                                v907 = v906;
                                                v908 = v906;
                                                *(_DWORD *)(v895 + 168) |= 0x8000u;
                                                *(_DWORD *)(v895 + 168) |= 0x40000u;
                                                objc_storeStrong((id *)(v895 + 128), v907);

                                              }
                                              objc_msgSend(v1170, "objectForKeyedSubscript:", CFSTR("category"));
                                              v909 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v1202 = 0u;
                                                v1203 = 0u;
                                                v1200 = 0u;
                                                v1201 = 0u;
                                                v910 = v909;
                                                v911 = objc_msgSend(v910, "countByEnumeratingWithState:objects:count:", &v1200, v1232, 16);
                                                if (v911)
                                                {
                                                  v912 = *(_QWORD *)v1201;
                                                  do
                                                  {
                                                    for (i6 = 0; i6 != v911; ++i6)
                                                    {
                                                      if (*(_QWORD *)v1201 != v912)
                                                        objc_enumerationMutation(v910);
                                                      v914 = *(void **)(*((_QWORD *)&v1200 + 1) + 8 * i6);
                                                      objc_opt_class();
                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                      {
                                                        v915 = (void *)objc_msgSend(v914, "copy");
                                                        -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand addCategory:]((os_unfair_lock_s *)v895, v915);

                                                      }
                                                    }
                                                    v911 = objc_msgSend(v910, "countByEnumeratingWithState:objects:count:", &v1200, v1232, 16);
                                                  }
                                                  while (v911);
                                                }

                                              }
                                              objc_msgSend(v1170, "objectForKeyedSubscript:", v1060);
                                              v916 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v917 = (void *)objc_msgSend(v916, "copy");
                                                v918 = v917;
                                                *(_DWORD *)(v895 + 168) |= 0x400u;
                                                *(_DWORD *)(v895 + 168) |= 0x40000u;
                                                objc_storeStrong((id *)(v895 + 80), v917);

                                              }
                                              objc_msgSend(v1170, "objectForKeyedSubscript:", v1053);
                                              v919 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v920 = objc_msgSend(v919, "BOOLValue");
                                                *(_DWORD *)(v895 + 168) |= 0x40000u;
                                                *(_DWORD *)(v895 + 168) |= 4u;
                                                *(_BYTE *)(v895 + 164) = v920;
                                              }

                                              objc_msgSend(v1170, "objectForKeyedSubscript:", v1050);
                                              v921 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v922 = objc_msgSend(v921, "unsignedLongLongValue");
                                                *(_DWORD *)(v895 + 168) |= 0x40000u;
                                                *(_DWORD *)(v895 + 168) |= 1u;
                                                *(_QWORD *)(v895 + 48) = v922;
                                              }

                                              objc_msgSend(v1170, "objectForKeyedSubscript:", v1046);
                                              v923 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v924 = (void *)objc_msgSend(v923, "copy");
                                                v925 = v924;
                                                *(_DWORD *)(v895 + 168) |= 0x80u;
                                                *(_DWORD *)(v895 + 168) |= 0x40000u;
                                                objc_storeStrong((id *)(v895 + 56), v924);

                                              }
                                              objc_msgSend(v1170, "objectForKeyedSubscript:", v1044);
                                              v926 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v927 = [GEOPDMultiLocalizedString alloc];
                                                if (v927)
                                                  v928 = (void *)-[GEOPDMultiLocalizedString _initWithDictionary:isJSON:](v927, v926, a3);
                                                else
                                                  v928 = 0;
                                                v929 = v928;
                                                *(_DWORD *)(v895 + 168) |= 0x4000u;
                                                *(_DWORD *)(v895 + 168) |= 0x40000u;
                                                objc_storeStrong((id *)(v895 + 120), v928);

                                              }
                                              objc_msgSend(v1170, "objectForKeyedSubscript:", v1042);
                                              v930 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v1198 = 0u;
                                                v1199 = 0u;
                                                v1196 = 0u;
                                                v1197 = 0u;
                                                v931 = v930;
                                                v932 = objc_msgSend(v931, "countByEnumeratingWithState:objects:count:", &v1196, &v1228, 16);
                                                if (v932)
                                                {
                                                  v933 = *(_QWORD *)v1197;
                                                  do
                                                  {
                                                    v934 = 0;
                                                    do
                                                    {
                                                      if (*(_QWORD *)v1197 != v933)
                                                        objc_enumerationMutation(v931);
                                                      v935 = *(void **)(*((_QWORD *)&v1196 + 1) + 8 * v934);
                                                      objc_opt_class();
                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                      {
                                                        v936 = [GEOPDIconMapping alloc];
                                                        if (v936)
                                                          v937 = (void *)-[GEOPDIconMapping _initWithDictionary:isJSON:](v936, v935, a3);
                                                        else
                                                          v937 = 0;
                                                        -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand addPrefCategoryIcon:](v895, v937);

                                                      }
                                                      ++v934;
                                                    }
                                                    while (v932 != v934);
                                                    v938 = objc_msgSend(v931, "countByEnumeratingWithState:objects:count:", &v1196, &v1228, 16);
                                                    v932 = v938;
                                                  }
                                                  while (v938);
                                                }

                                              }
                                              objc_msgSend(v1170, "objectForKeyedSubscript:", v1040);
                                              v939 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v1194 = 0u;
                                                v1195 = 0u;
                                                v1192 = 0u;
                                                v1193 = 0u;
                                                v940 = v939;
                                                v941 = objc_msgSend(v940, "countByEnumeratingWithState:objects:count:", &v1192, &v1224, 16);
                                                if (v941)
                                                {
                                                  v942 = *(_QWORD *)v1193;
                                                  do
                                                  {
                                                    for (i7 = 0; i7 != v941; ++i7)
                                                    {
                                                      if (*(_QWORD *)v1193 != v942)
                                                        objc_enumerationMutation(v940);
                                                      v944 = *(void **)(*((_QWORD *)&v1192 + 1) + 8 * i7);
                                                      objc_opt_class();
                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                      {
                                                        v945 = (void *)objc_msgSend(v944, "copy");
                                                        -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand addBusinessCardAltCategories:]((os_unfair_lock_s *)v895, v945);

                                                      }
                                                    }
                                                    v941 = objc_msgSend(v940, "countByEnumeratingWithState:objects:count:", &v1192, &v1224, 16);
                                                  }
                                                  while (v941);
                                                }

                                              }
                                              objc_msgSend(v1170, "objectForKeyedSubscript:", v1038);
                                              v946 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v947 = (void *)objc_msgSend(v946, "copy");
                                                v948 = v947;
                                                *(_DWORD *)(v895 + 168) |= 0x40u;
                                                *(_DWORD *)(v895 + 168) |= 0x40000u;
                                                objc_storeStrong((id *)(v895 + 40), v947);

                                              }
                                              objc_msgSend(v1170, "objectForKeyedSubscript:", v1036);
                                              v949 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v1190 = 0u;
                                                v1191 = 0u;
                                                v1188 = 0u;
                                                v1189 = 0u;
                                                v950 = v949;
                                                v951 = objc_msgSend(v950, "countByEnumeratingWithState:objects:count:", &v1188, &v1220, 16);
                                                if (v951)
                                                {
                                                  v952 = *(_QWORD *)v1189;
                                                  do
                                                  {
                                                    v953 = 0;
                                                    do
                                                    {
                                                      if (*(_QWORD *)v1189 != v952)
                                                        objc_enumerationMutation(v950);
                                                      v954 = *(void **)(*((_QWORD *)&v1188 + 1) + 8 * v953);
                                                      objc_opt_class();
                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                      {
                                                        v955 = [GEOPDIconMapping alloc];
                                                        if (v955)
                                                          v956 = (void *)-[GEOPDIconMapping _initWithDictionary:isJSON:](v955, v954, a3);
                                                        else
                                                          v956 = 0;
                                                        -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand addModernPrimaryCategoryIcon:](v895, v956);

                                                      }
                                                      ++v953;
                                                    }
                                                    while (v951 != v953);
                                                    v957 = objc_msgSend(v950, "countByEnumeratingWithState:objects:count:", &v1188, &v1220, 16);
                                                    v951 = v957;
                                                  }
                                                  while (v957);
                                                }

                                              }
                                              objc_msgSend(v1170, "objectForKeyedSubscript:", v1034);
                                              v958 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v959 = [GEOPDMultiLocalizedString alloc];
                                                if (v959)
                                                  v960 = (void *)-[GEOPDMultiLocalizedString _initWithDictionary:isJSON:](v959, v958, a3);
                                                else
                                                  v960 = 0;
                                                v961 = v960;
                                                *(_DWORD *)(v895 + 168) |= 0x1000u;
                                                *(_DWORD *)(v895 + 168) |= 0x40000u;
                                                objc_storeStrong((id *)(v895 + 96), v960);

                                              }
                                              objc_msgSend(v1170, "objectForKeyedSubscript:", v1033);
                                              v962 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v1186 = 0u;
                                                v1187 = 0u;
                                                v1184 = 0u;
                                                v1185 = 0u;
                                                v963 = v962;
                                                v964 = objc_msgSend(v963, "countByEnumeratingWithState:objects:count:", &v1184, &v1216, 16);
                                                if (v964)
                                                {
                                                  v965 = *(_QWORD *)v1185;
                                                  do
                                                  {
                                                    for (i8 = 0; i8 != v964; ++i8)
                                                    {
                                                      if (*(_QWORD *)v1185 != v965)
                                                        objc_enumerationMutation(v963);
                                                      v967 = *(void **)(*((_QWORD *)&v1184 + 1) + 8 * i8);
                                                      objc_opt_class();
                                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                                      {
                                                        v968 = (void *)objc_msgSend(v967, "copy");
                                                        -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand addBusinessCardModernAlternateCategories:]((os_unfair_lock_s *)v895, v968);

                                                      }
                                                    }
                                                    v964 = objc_msgSend(v963, "countByEnumeratingWithState:objects:count:", &v1184, &v1216, 16);
                                                  }
                                                  while (v964);
                                                }

                                              }
                                              objc_msgSend(v1170, "objectForKeyedSubscript:", v1032);
                                              v969 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                              {
                                                v970 = [GEOPDBusinessConnectAttributes alloc];
                                                if (v970)
                                                {
                                                  v971 = v969;
                                                  v970 = -[GEOPDBusinessConnectAttributes init](v970, "init");
                                                  if (v970)
                                                  {
                                                    objc_msgSend(v971, "objectForKeyedSubscript:", v1024);
                                                    v972 = (void *)objc_claimAutoreleasedReturnValue();
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                    {
                                                      v973 = (void *)objc_msgSend(v972, "copy");
                                                      v974 = v973;
                                                      *(_BYTE *)&v970->_flags |= 2u;
                                                      *(_BYTE *)&v970->_flags |= 8u;
                                                      objc_storeStrong((id *)&v970->_chainId, v973);

                                                    }
                                                    objc_msgSend(v971, "objectForKeyedSubscript:", v1023);
                                                    v975 = (void *)objc_claimAutoreleasedReturnValue();
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                                    {
                                                      v976 = (void *)objc_msgSend(v975, "copy");
                                                      v977 = v976;
                                                      *(_BYTE *)&v970->_flags |= 4u;
                                                      *(_BYTE *)&v970->_flags |= 8u;
                                                      objc_storeStrong((id *)&v970->_orgId, v976);

                                                    }
                                                  }

                                                }
                                                v978 = v970;
                                                *(_DWORD *)(v895 + 168) |= 0x100u;
                                                *(_DWORD *)(v895 + 168) |= 0x40000u;
                                                objc_storeStrong((id *)(v895 + 64), v970);

                                              }
                                            }

                                          }
                                          else
                                          {
                                            v895 = 0;
                                          }
                                          -[GEOPDQueryUnderstandingTaxonomyResultItemBrand addLocalizedTaxonomyResultBrand:]((uint64_t)v1111, (void *)v895);

                                        }
                                        v891 = v1146 + 1;
                                      }
                                      while (v1146 + 1 != v1135);
                                      v979 = objc_msgSend(v1098, "countByEnumeratingWithState:objects:count:", &v1180, &v1212, 16);
                                      v1135 = (char *)v979;
                                    }
                                    while (v979);
                                  }

                                }
                              }

                            }
                            else
                            {
                              v1111 = 0;
                            }
                            v980 = v1111;
                            *(_BYTE *)(v1031 + 56) |= 4u;
                            *(_BYTE *)(v1031 + 56) |= 0x10u;
                            objc_storeStrong((id *)(v1031 + 24), v1111);

                          }
                        }

                        -[GEOPDQueryUnderstandingTaxonomyResult addResultItem:]((uint64_t)v1022, (void *)v1031);
                      }
                      else
                      {
                        v1031 = 0;
                        -[GEOPDQueryUnderstandingTaxonomyResult addResultItem:]((uint64_t)v1022, 0);
                      }

                    }
                    v879 = v1029 + 1;
                  }
                  while (v1029 + 1 != v1027);
                  v981 = objc_msgSend(v1019, "countByEnumeratingWithState:objects:count:", &v1176, &v1208, 16);
                  v1027 = v981;
                  if (!v981)
                  {
LABEL_1915:

                    break;
                  }
                }
              }

            }
          }
          else
          {
            v1022 = 0;
          }
          -[GEOPDQueryUnderstandingResult setTaxonomyResult:]((uint64_t)v1158, v1022);

        }
        v847 = v1020;
      }

    }
    else
    {
      v1158 = 0;
    }
    -[GEOPDPlaceGlobalResult setQueryUnderstandingResult:]((uint64_t)v1078, v1158);

    v844 = v1030;
  }

  if (a3)
    v982 = CFSTR("poiAtAddressLookupResult");
  else
    v982 = CFSTR("poi_at_address_lookup_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v982);
  v983 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v984 = [GEOPDPoiAtAddressLookupResult alloc];
    v985 = v983;
    if (v984)
      v984 = -[GEOPDPoiAtAddressLookupResult init](v984, "init");

    -[GEOPDPlaceGlobalResult setPoiAtAddressLookupResult:]((uint64_t)v1078, v984);
  }

  if (a3)
    v986 = CFSTR("placecardEnrichmentResult");
  else
    v986 = CFSTR("placecard_enrichment_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v986);
  v987 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v988 = [GEOPDPlacecardEnrichmentResult alloc];
    v989 = v987;
    if (v988)
      v988 = -[GEOPDPlacecardEnrichmentResult init](v988, "init");

    -[GEOPDPlaceGlobalResult setPlacecardEnrichmentResult:]((uint64_t)v1078, v988);
  }

  if (a3)
    v990 = CFSTR("offlineRegionNameResult");
  else
    v990 = CFSTR("offline_region_name_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v990);
  v991 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v992 = [GEOPDOfflineRegionNameResult alloc];
    if (v992)
    {
      v993 = v991;
      v992 = -[GEOPDOfflineRegionNameResult init](v992, "init");
      if (v992)
      {
        objc_msgSend(v993, "objectForKeyedSubscript:", CFSTR("displayName"));
        v994 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v995 = [GEOLocalizedString alloc];
          if ((a3 & 1) != 0)
            v996 = -[GEOLocalizedString initWithJSON:](v995, "initWithJSON:", v994);
          else
            v996 = -[GEOLocalizedString initWithDictionary:](v995, "initWithDictionary:", v994);
          v997 = v996;
          -[GEOPDOfflineRegionNameResult setDisplayName:]((uint64_t)v992, v996);

        }
      }

    }
    -[GEOPDPlaceGlobalResult setOfflineRegionNameResult:]((uint64_t)v1078, v992);

  }
  if (a3)
    v998 = CFSTR("searchCapabilitiesResult");
  else
    v998 = CFSTR("search_capabilities_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v998);
  v999 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v1000 = [GEOPDSearchCapabilitiesResult alloc];
    if (v1000)
    {
      v1001 = v999;
      v1000 = -[GEOPDSearchCapabilitiesResult init](v1000, "init");
      if (v1000)
      {
        if (a3)
          v1002 = CFSTR("offlineCapabilities");
        else
          v1002 = CFSTR("offline_capabilities");
        objc_msgSend(v1001, "objectForKeyedSubscript:", v1002);
        v1003 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1004 = [GEOPDOfflineSearchCapabilities alloc];
          if (v1004)
          {
            v1005 = v1003;
            v1004 = -[GEOPDOfflineSearchCapabilities init](v1004, "init");
            if (v1004)
            {
              if (a3)
                v1006 = CFSTR("supportsTextSearch");
              else
                v1006 = CFSTR("supports_text_search");
              objc_msgSend(v1005, "objectForKeyedSubscript:", v1006);
              v1007 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v1008 = objc_msgSend(v1007, "BOOLValue");
                *(_BYTE *)&v1004->_flags |= 1u;
                v1004->_supportsTextSearch = v1008;
              }

            }
          }
          -[GEOPDSearchCapabilitiesResult setOfflineCapabilities:]((uint64_t)v1000, v1004);

        }
      }

    }
    -[GEOPDPlaceGlobalResult setSearchCapabilitiesResult:]((uint64_t)v1078, v1000);

  }
  if (a3)
    v1009 = CFSTR("addressRecommendationResult");
  else
    v1009 = CFSTR("address_recommendation_result");
  objc_msgSend(v1099, "objectForKeyedSubscript:", v1009);
  v1010 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v1011 = [GEOPDAddressRecommendationResult alloc];
    v1012 = v1010;
    if (v1011)
      v1011 = -[GEOPDAddressRecommendationResult init](v1011, "init");

    -[GEOPDPlaceGlobalResult setAddressRecommendationResult:]((uint64_t)v1078, v1011);
  }

LABEL_1981:
  return v1078;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceGlobalResultReadAllFrom((uint64_t)self, a3, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
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
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
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
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  id v92;
  void *v93;
  id v94;
  void *v95;
  id v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  void *v101;
  id v102;
  void *v103;
  id v104;
  void *v105;
  id v106;
  void *v107;
  id v108;
  void *v109;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*((_BYTE *)&self->_flags + 6) & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlaceGlobalResult readAll:]((uint64_t)self, 0);
    v8 = -[GEOPDSearchResult copyWithZone:](self->_searchResult, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 368);
    *(_QWORD *)(v5 + 368) = v8;

    v10 = -[GEOPDGeocodingResult copyWithZone:](self->_geocodingResult, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 184);
    *(_QWORD *)(v5 + 184) = v10;

    v12 = -[GEOPDCanonicalLocationSearchResult copyWithZone:](self->_canonicalSearchResult, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 128);
    *(_QWORD *)(v5 + 128) = v12;

    v14 = -[GEOPDReverseGeocodingResult copyWithZone:](self->_reverseGeocodingResult, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 344);
    *(_QWORD *)(v5 + 344) = v14;

    v16 = -[GEOPDPlaceLookupResult copyWithZone:](self->_placeLookupResult, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 288);
    *(_QWORD *)(v5 + 288) = v16;

    v18 = -[GEOPDMerchantLookupResult copyWithZone:](self->_merchantLookupResult, "copyWithZone:", a3);
    v19 = *(void **)(v5 + 248);
    *(_QWORD *)(v5 + 248) = v18;

    v20 = -[GEOPDPlaceRefinementResult copyWithZone:](self->_placeRefinementResult, "copyWithZone:", a3);
    v21 = *(void **)(v5 + 296);
    *(_QWORD *)(v5 + 296) = v20;

    v22 = -[GEOPDSiriSearchResult copyWithZone:](self->_siriSearchResult, "copyWithZone:", a3);
    v23 = *(void **)(v5 + 392);
    *(_QWORD *)(v5 + 392) = v22;

    v24 = -[GEOPDLocationDirectedSearchResult copyWithZone:](self->_locationDirectedSearchResult, "copyWithZone:", a3);
    v25 = *(void **)(v5 + 216);
    *(_QWORD *)(v5 + 216) = v24;

    v26 = -[GEOPDAutocompleteResult copyWithZone:](self->_autocompleteResult, "copyWithZone:", a3);
    v27 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v26;

    v28 = -[GEOPDSearchBrowseCategorySuggestionResult copyWithZone:](self->_browseCategorySuggestionResult, "copyWithZone:", a3);
    v29 = *(void **)(v5 + 120);
    *(_QWORD *)(v5 + 120) = v28;

    v30 = -[GEOPDCategorySearchResult copyWithZone:](self->_categorySearchResult, "copyWithZone:", a3);
    v31 = *(void **)(v5 + 136);
    *(_QWORD *)(v5 + 136) = v30;

    v32 = -[GEOPDPopularNearbySearchResult copyWithZone:](self->_popularNearbySearchResult, "copyWithZone:", a3);
    v33 = *(void **)(v5 + 320);
    *(_QWORD *)(v5 + 320) = v32;

    v34 = -[GEOPDSearchZeroKeywordCategorySuggestionResult copyWithZone:](self->_searchZeroKeywordCategorySuggestionResult, "copyWithZone:", a3);
    v35 = *(void **)(v5 + 376);
    *(_QWORD *)(v5 + 376) = v34;

    v36 = -[GEOPDSearchFieldPlaceholderResult copyWithZone:](self->_searchFieldPlaceholderResult, "copyWithZone:", a3);
    v37 = *(void **)(v5 + 360);
    *(_QWORD *)(v5 + 360) = v36;

    v38 = -[GEOPDBatchPopularNearbySearchResult copyWithZone:](self->_batchPopularNearbySearchResult, "copyWithZone:", a3);
    v39 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = v38;

    v40 = -[GEOPDVendorSpecificPlaceRefinementResult copyWithZone:](self->_vendorSpecificPlaceRefinementResult, "copyWithZone:", a3);
    v41 = *(void **)(v5 + 416);
    *(_QWORD *)(v5 + 416) = v40;

    v42 = -[GEOPDNearbySearchResult copyWithZone:](self->_nearbySearchResult, "copyWithZone:", a3);
    v43 = *(void **)(v5 + 256);
    *(_QWORD *)(v5 + 256) = v42;

    v44 = -[GEOPDAddressObjectGeocodingResult copyWithZone:](self->_addressObjectGeocodingResult, "copyWithZone:", a3);
    v45 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v44;

    v46 = -[GEOPDSearchZeroKeywordWithSearchResultsSuggestionResult copyWithZone:](self->_searchZeroKeywordWithSearchResultsSuggestionResult, "copyWithZone:", a3);
    v47 = *(void **)(v5 + 384);
    *(_QWORD *)(v5 + 384) = v46;

    v48 = -[GEOPDExternalTransitLookupResult copyWithZone:](self->_externalTransitLookupResult, "copyWithZone:", a3);
    v49 = *(void **)(v5 + 168);
    *(_QWORD *)(v5 + 168) = v48;

    v50 = -[GEOPDFeatureIdGeocodingResult copyWithZone:](self->_featureIdGeocodingResult, "copyWithZone:", a3);
    v51 = *(void **)(v5 + 176);
    *(_QWORD *)(v5 + 176) = v50;

    v52 = -[GEOPDMapsIdentifierPlaceLookupResult copyWithZone:](self->_mapsIdentifierPlaceLookupResult, "copyWithZone:", a3);
    v53 = *(void **)(v5 + 232);
    *(_QWORD *)(v5 + 232) = v52;

    v54 = -[GEOPDBatchReverseGeocodingResult copyWithZone:](self->_batchReverseGeocodingResult, "copyWithZone:", a3);
    v55 = *(void **)(v5 + 96);
    *(_QWORD *)(v5 + 96) = v54;

    v56 = -[GEOPDBrandLookupResult copyWithZone:](self->_brandLookupResult, "copyWithZone:", a3);
    v57 = *(void **)(v5 + 112);
    *(_QWORD *)(v5 + 112) = v56;

    v58 = -[GEOPDWifiFingerprintResult copyWithZone:](self->_wifiFingerprintResult, "copyWithZone:", a3);
    v59 = *(void **)(v5 + 424);
    *(_QWORD *)(v5 + 424) = v58;

    v60 = -[GEOPDIpGeoLookupResult copyWithZone:](self->_ipGeoLookupResult, "copyWithZone:", a3);
    v61 = *(void **)(v5 + 208);
    *(_QWORD *)(v5 + 208) = v60;

    v62 = -[GEOPDGroundViewLabelResult copyWithZone:](self->_groundViewLabelResult, "copyWithZone:", a3);
    v63 = *(void **)(v5 + 192);
    *(_QWORD *)(v5 + 192) = v62;

    v64 = -[GEOPDBatchSpatialLookupResult copyWithZone:](self->_batchSpatialLookupResult, "copyWithZone:", a3);
    v65 = *(void **)(v5 + 104);
    *(_QWORD *)(v5 + 104) = v64;

    v66 = -[GEOPDPlaceGlobalCommonResult copyWithZone:](self->_placeGlobalCommonResult, "copyWithZone:", a3);
    v67 = *(void **)(v5 + 280);
    *(_QWORD *)(v5 + 280) = v66;

    v68 = -[GEOPDPlaceCollectionLookupResult copyWithZone:](self->_placeCollectionLookupResult, "copyWithZone:", a3);
    v69 = *(void **)(v5 + 272);
    *(_QWORD *)(v5 + 272) = v68;

    v70 = -[GEOPDTransitScheduleLookupResult copyWithZone:](self->_transitScheduleLookupResult, "copyWithZone:", a3);
    v71 = *(void **)(v5 + 408);
    *(_QWORD *)(v5 + 408) = v70;

    v72 = -[GEOPDBatchCategoryLookupResult copyWithZone:](self->_batchCategoryLookupResult, "copyWithZone:", a3);
    v73 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v72;

    v74 = -[GEOPDBatchMerchantLookupBrandResult copyWithZone:](self->_batchMerchantLookupBrandResult, "copyWithZone:", a3);
    v75 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v74;

    v76 = -[GEOPDChildPlaceLookupByCategoryResult copyWithZone:](self->_childPlaceLookupByCategoryResult, "copyWithZone:", a3);
    v77 = *(void **)(v5 + 144);
    *(_QWORD *)(v5 + 144) = v76;

    v78 = -[GEOPDMapsSearchHomeResult copyWithZone:](self->_mapsSearchHomeResult, "copyWithZone:", a3);
    v79 = *(void **)(v5 + 240);
    *(_QWORD *)(v5 + 240) = v78;

    v80 = -[GEOPDCollectionSuggestionResult copyWithZone:](self->_collectionSuggestionResult, "copyWithZone:", a3);
    v81 = *(void **)(v5 + 152);
    *(_QWORD *)(v5 + 152) = v80;

    v82 = -[GEOPDPublisherViewResult copyWithZone:](self->_publisherViewResult, "copyWithZone:", a3);
    v83 = *(void **)(v5 + 328);
    *(_QWORD *)(v5 + 328) = v82;

    v84 = -[GEOPDAllCollectionsViewResult copyWithZone:](self->_allCollectionsViewResult, "copyWithZone:", a3);
    v85 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v84;

    v86 = -[GEOPDAirportEntityPlaceLookupResult copyWithZone:](self->_airportEntityPlaceLookupResult, "copyWithZone:", a3);
    v87 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v86;

    v88 = -[GEOPDTerritoryLookupResult copyWithZone:](self->_territoryLookupResult, "copyWithZone:", a3);
    v89 = *(void **)(v5 + 400);
    *(_QWORD *)(v5 + 400) = v88;

    v90 = -[GEOPDMapsHomeResult copyWithZone:](self->_mapsHomeResult, "copyWithZone:", a3);
    v91 = *(void **)(v5 + 224);
    *(_QWORD *)(v5 + 224) = v90;

    v92 = -[GEOPDAllGuidesLocationsViewResult copyWithZone:](self->_allGuidesLocationsViewresult, "copyWithZone:", a3);
    v93 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v92;

    v94 = -[GEOPDGuidesHomeResult copyWithZone:](self->_guidesHomeResult, "copyWithZone:", a3);
    v95 = *(void **)(v5 + 200);
    *(_QWORD *)(v5 + 200) = v94;

    v96 = -[GEOPDExtendedGeoLookupResult copyWithZone:](self->_extendedGeoLookupResult, "copyWithZone:", a3);
    v97 = *(void **)(v5 + 160);
    *(_QWORD *)(v5 + 160) = v96;

    v98 = -[GEOPDQueryUnderstandingResult copyWithZone:](self->_queryUnderstandingResult, "copyWithZone:", a3);
    v99 = *(void **)(v5 + 336);
    *(_QWORD *)(v5 + 336) = v98;

    v100 = -[GEOPDPoiAtAddressLookupResult copyWithZone:](self->_poiAtAddressLookupResult, "copyWithZone:", a3);
    v101 = *(void **)(v5 + 312);
    *(_QWORD *)(v5 + 312) = v100;

    v102 = -[GEOPDPlacecardEnrichmentResult copyWithZone:](self->_placecardEnrichmentResult, "copyWithZone:", a3);
    v103 = *(void **)(v5 + 304);
    *(_QWORD *)(v5 + 304) = v102;

    v104 = -[GEOPDOfflineRegionNameResult copyWithZone:](self->_offlineRegionNameResult, "copyWithZone:", a3);
    v105 = *(void **)(v5 + 264);
    *(_QWORD *)(v5 + 264) = v104;

    v106 = -[GEOPDSearchCapabilitiesResult copyWithZone:](self->_searchCapabilitiesResult, "copyWithZone:", a3);
    v107 = *(void **)(v5 + 352);
    *(_QWORD *)(v5 + 352) = v106;

    v108 = -[GEOPDAddressRecommendationResult copyWithZone:](self->_addressRecommendationResult, "copyWithZone:", a3);
    v109 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v108;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDPlaceGlobalResultReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOPDSearchResult *searchResult;
  GEOPDGeocodingResult *geocodingResult;
  GEOPDCanonicalLocationSearchResult *canonicalSearchResult;
  GEOPDReverseGeocodingResult *reverseGeocodingResult;
  GEOPDPlaceLookupResult *placeLookupResult;
  GEOPDMerchantLookupResult *merchantLookupResult;
  GEOPDPlaceRefinementResult *placeRefinementResult;
  GEOPDSiriSearchResult *siriSearchResult;
  GEOPDLocationDirectedSearchResult *locationDirectedSearchResult;
  GEOPDAutocompleteResult *autocompleteResult;
  GEOPDSearchBrowseCategorySuggestionResult *browseCategorySuggestionResult;
  GEOPDCategorySearchResult *categorySearchResult;
  GEOPDPopularNearbySearchResult *popularNearbySearchResult;
  GEOPDSearchZeroKeywordCategorySuggestionResult *searchZeroKeywordCategorySuggestionResult;
  GEOPDSearchFieldPlaceholderResult *searchFieldPlaceholderResult;
  GEOPDBatchPopularNearbySearchResult *batchPopularNearbySearchResult;
  GEOPDVendorSpecificPlaceRefinementResult *vendorSpecificPlaceRefinementResult;
  GEOPDNearbySearchResult *nearbySearchResult;
  GEOPDAddressObjectGeocodingResult *addressObjectGeocodingResult;
  GEOPDSearchZeroKeywordWithSearchResultsSuggestionResult *searchZeroKeywordWithSearchResultsSuggestionResult;
  GEOPDExternalTransitLookupResult *externalTransitLookupResult;
  GEOPDFeatureIdGeocodingResult *featureIdGeocodingResult;
  GEOPDMapsIdentifierPlaceLookupResult *mapsIdentifierPlaceLookupResult;
  GEOPDBatchReverseGeocodingResult *batchReverseGeocodingResult;
  GEOPDBrandLookupResult *brandLookupResult;
  GEOPDWifiFingerprintResult *wifiFingerprintResult;
  GEOPDIpGeoLookupResult *ipGeoLookupResult;
  GEOPDGroundViewLabelResult *groundViewLabelResult;
  GEOPDBatchSpatialLookupResult *batchSpatialLookupResult;
  GEOPDPlaceGlobalCommonResult *placeGlobalCommonResult;
  GEOPDPlaceCollectionLookupResult *placeCollectionLookupResult;
  GEOPDTransitScheduleLookupResult *transitScheduleLookupResult;
  GEOPDBatchCategoryLookupResult *batchCategoryLookupResult;
  GEOPDBatchMerchantLookupBrandResult *batchMerchantLookupBrandResult;
  GEOPDChildPlaceLookupByCategoryResult *childPlaceLookupByCategoryResult;
  GEOPDMapsSearchHomeResult *mapsSearchHomeResult;
  GEOPDCollectionSuggestionResult *collectionSuggestionResult;
  GEOPDPublisherViewResult *publisherViewResult;
  GEOPDAllCollectionsViewResult *allCollectionsViewResult;
  GEOPDAirportEntityPlaceLookupResult *airportEntityPlaceLookupResult;
  GEOPDTerritoryLookupResult *territoryLookupResult;
  GEOPDMapsHomeResult *mapsHomeResult;
  GEOPDAllGuidesLocationsViewResult *allGuidesLocationsViewresult;
  GEOPDGuidesHomeResult *guidesHomeResult;
  GEOPDExtendedGeoLookupResult *extendedGeoLookupResult;
  GEOPDQueryUnderstandingResult *queryUnderstandingResult;
  GEOPDPoiAtAddressLookupResult *poiAtAddressLookupResult;
  GEOPDPlacecardEnrichmentResult *placecardEnrichmentResult;
  GEOPDOfflineRegionNameResult *offlineRegionNameResult;
  GEOPDSearchCapabilitiesResult *searchCapabilitiesResult;
  GEOPDAddressRecommendationResult *addressRecommendationResult;
  char v56;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_104;
  -[GEOPDPlaceGlobalResult readAll:]((uint64_t)self, 1);
  -[GEOPDPlaceGlobalResult readAll:]((uint64_t)v4, 1);
  searchResult = self->_searchResult;
  if ((unint64_t)searchResult | v4[46])
  {
    if (!-[GEOPDSearchResult isEqual:](searchResult, "isEqual:"))
      goto LABEL_104;
  }
  geocodingResult = self->_geocodingResult;
  if ((unint64_t)geocodingResult | v4[23] && !-[GEOPDGeocodingResult isEqual:](geocodingResult, "isEqual:"))
    goto LABEL_104;
  canonicalSearchResult = self->_canonicalSearchResult;
  if ((unint64_t)canonicalSearchResult | v4[16]
    && !-[GEOPDCanonicalLocationSearchResult isEqual:](canonicalSearchResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  reverseGeocodingResult = self->_reverseGeocodingResult;
  if ((unint64_t)reverseGeocodingResult | v4[43]
    && !-[GEOPDReverseGeocodingResult isEqual:](reverseGeocodingResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  placeLookupResult = self->_placeLookupResult;
  if ((unint64_t)placeLookupResult | v4[36]
    && !-[GEOPDPlaceLookupResult isEqual:](placeLookupResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  merchantLookupResult = self->_merchantLookupResult;
  if ((unint64_t)merchantLookupResult | v4[31]
    && !-[GEOPDMerchantLookupResult isEqual:](merchantLookupResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  placeRefinementResult = self->_placeRefinementResult;
  if ((unint64_t)placeRefinementResult | v4[37]
    && !-[GEOPDPlaceRefinementResult isEqual:](placeRefinementResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  siriSearchResult = self->_siriSearchResult;
  if ((unint64_t)siriSearchResult | v4[49] && !-[GEOPDSiriSearchResult isEqual:](siriSearchResult, "isEqual:"))
    goto LABEL_104;
  locationDirectedSearchResult = self->_locationDirectedSearchResult;
  if ((unint64_t)locationDirectedSearchResult | v4[27]
    && !-[GEOPDLocationDirectedSearchResult isEqual:](locationDirectedSearchResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  autocompleteResult = self->_autocompleteResult;
  if ((unint64_t)autocompleteResult | v4[8]
    && !-[GEOPDAutocompleteResult isEqual:](autocompleteResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  browseCategorySuggestionResult = self->_browseCategorySuggestionResult;
  if ((unint64_t)browseCategorySuggestionResult | v4[15]
    && !-[GEOPDSearchBrowseCategorySuggestionResult isEqual:](browseCategorySuggestionResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  categorySearchResult = self->_categorySearchResult;
  if ((unint64_t)categorySearchResult | v4[17]
    && !-[GEOPDCategorySearchResult isEqual:](categorySearchResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  popularNearbySearchResult = self->_popularNearbySearchResult;
  if ((unint64_t)popularNearbySearchResult | v4[40]
    && !-[GEOPDPopularNearbySearchResult isEqual:](popularNearbySearchResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  searchZeroKeywordCategorySuggestionResult = self->_searchZeroKeywordCategorySuggestionResult;
  if ((unint64_t)searchZeroKeywordCategorySuggestionResult | v4[47]
    && !-[GEOPDSearchZeroKeywordCategorySuggestionResult isEqual:](searchZeroKeywordCategorySuggestionResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  searchFieldPlaceholderResult = self->_searchFieldPlaceholderResult;
  if ((unint64_t)searchFieldPlaceholderResult | v4[45]
    && !-[GEOPDSearchFieldPlaceholderResult isEqual:](searchFieldPlaceholderResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  batchPopularNearbySearchResult = self->_batchPopularNearbySearchResult;
  if ((unint64_t)batchPopularNearbySearchResult | v4[11]
    && !-[GEOPDBatchPopularNearbySearchResult isEqual:](batchPopularNearbySearchResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  vendorSpecificPlaceRefinementResult = self->_vendorSpecificPlaceRefinementResult;
  if ((unint64_t)vendorSpecificPlaceRefinementResult | v4[52]
    && !-[GEOPDVendorSpecificPlaceRefinementResult isEqual:](vendorSpecificPlaceRefinementResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  nearbySearchResult = self->_nearbySearchResult;
  if ((unint64_t)nearbySearchResult | v4[32]
    && !-[GEOPDNearbySearchResult isEqual:](nearbySearchResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  addressObjectGeocodingResult = self->_addressObjectGeocodingResult;
  if ((unint64_t)addressObjectGeocodingResult | v4[3]
    && !-[GEOPDAddressObjectGeocodingResult isEqual:](addressObjectGeocodingResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  searchZeroKeywordWithSearchResultsSuggestionResult = self->_searchZeroKeywordWithSearchResultsSuggestionResult;
  if ((unint64_t)searchZeroKeywordWithSearchResultsSuggestionResult | v4[48]
    && !-[GEOPDSearchZeroKeywordWithSearchResultsSuggestionResult isEqual:](searchZeroKeywordWithSearchResultsSuggestionResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  externalTransitLookupResult = self->_externalTransitLookupResult;
  if ((unint64_t)externalTransitLookupResult | v4[21]
    && !-[GEOPDExternalTransitLookupResult isEqual:](externalTransitLookupResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  featureIdGeocodingResult = self->_featureIdGeocodingResult;
  if ((unint64_t)featureIdGeocodingResult | v4[22]
    && !-[GEOPDFeatureIdGeocodingResult isEqual:](featureIdGeocodingResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  mapsIdentifierPlaceLookupResult = self->_mapsIdentifierPlaceLookupResult;
  if ((unint64_t)mapsIdentifierPlaceLookupResult | v4[29]
    && !-[GEOPDMapsIdentifierPlaceLookupResult isEqual:](mapsIdentifierPlaceLookupResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  batchReverseGeocodingResult = self->_batchReverseGeocodingResult;
  if ((unint64_t)batchReverseGeocodingResult | v4[12]
    && !-[GEOPDBatchReverseGeocodingResult isEqual:](batchReverseGeocodingResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  brandLookupResult = self->_brandLookupResult;
  if ((unint64_t)brandLookupResult | v4[14]
    && !-[GEOPDBrandLookupResult isEqual:](brandLookupResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  wifiFingerprintResult = self->_wifiFingerprintResult;
  if ((unint64_t)wifiFingerprintResult | v4[53]
    && !-[GEOPDWifiFingerprintResult isEqual:](wifiFingerprintResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  ipGeoLookupResult = self->_ipGeoLookupResult;
  if ((unint64_t)ipGeoLookupResult | v4[26]
    && !-[GEOPDIpGeoLookupResult isEqual:](ipGeoLookupResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  groundViewLabelResult = self->_groundViewLabelResult;
  if ((unint64_t)groundViewLabelResult | v4[24]
    && !-[GEOPDGroundViewLabelResult isEqual:](groundViewLabelResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  batchSpatialLookupResult = self->_batchSpatialLookupResult;
  if ((unint64_t)batchSpatialLookupResult | v4[13]
    && !-[GEOPDBatchSpatialLookupResult isEqual:](batchSpatialLookupResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  placeGlobalCommonResult = self->_placeGlobalCommonResult;
  if ((unint64_t)placeGlobalCommonResult | v4[35]
    && !-[GEOPDPlaceGlobalCommonResult isEqual:](placeGlobalCommonResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  placeCollectionLookupResult = self->_placeCollectionLookupResult;
  if ((unint64_t)placeCollectionLookupResult | v4[34]
    && !-[GEOPDPlaceCollectionLookupResult isEqual:](placeCollectionLookupResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  transitScheduleLookupResult = self->_transitScheduleLookupResult;
  if ((unint64_t)transitScheduleLookupResult | v4[51]
    && !-[GEOPDTransitScheduleLookupResult isEqual:](transitScheduleLookupResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  batchCategoryLookupResult = self->_batchCategoryLookupResult;
  if ((unint64_t)batchCategoryLookupResult | v4[9]
    && !-[GEOPDBatchCategoryLookupResult isEqual:](batchCategoryLookupResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  batchMerchantLookupBrandResult = self->_batchMerchantLookupBrandResult;
  if ((unint64_t)batchMerchantLookupBrandResult | v4[10]
    && !-[GEOPDBatchMerchantLookupBrandResult isEqual:](batchMerchantLookupBrandResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  childPlaceLookupByCategoryResult = self->_childPlaceLookupByCategoryResult;
  if ((unint64_t)childPlaceLookupByCategoryResult | v4[18]
    && !-[GEOPDChildPlaceLookupByCategoryResult isEqual:](childPlaceLookupByCategoryResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  mapsSearchHomeResult = self->_mapsSearchHomeResult;
  if ((unint64_t)mapsSearchHomeResult | v4[30]
    && !-[GEOPDMapsSearchHomeResult isEqual:](mapsSearchHomeResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  collectionSuggestionResult = self->_collectionSuggestionResult;
  if ((unint64_t)collectionSuggestionResult | v4[19]
    && !-[GEOPDCollectionSuggestionResult isEqual:](collectionSuggestionResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  publisherViewResult = self->_publisherViewResult;
  if ((unint64_t)publisherViewResult | v4[41]
    && !-[GEOPDPublisherViewResult isEqual:](publisherViewResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  allCollectionsViewResult = self->_allCollectionsViewResult;
  if ((unint64_t)allCollectionsViewResult | v4[6]
    && !-[GEOPDAllCollectionsViewResult isEqual:](allCollectionsViewResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  airportEntityPlaceLookupResult = self->_airportEntityPlaceLookupResult;
  if ((unint64_t)airportEntityPlaceLookupResult | v4[5]
    && !-[GEOPDAirportEntityPlaceLookupResult isEqual:](airportEntityPlaceLookupResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  territoryLookupResult = self->_territoryLookupResult;
  if ((unint64_t)territoryLookupResult | v4[50]
    && !-[GEOPDTerritoryLookupResult isEqual:](territoryLookupResult, "isEqual:"))
  {
    goto LABEL_104;
  }
  mapsHomeResult = self->_mapsHomeResult;
  if ((unint64_t)mapsHomeResult | v4[28] && !-[GEOPDMapsHomeResult isEqual:](mapsHomeResult, "isEqual:"))
    goto LABEL_104;
  allGuidesLocationsViewresult = self->_allGuidesLocationsViewresult;
  if ((unint64_t)allGuidesLocationsViewresult | v4[7]
    && !-[GEOPDAllGuidesLocationsViewResult isEqual:](allGuidesLocationsViewresult, "isEqual:"))
  {
    goto LABEL_104;
  }
  if (((guidesHomeResult = self->_guidesHomeResult, !((unint64_t)guidesHomeResult | v4[25]))
     || -[GEOPDGuidesHomeResult isEqual:](guidesHomeResult, "isEqual:"))
    && ((extendedGeoLookupResult = self->_extendedGeoLookupResult, !((unint64_t)extendedGeoLookupResult | v4[20]))
     || -[GEOPDExtendedGeoLookupResult isEqual:](extendedGeoLookupResult, "isEqual:"))
    && ((queryUnderstandingResult = self->_queryUnderstandingResult,
         !((unint64_t)queryUnderstandingResult | v4[42]))
     || -[GEOPDQueryUnderstandingResult isEqual:](queryUnderstandingResult, "isEqual:"))
    && ((poiAtAddressLookupResult = self->_poiAtAddressLookupResult,
         !((unint64_t)poiAtAddressLookupResult | v4[39]))
     || -[GEOPDPoiAtAddressLookupResult isEqual:](poiAtAddressLookupResult, "isEqual:"))
    && ((placecardEnrichmentResult = self->_placecardEnrichmentResult,
         !((unint64_t)placecardEnrichmentResult | v4[38]))
     || -[GEOPDPlacecardEnrichmentResult isEqual:](placecardEnrichmentResult, "isEqual:"))
    && ((offlineRegionNameResult = self->_offlineRegionNameResult, !((unint64_t)offlineRegionNameResult | v4[33]))
     || -[GEOPDOfflineRegionNameResult isEqual:](offlineRegionNameResult, "isEqual:"))
    && ((searchCapabilitiesResult = self->_searchCapabilitiesResult,
         !((unint64_t)searchCapabilitiesResult | v4[44]))
     || -[GEOPDSearchCapabilitiesResult isEqual:](searchCapabilitiesResult, "isEqual:")))
  {
    addressRecommendationResult = self->_addressRecommendationResult;
    if ((unint64_t)addressRecommendationResult | v4[4])
      v56 = -[GEOPDAddressRecommendationResult isEqual:](addressRecommendationResult, "isEqual:");
    else
      v56 = 1;
  }
  else
  {
LABEL_104:
    v56 = 0;
  }

  return v56;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;

  -[GEOPDPlaceGlobalResult readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDSearchResult hash](self->_searchResult, "hash");
  v4 = -[GEOPDGeocodingResult hash](self->_geocodingResult, "hash") ^ v3;
  v5 = v4 ^ -[GEOPDCanonicalLocationSearchResult hash](self->_canonicalSearchResult, "hash");
  v6 = -[GEOPDReverseGeocodingResult hash](self->_reverseGeocodingResult, "hash");
  v7 = v5 ^ v6 ^ -[GEOPDPlaceLookupResult hash](self->_placeLookupResult, "hash");
  v8 = -[GEOPDMerchantLookupResult hash](self->_merchantLookupResult, "hash");
  v9 = v8 ^ -[GEOPDPlaceRefinementResult hash](self->_placeRefinementResult, "hash");
  v10 = v7 ^ v9 ^ -[GEOPDSiriSearchResult hash](self->_siriSearchResult, "hash");
  v11 = -[GEOPDLocationDirectedSearchResult hash](self->_locationDirectedSearchResult, "hash");
  v12 = v11 ^ -[GEOPDAutocompleteResult hash](self->_autocompleteResult, "hash");
  v13 = v12 ^ -[GEOPDSearchBrowseCategorySuggestionResult hash](self->_browseCategorySuggestionResult, "hash");
  v14 = v13 ^ -[GEOPDCategorySearchResult hash](self->_categorySearchResult, "hash");
  v15 = v10 ^ v14 ^ -[GEOPDPopularNearbySearchResult hash](self->_popularNearbySearchResult, "hash");
  v16 = -[GEOPDSearchZeroKeywordCategorySuggestionResult hash](self->_searchZeroKeywordCategorySuggestionResult, "hash");
  v17 = v16 ^ -[GEOPDSearchFieldPlaceholderResult hash](self->_searchFieldPlaceholderResult, "hash");
  v18 = v17 ^ -[GEOPDBatchPopularNearbySearchResult hash](self->_batchPopularNearbySearchResult, "hash");
  v19 = v18 ^ -[GEOPDVendorSpecificPlaceRefinementResult hash](self->_vendorSpecificPlaceRefinementResult, "hash");
  v20 = v19 ^ -[GEOPDNearbySearchResult hash](self->_nearbySearchResult, "hash");
  v21 = v15 ^ v20 ^ -[GEOPDAddressObjectGeocodingResult hash](self->_addressObjectGeocodingResult, "hash");
  v22 = -[GEOPDSearchZeroKeywordWithSearchResultsSuggestionResult hash](self->_searchZeroKeywordWithSearchResultsSuggestionResult, "hash");
  v23 = v22 ^ -[GEOPDExternalTransitLookupResult hash](self->_externalTransitLookupResult, "hash");
  v24 = v23 ^ -[GEOPDFeatureIdGeocodingResult hash](self->_featureIdGeocodingResult, "hash");
  v25 = v24 ^ -[GEOPDMapsIdentifierPlaceLookupResult hash](self->_mapsIdentifierPlaceLookupResult, "hash");
  v26 = v25 ^ -[GEOPDBatchReverseGeocodingResult hash](self->_batchReverseGeocodingResult, "hash");
  v27 = v21 ^ v26 ^ -[GEOPDBrandLookupResult hash](self->_brandLookupResult, "hash");
  v28 = -[GEOPDWifiFingerprintResult hash](self->_wifiFingerprintResult, "hash");
  v29 = v28 ^ -[GEOPDIpGeoLookupResult hash](self->_ipGeoLookupResult, "hash");
  v30 = v29 ^ -[GEOPDGroundViewLabelResult hash](self->_groundViewLabelResult, "hash");
  v31 = v30 ^ -[GEOPDBatchSpatialLookupResult hash](self->_batchSpatialLookupResult, "hash");
  v32 = v31 ^ -[GEOPDPlaceGlobalCommonResult hash](self->_placeGlobalCommonResult, "hash");
  v33 = v32 ^ -[GEOPDPlaceCollectionLookupResult hash](self->_placeCollectionLookupResult, "hash");
  v34 = v27 ^ v33 ^ -[GEOPDTransitScheduleLookupResult hash](self->_transitScheduleLookupResult, "hash");
  v35 = -[GEOPDBatchCategoryLookupResult hash](self->_batchCategoryLookupResult, "hash");
  v36 = v35 ^ -[GEOPDBatchMerchantLookupBrandResult hash](self->_batchMerchantLookupBrandResult, "hash");
  v37 = v36 ^ -[GEOPDChildPlaceLookupByCategoryResult hash](self->_childPlaceLookupByCategoryResult, "hash");
  v38 = v37 ^ -[GEOPDMapsSearchHomeResult hash](self->_mapsSearchHomeResult, "hash");
  v39 = v38 ^ -[GEOPDCollectionSuggestionResult hash](self->_collectionSuggestionResult, "hash");
  v40 = v39 ^ -[GEOPDPublisherViewResult hash](self->_publisherViewResult, "hash");
  v41 = v40 ^ -[GEOPDAllCollectionsViewResult hash](self->_allCollectionsViewResult, "hash");
  v42 = v34 ^ v41 ^ -[GEOPDAirportEntityPlaceLookupResult hash](self->_airportEntityPlaceLookupResult, "hash");
  v43 = -[GEOPDTerritoryLookupResult hash](self->_territoryLookupResult, "hash");
  v44 = v43 ^ -[GEOPDMapsHomeResult hash](self->_mapsHomeResult, "hash");
  v45 = v44 ^ -[GEOPDAllGuidesLocationsViewResult hash](self->_allGuidesLocationsViewresult, "hash");
  v46 = v45 ^ -[GEOPDGuidesHomeResult hash](self->_guidesHomeResult, "hash");
  v47 = v46 ^ -[GEOPDExtendedGeoLookupResult hash](self->_extendedGeoLookupResult, "hash");
  v48 = v47 ^ -[GEOPDQueryUnderstandingResult hash](self->_queryUnderstandingResult, "hash");
  v49 = v48 ^ -[GEOPDPoiAtAddressLookupResult hash](self->_poiAtAddressLookupResult, "hash");
  v50 = v49 ^ -[GEOPDPlacecardEnrichmentResult hash](self->_placecardEnrichmentResult, "hash");
  v51 = v42 ^ v50 ^ -[GEOPDOfflineRegionNameResult hash](self->_offlineRegionNameResult, "hash");
  v52 = -[GEOPDSearchCapabilitiesResult hash](self->_searchCapabilitiesResult, "hash");
  return v51 ^ v52 ^ -[GEOPDAddressRecommendationResult hash](self->_addressRecommendationResult, "hash");
}

- (void)mergeFrom:(_QWORD *)a1
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  uint64_t v19;
  void *v20;
  _BYTE *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t n;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t ii;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t jj;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t kk;
  _QWORD *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  id *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t mm;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  id *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t nn;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t i1;
  uint64_t v102;
  void *v103;
  id v104;
  void *v105;
  uint64_t v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t i2;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  void *v115;
  id *v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t i3;
  int v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t i4;
  id v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t i5;
  void *v133;
  id v134;
  uint64_t v135;
  id v136;
  void *v137;
  id v138;
  int v139;
  uint64_t v140;
  id *v141;
  id v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t i6;
  uint64_t v147;
  void *v148;
  id v149;
  void *v150;
  uint64_t v151;
  id v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t i7;
  id v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t i8;
  uint64_t v162;
  void *v163;
  _BYTE *v164;
  void *v165;
  id v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t i9;
  uint64_t v171;
  void *v172;
  id v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t i10;
  id v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t i11;
  _QWORD *v183;
  void *v184;
  uint64_t v185;
  void *v186;
  void *v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  int v191;
  void *v192;
  uint64_t v193;
  void *v194;
  uint64_t v195;
  void *v196;
  uint64_t v197;
  void *v198;
  uint64_t v199;
  void *v200;
  id v201;
  void *v202;
  uint64_t v203;
  void *v204;
  uint64_t v205;
  void *v206;
  id *v207;
  id v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t i12;
  id v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t i13;
  uint64_t v218;
  _QWORD *v219;
  void *v220;
  uint64_t v221;
  id *v222;
  id v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t i14;
  void *v228;
  void *v229;
  uint64_t v230;
  id *v231;
  id v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t i15;
  uint64_t v237;
  id *v238;
  id v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t i16;
  uint64_t v244;
  _QWORD *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  uint64_t v252;
  void *v253;
  id v254;
  void *v255;
  void *v256;
  uint64_t v257;
  void *v258;
  void *v259;
  void *v260;
  uint64_t v261;
  void *v262;
  id v263;
  id v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t i17;
  id v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t i18;
  uint64_t v274;
  id *v275;
  id v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t i19;
  uint64_t v281;
  void *v282;
  _QWORD *v283;
  uint64_t v284;
  void *v285;
  void *v286;
  uint64_t v287;
  id *v288;
  id v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t i20;
  uint64_t v294;
  void *v295;
  id *v296;
  id *v297;
  id v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t i21;
  void *v303;
  uint64_t v304;
  id *v305;
  id v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t i22;
  uint64_t v311;
  void *v312;
  id *v313;
  id v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t i23;
  uint64_t v319;
  id v320;
  uint64_t v321;
  void *v322;
  id *v323;
  id v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t i24;
  id v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t i25;
  uint64_t v334;
  void *v335;
  id v336;
  uint64_t v337;
  id *v338;
  id v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t i26;
  id v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t i27;
  id v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t i28;
  void *v354;
  void *v355;
  uint64_t v356;
  id *v357;
  id v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t i29;
  uint64_t v363;
  void *v364;
  id v365;
  void *v366;
  id v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t i30;
  _QWORD *v372;
  void *v373;
  id v374;
  uint64_t v375;
  void *v376;
  uint64_t v377;
  void *v378;
  uint64_t v379;
  void *v380;
  id v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t i31;
  uint64_t v386;
  void *v387;
  _BYTE *v388;
  _DWORD *v389;
  void *v390;
  uint64_t v391;
  void *v392;
  id v393;
  id v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t i32;
  uint64_t v399;
  id *v400;
  id v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t i33;
  void *v406;
  void *v407;
  uint64_t v408;
  void *v409;
  void **v410;
  void *v411;
  void *v412;
  uint64_t v413;
  void *v414;
  _QWORD *v415;
  uint64_t v416;
  void *v417;
  _BYTE *v418;
  void *v419;
  id v420;
  __int128 v421;
  __int128 v422;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  __int128 v426;
  __int128 v427;
  __int128 v428;
  __int128 v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  __int128 v433;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  __int128 v443;
  __int128 v444;
  __int128 v445;
  __int128 v446;
  __int128 v447;
  __int128 v448;
  __int128 v449;
  __int128 v450;
  __int128 v451;
  __int128 v452;
  __int128 v453;
  __int128 v454;
  __int128 v455;
  __int128 v456;
  __int128 v457;
  __int128 v458;
  __int128 v459;
  __int128 v460;
  __int128 v461;
  __int128 v462;
  __int128 v463;
  __int128 v464;
  __int128 v465;
  __int128 v466;
  __int128 v467;
  __int128 v468;
  __int128 v469;
  __int128 v470;
  __int128 v471;
  __int128 v472;
  __int128 v473;
  __int128 v474;
  __int128 v475;
  __int128 v476;
  __int128 v477;
  __int128 v478;
  __int128 v479;
  __int128 v480;
  _BYTE v481[128];
  uint64_t v482;

  v482 = *MEMORY[0x1E0C80C00];
  v420 = a2;
  -[GEOPDPlaceGlobalResult readAll:]((uint64_t)v420, 0);
  v3 = a1[46];
  v4 = (void *)*((_QWORD *)v420 + 46);
  if (v3)
  {
    if (!v4)
      goto LABEL_154;
    v5 = v4;
    -[GEOPDSearchResult readAll:]((uint64_t)v5, 0);
    v6 = *(void **)(v3 + 72);
    v7 = *((_QWORD *)v5 + 9);
    if (v6)
    {
      if (v7)
        objc_msgSend(v6, "mergeFrom:");
    }
    else if (v7)
    {
      -[GEOPDSearchResult setDisplayMapRegion:](v3, *((void **)v5 + 9));
    }
    v451 = 0u;
    v452 = 0u;
    v449 = 0u;
    v450 = 0u;
    v8 = *((id *)v5 + 7);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v449, v481, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v450;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v450 != v11)
            objc_enumerationMutation(v8);
          -[GEOPDSearchResult addDisambiguationLabel:](v3, *(void **)(*((_QWORD *)&v449 + 1) + 8 * i));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v449, v481, 16);
      }
      while (v10);
    }

    if ((*((_BYTE *)v5 + 249) & 1) != 0)
    {
      *(_BYTE *)(v3 + 243) = *((_BYTE *)v5 + 243);
      *(_QWORD *)(v3 + 248) |= 0x100uLL;
    }
    v447 = 0u;
    v448 = 0u;
    v445 = 0u;
    v446 = 0u;
    v13 = *((id *)v5 + 16);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v445, &v477, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v446;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v446 != v16)
            objc_enumerationMutation(v13);
          -[GEOPDSearchResult addRelatedSearchSuggestion:](v3, *(void **)(*((_QWORD *)&v445 + 1) + 8 * j));
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v445, &v477, 16);
      }
      while (v15);
    }

    if ((*((_BYTE *)v5 + 248) & 8) != 0)
    {
      *(_DWORD *)(v3 + 232) = *((_DWORD *)v5 + 58);
      *(_QWORD *)(v3 + 248) |= 8uLL;
    }
    v18 = (void *)*((_QWORD *)v5 + 18);
    if (v18)
      -[GEOPDSearchResult setResultDisplayHeader:](v3, v18);
    v19 = *(_QWORD *)(v3 + 40);
    v20 = (void *)*((_QWORD *)v5 + 5);
    if (v19)
    {
      if (v20)
        -[GEOPDRelatedSearchSuggestion mergeFrom:](v19, v20);
    }
    else if (v20)
    {
      -[GEOPDSearchResult setDefaultRelatedSearchSuggestion:](v3, v20);
    }
    v21 = *(_BYTE **)(v3 + 168);
    v22 = (void *)*((_QWORD *)v5 + 21);
    if (v21)
    {
      if (v22)
        -[GEOPDSearchClientBehavior mergeFrom:](v21, v22);
    }
    else if (v22)
    {
      -[GEOPDSearchResult setSearchClientBehavior:](v3, v22);
    }
    v443 = 0u;
    v444 = 0u;
    v441 = 0u;
    v442 = 0u;
    v23 = *((id *)v5 + 17);
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v441, &v473, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v442;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v442 != v26)
            objc_enumerationMutation(v23);
          -[GEOPDSearchResult addResultDetourInfo:](v3, *(void **)(*((_QWORD *)&v441 + 1) + 8 * k));
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v441, &v473, 16);
      }
      while (v25);
    }

    v28 = *(_QWORD *)(v3 + 48);
    v29 = (void *)*((_QWORD *)v5 + 6);
    if (v28)
    {
      if (v29)
        -[GEOPDDirectionIntent mergeFrom:](v28, v29);
    }
    else if (v29)
    {
      -[GEOPDSearchResult setDirectionIntent:](v3, v29);
    }
    v30 = *(_QWORD *)(v3 + 32);
    v31 = (void *)*((_QWORD *)v5 + 4);
    if (v30)
    {
      if (v31)
        -[GEOPDResolvedItem mergeFrom:](v30, v31);
    }
    else if (v31)
    {
      -[GEOPDSearchResult setClientResolvedResult:](v3, v31);
    }
    v439 = 0u;
    v440 = 0u;
    v437 = 0u;
    v438 = 0u;
    v32 = *((id *)v5 + 8);
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v437, &v469, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v438;
      do
      {
        for (m = 0; m != v34; ++m)
        {
          if (*(_QWORD *)v438 != v35)
            objc_enumerationMutation(v32);
          -[GEOPDSearchResult addDisplayHeaderSubstitute:](v3, *(void **)(*((_QWORD *)&v437 + 1) + 8 * m));
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v437, &v469, 16);
      }
      while (v34);
    }

    v37 = *((_QWORD *)v5 + 31);
    if ((v37 & 0x40) != 0)
    {
      *(_BYTE *)(v3 + 241) = *((_BYTE *)v5 + 241);
      *(_QWORD *)(v3 + 248) |= 0x40uLL;
      v37 = *((_QWORD *)v5 + 31);
      if ((v37 & 1) == 0)
      {
LABEL_66:
        if ((v37 & 0x200) == 0)
          goto LABEL_67;
        goto LABEL_102;
      }
    }
    else if ((v37 & 1) == 0)
    {
      goto LABEL_66;
    }
    *(_DWORD *)(v3 + 220) = *((_DWORD *)v5 + 55);
    *(_QWORD *)(v3 + 248) |= 1uLL;
    v37 = *((_QWORD *)v5 + 31);
    if ((v37 & 0x200) == 0)
    {
LABEL_67:
      if ((v37 & 4) == 0)
        goto LABEL_69;
      goto LABEL_68;
    }
LABEL_102:
    *(_BYTE *)(v3 + 244) = *((_BYTE *)v5 + 244);
    *(_QWORD *)(v3 + 248) |= 0x200uLL;
    if ((*((_QWORD *)v5 + 31) & 4) == 0)
    {
LABEL_69:
      v435 = 0u;
      v436 = 0u;
      v433 = 0u;
      v434 = 0u;
      v38 = *((id *)v5 + 20);
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v433, &v465, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v434;
        do
        {
          for (n = 0; n != v40; ++n)
          {
            if (*(_QWORD *)v434 != v41)
              objc_enumerationMutation(v38);
            -[GEOPDSearchResult addRetainSearch:](v3, *(void **)(*((_QWORD *)&v433 + 1) + 8 * n));
          }
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v433, &v465, 16);
        }
        while (v40);
      }

      v431 = 0u;
      v432 = 0u;
      v429 = 0u;
      v430 = 0u;
      v43 = *((id *)v5 + 22);
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v429, &v461, 16);
      if (v44)
      {
        v45 = v44;
        v46 = *(_QWORD *)v430;
        do
        {
          for (ii = 0; ii != v45; ++ii)
          {
            if (*(_QWORD *)v430 != v46)
              objc_enumerationMutation(v43);
            -[GEOPDSearchResult addSearchResultSection:](v3, *(void **)(*((_QWORD *)&v429 + 1) + 8 * ii));
          }
          v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v429, &v461, 16);
        }
        while (v45);
      }

      v427 = 0u;
      v428 = 0u;
      v425 = 0u;
      v426 = 0u;
      v48 = *((id *)v5 + 15);
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v425, &v457, 16);
      if (v49)
      {
        v50 = v49;
        v51 = *(_QWORD *)v426;
        do
        {
          for (jj = 0; jj != v50; ++jj)
          {
            if (*(_QWORD *)v426 != v51)
              objc_enumerationMutation(v48);
            -[GEOPDSearchResult addRelatedEntitySection:](v3, *(void **)(*((_QWORD *)&v425 + 1) + 8 * jj));
          }
          v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v425, &v457, 16);
        }
        while (v50);
      }

      v423 = 0u;
      v424 = 0u;
      v421 = 0u;
      v422 = 0u;
      v53 = *((id *)v5 + 24);
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v421, &v453, 16);
      if (v54)
      {
        v55 = v54;
        v56 = *(_QWORD *)v422;
        do
        {
          for (kk = 0; kk != v55; ++kk)
          {
            if (*(_QWORD *)v422 != v56)
              objc_enumerationMutation(v53);
            -[GEOPDSearchResult addSearchTierMetadata:](v3, *(void **)(*((_QWORD *)&v421 + 1) + 8 * kk));
          }
          v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v421, &v453, 16);
        }
        while (v55);
      }

      v58 = *(_QWORD **)(v3 + 152);
      v59 = (void *)*((_QWORD *)v5 + 19);
      if (v58)
      {
        if (v59)
          -[GEOPDResultRefinementGroup mergeFrom:](v58, v59);
      }
      else if (v59)
      {
        -[GEOPDSearchResult setResultRefinementGroup:](v3, v59);
      }
      v60 = *(_QWORD *)(v3 + 24);
      v61 = (void *)*((_QWORD *)v5 + 3);
      if (v60)
      {
        if (v61)
          -[GEOPDSSearchAutoRedoThreshold mergeFrom:](v60, v61);
      }
      else if (v61)
      {
        -[GEOPDSearchResult setAutoRedoSearchThreshold:](v3, v61);
      }
      v62 = *(void **)(v3 + 104);
      v63 = *((_QWORD *)v5 + 13);
      if (v62)
      {
        if (v63)
          objc_msgSend(v62, "mergeFrom:");
      }
      else if (v63)
      {
        -[GEOPDSearchResult setPlaceSummaryLayoutMetadata:](v3, *((void **)v5 + 13));
      }
      v64 = *(_QWORD *)(v3 + 200);
      v65 = (void *)*((_QWORD *)v5 + 25);
      if (v64)
      {
        if (v65)
          -[GEOPDSearchSectionList mergeFrom:](v64, (uint64_t)v65);
      }
      else if (v65)
      {
        -[GEOPDSearchResult setSectionList:](v3, v65);
      }
      v66 = *((_QWORD *)v5 + 31);
      if ((v66 & 0x20) != 0)
      {
        *(_BYTE *)(v3 + 240) = *((_BYTE *)v5 + 240);
        *(_QWORD *)(v3 + 248) |= 0x20uLL;
        v66 = *((_QWORD *)v5 + 31);
        if ((v66 & 0x10) == 0)
        {
LABEL_123:
          if ((v66 & 0x80) == 0)
            goto LABEL_125;
          goto LABEL_124;
        }
      }
      else if ((v66 & 0x10) == 0)
      {
        goto LABEL_123;
      }
      *(_DWORD *)(v3 + 236) = *((_DWORD *)v5 + 59);
      *(_QWORD *)(v3 + 248) |= 0x10uLL;
      if ((*((_QWORD *)v5 + 31) & 0x80) == 0)
      {
LABEL_125:
        if (!*(_QWORD *)(v3 + 184))
        {
          v67 = (void *)*((_QWORD *)v5 + 23);
          if (v67)
            -[GEOPDSearchResult setSearchSessionData:](v3, v67);
        }
        v68 = *(void **)(v3 + 88);
        v69 = *((_QWORD *)v5 + 11);
        if (v68)
        {
          if (v69)
            objc_msgSend(v68, "mergeFrom:");
        }
        else if (v69)
        {
          -[GEOPDSearchResult setOpenPlaceCardForResultWithId:](v3, *((void **)v5 + 11));
        }
        if ((*((_BYTE *)v5 + 248) & 2) != 0)
        {
          *(_DWORD *)(v3 + 224) = *((_DWORD *)v5 + 56);
          *(_QWORD *)(v3 + 248) |= 2uLL;
        }
        v70 = *(_QWORD *)(v3 + 80);
        v71 = (void *)*((_QWORD *)v5 + 10);
        if (v70)
        {
          if (v71)
            -[GEOPDGuideSummaryLayoutMetadata mergeFrom:](v70, v71);
        }
        else if (v71)
        {
          -[GEOPDSearchResult setGuideSummaryLayoutMetadata:](v3, v71);
        }
        v72 = *(_QWORD *)(v3 + 96);
        v73 = (void *)*((_QWORD *)v5 + 12);
        if (v72)
        {
          if (v73)
            -[GEOPDPaginationInfo mergeFrom:](v72, v73);
        }
        else if (v73)
        {
          -[GEOPDSearchResult setPaginationInfo:](v3, v73);
        }
        v74 = *(_QWORD *)(v3 + 112);
        v75 = (void *)*((_QWORD *)v5 + 14);
        if (v74)
        {
          if (v75)
            -[GEOPDSSearchRedoButtonThreshold mergeFrom:](v74, v75);
        }
        else if (v75)
        {
          -[GEOPDSearchResult setRedoButtonThreshold:](v3, v75);
        }

        goto LABEL_154;
      }
LABEL_124:
      *(_BYTE *)(v3 + 242) = *((_BYTE *)v5 + 242);
      *(_QWORD *)(v3 + 248) |= 0x80uLL;
      goto LABEL_125;
    }
LABEL_68:
    *(_DWORD *)(v3 + 228) = *((_DWORD *)v5 + 57);
    *(_QWORD *)(v3 + 248) |= 4uLL;
    goto LABEL_69;
  }
  if (v4)
    -[GEOPDPlaceGlobalResult setSearchResult:]((uint64_t)a1, v4);
LABEL_154:
  v76 = a1[23];
  v77 = (id *)*((_QWORD *)v420 + 23);
  if (v76)
  {
    if (v77)
    {
      v477 = 0u;
      v478 = 0u;
      v479 = 0u;
      v480 = 0u;
      v78 = v77[2];
      v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
      if (v79)
      {
        v80 = v79;
        v81 = *(_QWORD *)v478;
        do
        {
          for (mm = 0; mm != v80; ++mm)
          {
            if (*(_QWORD *)v478 != v81)
              objc_enumerationMutation(v78);
            -[GEOPDGeocodingResult addDisambiguationLabel:](v76, *(void **)(*((_QWORD *)&v477 + 1) + 8 * mm));
          }
          v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
        }
        while (v80);
      }

    }
  }
  else if (v77)
  {
    -[GEOPDPlaceGlobalResult setGeocodingResult:]((uint64_t)a1, v77);
  }
  if (!a1[16])
  {
    v83 = (void *)*((_QWORD *)v420 + 16);
    if (v83)
      -[GEOPDPlaceGlobalResult setCanonicalSearchResult:]((uint64_t)a1, v83);
  }
  if (!a1[43])
  {
    v84 = (void *)*((_QWORD *)v420 + 43);
    if (v84)
      -[GEOPDPlaceGlobalResult setReverseGeocodingResult:]((uint64_t)a1, v84);
  }
  if (!a1[36])
  {
    v85 = (void *)*((_QWORD *)v420 + 36);
    if (v85)
      -[GEOPDPlaceGlobalResult setPlaceLookupResult:]((uint64_t)a1, v85);
  }
  v86 = (void *)a1[31];
  v87 = *((_QWORD *)v420 + 31);
  if (v86)
  {
    if (v87)
      objc_msgSend(v86, "mergeFrom:");
  }
  else if (v87)
  {
    -[GEOPDPlaceGlobalResult setMerchantLookupResult:]((uint64_t)a1, *((void **)v420 + 31));
  }
  if (!a1[37])
  {
    v88 = (void *)*((_QWORD *)v420 + 37);
    if (v88)
      -[GEOPDPlaceGlobalResult setPlaceRefinementResult:]((uint64_t)a1, v88);
  }
  v89 = a1[49];
  v90 = (void *)*((_QWORD *)v420 + 49);
  if (v89)
  {
    if (v90)
    {
      v91 = v90;
      -[GEOPDSiriSearchResult readAll:]((uint64_t)v91, 0);
      v476 = 0u;
      v475 = 0u;
      v474 = 0u;
      v473 = 0u;
      v92 = v91[3];
      v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v473, v481, 16);
      if (v93)
      {
        v94 = v93;
        v95 = *(_QWORD *)v474;
        do
        {
          for (nn = 0; nn != v94; ++nn)
          {
            if (*(_QWORD *)v474 != v95)
              objc_enumerationMutation(v92);
            -[GEOPDSiriSearchResult addDisambiguationLabel:](v89, *(void **)(*((_QWORD *)&v473 + 1) + 8 * nn));
          }
          v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v473, v481, 16);
        }
        while (v94);
      }

      v472 = 0u;
      v471 = 0u;
      v470 = 0u;
      v469 = 0u;
      v97 = v91[4];
      v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v469, &v477, 16);
      if (v98)
      {
        v99 = v98;
        v100 = *(_QWORD *)v470;
        do
        {
          for (i1 = 0; i1 != v99; ++i1)
          {
            if (*(_QWORD *)v470 != v100)
              objc_enumerationMutation(v97);
            -[GEOPDSiriSearchResult addResultDetourInfo:](v89, *(void **)(*((_QWORD *)&v469 + 1) + 8 * i1));
          }
          v99 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v469, &v477, 16);
        }
        while (v99);
      }

      if (((_BYTE)v91[7] & 1) != 0)
      {
        *(_BYTE *)(v89 + 52) = *((_BYTE *)v91 + 52);
        *(_BYTE *)(v89 + 56) |= 1u;
      }

    }
  }
  else if (v90)
  {
    -[GEOPDPlaceGlobalResult setSiriSearchResult:]((uint64_t)a1, v90);
  }
  v102 = a1[27];
  v103 = (void *)*((_QWORD *)v420 + 27);
  if (v102)
  {
    if (v103)
    {
      v104 = v103;
      -[GEOPDLocationDirectedSearchResult readAll:]((uint64_t)v104, 0);
      v105 = *(void **)(v102 + 32);
      v106 = *((_QWORD *)v104 + 4);
      if (v105)
      {
        if (v106)
          objc_msgSend(v105, "mergeFrom:");
      }
      else if (v106)
      {
        -[GEOPDLocationDirectedSearchResult setDisplayMapRegion:](v102, *((void **)v104 + 4));
      }
      v480 = 0u;
      v479 = 0u;
      v478 = 0u;
      v477 = 0u;
      v107 = *((id *)v104 + 3);
      v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
      if (v108)
      {
        v109 = v108;
        v110 = *(_QWORD *)v478;
        do
        {
          for (i2 = 0; i2 != v109; ++i2)
          {
            if (*(_QWORD *)v478 != v110)
              objc_enumerationMutation(v107);
            -[GEOPDLocationDirectedSearchResult addDisambiguationLabel:](v102, *(void **)(*((_QWORD *)&v477 + 1) + 8 * i2));
          }
          v109 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
        }
        while (v109);
      }

      v112 = *(_QWORD *)(v102 + 40);
      v113 = (void *)*((_QWORD *)v104 + 5);
      if (v112)
      {
        if (v113)
          -[GEOPDPaginationInfo mergeFrom:](v112, v113);
      }
      else if (v113)
      {
        -[GEOPDLocationDirectedSearchResult setPaginationInfo:](v102, v113);
      }

    }
  }
  else if (v103)
  {
    -[GEOPDPlaceGlobalResult setLocationDirectedSearchResult:]((uint64_t)a1, v103);
  }
  v114 = a1[8];
  v115 = (void *)*((_QWORD *)v420 + 8);
  if (v114)
  {
    if (!v115)
      goto LABEL_287;
    v116 = v115;
    -[GEOPDAutocompleteResult readAll:]((uint64_t)v116, 0);
    v472 = 0u;
    v471 = 0u;
    v470 = 0u;
    v469 = 0u;
    v117 = v116[7];
    v118 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v469, v481, 16);
    if (v118)
    {
      v119 = v118;
      v120 = *(_QWORD *)v470;
      do
      {
        for (i3 = 0; i3 != v119; ++i3)
        {
          if (*(_QWORD *)v470 != v120)
            objc_enumerationMutation(v117);
          -[GEOPDAutocompleteResult addSections:]((os_unfair_lock_s *)v114, *(void **)(*((_QWORD *)&v469 + 1) + 8 * i3));
        }
        v119 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v469, v481, 16);
      }
      while (v119);
    }

    v122 = *((_DWORD *)v116 + 26);
    if ((v122 & 8) != 0)
    {
      *(_BYTE *)(v114 + 96) = *((_BYTE *)v116 + 96);
      *(_DWORD *)(v114 + 104) |= 8u;
      v122 = *((_DWORD *)v116 + 26);
      if ((v122 & 0x100) == 0)
      {
LABEL_237:
        if ((v122 & 4) == 0)
          goto LABEL_238;
        goto LABEL_265;
      }
    }
    else if ((v122 & 0x100) == 0)
    {
      goto LABEL_237;
    }
    *(_BYTE *)(v114 + 101) = *((_BYTE *)v116 + 101);
    *(_DWORD *)(v114 + 104) |= 0x100u;
    v122 = *((_DWORD *)v116 + 26);
    if ((v122 & 4) == 0)
    {
LABEL_238:
      if ((v122 & 0x20) == 0)
        goto LABEL_240;
      goto LABEL_239;
    }
LABEL_265:
    *(_DWORD *)(v114 + 92) = *((_DWORD *)v116 + 23);
    *(_DWORD *)(v114 + 104) |= 4u;
    if (((_DWORD)v116[13] & 0x20) == 0)
    {
LABEL_240:
      v467 = 0u;
      v468 = 0u;
      v465 = 0u;
      v466 = 0u;
      v123 = v116[8];
      v124 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v465, &v477, 16);
      if (v124)
      {
        v125 = v124;
        v126 = *(_QWORD *)v466;
        do
        {
          for (i4 = 0; i4 != v125; ++i4)
          {
            if (*(_QWORD *)v466 != v126)
              objc_enumerationMutation(v123);
            -[GEOPDAutocompleteResult addSortPriorityMapping:]((os_unfair_lock_s *)v114, *(void **)(*((_QWORD *)&v465 + 1) + 8 * i4));
          }
          v125 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v465, &v477, 16);
        }
        while (v125);
      }

      if (((_BYTE)v116[13] & 0x40) != 0)
      {
        *(_BYTE *)(v114 + 99) = *((_BYTE *)v116 + 99);
        *(_DWORD *)(v114 + 104) |= 0x40u;
      }
      v463 = 0u;
      v464 = 0u;
      v461 = 0u;
      v462 = 0u;
      v128 = v116[4];
      v129 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v461, &v473, 16);
      if (v129)
      {
        v130 = v129;
        v131 = *(_QWORD *)v462;
        do
        {
          for (i5 = 0; i5 != v130; ++i5)
          {
            if (*(_QWORD *)v462 != v131)
              objc_enumerationMutation(v128);
            -[GEOPDAutocompleteResult addClientRankingFeatureMetadata:]((os_unfair_lock_s *)v114, *(void **)(*((_QWORD *)&v461 + 1) + 8 * i5));
          }
          v130 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v461, &v473, 16);
        }
        while (v130);
      }

      if (((_BYTE)v116[13] & 0x80) != 0)
      {
        *(_BYTE *)(v114 + 100) = *((_BYTE *)v116 + 100);
        *(_DWORD *)(v114 + 104) |= 0x80u;
      }
      v133 = *(void **)(v114 + 24);
      v134 = v116[3];
      if (v133)
      {
        if (v134)
          objc_msgSend(v133, "mergeFrom:");
      }
      else if (v134)
      {
        -[GEOPDAutocompleteResult setAutocompleteSessionData:](v114, v116[3]);
      }
      v135 = *(_QWORD *)(v114 + 40);
      v136 = v116[5];
      if (v135)
      {
        if (v136)
          -[GEOPDParsecQueryRankingFeatures mergeFrom:](v135, v136);
      }
      else if (v136)
      {
        -[GEOPDAutocompleteResult setParsecQueryRankingFeatures:](v114, v136);
      }
      if ((*((_BYTE *)v116 + 105) & 2) != 0)
      {
        *(_BYTE *)(v114 + 102) = *((_BYTE *)v116 + 102);
        *(_DWORD *)(v114 + 104) |= 0x200u;
      }
      v137 = *(void **)(v114 + 48);
      v138 = v116[6];
      if (v137)
      {
        if (v138)
          objc_msgSend(v137, "mergeFrom:");
      }
      else if (v138)
      {
        -[GEOPDAutocompleteResult setPlaceSummaryLayoutMetadata:](v114, v116[6]);
      }
      v139 = *((_DWORD *)v116 + 26);
      if ((v139 & 0x400) != 0)
      {
        *(_BYTE *)(v114 + 103) = *((_BYTE *)v116 + 103);
        *(_DWORD *)(v114 + 104) |= 0x400u;
        v139 = *((_DWORD *)v116 + 26);
        if ((v139 & 1) == 0)
        {
LABEL_283:
          if ((v139 & 2) == 0)
            goto LABEL_284;
          goto LABEL_308;
        }
      }
      else if ((v139 & 1) == 0)
      {
        goto LABEL_283;
      }
      *(_DWORD *)(v114 + 84) = *((_DWORD *)v116 + 21);
      *(_DWORD *)(v114 + 104) |= 1u;
      v139 = *((_DWORD *)v116 + 26);
      if ((v139 & 2) == 0)
      {
LABEL_284:
        if ((v139 & 0x10) == 0)
        {
LABEL_286:

          goto LABEL_287;
        }
LABEL_285:
        *(_BYTE *)(v114 + 97) = *((_BYTE *)v116 + 97);
        *(_DWORD *)(v114 + 104) |= 0x10u;
        goto LABEL_286;
      }
LABEL_308:
      *(_DWORD *)(v114 + 88) = *((_DWORD *)v116 + 22);
      *(_DWORD *)(v114 + 104) |= 2u;
      if (((_DWORD)v116[13] & 0x10) == 0)
        goto LABEL_286;
      goto LABEL_285;
    }
LABEL_239:
    *(_BYTE *)(v114 + 98) = *((_BYTE *)v116 + 98);
    *(_DWORD *)(v114 + 104) |= 0x20u;
    goto LABEL_240;
  }
  if (v115)
    -[GEOPDPlaceGlobalResult setAutocompleteResult:]((uint64_t)a1, v115);
LABEL_287:
  v140 = a1[15];
  v141 = (id *)*((_QWORD *)v420 + 15);
  if (v140)
  {
    if (v141)
    {
      v477 = 0u;
      v478 = 0u;
      v479 = 0u;
      v480 = 0u;
      v142 = v141[2];
      v143 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
      if (v143)
      {
        v144 = v143;
        v145 = *(_QWORD *)v478;
        do
        {
          for (i6 = 0; i6 != v144; ++i6)
          {
            if (*(_QWORD *)v478 != v145)
              objc_enumerationMutation(v142);
            -[GEOPDSearchBrowseCategorySuggestionResult addCategory:](v140, *(void **)(*((_QWORD *)&v477 + 1) + 8 * i6));
          }
          v144 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
        }
        while (v144);
      }

    }
  }
  else if (v141)
  {
    -[GEOPDPlaceGlobalResult setBrowseCategorySuggestionResult:]((uint64_t)a1, v141);
  }
  v147 = a1[17];
  v148 = (void *)*((_QWORD *)v420 + 17);
  if (v147)
  {
    if (!v148)
      goto LABEL_414;
    v149 = v148;
    -[GEOPDCategorySearchResult readAll:]((uint64_t)v149, 0);
    v150 = *(void **)(v147 + 56);
    v151 = *((_QWORD *)v149 + 7);
    if (v150)
    {
      if (v151)
        objc_msgSend(v150, "mergeFrom:");
    }
    else if (v151)
    {
      -[GEOPDCategorySearchResult setDisplayMapRegion:](v147, *((void **)v149 + 7));
    }
    if ((*((_BYTE *)v149 + 184) & 0x20) != 0)
    {
      *(_BYTE *)(v147 + 183) = *((_BYTE *)v149 + 183);
      *(_DWORD *)(v147 + 184) |= 0x20u;
    }
    v463 = 0u;
    v464 = 0u;
    v461 = 0u;
    v462 = 0u;
    v152 = *((id *)v149 + 13);
    v153 = objc_msgSend(v152, "countByEnumeratingWithState:objects:count:", &v461, v481, 16);
    if (v153)
    {
      v154 = v153;
      v155 = *(_QWORD *)v462;
      do
      {
        for (i7 = 0; i7 != v154; ++i7)
        {
          if (*(_QWORD *)v462 != v155)
            objc_enumerationMutation(v152);
          -[GEOPDCategorySearchResult addRelatedSearchSuggestion:]((os_unfair_lock_s *)v147, *(void **)(*((_QWORD *)&v461 + 1) + 8 * i7));
        }
        v154 = objc_msgSend(v152, "countByEnumeratingWithState:objects:count:", &v461, v481, 16);
      }
      while (v154);
    }

    v459 = 0u;
    v460 = 0u;
    v457 = 0u;
    v458 = 0u;
    v157 = *((id *)v149 + 14);
    v158 = objc_msgSend(v157, "countByEnumeratingWithState:objects:count:", &v457, &v477, 16);
    if (v158)
    {
      v159 = v158;
      v160 = *(_QWORD *)v458;
      do
      {
        for (i8 = 0; i8 != v159; ++i8)
        {
          if (*(_QWORD *)v458 != v160)
            objc_enumerationMutation(v157);
          -[GEOPDCategorySearchResult addResultDetourInfo:]((os_unfair_lock_s *)v147, *(void **)(*((_QWORD *)&v457 + 1) + 8 * i8));
        }
        v159 = objc_msgSend(v157, "countByEnumeratingWithState:objects:count:", &v457, &v477, 16);
      }
      while (v159);
    }

    v162 = *(_QWORD *)(v147 + 48);
    v163 = (void *)*((_QWORD *)v149 + 6);
    if (v162)
    {
      if (v163)
        -[GEOPDRelatedSearchSuggestion mergeFrom:](v162, v163);
    }
    else if (v163)
    {
      -[GEOPDCategorySearchResult setDefaultRelatedSearchSuggestion:](v147, v163);
    }
    v164 = *(_BYTE **)(v147 + 128);
    v165 = (void *)*((_QWORD *)v149 + 16);
    if (v164)
    {
      if (v165)
        -[GEOPDSearchClientBehavior mergeFrom:](v164, v165);
    }
    else if (v165)
    {
      -[GEOPDCategorySearchResult setSearchClientBehavior:](v147, v165);
    }
    if ((*((_BYTE *)v149 + 184) & 8) != 0)
    {
      *(_BYTE *)(v147 + 181) = *((_BYTE *)v149 + 181);
      *(_DWORD *)(v147 + 184) |= 8u;
    }
    v455 = 0u;
    v456 = 0u;
    v453 = 0u;
    v454 = 0u;
    v166 = *((id *)v149 + 4);
    v167 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v453, &v473, 16);
    if (v167)
    {
      v168 = v167;
      v169 = *(_QWORD *)v454;
      do
      {
        for (i9 = 0; i9 != v168; ++i9)
        {
          if (*(_QWORD *)v454 != v169)
            objc_enumerationMutation(v166);
          -[GEOPDCategorySearchResult addBrowseCategory:]((os_unfair_lock_s *)v147, *(void **)(*((_QWORD *)&v453 + 1) + 8 * i9));
        }
        v168 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v453, &v473, 16);
      }
      while (v168);
    }

    v171 = *(_QWORD *)(v147 + 40);
    v172 = (void *)*((_QWORD *)v149 + 5);
    if (v171)
    {
      if (v172)
        -[GEOPDSCategorySearchResultSection mergeFrom:](v171, v172);
    }
    else if (v172)
    {
      -[GEOPDCategorySearchResult setCategorySearchResultSection:](v147, v172);
    }
    v451 = 0u;
    v452 = 0u;
    v449 = 0u;
    v450 = 0u;
    v173 = *((id *)v149 + 12);
    v174 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v449, &v469, 16);
    if (v174)
    {
      v175 = v174;
      v176 = *(_QWORD *)v450;
      do
      {
        for (i10 = 0; i10 != v175; ++i10)
        {
          if (*(_QWORD *)v450 != v176)
            objc_enumerationMutation(v173);
          -[GEOPDCategorySearchResult addRelatedEntitySection:]((os_unfair_lock_s *)v147, *(void **)(*((_QWORD *)&v449 + 1) + 8 * i10));
        }
        v175 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v449, &v469, 16);
      }
      while (v175);
    }

    v447 = 0u;
    v448 = 0u;
    v445 = 0u;
    v446 = 0u;
    v178 = *((id *)v149 + 18);
    v179 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v445, &v465, 16);
    if (v179)
    {
      v180 = v179;
      v181 = *(_QWORD *)v446;
      do
      {
        for (i11 = 0; i11 != v180; ++i11)
        {
          if (*(_QWORD *)v446 != v181)
            objc_enumerationMutation(v178);
          -[GEOPDCategorySearchResult addSearchTierMetadata:](v147, *(void **)(*((_QWORD *)&v445 + 1) + 8 * i11));
        }
        v180 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v445, &v465, 16);
      }
      while (v180);
    }

    v183 = *(_QWORD **)(v147 + 120);
    v184 = (void *)*((_QWORD *)v149 + 15);
    if (v183)
    {
      if (v184)
        -[GEOPDResultRefinementGroup mergeFrom:](v183, v184);
    }
    else if (v184)
    {
      -[GEOPDCategorySearchResult setResultRefinementGroup:](v147, v184);
    }
    v185 = *(_QWORD *)(v147 + 24);
    v186 = (void *)*((_QWORD *)v149 + 3);
    if (v185)
    {
      if (v186)
        -[GEOPDSSearchAutoRedoThreshold mergeFrom:](v185, v186);
    }
    else if (v186)
    {
      -[GEOPDCategorySearchResult setAutoRedoSearchThreshold:](v147, v186);
    }
    v187 = *(void **)(v147 + 80);
    v188 = *((_QWORD *)v149 + 10);
    if (v187)
    {
      if (v188)
        objc_msgSend(v187, "mergeFrom:");
    }
    else if (v188)
    {
      -[GEOPDCategorySearchResult setPlaceSummaryLayoutMetadata:](v147, *((void **)v149 + 10));
    }
    v189 = *(_QWORD *)(v147 + 152);
    v190 = (void *)*((_QWORD *)v149 + 19);
    if (v189)
    {
      if (v190)
        -[GEOPDSearchSectionList mergeFrom:](v189, (uint64_t)v190);
    }
    else if (v190)
    {
      -[GEOPDCategorySearchResult setSectionList:](v147, v190);
    }
    v191 = *((_DWORD *)v149 + 46);
    if ((v191 & 4) != 0)
    {
      *(_BYTE *)(v147 + 180) = *((_BYTE *)v149 + 180);
      *(_DWORD *)(v147 + 184) |= 4u;
      v191 = *((_DWORD *)v149 + 46);
      if ((v191 & 2) == 0)
      {
LABEL_388:
        if ((v191 & 0x10) == 0)
          goto LABEL_390;
        goto LABEL_389;
      }
    }
    else if ((v191 & 2) == 0)
    {
      goto LABEL_388;
    }
    *(_DWORD *)(v147 + 176) = *((_DWORD *)v149 + 44);
    *(_DWORD *)(v147 + 184) |= 2u;
    if ((*((_DWORD *)v149 + 46) & 0x10) == 0)
    {
LABEL_390:
      if (!*(_QWORD *)(v147 + 136))
      {
        v192 = (void *)*((_QWORD *)v149 + 17);
        if (v192)
          -[GEOPDCategorySearchResult setSearchSessionData:](v147, v192);
      }
      if ((*((_BYTE *)v149 + 184) & 1) != 0)
      {
        *(_DWORD *)(v147 + 172) = *((_DWORD *)v149 + 43);
        *(_DWORD *)(v147 + 184) |= 1u;
      }
      v193 = *(_QWORD *)(v147 + 64);
      v194 = (void *)*((_QWORD *)v149 + 8);
      if (v193)
      {
        if (v194)
          -[GEOPDGuideSummaryLayoutMetadata mergeFrom:](v193, v194);
      }
      else if (v194)
      {
        -[GEOPDCategorySearchResult setGuideSummaryLayoutMetadata:](v147, v194);
      }
      v195 = *(_QWORD *)(v147 + 72);
      v196 = (void *)*((_QWORD *)v149 + 9);
      if (v195)
      {
        if (v196)
          -[GEOPDPaginationInfo mergeFrom:](v195, v196);
      }
      else if (v196)
      {
        -[GEOPDCategorySearchResult setPaginationInfo:](v147, v196);
      }
      v197 = *(_QWORD *)(v147 + 88);
      v198 = (void *)*((_QWORD *)v149 + 11);
      if (v197)
      {
        if (v198)
          -[GEOPDSSearchRedoButtonThreshold mergeFrom:](v197, v198);
      }
      else if (v198)
      {
        -[GEOPDCategorySearchResult setRedoButtonThreshold:](v147, v198);
      }

      goto LABEL_414;
    }
LABEL_389:
    *(_BYTE *)(v147 + 182) = *((_BYTE *)v149 + 182);
    *(_DWORD *)(v147 + 184) |= 0x10u;
    goto LABEL_390;
  }
  if (v148)
    -[GEOPDPlaceGlobalResult setCategorySearchResult:]((uint64_t)a1, v148);
LABEL_414:
  v199 = a1[40];
  v200 = (void *)*((_QWORD *)v420 + 40);
  if (v199)
  {
    if (v200)
    {
      v201 = v200;
      -[GEOPDPopularNearbySearchResult readAll:]((uint64_t)v201, 0);
      v202 = *(void **)(v199 + 24);
      v203 = *((_QWORD *)v201 + 3);
      if (v202)
      {
        if (v203)
          objc_msgSend(v202, "mergeFrom:");
      }
      else if (v203)
      {
        -[GEOPDPopularNearbySearchResult setDisplayMapRegion:](v199, *((void **)v201 + 3));
      }
      v204 = (void *)*((_QWORD *)v201 + 4);
      if (v204)
        -[GEOPDPopularNearbySearchResult setSectionHeader:](v199, v204);
      if ((*((_BYTE *)v201 + 56) & 1) != 0)
      {
        *(_BYTE *)(v199 + 52) = *((_BYTE *)v201 + 52);
        *(_BYTE *)(v199 + 56) |= 1u;
      }

    }
  }
  else if (v200)
  {
    -[GEOPDPlaceGlobalResult setPopularNearbySearchResult:]((uint64_t)a1, v200);
  }
  v205 = a1[47];
  v206 = (void *)*((_QWORD *)v420 + 47);
  if (v205)
  {
    if (v206)
    {
      v207 = v206;
      -[GEOPDSearchZeroKeywordCategorySuggestionResult readAll:]((uint64_t)v207, 0);
      v476 = 0u;
      v475 = 0u;
      v474 = 0u;
      v473 = 0u;
      v208 = v207[3];
      v209 = objc_msgSend(v208, "countByEnumeratingWithState:objects:count:", &v473, v481, 16);
      if (v209)
      {
        v210 = v209;
        v211 = *(_QWORD *)v474;
        do
        {
          for (i12 = 0; i12 != v210; ++i12)
          {
            if (*(_QWORD *)v474 != v211)
              objc_enumerationMutation(v208);
            -[GEOPDSearchZeroKeywordCategorySuggestionResult addCategory:](v205, *(void **)(*((_QWORD *)&v473 + 1) + 8 * i12));
          }
          v210 = objc_msgSend(v208, "countByEnumeratingWithState:objects:count:", &v473, v481, 16);
        }
        while (v210);
      }

      v472 = 0u;
      v471 = 0u;
      v470 = 0u;
      v469 = 0u;
      v213 = v207[4];
      v214 = objc_msgSend(v213, "countByEnumeratingWithState:objects:count:", &v469, &v477, 16);
      if (v214)
      {
        v215 = v214;
        v216 = *(_QWORD *)v470;
        do
        {
          for (i13 = 0; i13 != v215; ++i13)
          {
            if (*(_QWORD *)v470 != v216)
              objc_enumerationMutation(v213);
            -[GEOPDSearchZeroKeywordCategorySuggestionResult addZeroKeywordEntry:](v205, *(void **)(*((_QWORD *)&v469 + 1) + 8 * i13));
          }
          v215 = objc_msgSend(v213, "countByEnumeratingWithState:objects:count:", &v469, &v477, 16);
        }
        while (v215);
      }

    }
  }
  else if (v206)
  {
    -[GEOPDPlaceGlobalResult setSearchZeroKeywordCategorySuggestionResult:]((uint64_t)a1, v206);
  }
  v218 = a1[45];
  v219 = (_QWORD *)*((_QWORD *)v420 + 45);
  if (v218)
  {
    if (v219)
    {
      v220 = (void *)v219[2];
      if (v220)
        -[GEOPDSearchFieldPlaceholderResult setDisplayString:](v218, v220);
    }
  }
  else if (v219)
  {
    -[GEOPDPlaceGlobalResult setSearchFieldPlaceholderResult:]((uint64_t)a1, v219);
  }
  v221 = a1[11];
  v222 = (id *)*((_QWORD *)v420 + 11);
  if (v221)
  {
    if (v222)
    {
      v477 = 0u;
      v478 = 0u;
      v479 = 0u;
      v480 = 0u;
      v223 = v222[2];
      v224 = objc_msgSend(v223, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
      if (v224)
      {
        v225 = v224;
        v226 = *(_QWORD *)v478;
        do
        {
          for (i14 = 0; i14 != v225; ++i14)
          {
            if (*(_QWORD *)v478 != v226)
              objc_enumerationMutation(v223);
            -[GEOPDBatchPopularNearbySearchResult addPopularNearbyResult:](v221, *(void **)(*((_QWORD *)&v477 + 1) + 8 * i14));
          }
          v225 = objc_msgSend(v223, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
        }
        while (v225);
      }

    }
  }
  else if (v222)
  {
    -[GEOPDPlaceGlobalResult setBatchPopularNearbySearchResult:]((uint64_t)a1, v222);
  }
  if (!a1[52])
  {
    v228 = (void *)*((_QWORD *)v420 + 52);
    if (v228)
      -[GEOPDPlaceGlobalResult setVendorSpecificPlaceRefinementResult:]((uint64_t)a1, v228);
  }
  if (!a1[32])
  {
    v229 = (void *)*((_QWORD *)v420 + 32);
    if (v229)
      -[GEOPDPlaceGlobalResult setNearbySearchResult:]((uint64_t)a1, v229);
  }
  v230 = a1[3];
  v231 = (id *)*((_QWORD *)v420 + 3);
  if (v230)
  {
    if (v231)
    {
      v477 = 0u;
      v478 = 0u;
      v479 = 0u;
      v480 = 0u;
      v232 = v231[2];
      v233 = objc_msgSend(v232, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
      if (v233)
      {
        v234 = v233;
        v235 = *(_QWORD *)v478;
        do
        {
          for (i15 = 0; i15 != v234; ++i15)
          {
            if (*(_QWORD *)v478 != v235)
              objc_enumerationMutation(v232);
            -[GEOPDAddressObjectGeocodingResult addDisambiguationLabel:](v230, *(void **)(*((_QWORD *)&v477 + 1) + 8 * i15));
          }
          v234 = objc_msgSend(v232, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
        }
        while (v234);
      }

    }
  }
  else if (v231)
  {
    -[GEOPDPlaceGlobalResult setAddressObjectGeocodingResult:]((uint64_t)a1, v231);
  }
  v237 = a1[48];
  v238 = (id *)*((_QWORD *)v420 + 48);
  if (v237)
  {
    if (v238)
    {
      v477 = 0u;
      v478 = 0u;
      v479 = 0u;
      v480 = 0u;
      v239 = v238[2];
      v240 = objc_msgSend(v239, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
      if (v240)
      {
        v241 = v240;
        v242 = *(_QWORD *)v478;
        do
        {
          for (i16 = 0; i16 != v241; ++i16)
          {
            if (*(_QWORD *)v478 != v242)
              objc_enumerationMutation(v239);
            -[GEOPDSearchZeroKeywordWithSearchResultsSuggestionResult addSearchResultsForCategoryEntry:](v237, *(void **)(*((_QWORD *)&v477 + 1) + 8 * i16));
          }
          v241 = objc_msgSend(v239, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
        }
        while (v241);
      }

    }
  }
  else if (v238)
  {
    -[GEOPDPlaceGlobalResult setSearchZeroKeywordWithSearchResultsSuggestionResult:]((uint64_t)a1, v238);
  }
  v244 = a1[21];
  v245 = (_QWORD *)*((_QWORD *)v420 + 21);
  if (v244)
  {
    if (v245)
    {
      v246 = (void *)v245[2];
      if (v246)
        -[GEOPDExternalTransitLookupResult setProviderId:](v244, v246);
    }
  }
  else if (v245)
  {
    -[GEOPDPlaceGlobalResult setExternalTransitLookupResult:]((uint64_t)a1, v245);
  }
  if (!a1[22])
  {
    v247 = (void *)*((_QWORD *)v420 + 22);
    if (v247)
      -[GEOPDPlaceGlobalResult setFeatureIdGeocodingResult:]((uint64_t)a1, v247);
  }
  if (!a1[29])
  {
    v248 = (void *)*((_QWORD *)v420 + 29);
    if (v248)
      -[GEOPDPlaceGlobalResult setMapsIdentifierPlaceLookupResult:]((uint64_t)a1, v248);
  }
  if (!a1[12])
  {
    v249 = (void *)*((_QWORD *)v420 + 12);
    if (v249)
      -[GEOPDPlaceGlobalResult setBatchReverseGeocodingResult:]((uint64_t)a1, v249);
  }
  if (!a1[14])
  {
    v250 = (void *)*((_QWORD *)v420 + 14);
    if (v250)
      -[GEOPDPlaceGlobalResult setBrandLookupResult:]((uint64_t)a1, v250);
  }
  if (!a1[53])
  {
    v251 = (void *)*((_QWORD *)v420 + 53);
    if (v251)
      -[GEOPDPlaceGlobalResult setWifiFingerprintResult:]((uint64_t)a1, v251);
  }
  v252 = a1[26];
  v253 = (void *)*((_QWORD *)v420 + 26);
  if (v252)
  {
    if (v253)
    {
      v254 = v253;
      -[GEOPDIpGeoLookupResult readAll:]((uint64_t)v254, 0);
      if ((*((_BYTE *)v254 + 72) & 1) != 0)
      {
        *(_DWORD *)(v252 + 68) = *((_DWORD *)v254 + 17);
        *(_BYTE *)(v252 + 72) |= 1u;
      }
      v255 = (void *)*((_QWORD *)v254 + 4);
      if (v255)
        -[GEOPDIpGeoLookupResult setIpAddress:](v252, v255);
      v256 = *(void **)(v252 + 40);
      v257 = *((_QWORD *)v254 + 5);
      if (v256)
      {
        if (v257)
          objc_msgSend(v256, "mergeFrom:");
      }
      else if (v257)
      {
        -[GEOPDIpGeoLookupResult setLocation:](v252, *((void **)v254 + 5));
      }
      v258 = (void *)*((_QWORD *)v254 + 3);
      if (v258)
        -[GEOPDIpGeoLookupResult setCountryCode:](v252, v258);
      v259 = (void *)*((_QWORD *)v254 + 6);
      if (v259)
        -[GEOPDIpGeoLookupResult setTimeZome:](v252, v259);

    }
  }
  else if (v253)
  {
    -[GEOPDPlaceGlobalResult setIpGeoLookupResult:]((uint64_t)a1, v253);
  }
  if (!a1[24])
  {
    v260 = (void *)*((_QWORD *)v420 + 24);
    if (v260)
      -[GEOPDPlaceGlobalResult setGroundViewLabelResult:]((uint64_t)a1, v260);
  }
  v261 = a1[13];
  v262 = (void *)*((_QWORD *)v420 + 13);
  if (v261)
  {
    if (v262)
    {
      v263 = v262;
      -[GEOPDBatchSpatialLookupResult readAll:]((uint64_t)v263, 0);
      if ((*((_BYTE *)v263 + 56) & 1) != 0)
      {
        *(_DWORD *)(v261 + 52) = *((_DWORD *)v263 + 13);
        *(_BYTE *)(v261 + 56) |= 1u;
      }
      v476 = 0u;
      v475 = 0u;
      v474 = 0u;
      v473 = 0u;
      v264 = *((id *)v263 + 4);
      v265 = objc_msgSend(v264, "countByEnumeratingWithState:objects:count:", &v473, v481, 16);
      if (v265)
      {
        v266 = v265;
        v267 = *(_QWORD *)v474;
        do
        {
          for (i17 = 0; i17 != v266; ++i17)
          {
            if (*(_QWORD *)v474 != v267)
              objc_enumerationMutation(v264);
            -[GEOPDBatchSpatialLookupResult addSpatialPlaceLookupResult:](v261, *(void **)(*((_QWORD *)&v473 + 1) + 8 * i17));
          }
          v266 = objc_msgSend(v264, "countByEnumeratingWithState:objects:count:", &v473, v481, 16);
        }
        while (v266);
      }

      v472 = 0u;
      v471 = 0u;
      v470 = 0u;
      v469 = 0u;
      v269 = *((id *)v263 + 3);
      v270 = objc_msgSend(v269, "countByEnumeratingWithState:objects:count:", &v469, &v477, 16);
      if (v270)
      {
        v271 = v270;
        v272 = *(_QWORD *)v470;
        do
        {
          for (i18 = 0; i18 != v271; ++i18)
          {
            if (*(_QWORD *)v470 != v272)
              objc_enumerationMutation(v269);
            -[GEOPDBatchSpatialLookupResult addSpatialEventLookupResult:](v261, *(void **)(*((_QWORD *)&v469 + 1) + 8 * i18));
          }
          v271 = objc_msgSend(v269, "countByEnumeratingWithState:objects:count:", &v469, &v477, 16);
        }
        while (v271);
      }

    }
  }
  else if (v262)
  {
    -[GEOPDPlaceGlobalResult setBatchSpatialLookupResult:]((uint64_t)a1, v262);
  }
  v274 = a1[35];
  v275 = (id *)*((_QWORD *)v420 + 35);
  if (v274)
  {
    if (v275)
    {
      v477 = 0u;
      v478 = 0u;
      v479 = 0u;
      v480 = 0u;
      v276 = v275[2];
      v277 = objc_msgSend(v276, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
      if (v277)
      {
        v278 = v277;
        v279 = *(_QWORD *)v478;
        do
        {
          for (i19 = 0; i19 != v278; ++i19)
          {
            if (*(_QWORD *)v478 != v279)
              objc_enumerationMutation(v276);
            -[GEOPDPlaceGlobalCommonResult addPlaceContextMetadata:](v274, *(void **)(*((_QWORD *)&v477 + 1) + 8 * i19));
          }
          v278 = objc_msgSend(v276, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
        }
        while (v278);
      }

    }
  }
  else if (v275)
  {
    -[GEOPDPlaceGlobalResult setPlaceGlobalCommonResult:]((uint64_t)a1, v275);
  }
  v281 = a1[34];
  v282 = (void *)*((_QWORD *)v420 + 34);
  if (v281)
  {
    if (v282)
    {
      v283 = v282;
      v284 = *(_QWORD *)(v281 + 16);
      v285 = (void *)v283[2];
      if (v284)
      {
        if (v285)
          -[GEOPDComponent mergeFrom:](v284, v285);
      }
      else if (v285)
      {
        -[GEOPDPlaceCollectionLookupResult setCollectionComponent:](v281, v285);
      }

    }
  }
  else if (v282)
  {
    -[GEOPDPlaceGlobalResult setPlaceCollectionLookupResult:]((uint64_t)a1, v282);
  }
  if (!a1[51])
  {
    v286 = (void *)*((_QWORD *)v420 + 51);
    if (v286)
      -[GEOPDPlaceGlobalResult setTransitScheduleLookupResult:]((uint64_t)a1, v286);
  }
  v287 = a1[9];
  v288 = (id *)*((_QWORD *)v420 + 9);
  if (v287)
  {
    if (v288)
    {
      v477 = 0u;
      v478 = 0u;
      v479 = 0u;
      v480 = 0u;
      v289 = v288[2];
      v290 = objc_msgSend(v289, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
      if (v290)
      {
        v291 = v290;
        v292 = *(_QWORD *)v478;
        do
        {
          for (i20 = 0; i20 != v291; ++i20)
          {
            if (*(_QWORD *)v478 != v292)
              objc_enumerationMutation(v289);
            -[GEOPDBatchCategoryLookupResult addCategoryLookupResult:](v287, *(void **)(*((_QWORD *)&v477 + 1) + 8 * i20));
          }
          v291 = objc_msgSend(v289, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
        }
        while (v291);
      }

    }
  }
  else if (v288)
  {
    -[GEOPDPlaceGlobalResult setBatchCategoryLookupResult:]((uint64_t)a1, v288);
  }
  v294 = a1[10];
  v295 = (void *)*((_QWORD *)v420 + 10);
  if (v294)
  {
    if (v295)
    {
      v296 = v295;
      v297 = v296;
      if ((*((_BYTE *)v296 + 28) & 1) != 0)
      {
        *(_DWORD *)(v294 + 24) = *((_DWORD *)v296 + 6);
        *(_BYTE *)(v294 + 28) |= 1u;
      }
      v480 = 0u;
      v479 = 0u;
      v478 = 0u;
      v477 = 0u;
      v298 = v296[2];
      v299 = objc_msgSend(v298, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
      if (v299)
      {
        v300 = v299;
        v301 = *(_QWORD *)v478;
        do
        {
          for (i21 = 0; i21 != v300; ++i21)
          {
            if (*(_QWORD *)v478 != v301)
              objc_enumerationMutation(v298);
            -[GEOPDBatchMerchantLookupBrandResult addMerchantLookupBrandResult:](v294, *(void **)(*((_QWORD *)&v477 + 1) + 8 * i21));
          }
          v300 = objc_msgSend(v298, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
        }
        while (v300);
      }

    }
  }
  else if (v295)
  {
    -[GEOPDPlaceGlobalResult setBatchMerchantLookupBrandResult:]((uint64_t)a1, v295);
  }
  if (!a1[18])
  {
    v303 = (void *)*((_QWORD *)v420 + 18);
    if (v303)
      -[GEOPDPlaceGlobalResult setChildPlaceLookupByCategoryResult:]((uint64_t)a1, v303);
  }
  v304 = a1[30];
  v305 = (id *)*((_QWORD *)v420 + 30);
  if (v304)
  {
    if (v305)
    {
      v477 = 0u;
      v478 = 0u;
      v479 = 0u;
      v480 = 0u;
      v306 = v305[2];
      v307 = objc_msgSend(v306, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
      if (v307)
      {
        v308 = v307;
        v309 = *(_QWORD *)v478;
        do
        {
          for (i22 = 0; i22 != v308; ++i22)
          {
            if (*(_QWORD *)v478 != v309)
              objc_enumerationMutation(v306);
            -[GEOPDMapsSearchHomeResult addMapsSearchHomeSection:](v304, *(void **)(*((_QWORD *)&v477 + 1) + 8 * i22));
          }
          v308 = objc_msgSend(v306, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
        }
        while (v308);
      }

    }
  }
  else if (v305)
  {
    -[GEOPDPlaceGlobalResult setMapsSearchHomeResult:]((uint64_t)a1, v305);
  }
  v311 = a1[19];
  v312 = (void *)*((_QWORD *)v420 + 19);
  if (v311)
  {
    if (v312)
    {
      v313 = v312;
      -[GEOPDCollectionSuggestionResult readAll:]((uint64_t)v313, 0);
      v480 = 0u;
      v479 = 0u;
      v478 = 0u;
      v477 = 0u;
      v314 = v313[3];
      v315 = objc_msgSend(v314, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
      if (v315)
      {
        v316 = v315;
        v317 = *(_QWORD *)v478;
        do
        {
          for (i23 = 0; i23 != v316; ++i23)
          {
            if (*(_QWORD *)v478 != v317)
              objc_enumerationMutation(v314);
            -[GEOPDCollectionSuggestionResult addCollectionId:](v311, *(void **)(*((_QWORD *)&v477 + 1) + 8 * i23));
          }
          v316 = objc_msgSend(v314, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
        }
        while (v316);
      }

      v319 = *(_QWORD *)(v311 + 32);
      v320 = v313[4];
      if (v319)
      {
        if (v320)
          -[GEOPDExploreGuides mergeFrom:](v319, v320);
      }
      else if (v320)
      {
        -[GEOPDCollectionSuggestionResult setExploreGuidesMetadata:](v311, v320);
      }

    }
  }
  else if (v312)
  {
    -[GEOPDPlaceGlobalResult setCollectionSuggestionResult:]((uint64_t)a1, v312);
  }
  v321 = a1[41];
  v322 = (void *)*((_QWORD *)v420 + 41);
  if (v321)
  {
    if (v322)
    {
      v323 = v322;
      -[GEOPDPublisherViewResult readAll:]((uint64_t)v323, 0);
      v476 = 0u;
      v475 = 0u;
      v474 = 0u;
      v473 = 0u;
      v324 = v323[4];
      v325 = objc_msgSend(v324, "countByEnumeratingWithState:objects:count:", &v473, v481, 16);
      if (v325)
      {
        v326 = v325;
        v327 = *(_QWORD *)v474;
        do
        {
          for (i24 = 0; i24 != v326; ++i24)
          {
            if (*(_QWORD *)v474 != v327)
              objc_enumerationMutation(v324);
            -[GEOPDPublisherViewResult addResultFilter:](v321, *(void **)(*((_QWORD *)&v473 + 1) + 8 * i24));
          }
          v326 = objc_msgSend(v324, "countByEnumeratingWithState:objects:count:", &v473, v481, 16);
        }
        while (v326);
      }

      v472 = 0u;
      v471 = 0u;
      v470 = 0u;
      v469 = 0u;
      v329 = v323[3];
      v330 = objc_msgSend(v329, "countByEnumeratingWithState:objects:count:", &v469, &v477, 16);
      if (v330)
      {
        v331 = v330;
        v332 = *(_QWORD *)v470;
        do
        {
          for (i25 = 0; i25 != v331; ++i25)
          {
            if (*(_QWORD *)v470 != v332)
              objc_enumerationMutation(v329);
            -[GEOPDPublisherViewResult addCollectionId:](v321, *(void **)(*((_QWORD *)&v469 + 1) + 8 * i25));
          }
          v331 = objc_msgSend(v329, "countByEnumeratingWithState:objects:count:", &v469, &v477, 16);
        }
        while (v331);
      }

    }
  }
  else if (v322)
  {
    -[GEOPDPlaceGlobalResult setPublisherViewResult:]((uint64_t)a1, v322);
  }
  v334 = a1[6];
  v335 = (void *)*((_QWORD *)v420 + 6);
  if (v334)
  {
    if (v335)
    {
      v336 = v335;
      -[GEOPDAllCollectionsViewResult readAll:]((uint64_t)v336, 0);
      v337 = *(_QWORD *)(v334 + 32);
      v338 = (id *)*((_QWORD *)v336 + 4);
      if (v337)
      {
        if (v338)
        {
          v477 = 0u;
          v478 = 0u;
          v479 = 0u;
          v480 = 0u;
          v339 = v338[2];
          v340 = objc_msgSend(v339, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
          if (v340)
          {
            v341 = v340;
            v342 = *(_QWORD *)v478;
            do
            {
              for (i26 = 0; i26 != v341; ++i26)
              {
                if (*(_QWORD *)v478 != v342)
                  objc_enumerationMutation(v339);
                -[GEOPDPublisherSuggestionResult addPublisherId:](v337, *(void **)(*((_QWORD *)&v477 + 1) + 8 * i26));
              }
              v341 = objc_msgSend(v339, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
            }
            while (v341);
          }

        }
      }
      else if (v338)
      {
        -[GEOPDAllCollectionsViewResult setPublisherSuggestionResult:](v334, v338);
      }
      v476 = 0u;
      v475 = 0u;
      v474 = 0u;
      v473 = 0u;
      v344 = *((id *)v336 + 5);
      v345 = objc_msgSend(v344, "countByEnumeratingWithState:objects:count:", &v473, v481, 16);
      if (v345)
      {
        v346 = v345;
        v347 = *(_QWORD *)v474;
        do
        {
          for (i27 = 0; i27 != v346; ++i27)
          {
            if (*(_QWORD *)v474 != v347)
              objc_enumerationMutation(v344);
            -[GEOPDAllCollectionsViewResult addResultFilter:](v334, *(void **)(*((_QWORD *)&v473 + 1) + 8 * i27));
          }
          v346 = objc_msgSend(v344, "countByEnumeratingWithState:objects:count:", &v473, v481, 16);
        }
        while (v346);
      }

      v472 = 0u;
      v471 = 0u;
      v470 = 0u;
      v469 = 0u;
      v349 = *((id *)v336 + 3);
      v350 = objc_msgSend(v349, "countByEnumeratingWithState:objects:count:", &v469, &v477, 16);
      if (v350)
      {
        v351 = v350;
        v352 = *(_QWORD *)v470;
        do
        {
          for (i28 = 0; i28 != v351; ++i28)
          {
            if (*(_QWORD *)v470 != v352)
              objc_enumerationMutation(v349);
            -[GEOPDAllCollectionsViewResult addCollectionId:](v334, *(void **)(*((_QWORD *)&v469 + 1) + 8 * i28));
          }
          v351 = objc_msgSend(v349, "countByEnumeratingWithState:objects:count:", &v469, &v477, 16);
        }
        while (v351);
      }

    }
  }
  else if (v335)
  {
    -[GEOPDPlaceGlobalResult setAllCollectionsViewResult:]((uint64_t)a1, v335);
  }
  if (!a1[5])
  {
    v354 = (void *)*((_QWORD *)v420 + 5);
    if (v354)
      -[GEOPDPlaceGlobalResult setAirportEntityPlaceLookupResult:]((uint64_t)a1, v354);
  }
  if (!a1[50])
  {
    v355 = (void *)*((_QWORD *)v420 + 50);
    if (v355)
      -[GEOPDPlaceGlobalResult setTerritoryLookupResult:]((uint64_t)a1, v355);
  }
  v356 = a1[28];
  v357 = (id *)*((_QWORD *)v420 + 28);
  if (v356)
  {
    if (v357)
    {
      v477 = 0u;
      v478 = 0u;
      v479 = 0u;
      v480 = 0u;
      v358 = v357[2];
      v359 = objc_msgSend(v358, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
      if (v359)
      {
        v360 = v359;
        v361 = *(_QWORD *)v478;
        do
        {
          for (i29 = 0; i29 != v360; ++i29)
          {
            if (*(_QWORD *)v478 != v361)
              objc_enumerationMutation(v358);
            -[GEOPDMapsHomeResult addMapsHomeSection:](v356, *(void **)(*((_QWORD *)&v477 + 1) + 8 * i29));
          }
          v360 = objc_msgSend(v358, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
        }
        while (v360);
      }

    }
  }
  else if (v357)
  {
    -[GEOPDPlaceGlobalResult setMapsHomeResult:]((uint64_t)a1, v357);
  }
  v363 = a1[7];
  v364 = (void *)*((_QWORD *)v420 + 7);
  if (v363)
  {
    if (v364)
    {
      v365 = v364;
      -[GEOPDAllGuidesLocationsViewResult readAll:]((uint64_t)v365, 0);
      v366 = (void *)*((_QWORD *)v365 + 4);
      if (v366)
        -[GEOPDAllGuidesLocationsViewResult setHeader:](v363, v366);
      v480 = 0u;
      v479 = 0u;
      v478 = 0u;
      v477 = 0u;
      v367 = *((id *)v365 + 3);
      v368 = objc_msgSend(v367, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
      if (v368)
      {
        v369 = v368;
        v370 = *(_QWORD *)v478;
        do
        {
          for (i30 = 0; i30 != v369; ++i30)
          {
            if (*(_QWORD *)v478 != v370)
              objc_enumerationMutation(v367);
            -[GEOPDAllGuidesLocationsViewResult addAllGuidesLocationsSection:](v363, *(void **)(*((_QWORD *)&v477 + 1) + 8 * i30));
          }
          v369 = objc_msgSend(v367, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
        }
        while (v369);
      }

    }
  }
  else if (v364)
  {
    -[GEOPDPlaceGlobalResult setAllGuidesLocationsViewresult:]((uint64_t)a1, v364);
  }
  v372 = (_QWORD *)a1[25];
  v373 = (void *)*((_QWORD *)v420 + 25);
  if (v372)
  {
    if (v373)
    {
      v374 = v373;
      -[GEOPDGuidesHomeResult readAll:]((uint64_t)v374, 0);
      v375 = v372[3];
      v376 = (void *)*((_QWORD *)v374 + 3);
      if (v375)
      {
        if (v376)
          -[GEOPDGuidesHomeFixedSection mergeFrom:](v375, v376);
      }
      else if (v376)
      {
        -[GEOPDGuidesHomeResult setFeaturedGuides:]((uint64_t)v372, v376);
      }
      v377 = v372[5];
      v378 = (void *)*((_QWORD *)v374 + 5);
      if (v377)
      {
        if (v378)
          -[GEOPDGuidesHomeFixedSection mergeFrom:](v377, v378);
      }
      else if (v378)
      {
        -[GEOPDGuidesHomeResult setFilters:]((uint64_t)v372, v378);
      }
      v379 = v372[4];
      v380 = (void *)*((_QWORD *)v374 + 4);
      if (v379)
      {
        if (v380)
          -[GEOPDGuidesHomeFixedSection mergeFrom:](v379, v380);
      }
      else if (v380)
      {
        -[GEOPDGuidesHomeResult setFilteredGuides:]((uint64_t)v372, v380);
      }
      v480 = 0u;
      v479 = 0u;
      v478 = 0u;
      v477 = 0u;
      v381 = *((id *)v374 + 6);
      v382 = objc_msgSend(v381, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
      if (v382)
      {
        v383 = v382;
        v384 = *(_QWORD *)v478;
        do
        {
          for (i31 = 0; i31 != v383; ++i31)
          {
            if (*(_QWORD *)v478 != v384)
              objc_enumerationMutation(v381);
            -[GEOPDGuidesHomeResult addRepeatableSection:]((uint64_t)v372, *(void **)(*((_QWORD *)&v477 + 1) + 8 * i31));
          }
          v383 = objc_msgSend(v381, "countByEnumeratingWithState:objects:count:", &v477, v481, 16);
        }
        while (v383);
      }

    }
  }
  else if (v373)
  {
    -[GEOPDPlaceGlobalResult setGuidesHomeResult:]((uint64_t)a1, v373);
  }
  v386 = a1[20];
  v387 = (void *)*((_QWORD *)v420 + 20);
  if (v386)
  {
    if (v387)
    {
      v388 = v387;
      v389 = v388;
      if ((v388[32] & 2) != 0)
      {
        *(_BYTE *)(v386 + 28) = v388[28];
        *(_BYTE *)(v386 + 32) |= 2u;
      }
      v390 = (void *)*((_QWORD *)v388 + 2);
      if (v390)
        -[GEOPDExtendedGeoLookupResult setDataSourceId:](v386, v390);
      if ((v389[8] & 1) != 0)
      {
        *(_DWORD *)(v386 + 24) = v389[6];
        *(_BYTE *)(v386 + 32) |= 1u;
      }

    }
  }
  else if (v387)
  {
    -[GEOPDPlaceGlobalResult setExtendedGeoLookupResult:]((uint64_t)a1, v387);
  }
  v391 = a1[42];
  v392 = (void *)*((_QWORD *)v420 + 42);
  if (v391)
  {
    if (v392)
    {
      v393 = v392;
      -[GEOPDQueryUnderstandingResult readAll:]((uint64_t)v393, 0);
      v472 = 0u;
      v471 = 0u;
      v470 = 0u;
      v469 = 0u;
      v394 = *((id *)v393 + 3);
      v395 = objc_msgSend(v394, "countByEnumeratingWithState:objects:count:", &v469, &v477, 16);
      if (v395)
      {
        v396 = v395;
        v397 = *(_QWORD *)v470;
        do
        {
          for (i32 = 0; i32 != v396; ++i32)
          {
            if (*(_QWORD *)v470 != v397)
              objc_enumerationMutation(v394);
            -[GEOPDQueryUnderstandingResult addQueryIntent:](v391, *(void **)(*((_QWORD *)&v469 + 1) + 8 * i32));
          }
          v396 = objc_msgSend(v394, "countByEnumeratingWithState:objects:count:", &v469, &v477, 16);
        }
        while (v396);
      }

      v399 = *(_QWORD *)(v391 + 32);
      v400 = (id *)*((_QWORD *)v393 + 4);
      if (v399)
      {
        if (v400)
        {
          v473 = 0u;
          v474 = 0u;
          v475 = 0u;
          v476 = 0u;
          v401 = v400[2];
          v402 = objc_msgSend(v401, "countByEnumeratingWithState:objects:count:", &v473, v481, 16);
          if (v402)
          {
            v403 = v402;
            v404 = *(_QWORD *)v474;
            do
            {
              for (i33 = 0; i33 != v403; ++i33)
              {
                if (*(_QWORD *)v474 != v404)
                  objc_enumerationMutation(v401);
                -[GEOPDQueryUnderstandingTaxonomyResult addResultItem:](v399, *(void **)(*((_QWORD *)&v473 + 1) + 8 * i33));
              }
              v403 = objc_msgSend(v401, "countByEnumeratingWithState:objects:count:", &v473, v481, 16);
            }
            while (v403);
          }

        }
      }
      else if (v400)
      {
        -[GEOPDQueryUnderstandingResult setTaxonomyResult:](v391, v400);
      }

    }
  }
  else if (v392)
  {
    -[GEOPDPlaceGlobalResult setQueryUnderstandingResult:]((uint64_t)a1, v392);
  }
  if (!a1[39])
  {
    v406 = (void *)*((_QWORD *)v420 + 39);
    if (v406)
      -[GEOPDPlaceGlobalResult setPoiAtAddressLookupResult:]((uint64_t)a1, v406);
  }
  if (!a1[38])
  {
    v407 = (void *)*((_QWORD *)v420 + 38);
    if (v407)
      -[GEOPDPlaceGlobalResult setPlacecardEnrichmentResult:]((uint64_t)a1, v407);
  }
  v408 = a1[33];
  v409 = (void *)*((_QWORD *)v420 + 33);
  if (v408)
  {
    if (v409)
    {
      v410 = v409;
      v411 = *(void **)(v408 + 16);
      v412 = v410[2];
      if (v411)
      {
        if (v412)
          objc_msgSend(v411, "mergeFrom:");
      }
      else if (v412)
      {
        -[GEOPDOfflineRegionNameResult setDisplayName:](v408, v410[2]);
      }

    }
  }
  else if (v409)
  {
    -[GEOPDPlaceGlobalResult setOfflineRegionNameResult:]((uint64_t)a1, v409);
  }
  v413 = a1[44];
  v414 = (void *)*((_QWORD *)v420 + 44);
  if (v413)
  {
    if (v414)
    {
      v415 = v414;
      v416 = *(_QWORD *)(v413 + 16);
      v417 = (void *)v415[2];
      if (v416)
      {
        if (v417)
        {
          v418 = v417;
          if ((v418[20] & 1) != 0)
          {
            *(_BYTE *)(v416 + 16) = v418[16];
            *(_BYTE *)(v416 + 20) |= 1u;
          }

        }
      }
      else if (v417)
      {
        -[GEOPDSearchCapabilitiesResult setOfflineCapabilities:](v413, v417);
      }

    }
  }
  else if (v414)
  {
    -[GEOPDPlaceGlobalResult setSearchCapabilitiesResult:]((uint64_t)a1, v414);
  }
  if (!a1[4])
  {
    v419 = (void *)*((_QWORD *)v420 + 4);
    if (v419)
      -[GEOPDPlaceGlobalResult setAddressRecommendationResult:]((uint64_t)a1, v419);
  }

}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  int *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t n;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t ii;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t jj;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t kk;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t mm;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t nn;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t i1;
  uint64_t v88;
  void *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t i2;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t i3;
  uint64_t v101;
  void *v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t i4;
  id v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t i5;
  uint64_t v113;
  void *v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t i6;
  _QWORD *v120;
  void *v121;
  _QWORD *v122;
  uint64_t v123;
  void *v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t i7;
  id v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t i8;
  uint64_t v135;
  void *v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t i9;
  id v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t i10;
  id v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t i11;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  void *v156;
  uint64_t v157;
  void *v158;
  uint64_t v159;
  void *v160;
  uint64_t v161;
  void *v162;
  uint64_t v163;
  void *v164;
  id v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t i12;
  id v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t i13;
  uint64_t v175;
  void *v176;
  uint64_t v177;
  void *v178;
  uint64_t v179;
  void *v180;
  id v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t i14;
  uint64_t v186;
  void *v187;
  uint64_t v188;
  void *v189;
  uint64_t v190;
  void *v191;
  uint64_t v192;
  void *v193;
  id v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t i15;
  uint64_t v199;
  void *v200;
  id v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t i16;
  uint64_t v206;
  void *v207;
  uint64_t v208;
  void *v209;
  uint64_t v210;
  void *v211;
  uint64_t v212;
  void *v213;
  uint64_t v214;
  void *v215;
  uint64_t v216;
  void *v217;
  uint64_t v218;
  void *v219;
  uint64_t v220;
  void *v221;
  uint64_t v222;
  void *v223;
  uint64_t v224;
  void *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t i17;
  uint64_t v230;
  void *v231;
  id v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t i18;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t i19;
  uint64_t v241;
  void *v242;
  id v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t i20;
  uint64_t v248;
  void *v249;
  id v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t i21;
  uint64_t v255;
  void *v256;
  uint64_t v257;
  void *v258;
  uint64_t v259;
  void *v260;
  id v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t i22;
  uint64_t v266;
  void *v267;
  uint64_t v268;
  void *v269;
  id v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t i23;
  uint64_t v275;
  void *v276;
  id v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t i24;
  uint64_t v282;
  void *v283;
  uint64_t v284;
  void *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t i25;
  uint64_t v289;
  void *v290;
  uint64_t v291;
  void *v292;
  id v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t i26;
  uint64_t v298;
  void *v299;
  id v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t i27;
  uint64_t v305;
  void *v306;
  id v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t i28;
  id v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t i29;
  uint64_t v317;
  void *v318;
  id v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t i30;
  id v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t i31;
  uint64_t v329;
  void *v330;
  uint64_t v331;
  void *v332;
  uint64_t v333;
  void *v334;
  id v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t i32;
  uint64_t v340;
  void *v341;
  uint64_t v342;
  void *v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t i33;
  uint64_t v348;
  void *v349;
  uint64_t v350;
  void *v351;
  id v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t i34;
  uint64_t v357;
  void *v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t i35;
  uint64_t v363;
  void *v364;
  id v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t i36;
  id v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t i37;
  id v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t i38;
  _QWORD *v380;
  uint64_t v381;
  void *v382;
  uint64_t v383;
  void *v384;
  uint64_t v385;
  void *v386;
  id i39;
  uint64_t v388;
  void *v389;
  uint64_t v390;
  void *v391;
  uint64_t v392;
  void *v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t i40;
  uint64_t v398;
  void *v399;
  id v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t i41;
  id v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t i42;
  uint64_t v410;
  void *v411;
  uint64_t v412;
  void *v413;
  uint64_t v414;
  void *v415;
  uint64_t v416;
  void *v417;
  uint64_t v418;
  void *v419;
  uint64_t v420;
  void *v421;
  uint64_t v422;
  void *v423;
  uint64_t v424;
  _QWORD *v425;
  id v426;
  uint64_t v427;
  uint64_t v428;
  id *v429;
  id *v430;
  id v431;
  id v432;
  id obj;
  id obja;
  id objb;
  id objc;
  id objd;
  id obje;
  id objf;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  __int128 v443;
  __int128 v444;
  __int128 v445;
  __int128 v446;
  __int128 v447;
  __int128 v448;
  __int128 v449;
  __int128 v450;
  __int128 v451;
  __int128 v452;
  __int128 v453;
  __int128 v454;
  __int128 v455;
  __int128 v456;
  __int128 v457;
  __int128 v458;
  __int128 v459;
  __int128 v460;
  __int128 v461;
  __int128 v462;
  __int128 v463;
  __int128 v464;
  __int128 v465;
  __int128 v466;
  __int128 v467;
  __int128 v468;
  __int128 v469;
  __int128 v470;
  __int128 v471;
  __int128 v472;
  __int128 v473;
  __int128 v474;
  __int128 v475;
  __int128 v476;
  __int128 v477;
  __int128 v478;
  __int128 v479;
  __int128 v480;
  __int128 v481;
  __int128 v482;
  __int128 v483;
  __int128 v484;
  __int128 v485;
  __int128 v486;
  __int128 v487;
  __int128 v488;
  __int128 v489;
  __int128 v490;
  __int128 v491;
  __int128 v492;
  __int128 v493;
  __int128 v494;
  __int128 v495;
  __int128 v496;
  __int128 v497;
  __int128 v498;
  __int128 v499;
  _BYTE v500[128];
  uint64_t v501;

  v501 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    os_unfair_lock_lock_with_options();
    *(_QWORD *)(v1 + 444) |= 0x10000000000001uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 440));
    v2 = *(void **)(v1 + 16);
    *(_QWORD *)(v1 + 16) = 0;

    -[GEOPDPlaceGlobalResult readAll:](v1, 0);
    v3 = *(_QWORD *)(v1 + 368);
    v4 = &OBJC_IVAR___GEORawPathGeometry__pathMatcherInstructions;
    v424 = v1;
    if (v3)
    {
      os_unfair_lock_lock_with_options();
      *(_QWORD *)(v3 + 248) |= 0x400000400uLL;
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 216));
      v5 = *(void **)(v3 + 16);
      *(_QWORD *)(v3 + 16) = 0;

      -[GEOPDSearchResult readAll:](v3, 0);
      objc_msgSend(*(id *)(v3 + 72), "clearUnknownFields:", 1);
      v470 = 0u;
      v471 = 0u;
      v468 = 0u;
      v469 = 0u;
      v6 = *(id *)(v3 + 56);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v468, v500, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v469;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v469 != v9)
              objc_enumerationMutation(v6);
            -[GEOPDMultiLocalizedString clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v468 + 1) + 8 * i));
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v468, v500, 16);
        }
        while (v8);
      }

      v466 = 0u;
      v467 = 0u;
      v464 = 0u;
      v465 = 0u;
      v11 = *(id *)(v3 + 128);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v464, &v496, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v465;
        do
        {
          for (j = 0; j != v13; ++j)
          {
            if (*(_QWORD *)v465 != v14)
              objc_enumerationMutation(v11);
            -[GEOPDRelatedSearchSuggestion clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v464 + 1) + 8 * j), 1);
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v464, &v496, 16);
        }
        while (v13);
      }

      -[GEOPDRelatedSearchSuggestion clearUnknownFields:](*(_QWORD *)(v3 + 40), 1);
      v16 = *(_QWORD *)(v3 + 168);
      if (v16)
      {
        v17 = *(void **)(v16 + 8);
        *(_QWORD *)(v16 + 8) = 0;

      }
      v462 = 0u;
      v463 = 0u;
      v460 = 0u;
      v461 = 0u;
      v18 = *(id *)(v3 + 136);
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v460, &v492, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v461;
        do
        {
          for (k = 0; k != v20; ++k)
          {
            if (*(_QWORD *)v461 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v460 + 1) + 8 * k), "clearUnknownFields:", 1, v424);
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v460, &v492, 16);
        }
        while (v20);
      }

      -[GEOPDDirectionIntent clearUnknownFields:](*(_QWORD *)(v3 + 48), 1);
      v23 = *(_QWORD *)(v3 + 32);
      if (v23)
      {
        v24 = *(void **)(v23 + 8);
        *(_QWORD *)(v23 + 8) = 0;

      }
      v458 = 0u;
      v459 = 0u;
      v456 = 0u;
      v457 = 0u;
      v25 = *(id *)(v3 + 64);
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v456, &v488, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v457;
        do
        {
          for (m = 0; m != v27; ++m)
          {
            if (*(_QWORD *)v457 != v28)
              objc_enumerationMutation(v25);
            v30 = *(_QWORD *)(*((_QWORD *)&v456 + 1) + 8 * m);
            if (v30)
            {
              os_unfair_lock_lock_with_options();
              *(_BYTE *)(v30 + 56) |= 2u;
              *(_BYTE *)(v30 + 56) |= 0x10u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v30 + 48));
              v31 = *(void **)(v30 + 16);
              *(_QWORD *)(v30 + 16) = 0;

              -[GEOPDDisplayHeaderSubstitute readAll:](v30, 0);
              -[GEOPDRelatedSearchSuggestion clearUnknownFields:](*(_QWORD *)(v30 + 32), 1);
            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v456, &v488, 16);
        }
        while (v27);
      }

      v454 = 0u;
      v455 = 0u;
      v452 = 0u;
      v453 = 0u;
      v32 = *(id *)(v3 + 160);
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v452, &v484, 16);
      v4 = &OBJC_IVAR___GEORawPathGeometry__pathMatcherInstructions;
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v453;
        do
        {
          for (n = 0; n != v34; ++n)
          {
            if (*(_QWORD *)v453 != v35)
              objc_enumerationMutation(v32);
            -[GEOPDRetainedSearchMetadata clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v452 + 1) + 8 * n), 1);
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v452, &v484, 16);
        }
        while (v34);
      }

      v450 = 0u;
      v451 = 0u;
      v448 = 0u;
      v449 = 0u;
      v37 = *(id *)(v3 + 176);
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v448, &v480, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v449;
        do
        {
          for (ii = 0; ii != v39; ++ii)
          {
            if (*(_QWORD *)v449 != v40)
              objc_enumerationMutation(v37);
            -[GEOPDSSearchResultSection clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v448 + 1) + 8 * ii), 1);
          }
          v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v448, &v480, 16);
        }
        while (v39);
      }

      v446 = 0u;
      v447 = 0u;
      v444 = 0u;
      v445 = 0u;
      v42 = *(id *)(v3 + 120);
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v444, &v476, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v445;
        do
        {
          for (jj = 0; jj != v44; ++jj)
          {
            if (*(_QWORD *)v445 != v45)
              objc_enumerationMutation(v42);
            -[GEOPDRelatedEntitySection clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v444 + 1) + 8 * jj), 1);
          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v444, &v476, 16);
        }
        while (v44);
      }

      v442 = 0u;
      v443 = 0u;
      v440 = 0u;
      v441 = 0u;
      v47 = *(id *)(v3 + 192);
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v440, &v472, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v441;
        do
        {
          for (kk = 0; kk != v49; ++kk)
          {
            if (*(_QWORD *)v441 != v50)
              objc_enumerationMutation(v47);
            v52 = *(_QWORD *)(*((_QWORD *)&v440 + 1) + 8 * kk);
            if (v52)
            {
              v53 = *(void **)(v52 + 8);
              *(_QWORD *)(v52 + 8) = 0;

            }
          }
          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v440, &v472, 16);
        }
        while (v49);
      }

      -[GEOPDResultRefinementGroup clearUnknownFields:](*(_QWORD *)(v3 + 152), 1);
      v54 = *(_QWORD *)(v3 + 24);
      if (v54)
      {
        v55 = *(void **)(v54 + 8);
        *(_QWORD *)(v54 + 8) = 0;

      }
      -[GEOPDSearchSectionList clearUnknownFields:](*(_QWORD *)(v3 + 200), 1);
      v56 = *(_QWORD *)(v3 + 184);
      v1 = v424;
      if (v56)
      {
        v57 = *(void **)(v56 + 8);
        *(_QWORD *)(v56 + 8) = 0;

      }
      objc_msgSend(*(id *)(v3 + 88), "clearUnknownFields:", 1, v424);
      -[GEOPDPaginationInfo clearUnknownFields:](*(_QWORD *)(v3 + 96));
      v58 = *(_QWORD *)(v3 + 112);
      if (v58)
      {
        v59 = *(void **)(v58 + 8);
        *(_QWORD *)(v58 + 8) = 0;

      }
    }
    v60 = *(_QWORD *)(v1 + 184);
    if (v60)
    {
      v61 = *(void **)(v60 + 8);
      *(_QWORD *)(v60 + 8) = 0;

      v499 = 0u;
      v498 = 0u;
      v497 = 0u;
      v496 = 0u;
      v62 = *(id *)(v60 + 16);
      v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v496, v500, 16);
      if (v63)
      {
        v64 = v63;
        v65 = *(_QWORD *)v497;
        do
        {
          for (mm = 0; mm != v64; ++mm)
          {
            if (*(_QWORD *)v497 != v65)
              objc_enumerationMutation(v62);
            -[GEOPDMultiLocalizedString clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v496 + 1) + 8 * mm));
          }
          v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v496, v500, 16);
        }
        while (v64);
      }

    }
    v67 = v424;
    v68 = *(_QWORD *)(v424 + 128);
    if (v68)
    {
      v69 = *(void **)(v68 + 8);
      *(_QWORD *)(v68 + 8) = 0;

    }
    v70 = *(_QWORD *)(v424 + 344);
    if (v70)
    {
      v71 = *(void **)(v70 + 8);
      *(_QWORD *)(v70 + 8) = 0;

    }
    v72 = *(_QWORD *)(v424 + 288);
    if (v72)
    {
      v73 = *(void **)(v72 + 8);
      *(_QWORD *)(v72 + 8) = 0;

    }
    objc_msgSend(*(id *)(v424 + 248), "clearUnknownFields:", 1, v424);
    v74 = *(_QWORD *)(v67 + 296);
    if (v74)
    {
      v75 = *(void **)(v74 + 8);
      *(_QWORD *)(v74 + 8) = 0;

    }
    v76 = *(_QWORD *)(v67 + 392);
    if (v76)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v76 + 56) |= 2u;
      *(_BYTE *)(v76 + 56) |= 0x10u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v76 + 48));
      v77 = *(void **)(v76 + 16);
      *(_QWORD *)(v76 + 16) = 0;

      -[GEOPDSiriSearchResult readAll:](v76, 0);
      v495 = 0u;
      v494 = 0u;
      v493 = 0u;
      v492 = 0u;
      v78 = *(id *)(v76 + 24);
      v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v492, v500, 16);
      if (v79)
      {
        v80 = v79;
        v81 = *(_QWORD *)v493;
        do
        {
          for (nn = 0; nn != v80; ++nn)
          {
            if (*(_QWORD *)v493 != v81)
              objc_enumerationMutation(v78);
            -[GEOPDMultiLocalizedString clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v492 + 1) + 8 * nn));
          }
          v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v492, v500, 16);
        }
        while (v80);
      }

      v491 = 0u;
      v490 = 0u;
      v489 = 0u;
      v488 = 0u;
      v83 = *(id *)(v76 + 32);
      v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v488, &v496, 16);
      if (v84)
      {
        v85 = v84;
        v86 = *(_QWORD *)v489;
        do
        {
          for (i1 = 0; i1 != v85; ++i1)
          {
            if (*(_QWORD *)v489 != v86)
              objc_enumerationMutation(v83);
            objc_msgSend(*(id *)(*((_QWORD *)&v488 + 1) + 8 * i1), "clearUnknownFields:", 1);
          }
          v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v488, &v496, 16);
        }
        while (v85);
      }

    }
    v88 = v425[27];
    if (v88)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v88 + 60) |= 1u;
      *(_BYTE *)(v88 + 60) |= 0x10u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v88 + 56));
      v89 = *(void **)(v88 + 16);
      *(_QWORD *)(v88 + 16) = 0;

      -[GEOPDLocationDirectedSearchResult readAll:](v88, 0);
      objc_msgSend(*(id *)(v88 + 32), "clearUnknownFields:", 1);
      v499 = 0u;
      v498 = 0u;
      v497 = 0u;
      v496 = 0u;
      v90 = *(id *)(v88 + 24);
      v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v496, v500, 16);
      if (v91)
      {
        v92 = v91;
        v93 = *(_QWORD *)v497;
        do
        {
          for (i2 = 0; i2 != v92; ++i2)
          {
            if (*(_QWORD *)v497 != v93)
              objc_enumerationMutation(v90);
            -[GEOPDMultiLocalizedString clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v496 + 1) + 8 * i2));
          }
          v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v496, v500, 16);
        }
        while (v92);
      }

      -[GEOPDPaginationInfo clearUnknownFields:](*(_QWORD *)(v88 + 40));
    }
    v95 = v425[8];
    if (v95)
    {
      os_unfair_lock_lock_with_options();
      *(_DWORD *)(v95 + 104) |= 0x800u;
      *(_DWORD *)(v95 + 104) |= 0x40000u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v95 + 80));
      v96 = *(void **)(v95 + 16);
      *(_QWORD *)(v95 + 16) = 0;

      -[GEOPDAutocompleteResult readAll:](v95, 0);
      v491 = 0u;
      v490 = 0u;
      v489 = 0u;
      v488 = 0u;
      v429 = (id *)v95;
      obj = *(id *)(v95 + 56);
      v97 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v488, &v496, 16);
      if (v97)
      {
        v98 = v97;
        v99 = *(_QWORD *)v489;
        do
        {
          for (i3 = 0; i3 != v98; ++i3)
          {
            if (*(_QWORD *)v489 != v99)
              objc_enumerationMutation(obj);
            v101 = *(_QWORD *)(*((_QWORD *)&v488 + 1) + 8 * i3);
            if (v101)
            {
              os_unfair_lock_lock_with_options();
              *(_WORD *)(v101 + 144) |= 0x100u;
              *(_WORD *)(v101 + 144) |= 0x4000u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v101 + 120));
              v102 = *(void **)(v101 + 16);
              *(_QWORD *)(v101 + 16) = 0;

              -[GEOPDAutocompleteResultSection readAll:](v101, 0);
              v495 = 0u;
              v494 = 0u;
              v493 = 0u;
              v492 = 0u;
              v103 = *(id *)(v101 + 96);
              v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v492, v500, 16);
              if (v104)
              {
                v105 = v104;
                v106 = *(_QWORD *)v493;
                do
                {
                  for (i4 = 0; i4 != v105; ++i4)
                  {
                    if (*(_QWORD *)v493 != v106)
                      objc_enumerationMutation(v103);
                    objc_msgSend(*(id *)(*((_QWORD *)&v492 + 1) + 8 * i4), "clearUnknownFields:", 1);
                  }
                  v105 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v492, v500, 16);
                }
                while (v105);
              }

            }
          }
          v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v488, &v496, 16);
        }
        while (v98);
      }

      v486 = 0u;
      v487 = 0u;
      v484 = 0u;
      v485 = 0u;
      v108 = *(id *)(v95 + 64);
      v109 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v484, v500, 16);
      if (v109)
      {
        v110 = v109;
        v111 = *(_QWORD *)v485;
        do
        {
          for (i5 = 0; i5 != v110; ++i5)
          {
            if (*(_QWORD *)v485 != v111)
              objc_enumerationMutation(v108);
            v113 = *(_QWORD *)(*((_QWORD *)&v484 + 1) + 8 * i5);
            if (v113)
            {
              v114 = *(void **)(v113 + 8);
              *(_QWORD *)(v113 + 8) = 0;

            }
          }
          v110 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v484, v500, 16);
        }
        while (v110);
      }

      v482 = 0u;
      v483 = 0u;
      v480 = 0u;
      v481 = 0u;
      v115 = *(id *)(v95 + 32);
      v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v480, &v492, 16);
      v4 = &OBJC_IVAR___GEORawPathGeometry__pathMatcherInstructions;
      if (v116)
      {
        v117 = v116;
        v118 = *(_QWORD *)v481;
        do
        {
          for (i6 = 0; i6 != v117; ++i6)
          {
            if (*(_QWORD *)v481 != v118)
              objc_enumerationMutation(v115);
            -[GEOPDClientRankingFeatureMetadata clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v480 + 1) + 8 * i6), 1);
          }
          v117 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v480, &v492, 16);
        }
        while (v117);
      }

      objc_msgSend(v429[3], "clearUnknownFields:", 1);
      v120 = v429[5];
      if (v120)
      {
        v121 = (void *)v120[1];
        v120[1] = 0;

      }
    }
    v122 = v425;
    -[GEOPDSearchBrowseCategorySuggestionResult clearUnknownFields:](v425[15]);
    v123 = v425[17];
    if (v123)
    {
      os_unfair_lock_lock_with_options();
      *(_DWORD *)(v123 + 184) |= 0x40u;
      *(_DWORD *)(v123 + 184) |= 0x1000000u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v123 + 168));
      v124 = *(void **)(v123 + 16);
      *(_QWORD *)(v123 + 16) = 0;

      -[GEOPDCategorySearchResult readAll:](v123, 0);
      objc_msgSend(*(id *)(v123 + 56), "clearUnknownFields:", 1);
      v482 = 0u;
      v483 = 0u;
      v480 = 0u;
      v481 = 0u;
      v125 = *(id *)(v123 + 104);
      v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v480, v500, 16);
      if (v126)
      {
        v127 = v126;
        v128 = *(_QWORD *)v481;
        do
        {
          for (i7 = 0; i7 != v127; ++i7)
          {
            if (*(_QWORD *)v481 != v128)
              objc_enumerationMutation(v125);
            -[GEOPDRelatedSearchSuggestion clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v480 + 1) + 8 * i7), 1);
          }
          v127 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v480, v500, 16);
        }
        while (v127);
      }

      v478 = 0u;
      v479 = 0u;
      v476 = 0u;
      v477 = 0u;
      v130 = *(id *)(v123 + 112);
      v131 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v476, &v496, 16);
      if (v131)
      {
        v132 = v131;
        v133 = *(_QWORD *)v477;
        do
        {
          for (i8 = 0; i8 != v132; ++i8)
          {
            if (*(_QWORD *)v477 != v133)
              objc_enumerationMutation(v130);
            objc_msgSend(*(id *)(*((_QWORD *)&v476 + 1) + 8 * i8), "clearUnknownFields:", 1);
          }
          v132 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v476, &v496, 16);
        }
        while (v132);
      }

      -[GEOPDRelatedSearchSuggestion clearUnknownFields:](*(_QWORD *)(v123 + 48), 1);
      v135 = *(_QWORD *)(v123 + 128);
      if (v135)
      {
        v136 = *(void **)(v135 + 8);
        *(_QWORD *)(v135 + 8) = 0;

      }
      v474 = 0u;
      v475 = 0u;
      v472 = 0u;
      v473 = 0u;
      v137 = *(id *)(v123 + 32);
      v138 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v472, &v492, 16);
      if (v138)
      {
        v139 = v138;
        v140 = *(_QWORD *)v473;
        do
        {
          for (i9 = 0; i9 != v139; ++i9)
          {
            if (*(_QWORD *)v473 != v140)
              objc_enumerationMutation(v137);
            -[GEOPDBrowseCategory clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v472 + 1) + 8 * i9), 1);
          }
          v139 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v472, &v492, 16);
        }
        while (v139);
      }

      -[GEOPDSCategorySearchResultSection clearUnknownFields:](*(_QWORD *)(v123 + 40), 1);
      v470 = 0u;
      v471 = 0u;
      v468 = 0u;
      v469 = 0u;
      v142 = *(id *)(v123 + 96);
      v143 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v468, &v488, 16);
      if (v143)
      {
        v144 = v143;
        v145 = *(_QWORD *)v469;
        do
        {
          for (i10 = 0; i10 != v144; ++i10)
          {
            if (*(_QWORD *)v469 != v145)
              objc_enumerationMutation(v142);
            -[GEOPDRelatedEntitySection clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v468 + 1) + 8 * i10), 1);
          }
          v144 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v468, &v488, 16);
        }
        while (v144);
      }

      v466 = 0u;
      v467 = 0u;
      v464 = 0u;
      v465 = 0u;
      v147 = *(id *)(v123 + 144);
      v148 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v464, &v484, 16);
      if (v148)
      {
        v149 = v148;
        v150 = *(_QWORD *)v465;
        do
        {
          for (i11 = 0; i11 != v149; ++i11)
          {
            if (*(_QWORD *)v465 != v150)
              objc_enumerationMutation(v147);
            v152 = *(_QWORD *)(*((_QWORD *)&v464 + 1) + 8 * i11);
            if (v152)
            {
              v153 = v4[924];
              v154 = *(void **)(v152 + v153);
              *(_QWORD *)(v152 + v153) = 0;

            }
          }
          v149 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v464, &v484, 16);
        }
        while (v149);
      }

      -[GEOPDResultRefinementGroup clearUnknownFields:](*(_QWORD *)(v123 + 120), 1);
      v155 = *(_QWORD *)(v123 + 24);
      if (v155)
      {
        v156 = *(void **)(v155 + 8);
        *(_QWORD *)(v155 + 8) = 0;

      }
      -[GEOPDSearchSectionList clearUnknownFields:](*(_QWORD *)(v123 + 152), 1);
      v157 = *(_QWORD *)(v123 + 136);
      v122 = v425;
      if (v157)
      {
        v158 = *(void **)(v157 + 8);
        *(_QWORD *)(v157 + 8) = 0;

      }
      -[GEOPDPaginationInfo clearUnknownFields:](*(_QWORD *)(v123 + 72));
      v159 = *(_QWORD *)(v123 + 88);
      if (v159)
      {
        v160 = *(void **)(v159 + 8);
        *(_QWORD *)(v159 + 8) = 0;

      }
    }
    v161 = v122[40];
    if (v161)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v161 + 56) |= 2u;
      *(_BYTE *)(v161 + 56) |= 0x10u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v161 + 48));
      v162 = *(void **)(v161 + 16);
      *(_QWORD *)(v161 + 16) = 0;

      -[GEOPDPopularNearbySearchResult readAll:](v161, 0);
      objc_msgSend(*(id *)(v161 + 24), "clearUnknownFields:", 1);
    }
    v163 = v122[47];
    if (v163)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v163 + 52) |= 1u;
      *(_BYTE *)(v163 + 52) |= 8u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v163 + 48));
      v164 = *(void **)(v163 + 16);
      *(_QWORD *)(v163 + 16) = 0;

      -[GEOPDSearchZeroKeywordCategorySuggestionResult readAll:](v163, 0);
      v495 = 0u;
      v494 = 0u;
      v493 = 0u;
      v492 = 0u;
      v165 = *(id *)(v163 + 24);
      v166 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v492, v500, 16);
      if (v166)
      {
        v167 = v166;
        v168 = *(_QWORD *)v493;
        do
        {
          for (i12 = 0; i12 != v167; ++i12)
          {
            if (*(_QWORD *)v493 != v168)
              objc_enumerationMutation(v165);
            -[GEOPDBrowseCategory clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v492 + 1) + 8 * i12), 1);
          }
          v167 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v492, v500, 16);
        }
        while (v167);
      }

      v491 = 0u;
      v490 = 0u;
      v489 = 0u;
      v488 = 0u;
      v170 = *(id *)(v163 + 32);
      v171 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v488, &v496, 16);
      if (v171)
      {
        v172 = v171;
        v173 = *(_QWORD *)v489;
        do
        {
          for (i13 = 0; i13 != v172; ++i13)
          {
            if (*(_QWORD *)v489 != v173)
              objc_enumerationMutation(v170);
            v175 = *(_QWORD *)(*((_QWORD *)&v488 + 1) + 8 * i13);
            if (v175)
            {
              v176 = *(void **)(v175 + 8);
              *(_QWORD *)(v175 + 8) = 0;

            }
          }
          v172 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v488, &v496, 16);
        }
        while (v172);
      }

    }
    v177 = v425[45];
    if (v177)
    {
      v178 = *(void **)(v177 + 8);
      *(_QWORD *)(v177 + 8) = 0;

    }
    v179 = v425[11];
    if (v179)
    {
      v180 = *(void **)(v179 + 8);
      *(_QWORD *)(v179 + 8) = 0;

      v499 = 0u;
      v498 = 0u;
      v497 = 0u;
      v496 = 0u;
      v181 = *(id *)(v179 + 16);
      v182 = objc_msgSend(v181, "countByEnumeratingWithState:objects:count:", &v496, v500, 16);
      if (v182)
      {
        v183 = v182;
        v184 = *(_QWORD *)v497;
        do
        {
          for (i14 = 0; i14 != v183; ++i14)
          {
            if (*(_QWORD *)v497 != v184)
              objc_enumerationMutation(v181);
            v186 = *(_QWORD *)(*((_QWORD *)&v496 + 1) + 8 * i14);
            if (v186)
            {
              os_unfair_lock_lock_with_options();
              *(_BYTE *)(v186 + 68) |= 1u;
              *(_BYTE *)(v186 + 68) |= 8u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v186 + 64));
              v187 = *(void **)(v186 + 16);
              *(_QWORD *)(v186 + 16) = 0;

              -[GEOPDPopularNearbyResult readAll:](v186, 0);
            }
          }
          v183 = objc_msgSend(v181, "countByEnumeratingWithState:objects:count:", &v496, v500, 16);
        }
        while (v183);
      }

    }
    v188 = v425[52];
    if (v188)
    {
      v189 = *(void **)(v188 + 8);
      *(_QWORD *)(v188 + 8) = 0;

    }
    v190 = v425[32];
    if (v190)
    {
      v191 = *(void **)(v190 + 8);
      *(_QWORD *)(v190 + 8) = 0;

    }
    v192 = v425[3];
    if (v192)
    {
      v193 = *(void **)(v192 + 8);
      *(_QWORD *)(v192 + 8) = 0;

      v499 = 0u;
      v498 = 0u;
      v497 = 0u;
      v496 = 0u;
      v194 = *(id *)(v192 + 16);
      v195 = objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v496, v500, 16);
      if (v195)
      {
        v196 = v195;
        v197 = *(_QWORD *)v497;
        do
        {
          for (i15 = 0; i15 != v196; ++i15)
          {
            if (*(_QWORD *)v497 != v197)
              objc_enumerationMutation(v194);
            -[GEOPDMultiLocalizedString clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v496 + 1) + 8 * i15));
          }
          v196 = objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v496, v500, 16);
        }
        while (v196);
      }

    }
    v199 = v425[48];
    if (v199)
    {
      v200 = *(void **)(v199 + 8);
      *(_QWORD *)(v199 + 8) = 0;

      v499 = 0u;
      v498 = 0u;
      v497 = 0u;
      v496 = 0u;
      v201 = *(id *)(v199 + 16);
      v202 = objc_msgSend(v201, "countByEnumeratingWithState:objects:count:", &v496, v500, 16);
      if (v202)
      {
        v203 = v202;
        v204 = *(_QWORD *)v497;
        do
        {
          for (i16 = 0; i16 != v203; ++i16)
          {
            if (*(_QWORD *)v497 != v204)
              objc_enumerationMutation(v201);
            v206 = *(_QWORD *)(*((_QWORD *)&v496 + 1) + 8 * i16);
            if (v206)
            {
              os_unfair_lock_lock_with_options();
              *(_BYTE *)(v206 + 68) |= 1u;
              *(_BYTE *)(v206 + 68) |= 8u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v206 + 64));
              v207 = *(void **)(v206 + 16);
              *(_QWORD *)(v206 + 16) = 0;

              -[GEOPDSearchResultsForCategoryEntry readAll:](v206, 0);
              -[GEOPDBrowseCategory clearUnknownFields:](*(_QWORD *)(v206 + 48), 1);
            }
          }
          v203 = objc_msgSend(v201, "countByEnumeratingWithState:objects:count:", &v496, v500, 16);
        }
        while (v203);
      }

    }
    v208 = v425[21];
    if (v208)
    {
      v209 = *(void **)(v208 + 8);
      *(_QWORD *)(v208 + 8) = 0;

    }
    v210 = v425[22];
    if (v210)
    {
      v211 = *(void **)(v210 + 8);
      *(_QWORD *)(v210 + 8) = 0;

    }
    v212 = v425[29];
    if (v212)
    {
      v213 = *(void **)(v212 + 8);
      *(_QWORD *)(v212 + 8) = 0;

    }
    v214 = v425[12];
    if (v214)
    {
      v215 = *(void **)(v214 + 8);
      *(_QWORD *)(v214 + 8) = 0;

    }
    v216 = v425[14];
    if (v216)
    {
      v217 = *(void **)(v216 + 8);
      *(_QWORD *)(v216 + 8) = 0;

    }
    v218 = v425[53];
    if (v218)
    {
      v219 = *(void **)(v218 + 8);
      *(_QWORD *)(v218 + 8) = 0;

    }
    v220 = v425[26];
    if (v220)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v220 + 72) |= 2u;
      *(_BYTE *)(v220 + 72) |= 0x40u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v220 + 64));
      v221 = *(void **)(v220 + 16);
      *(_QWORD *)(v220 + 16) = 0;

      -[GEOPDIpGeoLookupResult readAll:](v220, 0);
      objc_msgSend(*(id *)(v220 + 40), "clearUnknownFields:", 1);
    }
    v222 = v425[24];
    if (v222)
    {
      v223 = *(void **)(v222 + 8);
      *(_QWORD *)(v222 + 8) = 0;

    }
    v224 = v425[13];
    if (v224)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v224 + 56) |= 2u;
      *(_BYTE *)(v224 + 56) |= 0x10u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v224 + 48));
      v225 = *(void **)(v224 + 16);
      *(_QWORD *)(v224 + 16) = 0;

      -[GEOPDBatchSpatialLookupResult readAll:](v224, 0);
      v486 = 0u;
      v487 = 0u;
      v484 = 0u;
      v485 = 0u;
      v430 = (id *)v224;
      obja = *(id *)(v224 + 32);
      v226 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v484, &v496, 16);
      if (v226)
      {
        v227 = v226;
        v228 = *(_QWORD *)v485;
        do
        {
          for (i17 = 0; i17 != v227; ++i17)
          {
            if (*(_QWORD *)v485 != v228)
              objc_enumerationMutation(obja);
            v230 = *(_QWORD *)(*((_QWORD *)&v484 + 1) + 8 * i17);
            if (v230)
            {
              os_unfair_lock_lock_with_options();
              *(_BYTE *)(v230 + 56) |= 2u;
              *(_BYTE *)(v230 + 56) |= 0x10u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v230 + 48));
              v231 = *(void **)(v230 + 16);
              *(_QWORD *)(v230 + 16) = 0;

              -[GEOPDSpatialPlaceLookupResult readAll:](v230, 0);
              v495 = 0u;
              v494 = 0u;
              v493 = 0u;
              v492 = 0u;
              v232 = *(id *)(v230 + 32);
              v233 = objc_msgSend(v232, "countByEnumeratingWithState:objects:count:", &v492, v500, 16);
              if (v233)
              {
                v234 = v233;
                v235 = *(_QWORD *)v493;
                do
                {
                  for (i18 = 0; i18 != v234; ++i18)
                  {
                    if (*(_QWORD *)v493 != v235)
                      objc_enumerationMutation(v232);
                    objc_msgSend(*(id *)(*((_QWORD *)&v492 + 1) + 8 * i18), "clearUnknownFields:", 1);
                  }
                  v234 = objc_msgSend(v232, "countByEnumeratingWithState:objects:count:", &v492, v500, 16);
                }
                while (v234);
              }

              objc_msgSend(*(id *)(v230 + 24), "clearUnknownFields:", 1);
            }
          }
          v227 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v484, &v496, 16);
        }
        while (v227);
      }

      v482 = 0u;
      v483 = 0u;
      v480 = 0u;
      v481 = 0u;
      objb = v430[3];
      v237 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v480, &v492, 16);
      if (v237)
      {
        v238 = v237;
        v239 = *(_QWORD *)v481;
        do
        {
          for (i19 = 0; i19 != v238; ++i19)
          {
            if (*(_QWORD *)v481 != v239)
              objc_enumerationMutation(objb);
            v241 = *(_QWORD *)(*((_QWORD *)&v480 + 1) + 8 * i19);
            if (v241)
            {
              os_unfair_lock_lock_with_options();
              *(_BYTE *)(v241 + 56) |= 2u;
              *(_BYTE *)(v241 + 56) |= 0x10u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v241 + 48));
              v242 = *(void **)(v241 + 16);
              *(_QWORD *)(v241 + 16) = 0;

              -[GEOPDSpatialEventLookupResult readAll:](v241, 0);
              v491 = 0u;
              v490 = 0u;
              v489 = 0u;
              v488 = 0u;
              v243 = *(id *)(v241 + 32);
              v244 = objc_msgSend(v243, "countByEnumeratingWithState:objects:count:", &v488, v500, 16);
              if (v244)
              {
                v245 = v244;
                v246 = *(_QWORD *)v489;
                do
                {
                  for (i20 = 0; i20 != v245; ++i20)
                  {
                    if (*(_QWORD *)v489 != v246)
                      objc_enumerationMutation(v243);
                    objc_msgSend(*(id *)(*((_QWORD *)&v488 + 1) + 8 * i20), "clearUnknownFields:", 1);
                  }
                  v245 = objc_msgSend(v243, "countByEnumeratingWithState:objects:count:", &v488, v500, 16);
                }
                while (v245);
              }

              objc_msgSend(*(id *)(v241 + 24), "clearUnknownFields:", 1);
            }
          }
          v238 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v480, &v492, 16);
        }
        while (v238);
      }

    }
    v248 = v425[35];
    if (v248)
    {
      v249 = *(void **)(v248 + 8);
      *(_QWORD *)(v248 + 8) = 0;

      v499 = 0u;
      v498 = 0u;
      v497 = 0u;
      v496 = 0u;
      v250 = *(id *)(v248 + 16);
      v251 = objc_msgSend(v250, "countByEnumeratingWithState:objects:count:", &v496, v500, 16);
      if (v251)
      {
        v252 = v251;
        v253 = *(_QWORD *)v497;
        do
        {
          for (i21 = 0; i21 != v252; ++i21)
          {
            if (*(_QWORD *)v497 != v253)
              objc_enumerationMutation(v250);
            -[GEOPDPlaceContextMetadata clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v496 + 1) + 8 * i21), 1);
          }
          v252 = objc_msgSend(v250, "countByEnumeratingWithState:objects:count:", &v496, v500, 16);
        }
        while (v252);
      }

    }
    v255 = v425[34];
    if (v255)
    {
      v256 = *(void **)(v255 + 8);
      *(_QWORD *)(v255 + 8) = 0;

      -[GEOPDComponent clearUnknownFields:](*(_QWORD *)(v255 + 16), 1);
    }
    v257 = v425[51];
    if (v257)
    {
      v258 = *(void **)(v257 + 8);
      *(_QWORD *)(v257 + 8) = 0;

    }
    v259 = v425[9];
    if (v259)
    {
      v260 = *(void **)(v259 + 8);
      *(_QWORD *)(v259 + 8) = 0;

      v499 = 0u;
      v498 = 0u;
      v497 = 0u;
      v496 = 0u;
      v261 = *(id *)(v259 + 16);
      v262 = objc_msgSend(v261, "countByEnumeratingWithState:objects:count:", &v496, v500, 16);
      if (v262)
      {
        v263 = v262;
        v264 = *(_QWORD *)v497;
        do
        {
          for (i22 = 0; i22 != v263; ++i22)
          {
            if (*(_QWORD *)v497 != v264)
              objc_enumerationMutation(v261);
            v266 = *(_QWORD *)(*((_QWORD *)&v496 + 1) + 8 * i22);
            if (v266)
            {
              os_unfair_lock_lock_with_options();
              *(_BYTE *)(v266 + 52) |= 1u;
              *(_BYTE *)(v266 + 52) |= 8u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v266 + 48));
              v267 = *(void **)(v266 + 16);
              *(_QWORD *)(v266 + 16) = 0;

              -[GEOPDCategoryLookupResult readAll:](v266, 0);
              -[GEOPDCategoryLookupParameters clearUnknownFields:](*(_QWORD *)(v266 + 32), 1);
              objc_msgSend(*(id *)(v266 + 24), "clearUnknownFields:", 1);
            }
          }
          v263 = objc_msgSend(v261, "countByEnumeratingWithState:objects:count:", &v496, v500, 16);
        }
        while (v263);
      }

    }
    v268 = v425[10];
    if (v268)
    {
      v269 = *(void **)(v268 + 8);
      *(_QWORD *)(v268 + 8) = 0;

      v491 = 0u;
      v490 = 0u;
      v489 = 0u;
      v488 = 0u;
      v270 = *(id *)(v268 + 16);
      v271 = objc_msgSend(v270, "countByEnumeratingWithState:objects:count:", &v488, &v496, 16);
      if (v271)
      {
        v272 = v271;
        v273 = *(_QWORD *)v489;
        do
        {
          for (i23 = 0; i23 != v272; ++i23)
          {
            if (*(_QWORD *)v489 != v273)
              objc_enumerationMutation(v270);
            v275 = *(_QWORD *)(*((_QWORD *)&v488 + 1) + 8 * i23);
            if (v275)
            {
              v276 = *(void **)(v275 + 8);
              *(_QWORD *)(v275 + 8) = 0;

              v495 = 0u;
              v494 = 0u;
              v493 = 0u;
              v492 = 0u;
              v277 = *(id *)(v275 + 16);
              v278 = objc_msgSend(v277, "countByEnumeratingWithState:objects:count:", &v492, v500, 16);
              if (v278)
              {
                v279 = v278;
                v280 = *(_QWORD *)v493;
                do
                {
                  for (i24 = 0; i24 != v279; ++i24)
                  {
                    if (*(_QWORD *)v493 != v280)
                      objc_enumerationMutation(v277);
                    objc_msgSend(*(id *)(*((_QWORD *)&v492 + 1) + 8 * i24), "clearUnknownFields:", 1);
                  }
                  v279 = objc_msgSend(v277, "countByEnumeratingWithState:objects:count:", &v492, v500, 16);
                }
                while (v279);
              }

            }
          }
          v272 = objc_msgSend(v270, "countByEnumeratingWithState:objects:count:", &v488, &v496, 16);
        }
        while (v272);
      }

    }
    v282 = v425[18];
    if (v282)
    {
      v283 = *(void **)(v282 + 8);
      *(_QWORD *)(v282 + 8) = 0;

    }
    v284 = v425[30];
    if (v284)
    {
      v285 = *(void **)(v284 + 8);
      *(_QWORD *)(v284 + 8) = 0;

      v491 = 0u;
      v490 = 0u;
      v489 = 0u;
      v488 = 0u;
      v431 = *(id *)(v284 + 16);
      v286 = objc_msgSend(v431, "countByEnumeratingWithState:objects:count:", &v488, &v496, 16);
      if (v286)
      {
        v287 = v286;
        objc = *(id *)v489;
        do
        {
          for (i25 = 0; i25 != v287; ++i25)
          {
            if (*(id *)v489 != objc)
              objc_enumerationMutation(v431);
            v289 = *(_QWORD *)(*((_QWORD *)&v488 + 1) + 8 * i25);
            if (v289)
            {
              os_unfair_lock_lock_with_options();
              *(_WORD *)(v289 + 88) |= 2u;
              *(_WORD *)(v289 + 88) |= 0x100u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v289 + 80));
              v290 = *(void **)(v289 + 16);
              *(_QWORD *)(v289 + 16) = 0;

              -[GEOPDMapsSearchHomeSection readAll:](v289, 0);
              -[GEOPDSearchBrowseCategorySuggestionResult clearUnknownFields:](*(_QWORD *)(v289 + 64));
              -[GEOPDCollectionSuggestionResult clearUnknownFields:](*(_QWORD *)(v289 + 24));
              -[GEOPDPublisherSuggestionResult clearUnknownFields:](*(_QWORD *)(v289 + 56));
              v291 = *(_QWORD *)(v289 + 48);
              if (v291)
              {
                v292 = *(void **)(v291 + 8);
                *(_QWORD *)(v291 + 8) = 0;

                v495 = 0u;
                v494 = 0u;
                v493 = 0u;
                v492 = 0u;
                v293 = *(id *)(v291 + 16);
                v294 = objc_msgSend(v293, "countByEnumeratingWithState:objects:count:", &v492, v500, 16);
                if (v294)
                {
                  v295 = v294;
                  v296 = *(_QWORD *)v493;
                  do
                  {
                    for (i26 = 0; i26 != v295; ++i26)
                    {
                      if (*(_QWORD *)v493 != v296)
                        objc_enumerationMutation(v293);
                      objc_msgSend(*(id *)(*((_QWORD *)&v492 + 1) + 8 * i26), "clearUnknownFields:", 1);
                    }
                    v295 = objc_msgSend(v293, "countByEnumeratingWithState:objects:count:", &v492, v500, 16);
                  }
                  while (v295);
                }

              }
              v298 = *(_QWORD *)(v289 + 32);
              if (v298)
              {
                os_unfair_lock_lock_with_options();
                *(_BYTE *)(v298 + 60) |= 1u;
                *(_BYTE *)(v298 + 60) |= 0x10u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v298 + 56));
                v299 = *(void **)(v298 + 16);
                *(_QWORD *)(v298 + 16) = 0;

                -[GEOPDGuidesLocationsSuggestionResult readAll:](v298, 0);
                v495 = 0u;
                v494 = 0u;
                v493 = 0u;
                v492 = 0u;
                v300 = *(id *)(v298 + 24);
                v301 = objc_msgSend(v300, "countByEnumeratingWithState:objects:count:", &v492, v500, 16);
                if (v301)
                {
                  v302 = v301;
                  v303 = *(_QWORD *)v493;
                  do
                  {
                    for (i27 = 0; i27 != v302; ++i27)
                    {
                      if (*(_QWORD *)v493 != v303)
                        objc_enumerationMutation(v300);
                      -[GEOPDGuidesLocationEntry clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v492 + 1) + 8 * i27), 1);
                    }
                    v302 = objc_msgSend(v300, "countByEnumeratingWithState:objects:count:", &v492, v500, 16);
                  }
                  while (v302);
                }

                -[GEOPDGuidesLocationEntry clearUnknownFields:](*(_QWORD *)(v298 + 32), 1);
              }
            }
          }
          v287 = objc_msgSend(v431, "countByEnumeratingWithState:objects:count:", &v488, &v496, 16);
        }
        while (v287);
      }

    }
    -[GEOPDCollectionSuggestionResult clearUnknownFields:](v425[19]);
    v305 = v425[41];
    if (v305)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v305 + 52) |= 1u;
      *(_BYTE *)(v305 + 52) |= 8u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v305 + 48));
      v306 = *(void **)(v305 + 16);
      *(_QWORD *)(v305 + 16) = 0;

      -[GEOPDPublisherViewResult readAll:](v305, 0);
      v495 = 0u;
      v494 = 0u;
      v493 = 0u;
      v492 = 0u;
      v307 = *(id *)(v305 + 32);
      v308 = objc_msgSend(v307, "countByEnumeratingWithState:objects:count:", &v492, v500, 16);
      if (v308)
      {
        v309 = v308;
        v310 = *(_QWORD *)v493;
        do
        {
          for (i28 = 0; i28 != v309; ++i28)
          {
            if (*(_QWORD *)v493 != v310)
              objc_enumerationMutation(v307);
            -[GEOPDPublisherViewResultFilter clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v492 + 1) + 8 * i28));
          }
          v309 = objc_msgSend(v307, "countByEnumeratingWithState:objects:count:", &v492, v500, 16);
        }
        while (v309);
      }

      v491 = 0u;
      v490 = 0u;
      v489 = 0u;
      v488 = 0u;
      v312 = *(id *)(v305 + 24);
      v313 = objc_msgSend(v312, "countByEnumeratingWithState:objects:count:", &v488, &v496, 16);
      if (v313)
      {
        v314 = v313;
        v315 = *(_QWORD *)v489;
        do
        {
          for (i29 = 0; i29 != v314; ++i29)
          {
            if (*(_QWORD *)v489 != v315)
              objc_enumerationMutation(v312);
            objc_msgSend(*(id *)(*((_QWORD *)&v488 + 1) + 8 * i29), "clearUnknownFields:", 1);
          }
          v314 = objc_msgSend(v312, "countByEnumeratingWithState:objects:count:", &v488, &v496, 16);
        }
        while (v314);
      }

    }
    v317 = v425[6];
    if (v317)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v317 + 60) |= 1u;
      *(_BYTE *)(v317 + 60) |= 0x10u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v317 + 56));
      v318 = *(void **)(v317 + 16);
      *(_QWORD *)(v317 + 16) = 0;

      -[GEOPDAllCollectionsViewResult readAll:](v317, 0);
      -[GEOPDPublisherSuggestionResult clearUnknownFields:](*(_QWORD *)(v317 + 32));
      v495 = 0u;
      v494 = 0u;
      v493 = 0u;
      v492 = 0u;
      v319 = *(id *)(v317 + 40);
      v320 = objc_msgSend(v319, "countByEnumeratingWithState:objects:count:", &v492, v500, 16);
      if (v320)
      {
        v321 = v320;
        v322 = *(_QWORD *)v493;
        do
        {
          for (i30 = 0; i30 != v321; ++i30)
          {
            if (*(_QWORD *)v493 != v322)
              objc_enumerationMutation(v319);
            -[GEOPDAllCollectionsViewResultFilter clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v492 + 1) + 8 * i30));
          }
          v321 = objc_msgSend(v319, "countByEnumeratingWithState:objects:count:", &v492, v500, 16);
        }
        while (v321);
      }

      v491 = 0u;
      v490 = 0u;
      v489 = 0u;
      v488 = 0u;
      v324 = *(id *)(v317 + 24);
      v325 = objc_msgSend(v324, "countByEnumeratingWithState:objects:count:", &v488, &v496, 16);
      if (v325)
      {
        v326 = v325;
        v327 = *(_QWORD *)v489;
        do
        {
          for (i31 = 0; i31 != v326; ++i31)
          {
            if (*(_QWORD *)v489 != v327)
              objc_enumerationMutation(v324);
            objc_msgSend(*(id *)(*((_QWORD *)&v488 + 1) + 8 * i31), "clearUnknownFields:", 1);
          }
          v326 = objc_msgSend(v324, "countByEnumeratingWithState:objects:count:", &v488, &v496, 16);
        }
        while (v326);
      }

    }
    v329 = v425[5];
    if (v329)
    {
      v330 = *(void **)(v329 + 8);
      *(_QWORD *)(v329 + 8) = 0;

    }
    v331 = v425[50];
    if (v331)
    {
      v332 = *(void **)(v331 + 8);
      *(_QWORD *)(v331 + 8) = 0;

    }
    v333 = v425[28];
    if (v333)
    {
      v334 = *(void **)(v333 + 8);
      *(_QWORD *)(v333 + 8) = 0;

      v499 = 0u;
      v498 = 0u;
      v497 = 0u;
      v496 = 0u;
      v335 = *(id *)(v333 + 16);
      v336 = objc_msgSend(v335, "countByEnumeratingWithState:objects:count:", &v496, v500, 16);
      if (v336)
      {
        v337 = v336;
        v338 = *(_QWORD *)v497;
        do
        {
          for (i32 = 0; i32 != v337; ++i32)
          {
            if (*(_QWORD *)v497 != v338)
              objc_enumerationMutation(v335);
            v340 = *(_QWORD *)(*((_QWORD *)&v496 + 1) + 8 * i32);
            if (v340)
            {
              os_unfair_lock_lock_with_options();
              *(_BYTE *)(v340 + 72) |= 2u;
              *(_BYTE *)(v340 + 72) |= 0x40u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v340 + 64));
              v341 = *(void **)(v340 + 16);
              *(_QWORD *)(v340 + 16) = 0;

              -[GEOPDMapsHomeSection readAll:](v340, 0);
              -[GEOPDCollectionSuggestionResult clearUnknownFields:](*(_QWORD *)(v340 + 24));
              -[GEOPDGuidesLocationEntry clearUnknownFields:](*(_QWORD *)(v340 + 32), 1);
            }
          }
          v337 = objc_msgSend(v335, "countByEnumeratingWithState:objects:count:", &v496, v500, 16);
        }
        while (v337);
      }

    }
    v342 = v425[7];
    if (v342)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v342 + 52) |= 1u;
      *(_BYTE *)(v342 + 52) |= 8u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v342 + 48));
      v343 = *(void **)(v342 + 16);
      *(_QWORD *)(v342 + 16) = 0;

      -[GEOPDAllGuidesLocationsViewResult readAll:](v342, 0);
      v491 = 0u;
      v490 = 0u;
      v489 = 0u;
      v488 = 0u;
      objd = *(id *)(v342 + 24);
      v344 = objc_msgSend(objd, "countByEnumeratingWithState:objects:count:", &v488, &v496, 16);
      if (v344)
      {
        v345 = v344;
        v346 = *(_QWORD *)v489;
        do
        {
          for (i33 = 0; i33 != v345; ++i33)
          {
            if (*(_QWORD *)v489 != v346)
              objc_enumerationMutation(objd);
            v348 = *(_QWORD *)(*((_QWORD *)&v488 + 1) + 8 * i33);
            if (v348)
            {
              os_unfair_lock_lock_with_options();
              *(_BYTE *)(v348 + 52) |= 1u;
              *(_BYTE *)(v348 + 52) |= 8u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v348 + 48));
              v349 = *(void **)(v348 + 16);
              *(_QWORD *)(v348 + 16) = 0;

              -[GEOPDAllGuidesLocationsSection readAll:](v348, 0);
              v350 = *(_QWORD *)(v348 + 32);
              if (v350)
              {
                os_unfair_lock_lock_with_options();
                *(_BYTE *)(v350 + 56) |= 2u;
                *(_BYTE *)(v350 + 56) |= 0x10u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v350 + 48));
                v351 = *(void **)(v350 + 16);
                *(_QWORD *)(v350 + 16) = 0;

                -[GEOPDAllGuidesLocationsSectionHeader readAll:](v350, 0);
                objc_msgSend(*(id *)(v350 + 32), "clearUnknownFields:", 1);
              }
              v495 = 0u;
              v494 = 0u;
              v493 = 0u;
              v492 = 0u;
              v352 = *(id *)(v348 + 24);
              v353 = objc_msgSend(v352, "countByEnumeratingWithState:objects:count:", &v492, v500, 16);
              if (v353)
              {
                v354 = v353;
                v355 = *(_QWORD *)v493;
                do
                {
                  for (i34 = 0; i34 != v354; ++i34)
                  {
                    if (*(_QWORD *)v493 != v355)
                      objc_enumerationMutation(v352);
                    -[GEOPDGuidesLocationEntry clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v492 + 1) + 8 * i34), 1);
                  }
                  v354 = objc_msgSend(v352, "countByEnumeratingWithState:objects:count:", &v492, v500, 16);
                }
                while (v354);
              }

            }
          }
          v345 = objc_msgSend(objd, "countByEnumeratingWithState:objects:count:", &v488, &v496, 16);
        }
        while (v345);
      }

    }
    v357 = v425[25];
    if (v357)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v357 + 68) |= 1u;
      *(_BYTE *)(v357 + 68) |= 0x20u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v357 + 64));
      v358 = *(void **)(v357 + 16);
      *(_QWORD *)(v357 + 16) = 0;

      -[GEOPDGuidesHomeResult readAll:](v357, 0);
      -[GEOPDGuidesHomeFixedSection clearUnknownFields:](*(_QWORD *)(v357 + 24));
      -[GEOPDGuidesHomeFixedSection clearUnknownFields:](*(_QWORD *)(v357 + 40));
      -[GEOPDGuidesHomeFixedSection clearUnknownFields:](*(_QWORD *)(v357 + 32));
      v474 = 0u;
      v475 = 0u;
      v472 = 0u;
      v473 = 0u;
      obje = *(id *)(v357 + 48);
      v359 = objc_msgSend(obje, "countByEnumeratingWithState:objects:count:", &v472, &v488, 16);
      if (v359)
      {
        v360 = v359;
        v361 = *(_QWORD *)v473;
        do
        {
          for (i35 = 0; i35 != v360; ++i35)
          {
            if (*(_QWORD *)v473 != v361)
              objc_enumerationMutation(obje);
            v363 = *(_QWORD *)(*((_QWORD *)&v472 + 1) + 8 * i35);
            if (v363)
            {
              os_unfair_lock_lock_with_options();
              *(_BYTE *)(v363 + 76) |= 4u;
              *(_BYTE *)(v363 + 76) |= 0x80u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v363 + 64));
              v364 = *(void **)(v363 + 16);
              *(_QWORD *)(v363 + 16) = 0;

              -[GEOPDGuidesHomeRepeatableSection readAll:](v363, 0);
              v486 = 0u;
              v487 = 0u;
              v484 = 0u;
              v485 = 0u;
              v365 = *(id *)(v363 + 24);
              v366 = objc_msgSend(v365, "countByEnumeratingWithState:objects:count:", &v484, v500, 16);
              if (v366)
              {
                v367 = v366;
                v368 = *(_QWORD *)v485;
                do
                {
                  for (i36 = 0; i36 != v367; ++i36)
                  {
                    if (*(_QWORD *)v485 != v368)
                      objc_enumerationMutation(v365);
                    objc_msgSend(*(id *)(*((_QWORD *)&v484 + 1) + 8 * i36), "clearUnknownFields:", 1);
                  }
                  v367 = objc_msgSend(v365, "countByEnumeratingWithState:objects:count:", &v484, v500, 16);
                }
                while (v367);
              }

              v482 = 0u;
              v483 = 0u;
              v480 = 0u;
              v481 = 0u;
              v370 = *(id *)(v363 + 48);
              v371 = objc_msgSend(v370, "countByEnumeratingWithState:objects:count:", &v480, &v496, 16);
              if (v371)
              {
                v372 = v371;
                v373 = *(_QWORD *)v481;
                do
                {
                  for (i37 = 0; i37 != v372; ++i37)
                  {
                    if (*(_QWORD *)v481 != v373)
                      objc_enumerationMutation(v370);
                    objc_msgSend(*(id *)(*((_QWORD *)&v480 + 1) + 8 * i37), "clearUnknownFields:", 1);
                  }
                  v372 = objc_msgSend(v370, "countByEnumeratingWithState:objects:count:", &v480, &v496, 16);
                }
                while (v372);
              }

              v478 = 0u;
              v479 = 0u;
              v476 = 0u;
              v477 = 0u;
              v375 = *(id *)(v363 + 32);
              v376 = objc_msgSend(v375, "countByEnumeratingWithState:objects:count:", &v476, &v492, 16);
              if (v376)
              {
                v377 = v376;
                v378 = *(_QWORD *)v477;
                do
                {
                  for (i38 = 0; i38 != v377; ++i38)
                  {
                    if (*(_QWORD *)v477 != v378)
                      objc_enumerationMutation(v375);
                    -[GEOPDGuidesLocationEntry clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v476 + 1) + 8 * i38), 1);
                  }
                  v377 = objc_msgSend(v375, "countByEnumeratingWithState:objects:count:", &v476, &v492, 16);
                }
                while (v377);
              }

            }
          }
          v360 = objc_msgSend(obje, "countByEnumeratingWithState:objects:count:", &v472, &v488, 16);
        }
        while (v360);
      }

    }
    v380 = v425;
    v381 = v425[20];
    if (v381)
    {
      v382 = *(void **)(v381 + 8);
      *(_QWORD *)(v381 + 8) = 0;

    }
    v383 = v425[42];
    if (v383)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v383 + 52) |= 1u;
      *(_BYTE *)(v383 + 52) |= 8u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v383 + 48));
      v384 = *(void **)(v383 + 16);
      *(_QWORD *)(v383 + 16) = 0;

      -[GEOPDQueryUnderstandingResult readAll:](v383, 0);
      v385 = *(_QWORD *)(v383 + 32);
      if (v385)
      {
        v386 = *(void **)(v385 + 8);
        *(_QWORD *)(v385 + 8) = 0;

        v474 = 0u;
        v475 = 0u;
        v472 = 0u;
        v473 = 0u;
        v426 = *(id *)(v385 + 16);
        v428 = objc_msgSend(v426, "countByEnumeratingWithState:objects:count:", &v472, &v488, 16);
        if (v428)
        {
          v427 = *(_QWORD *)v473;
          do
          {
            for (i39 = 0; i39 != (id)v428; i39 = (char *)i39 + 1)
            {
              if (*(_QWORD *)v473 != v427)
                objc_enumerationMutation(v426);
              v388 = *(_QWORD *)(*((_QWORD *)&v472 + 1) + 8 * (_QWORD)i39);
              if (v388)
              {
                os_unfair_lock_lock_with_options();
                *(_BYTE *)(v388 + 56) |= 2u;
                *(_BYTE *)(v388 + 56) |= 0x10u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v388 + 48));
                v389 = *(void **)(v388 + 16);
                *(_QWORD *)(v388 + 16) = 0;

                -[GEOPDQueryUnderstandingTaxonomyResultItem readAll:](v388, 0);
                v390 = *(_QWORD *)(v388 + 32);
                if (v390)
                {
                  v391 = *(void **)(v390 + 8);
                  *(_QWORD *)(v390 + 8) = 0;

                }
                v392 = *(_QWORD *)(v388 + 24);
                if (v392)
                {
                  v432 = i39;
                  v393 = *(void **)(v392 + 8);
                  *(_QWORD *)(v392 + 8) = 0;

                  v478 = 0u;
                  v479 = 0u;
                  v476 = 0u;
                  v477 = 0u;
                  objf = *(id *)(v392 + 16);
                  v394 = objc_msgSend(objf, "countByEnumeratingWithState:objects:count:", &v476, &v492, 16);
                  if (v394)
                  {
                    v395 = v394;
                    v396 = *(_QWORD *)v477;
                    do
                    {
                      for (i40 = 0; i40 != v395; ++i40)
                      {
                        if (*(_QWORD *)v477 != v396)
                          objc_enumerationMutation(objf);
                        v398 = *(_QWORD *)(*((_QWORD *)&v476 + 1) + 8 * i40);
                        if (v398)
                        {
                          os_unfair_lock_lock_with_options();
                          *(_DWORD *)(v398 + 168) |= 8u;
                          *(_DWORD *)(v398 + 168) |= 0x40000u;
                          os_unfair_lock_unlock((os_unfair_lock_t)(v398 + 160));
                          v399 = *(void **)(v398 + 16);
                          *(_QWORD *)(v398 + 16) = 0;

                          -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand readAll:](v398, 0);
                          objc_msgSend(*(id *)(v398 + 128), "clearUnknownFields:", 1);
                          -[GEOPDMultiLocalizedString clearUnknownFields:](*(_QWORD *)(v398 + 120));
                          v486 = 0u;
                          v487 = 0u;
                          v484 = 0u;
                          v485 = 0u;
                          v400 = *(id *)(v398 + 112);
                          v401 = objc_msgSend(v400, "countByEnumeratingWithState:objects:count:", &v484, v500, 16);
                          if (v401)
                          {
                            v402 = v401;
                            v403 = *(_QWORD *)v485;
                            do
                            {
                              for (i41 = 0; i41 != v402; ++i41)
                              {
                                if (*(_QWORD *)v485 != v403)
                                  objc_enumerationMutation(v400);
                                -[GEOPDIconMapping clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v484 + 1) + 8 * i41));
                              }
                              v402 = objc_msgSend(v400, "countByEnumeratingWithState:objects:count:", &v484, v500, 16);
                            }
                            while (v402);
                          }

                          v482 = 0u;
                          v483 = 0u;
                          v480 = 0u;
                          v481 = 0u;
                          v405 = *(id *)(v398 + 88);
                          v406 = objc_msgSend(v405, "countByEnumeratingWithState:objects:count:", &v480, &v496, 16);
                          if (v406)
                          {
                            v407 = v406;
                            v408 = *(_QWORD *)v481;
                            do
                            {
                              for (i42 = 0; i42 != v407; ++i42)
                              {
                                if (*(_QWORD *)v481 != v408)
                                  objc_enumerationMutation(v405);
                                -[GEOPDIconMapping clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v480 + 1) + 8 * i42));
                              }
                              v407 = objc_msgSend(v405, "countByEnumeratingWithState:objects:count:", &v480, &v496, 16);
                            }
                            while (v407);
                          }

                          -[GEOPDMultiLocalizedString clearUnknownFields:](*(_QWORD *)(v398 + 96));
                          v410 = *(_QWORD *)(v398 + 64);
                          if (v410)
                          {
                            os_unfair_lock_lock_with_options();
                            *(_BYTE *)(v410 + 52) |= 1u;
                            *(_BYTE *)(v410 + 52) |= 8u;
                            os_unfair_lock_unlock((os_unfair_lock_t)(v410 + 48));
                            v411 = *(void **)(v410 + 16);
                            *(_QWORD *)(v410 + 16) = 0;

                            -[GEOPDBusinessConnectAttributes readAll:](v410, 0);
                          }
                        }
                      }
                      v395 = objc_msgSend(objf, "countByEnumeratingWithState:objects:count:", &v476, &v492, 16);
                    }
                    while (v395);
                  }

                  i39 = v432;
                }
              }
            }
            v428 = objc_msgSend(v426, "countByEnumeratingWithState:objects:count:", &v472, &v488, 16);
          }
          while (v428);
        }

      }
      v380 = v425;
    }
    v412 = v380[39];
    if (v412)
    {
      v413 = *(void **)(v412 + 8);
      *(_QWORD *)(v412 + 8) = 0;

    }
    v414 = v380[38];
    if (v414)
    {
      v415 = *(void **)(v414 + 8);
      *(_QWORD *)(v414 + 8) = 0;

    }
    v416 = v380[33];
    if (v416)
    {
      v417 = *(void **)(v416 + 8);
      *(_QWORD *)(v416 + 8) = 0;

      objc_msgSend(*(id *)(v416 + 16), "clearUnknownFields:", 1);
    }
    v418 = v380[44];
    if (v418)
    {
      v419 = *(void **)(v418 + 8);
      *(_QWORD *)(v418 + 8) = 0;

      v420 = *(_QWORD *)(v418 + 16);
      if (v420)
      {
        v421 = *(void **)(v420 + 8);
        *(_QWORD *)(v420 + 8) = 0;

      }
    }
    v422 = v380[4];
    if (v422)
    {
      v423 = *(void **)(v422 + 8);
      *(_QWORD *)(v422 + 8) = 0;

    }
  }
}

@end
