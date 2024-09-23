@implementation GEOPDPlaceRequestParameters

- (id)reverseGeocodingParameters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRequestParameters _readReverseGeocodingParameters]((uint64_t)a1);
    a1 = (id *)v1[44];
  }
  return a1;
}

- (void)_readReverseGeocodingParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(_BYTE *)(a1 + 481) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readReverseGeocodingParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)searchParameters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRequestParameters _readSearchParameters]((uint64_t)a1);
    a1 = (id *)v1[47];
  }
  return a1;
}

- (void)_readSearchParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(_BYTE *)(a1 + 481) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)wifiFingerprintParameters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRequestParameters _readWifiFingerprintParameters]((uint64_t)a1);
    a1 = (id *)v1[57];
  }
  return a1;
}

- (void)_readWifiFingerprintParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(_BYTE *)(a1 + 482) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWifiFingerprintParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)transitNearbyScheduleLookupParameters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRequestParameters _readTransitNearbyScheduleLookupParameters]((uint64_t)a1);
    a1 = (id *)v1[53];
  }
  return a1;
}

- (void)_readTransitNearbyScheduleLookupParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(_BYTE *)(a1 + 482) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitNearbyScheduleLookupParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)transitNearbyPaymentMethodLookupParameters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRequestParameters _readTransitNearbyPaymentMethodLookupParameters]((uint64_t)a1);
    a1 = (id *)v1[52];
  }
  return a1;
}

- (void)_readTransitNearbyPaymentMethodLookupParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(_BYTE *)(a1 + 482) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitNearbyPaymentMethodLookupParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)merchantLookupParameters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRequestParameters _readMerchantLookupParameters]((uint64_t)a1);
    a1 = (id *)v1[31];
  }
  return a1;
}

- (void)_readMerchantLookupParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(_BYTE *)(a1 + 479) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantLookupParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)groundViewLabelParameters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRequestParameters _readGroundViewLabelParameters]((uint64_t)a1);
    a1 = (id *)v1[24];
  }
  return a1;
}

- (void)_readGroundViewLabelParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(_BYTE *)(a1 + 478) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGroundViewLabelParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)externalTransitLookupParameters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRequestParameters _readExternalTransitLookupParameters]((uint64_t)a1);
    a1 = (id *)v1[21];
  }
  return a1;
}

- (void)_readExternalTransitLookupParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(_BYTE *)(a1 + 478) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExternalTransitLookupParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)batchReverseGeocodingParameters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRequestParameters _readBatchReverseGeocodingParameters]((uint64_t)a1);
    a1 = (id *)v1[12];
  }
  return a1;
}

- (void)_readBatchReverseGeocodingParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(_BYTE *)(a1 + 477) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBatchReverseGeocodingParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)autocompleteParameters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRequestParameters _readAutocompleteParameters]((uint64_t)a1);
    a1 = (id *)v1[8];
  }
  return a1;
}

- (void)_readAutocompleteParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(_BYTE *)(a1 + 476) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAutocompleteParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
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
  id v110;
  void *v111;
  id v112;
  void *v113;
  id v114;
  void *v115;
  id v116;
  void *v117;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*((_BYTE *)&self->_flags + 7) & 1) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlaceRequestParameters readAll:]((uint64_t)self, 0);
    v8 = -[GEOPDSearchParameters copyWithZone:](self->_searchParameters, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 376);
    *(_QWORD *)(v5 + 376) = v8;

    v10 = -[GEOPDGeocodingParameters copyWithZone:](self->_geocodingParameters, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 184);
    *(_QWORD *)(v5 + 184) = v10;

    v12 = -[GEOPDCanonicalLocationSearchParameters copyWithZone:](self->_canonicalLocationSearchParameters, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 128);
    *(_QWORD *)(v5 + 128) = v12;

    v14 = -[GEOPDReverseGeocodingParameters copyWithZone:](self->_reverseGeocodingParameters, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 352);
    *(_QWORD *)(v5 + 352) = v14;

    v16 = -[GEOPDPlaceLookupParameters copyWithZone:](self->_placeLookupParameters, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 280);
    *(_QWORD *)(v5 + 280) = v16;

    v18 = -[GEOPDMerchantLookupParameters copyWithZone:](self->_merchantLookupParameters, "copyWithZone:", a3);
    v19 = *(void **)(v5 + 248);
    *(_QWORD *)(v5 + 248) = v18;

    v20 = -[GEOPDPlaceRefinementParameters copyWithZone:](self->_placeRefinementParameters, "copyWithZone:", a3);
    v21 = *(void **)(v5 + 296);
    *(_QWORD *)(v5 + 296) = v20;

    v22 = -[GEOPDSiriSearchParameters copyWithZone:](self->_siriSearchParameters, "copyWithZone:", a3);
    v23 = *(void **)(v5 + 400);
    *(_QWORD *)(v5 + 400) = v22;

    v24 = -[GEOPDLocationDirectedSearchParameters copyWithZone:](self->_locationDirectedSearchParameters, "copyWithZone:", a3);
    v25 = *(void **)(v5 + 216);
    *(_QWORD *)(v5 + 216) = v24;

    v26 = -[GEOPDAutocompleteParameters copyWithZone:](self->_autocompleteParameters, "copyWithZone:", a3);
    v27 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v26;

    v28 = -[GEOPDSearchBrowseCategorySuggestionParameters copyWithZone:](self->_browseCategorySuggestionParameters, "copyWithZone:", a3);
    v29 = *(void **)(v5 + 120);
    *(_QWORD *)(v5 + 120) = v28;

    v30 = -[GEOPDCategorySearchParameters copyWithZone:](self->_categorySearchParameters, "copyWithZone:", a3);
    v31 = *(void **)(v5 + 136);
    *(_QWORD *)(v5 + 136) = v30;

    v32 = -[GEOPDPopularNearbySearchParameters copyWithZone:](self->_popularNearbySearchParameters, "copyWithZone:", a3);
    v33 = *(void **)(v5 + 320);
    *(_QWORD *)(v5 + 320) = v32;

    v34 = -[GEOPDSearchZeroKeywordCategorySuggestionParameters copyWithZone:](self->_searchZeroKeywordCategorySuggestionParameters, "copyWithZone:", a3);
    v35 = *(void **)(v5 + 384);
    *(_QWORD *)(v5 + 384) = v34;

    v36 = -[GEOPDSearchFieldPlaceholderParameters copyWithZone:](self->_searchFieldPlaceholderParameters, "copyWithZone:", a3);
    v37 = *(void **)(v5 + 368);
    *(_QWORD *)(v5 + 368) = v36;

    v38 = -[GEOPDBatchPopularNearbySearchParameters copyWithZone:](self->_batchPopularNearbySearchParameters, "copyWithZone:", a3);
    v39 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = v38;

    v40 = -[GEOPDVendorSpecificPlaceRefinementParameters copyWithZone:](self->_vendorSpecificPlaceRefinementParameters, "copyWithZone:", a3);
    v41 = *(void **)(v5 + 448);
    *(_QWORD *)(v5 + 448) = v40;

    v42 = -[GEOPDNearbySearchParameters copyWithZone:](self->_nearbySearchParameters, "copyWithZone:", a3);
    v43 = *(void **)(v5 + 256);
    *(_QWORD *)(v5 + 256) = v42;

    v44 = -[GEOPDAddressObjectGeocodingParameters copyWithZone:](self->_addressObjectGeocodingParameters, "copyWithZone:", a3);
    v45 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v44;

    v46 = -[GEOPDSearchZeroKeywordWithSearchResultsSuggestionParameters copyWithZone:](self->_searchZeroKeywordWithSearchResultsSuggestionParameters, "copyWithZone:", a3);
    v47 = *(void **)(v5 + 392);
    *(_QWORD *)(v5 + 392) = v46;

    v48 = -[GEOPDExternalTransitLookupParameters copyWithZone:](self->_externalTransitLookupParameters, "copyWithZone:", a3);
    v49 = *(void **)(v5 + 168);
    *(_QWORD *)(v5 + 168) = v48;

    v50 = -[GEOPDFeatureIdGeocodingParameters copyWithZone:](self->_featureIdGeocodingParameters, "copyWithZone:", a3);
    v51 = *(void **)(v5 + 176);
    *(_QWORD *)(v5 + 176) = v50;

    v52 = -[GEOPDMapsIdentifierPlaceLookupParameters copyWithZone:](self->_mapsIdentifierPlaceLookupParameters, "copyWithZone:", a3);
    v53 = *(void **)(v5 + 232);
    *(_QWORD *)(v5 + 232) = v52;

    v54 = -[GEOPDBatchReverseGeocodingParameters copyWithZone:](self->_batchReverseGeocodingParameters, "copyWithZone:", a3);
    v55 = *(void **)(v5 + 96);
    *(_QWORD *)(v5 + 96) = v54;

    v56 = -[GEOPDBrandLookupParameters copyWithZone:](self->_brandLookupParameters, "copyWithZone:", a3);
    v57 = *(void **)(v5 + 112);
    *(_QWORD *)(v5 + 112) = v56;

    v58 = -[GEOPDWifiFingerprintParameters copyWithZone:](self->_wifiFingerprintParameters, "copyWithZone:", a3);
    v59 = *(void **)(v5 + 456);
    *(_QWORD *)(v5 + 456) = v58;

    v60 = -[GEOPDIpGeoLookupParameters copyWithZone:](self->_ipGeoLookupParameters, "copyWithZone:", a3);
    v61 = *(void **)(v5 + 208);
    *(_QWORD *)(v5 + 208) = v60;

    v62 = -[GEOPDGroundViewLabelParameters copyWithZone:](self->_groundViewLabelParameters, "copyWithZone:", a3);
    v63 = *(void **)(v5 + 192);
    *(_QWORD *)(v5 + 192) = v62;

    v64 = -[GEOPDBatchSpatialLookupParameters copyWithZone:](self->_batchSpatialLookupParameters, "copyWithZone:", a3);
    v65 = *(void **)(v5 + 104);
    *(_QWORD *)(v5 + 104) = v64;

    v66 = -[GEOPDTransitVehiclePositionParameters copyWithZone:](self->_transitVehiclePositionParameters, "copyWithZone:", a3);
    v67 = *(void **)(v5 + 440);
    *(_QWORD *)(v5 + 440) = v66;

    v68 = -[GEOPDPlaceCollectionLookupParameters copyWithZone:](self->_placeCollectionLookupParameter, "copyWithZone:", a3);
    v69 = *(void **)(v5 + 272);
    *(_QWORD *)(v5 + 272) = v68;

    v70 = -[GEOPBTransitScheduleLookupParameters copyWithZone:](self->_transitScheduleLookupParameter, "copyWithZone:", a3);
    v71 = *(void **)(v5 + 432);
    *(_QWORD *)(v5 + 432) = v70;

    v72 = -[GEOPDBatchCategoryLookupParameters copyWithZone:](self->_batchCategoryLookupParameters, "copyWithZone:", a3);
    v73 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v72;

    v74 = -[GEOPDBatchMerchantLookupBrandParameters copyWithZone:](self->_batchMerchantLookupBrandParameters, "copyWithZone:", a3);
    v75 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v74;

    v76 = -[GEOPDChildPlaceLookupByCategoryParameters copyWithZone:](self->_childPlaceLookupByCategoryParameters, "copyWithZone:", a3);
    v77 = *(void **)(v5 + 144);
    *(_QWORD *)(v5 + 144) = v76;

    v78 = -[GEOPDCollectionSuggestionParameters copyWithZone:](self->_collectionSuggestionParameters, "copyWithZone:", a3);
    v79 = *(void **)(v5 + 152);
    *(_QWORD *)(v5 + 152) = v78;

    v80 = -[GEOPDMapsSearchHomeParameters copyWithZone:](self->_mapsSearchHomeParameters, "copyWithZone:", a3);
    v81 = *(void **)(v5 + 240);
    *(_QWORD *)(v5 + 240) = v80;

    v82 = -[GEOPDPlaceQuestionnaireLookupParameters copyWithZone:](self->_placeQuestionnaireLookupParameters, "copyWithZone:", a3);
    v83 = *(void **)(v5 + 288);
    *(_QWORD *)(v5 + 288) = v82;

    v84 = -[GEOPDPublisherViewParameters copyWithZone:](self->_publisherViewParameters, "copyWithZone:", a3);
    v85 = *(void **)(v5 + 328);
    *(_QWORD *)(v5 + 328) = v84;

    v86 = -[GEOPDAllCollectionsViewParameters copyWithZone:](self->_allCollectionsViewParameters, "copyWithZone:", a3);
    v87 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v86;

    v88 = -[GEOPDAirportEntityPlaceLookupParameters copyWithZone:](self->_airportEntityPlaceLookupParameters, "copyWithZone:", a3);
    v89 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v88;

    v90 = -[GEOPDTerritoryLookupParameters copyWithZone:](self->_territoryLookupParameters, "copyWithZone:", a3);
    v91 = *(void **)(v5 + 408);
    *(_QWORD *)(v5 + 408) = v90;

    v92 = -[GEOPDTransitNearbyScheduleLookupParameters copyWithZone:](self->_transitNearbyScheduleLookupParameters, "copyWithZone:", a3);
    v93 = *(void **)(v5 + 424);
    *(_QWORD *)(v5 + 424) = v92;

    v94 = -[GEOPDMapsHomeParameters copyWithZone:](self->_mapsHomeParameters, "copyWithZone:", a3);
    v95 = *(void **)(v5 + 224);
    *(_QWORD *)(v5 + 224) = v94;

    v96 = -[GEOPDAllGuidesLocationsViewParameters copyWithZone:](self->_allGuidesLocationsViewParameters, "copyWithZone:", a3);
    v97 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v96;

    v98 = -[GEOPDGuidesHomeParameters copyWithZone:](self->_guidesHomeParameters, "copyWithZone:", a3);
    v99 = *(void **)(v5 + 200);
    *(_QWORD *)(v5 + 200) = v98;

    v100 = -[GEOPDExtendedGeoLookupParameters copyWithZone:](self->_extendedGeoLookupParameters, "copyWithZone:", a3);
    v101 = *(void **)(v5 + 160);
    *(_QWORD *)(v5 + 160) = v100;

    v102 = -[GEOPDQueryUnderstandingParameters copyWithZone:](self->_queryUnderstandingParameters, "copyWithZone:", a3);
    v103 = *(void **)(v5 + 336);
    *(_QWORD *)(v5 + 336) = v102;

    v104 = -[GEOPDPoiAtAddressLookupParameters copyWithZone:](self->_poiAtAddressLookupParameters, "copyWithZone:", a3);
    v105 = *(void **)(v5 + 312);
    *(_QWORD *)(v5 + 312) = v104;

    v106 = -[GEOPDTransitNearbyPaymentMethodLookupParameters copyWithZone:](self->_transitNearbyPaymentMethodLookupParameters, "copyWithZone:", a3);
    v107 = *(void **)(v5 + 416);
    *(_QWORD *)(v5 + 416) = v106;

    v108 = -[GEOPDPlacecardEnrichmentParameters copyWithZone:](self->_placecardEnrichmentParameters, "copyWithZone:", a3);
    v109 = *(void **)(v5 + 304);
    *(_QWORD *)(v5 + 304) = v108;

    v110 = -[GEOPDOfflineRegionNameParameters copyWithZone:](self->_offlineRegionNameParameters, "copyWithZone:", a3);
    v111 = *(void **)(v5 + 264);
    *(_QWORD *)(v5 + 264) = v110;

    v112 = -[GEOPDSearchCapabilitiesParameters copyWithZone:](self->_searchCapabilitiesParameters, "copyWithZone:", a3);
    v113 = *(void **)(v5 + 360);
    *(_QWORD *)(v5 + 360) = v112;

    v114 = -[GEOPDRefreshIdLookUpParameters copyWithZone:](self->_refreshIdLookUpParameters, "copyWithZone:", a3);
    v115 = *(void **)(v5 + 344);
    *(_QWORD *)(v5 + 344) = v114;

    v116 = -[GEOPDAddressRecommendationParameters copyWithZone:](self->_addressRecommendationParameters, "copyWithZone:", a3);
    v117 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v116;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDPlaceRequestParametersReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (GEOPDPlaceRequestParameters)init
{
  GEOPDPlaceRequestParameters *v2;
  GEOPDPlaceRequestParameters *v3;
  GEOPDPlaceRequestParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceRequestParameters;
  v2 = -[GEOPDPlaceRequestParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)_readMapsIdentifierPlaceLookupParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(_BYTE *)(a1 + 479) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsIdentifierPlaceLookupParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (GEOPDPlaceRequestParameters)initWithReverseGeocodeLocation:(id)a3 preserveOriginalLocation:(BOOL)a4 placeTypeLimit:(int)a5
{
  id v8;
  GEOPDPlaceRequestParameters *v9;
  GEOPDReverseGeocodingParameters *v10;
  int v11;
  GEOPDPlaceRequestParameters *v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOPDPlaceRequestParameters;
  v9 = -[GEOPDPlaceRequestParameters init](&v14, sel_init);
  if (v9)
  {
    v10 = objc_alloc_init(GEOPDReverseGeocodingParameters);
    -[GEOPDReverseGeocodingParameters addExtendedLocation:]((uint64_t)v10, v8);
    if (v10)
    {
      *(_BYTE *)&v10->_flags |= 0x20u;
      *(_BYTE *)&v10->_flags |= 2u;
      v10->_preserveOriginalLocation = a4;
      if (a5)
      {
        v11 = _PDPlaceTypeForMapItemPlaceType(a5);
        *(_BYTE *)&v10->_flags |= 0x20u;
        *(_BYTE *)&v10->_flags |= 1u;
        v10->_placeTypeLimit = v11;
      }
    }
    -[GEOPDPlaceRequestParameters setReverseGeocodingParameters:]((uint64_t)v9, v10);
    v12 = v9;

  }
  return v9;
}

- (void)setReverseGeocodingParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100040000000000uLL;
    objc_storeStrong((id *)(a1 + 352), a2);
  }

}

- (GEOPDPlaceRequestParameters)initWithMapItemToRefine:(id)a3 coordinate:(id)a4 traits:(id)a5
{
  double var1;
  double var0;
  id v8;
  GEOPDPlaceRequestParameters *v9;
  GEOPDPlaceRefinementParameters *v10;
  GEOPDPlaceRequestParameters *v11;
  objc_super v13;

  var1 = a4.var1;
  var0 = a4.var0;
  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOPDPlaceRequestParameters;
  v9 = -[GEOPDPlaceRequestParameters init](&v13, sel_init);
  if (v9)
  {
    v10 = -[GEOPDPlaceRefinementParameters initWithMapItemToRefine:coordinate:]([GEOPDPlaceRefinementParameters alloc], "initWithMapItemToRefine:coordinate:", v8, var0, var1);
    -[GEOPDPlaceRequestParameters setPlaceRefinementParameters:]((uint64_t)v9, v10);
    v11 = v9;

  }
  return v9;
}

- (void)setPlaceRefinementParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100000800000000uLL;
    objc_storeStrong((id *)(a1 + 296), a2);
  }

}

- (GEOPDPlaceRequestParameters)initWithForwardGeocodeAddress:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  GEOPDPlaceRequestParameters *v10;
  GEOPDGeocodingParameters *v11;
  GEOPDPlaceRequestParameters *v12;
  objc_super v14;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)GEOPDPlaceRequestParameters;
  v10 = -[GEOPDPlaceRequestParameters init](&v14, sel_init);
  if (v10)
  {
    v11 = -[GEOPDGeocodingParameters initWithForwardGeocodeAddress:maxResults:traits:]([GEOPDGeocodingParameters alloc], "initWithForwardGeocodeAddress:maxResults:traits:", v8, v6, v9);
    -[GEOPDPlaceRequestParameters setGeocodingParameters:]((uint64_t)v10, v11);
    v12 = v10;

  }
  return v10;
}

- (void)setGeocodingParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100000000200000uLL;
    objc_storeStrong((id *)(a1 + 184), a2);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiFingerprintParameters, 0);
  objc_storeStrong((id *)&self->_vendorSpecificPlaceRefinementParameters, 0);
  objc_storeStrong((id *)&self->_transitVehiclePositionParameters, 0);
  objc_storeStrong((id *)&self->_transitScheduleLookupParameter, 0);
  objc_storeStrong((id *)&self->_transitNearbyScheduleLookupParameters, 0);
  objc_storeStrong((id *)&self->_transitNearbyPaymentMethodLookupParameters, 0);
  objc_storeStrong((id *)&self->_territoryLookupParameters, 0);
  objc_storeStrong((id *)&self->_siriSearchParameters, 0);
  objc_storeStrong((id *)&self->_searchZeroKeywordWithSearchResultsSuggestionParameters, 0);
  objc_storeStrong((id *)&self->_searchZeroKeywordCategorySuggestionParameters, 0);
  objc_storeStrong((id *)&self->_searchParameters, 0);
  objc_storeStrong((id *)&self->_searchFieldPlaceholderParameters, 0);
  objc_storeStrong((id *)&self->_searchCapabilitiesParameters, 0);
  objc_storeStrong((id *)&self->_reverseGeocodingParameters, 0);
  objc_storeStrong((id *)&self->_refreshIdLookUpParameters, 0);
  objc_storeStrong((id *)&self->_queryUnderstandingParameters, 0);
  objc_storeStrong((id *)&self->_publisherViewParameters, 0);
  objc_storeStrong((id *)&self->_popularNearbySearchParameters, 0);
  objc_storeStrong((id *)&self->_poiAtAddressLookupParameters, 0);
  objc_storeStrong((id *)&self->_placecardEnrichmentParameters, 0);
  objc_storeStrong((id *)&self->_placeRefinementParameters, 0);
  objc_storeStrong((id *)&self->_placeQuestionnaireLookupParameters, 0);
  objc_storeStrong((id *)&self->_placeLookupParameters, 0);
  objc_storeStrong((id *)&self->_placeCollectionLookupParameter, 0);
  objc_storeStrong((id *)&self->_offlineRegionNameParameters, 0);
  objc_storeStrong((id *)&self->_nearbySearchParameters, 0);
  objc_storeStrong((id *)&self->_merchantLookupParameters, 0);
  objc_storeStrong((id *)&self->_mapsSearchHomeParameters, 0);
  objc_storeStrong((id *)&self->_mapsIdentifierPlaceLookupParameters, 0);
  objc_storeStrong((id *)&self->_mapsHomeParameters, 0);
  objc_storeStrong((id *)&self->_locationDirectedSearchParameters, 0);
  objc_storeStrong((id *)&self->_ipGeoLookupParameters, 0);
  objc_storeStrong((id *)&self->_guidesHomeParameters, 0);
  objc_storeStrong((id *)&self->_groundViewLabelParameters, 0);
  objc_storeStrong((id *)&self->_geocodingParameters, 0);
  objc_storeStrong((id *)&self->_featureIdGeocodingParameters, 0);
  objc_storeStrong((id *)&self->_externalTransitLookupParameters, 0);
  objc_storeStrong((id *)&self->_extendedGeoLookupParameters, 0);
  objc_storeStrong((id *)&self->_collectionSuggestionParameters, 0);
  objc_storeStrong((id *)&self->_childPlaceLookupByCategoryParameters, 0);
  objc_storeStrong((id *)&self->_categorySearchParameters, 0);
  objc_storeStrong((id *)&self->_canonicalLocationSearchParameters, 0);
  objc_storeStrong((id *)&self->_browseCategorySuggestionParameters, 0);
  objc_storeStrong((id *)&self->_brandLookupParameters, 0);
  objc_storeStrong((id *)&self->_batchSpatialLookupParameters, 0);
  objc_storeStrong((id *)&self->_batchReverseGeocodingParameters, 0);
  objc_storeStrong((id *)&self->_batchPopularNearbySearchParameters, 0);
  objc_storeStrong((id *)&self->_batchMerchantLookupBrandParameters, 0);
  objc_storeStrong((id *)&self->_batchCategoryLookupParameters, 0);
  objc_storeStrong((id *)&self->_autocompleteParameters, 0);
  objc_storeStrong((id *)&self->_allGuidesLocationsViewParameters, 0);
  objc_storeStrong((id *)&self->_allCollectionsViewParameters, 0);
  objc_storeStrong((id *)&self->_airportEntityPlaceLookupParameters, 0);
  objc_storeStrong((id *)&self->_addressRecommendationParameters, 0);
  objc_storeStrong((id *)&self->_addressObjectGeocodingParameters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
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
  if (self->_reader && (_GEOPDPlaceRequestParametersIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDPlaceRequestParameters readAll:]((uint64_t)self, 0);
    if (self->_searchParameters)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_geocodingParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_canonicalLocationSearchParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_reverseGeocodingParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_placeLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_merchantLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_placeRefinementParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_siriSearchParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_locationDirectedSearchParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_autocompleteParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_browseCategorySuggestionParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_categorySearchParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_popularNearbySearchParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_searchZeroKeywordCategorySuggestionParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_searchFieldPlaceholderParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_batchPopularNearbySearchParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_vendorSpecificPlaceRefinementParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_nearbySearchParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_addressObjectGeocodingParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_searchZeroKeywordWithSearchResultsSuggestionParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_externalTransitLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_featureIdGeocodingParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_mapsIdentifierPlaceLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_batchReverseGeocodingParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_brandLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_wifiFingerprintParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_ipGeoLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_groundViewLabelParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_batchSpatialLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_transitVehiclePositionParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_placeCollectionLookupParameter)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_transitScheduleLookupParameter)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_batchCategoryLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_batchMerchantLookupBrandParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_childPlaceLookupByCategoryParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_collectionSuggestionParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_mapsSearchHomeParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_placeQuestionnaireLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_publisherViewParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_allCollectionsViewParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_airportEntityPlaceLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_territoryLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_transitNearbyScheduleLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_mapsHomeParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_allGuidesLocationsViewParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_guidesHomeParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_extendedGeoLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_queryUnderstandingParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_poiAtAddressLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_transitNearbyPaymentMethodLookupParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_placecardEnrichmentParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_offlineRegionNameParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_searchCapabilitiesParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_refreshIdLookUpParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_addressRecommendationParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_4423;
      else
        v6 = (int *)&readAll__nonRecursiveTag_4424;
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDPlaceRequestParametersCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)placeRefinementParameters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRequestParameters _readPlaceRefinementParameters]((uint64_t)a1);
    a1 = (id *)v1[37];
  }
  return a1;
}

- (void)_readPlaceRefinementParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(_BYTE *)(a1 + 480) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceRefinementParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (id)vendorSpecificPlaceRefinementParameters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRequestParameters _readVendorSpecificPlaceRefinementParameters]((uint64_t)a1);
    a1 = (id *)v1[56];
  }
  return a1;
}

- (id)territoryLookupParameters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRequestParameters _readTerritoryLookupParameters]((uint64_t)a1);
    a1 = (id *)v1[51];
  }
  return a1;
}

- (id)searchZeroKeywordCategorySuggestionParameters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRequestParameters _readSearchZeroKeywordCategorySuggestionParameters]((uint64_t)a1);
    a1 = (id *)v1[48];
  }
  return a1;
}

- (id)placeLookupParameters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRequestParameters _readPlaceLookupParameters]((uint64_t)a1);
    a1 = (id *)v1[35];
  }
  return a1;
}

- (id)mapsIdentifierPlaceLookupParameters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRequestParameters _readMapsIdentifierPlaceLookupParameters]((uint64_t)a1);
    a1 = (id *)v1[29];
  }
  return a1;
}

- (id)locationDirectedSearchParameters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRequestParameters _readLocationDirectedSearchParameters]((uint64_t)a1);
    a1 = (id *)v1[27];
  }
  return a1;
}

- (id)ipGeoLookupParameters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRequestParameters _readIpGeoLookupParameters]((uint64_t)a1);
    a1 = (id *)v1[26];
  }
  return a1;
}

- (id)geocodingParameters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRequestParameters _readGeocodingParameters]((uint64_t)a1);
    a1 = (id *)v1[23];
  }
  return a1;
}

- (id)featureIdGeocodingParameters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRequestParameters _readFeatureIdGeocodingParameters]((uint64_t)a1);
    a1 = (id *)v1[22];
  }
  return a1;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceRequestParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)categorySearchParameters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRequestParameters _readCategorySearchParameters]((uint64_t)a1);
    a1 = (id *)v1[17];
  }
  return a1;
}

- (id)canonicalLocationSearchParameters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRequestParameters _readCanonicalLocationSearchParameters]((uint64_t)a1);
    a1 = (id *)v1[16];
  }
  return a1;
}

- (id)brandLookupParameters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceRequestParameters _readBrandLookupParameters]((uint64_t)a1);
    a1 = (id *)v1[14];
  }
  return a1;
}

- (void)_readVendorSpecificPlaceRefinementParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(_BYTE *)(a1 + 482) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVendorSpecificPlaceRefinementParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (void)_readTerritoryLookupParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(_BYTE *)(a1 + 482) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTerritoryLookupParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (void)_readSiriSearchParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 482) & 1) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSiriSearchParameters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)_readSearchZeroKeywordCategorySuggestionParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(_BYTE *)(a1 + 481) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchZeroKeywordCategorySuggestionParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (void)_readSearchCapabilitiesParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 481) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchCapabilitiesParameters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)_readQueryUnderstandingParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 481) & 1) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryUnderstandingParameters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)_readPublisherViewParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 480) & 0x80) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPublisherViewParameters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)_readPopularNearbySearchParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 480) & 0x40) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPopularNearbySearchParameters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)_readPoiAtAddressLookupParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 480) & 0x20) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPoiAtAddressLookupParameters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)_readPlacecardEnrichmentParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 480) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlacecardEnrichmentParameters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)_readPlaceQuestionnaireLookupParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 480) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceQuestionnaireLookupParameters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)_readPlaceLookupParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(_BYTE *)(a1 + 480) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceLookupParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (void)_readPlaceCollectionLookupParameter
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 480) & 1) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceCollectionLookupParameter_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)_readOfflineRegionNameParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 479) & 0x80) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOfflineRegionNameParameters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)_readNearbySearchParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 479) & 0x40) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNearbySearchParameters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)_readMapsSearchHomeParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 479) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsSearchHomeParameters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)_readMapsHomeParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 479) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsHomeParameters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)_readLocationDirectedSearchParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(_BYTE *)(a1 + 479) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocationDirectedSearchParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (void)_readIpGeoLookupParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(_BYTE *)(a1 + 479) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIpGeoLookupParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (void)_readGuidesHomeParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 478) & 0x80) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGuidesHomeParameters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)_readGeocodingParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(_BYTE *)(a1 + 478) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGeocodingParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (void)_readFeatureIdGeocodingParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(_BYTE *)(a1 + 478) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeatureIdGeocodingParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (void)_readExtendedGeoLookupParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 478) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExtendedGeoLookupParameters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)_readCollectionSuggestionParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 478) & 2) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCollectionSuggestionParameters_tags_4153);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)_readCategorySearchParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(_BYTE *)(a1 + 477) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategorySearchParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (void)_readCanonicalLocationSearchParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(_BYTE *)(a1 + 477) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCanonicalLocationSearchParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (void)_readBrowseCategorySuggestionParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 477) & 0x20) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBrowseCategorySuggestionParameters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)_readBrandLookupParameters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
    if ((*(_BYTE *)(a1 + 477) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBrandLookupParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  }
}

- (void)_readBatchSpatialLookupParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 477) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBatchSpatialLookupParameters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)_readBatchPopularNearbySearchParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 477) & 2) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBatchPopularNearbySearchParameters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)_readAllGuidesLocationsViewParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 476) & 0x20) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAllGuidesLocationsViewParameters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)_readAllCollectionsViewParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 476) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAllCollectionsViewParameters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)_readAddressObjectGeocodingParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 476) & 2) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressObjectGeocodingParameters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
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
  void *v16;
  void *v17;
  const __CFString *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  const __CFString *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  const __CFString *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  const __CFString *v63;
  id v64;
  id v65;
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
  id v76;
  id v77;
  void *v78;
  void *v79;
  const __CFString *v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  const __CFString *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  const __CFString *v90;
  id v91;
  id v92;
  void *v93;
  void *v94;
  const __CFString *v95;
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
  void *v110;
  void *v111;
  const __CFString *v112;
  id v113;
  void *v114;
  void *v115;
  void *v116;
  const __CFString *v117;
  id v118;
  void *v119;
  void *v120;
  void *v121;
  const __CFString *v122;
  id v123;
  void *v124;
  void *v125;
  void *v126;
  const __CFString *v127;
  id v128;
  void *v129;
  void *v130;
  void *v131;
  const __CFString *v132;
  id v133;
  void *v134;
  void *v135;
  void *v136;
  const __CFString *v137;
  id v138;
  void *v139;
  void *v140;
  void *v141;
  const __CFString *v142;
  id v143;
  void *v144;
  void *v145;
  void *v146;
  const __CFString *v147;
  id v148;
  id v149;
  void *v150;
  void *v151;
  const __CFString *v152;
  id v153;
  void *v154;
  id v155;
  id v156;
  void *v157;
  void *v158;
  const __CFString *v159;
  id v160;
  id v161;
  void *v162;
  void *v163;
  const __CFString *v164;
  id v165;
  void *v166;
  id v167;
  id v168;
  void *v169;
  void *v170;
  const __CFString *v171;
  id v172;
  void *v173;
  id v174;
  id v175;
  void *v176;
  void *v177;
  const __CFString *v178;
  id v179;
  void *v180;
  id v181;
  id v182;
  void *v183;
  void *v184;
  const __CFString *v185;
  id v186;
  void *v187;
  id v188;
  id v189;
  void *v190;
  void *v191;
  const __CFString *v192;
  id v193;
  id v194;
  void *v195;
  void *v196;
  const __CFString *v197;
  id v198;
  id v199;
  void *v200;
  void *v201;
  const __CFString *v202;
  id v203;
  id v204;
  void *v205;
  void *v206;
  const __CFString *v207;
  id v208;
  id v209;
  void *v210;
  void *v211;
  const __CFString *v212;
  id v213;
  id v214;
  void *v215;
  void *v216;
  const __CFString *v217;
  id v218;
  void *v219;
  id v220;
  id v221;
  void *v222;
  void *v223;
  const __CFString *v224;
  id v225;
  void *v226;
  void *v227;
  void *v228;
  const __CFString *v229;
  id v230;
  void *v231;
  void *v232;
  void *v233;
  const __CFString *v234;
  id v235;
  id v236;
  void *v237;
  void *v238;
  const __CFString *v239;
  id v240;
  id v241;
  void *v242;
  void *v243;
  const __CFString *v244;
  id v245;
  id v246;
  void *v247;
  void *v248;
  const __CFString *v249;
  id v250;
  id v251;
  void *v252;
  void *v253;
  const __CFString *v254;
  id v255;
  id v256;
  void *v257;
  void *v258;
  const __CFString *v259;
  id v260;
  id v261;
  void *v262;
  void *v263;
  const __CFString *v264;
  id v265;
  void *v266;
  void *v267;
  void *v268;
  const __CFString *v269;
  id v270;
  id v271;
  void *v272;
  void *v273;
  const __CFString *v274;
  id v275;
  id v276;
  void *v277;
  void *v278;
  const __CFString *v279;
  id v280;
  id v281;
  void *v282;
  void *v283;
  const __CFString *v284;
  id v285;
  id v286;
  void *v287;
  void *v288;
  const __CFString *v289;
  id v290;
  void *v291;
  id v292;
  id v293;
  void *v294;
  void *v295;
  const __CFString *v296;
  id v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  id v302;
  id v303;
  id v304;
  _QWORD v306[4];
  id v307;

  if (!a1)
    return 0;
  -[GEOPDPlaceRequestParameters readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceRequestParameters searchParameters]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("searchParameters");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("search_parameters");
    }
    v9 = v7;

    objc_msgSend(v4, "setObject:forKey:", v9, v8);
  }

  -[GEOPDPlaceRequestParameters geocodingParameters]((id *)a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v10, "jsonRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("geocodingParameters");
    }
    else
    {
      objc_msgSend(v10, "dictionaryRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("geocoding_parameters");
    }
    v14 = v12;

    objc_msgSend(v4, "setObject:forKey:", v14, v13);
  }

  -[GEOPDPlaceRequestParameters canonicalLocationSearchParameters]((id *)a1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v15, "jsonRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("canonicalLocationSearchParameters");
    }
    else
    {
      objc_msgSend(v15, "dictionaryRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("canonical_location_search_parameters");
    }
    v19 = v17;

    objc_msgSend(v4, "setObject:forKey:", v19, v18);
  }

  -[GEOPDPlaceRequestParameters reverseGeocodingParameters]((id *)a1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v20, "jsonRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("reverseGeocodingParameters");
    }
    else
    {
      objc_msgSend(v20, "dictionaryRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("reverse_geocoding_parameters");
    }
    v24 = v22;

    objc_msgSend(v4, "setObject:forKey:", v24, v23);
  }

  -[GEOPDPlaceRequestParameters placeLookupParameters]((id *)a1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v25, "jsonRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("placeLookupParameters");
    }
    else
    {
      objc_msgSend(v25, "dictionaryRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("place_lookup_parameters");
    }
    v29 = v27;

    objc_msgSend(v4, "setObject:forKey:", v29, v28);
  }

  -[GEOPDPlaceRequestParameters merchantLookupParameters]((id *)a1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v30, "jsonRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("merchantLookupParameters");
    }
    else
    {
      objc_msgSend(v30, "dictionaryRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("merchant_lookup_parameters");
    }
    v34 = v32;

    objc_msgSend(v4, "setObject:forKey:", v34, v33);
  }

  -[GEOPDPlaceRequestParameters placeRefinementParameters]((id *)a1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v35, "jsonRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("placeRefinementParameters");
    }
    else
    {
      objc_msgSend(v35, "dictionaryRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("place_refinement_parameters");
    }
    v39 = v37;

    objc_msgSend(v4, "setObject:forKey:", v39, v38);
  }

  -[GEOPDPlaceRequestParameters _readSiriSearchParameters](a1);
  v40 = *(id *)(a1 + 400);
  v41 = v40;
  if (v40)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v40, "jsonRepresentation");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = CFSTR("siriSearchParameters");
    }
    else
    {
      objc_msgSend(v40, "dictionaryRepresentation");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = CFSTR("siri_search_parameters");
    }
    v44 = v42;

    objc_msgSend(v4, "setObject:forKey:", v44, v43);
  }

  -[GEOPDPlaceRequestParameters locationDirectedSearchParameters]((id *)a1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v45;
  if (v45)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v45, "jsonRepresentation");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = CFSTR("locationDirectedSearchParameters");
    }
    else
    {
      objc_msgSend(v45, "dictionaryRepresentation");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = CFSTR("location_directed_search_parameters");
    }
    v49 = v47;

    objc_msgSend(v4, "setObject:forKey:", v49, v48);
  }

  -[GEOPDPlaceRequestParameters autocompleteParameters]((id *)a1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if (v50)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v50, "jsonRepresentation");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = CFSTR("autocompleteParameters");
    }
    else
    {
      objc_msgSend(v50, "dictionaryRepresentation");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = CFSTR("autocomplete_parameters");
    }
    v54 = v52;

    objc_msgSend(v4, "setObject:forKey:", v54, v53);
  }

  -[GEOPDPlaceRequestParameters _readBrowseCategorySuggestionParameters](a1);
  v55 = *(id *)(a1 + 120);
  v56 = v55;
  if (v55)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v55, "jsonRepresentation");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = CFSTR("browseCategorySuggestionParameters");
    }
    else
    {
      objc_msgSend(v55, "dictionaryRepresentation");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = CFSTR("browse_category_suggestion_parameters");
    }
    v59 = v57;

    objc_msgSend(v4, "setObject:forKey:", v59, v58);
  }

  -[GEOPDPlaceRequestParameters categorySearchParameters]((id *)a1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v60;
  if (v60)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v60, "jsonRepresentation");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = CFSTR("categorySearchParameters");
    }
    else
    {
      objc_msgSend(v60, "dictionaryRepresentation");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = CFSTR("category_search_parameters");
    }
    v64 = v62;

    objc_msgSend(v4, "setObject:forKey:", v64, v63);
  }

  -[GEOPDPlaceRequestParameters _readPopularNearbySearchParameters](a1);
  v65 = *(id *)(a1 + 320);
  v66 = v65;
  if (v65)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v65, "jsonRepresentation");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = CFSTR("popularNearbySearchParameters");
    }
    else
    {
      objc_msgSend(v65, "dictionaryRepresentation");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = CFSTR("popular_nearby_search_parameters");
    }
    v69 = v67;

    objc_msgSend(v4, "setObject:forKey:", v69, v68);
  }

  -[GEOPDPlaceRequestParameters searchZeroKeywordCategorySuggestionParameters]((id *)a1);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v70;
  if (v70)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v70, "jsonRepresentation");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = CFSTR("searchZeroKeywordCategorySuggestionParameters");
    }
    else
    {
      objc_msgSend(v70, "dictionaryRepresentation");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = CFSTR("search_zero_keyword_category_suggestion_parameters");
    }
    v74 = v72;

    objc_msgSend(v4, "setObject:forKey:", v74, v73);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 481) & 0x10) == 0)
  {
    v75 = *(void **)(a1 + 8);
    if (v75)
    {
      v76 = v75;
      objc_sync_enter(v76);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchFieldPlaceholderParameters_tags);
      objc_sync_exit(v76);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  v77 = *(id *)(a1 + 368);
  v78 = v77;
  if (v77)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v77, "jsonRepresentation");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = CFSTR("searchFieldPlaceholderParameters");
    }
    else
    {
      objc_msgSend(v77, "dictionaryRepresentation");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = CFSTR("search_field_placeholder_parameters");
    }
    v81 = v79;

    objc_msgSend(v4, "setObject:forKey:", v81, v80);
  }

  -[GEOPDPlaceRequestParameters _readBatchPopularNearbySearchParameters](a1);
  v82 = *(id *)(a1 + 88);
  v83 = v82;
  if (v82)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v82, "jsonRepresentation");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = CFSTR("batchPopularNearbySearchParameters");
    }
    else
    {
      objc_msgSend(v82, "dictionaryRepresentation");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = CFSTR("batch_popular_nearby_search_parameters");
    }
    v86 = v84;

    objc_msgSend(v4, "setObject:forKey:", v86, v85);
  }

  -[GEOPDPlaceRequestParameters vendorSpecificPlaceRefinementParameters]((id *)a1);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v87;
  if (v87)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v87, "jsonRepresentation");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = CFSTR("vendorSpecificPlaceRefinementParameters");
    }
    else
    {
      objc_msgSend(v87, "dictionaryRepresentation");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = CFSTR("vendor_specific_place_refinement_parameters");
    }
    v91 = v89;

    objc_msgSend(v4, "setObject:forKey:", v91, v90);
  }

  -[GEOPDPlaceRequestParameters _readNearbySearchParameters](a1);
  v92 = *(id *)(a1 + 256);
  v93 = v92;
  if (v92)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v92, "jsonRepresentation");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = CFSTR("nearbySearchParameters");
    }
    else
    {
      objc_msgSend(v92, "dictionaryRepresentation");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = CFSTR("nearby_search_parameters");
    }
    v96 = v94;

    objc_msgSend(v4, "setObject:forKey:", v96, v95);
  }

  -[GEOPDPlaceRequestParameters _readAddressObjectGeocodingParameters](a1);
  v97 = *(id *)(a1 + 24);
  v98 = v97;
  if (v97)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v97, "jsonRepresentation");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = CFSTR("addressObjectGeocodingParameters");
    }
    else
    {
      objc_msgSend(v97, "dictionaryRepresentation");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = CFSTR("address_object_geocoding_parameters");
    }
    v101 = v99;

    objc_msgSend(v4, "setObject:forKey:", v101, v100);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 481) & 0x80) == 0)
  {
    v102 = *(void **)(a1 + 8);
    if (v102)
    {
      v103 = v102;
      objc_sync_enter(v103);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchZeroKeywordWithSearchResultsSuggestionParameters_tags);
      objc_sync_exit(v103);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  v104 = *(id *)(a1 + 392);
  v105 = v104;
  if (v104)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v104, "jsonRepresentation");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = CFSTR("searchZeroKeywordWithSearchResultsSuggestionParameters");
    }
    else
    {
      objc_msgSend(v104, "dictionaryRepresentation");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = CFSTR("search_zero_keyword_with_search_results_suggestion_parameters");
    }
    v108 = v106;

    objc_msgSend(v4, "setObject:forKey:", v108, v107);
  }

  -[GEOPDPlaceRequestParameters externalTransitLookupParameters]((id *)a1);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v109;
  if (v109)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v109, "jsonRepresentation");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = CFSTR("externalTransitLookupParameters");
    }
    else
    {
      objc_msgSend(v109, "dictionaryRepresentation");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = CFSTR("external_transit_lookup_parameters");
    }
    v113 = v111;

    objc_msgSend(v4, "setObject:forKey:", v113, v112);
  }

  -[GEOPDPlaceRequestParameters featureIdGeocodingParameters]((id *)a1);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v114;
  if (v114)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v114, "jsonRepresentation");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = CFSTR("featureIdGeocodingParameters");
    }
    else
    {
      objc_msgSend(v114, "dictionaryRepresentation");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = CFSTR("feature_id_geocoding_parameters");
    }
    v118 = v116;

    objc_msgSend(v4, "setObject:forKey:", v118, v117);
  }

  -[GEOPDPlaceRequestParameters mapsIdentifierPlaceLookupParameters]((id *)a1);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = v119;
  if (v119)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v119, "jsonRepresentation");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = CFSTR("mapsIdentifierPlaceLookupParameters");
    }
    else
    {
      objc_msgSend(v119, "dictionaryRepresentation");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = CFSTR("maps_identifier_place_lookup_parameters");
    }
    v123 = v121;

    objc_msgSend(v4, "setObject:forKey:", v123, v122);
  }

  -[GEOPDPlaceRequestParameters batchReverseGeocodingParameters]((id *)a1);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = v124;
  if (v124)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v124, "jsonRepresentation");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = CFSTR("batchReverseGeocodingParameters");
    }
    else
    {
      objc_msgSend(v124, "dictionaryRepresentation");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = CFSTR("batch_reverse_geocoding_parameters");
    }
    v128 = v126;

    objc_msgSend(v4, "setObject:forKey:", v128, v127);
  }

  -[GEOPDPlaceRequestParameters brandLookupParameters]((id *)a1);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = v129;
  if (v129)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v129, "jsonRepresentation");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = CFSTR("brandLookupParameters");
    }
    else
    {
      objc_msgSend(v129, "dictionaryRepresentation");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = CFSTR("brand_lookup_parameters");
    }
    v133 = v131;

    objc_msgSend(v4, "setObject:forKey:", v133, v132);
  }

  -[GEOPDPlaceRequestParameters wifiFingerprintParameters]((id *)a1);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = v134;
  if (v134)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v134, "jsonRepresentation");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = CFSTR("wifiFingerprintParameters");
    }
    else
    {
      objc_msgSend(v134, "dictionaryRepresentation");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = CFSTR("wifi_fingerprint_parameters");
    }
    v138 = v136;

    objc_msgSend(v4, "setObject:forKey:", v138, v137);
  }

  -[GEOPDPlaceRequestParameters ipGeoLookupParameters]((id *)a1);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = v139;
  if (v139)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v139, "jsonRepresentation");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v142 = CFSTR("ipGeoLookupParameters");
    }
    else
    {
      objc_msgSend(v139, "dictionaryRepresentation");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v142 = CFSTR("ip_geo_lookup_parameters");
    }
    v143 = v141;

    objc_msgSend(v4, "setObject:forKey:", v143, v142);
  }

  -[GEOPDPlaceRequestParameters groundViewLabelParameters]((id *)a1);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = v144;
  if (v144)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v144, "jsonRepresentation");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      v147 = CFSTR("groundViewLabelParameters");
    }
    else
    {
      objc_msgSend(v144, "dictionaryRepresentation");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      v147 = CFSTR("ground_view_label_parameters");
    }
    v148 = v146;

    objc_msgSend(v4, "setObject:forKey:", v148, v147);
  }

  -[GEOPDPlaceRequestParameters _readBatchSpatialLookupParameters](a1);
  v149 = *(id *)(a1 + 104);
  v150 = v149;
  if (v149)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v149, "jsonRepresentation");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      v152 = CFSTR("batchSpatialLookupParameters");
    }
    else
    {
      objc_msgSend(v149, "dictionaryRepresentation");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      v152 = CFSTR("batch_spatial_lookup_parameters");
    }
    v153 = v151;

    objc_msgSend(v4, "setObject:forKey:", v153, v152);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 482) & 0x20) == 0)
  {
    v154 = *(void **)(a1 + 8);
    if (v154)
    {
      v155 = v154;
      objc_sync_enter(v155);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitVehiclePositionParameters_tags);
      objc_sync_exit(v155);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  v156 = *(id *)(a1 + 440);
  v157 = v156;
  if (v156)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v156, "jsonRepresentation");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      v159 = CFSTR("transitVehiclePositionParameters");
    }
    else
    {
      objc_msgSend(v156, "dictionaryRepresentation");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      v159 = CFSTR("transit_vehicle_position_parameters");
    }
    v160 = v158;

    objc_msgSend(v4, "setObject:forKey:", v160, v159);
  }

  -[GEOPDPlaceRequestParameters _readPlaceCollectionLookupParameter](a1);
  v161 = *(id *)(a1 + 272);
  v162 = v161;
  if (v161)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v161, "jsonRepresentation");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      v164 = CFSTR("placeCollectionLookupParameter");
    }
    else
    {
      objc_msgSend(v161, "dictionaryRepresentation");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      v164 = CFSTR("place_collection_lookup_parameter");
    }
    v165 = v163;

    objc_msgSend(v4, "setObject:forKey:", v165, v164);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 482) & 0x10) == 0)
  {
    v166 = *(void **)(a1 + 8);
    if (v166)
    {
      v167 = v166;
      objc_sync_enter(v167);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitScheduleLookupParameter_tags);
      objc_sync_exit(v167);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  v168 = *(id *)(a1 + 432);
  v169 = v168;
  if (v168)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v168, "jsonRepresentation");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      v171 = CFSTR("transitScheduleLookupParameter");
    }
    else
    {
      objc_msgSend(v168, "dictionaryRepresentation");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      v171 = CFSTR("transit_schedule_lookup_parameter");
    }
    v172 = v170;

    objc_msgSend(v4, "setObject:forKey:", v172, v171);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 476) & 0x80) == 0)
  {
    v173 = *(void **)(a1 + 8);
    if (v173)
    {
      v174 = v173;
      objc_sync_enter(v174);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBatchCategoryLookupParameters_tags);
      objc_sync_exit(v174);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  v175 = *(id *)(a1 + 72);
  v176 = v175;
  if (v175)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v175, "jsonRepresentation");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      v178 = CFSTR("batchCategoryLookupParameters");
    }
    else
    {
      objc_msgSend(v175, "dictionaryRepresentation");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      v178 = CFSTR("batch_category_lookup_parameters");
    }
    v179 = v177;

    objc_msgSend(v4, "setObject:forKey:", v179, v178);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 477) & 1) == 0)
  {
    v180 = *(void **)(a1 + 8);
    if (v180)
    {
      v181 = v180;
      objc_sync_enter(v181);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBatchMerchantLookupBrandParameters_tags);
      objc_sync_exit(v181);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  v182 = *(id *)(a1 + 80);
  v183 = v182;
  if (v182)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v182, "jsonRepresentation");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      v185 = CFSTR("batchMerchantLookupBrandParameters");
    }
    else
    {
      objc_msgSend(v182, "dictionaryRepresentation");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      v185 = CFSTR("batch_merchant_lookup_brand_parameters");
    }
    v186 = v184;

    objc_msgSend(v4, "setObject:forKey:", v186, v185);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 478) & 1) == 0)
  {
    v187 = *(void **)(a1 + 8);
    if (v187)
    {
      v188 = v187;
      objc_sync_enter(v188);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readChildPlaceLookupByCategoryParameters_tags);
      objc_sync_exit(v188);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  v189 = *(id *)(a1 + 144);
  v190 = v189;
  if (v189)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v189, "jsonRepresentation");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      v192 = CFSTR("childPlaceLookupByCategoryParameters");
    }
    else
    {
      objc_msgSend(v189, "dictionaryRepresentation");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      v192 = CFSTR("child_place_lookup_by_category_parameters");
    }
    v193 = v191;

    objc_msgSend(v4, "setObject:forKey:", v193, v192);
  }

  -[GEOPDPlaceRequestParameters _readCollectionSuggestionParameters](a1);
  v194 = *(id *)(a1 + 152);
  v195 = v194;
  if (v194)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v194, "jsonRepresentation");
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      v197 = CFSTR("collectionSuggestionParameters");
    }
    else
    {
      objc_msgSend(v194, "dictionaryRepresentation");
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      v197 = CFSTR("collection_suggestion_parameters");
    }
    v198 = v196;

    objc_msgSend(v4, "setObject:forKey:", v198, v197);
  }

  -[GEOPDPlaceRequestParameters _readMapsSearchHomeParameters](a1);
  v199 = *(id *)(a1 + 240);
  v200 = v199;
  if (v199)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v199, "jsonRepresentation");
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      v202 = CFSTR("mapsSearchHomeParameters");
    }
    else
    {
      objc_msgSend(v199, "dictionaryRepresentation");
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      v202 = CFSTR("maps_search_home_parameters");
    }
    v203 = v201;

    objc_msgSend(v4, "setObject:forKey:", v203, v202);
  }

  -[GEOPDPlaceRequestParameters _readPlaceQuestionnaireLookupParameters](a1);
  v204 = *(id *)(a1 + 288);
  v205 = v204;
  if (v204)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v204, "jsonRepresentation");
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      v207 = CFSTR("placeQuestionnaireLookupParameters");
    }
    else
    {
      objc_msgSend(v204, "dictionaryRepresentation");
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      v207 = CFSTR("place_questionnaire_lookup_parameters");
    }
    v208 = v206;

    objc_msgSend(v4, "setObject:forKey:", v208, v207);
  }

  -[GEOPDPlaceRequestParameters _readPublisherViewParameters](a1);
  v209 = *(id *)(a1 + 328);
  v210 = v209;
  if (v209)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v209, "jsonRepresentation");
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      v212 = CFSTR("publisherViewParameters");
    }
    else
    {
      objc_msgSend(v209, "dictionaryRepresentation");
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      v212 = CFSTR("publisher_view_parameters");
    }
    v213 = v211;

    objc_msgSend(v4, "setObject:forKey:", v213, v212);
  }

  -[GEOPDPlaceRequestParameters _readAllCollectionsViewParameters](a1);
  v214 = *(id *)(a1 + 48);
  v215 = v214;
  if (v214)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v214, "jsonRepresentation");
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      v217 = CFSTR("allCollectionsViewParameters");
    }
    else
    {
      objc_msgSend(v214, "dictionaryRepresentation");
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      v217 = CFSTR("all_collections_view_parameters");
    }
    v218 = v216;

    objc_msgSend(v4, "setObject:forKey:", v218, v217);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 476) & 8) == 0)
  {
    v219 = *(void **)(a1 + 8);
    if (v219)
    {
      v220 = v219;
      objc_sync_enter(v220);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAirportEntityPlaceLookupParameters_tags);
      objc_sync_exit(v220);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  v221 = *(id *)(a1 + 40);
  v222 = v221;
  if (v221)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v221, "jsonRepresentation");
      v223 = (void *)objc_claimAutoreleasedReturnValue();
      v224 = CFSTR("airportEntityPlaceLookupParameters");
    }
    else
    {
      objc_msgSend(v221, "dictionaryRepresentation");
      v223 = (void *)objc_claimAutoreleasedReturnValue();
      v224 = CFSTR("airport_entity_place_lookup_parameters");
    }
    v225 = v223;

    objc_msgSend(v4, "setObject:forKey:", v225, v224);
  }

  -[GEOPDPlaceRequestParameters territoryLookupParameters]((id *)a1);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = v226;
  if (v226)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v226, "jsonRepresentation");
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      v229 = CFSTR("territoryLookupParameters");
    }
    else
    {
      objc_msgSend(v226, "dictionaryRepresentation");
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      v229 = CFSTR("territory_lookup_parameters");
    }
    v230 = v228;

    objc_msgSend(v4, "setObject:forKey:", v230, v229);
  }

  -[GEOPDPlaceRequestParameters transitNearbyScheduleLookupParameters]((id *)a1);
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  v232 = v231;
  if (v231)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v231, "jsonRepresentation");
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      v234 = CFSTR("transitNearbyScheduleLookupParameters");
    }
    else
    {
      objc_msgSend(v231, "dictionaryRepresentation");
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      v234 = CFSTR("transit_nearby_schedule_lookup_parameters");
    }
    v235 = v233;

    objc_msgSend(v4, "setObject:forKey:", v235, v234);
  }

  -[GEOPDPlaceRequestParameters _readMapsHomeParameters](a1);
  v236 = *(id *)(a1 + 224);
  v237 = v236;
  if (v236)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v236, "jsonRepresentation");
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      v239 = CFSTR("mapsHomeParameters");
    }
    else
    {
      objc_msgSend(v236, "dictionaryRepresentation");
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      v239 = CFSTR("maps_home_parameters");
    }
    v240 = v238;

    objc_msgSend(v4, "setObject:forKey:", v240, v239);
  }

  -[GEOPDPlaceRequestParameters _readAllGuidesLocationsViewParameters](a1);
  v241 = *(id *)(a1 + 56);
  v242 = v241;
  if (v241)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v241, "jsonRepresentation");
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      v244 = CFSTR("allGuidesLocationsViewParameters");
    }
    else
    {
      objc_msgSend(v241, "dictionaryRepresentation");
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      v244 = CFSTR("all_guides_locations_view_parameters");
    }
    v245 = v243;

    objc_msgSend(v4, "setObject:forKey:", v245, v244);
  }

  -[GEOPDPlaceRequestParameters _readGuidesHomeParameters](a1);
  v246 = *(id *)(a1 + 200);
  v247 = v246;
  if (v246)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v246, "jsonRepresentation");
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      v249 = CFSTR("guidesHomeParameters");
    }
    else
    {
      objc_msgSend(v246, "dictionaryRepresentation");
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      v249 = CFSTR("guides_home_parameters");
    }
    v250 = v248;

    objc_msgSend(v4, "setObject:forKey:", v250, v249);
  }

  -[GEOPDPlaceRequestParameters _readExtendedGeoLookupParameters](a1);
  v251 = *(id *)(a1 + 160);
  v252 = v251;
  if (v251)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v251, "jsonRepresentation");
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      v254 = CFSTR("extendedGeoLookupParameters");
    }
    else
    {
      objc_msgSend(v251, "dictionaryRepresentation");
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      v254 = CFSTR("extended_geo_lookup_parameters");
    }
    v255 = v253;

    objc_msgSend(v4, "setObject:forKey:", v255, v254);
  }

  -[GEOPDPlaceRequestParameters _readQueryUnderstandingParameters](a1);
  v256 = *(id *)(a1 + 336);
  v257 = v256;
  if (v256)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v256, "jsonRepresentation");
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      v259 = CFSTR("queryUnderstandingParameters");
    }
    else
    {
      objc_msgSend(v256, "dictionaryRepresentation");
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      v259 = CFSTR("query_understanding_parameters");
    }
    v260 = v258;

    objc_msgSend(v4, "setObject:forKey:", v260, v259);
  }

  -[GEOPDPlaceRequestParameters _readPoiAtAddressLookupParameters](a1);
  v261 = *(id *)(a1 + 312);
  v262 = v261;
  if (v261)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v261, "jsonRepresentation");
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      v264 = CFSTR("poiAtAddressLookupParameters");
    }
    else
    {
      objc_msgSend(v261, "dictionaryRepresentation");
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      v264 = CFSTR("poi_at_address_lookup_parameters");
    }
    v265 = v263;

    objc_msgSend(v4, "setObject:forKey:", v265, v264);
  }

  -[GEOPDPlaceRequestParameters transitNearbyPaymentMethodLookupParameters]((id *)a1);
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  v267 = v266;
  if (v266)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v266, "jsonRepresentation");
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      v269 = CFSTR("transitNearbyPaymentMethodLookupParameters");
    }
    else
    {
      objc_msgSend(v266, "dictionaryRepresentation");
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      v269 = CFSTR("transit_nearby_payment_method_lookup_parameters");
    }
    v270 = v268;

    objc_msgSend(v4, "setObject:forKey:", v270, v269);
  }

  -[GEOPDPlaceRequestParameters _readPlacecardEnrichmentParameters](a1);
  v271 = *(id *)(a1 + 304);
  v272 = v271;
  if (v271)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v271, "jsonRepresentation");
      v273 = (void *)objc_claimAutoreleasedReturnValue();
      v274 = CFSTR("placecardEnrichmentParameters");
    }
    else
    {
      objc_msgSend(v271, "dictionaryRepresentation");
      v273 = (void *)objc_claimAutoreleasedReturnValue();
      v274 = CFSTR("placecard_enrichment_parameters");
    }
    v275 = v273;

    objc_msgSend(v4, "setObject:forKey:", v275, v274);
  }

  -[GEOPDPlaceRequestParameters _readOfflineRegionNameParameters](a1);
  v276 = *(id *)(a1 + 264);
  v277 = v276;
  if (v276)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v276, "jsonRepresentation");
      v278 = (void *)objc_claimAutoreleasedReturnValue();
      v279 = CFSTR("offlineRegionNameParameters");
    }
    else
    {
      objc_msgSend(v276, "dictionaryRepresentation");
      v278 = (void *)objc_claimAutoreleasedReturnValue();
      v279 = CFSTR("offline_region_name_parameters");
    }
    v280 = v278;

    objc_msgSend(v4, "setObject:forKey:", v280, v279);
  }

  -[GEOPDPlaceRequestParameters _readSearchCapabilitiesParameters](a1);
  v281 = *(id *)(a1 + 360);
  v282 = v281;
  if (v281)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v281, "jsonRepresentation");
      v283 = (void *)objc_claimAutoreleasedReturnValue();
      v284 = CFSTR("searchCapabilitiesParameters");
    }
    else
    {
      objc_msgSend(v281, "dictionaryRepresentation");
      v283 = (void *)objc_claimAutoreleasedReturnValue();
      v284 = CFSTR("search_capabilities_parameters");
    }
    v285 = v283;

    objc_msgSend(v4, "setObject:forKey:", v285, v284);
  }

  -[GEOPDPlaceRequestParameters _readRefreshIdLookUpParameters](a1);
  v286 = *(id *)(a1 + 344);
  v287 = v286;
  if (v286)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v286, "jsonRepresentation");
      v288 = (void *)objc_claimAutoreleasedReturnValue();
      v289 = CFSTR("refreshIdLookUpParameters");
    }
    else
    {
      objc_msgSend(v286, "dictionaryRepresentation");
      v288 = (void *)objc_claimAutoreleasedReturnValue();
      v289 = CFSTR("refresh_id_look_up_parameters");
    }
    v290 = v288;

    objc_msgSend(v4, "setObject:forKey:", v290, v289);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 476) & 4) == 0)
  {
    v291 = *(void **)(a1 + 8);
    if (v291)
    {
      v292 = v291;
      objc_sync_enter(v292);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressRecommendationParameters_tags);
      objc_sync_exit(v292);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
  v293 = *(id *)(a1 + 32);
  v294 = v293;
  if (v293)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v293, "jsonRepresentation");
      v295 = (void *)objc_claimAutoreleasedReturnValue();
      v296 = CFSTR("addressRecommendationParameters");
    }
    else
    {
      objc_msgSend(v293, "dictionaryRepresentation");
      v295 = (void *)objc_claimAutoreleasedReturnValue();
      v296 = CFSTR("address_recommendation_parameters");
    }
    v297 = v295;

    objc_msgSend(v4, "setObject:forKey:", v297, v296);
  }

  v298 = *(void **)(a1 + 16);
  if (v298)
  {
    objc_msgSend(v298, "dictionaryRepresentation");
    v299 = (void *)objc_claimAutoreleasedReturnValue();
    v300 = v299;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v299, "count"));
      v301 = (void *)objc_claimAutoreleasedReturnValue();
      v306[0] = MEMORY[0x1E0C809B0];
      v306[1] = 3221225472;
      v306[2] = __57__GEOPDPlaceRequestParameters__dictionaryRepresentation___block_invoke;
      v306[3] = &unk_1E1C00600;
      v302 = v301;
      v307 = v302;
      objc_msgSend(v300, "enumerateKeysAndObjectsUsingBlock:", v306);
      v303 = v302;

      v300 = v303;
    }
    objc_msgSend(v4, "setObject:forKey:", v300, CFSTR("Unknown Fields"));

  }
  v304 = v4;

  return v304;
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    -[GEOPDPlaceRequestParameters _readAddressObjectGeocodingParameters](result);
    v4 = *(_QWORD *)(v3 + 24);
    if (v4)
    {
      -[GEOPDAddressObjectGeocodingParameters _readViewportInfo](*(_QWORD *)(v3 + 24));
      if ((objc_msgSend(*(id *)(v4 + 32), "hasGreenTeaWithValue:", a2) & 1) != 0)
        return 1;
    }
    -[GEOPDPlaceRequestParameters _readAllCollectionsViewParameters](v3);
    v5 = *(_QWORD *)(v3 + 48);
    if (v5)
    {
      -[GEOPDAllCollectionsViewParameters _readPublisherSuggestionParameters](*(_QWORD *)(v3 + 48));
      v6 = *(_QWORD *)(v5 + 24);
      if (v6)
      {
        if ((objc_msgSend(*(id *)(v6 + 24), "hasGreenTeaWithValue:", a2) & 1) != 0)
          return 1;
      }
      -[GEOPDAllCollectionsViewParameters _readResultFilter](v5);
      if (-[GEOPDAllCollectionsViewResultFilter hasGreenTeaWithValue:](*(_QWORD *)(v5 + 32), a2))
        return 1;
      -[GEOPDAllCollectionsViewParameters _readViewportInfo](v5);
      if ((objc_msgSend(*(id *)(v5 + 40), "hasGreenTeaWithValue:", a2) & 1) != 0)
        return 1;
    }
    -[GEOPDPlaceRequestParameters _readAllGuidesLocationsViewParameters](v3);
    v7 = *(_QWORD *)(v3 + 56);
    if (v7)
    {
      if ((objc_msgSend(*(id *)(v7 + 16), "hasGreenTeaWithValue:", a2) & 1) != 0)
        return 1;
    }
    -[GEOPDPlaceRequestParameters _readAutocompleteParameters](v3);
    if ((objc_msgSend(*(id *)(v3 + 64), "hasGreenTeaWithValue:", a2) & 1) != 0)
      return 1;
    -[GEOPDPlaceRequestParameters _readBatchPopularNearbySearchParameters](v3);
    v8 = *(_QWORD *)(v3 + 88);
    if (v8)
    {
      -[GEOPDBatchPopularNearbySearchParameters _readViewportInfo](*(_QWORD *)(v3 + 88));
      if ((objc_msgSend(*(id *)(v8 + 40), "hasGreenTeaWithValue:", a2) & 1) != 0)
        return 1;
    }
    -[GEOPDPlaceRequestParameters _readBatchReverseGeocodingParameters](v3);
    v9 = *(_QWORD *)(v3 + 96);
    if (v9)
    {
      -[GEOPDBatchReverseGeocodingParameters _readAssetLocations](*(_QWORD *)(v3 + 96));
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v10 = *(id *)(v9 + 48);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v30;
        while (2)
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v30 != v13)
              objc_enumerationMutation(v10);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v14), "hasGreenTeaWithValue:", a2, (_QWORD)v29) & 1) != 0)
            {

              return 1;
            }
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (v12)
            continue;
          break;
        }
      }

    }
    -[GEOPDPlaceRequestParameters _readBatchSpatialLookupParameters](v3);
    if ((-[GEOPDBatchSpatialLookupParameters hasGreenTeaWithValue:](*(_QWORD *)(v3 + 104), a2) & 1) != 0)
      return 1;
    -[GEOPDPlaceRequestParameters _readBrowseCategorySuggestionParameters](v3);
    if ((-[GEOPDSearchBrowseCategorySuggestionParameters hasGreenTeaWithValue:](*(_QWORD *)(v3 + 120), a2) & 1) != 0)
      return 1;
    -[GEOPDPlaceRequestParameters _readCategorySearchParameters](v3);
    if ((-[GEOPDCategorySearchParameters hasGreenTeaWithValue:](*(_QWORD *)(v3 + 136), a2) & 1) != 0)
      return 1;
    -[GEOPDPlaceRequestParameters _readCollectionSuggestionParameters](v3);
    if ((-[GEOPDCollectionSuggestionParameters hasGreenTeaWithValue:](*(_QWORD *)(v3 + 152), a2) & 1) != 0)
      return 1;
    -[GEOPDPlaceRequestParameters _readExtendedGeoLookupParameters](v3);
    v15 = *(_QWORD *)(v3 + 160);
    if (v15)
    {
      -[GEOPDExtendedGeoLookupParameters _readPrimaryFeatureLocation](*(_QWORD *)(v3 + 160));
      if ((objc_msgSend(*(id *)(v15 + 80), "hasGreenTeaWithValue:", a2) & 1) != 0)
        return 1;
    }
    -[GEOPDPlaceRequestParameters _readExternalTransitLookupParameters](v3);
    v16 = *(_QWORD *)(v3 + 168);
    if (v16)
    {
      -[GEOPDExternalTransitLookupParameters _readTransactionLocation](*(_QWORD *)(v3 + 168));
      if ((objc_msgSend(*(id *)(v16 + 40), "hasGreenTeaWithValue:", a2) & 1) != 0)
        return 1;
    }
    -[GEOPDPlaceRequestParameters _readFeatureIdGeocodingParameters](v3);
    v17 = *(_QWORD *)(v3 + 176);
    if (v17)
    {
      -[GEOPDFeatureIdGeocodingParameters _readLocation](*(_QWORD *)(v3 + 176));
      if ((objc_msgSend(*(id *)(v17 + 56), "hasGreenTeaWithValue:", a2) & 1) != 0)
        return 1;
    }
    -[GEOPDPlaceRequestParameters _readGeocodingParameters](v3);
    if ((-[GEOPDGeocodingParameters hasGreenTeaWithValue:](*(_QWORD *)(v3 + 184), a2) & 1) != 0)
      return 1;
    -[GEOPDPlaceRequestParameters _readGroundViewLabelParameters](v3);
    v18 = *(_QWORD *)(v3 + 192);
    if (v18)
    {
      if ((objc_msgSend(*(id *)(v18 + 24), "hasGreenTeaWithValue:", a2) & 1) != 0)
        return 1;
    }
    -[GEOPDPlaceRequestParameters _readGuidesHomeParameters](v3);
    if ((-[GEOPDGuidesHomeParameters hasGreenTeaWithValue:](*(_QWORD *)(v3 + 200), a2) & 1) != 0)
      return 1;
    -[GEOPDPlaceRequestParameters _readLocationDirectedSearchParameters](v3);
    if ((-[GEOPDLocationDirectedSearchParameters hasGreenTeaWithValue:](*(_QWORD *)(v3 + 216), a2) & 1) != 0)
      return 1;
    -[GEOPDPlaceRequestParameters _readMapsHomeParameters](v3);
    v19 = *(_QWORD *)(v3 + 224);
    if (v19)
    {
      if ((-[GEOPDCollectionSuggestionParameters hasGreenTeaWithValue:](*(_QWORD *)(v19 + 16), a2) & 1) != 0)
        return 1;
    }
    -[GEOPDPlaceRequestParameters _readMapsIdentifierPlaceLookupParameters](v3);
    if ((-[GEOPDMapsIdentifierPlaceLookupParameters hasGreenTeaWithValue:](*(_QWORD *)(v3 + 232), a2) & 1) != 0)
      return 1;
    -[GEOPDPlaceRequestParameters _readMapsSearchHomeParameters](v3);
    if (-[GEOPDMapsSearchHomeParameters hasGreenTeaWithValue:](*(_QWORD *)(v3 + 240), a2))
      return 1;
    -[GEOPDPlaceRequestParameters _readMerchantLookupParameters](v3);
    if ((objc_msgSend(*(id *)(v3 + 248), "hasGreenTeaWithValue:", a2) & 1) != 0)
      return 1;
    -[GEOPDPlaceRequestParameters _readNearbySearchParameters](v3);
    v20 = *(_QWORD *)(v3 + 256);
    if (v20)
    {
      -[GEOPDNearbySearchParameters _readViewportInfo](*(_QWORD *)(v3 + 256));
      if ((objc_msgSend(*(id *)(v20 + 32), "hasGreenTeaWithValue:", a2) & 1) != 0)
        return 1;
    }
    -[GEOPDPlaceRequestParameters _readOfflineRegionNameParameters](v3);
    v21 = *(_QWORD *)(v3 + 264);
    if (v21)
    {
      if ((objc_msgSend(*(id *)(v21 + 16), "hasGreenTeaWithValue:", a2) & 1) != 0)
        return 1;
    }
    -[GEOPDPlaceRequestParameters _readPlaceCollectionLookupParameter](v3);
    if ((-[GEOPDPlaceCollectionLookupParameters hasGreenTeaWithValue:](*(_QWORD *)(v3 + 272), a2) & 1) != 0)
      return 1;
    -[GEOPDPlaceRequestParameters _readPlaceQuestionnaireLookupParameters](v3);
    if ((-[GEOPDPlaceQuestionnaireLookupParameters hasGreenTeaWithValue:](*(_QWORD *)(v3 + 288), a2) & 1) != 0)
      return 1;
    -[GEOPDPlaceRequestParameters _readPlaceRefinementParameters](v3);
    if ((-[GEOPDPlaceRefinementParameters hasGreenTeaWithValue:](*(_QWORD *)(v3 + 296), a2) & 1) != 0)
      return 1;
    -[GEOPDPlaceRequestParameters _readPlacecardEnrichmentParameters](v3);
    v22 = *(_QWORD *)(v3 + 304);
    if (v22)
    {
      -[GEOPDPlacecardEnrichmentParameters _readMapsId](*(_QWORD *)(v3 + 304));
      if ((objc_msgSend(*(id *)(v22 + 32), "hasGreenTeaWithValue:", a2) & 1) != 0)
        return 1;
    }
    -[GEOPDPlaceRequestParameters _readPoiAtAddressLookupParameters](v3);
    if ((-[GEOPDPoiAtAddressLookupParameters hasGreenTeaWithValue:](*(_QWORD *)(v3 + 312), a2) & 1) != 0)
      return 1;
    -[GEOPDPlaceRequestParameters _readPopularNearbySearchParameters](v3);
    v23 = *(_QWORD *)(v3 + 320);
    if (v23)
    {
      -[GEOPDPopularNearbySearchParameters _readViewportInfo](*(_QWORD *)(v3 + 320));
      if ((objc_msgSend(*(id *)(v23 + 32), "hasGreenTeaWithValue:", a2) & 1) != 0)
        return 1;
    }
    -[GEOPDPlaceRequestParameters _readPublisherViewParameters](v3);
    if ((-[GEOPDPublisherViewParameters hasGreenTeaWithValue:](*(_QWORD *)(v3 + 328), a2) & 1) != 0)
      return 1;
    -[GEOPDPlaceRequestParameters _readQueryUnderstandingParameters](v3);
    v24 = *(_QWORD *)(v3 + 336);
    if (v24)
    {
      -[GEOPDQueryUnderstandingParameters _readViewportInfo](*(_QWORD *)(v3 + 336));
      if ((objc_msgSend(*(id *)(v24 + 48), "hasGreenTeaWithValue:", a2) & 1) != 0)
        return 1;
    }
    -[GEOPDPlaceRequestParameters _readRefreshIdLookUpParameters](v3);
    if ((-[GEOPDRefreshIdLookUpParameters hasGreenTeaWithValue:](*(_QWORD *)(v3 + 344), a2) & 1) != 0)
      return 1;
    -[GEOPDPlaceRequestParameters _readReverseGeocodingParameters](v3);
    if ((-[GEOPDReverseGeocodingParameters hasGreenTeaWithValue:](*(_QWORD *)(v3 + 352), a2) & 1) != 0)
      return 1;
    -[GEOPDPlaceRequestParameters _readSearchCapabilitiesParameters](v3);
    v25 = *(_QWORD *)(v3 + 360);
    if (v25)
    {
      if ((objc_msgSend(*(id *)(v25 + 16), "hasGreenTeaWithValue:", a2) & 1) != 0)
        return 1;
    }
    -[GEOPDPlaceRequestParameters _readSearchParameters](v3);
    if ((-[GEOPDSearchParameters hasGreenTeaWithValue:](*(_QWORD *)(v3 + 376), a2) & 1) != 0)
      return 1;
    -[GEOPDPlaceRequestParameters _readSearchZeroKeywordCategorySuggestionParameters](v3);
    v26 = *(_QWORD *)(v3 + 384);
    if (v26)
    {
      if ((objc_msgSend(*(id *)(v26 + 24), "hasGreenTeaWithValue:", a2) & 1) != 0)
        return 1;
    }
    -[GEOPDPlaceRequestParameters _readSiriSearchParameters](v3);
    v27 = *(_QWORD *)(v3 + 400);
    if (v27)
    {
      -[GEOPDSiriSearchParameters _readViewportInfo](*(_QWORD *)(v3 + 400));
      if ((objc_msgSend(*(id *)(v27 + 72), "hasGreenTeaWithValue:", a2) & 1) != 0)
        return 1;
    }
    -[GEOPDPlaceRequestParameters _readTransitNearbyPaymentMethodLookupParameters](v3);
    if ((-[GEOPDTransitNearbyPaymentMethodLookupParameters hasGreenTeaWithValue:](*(_QWORD *)(v3 + 416), a2) & 1) != 0)
      return 1;
    -[GEOPDPlaceRequestParameters _readTransitNearbyScheduleLookupParameters](v3);
    if ((-[GEOPDTransitNearbyScheduleLookupParameters hasGreenTeaWithValue:](*(_QWORD *)(v3 + 424), a2) & 1) != 0)
      return 1;
    -[GEOPDPlaceRequestParameters _readVendorSpecificPlaceRefinementParameters](v3);
    v28 = *(_QWORD *)(v3 + 448);
    if (v28
      && (-[GEOPDVendorSpecificPlaceRefinementParameters _readLocationHint](*(_QWORD *)(v3 + 448)),
          (objc_msgSend(*(id *)(v28 + 56), "hasGreenTeaWithValue:", a2) & 1) != 0))
    {
      return 1;
    }
    else
    {
      -[GEOPDPlaceRequestParameters _readWifiFingerprintParameters](v3);
      return -[GEOPDWifiFingerprintParameters hasGreenTeaWithValue:](*(_QWORD *)(v3 + 456), a2);
    }
  }
  return result;
}

- (void)mergeFrom:(_QWORD *)a1
{
  uint64_t v3;
  void *v4;
  char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t i;
  void *v79;
  BOOL v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  _QWORD *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  id *v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t j;
  char v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t k;
  uint64_t v118;
  void *v119;
  id v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  unint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  id v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t m;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  void *v138;
  id v139;
  __int16 v140;
  void *v141;
  void *v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  id v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t n;
  __int16 v151;
  id v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t ii;
  uint64_t v157;
  void *v158;
  id v159;
  void *v160;
  void *v161;
  id v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t jj;
  uint64_t v167;
  void *v168;
  uint64_t v169;
  void *v170;
  id v171;
  __int16 v172;
  void *v173;
  void *v174;
  uint64_t v175;
  void *v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  _BYTE *v180;
  char v181;
  uint64_t v182;
  void *v183;
  uint64_t v184;
  void *v185;
  void *v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  uint64_t v190;
  void *v191;
  id v192;
  void *v193;
  uint64_t v194;
  void *v195;
  int v196;
  uint64_t v197;
  void *v198;
  uint64_t v199;
  void *v200;
  uint64_t v201;
  unint64_t v202;
  uint64_t v203;
  unint64_t v204;
  void *v205;
  void *v206;
  void *v207;
  uint64_t v208;
  void *v209;
  uint64_t v210;
  unint64_t v211;
  uint64_t v212;
  unint64_t v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  uint64_t v218;
  uint64_t v219;
  unint64_t v220;
  uint64_t v221;
  unint64_t v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  uint64_t v227;
  uint64_t v228;
  unint64_t v229;
  uint64_t v230;
  unint64_t v231;
  void *v232;
  void *v233;
  void *v234;
  uint64_t v235;
  unint64_t v236;
  uint64_t v237;
  unint64_t v238;
  void *v239;
  void *v240;
  void *v241;
  int v242;
  uint64_t v243;
  void *v244;
  void *v245;
  id v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t kk;
  void *v251;
  BOOL v252;
  void *v253;
  uint64_t v254;
  uint64_t v255;
  void *v256;
  uint64_t v257;
  void *v258;
  id v259;
  void *v260;
  uint64_t v261;
  void *v262;
  uint64_t v263;
  void *v264;
  _QWORD *v265;
  id v266;
  void *v267;
  uint64_t v268;
  char v269;
  uint64_t v270;
  void *v271;
  _BYTE *v272;
  char v273;
  uint64_t v274;
  void *v275;
  id v276;
  void *v277;
  uint64_t v278;
  id v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t mm;
  uint64_t v284;
  void *v285;
  id v286;
  __int16 v287;
  void *v288;
  void *v289;
  void *v290;
  uint64_t v291;
  void *v292;
  uint64_t v293;
  void *v294;
  id v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t nn;
  __int16 v300;
  void *v301;
  uint64_t v302;
  void *v303;
  id v304;
  char v305;
  void *v306;
  uint64_t v307;
  uint64_t v308;
  void *v309;
  id *v310;
  id v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t i1;
  uint64_t v316;
  void *v317;
  id v318;
  void *v319;
  void *v320;
  uint64_t v321;
  uint64_t v322;
  void *v323;
  _BYTE *v324;
  char v325;
  uint64_t v326;
  void *v327;
  id v328;
  void *v329;
  uint64_t v330;
  void *v331;
  id v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t i2;
  uint64_t v337;
  void *v338;
  id v339;
  uint64_t v340;
  unint64_t v341;
  uint64_t v342;
  unint64_t v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  uint64_t v348;
  uint64_t v349;
  void *v350;
  id v351;
  _BYTE *v352;
  id v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t i3;
  uint64_t v358;
  void *v359;
  id *v360;
  id v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t i4;
  char *v366;
  char *v367;
  uint64_t v368;
  char *v369;
  void *v370;
  void *v371;
  void *v372;
  uint64_t v373;
  _QWORD *v374;
  void *v375;
  uint64_t v376;
  void *v377;
  id *v378;
  id v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t i5;
  uint64_t v384;
  _QWORD *v385;
  void *v386;
  uint64_t v387;
  void *v388;
  void **v389;
  void **v390;
  void *v391;
  void *v392;
  uint64_t v393;
  void *v394;
  id *v395;
  id v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t i6;
  id v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t i7;
  void *v406;
  _QWORD *v407;
  uint64_t v408;
  unint64_t v409;
  uint64_t v410;
  unint64_t v411;
  void *v412;
  void *v413;
  void *v414;
  uint64_t v415;
  void *v416;
  void **v417;
  void *v418;
  void *v419;
  id v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t i8;
  void *v425;
  uint64_t v426;
  uint64_t v427;
  id *v428;
  id v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t i9;
  uint64_t v434;
  id *v435;
  id v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t i10;
  uint64_t v441;
  void *v442;
  _QWORD *v443;
  void *v444;
  uint64_t v445;
  void *v446;
  _QWORD *v447;
  void *v448;
  _QWORD *v449;
  uint64_t v450;
  unint64_t v451;
  uint64_t v452;
  unint64_t v453;
  void *v454;
  void *v455;
  void *v456;
  uint64_t v457;
  void *v458;
  uint64_t v459;
  void *v460;
  uint64_t v461;
  void *v462;
  uint64_t v463;
  void *v464;
  id *v465;
  void *v466;
  id v467;
  id v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t i11;
  id v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  uint64_t i12;
  uint64_t v478;
  void *v479;
  void **v480;
  void *v481;
  void *v482;
  uint64_t v483;
  void *v484;
  uint64_t v485;
  void *v486;
  uint64_t v487;
  void *v488;
  id v489;
  void *v490;
  uint64_t v491;
  uint64_t v492;
  void *v493;
  _DWORD *v494;
  uint64_t v495;
  void *v496;
  void **v497;
  void *v498;
  void *v499;
  uint64_t v500;
  void *v501;
  _QWORD *v502;
  uint64_t v503;
  void *v504;
  void *v505;
  uint64_t v506;
  uint64_t v507;
  void *v508;
  id v509;
  uint64_t v510;
  void *v511;
  uint64_t v512;
  void *v513;
  _DWORD *v514;
  uint64_t v515;
  void *v516;
  void **v517;
  void *v518;
  void *v519;
  uint64_t v520;
  void *v521;
  _QWORD *v522;
  uint64_t v523;
  void *v524;
  void *v525;
  uint64_t v526;
  uint64_t v527;
  void *v528;
  _QWORD *v529;
  void *v530;
  void *v531;
  void *v532;
  uint64_t v533;
  id *v534;
  id v535;
  uint64_t v536;
  uint64_t v537;
  uint64_t v538;
  uint64_t i13;
  uint64_t v540;
  void *v541;
  id *v542;
  id v543;
  uint64_t v544;
  uint64_t v545;
  uint64_t v546;
  uint64_t i14;
  void *v548;
  id v549;
  uint64_t v550;
  void *v551;
  _QWORD *v552;
  uint64_t v553;
  void *v554;
  uint64_t v555;
  void *v556;
  id v557;
  void *v558;
  uint64_t v559;
  _QWORD *v560;
  void *v561;
  id v562;
  uint64_t v563;
  unint64_t v564;
  uint64_t v565;
  unint64_t v566;
  void *v567;
  void *v568;
  void *v569;
  uint64_t v570;
  unint64_t v571;
  uint64_t v572;
  unint64_t v573;
  void *v574;
  void *v575;
  void *v576;
  void *v577;
  uint64_t v578;
  uint64_t v579;
  void *v580;
  uint64_t v581;
  void *v582;
  id v583;
  uint64_t v584;
  void *v585;
  _QWORD *v586;
  uint64_t v587;
  void *v588;
  id v589;
  uint64_t v590;
  uint64_t v591;
  uint64_t v592;
  uint64_t i15;
  uint64_t v594;
  void *v595;
  uint64_t v596;
  void *v597;
  id v598;
  void *v599;
  uint64_t v600;
  void *v601;
  uint64_t v602;
  uint64_t v603;
  unint64_t v604;
  uint64_t v605;
  unint64_t v606;
  void *v607;
  void *v608;
  void *v609;
  __int16 v610;
  void *v611;
  void *v612;
  uint64_t v613;
  uint64_t v614;
  void *v615;
  id v616;
  void *v617;
  void *v618;
  uint64_t v619;
  uint64_t v620;
  void *v621;
  id v622;
  void *v623;
  id v624;
  uint64_t v625;
  uint64_t v626;
  uint64_t v627;
  uint64_t i16;
  uint64_t v629;
  void *v630;
  id *v631;
  id v632;
  uint64_t v633;
  uint64_t v634;
  uint64_t v635;
  uint64_t i17;
  id v637;
  uint64_t v638;
  uint64_t v639;
  uint64_t v640;
  uint64_t i18;
  uint64_t v642;
  id *v643;
  id v644;
  uint64_t v645;
  uint64_t v646;
  uint64_t v647;
  uint64_t i19;
  uint64_t v649;
  id *v650;
  id v651;
  uint64_t v652;
  uint64_t v653;
  uint64_t v654;
  uint64_t i20;
  uint64_t v656;
  void *v657;
  id v658;
  void *v659;
  uint64_t v660;
  id v661;
  uint64_t v662;
  uint64_t v663;
  uint64_t v664;
  uint64_t i21;
  uint64_t v666;
  void *v667;
  void **v668;
  void *v669;
  void *v670;
  uint64_t v671;
  void *v672;
  void **v673;
  void *v674;
  void *v675;
  uint64_t v676;
  id *v677;
  id v678;
  uint64_t v679;
  uint64_t v680;
  uint64_t v681;
  uint64_t i22;
  uint64_t v683;
  void *v684;
  _QWORD *v685;
  void *v686;
  uint64_t v687;
  void *v688;
  _QWORD *v689;
  id v690;
  __int128 v691;
  __int128 v692;
  __int128 v693;
  __int128 v694;
  __int128 v695;
  __int128 v696;
  __int128 v697;
  __int128 v698;
  __int128 v699;
  __int128 v700;
  __int128 v701;
  __int128 v702;
  __int128 v703;
  __int128 v704;
  __int128 v705;
  __int128 v706;
  __int128 v707;
  __int128 v708;
  __int128 v709;
  __int128 v710;
  _BYTE v711[128];
  uint64_t v712;

  v712 = *MEMORY[0x1E0C80C00];
  v690 = a2;
  if (!a1)
    goto LABEL_1282;
  -[GEOPDPlaceRequestParameters readAll:]((uint64_t)v690, 0);
  v3 = a1[47];
  v4 = (void *)*((_QWORD *)v690 + 47);
  v689 = a1;
  if (v3)
  {
    if (!v4)
      goto LABEL_162;
    v5 = v4;
    -[GEOPDSearchParameters readAll:]((uint64_t)v5, 0);
    v6 = *(_QWORD *)(v5 + 372);
    if ((v6 & 0x20) != 0)
    {
      *(_DWORD *)(v3 + 360) = *((_DWORD *)v5 + 90);
      *(_QWORD *)(v3 + 372) |= 0x20uLL;
      v6 = *(_QWORD *)(v5 + 372);
    }
    if ((v6 & 2) != 0)
    {
      *(_DWORD *)(v3 + 344) = *((_DWORD *)v5 + 86);
      *(_QWORD *)(v3 + 372) |= 2uLL;
    }
    v7 = (void *)*((_QWORD *)v5 + 34);
    if (v7)
      -[GEOPDSearchParameters setSearchString:](v3, v7);
    v8 = *(void **)(v3 + 320);
    v9 = *((_QWORD *)v5 + 40);
    if (v8)
    {
      if (v9)
        objc_msgSend(v8, "mergeFrom:");
    }
    else if (v9)
    {
      -[GEOPDSearchParameters setViewportInfo:](v3, *((void **)v5 + 40));
    }
    v10 = (void *)*((_QWORD *)v5 + 39);
    if (v10)
      -[GEOPDSearchParameters setSuggestionMetadata:](v3, v10);
    v11 = (void *)*((_QWORD *)v5 + 37);
    if (v11)
      -[GEOPDSearchParameters setSuggestionEntryMetadata:](v3, v11);
    v12 = *(void **)(v3 + 304);
    v13 = *((_QWORD *)v5 + 38);
    if (v12)
    {
      if (v13)
        objc_msgSend(v12, "mergeFrom:");
    }
    else if (v13)
    {
      -[GEOPDSearchParameters setSuggestionEntry:](v3, *((void **)v5 + 38));
    }
    if ((v5[372] & 8) != 0)
    {
      *(_DWORD *)(v3 + 352) = *((_DWORD *)v5 + 88);
      *(_QWORD *)(v3 + 372) |= 8uLL;
    }
    v14 = *(_QWORD *)(v3 + 280);
    v15 = (void *)*((_QWORD *)v5 + 35);
    if (v14)
    {
      if (v15)
        -[GEOPDSSearchStructureIntentRequestType mergeFrom:](v14, v15);
    }
    else if (v15)
    {
      -[GEOPDSearchParameters setSearchStructureIntentType:](v3, v15);
    }
    v16 = *(_QWORD *)(v3 + 248);
    v17 = (void *)*((_QWORD *)v5 + 31);
    if (v16)
    {
      if (v17)
        -[GEOPDSSearchLocationParameters mergeFrom:](v16, v17);
    }
    else if (v17)
    {
      -[GEOPDSearchParameters setSearchLocationParameters:](v3, v17);
    }
    v18 = *(_QWORD *)(v3 + 208);
    v19 = (void *)*((_QWORD *)v5 + 26);
    if (v18)
    {
      if (v19)
        -[GEOPDRecentRouteInfo mergeFrom:](v18, v19);
    }
    else if (v19)
    {
      -[GEOPDSearchParameters setRecentRouteInfo:](v3, v19);
    }
    v20 = *(_QWORD *)(v3 + 240);
    v21 = (void *)*((_QWORD *)v5 + 30);
    if (v20)
    {
      if (v21)
        -[GEOPDSSearchFilter mergeFrom:](v20, v21);
    }
    else if (v21)
    {
      -[GEOPDSearchParameters setSearchFilter:](v3, v21);
    }
    v22 = *(_QWORD *)(v5 + 372);
    if ((v22 & 0x80) != 0)
    {
      *(_BYTE *)(v3 + 365) = v5[365];
      *(_QWORD *)(v3 + 372) |= 0x80uLL;
      v22 = *(_QWORD *)(v5 + 372);
    }
    if ((v22 & 0x40) != 0)
    {
      *(_BYTE *)(v3 + 364) = v5[364];
      *(_QWORD *)(v3 + 372) |= 0x40uLL;
    }
    v23 = *(_QWORD *)(v3 + 224);
    v24 = (void *)*((_QWORD *)v5 + 28);
    if (v23)
    {
      if (v24)
        -[GEOPDRetainedSearchMetadata mergeFrom:](v23, v24);
    }
    else if (v24)
    {
      -[GEOPDSearchParameters setRetainedSearch:](v3, v24);
    }
    v25 = *(_QWORD *)(v5 + 372);
    if ((v25 & 0x800) != 0)
    {
      *(_BYTE *)(v3 + 369) = v5[369];
      *(_QWORD *)(v3 + 372) |= 0x800uLL;
      v25 = *(_QWORD *)(v5 + 372);
      if ((v25 & 0x200) == 0)
      {
LABEL_59:
        if ((v25 & 0x10) == 0)
        {
LABEL_61:
          v26 = *(_QWORD *)(v3 + 168);
          v27 = (void *)*((_QWORD *)v5 + 21);
          if (v26)
          {
            if (v27)
              -[GEOPDSInferredSignals mergeFrom:](v26, v27);
          }
          else if (v27)
          {
            -[GEOPDSearchParameters setInferredSignals:](v3, v27);
          }
          -[GEOPDSearchParameters _readSupportedRelatedEntitySectionTypes]((uint64_t)v5);
          v28 = *((_QWORD *)v5 + 10);
          if (v28)
          {
            v29 = 0;
            v30 = *MEMORY[0x1E0C99858];
            do
            {
              -[GEOPDSearchParameters _readSupportedRelatedEntitySectionTypes]((uint64_t)v5);
              v31 = *((_QWORD *)v5 + 10);
              if (v31 <= v29)
              {
                v32 = (void *)MEMORY[0x1E0C99DA0];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v29, v31);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "exceptionWithName:reason:userInfo:", v30, v33, 0);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "raise");

              }
              -[GEOPDSearchParameters addSupportedRelatedEntitySectionType:](v3);
              ++v29;
            }
            while (v28 != v29);
          }
          v35 = *(_QWORD *)(v3 + 160);
          v36 = (void *)*((_QWORD *)v5 + 20);
          if (v35)
          {
            if (v36)
              -[GEOPDSSearchEvChargingParameters mergeFrom:](v35, v36);
          }
          else if (v36)
          {
            -[GEOPDSearchParameters setEvChargingParameters:](v3, v36);
          }
          v37 = *(_QWORD *)(v3 + 152);
          v38 = (void *)*((_QWORD *)v5 + 19);
          if (v37)
          {
            if (v38)
              -[GEOPDETAFilter mergeFrom:](v37, v38);
          }
          else if (v38)
          {
            -[GEOPDSearchParameters setEtaFilter:](v3, v38);
          }
          -[GEOPDSearchParameters _readSupportedSearchTierTypes]((uint64_t)v5);
          v39 = *((_QWORD *)v5 + 16);
          if (v39)
          {
            v40 = 0;
            v41 = *MEMORY[0x1E0C99858];
            do
            {
              -[GEOPDSearchParameters _readSupportedSearchTierTypes]((uint64_t)v5);
              v42 = *((_QWORD *)v5 + 16);
              if (v42 <= v40)
              {
                v43 = (void *)MEMORY[0x1E0C99DA0];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v40, v42);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "exceptionWithName:reason:userInfo:", v41, v44, 0);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "raise");

              }
              -[GEOPDSearchParameters addSupportedSearchTierType:](v3);
              ++v40;
            }
            while (v39 != v40);
          }
          if ((v5[372] & 1) != 0)
          {
            *(_DWORD *)(v3 + 340) = *((_DWORD *)v5 + 85);
            *(_QWORD *)(v3 + 372) |= 1uLL;
          }
          v46 = *(void **)(v3 + 216);
          v47 = *((_QWORD *)v5 + 27);
          if (v46)
          {
            if (v47)
              objc_msgSend(v46, "mergeFrom:");
          }
          else if (v47)
          {
            -[GEOPDSearchParameters setResultRefinementQuery:](v3, *((void **)v5 + 27));
          }
          -[GEOPDSearchParameters _readKnownRefinementTypes]((uint64_t)v5);
          v48 = *((_QWORD *)v5 + 4);
          if (v48)
          {
            v49 = 0;
            v50 = *MEMORY[0x1E0C99858];
            do
            {
              -[GEOPDSearchParameters _readKnownRefinementTypes]((uint64_t)v5);
              v51 = *((_QWORD *)v5 + 4);
              if (v51 <= v49)
              {
                v52 = (void *)MEMORY[0x1E0C99DA0];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v49, v51);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "exceptionWithName:reason:userInfo:", v50, v53, 0);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "raise");

              }
              -[GEOPDSearchParameters addKnownRefinementType:](v3);
              ++v49;
            }
            while (v48 != v49);
          }
          if ((v5[372] & 4) != 0)
          {
            *(_DWORD *)(v3 + 348) = *((_DWORD *)v5 + 87);
            *(_QWORD *)(v3 + 372) |= 4uLL;
          }
          v55 = *(void **)(v3 + 192);
          v56 = *((_QWORD *)v5 + 24);
          if (v55)
          {
            if (v56)
              objc_msgSend(v55, "mergeFrom:");
          }
          else if (v56)
          {
            -[GEOPDSearchParameters setPreviousSearchViewport:](v3, *((void **)v5 + 24));
          }
          -[GEOPDSearchParameters _readSupportedPlaceSummaryFormatTypes]((uint64_t)v5);
          v57 = *((_QWORD *)v5 + 7);
          if (v57)
          {
            v58 = 0;
            v59 = *MEMORY[0x1E0C99858];
            do
            {
              -[GEOPDSearchParameters _readSupportedPlaceSummaryFormatTypes]((uint64_t)v5);
              v60 = *((_QWORD *)v5 + 7);
              if (v60 <= v58)
              {
                v61 = (void *)MEMORY[0x1E0C99DA0];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v58, v60);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "exceptionWithName:reason:userInfo:", v59, v62, 0);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "raise");

              }
              -[GEOPDSearchParameters addSupportedPlaceSummaryFormatType:](v3);
              ++v58;
            }
            while (v57 != v58);
          }
          -[GEOPDSearchParameters _readSupportedSearchSectionTypes]((uint64_t)v5);
          v64 = *((_QWORD *)v5 + 13);
          if (v64)
          {
            v65 = 0;
            v66 = *MEMORY[0x1E0C99858];
            do
            {
              -[GEOPDSearchParameters _readSupportedSearchSectionTypes]((uint64_t)v5);
              v67 = *((_QWORD *)v5 + 13);
              if (v67 <= v65)
              {
                v68 = (void *)MEMORY[0x1E0C99DA0];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v65, v67);
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "exceptionWithName:reason:userInfo:", v66, v69, 0);
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "raise");

              }
              -[GEOPDSearchParameters addSupportedSearchSectionType:](v3);
              ++v65;
            }
            while (v64 != v65);
          }
          if ((v5[373] & 1) != 0)
          {
            *(_BYTE *)(v3 + 366) = v5[366];
            *(_QWORD *)(v3 + 372) |= 0x100uLL;
          }
          v71 = *(_QWORD *)(v3 + 256);
          v72 = (void *)*((_QWORD *)v5 + 32);
          a1 = v689;
          if (v71)
          {
            if (v72)
              -[GEOPDSearchOriginationInfo mergeFrom:](v71, v72);
          }
          else if (v72)
          {
            -[GEOPDSearchParameters setSearchOriginationInfo:](v3, v72);
          }
          if ((v5[373] & 4) != 0)
          {
            *(_BYTE *)(v3 + 368) = v5[368];
            *(_QWORD *)(v3 + 372) |= 0x400uLL;
          }
          v73 = (void *)*((_QWORD *)v5 + 18);
          if (v73)
            -[GEOPDSearchParameters setEnrichmentCampaignNamespace:](v3, v73);
          v709 = 0u;
          v710 = 0u;
          v707 = 0u;
          v708 = 0u;
          v74 = *((id *)v5 + 29);
          v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
          if (v75)
          {
            v76 = v75;
            v77 = *(_QWORD *)v708;
            do
            {
              for (i = 0; i != v76; ++i)
              {
                if (*(_QWORD *)v708 != v77)
                  objc_enumerationMutation(v74);
                -[GEOPDSearchParameters addSearchEnrichmentRevisionMetadata:](v3, *(void **)(*((_QWORD *)&v707 + 1) + 8 * i));
              }
              v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
            }
            while (v76);
          }

          v79 = (void *)*((_QWORD *)v5 + 33);
          if (*(_QWORD *)(v3 + 264))
            v80 = 1;
          else
            v80 = v79 == 0;
          if (!v80)
            -[GEOPDSearchParameters setSearchSessionData:](v3, v79);
          v81 = *(void **)(v3 + 176);
          v82 = *((_QWORD *)v5 + 22);
          if (v81)
          {
            if (v82)
              objc_msgSend(v81, "mergeFrom:");
          }
          else if (v82)
          {
            -[GEOPDSearchParameters setMostRecentAutocompleteRequestSessionData:](v3, *((void **)v5 + 22));
          }
          v83 = *(_QWORD *)(v3 + 200);
          v84 = (void *)*((_QWORD *)v5 + 25);
          if (v83)
          {
            if (v84)
              -[GEOPDSPunchInHints mergeFrom:](v83, v84);
          }
          else if (v84)
          {
            -[GEOPDSearchParameters setPunchInHints:](v3, v84);
          }
          v85 = *(void **)(v3 + 288);
          v86 = *((_QWORD *)v5 + 36);
          if (v85)
          {
            if (v86)
              objc_msgSend(v85, "mergeFrom:");
          }
          else if (v86)
          {
            -[GEOPDSearchParameters setSessionUserActionMetadata:](v3, *((void **)v5 + 36));
          }
          v87 = *(_QWORD *)(v3 + 184);
          v88 = (void *)*((_QWORD *)v5 + 23);
          if (v87)
          {
            if (v88)
              -[GEOPDPaginationParameters mergeFrom:](v87, v88);
          }
          else if (v88)
          {
            -[GEOPDSearchParameters setPaginationParameters:](v3, v88);
          }

          goto LABEL_162;
        }
LABEL_60:
        *(_DWORD *)(v3 + 356) = *((_DWORD *)v5 + 89);
        *(_QWORD *)(v3 + 372) |= 0x10uLL;
        goto LABEL_61;
      }
    }
    else if ((v25 & 0x200) == 0)
    {
      goto LABEL_59;
    }
    *(_BYTE *)(v3 + 367) = v5[367];
    *(_QWORD *)(v3 + 372) |= 0x200uLL;
    if ((*(_QWORD *)(v5 + 372) & 0x10) == 0)
      goto LABEL_61;
    goto LABEL_60;
  }
  if (v4)
    -[GEOPDPlaceRequestParameters setSearchParameters:]((uint64_t)a1, v4);
LABEL_162:
  v89 = a1[23];
  v90 = (void *)*((_QWORD *)v690 + 23);
  if (v89)
  {
    if (v90)
    {
      v91 = v90;
      -[GEOPDGeocodingParameters readAll:]((uint64_t)v91, 0);
      v92 = (void *)*((_QWORD *)v91 + 5);
      if (v92)
        -[GEOPDGeocodingParameters setQueryString:](v89, v92);
      if ((*((_WORD *)v91 + 42) & 1) != 0)
      {
        *(_DWORD *)(v89 + 76) = *((_DWORD *)v91 + 19);
        *(_WORD *)(v89 + 84) |= 1u;
      }
      v93 = *(void **)(v89 + 56);
      v94 = *((_QWORD *)v91 + 7);
      if (v93)
      {
        if (v94)
          objc_msgSend(v93, "mergeFrom:");
      }
      else if (v94)
      {
        -[GEOPDGeocodingParameters setViewportInfo:](v89, *((void **)v91 + 7));
      }
      v95 = *(void **)(v89 + 48);
      v96 = *((_QWORD *)v91 + 6);
      if (v95)
      {
        if (v96)
          objc_msgSend(v95, "mergeFrom:");
      }
      else if (v96)
      {
        -[GEOPDGeocodingParameters setStructuredAddress:](v89, *((void **)v91 + 6));
      }
      v97 = *(_QWORD *)(v89 + 32);
      v98 = (void *)*((_QWORD *)v91 + 4);
      if (v97)
      {
        if (v98)
          -[GEOPDSPunchInHints mergeFrom:](v97, v98);
      }
      else if (v98)
      {
        -[GEOPDGeocodingParameters setPunchInHints:](v89, v98);
      }
      if ((*((_WORD *)v91 + 42) & 2) != 0)
      {
        *(_BYTE *)(v89 + 80) = *((_BYTE *)v91 + 80);
        *(_WORD *)(v89 + 84) |= 2u;
      }
      v99 = *(_QWORD *)(v89 + 24);
      v100 = (void *)*((_QWORD *)v91 + 3);
      if (v99)
      {
        if (v100)
          -[GEOPDAddressResultSubTypeFilter mergeFrom:](v99, v100);
      }
      else if (v100)
      {
        -[GEOPDGeocodingParameters setAddressResultSubTypeFilter:](v89, v100);
      }

    }
  }
  else if (v90)
  {
    -[GEOPDPlaceRequestParameters setGeocodingParameters:]((uint64_t)a1, v90);
  }
  v101 = a1[16];
  v102 = (_QWORD *)*((_QWORD *)v690 + 16);
  if (v101)
  {
    if (v102)
    {
      v103 = (void *)v102[2];
      if (v103)
        -[GEOPDCanonicalLocationSearchParameters setQueryString:](v101, v103);
    }
  }
  else if (v102)
  {
    -[GEOPDPlaceRequestParameters setCanonicalLocationSearchParameters:]((uint64_t)a1, v102);
  }
  v104 = a1[44];
  v105 = (void *)*((_QWORD *)v690 + 44);
  if (v104)
  {
    if (v105)
    {
      v106 = v105;
      -[GEOPDReverseGeocodingParameters readAll:]((uint64_t)v106, 0);
      v705 = 0u;
      v706 = 0u;
      v703 = 0u;
      v704 = 0u;
      v107 = v106[4];
      v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v703, v711, 16);
      if (v108)
      {
        v109 = v108;
        v110 = *(_QWORD *)v704;
        do
        {
          for (j = 0; j != v109; ++j)
          {
            if (*(_QWORD *)v704 != v110)
              objc_enumerationMutation(v107);
            -[GEOPDReverseGeocodingParameters addLocation:](v104, *(void **)(*((_QWORD *)&v703 + 1) + 8 * j));
          }
          v109 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v703, v711, 16);
        }
        while (v109);
      }

      v112 = *((_BYTE *)v106 + 60);
      if ((v112 & 1) != 0)
      {
        *(_DWORD *)(v104 + 52) = *((_DWORD *)v106 + 13);
        *(_BYTE *)(v104 + 60) |= 1u;
        v112 = *((_BYTE *)v106 + 60);
      }
      if ((v112 & 2) != 0)
      {
        *(_BYTE *)(v104 + 56) = *((_BYTE *)v106 + 56);
        *(_BYTE *)(v104 + 60) |= 2u;
      }
      v701 = 0u;
      v702 = 0u;
      v699 = 0u;
      v700 = 0u;
      v113 = v106[3];
      v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v699, &v707, 16);
      if (v114)
      {
        v115 = v114;
        v116 = *(_QWORD *)v700;
        do
        {
          for (k = 0; k != v115; ++k)
          {
            if (*(_QWORD *)v700 != v116)
              objc_enumerationMutation(v113);
            -[GEOPDReverseGeocodingParameters addExtendedLocation:](v104, *(void **)(*((_QWORD *)&v699 + 1) + 8 * k));
          }
          v115 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v699, &v707, 16);
        }
        while (v115);
      }

    }
  }
  else if (v105)
  {
    -[GEOPDPlaceRequestParameters setReverseGeocodingParameters:]((uint64_t)a1, v105);
  }
  v118 = a1[35];
  v119 = (void *)*((_QWORD *)v690 + 35);
  if (v118)
  {
    if (v119)
    {
      v120 = v119;
      -[GEOPDPlaceLookupParameters readAll:]((uint64_t)v120, 0);
      if ((*((_BYTE *)v120 + 76) & 1) != 0)
      {
        *(_DWORD *)(v118 + 68) = *((_DWORD *)v120 + 17);
        *(_BYTE *)(v118 + 76) |= 1u;
      }
      -[GEOPDPlaceLookupParameters _readMuids]((uint64_t)v120);
      v121 = *((_QWORD *)v120 + 4);
      if (v121)
      {
        v122 = 0;
        v123 = *MEMORY[0x1E0C99858];
        do
        {
          -[GEOPDPlaceLookupParameters _readMuids]((uint64_t)v120);
          v124 = *((_QWORD *)v120 + 4);
          if (v124 <= v122)
          {
            v125 = (void *)MEMORY[0x1E0C99DA0];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v122, v124);
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v125, "exceptionWithName:reason:userInfo:", v123, v126, 0);
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v127, "raise");

          }
          -[GEOPDPlaceLookupParameters addMuid:](v118);
          ++v122;
        }
        while (v121 != v122);
      }
      if ((*((_BYTE *)v120 + 76) & 2) != 0)
      {
        *(_BYTE *)(v118 + 72) = *((_BYTE *)v120 + 72);
        *(_BYTE *)(v118 + 76) |= 2u;
      }
      v709 = 0u;
      v710 = 0u;
      v707 = 0u;
      v708 = 0u;
      v128 = *((id *)v120 + 6);
      v129 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
      a1 = v689;
      if (v129)
      {
        v130 = v129;
        v131 = *(_QWORD *)v708;
        do
        {
          for (m = 0; m != v130; ++m)
          {
            if (*(_QWORD *)v708 != v131)
              objc_enumerationMutation(v128);
            objc_msgSend((id)v118, "addIdentifier:", *(_QWORD *)(*((_QWORD *)&v707 + 1) + 8 * m));
          }
          v130 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
        }
        while (v130);
      }

    }
  }
  else if (v119)
  {
    -[GEOPDPlaceRequestParameters setPlaceLookupParameters:]((uint64_t)a1, v119);
  }
  v133 = (void *)a1[31];
  v134 = *((_QWORD *)v690 + 31);
  if (v133)
  {
    if (v134)
      objc_msgSend(v133, "mergeFrom:");
  }
  else if (v134)
  {
    -[GEOPDPlaceRequestParameters setMerchantLookupParameters:]((uint64_t)a1, *((void **)v690 + 31));
  }
  v135 = a1[37];
  v136 = (void *)*((_QWORD *)v690 + 37);
  if (v135)
  {
    if (v136)
      -[GEOPDPlaceRefinementParameters mergeFrom:](v135, v136);
  }
  else if (v136)
  {
    -[GEOPDPlaceRequestParameters setPlaceRefinementParameters:]((uint64_t)a1, v136);
  }
  v137 = a1[50];
  v138 = (void *)*((_QWORD *)v690 + 50);
  if (v137)
  {
    if (v138)
    {
      v139 = v138;
      -[GEOPDSiriSearchParameters readAll:]((uint64_t)v139, 0);
      v140 = *((_WORD *)v139 + 52);
      if ((v140 & 2) != 0)
      {
        *(_DWORD *)(v137 + 96) = *((_DWORD *)v139 + 24);
        *(_WORD *)(v137 + 104) |= 2u;
        v140 = *((_WORD *)v139 + 52);
      }
      if ((v140 & 1) != 0)
      {
        *(_DWORD *)(v137 + 92) = *((_DWORD *)v139 + 23);
        *(_WORD *)(v137 + 104) |= 1u;
      }
      v141 = (void *)*((_QWORD *)v139 + 7);
      if (v141)
        -[GEOPDSiriSearchParameters setSearchString:](v137, v141);
      v142 = *(void **)(v137 + 72);
      v143 = *((_QWORD *)v139 + 9);
      if (v142)
      {
        if (v143)
          objc_msgSend(v142, "mergeFrom:");
      }
      else if (v143)
      {
        -[GEOPDSiriSearchParameters setViewportInfo:](v137, *((void **)v139 + 9));
      }
      v144 = *(void **)(v137 + 24);
      v145 = *((_QWORD *)v139 + 3);
      if (v144)
      {
        if (v145)
          objc_msgSend(v144, "mergeFrom:");
      }
      else if (v145)
      {
        -[GEOPDSiriSearchParameters setAddress:](v137, *((void **)v139 + 3));
      }
      v697 = 0u;
      v698 = 0u;
      v695 = 0u;
      v696 = 0u;
      v146 = *((id *)v139 + 4);
      v147 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v695, &v707, 16);
      if (v147)
      {
        v148 = v147;
        v149 = *(_QWORD *)v696;
        do
        {
          for (n = 0; n != v148; ++n)
          {
            if (*(_QWORD *)v696 != v149)
              objc_enumerationMutation(v146);
            -[GEOPDSiriSearchParameters addBusinessCategoryFilter:](v137, *(void **)(*((_QWORD *)&v695 + 1) + 8 * n));
          }
          v148 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v695, &v707, 16);
        }
        while (v148);
      }

      v151 = *((_WORD *)v139 + 52);
      if ((v151 & 4) != 0)
      {
        *(_BYTE *)(v137 + 100) = *((_BYTE *)v139 + 100);
        *(_WORD *)(v137 + 104) |= 4u;
        v151 = *((_WORD *)v139 + 52);
      }
      if ((v151 & 8) != 0)
      {
        *(_BYTE *)(v137 + 101) = *((_BYTE *)v139 + 101);
        *(_WORD *)(v137 + 104) |= 8u;
      }
      v693 = 0u;
      v694 = 0u;
      v691 = 0u;
      v692 = 0u;
      v152 = *((id *)v139 + 8);
      v153 = objc_msgSend(v152, "countByEnumeratingWithState:objects:count:", &v691, &v703, 16);
      if (v153)
      {
        v154 = v153;
        v155 = *(_QWORD *)v692;
        do
        {
          for (ii = 0; ii != v154; ++ii)
          {
            if (*(_QWORD *)v692 != v155)
              objc_enumerationMutation(v152);
            -[GEOPDSiriSearchParameters addSearchSubstringDescriptor:](v137, *(void **)(*((_QWORD *)&v691 + 1) + 8 * ii));
          }
          v154 = objc_msgSend(v152, "countByEnumeratingWithState:objects:count:", &v691, &v703, 16);
        }
        while (v154);
      }

      v157 = *(_QWORD *)(v137 + 40);
      v158 = (void *)*((_QWORD *)v139 + 5);
      if (v157)
      {
        if (v158)
        {
          v159 = v158;
          -[GEOPDIndexQueryNode readAll:]((uint64_t)v159, 0);
          *(_DWORD *)(v157 + 60) = *((_DWORD *)v159 + 15);
          v160 = (void *)*((_QWORD *)v159 + 3);
          if (v160)
            -[GEOPDIndexQueryNode setField:](v157, v160);
          v161 = (void *)*((_QWORD *)v159 + 5);
          if (v161)
            -[GEOPDIndexQueryNode setValue:](v157, v161);
          v701 = 0u;
          v702 = 0u;
          v699 = 0u;
          v700 = 0u;
          v162 = *((id *)v159 + 4);
          v163 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v699, v711, 16);
          if (v163)
          {
            v164 = v163;
            v165 = *(_QWORD *)v700;
            do
            {
              for (jj = 0; jj != v164; ++jj)
              {
                if (*(_QWORD *)v700 != v165)
                  objc_enumerationMutation(v162);
                -[GEOPDIndexQueryNode addOperand:](v157, *(void **)(*((_QWORD *)&v699 + 1) + 8 * jj));
              }
              v164 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v699, v711, 16);
            }
            while (v164);
          }

        }
      }
      else if (v158)
      {
        -[GEOPDSiriSearchParameters setIndexFilter:](v137, v158);
      }
      v167 = *(_QWORD *)(v137 + 48);
      v168 = (void *)*((_QWORD *)v139 + 6);
      if (v167)
      {
        if (v168)
          -[GEOPDRecentRouteInfo mergeFrom:](v167, v168);
      }
      else if (v168)
      {
        -[GEOPDSiriSearchParameters setRecentRouteInfo:](v137, v168);
      }

    }
  }
  else if (v138)
  {
    -[GEOPDPlaceRequestParameters setSiriSearchParameters:]((uint64_t)a1, v138);
  }
  v169 = a1[27];
  v170 = (void *)*((_QWORD *)v690 + 27);
  if (v169)
  {
    if (v170)
    {
      v171 = v170;
      -[GEOPDLocationDirectedSearchParameters readAll:]((uint64_t)v171, 0);
      v172 = *((_WORD *)v171 + 48);
      if ((v172 & 4) != 0)
      {
        *(_DWORD *)(v169 + 92) = *((_DWORD *)v171 + 23);
        *(_WORD *)(v169 + 96) |= 4u;
        v172 = *((_WORD *)v171 + 48);
      }
      if ((v172 & 1) != 0)
      {
        *(_DWORD *)(v169 + 84) = *((_DWORD *)v171 + 21);
        *(_WORD *)(v169 + 96) |= 1u;
      }
      v173 = (void *)*((_QWORD *)v171 + 7);
      if (v173)
        -[GEOPDLocationDirectedSearchParameters setSearchString:](v169, v173);
      v174 = *(void **)(v169 + 64);
      v175 = *((_QWORD *)v171 + 8);
      if (v174)
      {
        if (v175)
          objc_msgSend(v174, "mergeFrom:");
      }
      else if (v175)
      {
        -[GEOPDLocationDirectedSearchParameters setViewportInfo:](v169, *((void **)v171 + 8));
      }
      v176 = *(void **)(v169 + 48);
      v177 = *((_QWORD *)v171 + 6);
      if (v176)
      {
        if (v177)
          objc_msgSend(v176, "mergeFrom:");
      }
      else if (v177)
      {
        -[GEOPDLocationDirectedSearchParameters setSearchLocation:](v169, *((void **)v171 + 6));
      }
      if ((*((_WORD *)v171 + 48) & 2) != 0)
      {
        *(_DWORD *)(v169 + 88) = *((_DWORD *)v171 + 22);
        *(_WORD *)(v169 + 96) |= 2u;
      }
      v178 = *(_QWORD *)(v169 + 24);
      v179 = (void *)*((_QWORD *)v171 + 3);
      if (v178)
      {
        if (v179)
        {
          v180 = v179;
          v181 = v180[28];
          if ((v181 & 1) != 0)
          {
            *(_QWORD *)(v178 + 16) = *((_QWORD *)v180 + 2);
            *(_BYTE *)(v178 + 28) |= 1u;
            v181 = v180[28];
          }
          if ((v181 & 2) != 0)
          {
            *(_BYTE *)(v178 + 24) = v180[24];
            *(_BYTE *)(v178 + 28) |= 2u;
          }

        }
      }
      else if (v179)
      {
        -[GEOPDLocationDirectedSearchParameters setNearestTransitParameters:](v169, v179);
      }
      v182 = *(_QWORD *)(v169 + 32);
      v183 = (void *)*((_QWORD *)v171 + 4);
      if (v182)
      {
        if (v183)
          -[GEOPDPaginationParameters mergeFrom:](v182, v183);
      }
      else if (v183)
      {
        -[GEOPDLocationDirectedSearchParameters setPaginationParameters:](v169, v183);
      }
      v184 = *(_QWORD *)(v169 + 40);
      v185 = (void *)*((_QWORD *)v171 + 5);
      if (v184)
      {
        if (v185)
          -[GEOPDSSearchFilter mergeFrom:](v184, v185);
      }
      else if (v185)
      {
        -[GEOPDLocationDirectedSearchParameters setSearchFilter:](v169, v185);
      }

    }
  }
  else if (v170)
  {
    -[GEOPDPlaceRequestParameters setLocationDirectedSearchParameters:]((uint64_t)a1, v170);
  }
  v186 = (void *)a1[8];
  v187 = *((_QWORD *)v690 + 8);
  if (v186)
  {
    if (v187)
      objc_msgSend(v186, "mergeFrom:");
  }
  else if (v187)
  {
    -[GEOPDPlaceRequestParameters setAutocompleteParameters:]((uint64_t)a1, *((void **)v690 + 8));
  }
  v188 = a1[15];
  v189 = (void *)*((_QWORD *)v690 + 15);
  if (v188)
  {
    if (v189)
      -[GEOPDSearchBrowseCategorySuggestionParameters mergeFrom:](v188, v189);
  }
  else if (v189)
  {
    -[GEOPDPlaceRequestParameters setBrowseCategorySuggestionParameters:]((uint64_t)a1, v189);
  }
  v190 = a1[17];
  v191 = (void *)*((_QWORD *)v690 + 17);
  if (v190)
  {
    if (!v191)
      goto LABEL_475;
    v192 = v191;
    -[GEOPDCategorySearchParameters readAll:]((uint64_t)v192, 0);
    if ((*((_BYTE *)v192 + 288) & 8) != 0)
    {
      *(_DWORD *)(v190 + 272) = *((_DWORD *)v192 + 68);
      *(_DWORD *)(v190 + 288) |= 8u;
    }
    v193 = *(void **)(v190 + 240);
    v194 = *((_QWORD *)v192 + 30);
    if (v193)
    {
      if (v194)
        objc_msgSend(v193, "mergeFrom:");
    }
    else if (v194)
    {
      -[GEOPDCategorySearchParameters setViewportInfo:](v190, *((void **)v192 + 30));
    }
    v195 = (void *)*((_QWORD *)v192 + 29);
    if (v195)
      -[GEOPDCategorySearchParameters setSuggestionEntryMetadata:](v190, v195);
    v196 = *((_DWORD *)v192 + 72);
    if ((v196 & 2) != 0)
    {
      *(_DWORD *)(v190 + 264) = *((_DWORD *)v192 + 66);
      *(_DWORD *)(v190 + 288) |= 2u;
      v196 = *((_DWORD *)v192 + 72);
      if ((v196 & 4) == 0)
      {
LABEL_380:
        if ((v196 & 0x20) == 0)
        {
LABEL_382:
          v197 = *(_QWORD *)(v190 + 184);
          v198 = (void *)*((_QWORD *)v192 + 23);
          if (v197)
          {
            if (v198)
              -[GEOPDRecentRouteInfo mergeFrom:](v197, v198);
          }
          else if (v198)
          {
            -[GEOPDCategorySearchParameters setRecentRouteInfo:](v190, v198);
          }
          if ((*((_BYTE *)v192 + 288) & 0x40) != 0)
          {
            *(_BYTE *)(v190 + 284) = *((_BYTE *)v192 + 284);
            *(_DWORD *)(v190 + 288) |= 0x40u;
          }
          v199 = *(_QWORD *)(v190 + 160);
          v200 = (void *)*((_QWORD *)v192 + 20);
          if (v199)
          {
            if (v200)
              -[GEOPDSSearchEvChargingParameters mergeFrom:](v199, v200);
          }
          else if (v200)
          {
            -[GEOPDCategorySearchParameters setEvChargingParameters:](v190, v200);
          }
          -[GEOPDCategorySearchParameters _readSupportedRelatedEntitySectionTypes]((uint64_t)v192);
          v201 = *((_QWORD *)v192 + 10);
          if (v201)
          {
            v202 = 0;
            v203 = *MEMORY[0x1E0C99858];
            do
            {
              -[GEOPDCategorySearchParameters _readSupportedRelatedEntitySectionTypes]((uint64_t)v192);
              v204 = *((_QWORD *)v192 + 10);
              if (v204 <= v202)
              {
                v205 = (void *)MEMORY[0x1E0C99DA0];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v202, v204);
                v206 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v205, "exceptionWithName:reason:userInfo:", v203, v206, 0);
                v207 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v207, "raise");

              }
              -[GEOPDCategorySearchParameters addSupportedRelatedEntitySectionType:]((os_unfair_lock_s *)v190);
              ++v202;
            }
            while (v201 != v202);
          }
          v208 = *(_QWORD *)(v190 + 152);
          v209 = (void *)*((_QWORD *)v192 + 19);
          if (v208)
          {
            if (v209)
              -[GEOPDETAFilter mergeFrom:](v208, v209);
          }
          else if (v209)
          {
            -[GEOPDCategorySearchParameters setEtaFilter:](v190, v209);
          }
          -[GEOPDCategorySearchParameters _readSupportedSearchTierTypes]((uint64_t)v192);
          v210 = *((_QWORD *)v192 + 16);
          if (v210)
          {
            v211 = 0;
            v212 = *MEMORY[0x1E0C99858];
            do
            {
              -[GEOPDCategorySearchParameters _readSupportedSearchTierTypes]((uint64_t)v192);
              v213 = *((_QWORD *)v192 + 16);
              if (v213 <= v211)
              {
                v214 = (void *)MEMORY[0x1E0C99DA0];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v211, v213);
                v215 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v214, "exceptionWithName:reason:userInfo:", v212, v215, 0);
                v216 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v216, "raise");

              }
              -[GEOPDCategorySearchParameters addSupportedSearchTierType:]((os_unfair_lock_s *)v190);
              ++v211;
            }
            while (v210 != v211);
          }
          if ((*((_BYTE *)v192 + 288) & 1) != 0)
          {
            *(_DWORD *)(v190 + 260) = *((_DWORD *)v192 + 65);
            *(_DWORD *)(v190 + 288) |= 1u;
          }
          v217 = *(void **)(v190 + 192);
          v218 = *((_QWORD *)v192 + 24);
          if (v217)
          {
            if (v218)
              objc_msgSend(v217, "mergeFrom:");
          }
          else if (v218)
          {
            -[GEOPDCategorySearchParameters setResultRefinementQuery:](v190, *((void **)v192 + 24));
          }
          -[GEOPDCategorySearchParameters _readKnownRefinementTypes]((uint64_t)v192);
          v219 = *((_QWORD *)v192 + 4);
          if (v219)
          {
            v220 = 0;
            v221 = *MEMORY[0x1E0C99858];
            do
            {
              -[GEOPDCategorySearchParameters _readKnownRefinementTypes]((uint64_t)v192);
              v222 = *((_QWORD *)v192 + 4);
              if (v222 <= v220)
              {
                v223 = (void *)MEMORY[0x1E0C99DA0];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v220, v222);
                v224 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v223, "exceptionWithName:reason:userInfo:", v221, v224, 0);
                v225 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v225, "raise");

              }
              -[GEOPDCategorySearchParameters addKnownRefinementType:]((os_unfair_lock_s *)v190);
              ++v220;
            }
            while (v219 != v220);
          }
          if ((*((_BYTE *)v192 + 288) & 0x10) != 0)
          {
            *(_DWORD *)(v190 + 276) = *((_DWORD *)v192 + 69);
            *(_DWORD *)(v190 + 288) |= 0x10u;
          }
          v226 = *(void **)(v190 + 176);
          v227 = *((_QWORD *)v192 + 22);
          if (v226)
          {
            if (v227)
              objc_msgSend(v226, "mergeFrom:");
          }
          else if (v227)
          {
            -[GEOPDCategorySearchParameters setPreviousSearchViewport:](v190, *((void **)v192 + 22));
          }
          -[GEOPDCategorySearchParameters _readSupportedPlaceSummaryFormatTypes]((uint64_t)v192);
          v228 = *((_QWORD *)v192 + 7);
          if (v228)
          {
            v229 = 0;
            v230 = *MEMORY[0x1E0C99858];
            do
            {
              -[GEOPDCategorySearchParameters _readSupportedPlaceSummaryFormatTypes]((uint64_t)v192);
              v231 = *((_QWORD *)v192 + 7);
              if (v231 <= v229)
              {
                v232 = (void *)MEMORY[0x1E0C99DA0];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v229, v231);
                v233 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v232, "exceptionWithName:reason:userInfo:", v230, v233, 0);
                v234 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v234, "raise");

              }
              -[GEOPDCategorySearchParameters addSupportedPlaceSummaryFormatType:]((os_unfair_lock_s *)v190);
              ++v229;
            }
            while (v228 != v229);
          }
          -[GEOPDCategorySearchParameters _readSupportedSearchSectionTypes]((uint64_t)v192);
          v235 = *((_QWORD *)v192 + 13);
          if (v235)
          {
            v236 = 0;
            v237 = *MEMORY[0x1E0C99858];
            do
            {
              -[GEOPDCategorySearchParameters _readSupportedSearchSectionTypes]((uint64_t)v192);
              v238 = *((_QWORD *)v192 + 13);
              if (v238 <= v236)
              {
                v239 = (void *)MEMORY[0x1E0C99DA0];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v236, v238);
                v240 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v239, "exceptionWithName:reason:userInfo:", v237, v240, 0);
                v241 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v241, "raise");

              }
              -[GEOPDCategorySearchParameters addSupportedSearchSectionType:]((os_unfair_lock_s *)v190);
              ++v236;
            }
            while (v235 != v236);
          }
          v242 = *((_DWORD *)v192 + 72);
          if ((v242 & 0x80) != 0)
          {
            *(_BYTE *)(v190 + 285) = *((_BYTE *)v192 + 285);
            *(_DWORD *)(v190 + 288) |= 0x80u;
            v242 = *((_DWORD *)v192 + 72);
          }
          a1 = v689;
          if ((v242 & 0x100) != 0)
          {
            *(_BYTE *)(v190 + 286) = *((_BYTE *)v192 + 286);
            *(_DWORD *)(v190 + 288) |= 0x100u;
          }
          v243 = *(_QWORD *)(v190 + 208);
          v244 = (void *)*((_QWORD *)v192 + 26);
          if (v243)
          {
            if (v244)
              -[GEOPDSearchOriginationInfo mergeFrom:](v243, v244);
          }
          else if (v244)
          {
            -[GEOPDCategorySearchParameters setSearchOriginationInfo:](v190, v244);
          }
          v245 = (void *)*((_QWORD *)v192 + 18);
          if (v245)
            -[GEOPDCategorySearchParameters setEnrichmentCampaignNamespace:](v190, v245);
          v709 = 0u;
          v710 = 0u;
          v707 = 0u;
          v708 = 0u;
          v246 = *((id *)v192 + 25);
          v247 = objc_msgSend(v246, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
          if (v247)
          {
            v248 = v247;
            v249 = *(_QWORD *)v708;
            do
            {
              for (kk = 0; kk != v248; ++kk)
              {
                if (*(_QWORD *)v708 != v249)
                  objc_enumerationMutation(v246);
                -[GEOPDCategorySearchParameters addSearchEnrichmentRevisionMetadata:](v190, *(void **)(*((_QWORD *)&v707 + 1) + 8 * kk));
              }
              v248 = objc_msgSend(v246, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
            }
            while (v248);
          }

          v251 = (void *)*((_QWORD *)v192 + 27);
          if (*(_QWORD *)(v190 + 216))
            v252 = 1;
          else
            v252 = v251 == 0;
          if (!v252)
            -[GEOPDCategorySearchParameters setSearchSessionData:](v190, v251);
          v253 = *(void **)(v190 + 224);
          v254 = *((_QWORD *)v192 + 28);
          if (v253)
          {
            if (v254)
              objc_msgSend(v253, "mergeFrom:");
          }
          else if (v254)
          {
            -[GEOPDCategorySearchParameters setSessionUserActionMetadata:](v190, *((void **)v192 + 28));
          }
          v255 = *(_QWORD *)(v190 + 168);
          v256 = (void *)*((_QWORD *)v192 + 21);
          if (v255)
          {
            if (v256)
              -[GEOPDPaginationParameters mergeFrom:](v255, v256);
          }
          else if (v256)
          {
            -[GEOPDCategorySearchParameters setPaginationParameters:](v190, v256);
          }

          goto LABEL_475;
        }
LABEL_381:
        *(_DWORD *)(v190 + 280) = *((_DWORD *)v192 + 70);
        *(_DWORD *)(v190 + 288) |= 0x20u;
        goto LABEL_382;
      }
    }
    else if ((v196 & 4) == 0)
    {
      goto LABEL_380;
    }
    *(_DWORD *)(v190 + 268) = *((_DWORD *)v192 + 67);
    *(_DWORD *)(v190 + 288) |= 4u;
    if ((*((_DWORD *)v192 + 72) & 0x20) == 0)
      goto LABEL_382;
    goto LABEL_381;
  }
  if (v191)
    -[GEOPDPlaceRequestParameters setCategorySearchParameters:]((uint64_t)a1, v191);
LABEL_475:
  v257 = a1[40];
  v258 = (void *)*((_QWORD *)v690 + 40);
  if (v257)
  {
    if (v258)
    {
      v259 = v258;
      -[GEOPDPopularNearbySearchParameters readAll:]((uint64_t)v259, 0);
      if ((*((_BYTE *)v259 + 60) & 1) != 0)
      {
        *(_DWORD *)(v257 + 52) = *((_DWORD *)v259 + 13);
        *(_BYTE *)(v257 + 60) |= 1u;
      }
      v260 = *(void **)(v257 + 32);
      v261 = *((_QWORD *)v259 + 4);
      if (v260)
      {
        if (v261)
          objc_msgSend(v260, "mergeFrom:");
      }
      else if (v261)
      {
        -[GEOPDPopularNearbySearchParameters setViewportInfo:](v257, *((void **)v259 + 4));
      }
      v262 = (void *)*((_QWORD *)v259 + 3);
      if (v262)
        -[GEOPDPopularNearbySearchParameters setSuggestionEntryMetadata:](v257, v262);
      if ((*((_BYTE *)v259 + 60) & 2) != 0)
      {
        *(_DWORD *)(v257 + 56) = *((_DWORD *)v259 + 14);
        *(_BYTE *)(v257 + 60) |= 2u;
      }

    }
  }
  else if (v258)
  {
    -[GEOPDPlaceRequestParameters setPopularNearbySearchParameters:]((uint64_t)a1, v258);
  }
  v263 = a1[48];
  v264 = (void *)*((_QWORD *)v690 + 48);
  if (v263)
  {
    if (!v264)
      goto LABEL_507;
    v265 = v264;
    v266 = v265;
    if ((*((_BYTE *)v265 + 44) & 1) != 0)
    {
      *(_QWORD *)(v263 + 16) = v265[2];
      *(_BYTE *)(v263 + 44) |= 1u;
    }
    v267 = *(void **)(v263 + 24);
    v268 = *((_QWORD *)v266 + 3);
    if (v267)
    {
      if (v268)
        objc_msgSend(v267, "mergeFrom:");
    }
    else if (v268)
    {
      -[GEOPDSearchZeroKeywordCategorySuggestionParameters setSignificantLocation:](v263, *((void **)v266 + 3));
    }
    v269 = *((_BYTE *)v266 + 44);
    if ((v269 & 2) != 0)
    {
      *(_DWORD *)(v263 + 32) = *((_DWORD *)v266 + 8);
      *(_BYTE *)(v263 + 44) |= 2u;
      v269 = *((_BYTE *)v266 + 44);
      if ((v269 & 4) == 0)
      {
LABEL_504:
        if ((v269 & 8) == 0)
        {
LABEL_506:

          goto LABEL_507;
        }
LABEL_505:
        *(_BYTE *)(v263 + 40) = *((_BYTE *)v266 + 40);
        *(_BYTE *)(v263 + 44) |= 8u;
        goto LABEL_506;
      }
    }
    else if ((*((_BYTE *)v266 + 44) & 4) == 0)
    {
      goto LABEL_504;
    }
    *(_DWORD *)(v263 + 36) = *((_DWORD *)v266 + 9);
    *(_BYTE *)(v263 + 44) |= 4u;
    if ((*((_BYTE *)v266 + 44) & 8) == 0)
      goto LABEL_506;
    goto LABEL_505;
  }
  if (v264)
    -[GEOPDPlaceRequestParameters setSearchZeroKeywordCategorySuggestionParameters:]((uint64_t)a1, v264);
LABEL_507:
  v270 = a1[46];
  v271 = (void *)*((_QWORD *)v690 + 46);
  if (v270)
  {
    if (v271)
    {
      v272 = v271;
      v273 = v272[24];
      if ((v273 & 1) != 0)
      {
        *(_DWORD *)(v270 + 16) = *((_DWORD *)v272 + 4);
        *(_BYTE *)(v270 + 24) |= 1u;
        v273 = v272[24];
      }
      if ((v273 & 2) != 0)
      {
        *(_BYTE *)(v270 + 20) = v272[20];
        *(_BYTE *)(v270 + 24) |= 2u;
      }

    }
  }
  else if (v271)
  {
    -[GEOPDPlaceRequestParameters setSearchFieldPlaceholderParameters:]((uint64_t)a1, v271);
  }
  v274 = a1[11];
  v275 = (void *)*((_QWORD *)v690 + 11);
  if (v274)
  {
    if (v275)
    {
      v276 = v275;
      -[GEOPDBatchPopularNearbySearchParameters readAll:]((uint64_t)v276, 0);
      if ((*((_BYTE *)v276 + 64) & 2) != 0)
      {
        *(_DWORD *)(v274 + 60) = *((_DWORD *)v276 + 15);
        *(_BYTE *)(v274 + 64) |= 2u;
      }
      v277 = *(void **)(v274 + 40);
      v278 = *((_QWORD *)v276 + 5);
      if (v277)
      {
        if (v278)
          objc_msgSend(v277, "mergeFrom:");
      }
      else if (v278)
      {
        -[GEOPDBatchPopularNearbySearchParameters setViewportInfo:](v274, *((void **)v276 + 5));
      }
      if ((*((_BYTE *)v276 + 64) & 1) != 0)
      {
        *(_QWORD *)(v274 + 24) = *((_QWORD *)v276 + 3);
        *(_BYTE *)(v274 + 64) |= 1u;
      }
      v709 = 0u;
      v710 = 0u;
      v707 = 0u;
      v708 = 0u;
      v279 = *((id *)v276 + 4);
      v280 = objc_msgSend(v279, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
      if (v280)
      {
        v281 = v280;
        v282 = *(_QWORD *)v708;
        do
        {
          for (mm = 0; mm != v281; ++mm)
          {
            if (*(_QWORD *)v708 != v282)
              objc_enumerationMutation(v279);
            -[GEOPDBatchPopularNearbySearchParameters addSuggestionEntryMetadata:](v274, *(void **)(*((_QWORD *)&v707 + 1) + 8 * mm));
          }
          v281 = objc_msgSend(v279, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
        }
        while (v281);
      }

    }
  }
  else if (v275)
  {
    -[GEOPDPlaceRequestParameters setBatchPopularNearbySearchParameters:]((uint64_t)a1, v275);
  }
  v284 = a1[56];
  v285 = (void *)*((_QWORD *)v690 + 56);
  if (v284)
  {
    if (v285)
    {
      v286 = v285;
      -[GEOPDVendorSpecificPlaceRefinementParameters readAll:]((uint64_t)v286, 0);
      v287 = *((_WORD *)v286 + 56);
      if ((v287 & 8) != 0)
      {
        *(_DWORD *)(v284 + 108) = *((_DWORD *)v286 + 27);
        *(_WORD *)(v284 + 112) |= 8u;
        v287 = *((_WORD *)v286 + 56);
      }
      if ((v287 & 1) != 0)
      {
        *(_QWORD *)(v284 + 64) = *((_QWORD *)v286 + 8);
        *(_WORD *)(v284 + 112) |= 1u;
      }
      v288 = (void *)*((_QWORD *)v286 + 10);
      if (v288)
        -[GEOPDVendorSpecificPlaceRefinementParameters setVendorId:](v284, v288);
      v289 = (void *)*((_QWORD *)v286 + 5);
      if (v289)
        -[GEOPDVendorSpecificPlaceRefinementParameters setExternalItemId:](v284, v289);
      v290 = *(void **)(v284 + 56);
      v291 = *((_QWORD *)v286 + 7);
      if (v290)
      {
        if (v291)
          objc_msgSend(v290, "mergeFrom:");
      }
      else if (v291)
      {
        -[GEOPDVendorSpecificPlaceRefinementParameters setLocationHint:](v284, *((void **)v286 + 7));
      }
      v292 = *(void **)(v284 + 24);
      v293 = *((_QWORD *)v286 + 3);
      if (v292)
      {
        if (v293)
          objc_msgSend(v292, "mergeFrom:");
      }
      else if (v293)
      {
        -[GEOPDVendorSpecificPlaceRefinementParameters setAddressHint:](v284, *((void **)v286 + 3));
      }
      v294 = (void *)*((_QWORD *)v286 + 9);
      if (v294)
        -[GEOPDVendorSpecificPlaceRefinementParameters setPlaceNameHint:](v284, v294);
      v709 = 0u;
      v710 = 0u;
      v707 = 0u;
      v708 = 0u;
      v295 = *((id *)v286 + 6);
      v296 = objc_msgSend(v295, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
      if (v296)
      {
        v297 = v296;
        v298 = *(_QWORD *)v708;
        do
        {
          for (nn = 0; nn != v297; ++nn)
          {
            if (*(_QWORD *)v708 != v298)
              objc_enumerationMutation(v295);
            -[GEOPDVendorSpecificPlaceRefinementParameters addFormattedAddressLineHint:](v284, *(void **)(*((_QWORD *)&v707 + 1) + 8 * nn));
          }
          v297 = objc_msgSend(v295, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
        }
        while (v297);
      }

      v300 = *((_WORD *)v286 + 56);
      if ((v300 & 4) != 0)
      {
        *(_DWORD *)(v284 + 104) = *((_DWORD *)v286 + 26);
        *(_WORD *)(v284 + 112) |= 4u;
        v300 = *((_WORD *)v286 + 56);
      }
      if ((v300 & 2) != 0)
      {
        *(_DWORD *)(v284 + 100) = *((_DWORD *)v286 + 25);
        *(_WORD *)(v284 + 112) |= 2u;
      }
      v301 = (void *)*((_QWORD *)v286 + 4);
      if (v301)
        -[GEOPDVendorSpecificPlaceRefinementParameters setAddressObjectHint:](v284, v301);

    }
  }
  else if (v285)
  {
    -[GEOPDPlaceRequestParameters setVendorSpecificPlaceRefinementParameters:]((uint64_t)a1, v285);
  }
  v302 = a1[32];
  v303 = (void *)*((_QWORD *)v690 + 32);
  if (v302)
  {
    if (v303)
    {
      v304 = v303;
      -[GEOPDNearbySearchParameters readAll:]((uint64_t)v304, 0);
      v305 = *((_BYTE *)v304 + 60);
      if ((v305 & 2) != 0)
      {
        *(_DWORD *)(v302 + 56) = *((_DWORD *)v304 + 14);
        *(_BYTE *)(v302 + 60) |= 2u;
        v305 = *((_BYTE *)v304 + 60);
      }
      if ((v305 & 1) != 0)
      {
        *(_DWORD *)(v302 + 52) = *((_DWORD *)v304 + 13);
        *(_BYTE *)(v302 + 60) |= 1u;
      }
      v306 = *(void **)(v302 + 32);
      v307 = *((_QWORD *)v304 + 4);
      if (v306)
      {
        if (v307)
          objc_msgSend(v306, "mergeFrom:");
      }
      else if (v307)
      {
        -[GEOPDNearbySearchParameters setViewportInfo:](v302, *((void **)v304 + 4));
      }
      v308 = *(_QWORD *)(v302 + 24);
      v309 = (void *)*((_QWORD *)v304 + 3);
      if (v308)
      {
        if (v309)
        {
          v310 = v309;
          v707 = 0u;
          v708 = 0u;
          v709 = 0u;
          v710 = 0u;
          v311 = v310[2];
          v312 = objc_msgSend(v311, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
          if (v312)
          {
            v313 = v312;
            v314 = *(_QWORD *)v708;
            do
            {
              for (i1 = 0; i1 != v313; ++i1)
              {
                if (*(_QWORD *)v708 != v314)
                  objc_enumerationMutation(v311);
                -[GEOPDNearbySearchFilter addIncludedCategoryFilter:](v308, *(void **)(*((_QWORD *)&v707 + 1) + 8 * i1));
              }
              v313 = objc_msgSend(v311, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
            }
            while (v313);
          }

          if ((*((_BYTE *)v310 + 28) & 1) != 0)
          {
            *(_DWORD *)(v308 + 24) = *((_DWORD *)v310 + 6);
            *(_BYTE *)(v308 + 28) |= 1u;
          }

        }
      }
      else if (v309)
      {
        -[GEOPDNearbySearchParameters setNearbySearchFilter:](v302, v309);
      }

    }
  }
  else if (v303)
  {
    -[GEOPDPlaceRequestParameters setNearbySearchParameters:]((uint64_t)a1, v303);
  }
  v316 = a1[3];
  v317 = (void *)*((_QWORD *)v690 + 3);
  if (v316)
  {
    if (v317)
    {
      v318 = v317;
      -[GEOPDAddressObjectGeocodingParameters readAll:]((uint64_t)v318, 0);
      v319 = (void *)*((_QWORD *)v318 + 3);
      if (v319)
        -[GEOPDAddressObjectGeocodingParameters setAddressObject:](v316, v319);
      if ((*((_BYTE *)v318 + 56) & 1) != 0)
      {
        *(_DWORD *)(v316 + 52) = *((_DWORD *)v318 + 13);
        *(_BYTE *)(v316 + 56) |= 1u;
      }
      v320 = *(void **)(v316 + 32);
      v321 = *((_QWORD *)v318 + 4);
      if (v320)
      {
        if (v321)
          objc_msgSend(v320, "mergeFrom:");
      }
      else if (v321)
      {
        -[GEOPDAddressObjectGeocodingParameters setViewportInfo:](v316, *((void **)v318 + 4));
      }

    }
  }
  else if (v317)
  {
    -[GEOPDPlaceRequestParameters setAddressObjectGeocodingParameters:]((uint64_t)a1, v317);
  }
  v322 = a1[49];
  v323 = (void *)*((_QWORD *)v690 + 49);
  if (!v322)
  {
    if (v323)
      -[GEOPDPlaceRequestParameters setSearchZeroKeywordWithSearchResultsSuggestionParameters:]((uint64_t)a1, v323);
    goto LABEL_631;
  }
  if (v323)
  {
    v324 = v323;
    v325 = v324[32];
    if ((v325 & 4) != 0)
    {
      *(_DWORD *)(v322 + 24) = *((_DWORD *)v324 + 6);
      *(_BYTE *)(v322 + 32) |= 4u;
      v325 = v324[32];
    }
    if ((v325 & 8) != 0)
    {
      *(_DWORD *)(v322 + 28) = *((_DWORD *)v324 + 7);
      *(_BYTE *)(v322 + 32) |= 8u;
      v325 = v324[32];
      if ((v325 & 1) == 0)
      {
LABEL_626:
        if ((v325 & 2) == 0)
        {
LABEL_628:

          goto LABEL_631;
        }
LABEL_627:
        *(_DWORD *)(v322 + 20) = *((_DWORD *)v324 + 5);
        *(_BYTE *)(v322 + 32) |= 2u;
        goto LABEL_628;
      }
    }
    else if ((v325 & 1) == 0)
    {
      goto LABEL_626;
    }
    *(_DWORD *)(v322 + 16) = *((_DWORD *)v324 + 4);
    *(_BYTE *)(v322 + 32) |= 1u;
    if ((v324[32] & 2) == 0)
      goto LABEL_628;
    goto LABEL_627;
  }
LABEL_631:
  v326 = a1[21];
  v327 = (void *)*((_QWORD *)v690 + 21);
  if (v326)
  {
    if (v327)
    {
      v328 = v327;
      -[GEOPDExternalTransitLookupParameters readAll:]((uint64_t)v328, 0);
      if ((*((_BYTE *)v328 + 68) & 1) != 0)
      {
        *(_QWORD *)(v326 + 48) = *((_QWORD *)v328 + 6);
        *(_BYTE *)(v326 + 68) |= 1u;
      }
      v329 = *(void **)(v326 + 40);
      v330 = *((_QWORD *)v328 + 5);
      if (v329)
      {
        if (v330)
          objc_msgSend(v329, "mergeFrom:");
      }
      else if (v330)
      {
        -[GEOPDExternalTransitLookupParameters setTransactionLocation:](v326, *((void **)v328 + 5));
      }
      v331 = (void *)*((_QWORD *)v328 + 4);
      if (v331)
        -[GEOPDExternalTransitLookupParameters setSourceId:](v326, v331);
      v709 = 0u;
      v710 = 0u;
      v707 = 0u;
      v708 = 0u;
      v332 = *((id *)v328 + 3);
      v333 = objc_msgSend(v332, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
      if (v333)
      {
        v334 = v333;
        v335 = *(_QWORD *)v708;
        do
        {
          for (i2 = 0; i2 != v334; ++i2)
          {
            if (*(_QWORD *)v708 != v335)
              objc_enumerationMutation(v332);
            -[GEOPDExternalTransitLookupParameters addExternalTransitStationCode:](v326, *(void **)(*((_QWORD *)&v707 + 1) + 8 * i2));
          }
          v334 = objc_msgSend(v332, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
        }
        while (v334);
      }

    }
  }
  else if (v327)
  {
    -[GEOPDPlaceRequestParameters setExternalTransitLookupParameters:]((uint64_t)a1, v327);
  }
  v337 = a1[22];
  v338 = (void *)*((_QWORD *)v690 + 22);
  if (v337)
  {
    if (v338)
    {
      v339 = v338;
      -[GEOPDFeatureIdGeocodingParameters readAll:]((uint64_t)v339, 0);
      if ((*((_BYTE *)v339 + 80) & 1) != 0)
      {
        *(_QWORD *)(v337 + 48) = *((_QWORD *)v339 + 6);
        *(_BYTE *)(v337 + 80) |= 1u;
      }
      -[GEOPDFeatureIdGeocodingParameters _readEncryptedFeatureIds]((uint64_t)v339);
      v340 = *((_QWORD *)v339 + 4);
      if (v340)
      {
        v341 = 0;
        v342 = *MEMORY[0x1E0C99858];
        do
        {
          -[GEOPDFeatureIdGeocodingParameters _readEncryptedFeatureIds]((uint64_t)v339);
          v343 = *((_QWORD *)v339 + 4);
          if (v343 <= v341)
          {
            v344 = (void *)MEMORY[0x1E0C99DA0];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v341, v343);
            v345 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v344, "exceptionWithName:reason:userInfo:", v342, v345, 0);
            v346 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v346, "raise");

          }
          -[GEOPDFeatureIdGeocodingParameters addEncryptedFeatureId:](v337);
          ++v341;
        }
        while (v340 != v341);
      }
      v347 = *(void **)(v337 + 56);
      v348 = *((_QWORD *)v339 + 7);
      if (v347)
      {
        a1 = v689;
        if (v348)
          objc_msgSend(v347, "mergeFrom:");
      }
      else
      {
        a1 = v689;
        if (v348)
          -[GEOPDFeatureIdGeocodingParameters setLocation:](v337, *((void **)v339 + 7));
      }
      if ((*((_BYTE *)v339 + 80) & 2) != 0)
      {
        *(_DWORD *)(v337 + 76) = *((_DWORD *)v339 + 19);
        *(_BYTE *)(v337 + 80) |= 2u;
      }

    }
  }
  else if (v338)
  {
    -[GEOPDPlaceRequestParameters setFeatureIdGeocodingParameters:]((uint64_t)a1, v338);
  }
  v349 = a1[29];
  v350 = (void *)*((_QWORD *)v690 + 29);
  if (v349)
  {
    if (v350)
    {
      v351 = v350;
      v352 = v351;
      if ((*((_BYTE *)v351 + 32) & 1) != 0)
      {
        *(_DWORD *)(v349 + 24) = *((_DWORD *)v351 + 6);
        *(_BYTE *)(v349 + 32) |= 1u;
      }
      v709 = 0u;
      v710 = 0u;
      v707 = 0u;
      v708 = 0u;
      v353 = *((id *)v351 + 2);
      v354 = objc_msgSend(v353, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
      if (v354)
      {
        v355 = v354;
        v356 = *(_QWORD *)v708;
        do
        {
          for (i3 = 0; i3 != v355; ++i3)
          {
            if (*(_QWORD *)v708 != v356)
              objc_enumerationMutation(v353);
            -[GEOPDMapsIdentifierPlaceLookupParameters addMapsId:](v349, *(void **)(*((_QWORD *)&v707 + 1) + 8 * i3));
          }
          v355 = objc_msgSend(v353, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
        }
        while (v355);
      }

      if ((v352[32] & 2) != 0)
      {
        *(_BYTE *)(v349 + 28) = v352[28];
        *(_BYTE *)(v349 + 32) |= 2u;
      }

    }
  }
  else if (v350)
  {
    -[GEOPDPlaceRequestParameters setMapsIdentifierPlaceLookupParameters:]((uint64_t)a1, v350);
  }
  v358 = a1[12];
  v359 = (void *)*((_QWORD *)v690 + 12);
  if (v358)
  {
    if (v359)
    {
      v360 = v359;
      -[GEOPDBatchReverseGeocodingParameters readAll:]((uint64_t)v360, 0);
      v709 = 0u;
      v710 = 0u;
      v707 = 0u;
      v708 = 0u;
      v361 = v360[6];
      v362 = objc_msgSend(v361, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
      if (v362)
      {
        v363 = v362;
        v364 = *(_QWORD *)v708;
        do
        {
          for (i4 = 0; i4 != v363; ++i4)
          {
            if (*(_QWORD *)v708 != v364)
              objc_enumerationMutation(v361);
            -[GEOPDBatchReverseGeocodingParameters addAssetLocation:](v358, *(void **)(*((_QWORD *)&v707 + 1) + 8 * i4));
          }
          v363 = objc_msgSend(v361, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
        }
        while (v363);
      }

      -[GEOPDBatchReverseGeocodingParameters _readAdditionalPlaceTypes]((uint64_t)v360);
      v366 = (char *)v360[4];
      if (v366)
      {
        v367 = 0;
        v368 = *MEMORY[0x1E0C99858];
        do
        {
          -[GEOPDBatchReverseGeocodingParameters _readAdditionalPlaceTypes]((uint64_t)v360);
          v369 = (char *)v360[4];
          if (v369 <= v367)
          {
            v370 = (void *)MEMORY[0x1E0C99DA0];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v367, v369);
            v371 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v370, "exceptionWithName:reason:userInfo:", v368, v371, 0);
            v372 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v372, "raise");

          }
          -[GEOPDBatchReverseGeocodingParameters addAdditionalPlaceType:](v358);
          ++v367;
        }
        while (v366 != v367);
      }

      a1 = v689;
    }
  }
  else if (v359)
  {
    -[GEOPDPlaceRequestParameters setBatchReverseGeocodingParameters:]((uint64_t)a1, v359);
  }
  v373 = a1[14];
  v374 = (_QWORD *)*((_QWORD *)v690 + 14);
  if (v373)
  {
    if (v374)
    {
      v375 = (void *)v374[2];
      if (v375)
        -[GEOPDBrandLookupParameters setImessageUid:](v373, v375);
    }
  }
  else if (v374)
  {
    -[GEOPDPlaceRequestParameters setBrandLookupParameters:]((uint64_t)a1, v374);
  }
  v376 = a1[57];
  v377 = (void *)*((_QWORD *)v690 + 57);
  if (v376)
  {
    if (v377)
    {
      v378 = v377;
      v707 = 0u;
      v708 = 0u;
      v709 = 0u;
      v710 = 0u;
      v379 = v378[2];
      v380 = objc_msgSend(v379, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
      if (v380)
      {
        v381 = v380;
        v382 = *(_QWORD *)v708;
        do
        {
          for (i5 = 0; i5 != v381; ++i5)
          {
            if (*(_QWORD *)v708 != v382)
              objc_enumerationMutation(v379);
            -[GEOPDWifiFingerprintParameters addMeasurement:](v376, *(void **)(*((_QWORD *)&v707 + 1) + 8 * i5));
          }
          v381 = objc_msgSend(v379, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
        }
        while (v381);
      }

      if ((*((_BYTE *)v378 + 28) & 1) != 0)
      {
        *(_DWORD *)(v376 + 24) = *((_DWORD *)v378 + 6);
        *(_BYTE *)(v376 + 28) |= 1u;
      }

    }
  }
  else if (v377)
  {
    -[GEOPDPlaceRequestParameters setWifiFingerprintParameters:]((uint64_t)a1, v377);
  }
  v384 = a1[26];
  v385 = (_QWORD *)*((_QWORD *)v690 + 26);
  if (v384)
  {
    if (v385)
    {
      v386 = (void *)v385[2];
      if (v386)
        -[GEOPDIpGeoLookupParameters setIpAddress:](v384, v386);
    }
  }
  else if (v385)
  {
    -[GEOPDPlaceRequestParameters setIpGeoLookupParameters:]((uint64_t)a1, v385);
  }
  v387 = a1[24];
  v388 = (void *)*((_QWORD *)v690 + 24);
  if (v387)
  {
    if (v388)
    {
      v389 = v388;
      v390 = v389;
      if (((_BYTE)v389[4] & 1) != 0)
      {
        *(_QWORD *)(v387 + 16) = v389[2];
        *(_BYTE *)(v387 + 32) |= 1u;
      }
      v391 = *(void **)(v387 + 24);
      v392 = v390[3];
      if (v391)
      {
        if (v392)
          objc_msgSend(v391, "mergeFrom:");
      }
      else if (v392)
      {
        -[GEOPDGroundViewLabelParameters setLocation:](v387, v390[3]);
      }

    }
  }
  else if (v388)
  {
    -[GEOPDPlaceRequestParameters setGroundViewLabelParameters:]((uint64_t)a1, v388);
  }
  v393 = a1[13];
  v394 = (void *)*((_QWORD *)v690 + 13);
  if (v393)
  {
    if (v394)
    {
      v395 = v394;
      -[GEOPDBatchSpatialLookupParameters readAll:]((uint64_t)v395, 0);
      v705 = 0u;
      v706 = 0u;
      v703 = 0u;
      v704 = 0u;
      v396 = v395[4];
      v397 = objc_msgSend(v396, "countByEnumeratingWithState:objects:count:", &v703, v711, 16);
      if (v397)
      {
        v398 = v397;
        v399 = *(_QWORD *)v704;
        do
        {
          for (i6 = 0; i6 != v398; ++i6)
          {
            if (*(_QWORD *)v704 != v399)
              objc_enumerationMutation(v396);
            -[GEOPDBatchSpatialLookupParameters addSpatialPlaceLookup:](v393, *(void **)(*((_QWORD *)&v703 + 1) + 8 * i6));
          }
          v398 = objc_msgSend(v396, "countByEnumeratingWithState:objects:count:", &v703, v711, 16);
        }
        while (v398);
      }

      v701 = 0u;
      v702 = 0u;
      v699 = 0u;
      v700 = 0u;
      v401 = v395[3];
      v402 = objc_msgSend(v401, "countByEnumeratingWithState:objects:count:", &v699, &v707, 16);
      if (v402)
      {
        v403 = v402;
        v404 = *(_QWORD *)v700;
        do
        {
          for (i7 = 0; i7 != v403; ++i7)
          {
            if (*(_QWORD *)v700 != v404)
              objc_enumerationMutation(v401);
            -[GEOPDBatchSpatialLookupParameters addSpatialEventLookup:](v393, *(void **)(*((_QWORD *)&v699 + 1) + 8 * i7));
          }
          v403 = objc_msgSend(v401, "countByEnumeratingWithState:objects:count:", &v699, &v707, 16);
        }
        while (v403);
      }

    }
  }
  else if (v394)
  {
    -[GEOPDPlaceRequestParameters setBatchSpatialLookupParameters:]((uint64_t)a1, v394);
  }
  v406 = (void *)*((_QWORD *)v690 + 55);
  if (a1[55])
  {
    if (v406)
    {
      v407 = v406;
      v408 = v407[3];
      if (v408)
      {
        v409 = 0;
        v410 = *MEMORY[0x1E0C99858];
        do
        {
          v411 = v407[3];
          if (v411 <= v409)
          {
            v412 = (void *)MEMORY[0x1E0C99DA0];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v409, v411);
            v413 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v412, "exceptionWithName:reason:userInfo:", v410, v413, 0);
            v414 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v414, "raise");

          }
          PBRepeatedUInt64Add();
          ++v409;
        }
        while (v408 != v409);
      }

      a1 = v689;
    }
  }
  else if (v406)
  {
    -[GEOPDPlaceRequestParameters setTransitVehiclePositionParameters:]((uint64_t)a1, v406);
  }
  v415 = a1[34];
  v416 = (void *)*((_QWORD *)v690 + 34);
  if (v415)
  {
    if (v416)
    {
      v417 = v416;
      -[GEOPDPlaceCollectionLookupParameters readAll:]((uint64_t)v417, 0);
      v418 = *(void **)(v415 + 24);
      v419 = v417[3];
      if (v418)
      {
        if (v419)
          objc_msgSend(v418, "mergeFrom:");
      }
      else if (v419)
      {
        -[GEOPDPlaceCollectionLookupParameters setCenter:](v415, v417[3]);
      }
      v709 = 0u;
      v710 = 0u;
      v707 = 0u;
      v708 = 0u;
      v420 = v417[4];
      v421 = objc_msgSend(v420, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
      if (v421)
      {
        v422 = v421;
        v423 = *(_QWORD *)v708;
        do
        {
          for (i8 = 0; i8 != v422; ++i8)
          {
            if (*(_QWORD *)v708 != v423)
              objc_enumerationMutation(v420);
            -[GEOPDPlaceCollectionLookupParameters addCollectionId:](v415, *(void **)(*((_QWORD *)&v707 + 1) + 8 * i8));
          }
          v422 = objc_msgSend(v420, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
        }
        while (v422);
      }

    }
  }
  else if (v416)
  {
    -[GEOPDPlaceRequestParameters setPlaceCollectionLookupParameter:]((uint64_t)a1, v416);
  }
  v425 = (void *)a1[54];
  v426 = *((_QWORD *)v690 + 54);
  if (v425)
  {
    if (v426)
      objc_msgSend(v425, "mergeFrom:");
  }
  else if (v426)
  {
    -[GEOPDPlaceRequestParameters setTransitScheduleLookupParameter:]((uint64_t)a1, *((void **)v690 + 54));
  }
  v427 = a1[9];
  v428 = (id *)*((_QWORD *)v690 + 9);
  if (v427)
  {
    if (v428)
    {
      v707 = 0u;
      v708 = 0u;
      v709 = 0u;
      v710 = 0u;
      v429 = v428[2];
      v430 = objc_msgSend(v429, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
      if (v430)
      {
        v431 = v430;
        v432 = *(_QWORD *)v708;
        do
        {
          for (i9 = 0; i9 != v431; ++i9)
          {
            if (*(_QWORD *)v708 != v432)
              objc_enumerationMutation(v429);
            -[GEOPDBatchCategoryLookupParameters addCategoryLookupParameter:](v427, *(void **)(*((_QWORD *)&v707 + 1) + 8 * i9));
          }
          v431 = objc_msgSend(v429, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
        }
        while (v431);
      }

    }
  }
  else if (v428)
  {
    -[GEOPDPlaceRequestParameters setBatchCategoryLookupParameters:]((uint64_t)a1, v428);
  }
  v434 = a1[10];
  v435 = (id *)*((_QWORD *)v690 + 10);
  if (v434)
  {
    if (v435)
    {
      v707 = 0u;
      v708 = 0u;
      v709 = 0u;
      v710 = 0u;
      v436 = v435[2];
      v437 = objc_msgSend(v436, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
      if (v437)
      {
        v438 = v437;
        v439 = *(_QWORD *)v708;
        do
        {
          for (i10 = 0; i10 != v438; ++i10)
          {
            if (*(_QWORD *)v708 != v439)
              objc_enumerationMutation(v436);
            -[GEOPDBatchMerchantLookupBrandParameters addMerchantLookupBrandParameter:](v434, *(void **)(*((_QWORD *)&v707 + 1) + 8 * i10));
          }
          v438 = objc_msgSend(v436, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
        }
        while (v438);
      }

    }
  }
  else if (v435)
  {
    -[GEOPDPlaceRequestParameters setBatchMerchantLookupBrandParameters:]((uint64_t)a1, v435);
  }
  v441 = a1[18];
  v442 = (void *)*((_QWORD *)v690 + 18);
  if (v441)
  {
    if (v442)
    {
      v443 = v442;
      v444 = (void *)v443[2];
      if (v444)
        -[GEOPDChildPlaceLookupByCategoryParameters setCategoryMetadata:](v441, v444);
      if ((v443[4] & 1) != 0)
      {
        *(_QWORD *)(v441 + 24) = v443[3];
        *(_BYTE *)(v441 + 32) |= 1u;
      }

    }
  }
  else if (v442)
  {
    -[GEOPDPlaceRequestParameters setChildPlaceLookupByCategoryParameters:]((uint64_t)a1, v442);
  }
  v445 = a1[19];
  v446 = (void *)*((_QWORD *)v690 + 19);
  if (v445)
  {
    if (v446)
      -[GEOPDCollectionSuggestionParameters mergeFrom:](v445, v446);
  }
  else if (v446)
  {
    -[GEOPDPlaceRequestParameters setCollectionSuggestionParameters:]((uint64_t)a1, v446);
  }
  v447 = (_QWORD *)a1[30];
  v448 = (void *)*((_QWORD *)v690 + 30);
  if (v447)
  {
    if (v448)
    {
      v449 = v448;
      -[GEOPDMapsSearchHomeParameters readAll:]((uint64_t)v449, 0);
      -[GEOPDMapsSearchHomeParameters _readSupportedSectionTypes]((uint64_t)v449);
      v450 = v449[4];
      if (v450)
      {
        v451 = 0;
        v452 = *MEMORY[0x1E0C99858];
        do
        {
          -[GEOPDMapsSearchHomeParameters _readSupportedSectionTypes]((uint64_t)v449);
          v453 = v449[4];
          if (v453 <= v451)
          {
            v454 = (void *)MEMORY[0x1E0C99DA0];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v451, v453);
            v455 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v454, "exceptionWithName:reason:userInfo:", v452, v455, 0);
            v456 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v456, "raise");

          }
          -[GEOPDMapsSearchHomeParameters addSupportedSectionType:]((uint64_t)v447);
          ++v451;
        }
        while (v450 != v451);
      }
      v457 = v447[10];
      v458 = (void *)v449[10];
      if (v457)
      {
        if (v458)
          -[GEOPDSearchBrowseCategorySuggestionParameters mergeFrom:](v457, v458);
      }
      else if (v458)
      {
        -[GEOPDMapsSearchHomeParameters setSearchBrowseCategorySuggestionParameters:]((uint64_t)v447, v458);
      }
      v459 = v447[6];
      v460 = (void *)v449[6];
      if (v459)
      {
        a1 = v689;
        if (v460)
          -[GEOPDCollectionSuggestionParameters mergeFrom:](v459, v460);
      }
      else
      {
        a1 = v689;
        if (v460)
          -[GEOPDMapsSearchHomeParameters setCollectionSuggestionParameters:]((uint64_t)v447, v460);
      }
      v461 = v447[9];
      v462 = (void *)v449[9];
      if (v461)
      {
        if (v462)
          -[GEOPDPublisherSuggestionParameters mergeFrom:](v461, v462);
      }
      else if (v462)
      {
        -[GEOPDMapsSearchHomeParameters setPublisherSuggestionParameters:]((uint64_t)v447, v462);
      }
      v463 = v447[8];
      v464 = (void *)v449[8];
      if (v463)
      {
        if (v464)
        {
          v465 = v464;
          -[GEOPDPlaceSuggestionParameters readAll:]((uint64_t)v465, 0);
          v466 = *(void **)(v463 + 40);
          v467 = v465[5];
          if (v466)
          {
            if (v467)
              objc_msgSend(v466, "mergeFrom:");
          }
          else if (v467)
          {
            -[GEOPDPlaceSuggestionParameters setViewportInfo:](v463, v465[5]);
          }
          v705 = 0u;
          v706 = 0u;
          v703 = 0u;
          v704 = 0u;
          v468 = v465[3];
          v469 = objc_msgSend(v468, "countByEnumeratingWithState:objects:count:", &v703, v711, 16);
          if (v469)
          {
            v470 = v469;
            v471 = *(_QWORD *)v704;
            do
            {
              for (i11 = 0; i11 != v470; ++i11)
              {
                if (*(_QWORD *)v704 != v471)
                  objc_enumerationMutation(v468);
                -[GEOPDPlaceSuggestionParameters addMapsCategoryId:](v463, *(void **)(*((_QWORD *)&v703 + 1) + 8 * i11));
              }
              v470 = objc_msgSend(v468, "countByEnumeratingWithState:objects:count:", &v703, v711, 16);
            }
            while (v470);
          }

          v701 = 0u;
          v702 = 0u;
          v699 = 0u;
          v700 = 0u;
          v473 = v465[4];
          v474 = objc_msgSend(v473, "countByEnumeratingWithState:objects:count:", &v699, &v707, 16);
          if (v474)
          {
            v475 = v474;
            v476 = *(_QWORD *)v700;
            do
            {
              for (i12 = 0; i12 != v475; ++i12)
              {
                if (*(_QWORD *)v700 != v476)
                  objc_enumerationMutation(v473);
                -[GEOPDPlaceSuggestionParameters addSuggestedPlaceId:](v463, *(void **)(*((_QWORD *)&v699 + 1) + 8 * i12));
              }
              v475 = objc_msgSend(v473, "countByEnumeratingWithState:objects:count:", &v699, &v707, 16);
            }
            while (v475);
          }

        }
      }
      else if (v464)
      {
        -[GEOPDMapsSearchHomeParameters setPlaceSuggestionParameters:]((uint64_t)v447, v464);
      }
      v478 = v447[7];
      v479 = (void *)v449[7];
      if (v478)
      {
        if (v479)
        {
          v480 = v479;
          v481 = *(void **)(v478 + 16);
          v482 = v480[2];
          if (v481)
          {
            if (v482)
              objc_msgSend(v481, "mergeFrom:");
          }
          else if (v482)
          {
            -[GEOPDGuidesLocationsSuggestionParameters setViewportInfo:](v478, v480[2]);
          }

        }
      }
      else if (v479)
      {
        -[GEOPDMapsSearchHomeParameters setGuidesLocationsSuggestionParameters:]((uint64_t)v447, v479);
      }
      v483 = v447[11];
      v484 = (void *)v449[11];
      if (v483)
      {
        if (v484)
          -[GEOPDSearchOriginationInfo mergeFrom:](v483, v484);
      }
      else if (v484)
      {
        -[GEOPDMapsSearchHomeParameters setSearchOriginationInfo:]((uint64_t)v447, v484);
      }

    }
  }
  else if (v448)
  {
    -[GEOPDPlaceRequestParameters setMapsSearchHomeParameters:]((uint64_t)a1, v448);
  }
  v485 = a1[36];
  v486 = (void *)*((_QWORD *)v690 + 36);
  if (v485)
  {
    if (v486)
      -[GEOPDPlaceQuestionnaireLookupParameters mergeFrom:](v485, (uint64_t)v486);
  }
  else if (v486)
  {
    -[GEOPDPlaceRequestParameters setPlaceQuestionnaireLookupParameters:]((uint64_t)a1, v486);
  }
  v487 = a1[41];
  v488 = (void *)*((_QWORD *)v690 + 41);
  if (v487)
  {
    if (v488)
    {
      v489 = v488;
      -[GEOPDPublisherViewParameters readAll:]((uint64_t)v489, 0);
      v490 = *(void **)(v487 + 24);
      v491 = *((_QWORD *)v489 + 3);
      if (v490)
      {
        if (v491)
          objc_msgSend(v490, "mergeFrom:");
      }
      else if (v491)
      {
        -[GEOPDPublisherViewParameters setPublisherId:](v487, *((void **)v489 + 3));
      }
      if ((*((_BYTE *)v489 + 64) & 1) != 0)
      {
        *(_DWORD *)(v487 + 60) = *((_DWORD *)v489 + 15);
        *(_BYTE *)(v487 + 64) |= 1u;
      }
      v492 = *(_QWORD *)(v487 + 32);
      v493 = (void *)*((_QWORD *)v489 + 4);
      if (v492)
      {
        if (v493)
        {
          v494 = v493;
          -[GEOPDPublisherViewResultFilter readAll:]((uint64_t)v494, 0);
          if ((v494[14] & 1) != 0)
          {
            *(_DWORD *)(v492 + 52) = v494[13];
            *(_BYTE *)(v492 + 56) |= 1u;
          }
          v495 = *(_QWORD *)(v492 + 24);
          v496 = (void *)*((_QWORD *)v494 + 3);
          if (v495)
          {
            if (v496)
            {
              v497 = v496;
              v498 = *(void **)(v495 + 16);
              v499 = v497[2];
              if (v498)
              {
                if (v499)
                  objc_msgSend(v498, "mergeFrom:");
              }
              else if (v499)
              {
                -[GEOPDPublisherViewResultFilterAddress setGeoId:](v495, v497[2]);
              }

            }
          }
          else if (v496)
          {
            -[GEOPDPublisherViewResultFilter setFilterAddress:](v492, v496);
          }
          v500 = *(_QWORD *)(v492 + 32);
          v501 = (void *)*((_QWORD *)v494 + 4);
          if (v500)
          {
            if (v501)
            {
              v502 = v501;
              v503 = *(_QWORD *)(v500 + 16);
              v504 = (void *)v502[2];
              if (v503)
              {
                if (v504)
                  -[GEOPDRelatedSearchSuggestion mergeFrom:](v503, v504);
              }
              else if (v504)
              {
                -[GEOPDPublisherViewResultFilterKeyword setRelatedSearchSuggestion:](v500, v504);
              }

            }
          }
          else if (v501)
          {
            -[GEOPDPublisherViewResultFilter setFilterKeyword:](v492, v501);
          }

        }
      }
      else if (v493)
      {
        -[GEOPDPublisherViewParameters setResultFilter:](v487, v493);
      }
      v505 = *(void **)(v487 + 40);
      v506 = *((_QWORD *)v489 + 5);
      if (v505)
      {
        if (v506)
          objc_msgSend(v505, "mergeFrom:");
      }
      else if (v506)
      {
        -[GEOPDPublisherViewParameters setViewportInfo:](v487, *((void **)v489 + 5));
      }

    }
  }
  else if (v488)
  {
    -[GEOPDPlaceRequestParameters setPublisherViewParameters:]((uint64_t)a1, v488);
  }
  v507 = a1[6];
  v508 = (void *)*((_QWORD *)v690 + 6);
  if (v507)
  {
    if (v508)
    {
      v509 = v508;
      -[GEOPDAllCollectionsViewParameters readAll:]((uint64_t)v509, 0);
      v510 = *(_QWORD *)(v507 + 24);
      v511 = (void *)*((_QWORD *)v509 + 3);
      if (v510)
      {
        if (v511)
          -[GEOPDPublisherSuggestionParameters mergeFrom:](v510, v511);
      }
      else if (v511)
      {
        -[GEOPDAllCollectionsViewParameters setPublisherSuggestionParameters:](v507, v511);
      }
      if ((*((_BYTE *)v509 + 64) & 1) != 0)
      {
        *(_DWORD *)(v507 + 60) = *((_DWORD *)v509 + 15);
        *(_BYTE *)(v507 + 64) |= 1u;
      }
      v512 = *(_QWORD *)(v507 + 32);
      v513 = (void *)*((_QWORD *)v509 + 4);
      if (v512)
      {
        if (v513)
        {
          v514 = v513;
          -[GEOPDAllCollectionsViewResultFilter readAll:]((uint64_t)v514, 0);
          if ((v514[14] & 1) != 0)
          {
            *(_DWORD *)(v512 + 52) = v514[13];
            *(_BYTE *)(v512 + 56) |= 1u;
          }
          v515 = *(_QWORD *)(v512 + 24);
          v516 = (void *)*((_QWORD *)v514 + 3);
          if (v515)
          {
            if (v516)
            {
              v517 = v516;
              v518 = *(void **)(v515 + 16);
              v519 = v517[2];
              if (v518)
              {
                if (v519)
                  objc_msgSend(v518, "mergeFrom:");
              }
              else if (v519)
              {
                -[GEOPDAllCollectionsViewResultFilterTypeAddress setGeoId:](v515, v517[2]);
              }

            }
          }
          else if (v516)
          {
            -[GEOPDAllCollectionsViewResultFilter setFilterAddress:](v512, v516);
          }
          v520 = *(_QWORD *)(v512 + 32);
          v521 = (void *)*((_QWORD *)v514 + 4);
          if (v520)
          {
            if (v521)
            {
              v522 = v521;
              v523 = *(_QWORD *)(v520 + 16);
              v524 = (void *)v522[2];
              if (v523)
              {
                if (v524)
                  -[GEOPDRelatedSearchSuggestion mergeFrom:](v523, v524);
              }
              else if (v524)
              {
                -[GEOPDAllCollectionsViewResultFilterTypeKeyword setRelatedSearchSuggestion:](v520, v524);
              }

            }
          }
          else if (v521)
          {
            -[GEOPDAllCollectionsViewResultFilter setFilterKeyword:](v512, v521);
          }

        }
      }
      else if (v513)
      {
        -[GEOPDAllCollectionsViewParameters setResultFilter:](v507, v513);
      }
      v525 = *(void **)(v507 + 40);
      v526 = *((_QWORD *)v509 + 5);
      if (v525)
      {
        if (v526)
          objc_msgSend(v525, "mergeFrom:");
      }
      else if (v526)
      {
        -[GEOPDAllCollectionsViewParameters setViewportInfo:](v507, *((void **)v509 + 5));
      }

    }
  }
  else if (v508)
  {
    -[GEOPDPlaceRequestParameters setAllCollectionsViewParameters:]((uint64_t)a1, v508);
  }
  v527 = a1[5];
  v528 = (void *)*((_QWORD *)v690 + 5);
  if (v527)
  {
    if (v528)
    {
      v529 = v528;
      -[GEOPDAirportEntityPlaceLookupParameters readAll:]((uint64_t)v529, 0);
      v530 = (void *)v529[3];
      if (v530)
        -[GEOPDAirportEntityPlaceLookupParameters setAirportCode:](v527, v530);
      v531 = (void *)v529[5];
      if (v531)
        -[GEOPDAirportEntityPlaceLookupParameters setTerminalCode:](v527, v531);
      v532 = (void *)v529[4];
      if (v532)
        -[GEOPDAirportEntityPlaceLookupParameters setGateCode:](v527, v532);

    }
  }
  else if (v528)
  {
    -[GEOPDPlaceRequestParameters setAirportEntityPlaceLookupParameters:]((uint64_t)a1, v528);
  }
  v533 = a1[51];
  v534 = (id *)*((_QWORD *)v690 + 51);
  if (v533)
  {
    if (v534)
    {
      v707 = 0u;
      v708 = 0u;
      v709 = 0u;
      v710 = 0u;
      v535 = v534[2];
      v536 = objc_msgSend(v535, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
      if (v536)
      {
        v537 = v536;
        v538 = *(_QWORD *)v708;
        do
        {
          for (i13 = 0; i13 != v537; ++i13)
          {
            if (*(_QWORD *)v708 != v538)
              objc_enumerationMutation(v535);
            -[GEOPDTerritoryLookupParameters addLocation:](v533, *(void **)(*((_QWORD *)&v707 + 1) + 8 * i13));
          }
          v537 = objc_msgSend(v535, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
        }
        while (v537);
      }

    }
  }
  else if (v534)
  {
    -[GEOPDPlaceRequestParameters setTerritoryLookupParameters:]((uint64_t)a1, v534);
  }
  v540 = a1[53];
  v541 = (void *)*((_QWORD *)v690 + 53);
  if (v540)
  {
    if (v541)
    {
      v542 = v541;
      -[GEOPDTransitNearbyScheduleLookupParameters readAll:]((uint64_t)v542, 0);
      v709 = 0u;
      v710 = 0u;
      v707 = 0u;
      v708 = 0u;
      v543 = v542[3];
      v544 = objc_msgSend(v543, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
      if (v544)
      {
        v545 = v544;
        v546 = *(_QWORD *)v708;
        do
        {
          for (i14 = 0; i14 != v545; ++i14)
          {
            if (*(_QWORD *)v708 != v546)
              objc_enumerationMutation(v543);
            -[GEOPDTransitNearbyScheduleLookupParameters addTransitNearbyScheduleLookupOrigin:](v540, *(void **)(*((_QWORD *)&v707 + 1) + 8 * i14));
          }
          v545 = objc_msgSend(v543, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
        }
        while (v545);
      }

      v548 = *(void **)(v540 + 32);
      v549 = v542[4];
      if (v548)
      {
        if (v549)
          objc_msgSend(v548, "mergeFrom:");
      }
      else if (v549)
      {
        -[GEOPDTransitNearbyScheduleLookupParameters setUserLocation:](v540, v542[4]);
      }

    }
  }
  else if (v541)
  {
    -[GEOPDPlaceRequestParameters setTransitNearbyScheduleLookupParameters:]((uint64_t)a1, v541);
  }
  v550 = a1[28];
  v551 = (void *)*((_QWORD *)v690 + 28);
  if (v550)
  {
    if (v551)
    {
      v552 = v551;
      v553 = *(_QWORD *)(v550 + 16);
      v554 = (void *)v552[2];
      if (v553)
      {
        if (v554)
          -[GEOPDCollectionSuggestionParameters mergeFrom:](v553, v554);
      }
      else if (v554)
      {
        -[GEOPDMapsHomeParameters setCollectionSuggestionParameters:](v550, v554);
      }
      if ((*((_BYTE *)v552 + 28) & 1) != 0)
      {
        *(_BYTE *)(v550 + 24) = *((_BYTE *)v552 + 24);
        *(_BYTE *)(v550 + 28) |= 1u;
      }

    }
  }
  else if (v551)
  {
    -[GEOPDPlaceRequestParameters setMapsHomeParameters:]((uint64_t)a1, v551);
  }
  v555 = a1[7];
  v556 = (void *)*((_QWORD *)v690 + 7);
  if (v555)
  {
    if (v556)
    {
      v557 = v556;
      v558 = *(void **)(v555 + 16);
      v559 = *((_QWORD *)v557 + 2);
      if (v558)
      {
        if (v559)
          objc_msgSend(v558, "mergeFrom:");
      }
      else if (v559)
      {
        -[GEOPDAllGuidesLocationsViewParameters setViewportInfo:](v555, *((void **)v557 + 2));
      }
      if ((*((_BYTE *)v557 + 28) & 1) != 0)
      {
        *(_DWORD *)(v555 + 24) = *((_DWORD *)v557 + 6);
        *(_BYTE *)(v555 + 28) |= 1u;
      }

    }
  }
  else if (v556)
  {
    -[GEOPDPlaceRequestParameters setAllGuidesLocationsViewParameters:]((uint64_t)a1, v556);
  }
  v560 = (_QWORD *)a1[25];
  v561 = (void *)*((_QWORD *)v690 + 25);
  if (v560)
  {
    if (v561)
    {
      v562 = v561;
      -[GEOPDGuidesHomeParameters readAll:]((uint64_t)v562, 0);
      -[GEOPDGuidesHomeParameters _readSupportedFixedSectionTypes]((uint64_t)v562);
      v563 = *((_QWORD *)v562 + 4);
      if (v563)
      {
        v564 = 0;
        v565 = *MEMORY[0x1E0C99858];
        do
        {
          -[GEOPDGuidesHomeParameters _readSupportedFixedSectionTypes]((uint64_t)v562);
          v566 = *((_QWORD *)v562 + 4);
          if (v566 <= v564)
          {
            v567 = (void *)MEMORY[0x1E0C99DA0];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v564, v566);
            v568 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v567, "exceptionWithName:reason:userInfo:", v565, v568, 0);
            v569 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v569, "raise");

          }
          -[GEOPDGuidesHomeParameters addSupportedFixedSectionType:]((uint64_t)v560);
          ++v564;
        }
        while (v563 != v564);
      }
      -[GEOPDGuidesHomeParameters _readSupportedRepeatableSectionTypes]((uint64_t)v562);
      v570 = *((_QWORD *)v562 + 7);
      if (v570)
      {
        v571 = 0;
        v572 = *MEMORY[0x1E0C99858];
        do
        {
          -[GEOPDGuidesHomeParameters _readSupportedRepeatableSectionTypes]((uint64_t)v562);
          v573 = *((_QWORD *)v562 + 7);
          if (v573 <= v571)
          {
            v574 = (void *)MEMORY[0x1E0C99DA0];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v571, v573);
            v575 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v574, "exceptionWithName:reason:userInfo:", v572, v575, 0);
            v576 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v576, "raise");

          }
          -[GEOPDGuidesHomeParameters addSupportedRepeatableSectionType:]((uint64_t)v560);
          ++v571;
        }
        while (v570 != v571);
      }
      v577 = (void *)v560[12];
      v578 = *((_QWORD *)v562 + 12);
      if (v577)
      {
        if (v578)
          objc_msgSend(v577, "mergeFrom:");
      }
      else if (v578)
      {
        -[GEOPDGuidesHomeParameters setViewportInfo:]((uint64_t)v560, *((void **)v562 + 12));
      }
      v579 = v560[9];
      v580 = (void *)*((_QWORD *)v562 + 9);
      a1 = v689;
      if (v579)
      {
        if (v580)
          -[GEOPDGuidesLocationEntry mergeFrom:](v579, v580);
      }
      else if (v580)
      {
        -[GEOPDGuidesHomeParameters setGuidesLocationEntry:]((uint64_t)v560, v580);
      }
      v581 = v560[11];
      v582 = (void *)*((_QWORD *)v562 + 11);
      if (v581)
      {
        if (v582)
        {
          v583 = v582;
          -[GEOPDGuidesHomeResultFilter readAll:]((uint64_t)v583, 0);
          if ((*((_BYTE *)v583 + 56) & 1) != 0)
          {
            *(_DWORD *)(v581 + 52) = *((_DWORD *)v583 + 13);
            *(_BYTE *)(v581 + 56) |= 1u;
          }
          v584 = *(_QWORD *)(v581 + 24);
          v585 = (void *)*((_QWORD *)v583 + 3);
          if (v584)
          {
            if (v585)
            {
              v586 = v585;
              v587 = *(_QWORD *)(v584 + 16);
              v588 = (void *)v586[2];
              if (v587)
              {
                if (v588)
                  -[GEOPDRelatedSearchSuggestion mergeFrom:](v587, v588);
              }
              else if (v588)
              {
                -[GEOPDGuidesHomeResultFilterTypeConcept setRelatedSearchSuggestion:](v584, v588);
              }

            }
          }
          else if (v585)
          {
            -[GEOPDGuidesHomeResultFilter setFilterConcept:](v581, v585);
          }
          v709 = 0u;
          v710 = 0u;
          v707 = 0u;
          v708 = 0u;
          v589 = *((id *)v583 + 4);
          v590 = objc_msgSend(v589, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
          if (v590)
          {
            v591 = v590;
            v592 = *(_QWORD *)v708;
            do
            {
              for (i15 = 0; i15 != v591; ++i15)
              {
                if (*(_QWORD *)v708 != v592)
                  objc_enumerationMutation(v589);
                -[GEOPDGuidesHomeResultFilter addSubFilter:](v581, *(void **)(*((_QWORD *)&v707 + 1) + 8 * i15));
              }
              v591 = objc_msgSend(v589, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
            }
            while (v591);
          }

        }
      }
      else if (v582)
      {
        -[GEOPDGuidesHomeParameters setResultFilter:]((uint64_t)v560, v582);
      }
      v594 = v560[10];
      v595 = (void *)*((_QWORD *)v562 + 10);
      if (v594)
      {
        if (v595)
          -[GEOPDResultRefinementGuidesHome mergeFrom:](v594, v595);
      }
      else if (v595)
      {
        -[GEOPDGuidesHomeParameters setRefinementGuidesHome:]((uint64_t)v560, v595);
      }

    }
  }
  else if (v561)
  {
    -[GEOPDPlaceRequestParameters setGuidesHomeParameters:]((uint64_t)a1, v561);
  }
  v596 = a1[20];
  v597 = (void *)*((_QWORD *)v690 + 20);
  if (v596)
  {
    if (v597)
    {
      v598 = v597;
      -[GEOPDExtendedGeoLookupParameters readAll:]((uint64_t)v598, 0);
      v599 = *(void **)(v596 + 64);
      v600 = *((_QWORD *)v598 + 8);
      if (v599)
      {
        if (v600)
          objc_msgSend(v599, "mergeFrom:");
      }
      else if (v600)
      {
        -[GEOPDExtendedGeoLookupParameters setPreserveFields:](v596, *((void **)v598 + 8));
      }
      if ((*((_WORD *)v598 + 56) & 1) != 0)
      {
        *(_QWORD *)(v596 + 72) = *((_QWORD *)v598 + 9);
        *(_WORD *)(v596 + 112) |= 1u;
      }
      v601 = *(void **)(v596 + 80);
      v602 = *((_QWORD *)v598 + 10);
      if (v601)
      {
        if (v602)
          objc_msgSend(v601, "mergeFrom:");
      }
      else if (v602)
      {
        -[GEOPDExtendedGeoLookupParameters setPrimaryFeatureLocation:](v596, *((void **)v598 + 10));
      }
      -[GEOPDExtendedGeoLookupParameters _readIntersectingFeatureGeoIds]((uint64_t)v598);
      v603 = *((_QWORD *)v598 + 4);
      if (v603)
      {
        v604 = 0;
        v605 = *MEMORY[0x1E0C99858];
        do
        {
          -[GEOPDExtendedGeoLookupParameters _readIntersectingFeatureGeoIds]((uint64_t)v598);
          v606 = *((_QWORD *)v598 + 4);
          if (v606 <= v604)
          {
            v607 = (void *)MEMORY[0x1E0C99DA0];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v604, v606);
            v608 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v607, "exceptionWithName:reason:userInfo:", v605, v608, 0);
            v609 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v609, "raise");

          }
          -[GEOPDExtendedGeoLookupParameters addIntersectingFeatureGeoId:](v596);
          ++v604;
        }
        while (v603 != v604);
      }
      v610 = *((_WORD *)v598 + 56);
      if ((v610 & 8) != 0)
      {
        *(_BYTE *)(v596 + 109) = *((_BYTE *)v598 + 109);
        *(_WORD *)(v596 + 112) |= 8u;
        v610 = *((_WORD *)v598 + 56);
      }
      a1 = v689;
      if ((v610 & 2) != 0)
      {
        *(_QWORD *)(v596 + 88) = *((_QWORD *)v598 + 11);
        *(_WORD *)(v596 + 112) |= 2u;
      }
      v611 = (void *)*((_QWORD *)v598 + 6);
      if (v611)
        -[GEOPDExtendedGeoLookupParameters setDataSourceId:](v596, v611);
      if ((*((_WORD *)v598 + 56) & 4) != 0)
      {
        *(_BYTE *)(v596 + 108) = *((_BYTE *)v598 + 108);
        *(_WORD *)(v596 + 112) |= 4u;
      }
      v612 = *(void **)(v596 + 56);
      v613 = *((_QWORD *)v598 + 7);
      if (v612)
      {
        if (v613)
          objc_msgSend(v612, "mergeFrom:");
      }
      else if (v613)
      {
        -[GEOPDExtendedGeoLookupParameters setInterpolationParameter:](v596, *((void **)v598 + 7));
      }

    }
  }
  else if (v597)
  {
    -[GEOPDPlaceRequestParameters setExtendedGeoLookupParameters:]((uint64_t)a1, v597);
  }
  v614 = a1[42];
  v615 = (void *)*((_QWORD *)v690 + 42);
  if (v614)
  {
    if (v615)
    {
      v616 = v615;
      -[GEOPDQueryUnderstandingParameters readAll:]((uint64_t)v616, 0);
      if ((*((_BYTE *)v616 + 76) & 1) != 0)
      {
        *(_DWORD *)(v614 + 68) = *((_DWORD *)v616 + 17);
        *(_BYTE *)(v614 + 76) |= 1u;
      }
      v617 = (void *)*((_QWORD *)v616 + 3);
      if (v617)
        -[GEOPDQueryUnderstandingParameters setSearchString:](v614, v617);
      v618 = *(void **)(v614 + 48);
      v619 = *((_QWORD *)v616 + 6);
      if (v618)
      {
        if (v619)
          objc_msgSend(v618, "mergeFrom:");
      }
      else if (v619)
      {
        -[GEOPDQueryUnderstandingParameters setViewportInfo:](v614, *((void **)v616 + 6));
      }
      if ((*((_BYTE *)v616 + 76) & 2) != 0)
      {
        *(_DWORD *)(v614 + 72) = *((_DWORD *)v616 + 18);
        *(_BYTE *)(v614 + 76) |= 2u;
      }
      v620 = *(_QWORD *)(v614 + 40);
      v621 = (void *)*((_QWORD *)v616 + 5);
      if (v620)
      {
        if (v621)
        {
          v622 = v621;
          -[GEOPDQueryUnderstandingTaxonomySearchParameters readAll:]((uint64_t)v622, 0);
          if ((*((_BYTE *)v622 + 56) & 1) != 0)
          {
            *(_DWORD *)(v620 + 52) = *((_DWORD *)v622 + 13);
            *(_BYTE *)(v620 + 56) |= 1u;
          }
          v623 = (void *)*((_QWORD *)v622 + 4);
          if (v623)
            -[GEOPDQueryUnderstandingTaxonomySearchParameters setSearchString:](v620, v623);
          v709 = 0u;
          v710 = 0u;
          v707 = 0u;
          v708 = 0u;
          v624 = *((id *)v622 + 3);
          v625 = objc_msgSend(v624, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
          if (v625)
          {
            v626 = v625;
            v627 = *(_QWORD *)v708;
            do
            {
              for (i16 = 0; i16 != v626; ++i16)
              {
                if (*(_QWORD *)v708 != v627)
                  objc_enumerationMutation(v624);
                -[GEOPDQueryUnderstandingTaxonomySearchParameters addCategoryBranch:](v620, *(void **)(*((_QWORD *)&v707 + 1) + 8 * i16));
              }
              v626 = objc_msgSend(v624, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
            }
            while (v626);
          }

        }
      }
      else if (v621)
      {
        -[GEOPDQueryUnderstandingParameters setTaxonomySearchParameters:](v614, v621);
      }
      v629 = *(_QWORD *)(v614 + 32);
      v630 = (void *)*((_QWORD *)v616 + 4);
      if (v629)
      {
        if (v630)
        {
          v631 = v630;
          -[GEOPDQueryUnderstandingTaxonomyLookupParameters readAll:]((uint64_t)v631, 0);
          v705 = 0u;
          v706 = 0u;
          v703 = 0u;
          v704 = 0u;
          v632 = v631[4];
          v633 = objc_msgSend(v632, "countByEnumeratingWithState:objects:count:", &v703, v711, 16);
          if (v633)
          {
            v634 = v633;
            v635 = *(_QWORD *)v704;
            do
            {
              for (i17 = 0; i17 != v634; ++i17)
              {
                if (*(_QWORD *)v704 != v635)
                  objc_enumerationMutation(v632);
                -[GEOPDQueryUnderstandingTaxonomyLookupParameters addIdentifier:](v629, *(void **)(*((_QWORD *)&v703 + 1) + 8 * i17));
              }
              v634 = objc_msgSend(v632, "countByEnumeratingWithState:objects:count:", &v703, v711, 16);
            }
            while (v634);
          }

          v701 = 0u;
          v702 = 0u;
          v699 = 0u;
          v700 = 0u;
          v637 = v631[3];
          v638 = objc_msgSend(v637, "countByEnumeratingWithState:objects:count:", &v699, &v707, 16);
          if (v638)
          {
            v639 = v638;
            v640 = *(_QWORD *)v700;
            do
            {
              for (i18 = 0; i18 != v639; ++i18)
              {
                if (*(_QWORD *)v700 != v640)
                  objc_enumerationMutation(v637);
                -[GEOPDQueryUnderstandingTaxonomyLookupParameters addCategoryBranch:](v629, *(void **)(*((_QWORD *)&v699 + 1) + 8 * i18));
              }
              v639 = objc_msgSend(v637, "countByEnumeratingWithState:objects:count:", &v699, &v707, 16);
            }
            while (v639);
          }

        }
      }
      else if (v630)
      {
        -[GEOPDQueryUnderstandingParameters setTaxonomyLookupParameters:](v614, v630);
      }

    }
  }
  else if (v615)
  {
    -[GEOPDPlaceRequestParameters setQueryUnderstandingParameters:]((uint64_t)a1, v615);
  }
  v642 = a1[39];
  v643 = (id *)*((_QWORD *)v690 + 39);
  if (v642)
  {
    if (v643)
    {
      v707 = 0u;
      v708 = 0u;
      v709 = 0u;
      v710 = 0u;
      v644 = v643[2];
      v645 = objc_msgSend(v644, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
      if (v645)
      {
        v646 = v645;
        v647 = *(_QWORD *)v708;
        do
        {
          for (i19 = 0; i19 != v646; ++i19)
          {
            if (*(_QWORD *)v708 != v647)
              objc_enumerationMutation(v644);
            -[GEOPDPoiAtAddressLookupParameters addComponent:](v642, *(void **)(*((_QWORD *)&v707 + 1) + 8 * i19));
          }
          v646 = objc_msgSend(v644, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
        }
        while (v646);
      }

    }
  }
  else if (v643)
  {
    -[GEOPDPlaceRequestParameters setPoiAtAddressLookupParameters:]((uint64_t)a1, v643);
  }
  v649 = a1[52];
  v650 = (id *)*((_QWORD *)v690 + 52);
  if (v649)
  {
    if (v650)
    {
      v707 = 0u;
      v708 = 0u;
      v709 = 0u;
      v710 = 0u;
      v651 = v650[2];
      v652 = objc_msgSend(v651, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
      if (v652)
      {
        v653 = v652;
        v654 = *(_QWORD *)v708;
        do
        {
          for (i20 = 0; i20 != v653; ++i20)
          {
            if (*(_QWORD *)v708 != v654)
              objc_enumerationMutation(v651);
            -[GEOPDTransitNearbyPaymentMethodLookupParameters addTransitNearbyPaymentMethodLookupOrigin:](v649, *(void **)(*((_QWORD *)&v707 + 1) + 8 * i20));
          }
          v653 = objc_msgSend(v651, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
        }
        while (v653);
      }

    }
  }
  else if (v650)
  {
    -[GEOPDPlaceRequestParameters setTransitNearbyPaymentMethodLookupParameters:]((uint64_t)a1, v650);
  }
  v656 = a1[38];
  v657 = (void *)*((_QWORD *)v690 + 38);
  if (v656)
  {
    if (v657)
    {
      v658 = v657;
      -[GEOPDPlacecardEnrichmentParameters readAll:]((uint64_t)v658, 0);
      v659 = *(void **)(v656 + 32);
      v660 = *((_QWORD *)v658 + 4);
      if (v659)
      {
        if (v660)
          objc_msgSend(v659, "mergeFrom:");
      }
      else if (v660)
      {
        -[GEOPDPlacecardEnrichmentParameters setMapsId:](v656, *((void **)v658 + 4));
      }
      v709 = 0u;
      v710 = 0u;
      v707 = 0u;
      v708 = 0u;
      v661 = *((id *)v658 + 3);
      v662 = objc_msgSend(v661, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
      if (v662)
      {
        v663 = v662;
        v664 = *(_QWORD *)v708;
        do
        {
          for (i21 = 0; i21 != v663; ++i21)
          {
            if (*(_QWORD *)v708 != v664)
              objc_enumerationMutation(v661);
            -[GEOPDPlacecardEnrichmentParameters addEnrichmentInfo:](v656, *(void **)(*((_QWORD *)&v707 + 1) + 8 * i21));
          }
          v663 = objc_msgSend(v661, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
        }
        while (v663);
      }

      if ((*((_BYTE *)v658 + 56) & 1) != 0)
      {
        *(_BYTE *)(v656 + 52) = *((_BYTE *)v658 + 52);
        *(_BYTE *)(v656 + 56) |= 1u;
      }

    }
  }
  else if (v657)
  {
    -[GEOPDPlaceRequestParameters setPlacecardEnrichmentParameters:]((uint64_t)a1, v657);
  }
  v666 = a1[33];
  v667 = (void *)*((_QWORD *)v690 + 33);
  if (v666)
  {
    if (v667)
    {
      v668 = v667;
      v669 = *(void **)(v666 + 16);
      v670 = v668[2];
      if (v669)
      {
        if (v670)
          objc_msgSend(v669, "mergeFrom:");
      }
      else if (v670)
      {
        -[GEOPDOfflineRegionNameParameters setRegion:](v666, v668[2]);
      }

    }
  }
  else if (v667)
  {
    -[GEOPDPlaceRequestParameters setOfflineRegionNameParameters:]((uint64_t)a1, v667);
  }
  v671 = a1[45];
  v672 = (void *)*((_QWORD *)v690 + 45);
  if (v671)
  {
    if (v672)
    {
      v673 = v672;
      v674 = *(void **)(v671 + 16);
      v675 = v673[2];
      if (v674)
      {
        if (v675)
          objc_msgSend(v674, "mergeFrom:");
      }
      else if (v675)
      {
        -[GEOPDSearchCapabilitiesParameters setViewportInfo:](v671, v673[2]);
      }

    }
  }
  else if (v672)
  {
    -[GEOPDPlaceRequestParameters setSearchCapabilitiesParameters:]((uint64_t)a1, v672);
  }
  v676 = a1[43];
  v677 = (id *)*((_QWORD *)v690 + 43);
  if (v676)
  {
    if (v677)
    {
      v707 = 0u;
      v708 = 0u;
      v709 = 0u;
      v710 = 0u;
      v678 = v677[2];
      v679 = objc_msgSend(v678, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
      if (v679)
      {
        v680 = v679;
        v681 = *(_QWORD *)v708;
        do
        {
          for (i22 = 0; i22 != v680; ++i22)
          {
            if (*(_QWORD *)v708 != v681)
              objc_enumerationMutation(v678);
            -[GEOPDRefreshIdLookUpParameters addMapsId:](v676, *(void **)(*((_QWORD *)&v707 + 1) + 8 * i22));
          }
          v680 = objc_msgSend(v678, "countByEnumeratingWithState:objects:count:", &v707, v711, 16);
        }
        while (v680);
      }

    }
  }
  else if (v677)
  {
    -[GEOPDPlaceRequestParameters setRefreshIdLookUpParameters:]((uint64_t)a1, v677);
  }
  v683 = a1[4];
  v684 = (void *)*((_QWORD *)v690 + 4);
  if (v683)
  {
    if (v684)
    {
      v685 = v684;
      -[GEOPDAddressRecommendationParameters readAll:]((uint64_t)v685, 0);
      v686 = (void *)v685[4];
      if (v686)
        -[GEOPDAddressRecommendationParameters setCountryOrRegion:](v683, v686);
      v687 = *(_QWORD *)(v683 + 24);
      v688 = (void *)v685[3];
      if (v687)
      {
        if (v688)
          -[GEOPDAddressWithComponents mergeFrom:](v687, v688);
      }
      else if (v688)
      {
        -[GEOPDAddressRecommendationParameters setAddressWithComponents:](v683, v688);
      }

    }
  }
  else if (v684)
  {
    -[GEOPDPlaceRequestParameters setAddressRecommendationParameters:]((uint64_t)a1, v684);
  }
LABEL_1282:

}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t n;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t ii;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t jj;
  uint64_t v100;
  void *v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t kk;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t mm;
  uint64_t v115;
  void *v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t nn;
  id v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t i1;
  uint64_t v127;
  void *v128;
  _QWORD *v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  void *v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t i2;
  id v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t i3;
  uint64_t v146;
  void *v147;
  uint64_t v148;
  void *v149;
  id v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t i4;
  uint64_t v155;
  void *v156;
  id v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t i5;
  uint64_t v162;
  void *v163;
  id v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t i6;
  uint64_t v169;
  void *v170;
  uint64_t v171;
  void *v172;
  uint64_t v173;
  void *v174;
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
  uint64_t i7;
  uint64_t v186;
  void *v187;
  uint64_t v188;
  void *v189;
  uint64_t v190;
  void *v191;
  uint64_t v192;
  void *v193;
  uint64_t v194;
  void *v195;
  id v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t i8;
  uint64_t v201;
  void *v202;
  id v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t i9;
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
  id v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t i10;
  uint64_t v231;
  void *v232;
  id v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t i11;
  uint64_t v238;
  void *v239;
  uint64_t v240;
  void *v241;
  id v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t i12;
  uint64_t v247;
  void *v248;
  uint64_t v249;
  void *v250;
  uint64_t v251;
  void *v252;
  id v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t i13;
  uint64_t v258;
  void *v259;
  _QWORD *v260;
  id obj;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  _BYTE v282[128];
  uint64_t v283;

  v283 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_QWORD *)(a1 + 476) |= 0x100000000000001uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    -[GEOPDPlaceRequestParameters readAll:](a1, 0);
    v3 = *(_QWORD *)(a1 + 376);
    if (v3)
    {
      os_unfair_lock_lock_with_options();
      *(_QWORD *)(v3 + 372) |= 0x20000001000uLL;
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 336));
      v4 = *(void **)(v3 + 16);
      *(_QWORD *)(v3 + 16) = 0;

      -[GEOPDSearchParameters readAll:](v3, 0);
      objc_msgSend(*(id *)(v3 + 320), "clearUnknownFields:", 1);
      objc_msgSend(*(id *)(v3 + 304), "clearUnknownFields:", 1);
      v5 = *(_QWORD *)(v3 + 280);
      if (v5)
      {
        v6 = *(void **)(v5 + 8);
        *(_QWORD *)(v5 + 8) = 0;

      }
      -[GEOPDSSearchLocationParameters clearUnknownFields:](*(_QWORD *)(v3 + 248), 1);
      -[GEOPDRecentRouteInfo clearUnknownFields:](*(_QWORD *)(v3 + 208));
      -[GEOPDSSearchFilter clearUnknownFields:](*(_QWORD *)(v3 + 240), 1);
      -[GEOPDRetainedSearchMetadata clearUnknownFields:](*(_QWORD *)(v3 + 224), 1);
      -[GEOPDSInferredSignals clearUnknownFields:](*(_QWORD *)(v3 + 168), 1);
      -[GEOPDSSearchEvChargingParameters clearUnknownFields:](*(_QWORD *)(v3 + 160), 1);
      -[GEOPDETAFilter clearUnknownFields:](*(_QWORD *)(v3 + 152), 1);
      objc_msgSend(*(id *)(v3 + 216), "clearUnknownFields:", 1);
      objc_msgSend(*(id *)(v3 + 192), "clearUnknownFields:", 1);
      -[GEOPDSearchOriginationInfo clearUnknownFields:](*(_QWORD *)(v3 + 256), 1);
      v280 = 0u;
      v281 = 0u;
      v278 = 0u;
      v279 = 0u;
      v7 = *(id *)(v3 + 232);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v279;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v279 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v278 + 1) + 8 * i);
            if (v12)
            {
              v13 = *(void **)(v12 + 8);
              *(_QWORD *)(v12 + 8) = 0;

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
        }
        while (v9);
      }

      v14 = *(_QWORD *)(v3 + 264);
      if (v14)
      {
        v15 = *(void **)(v14 + 8);
        *(_QWORD *)(v14 + 8) = 0;

      }
      objc_msgSend(*(id *)(v3 + 176), "clearUnknownFields:", 1);
      -[GEOPDSPunchInHints clearUnknownFields:](*(_QWORD *)(v3 + 200), 1);
      objc_msgSend(*(id *)(v3 + 288), "clearUnknownFields:", 1);
      v16 = *(_QWORD *)(v3 + 184);
      if (v16)
      {
        v17 = *(void **)(v16 + 8);
        *(_QWORD *)(v16 + 8) = 0;

      }
    }
    v18 = *(_QWORD *)(a1 + 184);
    if (v18)
    {
      os_unfair_lock_lock_with_options();
      *(_WORD *)(v18 + 84) |= 4u;
      *(_WORD *)(v18 + 84) |= 0x100u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v18 + 72));
      v19 = *(void **)(v18 + 16);
      *(_QWORD *)(v18 + 16) = 0;

      -[GEOPDGeocodingParameters readAll:](v18, 0);
      objc_msgSend(*(id *)(v18 + 56), "clearUnknownFields:", 1);
      objc_msgSend(*(id *)(v18 + 48), "clearUnknownFields:", 1);
      -[GEOPDSPunchInHints clearUnknownFields:](*(_QWORD *)(v18 + 32), 1);
      -[GEOPDAddressResultSubTypeFilter clearUnknownFields:](*(_QWORD *)(v18 + 24), 1);
    }
    v20 = *(_QWORD *)(a1 + 128);
    if (v20)
    {
      v21 = *(void **)(v20 + 8);
      *(_QWORD *)(v20 + 8) = 0;

    }
    v22 = *(_QWORD *)(a1 + 352);
    if (v22)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v22 + 60) |= 4u;
      *(_BYTE *)(v22 + 60) |= 0x20u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v22 + 48));
      v23 = *(void **)(v22 + 16);
      *(_QWORD *)(v22 + 16) = 0;

      -[GEOPDReverseGeocodingParameters readAll:](v22, 0);
      v276 = 0u;
      v277 = 0u;
      v274 = 0u;
      v275 = 0u;
      v24 = *(id *)(v22 + 32);
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v274, v282, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v275;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v275 != v27)
              objc_enumerationMutation(v24);
            objc_msgSend(*(id *)(*((_QWORD *)&v274 + 1) + 8 * j), "clearUnknownFields:", 1);
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v274, v282, 16);
        }
        while (v26);
      }

      v272 = 0u;
      v273 = 0u;
      v270 = 0u;
      v271 = 0u;
      v29 = *(id *)(v22 + 24);
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v270, &v278, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v271;
        do
        {
          for (k = 0; k != v31; ++k)
          {
            if (*(_QWORD *)v271 != v32)
              objc_enumerationMutation(v29);
            objc_msgSend(*(id *)(*((_QWORD *)&v270 + 1) + 8 * k), "clearUnknownFields:", 1);
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v270, &v278, 16);
        }
        while (v31);
      }

    }
    v34 = *(_QWORD *)(a1 + 280);
    if (v34)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v34 + 76) |= 4u;
      *(_BYTE *)(v34 + 76) |= 0x20u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v34 + 64));
      v35 = *(void **)(v34 + 16);
      *(_QWORD *)(v34 + 16) = 0;

      -[GEOPDPlaceLookupParameters readAll:](v34, 0);
      v280 = 0u;
      v281 = 0u;
      v278 = 0u;
      v279 = 0u;
      v36 = *(id *)(v34 + 48);
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v279;
        do
        {
          for (m = 0; m != v38; ++m)
          {
            if (*(_QWORD *)v279 != v39)
              objc_enumerationMutation(v36);
            -[GEOPlaceIdentifier clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v278 + 1) + 8 * m), 1);
          }
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
        }
        while (v38);
      }

    }
    objc_msgSend(*(id *)(a1 + 248), "clearUnknownFields:", 1);
    v41 = *(_QWORD *)(a1 + 296);
    if (v41)
    {
      os_unfair_lock_lock_with_options();
      *(_WORD *)(v41 + 108) |= 0x20u;
      *(_WORD *)(v41 + 108) |= 0x1000u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v41 + 88));
      v42 = *(void **)(v41 + 16);
      *(_QWORD *)(v41 + 16) = 0;

      -[GEOPDPlaceRefinementParameters readAll:](v41, 0);
      objc_msgSend(*(id *)(v41 + 48), "clearUnknownFields:", 1);
      objc_msgSend(*(id *)(v41 + 24), "clearUnknownFields:", 1);
      objc_msgSend(*(id *)(v41 + 56), "clearUnknownFields:", 1);
    }
    v43 = *(_QWORD *)(a1 + 400);
    if (v43)
    {
      os_unfair_lock_lock_with_options();
      *(_WORD *)(v43 + 104) |= 0x10u;
      *(_WORD *)(v43 + 104) |= 0x1000u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v43 + 88));
      v44 = *(void **)(v43 + 16);
      *(_QWORD *)(v43 + 16) = 0;

      -[GEOPDSiriSearchParameters readAll:](v43, 0);
      objc_msgSend(*(id *)(v43 + 72), "clearUnknownFields:", 1);
      objc_msgSend(*(id *)(v43 + 24), "clearUnknownFields:", 1);
      v280 = 0u;
      v281 = 0u;
      v278 = 0u;
      v279 = 0u;
      v45 = *(id *)(v43 + 64);
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v279;
        do
        {
          for (n = 0; n != v47; ++n)
          {
            if (*(_QWORD *)v279 != v48)
              objc_enumerationMutation(v45);
            v50 = *(_QWORD *)(*((_QWORD *)&v278 + 1) + 8 * n);
            if (v50)
            {
              v51 = *(void **)(v50 + 8);
              *(_QWORD *)(v50 + 8) = 0;

            }
          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
        }
        while (v47);
      }

      -[GEOPDIndexQueryNode clearUnknownFields:](*(_QWORD *)(v43 + 40));
      -[GEOPDRecentRouteInfo clearUnknownFields:](*(_QWORD *)(v43 + 48));
    }
    v52 = *(_QWORD *)(a1 + 216);
    if (v52)
    {
      os_unfair_lock_lock_with_options();
      *(_WORD *)(v52 + 96) |= 8u;
      *(_WORD *)(v52 + 96) |= 0x400u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v52 + 80));
      v53 = *(void **)(v52 + 16);
      *(_QWORD *)(v52 + 16) = 0;

      -[GEOPDLocationDirectedSearchParameters readAll:](v52, 0);
      objc_msgSend(*(id *)(v52 + 64), "clearUnknownFields:", 1);
      objc_msgSend(*(id *)(v52 + 48), "clearUnknownFields:", 1);
      v54 = *(_QWORD *)(v52 + 24);
      if (v54)
      {
        v55 = *(void **)(v54 + 8);
        *(_QWORD *)(v54 + 8) = 0;

      }
      v56 = *(_QWORD *)(v52 + 32);
      if (v56)
      {
        v57 = *(void **)(v56 + 8);
        *(_QWORD *)(v56 + 8) = 0;

      }
      -[GEOPDSSearchFilter clearUnknownFields:](*(_QWORD *)(v52 + 40), 1);
    }
    objc_msgSend(*(id *)(a1 + 64), "clearUnknownFields:", 1);
    -[GEOPDSearchBrowseCategorySuggestionParameters clearUnknownFields:](*(_QWORD *)(a1 + 120));
    v58 = *(_QWORD *)(a1 + 136);
    if (v58)
    {
      os_unfair_lock_lock_with_options();
      *(_DWORD *)(v58 + 288) |= 0x200u;
      *(_DWORD *)(v58 + 288) |= 0x10000000u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v58 + 256));
      v59 = *(void **)(v58 + 16);
      *(_QWORD *)(v58 + 16) = 0;

      -[GEOPDCategorySearchParameters readAll:](v58, 0);
      objc_msgSend(*(id *)(v58 + 240), "clearUnknownFields:", 1);
      -[GEOPDRecentRouteInfo clearUnknownFields:](*(_QWORD *)(v58 + 184));
      -[GEOPDSSearchEvChargingParameters clearUnknownFields:](*(_QWORD *)(v58 + 160), 1);
      -[GEOPDETAFilter clearUnknownFields:](*(_QWORD *)(v58 + 152), 1);
      objc_msgSend(*(id *)(v58 + 192), "clearUnknownFields:", 1);
      objc_msgSend(*(id *)(v58 + 176), "clearUnknownFields:", 1);
      -[GEOPDSearchOriginationInfo clearUnknownFields:](*(_QWORD *)(v58 + 208), 1);
      v280 = 0u;
      v281 = 0u;
      v278 = 0u;
      v279 = 0u;
      v60 = *(id *)(v58 + 200);
      v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
      if (v61)
      {
        v62 = v61;
        v63 = *(_QWORD *)v279;
        do
        {
          for (ii = 0; ii != v62; ++ii)
          {
            if (*(_QWORD *)v279 != v63)
              objc_enumerationMutation(v60);
            v65 = *(_QWORD *)(*((_QWORD *)&v278 + 1) + 8 * ii);
            if (v65)
            {
              v66 = *(void **)(v65 + 8);
              *(_QWORD *)(v65 + 8) = 0;

            }
          }
          v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
        }
        while (v62);
      }

      v67 = *(_QWORD *)(v58 + 216);
      if (v67)
      {
        v68 = *(void **)(v67 + 8);
        *(_QWORD *)(v67 + 8) = 0;

      }
      objc_msgSend(*(id *)(v58 + 224), "clearUnknownFields:", 1);
      v69 = *(_QWORD *)(v58 + 168);
      if (v69)
      {
        v70 = *(void **)(v69 + 8);
        *(_QWORD *)(v69 + 8) = 0;

      }
    }
    v71 = *(_QWORD *)(a1 + 320);
    if (v71)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v71 + 60) |= 4u;
      *(_BYTE *)(v71 + 60) |= 0x20u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v71 + 48));
      v72 = *(void **)(v71 + 16);
      *(_QWORD *)(v71 + 16) = 0;

      -[GEOPDPopularNearbySearchParameters readAll:](v71, 0);
      objc_msgSend(*(id *)(v71 + 32), "clearUnknownFields:", 1);
    }
    v73 = *(_QWORD *)(a1 + 384);
    if (v73)
    {
      v74 = *(void **)(v73 + 8);
      *(_QWORD *)(v73 + 8) = 0;

      objc_msgSend(*(id *)(v73 + 24), "clearUnknownFields:", 1);
    }
    v75 = *(_QWORD *)(a1 + 368);
    if (v75)
    {
      v76 = *(void **)(v75 + 8);
      *(_QWORD *)(v75 + 8) = 0;

    }
    v77 = *(_QWORD *)(a1 + 88);
    if (v77)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v77 + 64) |= 4u;
      *(_BYTE *)(v77 + 64) |= 0x20u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v77 + 56));
      v78 = *(void **)(v77 + 16);
      *(_QWORD *)(v77 + 16) = 0;

      -[GEOPDBatchPopularNearbySearchParameters readAll:](v77, 0);
      objc_msgSend(*(id *)(v77 + 40), "clearUnknownFields:", 1);
    }
    v79 = *(_QWORD *)(a1 + 448);
    if (v79)
    {
      os_unfair_lock_lock_with_options();
      *(_WORD *)(v79 + 112) |= 0x10u;
      *(_WORD *)(v79 + 112) |= 0x1000u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v79 + 96));
      v80 = *(void **)(v79 + 16);
      *(_QWORD *)(v79 + 16) = 0;

      -[GEOPDVendorSpecificPlaceRefinementParameters readAll:](v79, 0);
      objc_msgSend(*(id *)(v79 + 56), "clearUnknownFields:", 1);
      objc_msgSend(*(id *)(v79 + 24), "clearUnknownFields:", 1);
    }
    v81 = *(_QWORD *)(a1 + 256);
    if (v81)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v81 + 60) |= 4u;
      *(_BYTE *)(v81 + 60) |= 0x20u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v81 + 48));
      v82 = *(void **)(v81 + 16);
      *(_QWORD *)(v81 + 16) = 0;

      -[GEOPDNearbySearchParameters readAll:](v81, 0);
      objc_msgSend(*(id *)(v81 + 32), "clearUnknownFields:", 1);
      v83 = *(_QWORD *)(v81 + 24);
      if (v83)
      {
        v84 = *(void **)(v83 + 8);
        *(_QWORD *)(v83 + 8) = 0;

      }
    }
    v85 = *(_QWORD *)(a1 + 24);
    if (v85)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v85 + 56) |= 2u;
      *(_BYTE *)(v85 + 56) |= 0x10u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v85 + 48));
      v86 = *(void **)(v85 + 16);
      *(_QWORD *)(v85 + 16) = 0;

      -[GEOPDAddressObjectGeocodingParameters readAll:](v85, 0);
      objc_msgSend(*(id *)(v85 + 32), "clearUnknownFields:", 1);
    }
    v87 = *(_QWORD *)(a1 + 392);
    if (v87)
    {
      v88 = *(void **)(v87 + 8);
      *(_QWORD *)(v87 + 8) = 0;

    }
    v89 = *(_QWORD *)(a1 + 168);
    if (v89)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v89 + 68) |= 2u;
      *(_BYTE *)(v89 + 68) |= 0x20u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v89 + 64));
      v90 = *(void **)(v89 + 16);
      *(_QWORD *)(v89 + 16) = 0;

      -[GEOPDExternalTransitLookupParameters readAll:](v89, 0);
      objc_msgSend(*(id *)(v89 + 40), "clearUnknownFields:", 1);
    }
    v91 = *(_QWORD *)(a1 + 176);
    if (v91)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v91 + 80) |= 4u;
      *(_BYTE *)(v91 + 80) |= 0x20u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v91 + 72));
      v92 = *(void **)(v91 + 16);
      *(_QWORD *)(v91 + 16) = 0;

      -[GEOPDFeatureIdGeocodingParameters readAll:](v91, 0);
      objc_msgSend(*(id *)(v91 + 56), "clearUnknownFields:", 1);
    }
    v93 = *(_QWORD *)(a1 + 232);
    if (v93)
    {
      v94 = *(void **)(v93 + 8);
      *(_QWORD *)(v93 + 8) = 0;

      v280 = 0u;
      v281 = 0u;
      v278 = 0u;
      v279 = 0u;
      v95 = *(id *)(v93 + 16);
      v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
      if (v96)
      {
        v97 = v96;
        v98 = *(_QWORD *)v279;
        do
        {
          for (jj = 0; jj != v97; ++jj)
          {
            if (*(_QWORD *)v279 != v98)
              objc_enumerationMutation(v95);
            objc_msgSend(*(id *)(*((_QWORD *)&v278 + 1) + 8 * jj), "clearUnknownFields:", 1);
          }
          v97 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
        }
        while (v97);
      }

    }
    v100 = *(_QWORD *)(a1 + 96);
    if (v100)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v100 + 68) |= 1u;
      *(_BYTE *)(v100 + 68) |= 8u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v100 + 64));
      v101 = *(void **)(v100 + 16);
      *(_QWORD *)(v100 + 16) = 0;

      -[GEOPDBatchReverseGeocodingParameters readAll:](v100, 0);
      v280 = 0u;
      v281 = 0u;
      v278 = 0u;
      v279 = 0u;
      v102 = *(id *)(v100 + 48);
      v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
      if (v103)
      {
        v104 = v103;
        v105 = *(_QWORD *)v279;
        do
        {
          for (kk = 0; kk != v104; ++kk)
          {
            if (*(_QWORD *)v279 != v105)
              objc_enumerationMutation(v102);
            objc_msgSend(*(id *)(*((_QWORD *)&v278 + 1) + 8 * kk), "clearUnknownFields:", 1);
          }
          v104 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
        }
        while (v104);
      }

    }
    v107 = *(_QWORD *)(a1 + 112);
    if (v107)
    {
      v108 = *(void **)(v107 + 8);
      *(_QWORD *)(v107 + 8) = 0;

    }
    v260 = (_QWORD *)a1;
    v109 = *(_QWORD *)(a1 + 456);
    if (v109)
    {
      v110 = *(void **)(v109 + 8);
      *(_QWORD *)(v109 + 8) = 0;

      v264 = 0u;
      v265 = 0u;
      v262 = 0u;
      v263 = 0u;
      obj = *(id *)(v109 + 16);
      v111 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v262, &v274, 16);
      if (v111)
      {
        v112 = v111;
        v113 = *(_QWORD *)v263;
        do
        {
          for (mm = 0; mm != v112; ++mm)
          {
            if (*(_QWORD *)v263 != v113)
              objc_enumerationMutation(obj);
            v115 = *(_QWORD *)(*((_QWORD *)&v262 + 1) + 8 * mm);
            if (v115)
            {
              os_unfair_lock_lock_with_options();
              *(_BYTE *)(v115 + 68) |= 4u;
              *(_BYTE *)(v115 + 68) |= 0x20u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v115 + 64));
              v116 = *(void **)(v115 + 16);
              *(_QWORD *)(v115 + 16) = 0;

              -[GEOPDWifiMeasurement readAll:](v115, 0);
              v272 = 0u;
              v273 = 0u;
              v270 = 0u;
              v271 = 0u;
              v117 = *(id *)(v115 + 40);
              v118 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v270, v282, 16);
              if (v118)
              {
                v119 = v118;
                v120 = *(_QWORD *)v271;
                do
                {
                  for (nn = 0; nn != v119; ++nn)
                  {
                    if (*(_QWORD *)v271 != v120)
                      objc_enumerationMutation(v117);
                    objc_msgSend(*(id *)(*((_QWORD *)&v270 + 1) + 8 * nn), "clearUnknownFields:", 1, v260);
                  }
                  v119 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v270, v282, 16);
                }
                while (v119);
              }

              v268 = 0u;
              v269 = 0u;
              v266 = 0u;
              v267 = 0u;
              v122 = *(id *)(v115 + 48);
              v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v266, &v278, 16);
              if (v123)
              {
                v124 = v123;
                v125 = *(_QWORD *)v267;
                do
                {
                  for (i1 = 0; i1 != v124; ++i1)
                  {
                    if (*(_QWORD *)v267 != v125)
                      objc_enumerationMutation(v122);
                    v127 = *(_QWORD *)(*((_QWORD *)&v266 + 1) + 8 * i1);
                    if (v127)
                    {
                      v128 = *(void **)(v127 + 8);
                      *(_QWORD *)(v127 + 8) = 0;

                    }
                  }
                  v124 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v266, &v278, 16);
                }
                while (v124);
              }

            }
          }
          v112 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v262, &v274, 16);
        }
        while (v112);
      }

    }
    v129 = v260;
    v130 = v260[26];
    if (v130)
    {
      v131 = *(void **)(v130 + 8);
      *(_QWORD *)(v130 + 8) = 0;

    }
    v132 = v260[24];
    if (v132)
    {
      v133 = *(void **)(v132 + 8);
      *(_QWORD *)(v132 + 8) = 0;

      objc_msgSend(*(id *)(v132 + 24), "clearUnknownFields:", 1);
    }
    v134 = v260[13];
    if (v134)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v134 + 52) |= 1u;
      *(_BYTE *)(v134 + 52) |= 8u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v134 + 48));
      v135 = *(void **)(v134 + 16);
      *(_QWORD *)(v134 + 16) = 0;

      -[GEOPDBatchSpatialLookupParameters readAll:](v134, 0);
      v276 = 0u;
      v277 = 0u;
      v274 = 0u;
      v275 = 0u;
      v136 = *(id *)(v134 + 32);
      v137 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v274, v282, 16);
      if (v137)
      {
        v138 = v137;
        v139 = *(_QWORD *)v275;
        do
        {
          for (i2 = 0; i2 != v138; ++i2)
          {
            if (*(_QWORD *)v275 != v139)
              objc_enumerationMutation(v136);
            -[GEOPDSpatialPlaceLookupParameters clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v274 + 1) + 8 * i2), 1);
          }
          v138 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v274, v282, 16);
        }
        while (v138);
      }

      v272 = 0u;
      v273 = 0u;
      v270 = 0u;
      v271 = 0u;
      v141 = *(id *)(v134 + 24);
      v142 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v270, &v278, 16);
      if (v142)
      {
        v143 = v142;
        v144 = *(_QWORD *)v271;
        do
        {
          for (i3 = 0; i3 != v143; ++i3)
          {
            if (*(_QWORD *)v271 != v144)
              objc_enumerationMutation(v141);
            -[GEOPDSpatialEventLookupParameters clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v270 + 1) + 8 * i3), 1);
          }
          v143 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v270, &v278, 16);
        }
        while (v143);
      }

    }
    v146 = v260[55];
    if (v146)
    {
      v147 = *(void **)(v146 + 8);
      *(_QWORD *)(v146 + 8) = 0;

    }
    v148 = v260[34];
    if (v148)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v148 + 52) |= 1u;
      *(_BYTE *)(v148 + 52) |= 8u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v148 + 48));
      v149 = *(void **)(v148 + 16);
      *(_QWORD *)(v148 + 16) = 0;

      -[GEOPDPlaceCollectionLookupParameters readAll:](v148, 0);
      objc_msgSend(*(id *)(v148 + 24), "clearUnknownFields:", 1);
      v280 = 0u;
      v281 = 0u;
      v278 = 0u;
      v279 = 0u;
      v150 = *(id *)(v148 + 32);
      v151 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
      if (v151)
      {
        v152 = v151;
        v153 = *(_QWORD *)v279;
        do
        {
          for (i4 = 0; i4 != v152; ++i4)
          {
            if (*(_QWORD *)v279 != v153)
              objc_enumerationMutation(v150);
            objc_msgSend(*(id *)(*((_QWORD *)&v278 + 1) + 8 * i4), "clearUnknownFields:", 1, v260);
          }
          v152 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
        }
        while (v152);
      }

    }
    objc_msgSend((id)v129[54], "clearUnknownFields:", 1, v260);
    v155 = v129[9];
    if (v155)
    {
      v156 = *(void **)(v155 + 8);
      *(_QWORD *)(v155 + 8) = 0;

      v280 = 0u;
      v281 = 0u;
      v278 = 0u;
      v279 = 0u;
      v157 = *(id *)(v155 + 16);
      v158 = objc_msgSend(v157, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
      if (v158)
      {
        v159 = v158;
        v160 = *(_QWORD *)v279;
        do
        {
          for (i5 = 0; i5 != v159; ++i5)
          {
            if (*(_QWORD *)v279 != v160)
              objc_enumerationMutation(v157);
            -[GEOPDCategoryLookupParameters clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v278 + 1) + 8 * i5), 1);
          }
          v159 = objc_msgSend(v157, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
        }
        while (v159);
      }

    }
    v162 = v129[10];
    if (v162)
    {
      v163 = *(void **)(v162 + 8);
      *(_QWORD *)(v162 + 8) = 0;

      v280 = 0u;
      v281 = 0u;
      v278 = 0u;
      v279 = 0u;
      v164 = *(id *)(v162 + 16);
      v165 = objc_msgSend(v164, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
      if (v165)
      {
        v166 = v165;
        v167 = *(_QWORD *)v279;
        do
        {
          for (i6 = 0; i6 != v166; ++i6)
          {
            if (*(_QWORD *)v279 != v167)
              objc_enumerationMutation(v164);
            v169 = *(_QWORD *)(*((_QWORD *)&v278 + 1) + 8 * i6);
            if (v169)
            {
              os_unfair_lock_lock_with_options();
              *(_WORD *)(v169 + 92) |= 1u;
              *(_WORD *)(v169 + 92) |= 0x100u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v169 + 88));
              v170 = *(void **)(v169 + 16);
              *(_QWORD *)(v169 + 16) = 0;

              -[GEOPDMerchantLookupBrandParameters readAll:](v169, 0);
              -[GEOPDWarsawMerchantIdentifier clearUnknownFields:](*(_QWORD *)(v169 + 72));
              v171 = *(_QWORD *)(v169 + 24);
              if (v171)
              {
                v172 = *(void **)(v171 + 8);
                *(_QWORD *)(v171 + 8) = 0;

              }
              v173 = *(_QWORD *)(v169 + 32);
              if (v173)
              {
                v174 = *(void **)(v173 + 8);
                *(_QWORD *)(v173 + 8) = 0;

              }
            }
          }
          v166 = objc_msgSend(v164, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
        }
        while (v166);
      }

    }
    v175 = v129[18];
    if (v175)
    {
      v176 = *(void **)(v175 + 8);
      *(_QWORD *)(v175 + 8) = 0;

    }
    -[GEOPDCollectionSuggestionParameters clearUnknownFields:](v129[19]);
    v177 = v129[30];
    if (v177)
    {
      os_unfair_lock_lock_with_options();
      *(_WORD *)(v177 + 108) |= 1u;
      *(_WORD *)(v177 + 108) |= 0x100u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v177 + 104));
      v178 = *(void **)(v177 + 16);
      *(_QWORD *)(v177 + 16) = 0;

      -[GEOPDMapsSearchHomeParameters readAll:](v177, 0);
      -[GEOPDSearchBrowseCategorySuggestionParameters clearUnknownFields:](*(_QWORD *)(v177 + 80));
      -[GEOPDCollectionSuggestionParameters clearUnknownFields:](*(_QWORD *)(v177 + 48));
      -[GEOPDPublisherSuggestionParameters clearUnknownFields:](*(_QWORD *)(v177 + 72));
      v179 = *(_QWORD *)(v177 + 64);
      if (v179)
      {
        os_unfair_lock_lock_with_options();
        *(_BYTE *)(v179 + 60) |= 1u;
        *(_BYTE *)(v179 + 60) |= 0x10u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v179 + 56));
        v180 = *(void **)(v179 + 16);
        *(_QWORD *)(v179 + 16) = 0;

        -[GEOPDPlaceSuggestionParameters readAll:](v179, 0);
        objc_msgSend(*(id *)(v179 + 40), "clearUnknownFields:", 1);
        v280 = 0u;
        v281 = 0u;
        v278 = 0u;
        v279 = 0u;
        v181 = *(id *)(v179 + 32);
        v182 = objc_msgSend(v181, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
        if (v182)
        {
          v183 = v182;
          v184 = *(_QWORD *)v279;
          do
          {
            for (i7 = 0; i7 != v183; ++i7)
            {
              if (*(_QWORD *)v279 != v184)
                objc_enumerationMutation(v181);
              objc_msgSend(*(id *)(*((_QWORD *)&v278 + 1) + 8 * i7), "clearUnknownFields:", 1);
            }
            v183 = objc_msgSend(v181, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
          }
          while (v183);
        }

      }
      v186 = *(_QWORD *)(v177 + 56);
      if (v186)
      {
        v187 = *(void **)(v186 + 8);
        *(_QWORD *)(v186 + 8) = 0;

        objc_msgSend(*(id *)(v186 + 16), "clearUnknownFields:", 1);
      }
      -[GEOPDSearchOriginationInfo clearUnknownFields:](*(_QWORD *)(v177 + 88), 1);
    }
    v188 = v129[41];
    if (v188)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v188 + 64) |= 2u;
      *(_BYTE *)(v188 + 64) |= 0x20u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v188 + 56));
      v189 = *(void **)(v188 + 16);
      *(_QWORD *)(v188 + 16) = 0;

      -[GEOPDPublisherViewParameters readAll:](v188, 0);
      objc_msgSend(*(id *)(v188 + 24), "clearUnknownFields:", 1);
      -[GEOPDPublisherViewResultFilter clearUnknownFields:](*(_QWORD *)(v188 + 32));
      objc_msgSend(*(id *)(v188 + 40), "clearUnknownFields:", 1);
    }
    v190 = v129[6];
    if (v190)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v190 + 64) |= 2u;
      *(_BYTE *)(v190 + 64) |= 0x20u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v190 + 56));
      v191 = *(void **)(v190 + 16);
      *(_QWORD *)(v190 + 16) = 0;

      -[GEOPDAllCollectionsViewParameters readAll:](v190, 0);
      -[GEOPDPublisherSuggestionParameters clearUnknownFields:](*(_QWORD *)(v190 + 24));
      -[GEOPDAllCollectionsViewResultFilter clearUnknownFields:](*(_QWORD *)(v190 + 32));
      objc_msgSend(*(id *)(v190 + 40), "clearUnknownFields:", 1);
    }
    v192 = v129[5];
    if (v192)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v192 + 60) |= 1u;
      *(_BYTE *)(v192 + 60) |= 0x10u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v192 + 56));
      v193 = *(void **)(v192 + 16);
      *(_QWORD *)(v192 + 16) = 0;

      -[GEOPDAirportEntityPlaceLookupParameters readAll:](v192, 0);
    }
    v194 = v129[51];
    if (v194)
    {
      v195 = *(void **)(v194 + 8);
      *(_QWORD *)(v194 + 8) = 0;

      v280 = 0u;
      v281 = 0u;
      v278 = 0u;
      v279 = 0u;
      v196 = *(id *)(v194 + 16);
      v197 = objc_msgSend(v196, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
      if (v197)
      {
        v198 = v197;
        v199 = *(_QWORD *)v279;
        do
        {
          for (i8 = 0; i8 != v198; ++i8)
          {
            if (*(_QWORD *)v279 != v199)
              objc_enumerationMutation(v196);
            objc_msgSend(*(id *)(*((_QWORD *)&v278 + 1) + 8 * i8), "clearUnknownFields:", 1);
          }
          v198 = objc_msgSend(v196, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
        }
        while (v198);
      }

    }
    v201 = v129[53];
    if (v201)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v201 + 52) |= 1u;
      *(_BYTE *)(v201 + 52) |= 8u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v201 + 48));
      v202 = *(void **)(v201 + 16);
      *(_QWORD *)(v201 + 16) = 0;

      -[GEOPDTransitNearbyScheduleLookupParameters readAll:](v201, 0);
      v280 = 0u;
      v281 = 0u;
      v278 = 0u;
      v279 = 0u;
      v203 = *(id *)(v201 + 24);
      v204 = objc_msgSend(v203, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
      if (v204)
      {
        v205 = v204;
        v206 = *(_QWORD *)v279;
        do
        {
          for (i9 = 0; i9 != v205; ++i9)
          {
            if (*(_QWORD *)v279 != v206)
              objc_enumerationMutation(v203);
            v208 = *(_QWORD *)(*((_QWORD *)&v278 + 1) + 8 * i9);
            if (v208)
            {
              v209 = *(void **)(v208 + 8);
              *(_QWORD *)(v208 + 8) = 0;

              objc_msgSend(*(id *)(v208 + 16), "clearUnknownFields:", 1);
            }
          }
          v205 = objc_msgSend(v203, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
        }
        while (v205);
      }

      objc_msgSend(*(id *)(v201 + 32), "clearUnknownFields:", 1);
    }
    v210 = v129[28];
    if (v210)
    {
      v211 = *(void **)(v210 + 8);
      *(_QWORD *)(v210 + 8) = 0;

      -[GEOPDCollectionSuggestionParameters clearUnknownFields:](*(_QWORD *)(v210 + 16));
    }
    v212 = v129[7];
    if (v212)
    {
      v213 = *(void **)(v212 + 8);
      *(_QWORD *)(v212 + 8) = 0;

      objc_msgSend(*(id *)(v212 + 16), "clearUnknownFields:", 1);
    }
    v214 = v129[25];
    if (v214)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v214 + 116) |= 1u;
      *(_BYTE *)(v214 + 116) |= 0x80u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v214 + 112));
      v215 = *(void **)(v214 + 16);
      *(_QWORD *)(v214 + 16) = 0;

      -[GEOPDGuidesHomeParameters readAll:](v214, 0);
      objc_msgSend(*(id *)(v214 + 96), "clearUnknownFields:", 1);
      -[GEOPDGuidesLocationEntry clearUnknownFields:](*(_QWORD *)(v214 + 72), 1);
      -[GEOPDGuidesHomeResultFilter clearUnknownFields:](*(_QWORD *)(v214 + 88));
      -[GEOPDResultRefinementGuidesHome clearUnknownFields:](*(_QWORD *)(v214 + 80), 1);
    }
    v216 = v129[20];
    if (v216)
    {
      os_unfair_lock_lock_with_options();
      *(_WORD *)(v216 + 112) |= 0x10u;
      *(_WORD *)(v216 + 112) |= 0x400u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v216 + 104));
      v217 = *(void **)(v216 + 16);
      *(_QWORD *)(v216 + 16) = 0;

      -[GEOPDExtendedGeoLookupParameters readAll:](v216, 0);
      objc_msgSend(*(id *)(v216 + 64), "clearUnknownFields:", 1);
      objc_msgSend(*(id *)(v216 + 80), "clearUnknownFields:", 1);
      objc_msgSend(*(id *)(v216 + 56), "clearUnknownFields:", 1);
    }
    v218 = v129[42];
    if (v218)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v218 + 76) |= 4u;
      *(_BYTE *)(v218 + 76) |= 0x80u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v218 + 64));
      v219 = *(void **)(v218 + 16);
      *(_QWORD *)(v218 + 16) = 0;

      -[GEOPDQueryUnderstandingParameters readAll:](v218, 0);
      objc_msgSend(*(id *)(v218 + 48), "clearUnknownFields:", 1);
      v220 = *(_QWORD *)(v218 + 40);
      if (v220)
      {
        os_unfair_lock_lock_with_options();
        *(_BYTE *)(v220 + 56) |= 2u;
        *(_BYTE *)(v220 + 56) |= 0x10u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v220 + 48));
        v221 = *(void **)(v220 + 16);
        *(_QWORD *)(v220 + 16) = 0;

        -[GEOPDQueryUnderstandingTaxonomySearchParameters readAll:](v220, 0);
      }
      v222 = *(_QWORD *)(v218 + 32);
      if (v222)
      {
        os_unfair_lock_lock_with_options();
        *(_BYTE *)(v222 + 52) |= 1u;
        *(_BYTE *)(v222 + 52) |= 8u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v222 + 48));
        v223 = *(void **)(v222 + 16);
        *(_QWORD *)(v222 + 16) = 0;

        -[GEOPDQueryUnderstandingTaxonomyLookupParameters readAll:](v222, 0);
      }
    }
    v224 = v129[39];
    if (v224)
    {
      v225 = *(void **)(v224 + 8);
      *(_QWORD *)(v224 + 8) = 0;

      v280 = 0u;
      v281 = 0u;
      v278 = 0u;
      v279 = 0u;
      v226 = *(id *)(v224 + 16);
      v227 = objc_msgSend(v226, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
      if (v227)
      {
        v228 = v227;
        v229 = *(_QWORD *)v279;
        do
        {
          for (i10 = 0; i10 != v228; ++i10)
          {
            if (*(_QWORD *)v279 != v229)
              objc_enumerationMutation(v226);
            -[GEOPDComponent clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v278 + 1) + 8 * i10), 1);
          }
          v228 = objc_msgSend(v226, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
        }
        while (v228);
      }

    }
    v231 = v129[52];
    if (v231)
    {
      v232 = *(void **)(v231 + 8);
      *(_QWORD *)(v231 + 8) = 0;

      v280 = 0u;
      v281 = 0u;
      v278 = 0u;
      v279 = 0u;
      v233 = *(id *)(v231 + 16);
      v234 = objc_msgSend(v233, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
      if (v234)
      {
        v235 = v234;
        v236 = *(_QWORD *)v279;
        do
        {
          for (i11 = 0; i11 != v235; ++i11)
          {
            if (*(_QWORD *)v279 != v236)
              objc_enumerationMutation(v233);
            v238 = *(_QWORD *)(*((_QWORD *)&v278 + 1) + 8 * i11);
            if (v238)
            {
              v239 = *(void **)(v238 + 8);
              *(_QWORD *)(v238 + 8) = 0;

              objc_msgSend(*(id *)(v238 + 16), "clearUnknownFields:", 1);
            }
          }
          v235 = objc_msgSend(v233, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
        }
        while (v235);
      }

    }
    v240 = v129[38];
    if (v240)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v240 + 56) |= 2u;
      *(_BYTE *)(v240 + 56) |= 0x10u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v240 + 48));
      v241 = *(void **)(v240 + 16);
      *(_QWORD *)(v240 + 16) = 0;

      -[GEOPDPlacecardEnrichmentParameters readAll:](v240, 0);
      objc_msgSend(*(id *)(v240 + 32), "clearUnknownFields:", 1);
      v280 = 0u;
      v281 = 0u;
      v278 = 0u;
      v279 = 0u;
      v242 = *(id *)(v240 + 24);
      v243 = objc_msgSend(v242, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
      if (v243)
      {
        v244 = v243;
        v245 = *(_QWORD *)v279;
        do
        {
          for (i12 = 0; i12 != v244; ++i12)
          {
            if (*(_QWORD *)v279 != v245)
              objc_enumerationMutation(v242);
            -[GEOPDEnrichmentInfo clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v278 + 1) + 8 * i12), 1);
          }
          v244 = objc_msgSend(v242, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
        }
        while (v244);
      }

    }
    v247 = v129[33];
    if (v247)
    {
      v248 = *(void **)(v247 + 8);
      *(_QWORD *)(v247 + 8) = 0;

      objc_msgSend(*(id *)(v247 + 16), "clearUnknownFields:", 1);
    }
    v249 = v129[45];
    if (v249)
    {
      v250 = *(void **)(v249 + 8);
      *(_QWORD *)(v249 + 8) = 0;

      objc_msgSend(*(id *)(v249 + 16), "clearUnknownFields:", 1);
    }
    v251 = v129[43];
    if (v251)
    {
      v252 = *(void **)(v251 + 8);
      *(_QWORD *)(v251 + 8) = 0;

      v280 = 0u;
      v281 = 0u;
      v278 = 0u;
      v279 = 0u;
      v253 = *(id *)(v251 + 16);
      v254 = objc_msgSend(v253, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
      if (v254)
      {
        v255 = v254;
        v256 = *(_QWORD *)v279;
        do
        {
          for (i13 = 0; i13 != v255; ++i13)
          {
            if (*(_QWORD *)v279 != v256)
              objc_enumerationMutation(v253);
            objc_msgSend(*(id *)(*((_QWORD *)&v278 + 1) + 8 * i13), "clearUnknownFields:", 1);
          }
          v255 = objc_msgSend(v253, "countByEnumeratingWithState:objects:count:", &v278, v282, 16);
        }
        while (v255);
      }

    }
    v258 = v129[4];
    if (v258)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v258 + 52) |= 1u;
      *(_BYTE *)(v258 + 52) |= 8u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v258 + 48));
      v259 = *(void **)(v258 + 16);
      *(_QWORD *)(v258 + 16) = 0;

      -[GEOPDAddressRecommendationParameters readAll:](v258, 0);
      -[GEOPDAddressWithComponents clearUnknownFields:](*(_QWORD *)(v258 + 24), 1);
    }
  }
}

- (GEOPDPlaceRequestParameters)initWithData:(id)a3
{
  GEOPDPlaceRequestParameters *v3;
  GEOPDPlaceRequestParameters *v4;
  GEOPDPlaceRequestParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceRequestParameters;
  v3 = -[GEOPDPlaceRequestParameters initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setSearchParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100200000000000uLL;
    objc_storeStrong((id *)(a1 + 376), a2);
  }

}

- (void)setCanonicalLocationSearchParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100000000004000uLL;
    objc_storeStrong((id *)(a1 + 128), a2);
  }

}

- (void)setPlaceLookupParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100000200000000uLL;
    objc_storeStrong((id *)(a1 + 280), a2);
  }

}

- (void)setMerchantLookupParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100000020000000uLL;
    objc_storeStrong((id *)(a1 + 248), a2);
  }

}

- (void)setSiriSearchParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 476) |= 0x101000000000000uLL;
  objc_storeStrong((id *)(a1 + 400), a2);

}

- (void)setLocationDirectedSearchParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100000002000000uLL;
    objc_storeStrong((id *)(a1 + 216), a2);
  }

}

- (void)setAutocompleteParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100000000000040uLL;
    objc_storeStrong((id *)(a1 + 64), a2);
  }

}

- (void)setBrowseCategorySuggestionParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100000000002000uLL;
    objc_storeStrong((id *)(a1 + 120), a2);
  }

}

- (void)setCategorySearchParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100000000008000uLL;
    objc_storeStrong((id *)(a1 + 136), a2);
  }

}

- (void)setPopularNearbySearchParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 476) |= 0x100004000000000uLL;
  objc_storeStrong((id *)(a1 + 320), a2);

}

- (void)setSearchZeroKeywordCategorySuggestionParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 476) |= 0x100400000000000uLL;
  objc_storeStrong((id *)(a1 + 384), a2);

}

- (void)setSearchFieldPlaceholderParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100100000000000uLL;
    objc_storeStrong((id *)(a1 + 368), a2);
  }

}

- (void)setBatchPopularNearbySearchParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 476) |= 0x100000000000200uLL;
  objc_storeStrong((id *)(a1 + 88), a2);

}

- (void)setVendorSpecificPlaceRefinementParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x140000000000000uLL;
    objc_storeStrong((id *)(a1 + 448), a2);
  }

}

- (void)setNearbySearchParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 476) |= 0x100000040000000uLL;
  objc_storeStrong((id *)(a1 + 256), a2);

}

- (void)setAddressObjectGeocodingParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 476) |= 0x100000000000002uLL;
  objc_storeStrong((id *)(a1 + 24), a2);

}

- (void)setSearchZeroKeywordWithSearchResultsSuggestionParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 476) |= 0x100800000000000uLL;
  objc_storeStrong((id *)(a1 + 392), a2);

}

- (void)setExternalTransitLookupParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100000000080000uLL;
    objc_storeStrong((id *)(a1 + 168), a2);
  }

}

- (void)setFeatureIdGeocodingParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 476) |= 0x100000000100000uLL;
  objc_storeStrong((id *)(a1 + 176), a2);

}

- (void)setMapsIdentifierPlaceLookupParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100000008000000uLL;
    objc_storeStrong((id *)(a1 + 232), a2);
  }

}

- (void)setBatchReverseGeocodingParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100000000000400uLL;
    objc_storeStrong((id *)(a1 + 96), a2);
  }

}

- (void)setBrandLookupParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100000000001000uLL;
    objc_storeStrong((id *)(a1 + 112), a2);
  }

}

- (void)setWifiFingerprintParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x180000000000000uLL;
    objc_storeStrong((id *)(a1 + 456), a2);
  }

}

- (void)setIpGeoLookupParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100000001000000uLL;
    objc_storeStrong((id *)(a1 + 208), a2);
  }

}

- (void)setGroundViewLabelParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100000000400000uLL;
    objc_storeStrong((id *)(a1 + 192), a2);
  }

}

- (void)setBatchSpatialLookupParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100000000000800uLL;
    objc_storeStrong((id *)(a1 + 104), a2);
  }

}

- (void)setTransitVehiclePositionParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x120000000000000uLL;
    objc_storeStrong((id *)(a1 + 440), a2);
  }

}

- (void)setPlaceCollectionLookupParameter:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 476) |= 0x100000100000000uLL;
  objc_storeStrong((id *)(a1 + 272), a2);

}

- (void)setTransitScheduleLookupParameter:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x110000000000000uLL;
    objc_storeStrong((id *)(a1 + 432), a2);
  }

}

- (void)setBatchCategoryLookupParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 476) |= 0x100000000000080uLL;
  objc_storeStrong((id *)(a1 + 72), a2);

}

- (void)setBatchMerchantLookupBrandParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 476) |= 0x100000000000100uLL;
  objc_storeStrong((id *)(a1 + 80), a2);

}

- (void)setChildPlaceLookupByCategoryParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100000000010000uLL;
    objc_storeStrong((id *)(a1 + 144), a2);
  }

}

- (void)setCollectionSuggestionParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 476) |= 0x100000000020000uLL;
  objc_storeStrong((id *)(a1 + 152), a2);

}

- (void)setMapsSearchHomeParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100000010000000uLL;
    objc_storeStrong((id *)(a1 + 240), a2);
  }

}

- (void)setPlaceQuestionnaireLookupParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 476) |= 0x100000400000000uLL;
  objc_storeStrong((id *)(a1 + 288), a2);

}

- (void)setPublisherViewParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100008000000000uLL;
    objc_storeStrong((id *)(a1 + 328), a2);
  }

}

- (void)setAllCollectionsViewParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100000000000010uLL;
    objc_storeStrong((id *)(a1 + 48), a2);
  }

}

- (void)setAirportEntityPlaceLookupParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100000000000008uLL;
    objc_storeStrong((id *)(a1 + 40), a2);
  }

}

- (void)setTerritoryLookupParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x102000000000000uLL;
    objc_storeStrong((id *)(a1 + 408), a2);
  }

}

- (void)setTransitNearbyScheduleLookupParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x108000000000000uLL;
    objc_storeStrong((id *)(a1 + 424), a2);
  }

}

- (void)setMapsHomeParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100000004000000uLL;
    objc_storeStrong((id *)(a1 + 224), a2);
  }

}

- (void)setAllGuidesLocationsViewParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100000000000020uLL;
    objc_storeStrong((id *)(a1 + 56), a2);
  }

}

- (void)setGuidesHomeParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100000000800000uLL;
    objc_storeStrong((id *)(a1 + 200), a2);
  }

}

- (void)setExtendedGeoLookupParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 476) |= 0x100000000040000uLL;
  objc_storeStrong((id *)(a1 + 160), a2);

}

- (void)setQueryUnderstandingParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 476) |= 0x100010000000000uLL;
  objc_storeStrong((id *)(a1 + 336), a2);

}

- (void)setPoiAtAddressLookupParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 476) |= 0x100002000000000uLL;
  objc_storeStrong((id *)(a1 + 312), a2);

}

- (void)setTransitNearbyPaymentMethodLookupParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x104000000000000uLL;
    objc_storeStrong((id *)(a1 + 416), a2);
  }

}

- (void)setPlacecardEnrichmentParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100001000000000uLL;
    objc_storeStrong((id *)(a1 + 304), a2);
  }

}

- (void)setOfflineRegionNameParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100000080000000uLL;
    objc_storeStrong((id *)(a1 + 264), a2);
  }

}

- (void)setSearchCapabilitiesParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 476) |= 0x100080000000000uLL;
    objc_storeStrong((id *)(a1 + 360), a2);
  }

}

- (void)_readRefreshIdLookUpParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 472));
  if ((*(_BYTE *)(a1 + 481) & 2) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPlaceRequestParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRefreshIdLookUpParameters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 472));
}

- (void)setRefreshIdLookUpParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 476) |= 0x100020000000000uLL;
  objc_storeStrong((id *)(a1 + 344), a2);

}

- (void)setAddressRecommendationParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_QWORD *)(a1 + 476) |= 0x100000000000004uLL;
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
  v8.super_class = (Class)GEOPDPlaceRequestParameters;
  -[GEOPDPlaceRequestParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceRequestParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceRequestParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEOPDPlaceRequestParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_initWithDictionary:(uint64_t)a3 isJSON:
{
  const __CFString *v5;
  void *v6;
  GEOPDSearchParameters *v7;
  char *v8;
  const __CFString *v9;
  void *v10;
  GEOPDGeocodingParameters *v11;
  id v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  unsigned int v18;
  const __CFString *v19;
  void *v20;
  GEOPDViewportInfo *v21;
  GEOPDViewportInfo *v22;
  GEOPDViewportInfo *v23;
  const __CFString *v24;
  void *v25;
  GEOStructuredAddress *v26;
  GEOStructuredAddress *v27;
  GEOStructuredAddress *v28;
  const __CFString *v29;
  void *v30;
  GEOPDSPunchInHints *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  char v35;
  const __CFString *v36;
  void *v37;
  GEOPDAddressResultSubTypeFilter *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  GEOPDCanonicalLocationSearchParameters *v42;
  id v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  GEOPDReverseGeocodingParameters *v49;
  GEOPDReverseGeocodingParameters *v50;
  id v51;
  uint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  uint64_t v59;
  GEOLatLng *v60;
  GEOLatLng *v61;
  GEOLatLng *v62;
  const __CFString *v63;
  void *v64;
  id v65;
  int v66;
  const __CFString *v67;
  void *v68;
  char v69;
  const __CFString *v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t j;
  uint64_t v77;
  GEOLocation *v78;
  GEOLocation *v79;
  GEOLocation *v80;
  const __CFString *v81;
  void *v82;
  GEOPDPlaceLookupParameters *v83;
  id v84;
  const __CFString *v85;
  void *v86;
  int v87;
  void *v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t k;
  void *v94;
  const __CFString *v95;
  void *v96;
  char v97;
  void *v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  GEOPlaceIdentifier *v105;
  void *v106;
  uint64_t v107;
  const __CFString *v108;
  void *v109;
  GEOPDMerchantLookupParameters *v110;
  GEOPDMerchantLookupParameters *v111;
  GEOPDMerchantLookupParameters *v112;
  const __CFString *v113;
  void *v114;
  GEOPDPlaceRefinementParameters *v115;
  void *v116;
  const __CFString *v117;
  void *v118;
  GEOPDSiriSearchParameters *v119;
  GEOPDSiriSearchParameters *v120;
  id v121;
  const __CFString *v122;
  void *v123;
  id v124;
  int v125;
  const __CFString *v126;
  void *v127;
  unsigned int v128;
  const __CFString *v129;
  void *v130;
  void *v131;
  void *v132;
  const __CFString *v133;
  void *v134;
  GEOPDViewportInfo *v135;
  GEOPDViewportInfo *v136;
  GEOPDViewportInfo *v137;
  void *v138;
  GEOAddress *v139;
  GEOAddress *v140;
  GEOAddress *v141;
  const __CFString *v142;
  void *v143;
  id v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t m;
  void *v149;
  void *v150;
  const __CFString *v151;
  void *v152;
  char v153;
  const __CFString *v154;
  void *v155;
  char v156;
  const __CFString *v157;
  void *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  const __CFString *v162;
  const __CFString *v163;
  const __CFString *v164;
  const __CFString *v165;
  uint64_t v166;
  void *v167;
  GEOPDSearchSubstringDescriptor *v168;
  id v169;
  void *v170;
  id v171;
  int v172;
  void *v173;
  void *v174;
  void *v175;
  id v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t n;
  void *v181;
  void *v182;
  const __CFString *v183;
  void *v184;
  GEOPDIndexQueryNode *v185;
  void *v186;
  const __CFString *v187;
  void *v188;
  GEOPDRecentRouteInfo *v189;
  void *v190;
  const __CFString *v191;
  void *v192;
  GEOPDLocationDirectedSearchParameters *v193;
  GEOPDLocationDirectedSearchParameters *v194;
  id v195;
  uint64_t v196;
  const __CFString *v197;
  void *v198;
  id v199;
  int v200;
  const __CFString *v201;
  void *v202;
  int v203;
  const __CFString *v204;
  void *v205;
  void *v206;
  unsigned int v207;
  const __CFString *v208;
  void *v209;
  GEOPDViewportInfo *v210;
  GEOPDViewportInfo *v211;
  GEOPDViewportInfo *v212;
  const __CFString *v213;
  void *v214;
  GEOLatLng *v215;
  GEOLatLng *v216;
  GEOLatLng *v217;
  const __CFString *v218;
  void *v219;
  id v220;
  int v221;
  const __CFString *v222;
  void *v223;
  GEOPDNearestTransitParameters *v224;
  id v225;
  const __CFString *v226;
  void *v227;
  uint64_t v228;
  const __CFString *v229;
  void *v230;
  char v231;
  const __CFString *v232;
  void *v233;
  GEOPDPaginationParameters *v234;
  void *v235;
  const __CFString *v236;
  void *v237;
  GEOPDSSearchFilter *v238;
  void *v239;
  const __CFString *v240;
  void *v241;
  GEOPDAutocompleteParameters *v242;
  GEOPDAutocompleteParameters *v243;
  GEOPDAutocompleteParameters *v244;
  const __CFString *v245;
  void *v246;
  GEOPDSearchBrowseCategorySuggestionParameters *v247;
  void *v248;
  const __CFString *v249;
  void *v250;
  GEOPDCategorySearchParameters *v251;
  GEOPDCategorySearchParameters *v252;
  id v253;
  os_unfair_lock_s *v254;
  const __CFString *v255;
  void *v256;
  int *v257;
  uint32_t v258;
  const __CFString *v259;
  void *v260;
  GEOPDViewportInfo *v261;
  GEOPDViewportInfo *v262;
  GEOPDViewportInfo *v263;
  const __CFString *v264;
  void *v265;
  void *v266;
  const __CFString *v267;
  void *v268;
  uint32_t v269;
  const __CFString *v270;
  void *v271;
  uint32_t v272;
  const __CFString *v273;
  void *v274;
  id v275;
  int v276;
  const __CFString *v277;
  void *v278;
  GEOPDRecentRouteInfo *v279;
  void *v280;
  const __CFString *v281;
  void *v282;
  char v283;
  const __CFString *v284;
  void *v285;
  GEOPDSSearchEvChargingParameters *v286;
  void *v287;
  const __CFString *v288;
  void *v289;
  id v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t ii;
  void *v295;
  id v296;
  const __CFString *v297;
  void *v298;
  GEOPDETAFilter *v299;
  void *v300;
  const __CFString *v301;
  void *v302;
  id v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t jj;
  void *v308;
  id v309;
  const __CFString *v310;
  void *v311;
  uint32_t v312;
  const __CFString *v313;
  void *v314;
  GEOPDResultRefinementQuery *v315;
  GEOPDResultRefinementQuery *v316;
  GEOPDResultRefinementQuery *v317;
  const __CFString *v318;
  void *v319;
  id v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t kk;
  void *v325;
  id v326;
  const __CFString *v327;
  void *v328;
  id v329;
  int v330;
  const __CFString *v331;
  void *v332;
  GEOPDViewportInfo *v333;
  GEOPDViewportInfo *v334;
  GEOPDViewportInfo *v335;
  const __CFString *v336;
  void *v337;
  id v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t mm;
  void *v343;
  id v344;
  const __CFString *v345;
  void *v346;
  id v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t nn;
  void *v352;
  id v353;
  const __CFString *v354;
  void *v355;
  char v356;
  const __CFString *v357;
  void *v358;
  char v359;
  const __CFString *v360;
  void *v361;
  GEOPDSearchOriginationInfo *v362;
  void *v363;
  const __CFString *v364;
  void *v365;
  void *v366;
  const __CFString *v367;
  void *v368;
  id v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  void *v374;
  GEOPDSearchEnrichmentRevisionMetadata *v375;
  void *v376;
  uint64_t v377;
  const __CFString *v378;
  void *v379;
  void *v380;
  const __CFString *v381;
  void *v382;
  GEOPDSSessionUserActionMetadata *v383;
  GEOPDSSessionUserActionMetadata *v384;
  GEOPDSSessionUserActionMetadata *v385;
  const __CFString *v386;
  void *v387;
  GEOPDPaginationParameters *v388;
  void *v389;
  const __CFString *v390;
  void *v391;
  GEOPDPopularNearbySearchParameters *v392;
  id v393;
  const __CFString *v394;
  void *v395;
  unsigned int v396;
  const __CFString *v397;
  void *v398;
  GEOPDViewportInfo *v399;
  GEOPDViewportInfo *v400;
  GEOPDViewportInfo *v401;
  const __CFString *v402;
  void *v403;
  void *v404;
  const __CFString *v405;
  void *v406;
  id v407;
  int v408;
  const __CFString *v409;
  void *v410;
  GEOPDSearchZeroKeywordCategorySuggestionParameters *v411;
  id v412;
  const __CFString *v413;
  void *v414;
  double v415;
  const __CFString *v416;
  void *v417;
  GEOLatLng *v418;
  GEOLatLng *v419;
  GEOLatLng *v420;
  const __CFString *v421;
  void *v422;
  unsigned int v423;
  const __CFString *v424;
  void *v425;
  id v426;
  int v427;
  const __CFString *v428;
  void *v429;
  char v430;
  const __CFString *v431;
  void *v432;
  GEOPDSearchFieldPlaceholderParameters *v433;
  id v434;
  void *v435;
  id v436;
  int v437;
  const __CFString *v438;
  void *v439;
  char v440;
  const __CFString *v441;
  void *v442;
  GEOPDBatchPopularNearbySearchParameters *v443;
  id v444;
  const __CFString *v445;
  void *v446;
  unsigned int v447;
  const __CFString *v448;
  void *v449;
  GEOPDViewportInfo *v450;
  GEOPDViewportInfo *v451;
  GEOPDViewportInfo *v452;
  const __CFString *v453;
  void *v454;
  double v455;
  const __CFString *v456;
  void *v457;
  id v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t i1;
  uint64_t v463;
  void *v464;
  const __CFString *v465;
  void *v466;
  GEOPDVendorSpecificPlaceRefinementParameters *v467;
  GEOPDVendorSpecificPlaceRefinementParameters *v468;
  id v469;
  uint64_t v470;
  const __CFString *v471;
  void *v472;
  int v473;
  void *v474;
  uint64_t v475;
  const __CFString *v476;
  void *v477;
  void *v478;
  const __CFString *v479;
  void *v480;
  void *v481;
  unsigned int v482;
  const __CFString *v483;
  void *v484;
  GEOLatLng *v485;
  GEOLatLng *v486;
  GEOLatLng *v487;
  const __CFString *v488;
  void *v489;
  GEOStructuredAddress *v490;
  GEOStructuredAddress *v491;
  GEOStructuredAddress *v492;
  const __CFString *v493;
  void *v494;
  void *v495;
  const __CFString *v496;
  void *v497;
  id v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t i2;
  void *v503;
  void *v504;
  const __CFString *v505;
  void *v506;
  id v507;
  int v508;
  const __CFString *v509;
  void *v510;
  id v511;
  int v512;
  const __CFString *v513;
  void *v514;
  void *v515;
  const __CFString *v516;
  void *v517;
  GEOPDNearbySearchParameters *v518;
  id v519;
  const __CFString *v520;
  void *v521;
  id v522;
  int v523;
  const __CFString *v524;
  void *v525;
  unsigned int v526;
  const __CFString *v527;
  void *v528;
  GEOPDViewportInfo *v529;
  GEOPDViewportInfo *v530;
  GEOPDViewportInfo *v531;
  const __CFString *v532;
  void *v533;
  GEOPDNearbySearchFilter *v534;
  id v535;
  const __CFString *v536;
  void *v537;
  id v538;
  uint64_t v539;
  uint64_t v540;
  uint64_t v541;
  uint64_t i3;
  void *v543;
  void *v544;
  const __CFString *v545;
  void *v546;
  id v547;
  id v548;
  int v549;
  const __CFString *v550;
  void *v551;
  GEOPDAddressObjectGeocodingParameters *v552;
  id v553;
  const __CFString *v554;
  void *v555;
  void *v556;
  const __CFString *v557;
  void *v558;
  unsigned int v559;
  const __CFString *v560;
  void *v561;
  GEOPDViewportInfo *v562;
  GEOPDViewportInfo *v563;
  GEOPDViewportInfo *v564;
  const __CFString *v565;
  void *v566;
  GEOPDSearchZeroKeywordWithSearchResultsSuggestionParameters *v567;
  id v568;
  const __CFString *v569;
  void *v570;
  unsigned int v571;
  const __CFString *v572;
  void *v573;
  unsigned int v574;
  const __CFString *v575;
  void *v576;
  unsigned int v577;
  const __CFString *v578;
  void *v579;
  unsigned int v580;
  const __CFString *v581;
  void *v582;
  GEOPDExternalTransitLookupParameters *v583;
  id v584;
  const __CFString *v585;
  void *v586;
  double v587;
  const __CFString *v588;
  void *v589;
  GEOLocation *v590;
  GEOLocation *v591;
  GEOLocation *v592;
  const __CFString *v593;
  void *v594;
  void *v595;
  const __CFString *v596;
  void *v597;
  id v598;
  uint64_t v599;
  uint64_t v600;
  uint64_t v601;
  uint64_t i4;
  uint64_t v603;
  void *v604;
  const __CFString *v605;
  void *v606;
  GEOPDFeatureIdGeocodingParameters *v607;
  id v608;
  const __CFString *v609;
  void *v610;
  uint64_t v611;
  const __CFString *v612;
  void *v613;
  id v614;
  uint64_t v615;
  uint64_t v616;
  uint64_t v617;
  uint64_t i5;
  void *v619;
  void *v620;
  GEOLatLng *v621;
  GEOLatLng *v622;
  GEOLatLng *v623;
  const __CFString *v624;
  void *v625;
  id v626;
  int v627;
  const __CFString *v628;
  void *v629;
  GEOPDMapsIdentifierPlaceLookupParameters *v630;
  id v631;
  const __CFString *v632;
  void *v633;
  int v634;
  const __CFString *v635;
  void *v636;
  id v637;
  uint64_t v638;
  uint64_t v639;
  uint64_t v640;
  uint64_t i6;
  uint64_t v642;
  GEOPDMapsIdentifier *v643;
  GEOPDMapsIdentifier *v644;
  GEOPDMapsIdentifier *v645;
  const __CFString *v646;
  void *v647;
  char v648;
  const __CFString *v649;
  void *v650;
  GEOPDBatchReverseGeocodingParameters *v651;
  id v652;
  const __CFString *v653;
  void *v654;
  id v655;
  uint64_t v656;
  uint64_t v657;
  uint64_t v658;
  uint64_t i7;
  uint64_t v660;
  GEOLocation *v661;
  GEOLocation *v662;
  GEOLocation *v663;
  const __CFString *v664;
  void *v665;
  id v666;
  uint64_t v667;
  uint64_t v668;
  uint64_t v669;
  uint64_t i8;
  void *v671;
  id v672;
  const __CFString *v673;
  void *v674;
  GEOPDBrandLookupParameters *v675;
  id v676;
  const __CFString *v677;
  void *v678;
  void *v679;
  const __CFString *v680;
  void *v681;
  GEOPDWifiFingerprintParameters *v682;
  GEOPDWifiFingerprintParameters *v683;
  id v684;
  void *v685;
  uint64_t v686;
  uint64_t v687;
  uint64_t v688;
  const __CFString *v689;
  const __CFString *v690;
  const __CFString *v691;
  const __CFString *v692;
  const __CFString *v693;
  uint64_t v694;
  void *v695;
  GEOPDWifiMeasurement *v696;
  GEOPDWifiMeasurement *v697;
  id v698;
  uint64_t v699;
  void *v700;
  id v701;
  uint64_t v702;
  uint64_t v703;
  uint64_t v704;
  uint64_t i9;
  uint64_t v706;
  GEOLocation *v707;
  GEOLocation *v708;
  GEOLocation *v709;
  void *v710;
  void *v711;
  id v712;
  uint64_t v713;
  uint64_t v714;
  uint64_t v715;
  uint64_t i10;
  void *v717;
  GEOPDWifiAccessPoint *v718;
  id v719;
  void *v720;
  void *v721;
  void *v722;
  int v723;
  void *v724;
  int v725;
  void *v726;
  uint64_t v727;
  void *v728;
  unsigned int v729;
  void *v730;
  uint64_t v731;
  void *v732;
  uint64_t v733;
  uint64_t v734;
  const __CFString *v735;
  void *v736;
  int v737;
  const __CFString *v738;
  void *v739;
  GEOPDIpGeoLookupParameters *v740;
  id v741;
  const __CFString *v742;
  void *v743;
  void *v744;
  const __CFString *v745;
  void *v746;
  GEOPDGroundViewLabelParameters *v747;
  id v748;
  const __CFString *v749;
  void *v750;
  uint64_t v751;
  void *v752;
  GEOLocation *v753;
  GEOLocation *v754;
  GEOLocation *v755;
  const __CFString *v756;
  void *v757;
  GEOPDBatchSpatialLookupParameters *v758;
  id v759;
  const __CFString *v760;
  void *v761;
  id v762;
  uint64_t v763;
  uint64_t v764;
  uint64_t v765;
  uint64_t v766;
  void *v767;
  GEOPDSpatialPlaceLookupParameters *v768;
  void *v769;
  uint64_t v770;
  const __CFString *v771;
  void *v772;
  id v773;
  uint64_t v774;
  uint64_t v775;
  uint64_t v776;
  uint64_t v777;
  void *v778;
  GEOPDSpatialEventLookupParameters *v779;
  void *v780;
  uint64_t v781;
  const __CFString *v782;
  void *v783;
  GEOPDTransitVehiclePositionParameters *v784;
  id v785;
  const __CFString *v786;
  void *v787;
  id v788;
  uint64_t v789;
  uint64_t v790;
  uint64_t v791;
  uint64_t i11;
  void *v793;
  const __CFString *v794;
  void *v795;
  GEOPDPlaceCollectionLookupParameters *v796;
  id v797;
  void *v798;
  GEOLatLng *v799;
  GEOLatLng *v800;
  GEOLatLng *v801;
  const __CFString *v802;
  void *v803;
  id v804;
  uint64_t v805;
  uint64_t v806;
  uint64_t v807;
  uint64_t i12;
  uint64_t v809;
  GEOPDMapsIdentifier *v810;
  GEOPDMapsIdentifier *v811;
  GEOPDMapsIdentifier *v812;
  const __CFString *v813;
  void *v814;
  GEOPBTransitScheduleLookupParameters *v815;
  GEOPBTransitScheduleLookupParameters *v816;
  GEOPBTransitScheduleLookupParameters *v817;
  const __CFString *v818;
  void *v819;
  GEOPDBatchCategoryLookupParameters *v820;
  id v821;
  const __CFString *v822;
  void *v823;
  id v824;
  uint64_t v825;
  uint64_t v826;
  uint64_t v827;
  uint64_t v828;
  void *v829;
  GEOPDCategoryLookupParameters *v830;
  void *v831;
  uint64_t v832;
  const __CFString *v833;
  void *v834;
  GEOPDBatchMerchantLookupBrandParameters *v835;
  GEOPDBatchMerchantLookupBrandParameters *v836;
  id v837;
  const __CFString *v838;
  void *v839;
  uint64_t v840;
  uint64_t v841;
  uint64_t v842;
  const __CFString *v843;
  const __CFString *v844;
  const __CFString *v845;
  const __CFString *v846;
  const __CFString *v847;
  const __CFString *v848;
  const __CFString *v849;
  uint64_t v850;
  void *v851;
  GEOPDMerchantLookupBrandParameters *v852;
  GEOPDMerchantLookupBrandParameters *v853;
  id v854;
  uint64_t v855;
  void *v856;
  void *v857;
  id v858;
  void *v859;
  void *v860;
  id v861;
  void *v862;
  GEOPDWarsawMerchantIdentifier *v863;
  void *v864;
  id v865;
  void *v866;
  GEOPDAdamAppIdentifier *v867;
  void *v868;
  id v869;
  void *v870;
  void *v871;
  id v872;
  void *v873;
  void *v874;
  id v875;
  void *v876;
  GEOPDIdentityMerchantInformation *v877;
  void *v878;
  id v879;
  uint64_t v880;
  const __CFString *v881;
  void *v882;
  GEOPDChildPlaceLookupByCategoryParameters *v883;
  id v884;
  const __CFString *v885;
  void *v886;
  void *v887;
  const __CFString *v888;
  void *v889;
  uint64_t v890;
  const __CFString *v891;
  void *v892;
  GEOPDCollectionSuggestionParameters *v893;
  void *v894;
  const __CFString *v895;
  void *v896;
  GEOPDMapsSearchHomeParameters *v897;
  GEOPDMapsSearchHomeParameters *v898;
  id v899;
  GEOPDMapsSearchHomeParameters *v900;
  const __CFString *v901;
  void *v902;
  id v903;
  uint64_t v904;
  uint64_t v905;
  uint64_t v906;
  uint64_t i13;
  void *v908;
  id v909;
  const __CFString *v910;
  void *v911;
  GEOPDSearchBrowseCategorySuggestionParameters *v912;
  void *v913;
  void *v914;
  GEOPDCollectionSuggestionParameters *v915;
  void *v916;
  const __CFString *v917;
  void *v918;
  GEOPDPublisherSuggestionParameters *v919;
  void *v920;
  const __CFString *v921;
  void *v922;
  GEOPDPlaceSuggestionParameters *v923;
  id v924;
  const __CFString *v925;
  void *v926;
  GEOPDViewportInfo *v927;
  GEOPDViewportInfo *v928;
  GEOPDViewportInfo *v929;
  const __CFString *v930;
  void *v931;
  id v932;
  uint64_t v933;
  uint64_t v934;
  uint64_t v935;
  uint64_t i14;
  void *v937;
  void *v938;
  const __CFString *v939;
  void *v940;
  id v941;
  uint64_t v942;
  uint64_t v943;
  uint64_t v944;
  uint64_t i15;
  uint64_t v946;
  GEOPDMapsIdentifier *v947;
  GEOPDMapsIdentifier *v948;
  GEOPDMapsIdentifier *v949;
  const __CFString *v950;
  void *v951;
  GEOPDGuidesLocationsSuggestionParameters *v952;
  id v953;
  const __CFString *v954;
  void *v955;
  GEOPDViewportInfo *v956;
  GEOPDViewportInfo *v957;
  GEOPDViewportInfo *v958;
  const __CFString *v959;
  void *v960;
  GEOPDSearchOriginationInfo *v961;
  void *v962;
  const __CFString *v963;
  void *v964;
  GEOPDPlaceQuestionnaireLookupParameters *v965;
  void *v966;
  const __CFString *v967;
  void *v968;
  GEOPDPublisherViewParameters *v969;
  id v970;
  const __CFString *v971;
  void *v972;
  GEOPDMapsIdentifier *v973;
  GEOPDMapsIdentifier *v974;
  GEOPDMapsIdentifier *v975;
  const __CFString *v976;
  void *v977;
  unsigned int v978;
  const __CFString *v979;
  void *v980;
  GEOPDPublisherViewResultFilter *v981;
  void *v982;
  const __CFString *v983;
  void *v984;
  GEOPDViewportInfo *v985;
  GEOPDViewportInfo *v986;
  GEOPDViewportInfo *v987;
  const __CFString *v988;
  void *v989;
  GEOPDAllCollectionsViewParameters *v990;
  id v991;
  const __CFString *v992;
  void *v993;
  GEOPDPublisherSuggestionParameters *v994;
  void *v995;
  const __CFString *v996;
  void *v997;
  unsigned int v998;
  const __CFString *v999;
  void *v1000;
  GEOPDAllCollectionsViewResultFilter *v1001;
  void *v1002;
  const __CFString *v1003;
  void *v1004;
  GEOPDViewportInfo *v1005;
  GEOPDViewportInfo *v1006;
  GEOPDViewportInfo *v1007;
  const __CFString *v1008;
  void *v1009;
  GEOPDAirportEntityPlaceLookupParameters *v1010;
  id v1011;
  const __CFString *v1012;
  void *v1013;
  void *v1014;
  const __CFString *v1015;
  void *v1016;
  void *v1017;
  const __CFString *v1018;
  void *v1019;
  void *v1020;
  const __CFString *v1021;
  void *v1022;
  GEOPDTerritoryLookupParameters *v1023;
  id v1024;
  void *v1025;
  id v1026;
  uint64_t v1027;
  uint64_t v1028;
  uint64_t v1029;
  uint64_t i16;
  uint64_t v1031;
  GEOLatLngE7 *v1032;
  GEOLatLngE7 *v1033;
  GEOLatLngE7 *v1034;
  const __CFString *v1035;
  void *v1036;
  GEOPDTransitNearbyScheduleLookupParameters *v1037;
  id v1038;
  const __CFString *v1039;
  void *v1040;
  id v1041;
  uint64_t v1042;
  uint64_t v1043;
  uint64_t v1044;
  const __CFString *v1045;
  uint64_t v1046;
  void *v1047;
  GEOPDTransitNearbyScheduleLookupOrigin *v1048;
  GEOPDTransitNearbyScheduleLookupOrigin *v1049;
  id v1050;
  GEOPDTransitNearbyScheduleLookupOrigin *v1051;
  void *v1052;
  GEOWaypointTyped *v1053;
  GEOWaypointTyped *v1054;
  GEOWaypointTyped *v1055;
  uint64_t v1056;
  const __CFString *v1057;
  void *v1058;
  GEOWaypointTyped *v1059;
  GEOWaypointTyped *v1060;
  GEOWaypointTyped *v1061;
  const __CFString *v1062;
  void *v1063;
  GEOPDMapsHomeParameters *v1064;
  id v1065;
  void *v1066;
  GEOPDCollectionSuggestionParameters *v1067;
  void *v1068;
  const __CFString *v1069;
  void *v1070;
  char v1071;
  const __CFString *v1072;
  void *v1073;
  GEOPDAllGuidesLocationsViewParameters *v1074;
  id v1075;
  const __CFString *v1076;
  void *v1077;
  GEOPDViewportInfo *v1078;
  GEOPDViewportInfo *v1079;
  GEOPDViewportInfo *v1080;
  const __CFString *v1081;
  void *v1082;
  unsigned int v1083;
  const __CFString *v1084;
  void *v1085;
  GEOPDGuidesHomeParameters *v1086;
  GEOPDGuidesHomeParameters *v1087;
  id v1088;
  GEOPDGuidesHomeParameters *v1089;
  const __CFString *v1090;
  void *v1091;
  id v1092;
  uint64_t v1093;
  uint64_t v1094;
  uint64_t v1095;
  uint64_t i17;
  void *v1097;
  id v1098;
  const __CFString *v1099;
  void *v1100;
  id v1101;
  uint64_t v1102;
  uint64_t v1103;
  uint64_t v1104;
  uint64_t i18;
  void *v1106;
  id v1107;
  const __CFString *v1108;
  void *v1109;
  GEOPDViewportInfo *v1110;
  GEOPDViewportInfo *v1111;
  GEOPDViewportInfo *v1112;
  const __CFString *v1113;
  void *v1114;
  GEOPDGuidesLocationEntry *v1115;
  void *v1116;
  const __CFString *v1117;
  void *v1118;
  GEOPDGuidesHomeResultFilter *v1119;
  void *v1120;
  const __CFString *v1121;
  void *v1122;
  GEOPDResultRefinementGuidesHome *v1123;
  void *v1124;
  const __CFString *v1125;
  void *v1126;
  GEOPDExtendedGeoLookupParameters *v1127;
  id v1128;
  const __CFString *v1129;
  void *v1130;
  GEOAddress *v1131;
  GEOAddress *v1132;
  GEOAddress *v1133;
  const __CFString *v1134;
  void *v1135;
  uint64_t v1136;
  unsigned int v1137;
  const __CFString *v1138;
  void *v1139;
  GEOLatLng *v1140;
  GEOLatLng *v1141;
  GEOLatLng *v1142;
  const __CFString *v1143;
  void *v1144;
  id v1145;
  uint64_t v1146;
  uint64_t v1147;
  uint64_t v1148;
  uint64_t i19;
  void *v1150;
  const __CFString *v1151;
  void *v1152;
  char v1153;
  const __CFString *v1154;
  void *v1155;
  uint64_t v1156;
  const __CFString *v1157;
  void *v1158;
  void *v1159;
  const __CFString *v1160;
  void *v1161;
  char v1162;
  const __CFString *v1163;
  void *v1164;
  GEOInterpolationParameters *v1165;
  GEOInterpolationParameters *v1166;
  GEOInterpolationParameters *v1167;
  const __CFString *v1168;
  void *v1169;
  GEOPDQueryUnderstandingParameters *v1170;
  GEOPDQueryUnderstandingParameters *v1171;
  id v1172;
  uint64_t v1173;
  void *v1174;
  id v1175;
  int v1176;
  const __CFString *v1177;
  void *v1178;
  void *v1179;
  const __CFString *v1180;
  void *v1181;
  GEOPDViewportInfo *v1182;
  GEOPDViewportInfo *v1183;
  GEOPDViewportInfo *v1184;
  void *v1185;
  id v1186;
  int v1187;
  const __CFString *v1188;
  void *v1189;
  GEOPDQueryUnderstandingTaxonomySearchParameters *v1190;
  GEOPDQueryUnderstandingTaxonomySearchParameters *v1191;
  id v1192;
  uint64_t v1193;
  const __CFString *v1194;
  void *v1195;
  int v1196;
  void *v1197;
  void *v1198;
  const __CFString *v1199;
  void *v1200;
  id v1201;
  uint64_t v1202;
  uint64_t v1203;
  uint64_t v1204;
  uint64_t i22;
  void *v1206;
  void *v1207;
  const __CFString *v1208;
  void *v1209;
  GEOPDQueryUnderstandingTaxonomyLookupParameters *v1210;
  id v1211;
  void *v1212;
  id v1213;
  uint64_t v1214;
  uint64_t v1215;
  uint64_t v1216;
  uint64_t i20;
  void *v1218;
  void *v1219;
  const __CFString *v1220;
  void *v1221;
  id v1222;
  uint64_t v1223;
  uint64_t v1224;
  uint64_t v1225;
  uint64_t i21;
  void *v1227;
  void *v1228;
  const __CFString *v1229;
  void *v1230;
  GEOPDPoiAtAddressLookupParameters *v1231;
  id v1232;
  void *v1233;
  id v1234;
  uint64_t v1235;
  uint64_t v1236;
  uint64_t v1237;
  uint64_t v1238;
  void *v1239;
  GEOPDComponent *v1240;
  char *v1241;
  uint64_t v1242;
  const __CFString *v1243;
  void *v1244;
  GEOPDTransitNearbyPaymentMethodLookupParameters *v1245;
  id v1246;
  const __CFString *v1247;
  void *v1248;
  id v1249;
  uint64_t v1250;
  uint64_t v1251;
  uint64_t v1252;
  const __CFString *v1253;
  uint64_t v1254;
  void *v1255;
  GEOPDTransitNearbyPaymentMethodLookupOrigin *v1256;
  GEOPDTransitNearbyPaymentMethodLookupOrigin *v1257;
  id v1258;
  GEOPDTransitNearbyPaymentMethodLookupOrigin *v1259;
  void *v1260;
  GEOWaypointTyped *v1261;
  GEOWaypointTyped *v1262;
  GEOWaypointTyped *v1263;
  uint64_t v1264;
  const __CFString *v1265;
  void *v1266;
  GEOPDPlacecardEnrichmentParameters *v1267;
  id v1268;
  const __CFString *v1269;
  void *v1270;
  GEOPDMapsIdentifier *v1271;
  GEOPDMapsIdentifier *v1272;
  GEOPDMapsIdentifier *v1273;
  const __CFString *v1274;
  void *v1275;
  id v1276;
  uint64_t v1277;
  uint64_t v1278;
  uint64_t v1279;
  uint64_t v1280;
  void *v1281;
  GEOPDEnrichmentInfo *v1282;
  void *v1283;
  uint64_t v1284;
  const __CFString *v1285;
  void *v1286;
  char v1287;
  const __CFString *v1288;
  void *v1289;
  GEOPDOfflineRegionNameParameters *v1290;
  id v1291;
  void *v1292;
  GEOMapRegion *v1293;
  GEOMapRegion *v1294;
  GEOMapRegion *v1295;
  const __CFString *v1296;
  void *v1297;
  GEOPDSearchCapabilitiesParameters *v1298;
  id v1299;
  const __CFString *v1300;
  void *v1301;
  GEOPDViewportInfo *v1302;
  GEOPDViewportInfo *v1303;
  GEOPDViewportInfo *v1304;
  const __CFString *v1305;
  void *v1306;
  GEOPDRefreshIdLookUpParameters *v1307;
  id v1308;
  const __CFString *v1309;
  void *v1310;
  id v1311;
  uint64_t v1312;
  uint64_t v1313;
  uint64_t v1314;
  uint64_t i23;
  uint64_t v1316;
  GEOPDMapsIdentifier *v1317;
  GEOPDMapsIdentifier *v1318;
  GEOPDMapsIdentifier *v1319;
  const __CFString *v1320;
  void *v1321;
  GEOPDAddressRecommendationParameters *v1322;
  id v1323;
  const __CFString *v1324;
  void *v1325;
  void *v1326;
  const __CFString *v1327;
  void *v1328;
  GEOPDAddressWithComponents *v1329;
  void *v1330;
  void *v1332;
  id v1333;
  void *v1334;
  void *v1335;
  void *v1336;
  const __CFString *v1337;
  id v1338;
  void *v1339;
  const __CFString *v1340;
  void *v1341;
  const __CFString *v1342;
  const __CFString *v1343;
  const __CFString *v1344;
  const __CFString *v1345;
  uint64_t v1346;
  const __CFString *v1347;
  const __CFString *v1348;
  uint64_t v1349;
  const __CFString *v1350;
  const __CFString *v1351;
  uint64_t v1352;
  const __CFString *v1353;
  id v1354;
  id v1355;
  const __CFString *v1356;
  id v1357;
  uint64_t v1358;
  uint64_t v1359;
  const __CFString *v1360;
  void *v1361;
  void *v1362;
  void *v1363;
  uint64_t v1364;
  void *v1365;
  void *v1366;
  void *v1367;
  void *v1368;
  void *v1369;
  void *v1370;
  void *v1371;
  const __CFString *v1372;
  void *v1373;
  void *v1374;
  id v1375;
  void *v1376;
  void *v1377;
  void *v1378;
  unsigned int v1379;
  id obj;
  id obja;
  id objb;
  id objc;
  const __CFString *objd;
  GEOPDBatchMerchantLookupBrandParameters *obje;
  id objf;
  id objg;
  id objh;
  id obji;
  id objj;
  id objk;
  GEOPDSiriSearchParameters *v1392;
  id v1393;
  id v1394;
  id v1395;
  id v1396;
  const __CFString *v1397;
  id v1398;
  id v1399;
  const __CFString *v1400;
  const __CFString *v1401;
  const __CFString *v1402;
  id v1403;
  id v1404;
  __int128 v1405;
  __int128 v1406;
  __int128 v1407;
  __int128 v1408;
  __int128 v1409;
  __int128 v1410;
  __int128 v1411;
  __int128 v1412;
  __int128 v1413;
  __int128 v1414;
  __int128 v1415;
  __int128 v1416;
  __int128 v1417;
  __int128 v1418;
  __int128 v1419;
  __int128 v1420;
  __int128 v1421;
  __int128 v1422;
  __int128 v1423;
  __int128 v1424;
  __int128 v1425;
  __int128 v1426;
  __int128 v1427;
  __int128 v1428;
  __int128 v1429;
  __int128 v1430;
  __int128 v1431;
  __int128 v1432;
  __int128 v1433;
  __int128 v1434;
  __int128 v1435;
  __int128 v1436;
  __int128 v1437;
  __int128 v1438;
  __int128 v1439;
  __int128 v1440;
  __int128 v1441;
  __int128 v1442;
  __int128 v1443;
  __int128 v1444;
  __int128 v1445;
  __int128 v1446;
  __int128 v1447;
  __int128 v1448;
  _BYTE v1449[128];
  uint64_t v1450;

  v1450 = *MEMORY[0x1E0C80C00];
  v1357 = a2;
  if (!a1)
    goto LABEL_2655;
  a1 = (id)objc_msgSend(a1, "init");

  v1335 = a1;
  if (!a1)
    goto LABEL_2655;
  if ((_DWORD)a3)
    v5 = CFSTR("searchParameters");
  else
    v5 = CFSTR("search_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = [GEOPDSearchParameters alloc];
    if (v7)
      v8 = -[GEOPDSearchParameters _initWithDictionary:isJSON:](v7, v6, a3);
    else
      v8 = 0;
    -[GEOPDPlaceRequestParameters setSearchParameters:]((uint64_t)v1335, v8);

  }
  if ((_DWORD)a3)
    v9 = CFSTR("geocodingParameters");
  else
    v9 = CFSTR("geocoding_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = [GEOPDGeocodingParameters alloc];
    if (v11)
    {
      v12 = v10;
      v11 = -[GEOPDGeocodingParameters init](v11, "init");
      if (v11)
      {
        if ((_DWORD)a3)
          v13 = CFSTR("queryString");
        else
          v13 = CFSTR("query_string");
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = (void *)objc_msgSend(v14, "copy");
          -[GEOPDGeocodingParameters setQueryString:]((uint64_t)v11, v15);

        }
        if ((_DWORD)a3)
          v16 = CFSTR("maxResults");
        else
          v16 = CFSTR("max_results");
        objc_msgSend(v12, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = objc_msgSend(v17, "unsignedIntValue");
          *(_WORD *)&v11->_flags |= 0x100u;
          *(_WORD *)&v11->_flags |= 1u;
          v11->_maxResults = v18;
        }

        if ((_DWORD)a3)
          v19 = CFSTR("viewportInfo");
        else
          v19 = CFSTR("viewport_info");
        objc_msgSend(v12, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = [GEOPDViewportInfo alloc];
          if ((a3 & 1) != 0)
            v22 = -[GEOPDViewportInfo initWithJSON:](v21, "initWithJSON:", v20);
          else
            v22 = -[GEOPDViewportInfo initWithDictionary:](v21, "initWithDictionary:", v20);
          v23 = v22;
          -[GEOPDGeocodingParameters setViewportInfo:]((uint64_t)v11, v22);

        }
        if ((_DWORD)a3)
          v24 = CFSTR("structuredAddress");
        else
          v24 = CFSTR("structured_address");
        objc_msgSend(v12, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v26 = [GEOStructuredAddress alloc];
          if ((a3 & 1) != 0)
            v27 = -[GEOStructuredAddress initWithJSON:](v26, "initWithJSON:", v25);
          else
            v27 = -[GEOStructuredAddress initWithDictionary:](v26, "initWithDictionary:", v25);
          v28 = v27;
          -[GEOPDGeocodingParameters setStructuredAddress:]((uint64_t)v11, v27);

        }
        if ((_DWORD)a3)
          v29 = CFSTR("punchInHints");
        else
          v29 = CFSTR("punch_in_hints");
        objc_msgSend(v12, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v31 = [GEOPDSPunchInHints alloc];
          if (v31)
            v32 = -[GEOPDSPunchInHints _initWithDictionary:isJSON:](v31, v30, a3);
          else
            v32 = 0;
          -[GEOPDGeocodingParameters setPunchInHints:]((uint64_t)v11, v32);

        }
        if ((_DWORD)a3)
          v33 = CFSTR("isStrictMapRegion");
        else
          v33 = CFSTR("is_strict_map_region");
        objc_msgSend(v12, "objectForKeyedSubscript:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v35 = objc_msgSend(v34, "BOOLValue");
          *(_WORD *)&v11->_flags |= 0x100u;
          *(_WORD *)&v11->_flags |= 2u;
          v11->_isStrictMapRegion = v35;
        }

        if ((_DWORD)a3)
          v36 = CFSTR("addressResultSubTypeFilter");
        else
          v36 = CFSTR("address_result_sub_type_filter");
        objc_msgSend(v12, "objectForKeyedSubscript:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v38 = [GEOPDAddressResultSubTypeFilter alloc];
          if (v38)
            v39 = (void *)-[GEOPDAddressResultSubTypeFilter _initWithDictionary:isJSON:](v38, v37, a3);
          else
            v39 = 0;
          -[GEOPDGeocodingParameters setAddressResultSubTypeFilter:]((uint64_t)v11, v39);

        }
      }

    }
    -[GEOPDPlaceRequestParameters setGeocodingParameters:]((uint64_t)v1335, v11);

  }
  if ((_DWORD)a3)
    v40 = CFSTR("canonicalLocationSearchParameters");
  else
    v40 = CFSTR("canonical_location_search_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = [GEOPDCanonicalLocationSearchParameters alloc];
    if (v42)
    {
      v43 = v41;
      v42 = -[GEOPDCanonicalLocationSearchParameters init](v42, "init");
      if (v42)
      {
        if ((_DWORD)a3)
          v44 = CFSTR("queryString");
        else
          v44 = CFSTR("query_string");
        objc_msgSend(v43, "objectForKeyedSubscript:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v46 = (void *)objc_msgSend(v45, "copy");
          -[GEOPDCanonicalLocationSearchParameters setQueryString:]((uint64_t)v42, v46);

        }
      }

    }
    -[GEOPDPlaceRequestParameters setCanonicalLocationSearchParameters:]((uint64_t)v1335, v42);

  }
  if ((_DWORD)a3)
    v47 = CFSTR("reverseGeocodingParameters");
  else
    v47 = CFSTR("reverse_geocoding_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v1379 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v49 = [GEOPDReverseGeocodingParameters alloc];
    if (!v49)
    {
      v52 = 0;
LABEL_180:
      -[GEOPDPlaceRequestParameters setReverseGeocodingParameters:]((uint64_t)v1335, (void *)v52);

      goto LABEL_181;
    }
    v50 = v49;
    v51 = v48;
    v52 = -[GEOPDReverseGeocodingParameters init](v50, "init");
    if (!v52)
    {
LABEL_179:

      goto LABEL_180;
    }
    objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("location"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v1443 = 0u;
      v1444 = 0u;
      v1441 = 0u;
      v1442 = 0u;
      v54 = v53;
      v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v1441, v1449, 16);
      if (v55)
      {
        v56 = v55;
        v57 = *(_QWORD *)v1442;
        do
        {
          for (i = 0; i != v56; ++i)
          {
            if (*(_QWORD *)v1442 != v57)
              objc_enumerationMutation(v54);
            v59 = *(_QWORD *)(*((_QWORD *)&v1441 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v60 = [GEOLatLng alloc];
              if ((v1379 & 1) != 0)
                v61 = -[GEOLatLng initWithJSON:](v60, "initWithJSON:", v59);
              else
                v61 = -[GEOLatLng initWithDictionary:](v60, "initWithDictionary:", v59);
              v62 = v61;
              -[GEOPDReverseGeocodingParameters addLocation:](v52, v61);

            }
          }
          v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v1441, v1449, 16);
        }
        while (v56);
      }

      a3 = v1379;
    }

    if ((_DWORD)a3)
      v63 = CFSTR("placeTypeLimit");
    else
      v63 = CFSTR("place_type_limit");
    objc_msgSend(v51, "objectForKeyedSubscript:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v65 = v64;
      if ((objc_msgSend(v65, "isEqualToString:", CFSTR("UNKNOWN_PLACE_TYPE")) & 1) != 0)
      {
        v66 = 0;
      }
      else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("COUNTRY")) & 1) != 0)
      {
        v66 = 1;
      }
      else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("ADMINISTRATIVE_AREA")) & 1) != 0)
      {
        v66 = 2;
      }
      else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("SUB_ADMINISTRATIVE_AREA")) & 1) != 0)
      {
        v66 = 4;
      }
      else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("LOCALITY")) & 1) != 0)
      {
        v66 = 16;
      }
      else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("TIME_ZONE")) & 1) != 0)
      {
        v66 = 35;
      }
      else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("SUB_LOCALITY")) & 1) != 0)
      {
        v66 = 43;
      }
      else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("OCEAN")) & 1) != 0)
      {
        v66 = 44;
      }
      else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("AOI")) & 1) != 0)
      {
        v66 = 45;
      }
      else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("INLAND_WATER")) & 1) != 0)
      {
        v66 = 46;
      }
      else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
      {
        v66 = 47;
      }
      else
      {
        if ((objc_msgSend(v65, "isEqualToString:", CFSTR("ISLAND")) & 1) != 0)
        {
          v66 = 48;
        }
        else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("STREET")) & 1) != 0)
        {
          v66 = 49;
        }
        else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("ADMIN")) & 1) != 0)
        {
          v66 = 50;
        }
        else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("POSTAL")) & 1) != 0)
        {
          v66 = 51;
        }
        else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("INTERSECTION")) & 1) != 0)
        {
          v66 = 54;
        }
        else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("BUILDING")) & 1) != 0)
        {
          v66 = 55;
        }
        else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
        {
          v66 = 57;
        }
        else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("CONTINENT")) & 1) != 0)
        {
          v66 = 61;
        }
        else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("REGION")) & 1) != 0)
        {
          v66 = 63;
        }
        else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("DIVISION")) & 1) != 0)
        {
          v66 = 64;
        }
        else if (objc_msgSend(v65, "isEqualToString:", CFSTR("PHYSICAL_FEATURE")))
        {
          v66 = 65;
        }
        else
        {
          v66 = 0;
        }
        a3 = v1379;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_156:

        if ((_DWORD)a3)
          v67 = CFSTR("preserveOriginalLocation");
        else
          v67 = CFSTR("preserve_original_location");
        objc_msgSend(v51, "objectForKeyedSubscript:", v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v69 = objc_msgSend(v68, "BOOLValue");
          *(_BYTE *)(v52 + 60) |= 0x20u;
          *(_BYTE *)(v52 + 60) |= 2u;
          *(_BYTE *)(v52 + 56) = v69;
        }

        if ((_DWORD)a3)
          v70 = CFSTR("extendedLocation");
        else
          v70 = CFSTR("extended_location");
        objc_msgSend(v51, "objectForKeyedSubscript:", v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1439 = 0u;
          v1440 = 0u;
          v1437 = 0u;
          v1438 = 0u;
          v72 = v71;
          v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v1437, &v1445, 16);
          if (v73)
          {
            v74 = v73;
            v75 = *(_QWORD *)v1438;
            do
            {
              for (j = 0; j != v74; ++j)
              {
                if (*(_QWORD *)v1438 != v75)
                  objc_enumerationMutation(v72);
                v77 = *(_QWORD *)(*((_QWORD *)&v1437 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v78 = [GEOLocation alloc];
                  if ((v1379 & 1) != 0)
                    v79 = -[GEOLocation initWithJSON:](v78, "initWithJSON:", v77);
                  else
                    v79 = -[GEOLocation initWithDictionary:](v78, "initWithDictionary:", v77);
                  v80 = v79;
                  -[GEOPDReverseGeocodingParameters addExtendedLocation:](v52, v79);

                }
              }
              v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v1437, &v1445, 16);
            }
            while (v74);
          }

          a3 = v1379;
        }

        goto LABEL_179;
      }
      v66 = objc_msgSend(v64, "intValue");
    }
    *(_BYTE *)(v52 + 60) |= 0x20u;
    *(_BYTE *)(v52 + 60) |= 1u;
    *(_DWORD *)(v52 + 52) = v66;
    goto LABEL_156;
  }
LABEL_181:

  if ((_DWORD)a3)
    v81 = CFSTR("placeLookupParameters");
  else
    v81 = CFSTR("place_lookup_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v83 = [GEOPDPlaceLookupParameters alloc];
    if (v83)
    {
      v84 = v82;
      v83 = -[GEOPDPlaceLookupParameters init](v83, "init");
      if (v83)
      {
        if ((_DWORD)a3)
          v85 = CFSTR("resultProviderId");
        else
          v85 = CFSTR("result_provider_id");
        objc_msgSend(v84, "objectForKeyedSubscript:", v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v87 = objc_msgSend(v86, "intValue");
          *(_BYTE *)&v83->_flags |= 0x20u;
          *(_BYTE *)&v83->_flags |= 1u;
          v83->_resultProviderId = v87;
        }

        objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("muid"));
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1443 = 0u;
          v1444 = 0u;
          v1441 = 0u;
          v1442 = 0u;
          v89 = v88;
          v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v1441, v1449, 16);
          if (v90)
          {
            v91 = v90;
            v92 = *(_QWORD *)v1442;
            do
            {
              for (k = 0; k != v91; ++k)
              {
                if (*(_QWORD *)v1442 != v92)
                  objc_enumerationMutation(v89);
                v94 = *(void **)(*((_QWORD *)&v1441 + 1) + 8 * k);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v94, "unsignedLongLongValue");
                  -[GEOPDPlaceLookupParameters addMuid:]((uint64_t)v83);
                }
              }
              v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v1441, v1449, 16);
            }
            while (v91);
          }

        }
        if (v1379)
          v95 = CFSTR("enablePartialClientization");
        else
          v95 = CFSTR("enable_partial_clientization");
        objc_msgSend(v84, "objectForKeyedSubscript:", v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v97 = objc_msgSend(v96, "BOOLValue");
          *(_BYTE *)&v83->_flags |= 0x20u;
          *(_BYTE *)&v83->_flags |= 2u;
          v83->_enablePartialClientization = v97;
        }

        objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("identifier"));
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1439 = 0u;
          v1440 = 0u;
          v1437 = 0u;
          v1438 = 0u;
          v99 = v98;
          v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v1437, &v1445, 16);
          if (v100)
          {
            v101 = v100;
            v102 = *(_QWORD *)v1438;
            do
            {
              v103 = 0;
              do
              {
                if (*(_QWORD *)v1438 != v102)
                  objc_enumerationMutation(v99);
                v104 = *(void **)(*((_QWORD *)&v1437 + 1) + 8 * v103);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v105 = [GEOPlaceIdentifier alloc];
                  if (v105)
                    v106 = (void *)-[GEOPlaceIdentifier _initWithDictionary:isJSON:]((uint64_t)v105, v104, v1379);
                  else
                    v106 = 0;
                  -[GEOPDPlaceLookupParameters addIdentifier:](v83, "addIdentifier:", v106);

                }
                ++v103;
              }
              while (v101 != v103);
              v107 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v1437, &v1445, 16);
              v101 = v107;
            }
            while (v107);
          }

        }
        a3 = v1379;
      }

    }
    -[GEOPDPlaceRequestParameters setPlaceLookupParameters:]((uint64_t)v1335, v83);

  }
  if ((_DWORD)a3)
    v108 = CFSTR("merchantLookupParameters");
  else
    v108 = CFSTR("merchant_lookup_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v110 = [GEOPDMerchantLookupParameters alloc];
    if ((a3 & 1) != 0)
      v111 = -[GEOPDMerchantLookupParameters initWithJSON:](v110, "initWithJSON:", v109);
    else
      v111 = -[GEOPDMerchantLookupParameters initWithDictionary:](v110, "initWithDictionary:", v109);
    v112 = v111;
    -[GEOPDPlaceRequestParameters setMerchantLookupParameters:]((uint64_t)v1335, v111);

  }
  if ((_DWORD)a3)
    v113 = CFSTR("placeRefinementParameters");
  else
    v113 = CFSTR("place_refinement_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v115 = [GEOPDPlaceRefinementParameters alloc];
    if (v115)
      v116 = (void *)-[GEOPDPlaceRefinementParameters _initWithDictionary:isJSON:]((uint64_t)v115, v114, a3);
    else
      v116 = 0;
    -[GEOPDPlaceRequestParameters setPlaceRefinementParameters:]((uint64_t)v1335, v116);

  }
  if ((_DWORD)a3)
    v117 = CFSTR("siriSearchParameters");
  else
    v117 = CFSTR("siri_search_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v119 = [GEOPDSiriSearchParameters alloc];
    if (!v119)
    {
      v1392 = 0;
      goto LABEL_386;
    }
    v120 = v119;
    v121 = v118;
    v1392 = -[GEOPDSiriSearchParameters init](v120, "init");
    if (!v1392)
    {
LABEL_385:

LABEL_386:
      -[GEOPDPlaceRequestParameters setSiriSearchParameters:]((uint64_t)v1335, v1392);

      goto LABEL_387;
    }
    if ((_DWORD)a3)
      v122 = CFSTR("sortOrder");
    else
      v122 = CFSTR("sort_order");
    objc_msgSend(v121, "objectForKeyedSubscript:", v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v1336 = v118;
    v1339 = v121;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v124 = v123;
      if ((objc_msgSend(v124, "isEqualToString:", CFSTR("RELEVANCE")) & 1) != 0)
      {
        v125 = 0;
      }
      else if ((objc_msgSend(v124, "isEqualToString:", CFSTR("RATING")) & 1) != 0)
      {
        v125 = 1;
      }
      else if ((objc_msgSend(v124, "isEqualToString:", CFSTR("DISTANCE")) & 1) != 0)
      {
        v125 = 2;
      }
      else if (objc_msgSend(v124, "isEqualToString:", CFSTR("PRICE")))
      {
        v125 = 3;
      }
      else
      {
        v125 = 0;
      }

      v121 = v1339;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_264:

        if ((_DWORD)a3)
          v126 = CFSTR("maxResultCount");
        else
          v126 = CFSTR("max_result_count");
        objc_msgSend(v121, "objectForKeyedSubscript:", v126);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v128 = objc_msgSend(v127, "unsignedIntValue");
          *(_WORD *)&v1392->_flags |= 0x1000u;
          *(_WORD *)&v1392->_flags |= 1u;
          v1392->_maxResultCount = v128;
        }

        if ((_DWORD)a3)
          v129 = CFSTR("searchString");
        else
          v129 = CFSTR("search_string");
        v130 = v1339;
        objc_msgSend(v1339, "objectForKeyedSubscript:", v129);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v132 = (void *)objc_msgSend(v131, "copy");
          -[GEOPDSiriSearchParameters setSearchString:]((uint64_t)v1392, v132);

          v130 = v1339;
        }

        if ((_DWORD)a3)
          v133 = CFSTR("viewportInfo");
        else
          v133 = CFSTR("viewport_info");
        objc_msgSend(v130, "objectForKeyedSubscript:", v133);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v135 = [GEOPDViewportInfo alloc];
          if ((a3 & 1) != 0)
            v136 = -[GEOPDViewportInfo initWithJSON:](v135, "initWithJSON:", v134);
          else
            v136 = -[GEOPDViewportInfo initWithDictionary:](v135, "initWithDictionary:", v134);
          v137 = v136;
          -[GEOPDSiriSearchParameters setViewportInfo:]((uint64_t)v1392, v136);

          v130 = v1339;
        }

        objc_msgSend(v130, "objectForKeyedSubscript:", CFSTR("address"));
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v139 = [GEOAddress alloc];
          if ((a3 & 1) != 0)
            v140 = -[GEOAddress initWithJSON:](v139, "initWithJSON:", v138);
          else
            v140 = -[GEOAddress initWithDictionary:](v139, "initWithDictionary:", v138);
          v141 = v140;
          -[GEOPDSiriSearchParameters setAddress:]((uint64_t)v1392, v140);

          v130 = v1339;
        }

        if ((_DWORD)a3)
          v142 = CFSTR("businessCategoryFilter");
        else
          v142 = CFSTR("business_category_filter");
        objc_msgSend(v130, "objectForKeyedSubscript:", v142);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1435 = 0u;
          v1436 = 0u;
          v1433 = 0u;
          v1434 = 0u;
          v144 = v143;
          v145 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v1433, &v1445, 16);
          if (v145)
          {
            v146 = v145;
            v147 = *(_QWORD *)v1434;
            do
            {
              for (m = 0; m != v146; ++m)
              {
                if (*(_QWORD *)v1434 != v147)
                  objc_enumerationMutation(v144);
                v149 = *(void **)(*((_QWORD *)&v1433 + 1) + 8 * m);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v150 = (void *)objc_msgSend(v149, "copy");
                  -[GEOPDSiriSearchParameters addBusinessCategoryFilter:]((uint64_t)v1392, v150);

                }
              }
              v146 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v1433, &v1445, 16);
            }
            while (v146);
          }

          v130 = v1339;
        }

        if ((_DWORD)a3)
          v151 = CFSTR("isStrictMapRegion");
        else
          v151 = CFSTR("is_strict_map_region");
        objc_msgSend(v130, "objectForKeyedSubscript:", v151);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v153 = objc_msgSend(v152, "BOOLValue");
          *(_WORD *)&v1392->_flags |= 0x1000u;
          *(_WORD *)&v1392->_flags |= 4u;
          v1392->_isStrictMapRegion = v153;
        }

        if ((_DWORD)a3)
          v154 = CFSTR("structuredSearch");
        else
          v154 = CFSTR("structured_search");
        objc_msgSend(v1339, "objectForKeyedSubscript:", v154);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v118 = v1336;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v156 = objc_msgSend(v155, "BOOLValue");
          *(_WORD *)&v1392->_flags |= 0x1000u;
          *(_WORD *)&v1392->_flags |= 8u;
          v1392->_structuredSearch = v156;
        }

        if ((_DWORD)a3)
          v157 = CFSTR("searchSubstringDescriptor");
        else
          v157 = CFSTR("search_substring_descriptor");
        v121 = v1339;
        objc_msgSend(v1339, "objectForKeyedSubscript:", v157);
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1431 = 0u;
          v1432 = 0u;
          v1429 = 0u;
          v1430 = 0u;
          obj = v158;
          v159 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v1429, &v1441, 16);
          if (!v159)
            goto LABEL_369;
          v160 = v159;
          v161 = *(_QWORD *)v1430;
          if ((_DWORD)a3)
            v162 = CFSTR("stringType");
          else
            v162 = CFSTR("string_type");
          v163 = CFSTR("begin_index");
          if ((_DWORD)a3)
            v163 = CFSTR("beginIndex");
          v1348 = v163;
          v1351 = v162;
          if ((_DWORD)a3)
            v164 = CFSTR("endIndex");
          else
            v164 = CFSTR("end_index");
          v165 = CFSTR("span_data");
          if ((_DWORD)a3)
            v165 = CFSTR("spanData");
          v1342 = v165;
          v1345 = v164;
          v1354 = v158;
          v1358 = *(_QWORD *)v1430;
          while (1)
          {
            v166 = 0;
            v1364 = v160;
            do
            {
              if (*(_QWORD *)v1430 != v161)
                objc_enumerationMutation(obj);
              v167 = *(void **)(*((_QWORD *)&v1429 + 1) + 8 * v166);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v168 = [GEOPDSearchSubstringDescriptor alloc];
                if (v168)
                {
                  v169 = v167;
                  v168 = -[GEOPDSearchSubstringDescriptor init](v168, "init");
                  if (v168)
                  {
                    objc_msgSend(v169, "objectForKeyedSubscript:", v1351);
                    v170 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v171 = v170;
                      if ((objc_msgSend(v171, "isEqualToString:", CFSTR("PLACE")) & 1) != 0)
                      {
                        v172 = 0;
                      }
                      else if ((objc_msgSend(v171, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
                      {
                        v172 = 1;
                      }
                      else if ((objc_msgSend(v171, "isEqualToString:", CFSTR("CATEGORY")) & 1) != 0)
                      {
                        v172 = 2;
                      }
                      else if ((objc_msgSend(v171, "isEqualToString:", CFSTR("IGNORE")) & 1) != 0)
                      {
                        v172 = 3;
                      }
                      else if (objc_msgSend(v171, "isEqualToString:", CFSTR("ATTRIBUTE")))
                      {
                        v172 = 4;
                      }
                      else
                      {
                        v172 = 0;
                      }

                      v158 = v1354;
LABEL_348:
                      v168->_stringType = v172;
                      a3 = v1379;
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v172 = objc_msgSend(v170, "intValue");
                        goto LABEL_348;
                      }
                    }

                    objc_msgSend(v169, "objectForKeyedSubscript:", v1348);
                    v173 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                      v168->_beginIndex = objc_msgSend(v173, "intValue");

                    objc_msgSend(v169, "objectForKeyedSubscript:", v1345);
                    v174 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                      v168->_endIndex = objc_msgSend(v174, "intValue");

                    objc_msgSend(v169, "objectForKeyedSubscript:", v1342);
                    v175 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v1439 = 0u;
                      v1440 = 0u;
                      v1437 = 0u;
                      v1438 = 0u;
                      v176 = v175;
                      v177 = objc_msgSend(v176, "countByEnumeratingWithState:objects:count:", &v1437, v1449, 16);
                      if (v177)
                      {
                        v178 = v177;
                        v179 = *(_QWORD *)v1438;
                        do
                        {
                          for (n = 0; n != v178; ++n)
                          {
                            if (*(_QWORD *)v1438 != v179)
                              objc_enumerationMutation(v176);
                            v181 = *(void **)(*((_QWORD *)&v1437 + 1) + 8 * n);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v182 = (void *)objc_msgSend(v181, "copy");
                              -[GEOPDSearchSubstringDescriptor addSpanData:]((uint64_t)v168, v182);

                            }
                          }
                          v178 = objc_msgSend(v176, "countByEnumeratingWithState:objects:count:", &v1437, v1449, 16);
                        }
                        while (v178);
                      }

                      a3 = v1379;
                      v158 = v1354;
                    }

                  }
                }
                -[GEOPDSiriSearchParameters addSearchSubstringDescriptor:]((uint64_t)v1392, v168);

                v161 = v1358;
                v160 = v1364;
              }
              ++v166;
            }
            while (v166 != v160);
            v160 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v1429, &v1441, 16);
            if (!v160)
            {
LABEL_369:

              v118 = v1336;
              v121 = v1339;
              break;
            }
          }
        }

        if ((_DWORD)a3)
          v183 = CFSTR("indexFilter");
        else
          v183 = CFSTR("index_filter");
        objc_msgSend(v121, "objectForKeyedSubscript:", v183);
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v185 = [GEOPDIndexQueryNode alloc];
          if (v185)
            v186 = (void *)-[GEOPDIndexQueryNode _initWithDictionary:isJSON:](v185, v184);
          else
            v186 = 0;
          -[GEOPDSiriSearchParameters setIndexFilter:]((uint64_t)v1392, v186);

          v121 = v1339;
        }

        if ((_DWORD)a3)
          v187 = CFSTR("recentRouteInfo");
        else
          v187 = CFSTR("recent_route_info");
        objc_msgSend(v121, "objectForKeyedSubscript:", v187);
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v189 = [GEOPDRecentRouteInfo alloc];
          if (v189)
            v190 = (void *)-[GEOPDRecentRouteInfo _initWithDictionary:isJSON:](v189, v188, a3);
          else
            v190 = 0;
          -[GEOPDSiriSearchParameters setRecentRouteInfo:]((uint64_t)v1392, v190);

          v121 = v1339;
        }

        goto LABEL_385;
      }
      v125 = objc_msgSend(v123, "intValue");
    }
    *(_WORD *)&v1392->_flags |= 0x1000u;
    *(_WORD *)&v1392->_flags |= 2u;
    v1392->_sortOrder = v125;
    goto LABEL_264;
  }
LABEL_387:

  if ((_DWORD)a3)
    v191 = CFSTR("locationDirectedSearchParameters");
  else
    v191 = CFSTR("location_directed_search_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v191);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v193 = [GEOPDLocationDirectedSearchParameters alloc];
    if (!v193)
    {
      v196 = 0;
      goto LABEL_486;
    }
    v194 = v193;
    v195 = v192;
    v196 = -[GEOPDLocationDirectedSearchParameters init](v194, "init");
    if (!v196)
    {
LABEL_485:

LABEL_486:
      -[GEOPDPlaceRequestParameters setLocationDirectedSearchParameters:]((uint64_t)v1335, (void *)v196);

      goto LABEL_487;
    }
    if ((_DWORD)a3)
      v197 = CFSTR("sortOrder");
    else
      v197 = CFSTR("sort_order");
    objc_msgSend(v195, "objectForKeyedSubscript:", v197);
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v199 = v198;
      if ((objc_msgSend(v199, "isEqualToString:", CFSTR("RELEVANCE")) & 1) != 0)
      {
        v200 = 0;
      }
      else if ((objc_msgSend(v199, "isEqualToString:", CFSTR("RATING")) & 1) != 0)
      {
        v200 = 1;
      }
      else if ((objc_msgSend(v199, "isEqualToString:", CFSTR("DISTANCE")) & 1) != 0)
      {
        v200 = 2;
      }
      else if (objc_msgSend(v199, "isEqualToString:", CFSTR("PRICE")))
      {
        v200 = 3;
      }
      else
      {
        v200 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_410;
      v200 = objc_msgSend(v198, "intValue");
    }
    *(_WORD *)(v196 + 96) |= 0x400u;
    *(_WORD *)(v196 + 96) |= 4u;
    *(_DWORD *)(v196 + 92) = v200;
LABEL_410:

    if (v1379)
      v201 = CFSTR("maxResults");
    else
      v201 = CFSTR("max_results");
    objc_msgSend(v195, "objectForKeyedSubscript:", v201);
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v203 = objc_msgSend(v202, "unsignedIntValue");
      *(_WORD *)(v196 + 96) |= 0x400u;
      *(_WORD *)(v196 + 96) |= 1u;
      *(_DWORD *)(v196 + 84) = v203;
    }

    if (v1379)
      v204 = CFSTR("searchString");
    else
      v204 = CFSTR("search_string");
    objc_msgSend(v195, "objectForKeyedSubscript:", v204);
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v206 = (void *)objc_msgSend(v205, "copy");
      -[GEOPDLocationDirectedSearchParameters setSearchString:](v196, v206);

    }
    v207 = v1379;
    if (v1379)
      v208 = CFSTR("viewportInfo");
    else
      v208 = CFSTR("viewport_info");
    objc_msgSend(v195, "objectForKeyedSubscript:", v208);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v210 = [GEOPDViewportInfo alloc];
      if ((v1379 & 1) != 0)
        v211 = -[GEOPDViewportInfo initWithJSON:](v210, "initWithJSON:", v209);
      else
        v211 = -[GEOPDViewportInfo initWithDictionary:](v210, "initWithDictionary:", v209);
      v212 = v211;
      -[GEOPDLocationDirectedSearchParameters setViewportInfo:](v196, v211);

      v207 = v1379;
    }

    if (v207)
      v213 = CFSTR("searchLocation");
    else
      v213 = CFSTR("search_location");
    objc_msgSend(v195, "objectForKeyedSubscript:", v213);
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v215 = [GEOLatLng alloc];
      if ((v207 & 1) != 0)
        v216 = -[GEOLatLng initWithJSON:](v215, "initWithJSON:", v214);
      else
        v216 = -[GEOLatLng initWithDictionary:](v215, "initWithDictionary:", v214);
      v217 = v216;
      -[GEOPDLocationDirectedSearchParameters setSearchLocation:](v196, v216);

      v207 = v1379;
    }

    if (v207)
      v218 = CFSTR("searchType");
    else
      v218 = CFSTR("search_type");
    objc_msgSend(v195, "objectForKeyedSubscript:", v218);
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v220 = v219;
      a3 = v1379;
      if ((objc_msgSend(v220, "isEqualToString:", CFSTR("SEARCH_TYPE_UNKNOWN")) & 1) != 0)
      {
        v221 = 0;
      }
      else if ((objc_msgSend(v220, "isEqualToString:", CFSTR("SEARCH_TYPE_DEFAULT")) & 1) != 0)
      {
        v221 = 1;
      }
      else if (objc_msgSend(v220, "isEqualToString:", CFSTR("SEARCH_TYPE_NEAREST_TRANSIT")))
      {
        v221 = 2;
      }
      else
      {
        v221 = 0;
      }

    }
    else
    {
      objc_opt_class();
      a3 = v1379;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_451:

        if ((_DWORD)a3)
          v222 = CFSTR("nearestTransitParameters");
        else
          v222 = CFSTR("nearest_transit_parameters");
        objc_msgSend(v195, "objectForKeyedSubscript:", v222);
        v223 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v224 = [GEOPDNearestTransitParameters alloc];
          if (v224)
          {
            v225 = v223;
            v224 = -[GEOPDNearestTransitParameters init](v224, "init");
            if (v224)
            {
              if ((_DWORD)a3)
                v226 = CFSTR("lineMuid");
              else
                v226 = CFSTR("line_muid");
              objc_msgSend(v225, "objectForKeyedSubscript:", v226);
              v227 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v228 = objc_msgSend(v227, "unsignedLongLongValue");
                *(_BYTE *)&v224->_flags |= 1u;
                v224->_lineMuid = v228;
              }

              if ((_DWORD)a3)
                v229 = CFSTR("isTransitOnly");
              else
                v229 = CFSTR("is_transit_only");
              objc_msgSend(v225, "objectForKeyedSubscript:", v229);
              v230 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v231 = objc_msgSend(v230, "BOOLValue");
                *(_BYTE *)&v224->_flags |= 2u;
                v224->_isTransitOnly = v231;
              }

            }
          }
          -[GEOPDLocationDirectedSearchParameters setNearestTransitParameters:](v196, v224);

        }
        if ((_DWORD)a3)
          v232 = CFSTR("paginationParameters");
        else
          v232 = CFSTR("pagination_parameters");
        objc_msgSend(v195, "objectForKeyedSubscript:", v232);
        v233 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v234 = [GEOPDPaginationParameters alloc];
          if (v234)
            v235 = (void *)-[GEOPDPaginationParameters _initWithDictionary:isJSON:](v234, v233, a3);
          else
            v235 = 0;
          -[GEOPDLocationDirectedSearchParameters setPaginationParameters:](v196, v235);

        }
        if ((_DWORD)a3)
          v236 = CFSTR("searchFilter");
        else
          v236 = CFSTR("search_filter");
        objc_msgSend(v195, "objectForKeyedSubscript:", v236);
        v237 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v238 = [GEOPDSSearchFilter alloc];
          if (v238)
            v239 = (void *)-[GEOPDSSearchFilter _initWithDictionary:isJSON:](v238, v237, a3);
          else
            v239 = 0;
          -[GEOPDLocationDirectedSearchParameters setSearchFilter:](v196, v239);

        }
        goto LABEL_485;
      }
      v221 = objc_msgSend(v219, "intValue");
    }
    *(_WORD *)(v196 + 96) |= 0x400u;
    *(_WORD *)(v196 + 96) |= 2u;
    *(_DWORD *)(v196 + 88) = v221;
    goto LABEL_451;
  }
LABEL_487:

  if ((_DWORD)a3)
    v240 = CFSTR("autocompleteParameters");
  else
    v240 = CFSTR("autocomplete_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v240);
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v242 = [GEOPDAutocompleteParameters alloc];
    if ((a3 & 1) != 0)
      v243 = -[GEOPDAutocompleteParameters initWithJSON:](v242, "initWithJSON:", v241);
    else
      v243 = -[GEOPDAutocompleteParameters initWithDictionary:](v242, "initWithDictionary:", v241);
    v244 = v243;
    -[GEOPDPlaceRequestParameters setAutocompleteParameters:]((uint64_t)v1335, v243);

  }
  if ((_DWORD)a3)
    v245 = CFSTR("browseCategorySuggestionParameters");
  else
    v245 = CFSTR("browse_category_suggestion_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v245);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v247 = [GEOPDSearchBrowseCategorySuggestionParameters alloc];
    if (v247)
      v248 = (void *)-[GEOPDSearchBrowseCategorySuggestionParameters _initWithDictionary:isJSON:](v247, v246, a3);
    else
      v248 = 0;
    -[GEOPDPlaceRequestParameters setBrowseCategorySuggestionParameters:]((uint64_t)v1335, v248);

  }
  if ((_DWORD)a3)
    v249 = CFSTR("categorySearchParameters");
  else
    v249 = CFSTR("category_search_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v249);
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v251 = [GEOPDCategorySearchParameters alloc];
    if (!v251)
    {
      v254 = 0;
LABEL_870:
      -[GEOPDPlaceRequestParameters setCategorySearchParameters:]((uint64_t)v1335, v254);

      goto LABEL_871;
    }
    v252 = v251;
    v253 = v250;
    v254 = -[GEOPDCategorySearchParameters init](v252, "init");

    if (!v254)
    {
LABEL_869:

      goto LABEL_870;
    }
    if ((_DWORD)a3)
      v255 = CFSTR("maxResults");
    else
      v255 = CFSTR("max_results");
    objc_msgSend(v253, "objectForKeyedSubscript:", v255);
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v257 = &OBJC_IVAR___GEORawPathGeometry__pathMatcherInstructions;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v258 = objc_msgSend(v256, "unsignedIntValue");
      v254[72]._os_unfair_lock_opaque |= 0x10000000u;
      v254[72]._os_unfair_lock_opaque |= 8u;
      v254[68]._os_unfair_lock_opaque = v258;
    }

    if ((_DWORD)a3)
      v259 = CFSTR("viewportInfo");
    else
      v259 = CFSTR("viewport_info");
    objc_msgSend(v253, "objectForKeyedSubscript:", v259);
    v260 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v261 = [GEOPDViewportInfo alloc];
      if ((a3 & 1) != 0)
        v262 = -[GEOPDViewportInfo initWithJSON:](v261, "initWithJSON:", v260);
      else
        v262 = -[GEOPDViewportInfo initWithDictionary:](v261, "initWithDictionary:", v260);
      v263 = v262;
      -[GEOPDCategorySearchParameters setViewportInfo:]((uint64_t)v254, v262);

    }
    obja = v250;

    if ((_DWORD)a3)
      v264 = CFSTR("suggestionEntryMetadata");
    else
      v264 = CFSTR("suggestion_entry_metadata");
    objc_msgSend(v253, "objectForKeyedSubscript:", v264);
    v265 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v266 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v265, 0);
      -[GEOPDCategorySearchParameters setSuggestionEntryMetadata:]((uint64_t)v254, v266);

    }
    if ((_DWORD)a3)
      v267 = CFSTR("blurredHourOfDay");
    else
      v267 = CFSTR("blurred_hour_of_day");
    objc_msgSend(v253, "objectForKeyedSubscript:", v267);
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v269 = objc_msgSend(v268, "unsignedIntValue");
      v254[72]._os_unfair_lock_opaque |= 0x10000000u;
      v254[72]._os_unfair_lock_opaque |= 2u;
      v254[66]._os_unfair_lock_opaque = v269;
    }

    if ((_DWORD)a3)
      v270 = CFSTR("dayOfWeek");
    else
      v270 = CFSTR("day_of_week");
    objc_msgSend(v253, "objectForKeyedSubscript:", v270);
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v272 = objc_msgSend(v271, "unsignedIntValue");
      v254[72]._os_unfair_lock_opaque |= 0x10000000u;
      v254[72]._os_unfair_lock_opaque |= 4u;
      v254[67]._os_unfair_lock_opaque = v272;
    }

    if ((_DWORD)a3)
      v273 = CFSTR("searchType");
    else
      v273 = CFSTR("search_type");
    objc_msgSend(v253, "objectForKeyedSubscript:", v273);
    v274 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v275 = v274;
      if ((objc_msgSend(v275, "isEqualToString:", CFSTR("CATEGORY_SEARCH_TYPE_UNKNOWN")) & 1) != 0)
      {
        v276 = 0;
      }
      else if ((objc_msgSend(v275, "isEqualToString:", CFSTR("CATEGORY_SEARCH_TYPE_DEFAULT")) & 1) != 0)
      {
        v276 = 1;
      }
      else if ((objc_msgSend(v275, "isEqualToString:", CFSTR("CATEGORY_SEARCH_TYPE_REDO")) & 1) != 0)
      {
        v276 = 2;
      }
      else if ((objc_msgSend(v275, "isEqualToString:", CFSTR("CATEGORY_SEARCH_TYPE_NAV")) & 1) != 0)
      {
        v276 = 3;
      }
      else if ((objc_msgSend(v275, "isEqualToString:", CFSTR("CATEGORY_SEARCH_TYPE_REDO_NAV")) & 1) != 0)
      {
        v276 = 4;
      }
      else if (objc_msgSend(v275, "isEqualToString:", CFSTR("CATEGORY_SEARCH_TYPE_AUTO_REDO")))
      {
        v276 = 5;
      }
      else
      {
        v276 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_557;
      v276 = objc_msgSend(v274, "intValue");
    }
    v254[72]._os_unfair_lock_opaque |= 0x10000000u;
    v254[72]._os_unfair_lock_opaque |= 0x20u;
    v254[70]._os_unfair_lock_opaque = v276;
LABEL_557:

    if ((_DWORD)a3)
      v277 = CFSTR("recentRouteInfo");
    else
      v277 = CFSTR("recent_route_info");
    objc_msgSend(v253, "objectForKeyedSubscript:", v277);
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v279 = [GEOPDRecentRouteInfo alloc];
      if (v279)
        v280 = (void *)-[GEOPDRecentRouteInfo _initWithDictionary:isJSON:](v279, v278, a3);
      else
        v280 = 0;
      -[GEOPDCategorySearchParameters setRecentRouteInfo:]((uint64_t)v254, v280);

    }
    if ((_DWORD)a3)
      v281 = CFSTR("supportCategorySearchResultSection");
    else
      v281 = CFSTR("support_category_search_result_section");
    objc_msgSend(v253, "objectForKeyedSubscript:", v281);
    v282 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v283 = objc_msgSend(v282, "BOOLValue");
      v254[72]._os_unfair_lock_opaque |= 0x10000000u;
      v254[72]._os_unfair_lock_opaque |= 0x40u;
      LOBYTE(v254[71]._os_unfair_lock_opaque) = v283;
    }

    if ((_DWORD)a3)
      v284 = CFSTR("evChargingParameters");
    else
      v284 = CFSTR("ev_charging_parameters");
    objc_msgSend(v253, "objectForKeyedSubscript:", v284);
    v285 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v286 = [GEOPDSSearchEvChargingParameters alloc];
      if (v286)
        v287 = -[GEOPDSSearchEvChargingParameters _initWithDictionary:isJSON:](v286, v285, a3);
      else
        v287 = 0;
      -[GEOPDCategorySearchParameters setEvChargingParameters:]((uint64_t)v254, v287);

    }
    if ((_DWORD)a3)
      v288 = CFSTR("supportedRelatedEntitySectionType");
    else
      v288 = CFSTR("supported_related_entity_section_type");
    objc_msgSend(v253, "objectForKeyedSubscript:", v288);
    v289 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v1393 = v253;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v1427 = 0u;
      v1428 = 0u;
      v1425 = 0u;
      v1426 = 0u;
      v1365 = v289;
      v290 = v289;
      v291 = objc_msgSend(v290, "countByEnumeratingWithState:objects:count:", &v1425, v1449, 16);
      if (!v291)
        goto LABEL_595;
      v292 = v291;
      v293 = *(_QWORD *)v1426;
      while (1)
      {
        for (ii = 0; ii != v292; ++ii)
        {
          if (*(_QWORD *)v1426 != v293)
            objc_enumerationMutation(v290);
          v295 = *(void **)(*((_QWORD *)&v1425 + 1) + 8 * ii);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v296 = v295;
            if ((objc_msgSend(v296, "isEqualToString:", CFSTR("RELATED_ENTITY_SECTION_TYPE_UNKNOWN")) & 1) == 0)
              objc_msgSend(v296, "isEqualToString:", CFSTR("RELATED_ENTITY_SECTION_TYPE_COLLECTION"));

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
            objc_msgSend(v295, "intValue");
          }
          -[GEOPDCategorySearchParameters addSupportedRelatedEntitySectionType:](v254);
        }
        v292 = objc_msgSend(v290, "countByEnumeratingWithState:objects:count:", &v1425, v1449, 16);
        if (!v292)
        {
LABEL_595:

          a3 = v1379;
          v253 = v1393;
          v257 = &OBJC_IVAR___GEORawPathGeometry__pathMatcherInstructions;
          v289 = v1365;
          break;
        }
      }
    }

    if ((_DWORD)a3)
      v297 = CFSTR("etaFilter");
    else
      v297 = CFSTR("eta_filter");
    objc_msgSend(v253, "objectForKeyedSubscript:", v297);
    v298 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v299 = [GEOPDETAFilter alloc];
      if (v299)
        v300 = (void *)-[GEOPDETAFilter _initWithDictionary:isJSON:](v299, v298, a3);
      else
        v300 = 0;
      -[GEOPDCategorySearchParameters setEtaFilter:]((uint64_t)v254, v300);

    }
    if ((_DWORD)a3)
      v301 = CFSTR("supportedSearchTierType");
    else
      v301 = CFSTR("supported_search_tier_type");
    objc_msgSend(v253, "objectForKeyedSubscript:", v301);
    v302 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v1423 = 0u;
      v1424 = 0u;
      v1421 = 0u;
      v1422 = 0u;
      v1366 = v302;
      v303 = v302;
      v304 = objc_msgSend(v303, "countByEnumeratingWithState:objects:count:", &v1421, &v1445, 16);
      if (!v304)
        goto LABEL_623;
      v305 = v304;
      v306 = *(_QWORD *)v1422;
      while (1)
      {
        for (jj = 0; jj != v305; ++jj)
        {
          if (*(_QWORD *)v1422 != v306)
            objc_enumerationMutation(v303);
          v308 = *(void **)(*((_QWORD *)&v1421 + 1) + 8 * jj);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v309 = v308;
            if ((objc_msgSend(v309, "isEqualToString:", CFSTR("SEARCH_TIER_METADATA_UNKNOWN")) & 1) == 0
              && (objc_msgSend(v309, "isEqualToString:", CFSTR("SEARCH_TIER_METADATA_PRIMARY")) & 1) == 0)
            {
              objc_msgSend(v309, "isEqualToString:", CFSTR("SEARCH_TIER_METADATA_AUXILIARY"));
            }

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
            objc_msgSend(v308, "intValue");
          }
          -[GEOPDCategorySearchParameters addSupportedSearchTierType:](v254);
          a3 = v1379;
        }
        v305 = objc_msgSend(v303, "countByEnumeratingWithState:objects:count:", &v1421, &v1445, 16);
        if (!v305)
        {
LABEL_623:

          v253 = v1393;
          v257 = &OBJC_IVAR___GEORawPathGeometry__pathMatcherInstructions;
          v302 = v1366;
          break;
        }
      }
    }

    if ((_DWORD)a3)
      v310 = CFSTR("auxiliaryTierNumResults");
    else
      v310 = CFSTR("auxiliary_tier_num_results");
    objc_msgSend(v253, "objectForKeyedSubscript:", v310);
    v311 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v312 = objc_msgSend(v311, "unsignedIntValue");
      *(uint32_t *)((char *)&v254->_os_unfair_lock_opaque + v257[226]) |= 0x10000000u;
      *(uint32_t *)((char *)&v254->_os_unfair_lock_opaque + v257[226]) |= 1u;
      v254[65]._os_unfair_lock_opaque = v312;
    }

    if ((_DWORD)a3)
      v313 = CFSTR("resultRefinementQuery");
    else
      v313 = CFSTR("result_refinement_query");
    objc_msgSend(v253, "objectForKeyedSubscript:", v313);
    v314 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v315 = [GEOPDResultRefinementQuery alloc];
      if ((a3 & 1) != 0)
        v316 = -[GEOPDResultRefinementQuery initWithJSON:](v315, "initWithJSON:", v314);
      else
        v316 = -[GEOPDResultRefinementQuery initWithDictionary:](v315, "initWithDictionary:", v314);
      v317 = v316;
      -[GEOPDCategorySearchParameters setResultRefinementQuery:]((uint64_t)v254, v316);

    }
    if ((_DWORD)a3)
      v318 = CFSTR("knownRefinementType");
    else
      v318 = CFSTR("known_refinement_type");
    objc_msgSend(v253, "objectForKeyedSubscript:", v318);
    v319 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v1419 = 0u;
      v1420 = 0u;
      v1417 = 0u;
      v1418 = 0u;
      v1367 = v319;
      v320 = v319;
      v321 = objc_msgSend(v320, "countByEnumeratingWithState:objects:count:", &v1417, &v1441, 16);
      if (!v321)
        goto LABEL_661;
      v322 = v321;
      v323 = *(_QWORD *)v1418;
      while (1)
      {
        for (kk = 0; kk != v322; ++kk)
        {
          if (*(_QWORD *)v1418 != v323)
            objc_enumerationMutation(v320);
          v325 = *(void **)(*((_QWORD *)&v1417 + 1) + 8 * kk);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v326 = v325;
            if ((objc_msgSend(v326, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_UNKNOWN")) & 1) == 0
              && (objc_msgSend(v326, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_TOGGLE")) & 1) == 0
              && (objc_msgSend(v326, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_RANGE")) & 1) == 0
              && (objc_msgSend(v326, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_MULTI_SELECT")) & 1) == 0
              && (objc_msgSend(v326, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_SORT")) & 1) == 0
              && (objc_msgSend(v326, "isEqualToString:", CFSTR("RESULT_REFINEMENT_GUIDES_HOME")) & 1) == 0)
            {
              objc_msgSend(v326, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_OPEN_OPTIONS"));
            }

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
            objc_msgSend(v325, "intValue");
          }
          -[GEOPDCategorySearchParameters addKnownRefinementType:](v254);
        }
        v322 = objc_msgSend(v320, "countByEnumeratingWithState:objects:count:", &v1417, &v1441, 16);
        if (!v322)
        {
LABEL_661:

          a3 = v1379;
          v253 = v1393;
          v257 = &OBJC_IVAR___GEORawPathGeometry__pathMatcherInstructions;
          v319 = v1367;
          break;
        }
      }
    }

    if ((_DWORD)a3)
      v327 = CFSTR("placeSummaryRevision");
    else
      v327 = CFSTR("place_summary_revision");
    objc_msgSend(v253, "objectForKeyedSubscript:", v327);
    v328 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v329 = v328;
      if ((objc_msgSend(v329, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
      {
        v330 = 0;
      }
      else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("NAME")) & 1) != 0)
      {
        v330 = 1;
      }
      else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("CATEGORY")) & 1) != 0)
      {
        v330 = 2;
      }
      else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("DISTANCE")) & 1) != 0)
      {
        v330 = 3;
      }
      else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("PRICE")) & 1) != 0)
      {
        v330 = 4;
      }
      else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("HOURS")) & 1) != 0)
      {
        v330 = 5;
      }
      else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
      {
        v330 = 6;
      }
      else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("RATINGS")) & 1) != 0)
      {
        v330 = 7;
      }
      else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("TRANSIT_SHIELDS")) & 1) != 0)
      {
        v330 = 8;
      }
      else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("USER_GENERATED_GUIDES")) & 1) != 0)
      {
        v330 = 9;
      }
      else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("CURATED_GUIDES")) & 1) != 0)
      {
        v330 = 10;
      }
      else
      {
        if ((objc_msgSend(v329, "isEqualToString:", CFSTR("EV_CHARGERS_NUMBER")) & 1) != 0)
        {
          v330 = 11;
        }
        else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("UGC_USER_SUBMITTED_RECOMMENDATIONS")) & 1) != 0)
        {
          v330 = 12;
        }
        else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("STRING")) & 1) != 0)
        {
          v330 = 13;
        }
        else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("SERVER_OVERRIDE")) & 1) != 0)
        {
          v330 = 14;
        }
        else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("CONTAINMENT")) & 1) != 0)
        {
          v330 = 15;
        }
        else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("RECENT")) & 1) != 0)
        {
          v330 = 16;
        }
        else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("HIGHLIGHT_MAIN")) & 1) != 0)
        {
          v330 = 17;
        }
        else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("HIGHLIGHT_EXTRA")) & 1) != 0)
        {
          v330 = 18;
        }
        else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("PUBLISHER_NAME_FOR_GUIDE")) & 1) != 0)
        {
          v330 = 19;
        }
        else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("NUM_PLACES_IN_GUIDE")) & 1) != 0)
        {
          v330 = 20;
        }
        else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("PUBLISHER_DESCRIPTION")) & 1) != 0)
        {
          v330 = 21;
        }
        else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("SECONDARY_NAME")) & 1) != 0)
        {
          v330 = 22;
        }
        else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("FACTOID")) & 1) != 0)
        {
          v330 = 23;
        }
        else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("ARP_RATINGS")) & 1) != 0)
        {
          v330 = 24;
        }
        else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("REAL_TIME_EV_CHARGER_AVAILABILITY")) & 1) != 0)
        {
          v330 = 25;
        }
        else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("DETOUR_TIME")) & 1) != 0)
        {
          v330 = 26;
        }
        else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("HIKING_DIFFICULTY")) & 1) != 0)
        {
          v330 = 27;
        }
        else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("HIKING_TRAIL_LENGTH")) & 1) != 0)
        {
          v330 = 28;
        }
        else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("PHOTO_CAROUSEL")) & 1) != 0)
        {
          v330 = 29;
        }
        else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("IN_USER_LIBRARY")) & 1) != 0)
        {
          v330 = 30;
        }
        else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("USER_NOTE")) & 1) != 0)
        {
          v330 = 31;
        }
        else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("HIKE_ROUTE_FACTOID_ELEVATION_GAIN_LOSS")) & 1) != 0)
        {
          v330 = 32;
        }
        else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("HIKE_ROUTE_TYPE")) & 1) != 0)
        {
          v330 = 33;
        }
        else if ((objc_msgSend(v329, "isEqualToString:", CFSTR("HIKE_ROUTE_DURATION")) & 1) != 0)
        {
          v330 = 34;
        }
        else if (objc_msgSend(v329, "isEqualToString:", CFSTR("HIKE_ROUTE_LENGTH")))
        {
          v330 = 35;
        }
        else
        {
          v330 = 0;
        }
        a3 = v1379;
        v253 = v1393;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_756:

        if ((_DWORD)a3)
          v331 = CFSTR("previousSearchViewport");
        else
          v331 = CFSTR("previous_search_viewport");
        objc_msgSend(v253, "objectForKeyedSubscript:", v331);
        v332 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v333 = [GEOPDViewportInfo alloc];
          if ((a3 & 1) != 0)
            v334 = -[GEOPDViewportInfo initWithJSON:](v333, "initWithJSON:", v332);
          else
            v334 = -[GEOPDViewportInfo initWithDictionary:](v333, "initWithDictionary:", v332);
          v335 = v334;
          -[GEOPDCategorySearchParameters setPreviousSearchViewport:]((uint64_t)v254, v334);

        }
        if ((_DWORD)a3)
          v336 = CFSTR("supportedPlaceSummaryFormatType");
        else
          v336 = CFSTR("supported_place_summary_format_type");
        objc_msgSend(v253, "objectForKeyedSubscript:", v336);
        v337 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1415 = 0u;
          v1416 = 0u;
          v1413 = 0u;
          v1414 = 0u;
          v338 = v337;
          v339 = objc_msgSend(v338, "countByEnumeratingWithState:objects:count:", &v1413, &v1437, 16);
          if (!v339)
            goto LABEL_786;
          v340 = v339;
          v341 = *(_QWORD *)v1414;
          while (1)
          {
            for (mm = 0; mm != v340; ++mm)
            {
              if (*(_QWORD *)v1414 != v341)
                objc_enumerationMutation(v338);
              v343 = *(void **)(*((_QWORD *)&v1413 + 1) + 8 * mm);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v344 = v343;
                if ((objc_msgSend(v344, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_UNKNOWN")) & 1) == 0
                  && (objc_msgSend(v344, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_BOLD")) & 1) == 0
                  && (objc_msgSend(v344, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_ITALICS")) & 1) == 0
                  && (objc_msgSend(v344, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_STRIKETHROUGH")) & 1) == 0)
                {
                  objc_msgSend(v344, "isEqualToString:", CFSTR("PLACE_SUMMARY_FORMAT_TYPE_TAPPABLE_ENTITY"));
                }

              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  continue;
                objc_msgSend(v343, "intValue");
              }
              -[GEOPDCategorySearchParameters addSupportedPlaceSummaryFormatType:](v254);
            }
            v340 = objc_msgSend(v338, "countByEnumeratingWithState:objects:count:", &v1413, &v1437, 16);
            if (!v340)
            {
LABEL_786:

              a3 = v1379;
              v253 = v1393;
              v257 = &OBJC_IVAR___GEORawPathGeometry__pathMatcherInstructions;
              break;
            }
          }
        }

        if ((_DWORD)a3)
          v345 = CFSTR("supportedSearchSectionType");
        else
          v345 = CFSTR("supported_search_section_type");
        objc_msgSend(v253, "objectForKeyedSubscript:", v345);
        v346 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1411 = 0u;
          v1412 = 0u;
          v1409 = 0u;
          v1410 = 0u;
          v1368 = v346;
          v347 = v346;
          v348 = objc_msgSend(v347, "countByEnumeratingWithState:objects:count:", &v1409, &v1433, 16);
          if (!v348)
            goto LABEL_807;
          v349 = v348;
          v350 = *(_QWORD *)v1410;
          while (1)
          {
            for (nn = 0; nn != v349; ++nn)
            {
              if (*(_QWORD *)v1410 != v350)
                objc_enumerationMutation(v347);
              v352 = *(void **)(*((_QWORD *)&v1409 + 1) + 8 * nn);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v353 = v352;
                if ((objc_msgSend(v353, "isEqualToString:", CFSTR("SEARCH_SECTION_TYPE_UNKNOWN")) & 1) == 0
                  && (objc_msgSend(v353, "isEqualToString:", CFSTR("SEARCH_SECTION_TYPE_PLACE")) & 1) == 0)
                {
                  objc_msgSend(v353, "isEqualToString:", CFSTR("SEARCH_SECTION_TYPE_GUIDE"));
                }

              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  continue;
                objc_msgSend(v352, "intValue");
              }
              -[GEOPDCategorySearchParameters addSupportedSearchSectionType:](v254);
              a3 = v1379;
            }
            v349 = objc_msgSend(v347, "countByEnumeratingWithState:objects:count:", &v1409, &v1433, 16);
            if (!v349)
            {
LABEL_807:

              v253 = v1393;
              v257 = &OBJC_IVAR___GEORawPathGeometry__pathMatcherInstructions;
              v346 = v1368;
              break;
            }
          }
        }

        if ((_DWORD)a3)
          v354 = CFSTR("supportSearchEnrichment");
        else
          v354 = CFSTR("support_search_enrichment");
        objc_msgSend(v253, "objectForKeyedSubscript:", v354);
        v355 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v356 = objc_msgSend(v355, "BOOLValue");
          *(uint32_t *)((char *)&v254->_os_unfair_lock_opaque + v257[226]) |= 0x10000000u;
          *(uint32_t *)((char *)&v254->_os_unfair_lock_opaque + v257[226]) |= 0x80u;
          BYTE1(v254[71]._os_unfair_lock_opaque) = v356;
        }

        if ((_DWORD)a3)
          v357 = CFSTR("supportStructuredRapAffordance");
        else
          v357 = CFSTR("support_structured_rap_affordance");
        objc_msgSend(v253, "objectForKeyedSubscript:", v357);
        v358 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v359 = objc_msgSend(v358, "BOOLValue");
          *(uint32_t *)((char *)&v254->_os_unfair_lock_opaque + v257[226]) |= 0x10000000u;
          *(uint32_t *)((char *)&v254->_os_unfair_lock_opaque + v257[226]) |= 0x100u;
          BYTE2(v254[71]._os_unfair_lock_opaque) = v359;
        }

        if ((_DWORD)a3)
          v360 = CFSTR("searchOriginationInfo");
        else
          v360 = CFSTR("search_origination_info");
        objc_msgSend(v253, "objectForKeyedSubscript:", v360);
        v361 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v362 = [GEOPDSearchOriginationInfo alloc];
          if (v362)
            v363 = (void *)-[GEOPDSearchOriginationInfo _initWithDictionary:isJSON:]((uint64_t)v362, v361, a3);
          else
            v363 = 0;
          -[GEOPDCategorySearchParameters setSearchOriginationInfo:]((uint64_t)v254, v363);

        }
        if ((_DWORD)a3)
          v364 = CFSTR("enrichmentCampaignNamespace");
        else
          v364 = CFSTR("enrichment_campaign_namespace");
        objc_msgSend(v253, "objectForKeyedSubscript:", v364);
        v365 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v366 = (void *)objc_msgSend(v365, "copy");
          -[GEOPDCategorySearchParameters setEnrichmentCampaignNamespace:]((uint64_t)v254, v366);

        }
        if ((_DWORD)a3)
          v367 = CFSTR("searchEnrichmentRevisionMetadata");
        else
          v367 = CFSTR("search_enrichment_revision_metadata");
        objc_msgSend(v253, "objectForKeyedSubscript:", v367);
        v368 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1407 = 0u;
          v1408 = 0u;
          v1405 = 0u;
          v1406 = 0u;
          v369 = v368;
          v370 = objc_msgSend(v369, "countByEnumeratingWithState:objects:count:", &v1405, &v1429, 16);
          if (v370)
          {
            v371 = v370;
            v372 = *(_QWORD *)v1406;
            do
            {
              v373 = 0;
              do
              {
                if (*(_QWORD *)v1406 != v372)
                  objc_enumerationMutation(v369);
                v374 = *(void **)(*((_QWORD *)&v1405 + 1) + 8 * v373);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v375 = [GEOPDSearchEnrichmentRevisionMetadata alloc];
                  if (v375)
                    v376 = (void *)-[GEOPDSearchEnrichmentRevisionMetadata _initWithDictionary:isJSON:]((uint64_t)v375, v374, a3);
                  else
                    v376 = 0;
                  -[GEOPDCategorySearchParameters addSearchEnrichmentRevisionMetadata:]((uint64_t)v254, v376);

                }
                ++v373;
              }
              while (v371 != v373);
              v377 = objc_msgSend(v369, "countByEnumeratingWithState:objects:count:", &v1405, &v1429, 16);
              v371 = v377;
            }
            while (v377);
          }

          v253 = v1393;
        }

        if ((_DWORD)a3)
          v378 = CFSTR("searchSessionData");
        else
          v378 = CFSTR("search_session_data");
        objc_msgSend(v253, "objectForKeyedSubscript:", v378);
        v379 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v250 = obja;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v380 = -[GEOACResult _initWithDictionary:isJSON:]([GEOPDSSearchSessionData alloc], v379);
          -[GEOPDCategorySearchParameters setSearchSessionData:]((uint64_t)v254, v380);

        }
        if ((_DWORD)a3)
          v381 = CFSTR("sessionUserActionMetadata");
        else
          v381 = CFSTR("session_user_action_metadata");
        objc_msgSend(v253, "objectForKeyedSubscript:", v381);
        v382 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v383 = [GEOPDSSessionUserActionMetadata alloc];
          if ((a3 & 1) != 0)
            v384 = -[GEOPDSSessionUserActionMetadata initWithJSON:](v383, "initWithJSON:", v382);
          else
            v384 = -[GEOPDSSessionUserActionMetadata initWithDictionary:](v383, "initWithDictionary:", v382);
          v385 = v384;
          -[GEOPDCategorySearchParameters setSessionUserActionMetadata:]((uint64_t)v254, v384);

        }
        if ((_DWORD)a3)
          v386 = CFSTR("paginationParameters");
        else
          v386 = CFSTR("pagination_parameters");
        objc_msgSend(v253, "objectForKeyedSubscript:", v386);
        v387 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v388 = [GEOPDPaginationParameters alloc];
          if (v388)
            v389 = (void *)-[GEOPDPaginationParameters _initWithDictionary:isJSON:](v388, v387, a3);
          else
            v389 = 0;
          -[GEOPDCategorySearchParameters setPaginationParameters:]((uint64_t)v254, v389);

        }
        goto LABEL_869;
      }
      v330 = objc_msgSend(v328, "intValue");
    }
    *(uint32_t *)((char *)&v254->_os_unfair_lock_opaque + v257[226]) |= 0x10000000u;
    *(uint32_t *)((char *)&v254->_os_unfair_lock_opaque + v257[226]) |= 0x10u;
    v254[69]._os_unfair_lock_opaque = v330;
    goto LABEL_756;
  }
LABEL_871:

  if ((_DWORD)a3)
    v390 = CFSTR("popularNearbySearchParameters");
  else
    v390 = CFSTR("popular_nearby_search_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v390);
  v391 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v392 = [GEOPDPopularNearbySearchParameters alloc];
    if (!v392)
    {
LABEL_912:
      -[GEOPDPlaceRequestParameters setPopularNearbySearchParameters:]((uint64_t)v1335, v392);

      goto LABEL_913;
    }
    v393 = v391;
    v392 = -[GEOPDPopularNearbySearchParameters init](v392, "init");
    if (!v392)
    {
LABEL_911:

      goto LABEL_912;
    }
    if ((_DWORD)a3)
      v394 = CFSTR("maxResults");
    else
      v394 = CFSTR("max_results");
    objc_msgSend(v393, "objectForKeyedSubscript:", v394);
    v395 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v396 = objc_msgSend(v395, "unsignedIntValue");
      *(_BYTE *)&v392->_flags |= 0x20u;
      *(_BYTE *)&v392->_flags |= 1u;
      v392->_maxResults = v396;
    }

    if ((_DWORD)a3)
      v397 = CFSTR("viewportInfo");
    else
      v397 = CFSTR("viewport_info");
    objc_msgSend(v393, "objectForKeyedSubscript:", v397);
    v398 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v399 = [GEOPDViewportInfo alloc];
      if ((a3 & 1) != 0)
        v400 = -[GEOPDViewportInfo initWithJSON:](v399, "initWithJSON:", v398);
      else
        v400 = -[GEOPDViewportInfo initWithDictionary:](v399, "initWithDictionary:", v398);
      v401 = v400;
      -[GEOPDPopularNearbySearchParameters setViewportInfo:]((uint64_t)v392, v400);

    }
    if ((_DWORD)a3)
      v402 = CFSTR("suggestionEntryMetadata");
    else
      v402 = CFSTR("suggestion_entry_metadata");
    objc_msgSend(v393, "objectForKeyedSubscript:", v402);
    v403 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v404 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v403, 0);
      -[GEOPDPopularNearbySearchParameters setSuggestionEntryMetadata:]((uint64_t)v392, v404);

    }
    if ((_DWORD)a3)
      v405 = CFSTR("searchType");
    else
      v405 = CFSTR("search_type");
    objc_msgSend(v393, "objectForKeyedSubscript:", v405);
    v406 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v407 = v406;
      if ((objc_msgSend(v407, "isEqualToString:", CFSTR("POPULAR_NEARBY_SEARCH_TYPE_UNKNOWN")) & 1) != 0)
      {
        v408 = 0;
      }
      else if ((objc_msgSend(v407, "isEqualToString:", CFSTR("POPULAR_NEARBY_SEARCH_TYPE_DEFAULT")) & 1) != 0)
      {
        v408 = 1;
      }
      else if (objc_msgSend(v407, "isEqualToString:", CFSTR("POPULAR_NEARBY_SEARCH_TYPE_REDO")))
      {
        v408 = 2;
      }
      else
      {
        v408 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_910:

        goto LABEL_911;
      }
      v408 = objc_msgSend(v406, "intValue");
    }
    *(_BYTE *)&v392->_flags |= 0x20u;
    *(_BYTE *)&v392->_flags |= 2u;
    v392->_searchType = v408;
    goto LABEL_910;
  }
LABEL_913:

  if ((_DWORD)a3)
    v409 = CFSTR("searchZeroKeywordCategorySuggestionParameters");
  else
    v409 = CFSTR("search_zero_keyword_category_suggestion_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v409);
  v410 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v411 = [GEOPDSearchZeroKeywordCategorySuggestionParameters alloc];
    if (!v411)
    {
LABEL_965:
      -[GEOPDPlaceRequestParameters setSearchZeroKeywordCategorySuggestionParameters:]((uint64_t)v1335, v411);

      goto LABEL_966;
    }
    v412 = v410;
    v411 = -[GEOPDSearchZeroKeywordCategorySuggestionParameters init](v411, "init");
    if (!v411)
    {
LABEL_964:

      goto LABEL_965;
    }
    if ((_DWORD)a3)
      v413 = CFSTR("requestLocalTimestamp");
    else
      v413 = CFSTR("request_local_timestamp");
    objc_msgSend(v412, "objectForKeyedSubscript:", v413);
    v414 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v414, "doubleValue");
      *(_BYTE *)&v411->_flags |= 1u;
      v411->_requestLocalTimestamp = v415;
    }

    if ((_DWORD)a3)
      v416 = CFSTR("significantLocation");
    else
      v416 = CFSTR("significant_location");
    objc_msgSend(v412, "objectForKeyedSubscript:", v416);
    v417 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v418 = [GEOLatLng alloc];
      if ((a3 & 1) != 0)
        v419 = -[GEOLatLng initWithJSON:](v418, "initWithJSON:", v417);
      else
        v419 = -[GEOLatLng initWithDictionary:](v418, "initWithDictionary:", v417);
      v420 = v419;
      -[GEOPDSearchZeroKeywordCategorySuggestionParameters setSignificantLocation:]((uint64_t)v411, v419);

    }
    if ((_DWORD)a3)
      v421 = CFSTR("maxNumCategoriesPerEntry");
    else
      v421 = CFSTR("max_num_categories_per_entry");
    objc_msgSend(v412, "objectForKeyedSubscript:", v421);
    v422 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v423 = objc_msgSend(v422, "unsignedIntValue");
      *(_BYTE *)&v411->_flags |= 2u;
      v411->_maxNumCategoriesPerEntry = v423;
    }

    if ((_DWORD)a3)
      v424 = CFSTR("userPreferredTransportType");
    else
      v424 = CFSTR("user_preferred_transport_type");
    objc_msgSend(v412, "objectForKeyedSubscript:", v424);
    v425 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v426 = v425;
      if ((objc_msgSend(v426, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_NONE")) & 1) != 0)
      {
        v427 = 0;
      }
      else if ((objc_msgSend(v426, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_DRIVING")) & 1) != 0)
      {
        v427 = 1;
      }
      else if ((objc_msgSend(v426, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_WALKING")) & 1) != 0)
      {
        v427 = 2;
      }
      else if ((objc_msgSend(v426, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_TRANSIT")) & 1) != 0)
      {
        v427 = 3;
      }
      else if ((objc_msgSend(v426, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_RIDESHARE")) & 1) != 0)
      {
        v427 = 4;
      }
      else if (objc_msgSend(v426, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_CYCLING")))
      {
        v427 = 5;
      }
      else
      {
        v427 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_958:

        if ((_DWORD)a3)
          v428 = CFSTR("shouldMatchNoQueryStateSuggestions");
        else
          v428 = CFSTR("should_match_no_query_state_suggestions");
        objc_msgSend(v412, "objectForKeyedSubscript:", v428);
        v429 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v430 = objc_msgSend(v429, "BOOLValue");
          *(_BYTE *)&v411->_flags |= 8u;
          v411->_shouldMatchNoQueryStateSuggestions = v430;
        }

        goto LABEL_964;
      }
      v427 = objc_msgSend(v425, "intValue");
    }
    *(_BYTE *)&v411->_flags |= 4u;
    v411->_userPreferredTransportType = v427;
    goto LABEL_958;
  }
LABEL_966:

  if ((_DWORD)a3)
    v431 = CFSTR("searchFieldPlaceholderParameters");
  else
    v431 = CFSTR("search_field_placeholder_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v431);
  v432 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v433 = [GEOPDSearchFieldPlaceholderParameters alloc];
    if (!v433)
    {
LABEL_987:
      -[GEOPDPlaceRequestParameters setSearchFieldPlaceholderParameters:]((uint64_t)v1335, v433);

      goto LABEL_988;
    }
    v434 = v432;
    v433 = -[GEOPDSearchFieldPlaceholderParameters init](v433, "init");
    if (!v433)
    {
LABEL_986:

      goto LABEL_987;
    }
    objc_msgSend(v434, "objectForKeyedSubscript:", CFSTR("version"));
    v435 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v436 = v435;
      if ((objc_msgSend(v436, "isEqualToString:", CFSTR("VERSION_1")) & 1) != 0)
        v437 = 0;
      else
        v437 = objc_msgSend(v436, "isEqualToString:", CFSTR("VERSION_2"));

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_980:

        if ((_DWORD)a3)
          v438 = CFSTR("isEditServerRecommendedStop");
        else
          v438 = CFSTR("is_edit_server_recommended_stop");
        objc_msgSend(v434, "objectForKeyedSubscript:", v438);
        v439 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v440 = objc_msgSend(v439, "BOOLValue");
          *(_BYTE *)&v433->_flags |= 2u;
          v433->_isEditServerRecommendedStop = v440;
        }

        goto LABEL_986;
      }
      v437 = objc_msgSend(v435, "intValue");
    }
    *(_BYTE *)&v433->_flags |= 1u;
    v433->_version = v437;
    goto LABEL_980;
  }
LABEL_988:

  if ((_DWORD)a3)
    v441 = CFSTR("batchPopularNearbySearchParameters");
  else
    v441 = CFSTR("batch_popular_nearby_search_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v441);
  v442 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v443 = [GEOPDBatchPopularNearbySearchParameters alloc];
    if (v443)
    {
      v444 = v442;
      v443 = -[GEOPDBatchPopularNearbySearchParameters init](v443, "init");
      if (v443)
      {
        if ((_DWORD)a3)
          v445 = CFSTR("maxResults");
        else
          v445 = CFSTR("max_results");
        objc_msgSend(v444, "objectForKeyedSubscript:", v445);
        v446 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v447 = objc_msgSend(v446, "unsignedIntValue");
          *(_BYTE *)&v443->_flags |= 0x20u;
          *(_BYTE *)&v443->_flags |= 2u;
          v443->_maxResults = v447;
        }

        if ((_DWORD)a3)
          v448 = CFSTR("viewportInfo");
        else
          v448 = CFSTR("viewport_info");
        objc_msgSend(v444, "objectForKeyedSubscript:", v448);
        v449 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v450 = [GEOPDViewportInfo alloc];
          if ((a3 & 1) != 0)
            v451 = -[GEOPDViewportInfo initWithJSON:](v450, "initWithJSON:", v449);
          else
            v451 = -[GEOPDViewportInfo initWithDictionary:](v450, "initWithDictionary:", v449);
          v452 = v451;
          -[GEOPDBatchPopularNearbySearchParameters setViewportInfo:]((uint64_t)v443, v451);

        }
        if ((_DWORD)a3)
          v453 = CFSTR("requestLocalTimestamp");
        else
          v453 = CFSTR("request_local_timestamp");
        objc_msgSend(v444, "objectForKeyedSubscript:", v453);
        v454 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v454, "doubleValue");
          *(_BYTE *)&v443->_flags |= 0x20u;
          *(_BYTE *)&v443->_flags |= 1u;
          v443->_requestLocalTimestamp = v455;
        }

        if ((_DWORD)a3)
          v456 = CFSTR("suggestionEntryMetadata");
        else
          v456 = CFSTR("suggestion_entry_metadata");
        objc_msgSend(v444, "objectForKeyedSubscript:", v456);
        v457 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1394 = v444;
          v1448 = 0u;
          v1447 = 0u;
          v1446 = 0u;
          v1445 = 0u;
          v458 = v457;
          v459 = objc_msgSend(v458, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
          if (v459)
          {
            v460 = v459;
            v461 = *(_QWORD *)v1446;
            do
            {
              for (i1 = 0; i1 != v460; ++i1)
              {
                if (*(_QWORD *)v1446 != v461)
                  objc_enumerationMutation(v458);
                v463 = *(_QWORD *)(*((_QWORD *)&v1445 + 1) + 8 * i1);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v464 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v463, 0);
                  -[GEOPDBatchPopularNearbySearchParameters addSuggestionEntryMetadata:]((uint64_t)v443, v464);

                }
              }
              v460 = objc_msgSend(v458, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
            }
            while (v460);
          }

          a3 = v1379;
          v444 = v1394;
        }

      }
    }
    -[GEOPDPlaceRequestParameters setBatchPopularNearbySearchParameters:]((uint64_t)v1335, v443);

  }
  if ((_DWORD)a3)
    v465 = CFSTR("vendorSpecificPlaceRefinementParameters");
  else
    v465 = CFSTR("vendor_specific_place_refinement_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v465);
  v466 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v467 = [GEOPDVendorSpecificPlaceRefinementParameters alloc];
    if (!v467)
    {
      v470 = 0;
LABEL_1171:
      -[GEOPDPlaceRequestParameters setVendorSpecificPlaceRefinementParameters:]((uint64_t)v1335, (void *)v470);

      goto LABEL_1172;
    }
    v468 = v467;
    v469 = v466;
    v470 = -[GEOPDVendorSpecificPlaceRefinementParameters init](v468, "init");
    if (!v470)
    {
LABEL_1170:

      goto LABEL_1171;
    }
    if ((_DWORD)a3)
      v471 = CFSTR("resultProviderId");
    else
      v471 = CFSTR("result_provider_id");
    objc_msgSend(v469, "objectForKeyedSubscript:", v471);
    v472 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v473 = objc_msgSend(v472, "intValue");
      *(_WORD *)(v470 + 112) |= 0x1000u;
      *(_WORD *)(v470 + 112) |= 8u;
      *(_DWORD *)(v470 + 108) = v473;
    }

    objc_msgSend(v469, "objectForKeyedSubscript:", CFSTR("muid"));
    v474 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v475 = objc_msgSend(v474, "unsignedLongLongValue");
      *(_WORD *)(v470 + 112) |= 0x1000u;
      *(_WORD *)(v470 + 112) |= 1u;
      *(_QWORD *)(v470 + 64) = v475;
    }

    if ((_DWORD)a3)
      v476 = CFSTR("vendorId");
    else
      v476 = CFSTR("vendor_id");
    objc_msgSend(v469, "objectForKeyedSubscript:", v476);
    v477 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v478 = (void *)objc_msgSend(v477, "copy");
      -[GEOPDVendorSpecificPlaceRefinementParameters setVendorId:](v470, v478);

    }
    if (v1379)
      v479 = CFSTR("externalItemId");
    else
      v479 = CFSTR("external_item_id");
    objc_msgSend(v469, "objectForKeyedSubscript:", v479);
    v480 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v481 = (void *)objc_msgSend(v480, "copy");
      -[GEOPDVendorSpecificPlaceRefinementParameters setExternalItemId:](v470, v481);

    }
    v482 = v1379;
    if (v1379)
      v483 = CFSTR("locationHint");
    else
      v483 = CFSTR("location_hint");
    objc_msgSend(v469, "objectForKeyedSubscript:", v483);
    v484 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v485 = [GEOLatLng alloc];
      if ((v1379 & 1) != 0)
        v486 = -[GEOLatLng initWithJSON:](v485, "initWithJSON:", v484);
      else
        v486 = -[GEOLatLng initWithDictionary:](v485, "initWithDictionary:", v484);
      v487 = v486;
      -[GEOPDVendorSpecificPlaceRefinementParameters setLocationHint:](v470, v486);

      v482 = v1379;
    }

    if (v482)
      v488 = CFSTR("addressHint");
    else
      v488 = CFSTR("address_hint");
    objc_msgSend(v469, "objectForKeyedSubscript:", v488);
    v489 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v490 = [GEOStructuredAddress alloc];
      if ((v482 & 1) != 0)
        v491 = -[GEOStructuredAddress initWithJSON:](v490, "initWithJSON:", v489);
      else
        v491 = -[GEOStructuredAddress initWithDictionary:](v490, "initWithDictionary:", v489);
      v492 = v491;
      -[GEOPDVendorSpecificPlaceRefinementParameters setAddressHint:](v470, v491);

      v482 = v1379;
    }

    if (v482)
      v493 = CFSTR("placeNameHint");
    else
      v493 = CFSTR("place_name_hint");
    objc_msgSend(v469, "objectForKeyedSubscript:", v493);
    v494 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v495 = (void *)objc_msgSend(v494, "copy");
      -[GEOPDVendorSpecificPlaceRefinementParameters setPlaceNameHint:](v470, v495);

    }
    if (v1379)
      v496 = CFSTR("formattedAddressLineHint");
    else
      v496 = CFSTR("formatted_address_line_hint");
    objc_msgSend(v469, "objectForKeyedSubscript:", v496);
    v497 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v1448 = 0u;
      v1447 = 0u;
      v1446 = 0u;
      v1445 = 0u;
      v498 = v497;
      v499 = objc_msgSend(v498, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
      if (v499)
      {
        v500 = v499;
        v501 = *(_QWORD *)v1446;
        do
        {
          for (i2 = 0; i2 != v500; ++i2)
          {
            if (*(_QWORD *)v1446 != v501)
              objc_enumerationMutation(v498);
            v503 = *(void **)(*((_QWORD *)&v1445 + 1) + 8 * i2);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v504 = (void *)objc_msgSend(v503, "copy");
              -[GEOPDVendorSpecificPlaceRefinementParameters addFormattedAddressLineHint:](v470, v504);

            }
          }
          v500 = objc_msgSend(v498, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
        }
        while (v500);
      }

    }
    if (v1379)
      v505 = CFSTR("placeTypeHint");
    else
      v505 = CFSTR("place_type_hint");
    objc_msgSend(v469, "objectForKeyedSubscript:", v505);
    v506 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v507 = v506;
      if ((objc_msgSend(v507, "isEqualToString:", CFSTR("UNKNOWN_PLACE_TYPE")) & 1) != 0)
      {
        v508 = 0;
      }
      else if ((objc_msgSend(v507, "isEqualToString:", CFSTR("COUNTRY")) & 1) != 0)
      {
        v508 = 1;
      }
      else if ((objc_msgSend(v507, "isEqualToString:", CFSTR("ADMINISTRATIVE_AREA")) & 1) != 0)
      {
        v508 = 2;
      }
      else if ((objc_msgSend(v507, "isEqualToString:", CFSTR("SUB_ADMINISTRATIVE_AREA")) & 1) != 0)
      {
        v508 = 4;
      }
      else if ((objc_msgSend(v507, "isEqualToString:", CFSTR("LOCALITY")) & 1) != 0)
      {
        v508 = 16;
      }
      else if ((objc_msgSend(v507, "isEqualToString:", CFSTR("TIME_ZONE")) & 1) != 0)
      {
        v508 = 35;
      }
      else if ((objc_msgSend(v507, "isEqualToString:", CFSTR("SUB_LOCALITY")) & 1) != 0)
      {
        v508 = 43;
      }
      else if ((objc_msgSend(v507, "isEqualToString:", CFSTR("OCEAN")) & 1) != 0)
      {
        v508 = 44;
      }
      else if ((objc_msgSend(v507, "isEqualToString:", CFSTR("AOI")) & 1) != 0)
      {
        v508 = 45;
      }
      else if ((objc_msgSend(v507, "isEqualToString:", CFSTR("INLAND_WATER")) & 1) != 0)
      {
        v508 = 46;
      }
      else if ((objc_msgSend(v507, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
      {
        v508 = 47;
      }
      else if ((objc_msgSend(v507, "isEqualToString:", CFSTR("ISLAND")) & 1) != 0)
      {
        v508 = 48;
      }
      else if ((objc_msgSend(v507, "isEqualToString:", CFSTR("STREET")) & 1) != 0)
      {
        v508 = 49;
      }
      else if ((objc_msgSend(v507, "isEqualToString:", CFSTR("ADMIN")) & 1) != 0)
      {
        v508 = 50;
      }
      else if ((objc_msgSend(v507, "isEqualToString:", CFSTR("POSTAL")) & 1) != 0)
      {
        v508 = 51;
      }
      else if ((objc_msgSend(v507, "isEqualToString:", CFSTR("INTERSECTION")) & 1) != 0)
      {
        v508 = 54;
      }
      else if ((objc_msgSend(v507, "isEqualToString:", CFSTR("BUILDING")) & 1) != 0)
      {
        v508 = 55;
      }
      else if ((objc_msgSend(v507, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
      {
        v508 = 57;
      }
      else if ((objc_msgSend(v507, "isEqualToString:", CFSTR("CONTINENT")) & 1) != 0)
      {
        v508 = 61;
      }
      else if ((objc_msgSend(v507, "isEqualToString:", CFSTR("REGION")) & 1) != 0)
      {
        v508 = 63;
      }
      else if ((objc_msgSend(v507, "isEqualToString:", CFSTR("DIVISION")) & 1) != 0)
      {
        v508 = 64;
      }
      else if (objc_msgSend(v507, "isEqualToString:", CFSTR("PHYSICAL_FEATURE")))
      {
        v508 = 65;
      }
      else
      {
        v508 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_1143;
      v508 = objc_msgSend(v506, "intValue");
    }
    *(_WORD *)(v470 + 112) |= 0x1000u;
    *(_WORD *)(v470 + 112) |= 4u;
    *(_DWORD *)(v470 + 104) = v508;
LABEL_1143:

    if (v1379)
      v509 = CFSTR("addressGeocodeAccuracyHint");
    else
      v509 = CFSTR("address_geocode_accuracy_hint");
    objc_msgSend(v469, "objectForKeyedSubscript:", v509);
    v510 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v511 = v510;
      if ((objc_msgSend(v511, "isEqualToString:", CFSTR("POINT")) & 1) != 0)
      {
        v512 = 0;
      }
      else if ((objc_msgSend(v511, "isEqualToString:", CFSTR("INTERPOLATION")) & 1) != 0)
      {
        v512 = 1;
      }
      else if ((objc_msgSend(v511, "isEqualToString:", CFSTR("APPROXIMATE")) & 1) != 0)
      {
        v512 = 2;
      }
      else if ((objc_msgSend(v511, "isEqualToString:", CFSTR("POSTAL_ZIP")) & 1) != 0)
      {
        v512 = 3;
      }
      else if ((objc_msgSend(v511, "isEqualToString:", CFSTR("PARCEL")) & 1) != 0)
      {
        v512 = 4;
      }
      else if (objc_msgSend(v511, "isEqualToString:", CFSTR("SUBPREMISE")))
      {
        v512 = 5;
      }
      else
      {
        v512 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_1164:

        if (v1379)
          v513 = CFSTR("addressObjectHint");
        else
          v513 = CFSTR("address_object_hint");
        objc_msgSend(v469, "objectForKeyedSubscript:", v513);
        v514 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v515 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v514, 0);
          -[GEOPDVendorSpecificPlaceRefinementParameters setAddressObjectHint:](v470, v515);

        }
        a3 = v1379;
        goto LABEL_1170;
      }
      v512 = objc_msgSend(v510, "intValue");
    }
    *(_WORD *)(v470 + 112) |= 0x1000u;
    *(_WORD *)(v470 + 112) |= 2u;
    *(_DWORD *)(v470 + 100) = v512;
    goto LABEL_1164;
  }
LABEL_1172:

  if ((_DWORD)a3)
    v516 = CFSTR("nearbySearchParameters");
  else
    v516 = CFSTR("nearby_search_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v516);
  v517 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v518 = [GEOPDNearbySearchParameters alloc];
    if (!v518)
    {
LABEL_1250:
      -[GEOPDPlaceRequestParameters setNearbySearchParameters:]((uint64_t)v1335, v518);

      goto LABEL_1251;
    }
    v519 = v517;
    v518 = -[GEOPDNearbySearchParameters init](v518, "init");
    if (!v518)
    {
LABEL_1249:

      goto LABEL_1250;
    }
    if ((_DWORD)a3)
      v520 = CFSTR("sortOrder");
    else
      v520 = CFSTR("sort_order");
    objc_msgSend(v519, "objectForKeyedSubscript:", v520);
    v521 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v522 = v521;
      if ((objc_msgSend(v522, "isEqualToString:", CFSTR("RELEVANCE")) & 1) != 0)
      {
        v523 = 0;
      }
      else if ((objc_msgSend(v522, "isEqualToString:", CFSTR("RATING")) & 1) != 0)
      {
        v523 = 1;
      }
      else if ((objc_msgSend(v522, "isEqualToString:", CFSTR("DISTANCE")) & 1) != 0)
      {
        v523 = 2;
      }
      else if (objc_msgSend(v522, "isEqualToString:", CFSTR("PRICE")))
      {
        v523 = 3;
      }
      else
      {
        v523 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_1195;
      v523 = objc_msgSend(v521, "intValue");
    }
    *(_BYTE *)&v518->_flags |= 0x20u;
    *(_BYTE *)&v518->_flags |= 2u;
    v518->_sortOrder = v523;
LABEL_1195:

    if ((_DWORD)a3)
      v524 = CFSTR("maxResults");
    else
      v524 = CFSTR("max_results");
    objc_msgSend(v519, "objectForKeyedSubscript:", v524);
    v525 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v526 = objc_msgSend(v525, "unsignedIntValue");
      *(_BYTE *)&v518->_flags |= 0x20u;
      *(_BYTE *)&v518->_flags |= 1u;
      v518->_maxResults = v526;
    }

    if ((_DWORD)a3)
      v527 = CFSTR("viewportInfo");
    else
      v527 = CFSTR("viewport_info");
    objc_msgSend(v519, "objectForKeyedSubscript:", v527);
    v528 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v529 = [GEOPDViewportInfo alloc];
      if ((a3 & 1) != 0)
        v530 = -[GEOPDViewportInfo initWithJSON:](v529, "initWithJSON:", v528);
      else
        v530 = -[GEOPDViewportInfo initWithDictionary:](v529, "initWithDictionary:", v528);
      v531 = v530;
      -[GEOPDNearbySearchParameters setViewportInfo:]((uint64_t)v518, v530);

    }
    if ((_DWORD)a3)
      v532 = CFSTR("nearbySearchFilter");
    else
      v532 = CFSTR("nearby_search_filter");
    objc_msgSend(v519, "objectForKeyedSubscript:", v532);
    v533 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_1248;
    v534 = [GEOPDNearbySearchFilter alloc];
    if (!v534)
    {
LABEL_1247:
      -[GEOPDNearbySearchParameters setNearbySearchFilter:]((uint64_t)v518, v534);

LABEL_1248:
      goto LABEL_1249;
    }
    v535 = v533;
    v534 = -[GEOPDNearbySearchFilter init](v534, "init");
    if (!v534)
    {
LABEL_1246:

      goto LABEL_1247;
    }
    if ((_DWORD)a3)
      v536 = CFSTR("includedCategoryFilter");
    else
      v536 = CFSTR("included_category_filter");
    objc_msgSend(v535, "objectForKeyedSubscript:", v536);
    v537 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objb = v535;
      v1395 = v533;
      v1448 = 0u;
      v1447 = 0u;
      v1446 = 0u;
      v1445 = 0u;
      v1369 = v537;
      v538 = v537;
      v539 = objc_msgSend(v538, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
      if (v539)
      {
        v540 = v539;
        v541 = *(_QWORD *)v1446;
        do
        {
          for (i3 = 0; i3 != v540; ++i3)
          {
            if (*(_QWORD *)v1446 != v541)
              objc_enumerationMutation(v538);
            v543 = *(void **)(*((_QWORD *)&v1445 + 1) + 8 * i3);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v544 = (void *)objc_msgSend(v543, "copy");
              -[GEOPDNearbySearchFilter addIncludedCategoryFilter:]((uint64_t)v534, v544);

            }
          }
          v540 = objc_msgSend(v538, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
        }
        while (v540);
      }

      a3 = v1379;
      v535 = objb;
      v533 = v1395;
      v537 = v1369;
    }

    if ((_DWORD)a3)
      v545 = CFSTR("poiAgeFilter");
    else
      v545 = CFSTR("poi_age_filter");
    objc_msgSend(v535, "objectForKeyedSubscript:", v545);
    v546 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v547 = v535;
      v548 = v546;
      if ((objc_msgSend(v548, "isEqualToString:", CFSTR("POI_AGE_FILTER_NONE")) & 1) != 0)
      {
        v549 = 0;
      }
      else if ((objc_msgSend(v548, "isEqualToString:", CFSTR("POI_AGE_FILTER_LAST_MONTH")) & 1) != 0)
      {
        v549 = 1;
      }
      else if ((objc_msgSend(v548, "isEqualToString:", CFSTR("POI_AGE_FILTER_LAST_6_MONTHS")) & 1) != 0)
      {
        v549 = 2;
      }
      else if (objc_msgSend(v548, "isEqualToString:", CFSTR("POI_AGE_FILTER_SERVER")))
      {
        v549 = 10;
      }
      else
      {
        v549 = 0;
      }

      v535 = v547;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_1245:

        goto LABEL_1246;
      }
      v549 = objc_msgSend(v546, "intValue");
    }
    *(_BYTE *)&v534->_flags |= 1u;
    v534->_poiAgeFilter = v549;
    a3 = v1379;
    goto LABEL_1245;
  }
LABEL_1251:

  if ((_DWORD)a3)
    v550 = CFSTR("addressObjectGeocodingParameters");
  else
    v550 = CFSTR("address_object_geocoding_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v550);
  v551 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v552 = [GEOPDAddressObjectGeocodingParameters alloc];
    if (v552)
    {
      v553 = v551;
      v552 = -[GEOPDAddressObjectGeocodingParameters init](v552, "init");
      if (v552)
      {
        if ((_DWORD)a3)
          v554 = CFSTR("addressObject");
        else
          v554 = CFSTR("address_object");
        objc_msgSend(v553, "objectForKeyedSubscript:", v554);
        v555 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v556 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v555, 0);
          -[GEOPDAddressObjectGeocodingParameters setAddressObject:]((uint64_t)v552, v556);

        }
        if ((_DWORD)a3)
          v557 = CFSTR("maxResults");
        else
          v557 = CFSTR("max_results");
        objc_msgSend(v553, "objectForKeyedSubscript:", v557);
        v558 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v559 = objc_msgSend(v558, "unsignedIntValue");
          *(_BYTE *)&v552->_flags |= 0x10u;
          *(_BYTE *)&v552->_flags |= 1u;
          v552->_maxResults = v559;
        }

        if ((_DWORD)a3)
          v560 = CFSTR("viewportInfo");
        else
          v560 = CFSTR("viewport_info");
        objc_msgSend(v553, "objectForKeyedSubscript:", v560);
        v561 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v562 = [GEOPDViewportInfo alloc];
          if ((a3 & 1) != 0)
            v563 = -[GEOPDViewportInfo initWithJSON:](v562, "initWithJSON:", v561);
          else
            v563 = -[GEOPDViewportInfo initWithDictionary:](v562, "initWithDictionary:", v561);
          v564 = v563;
          -[GEOPDAddressObjectGeocodingParameters setViewportInfo:]((uint64_t)v552, v563);

        }
      }

    }
    -[GEOPDPlaceRequestParameters setAddressObjectGeocodingParameters:]((uint64_t)v1335, v552);

  }
  if ((_DWORD)a3)
    v565 = CFSTR("searchZeroKeywordWithSearchResultsSuggestionParameters");
  else
    v565 = CFSTR("search_zero_keyword_with_search_results_suggestion_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v565);
  v566 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v567 = [GEOPDSearchZeroKeywordWithSearchResultsSuggestionParameters alloc];
    if (v567)
    {
      v568 = v566;
      v567 = -[GEOPDSearchZeroKeywordWithSearchResultsSuggestionParameters init](v567, "init");
      if (v567)
      {
        if ((_DWORD)a3)
          v569 = CFSTR("maxCategories");
        else
          v569 = CFSTR("max_categories");
        objc_msgSend(v568, "objectForKeyedSubscript:", v569);
        v570 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v571 = objc_msgSend(v570, "unsignedIntValue");
          *(_BYTE *)&v567->_flags |= 4u;
          v567->_maxCategories = v571;
        }

        if ((_DWORD)a3)
          v572 = CFSTR("maxResultsPerCategory");
        else
          v572 = CFSTR("max_results_per_category");
        objc_msgSend(v568, "objectForKeyedSubscript:", v572);
        v573 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v574 = objc_msgSend(v573, "unsignedIntValue");
          *(_BYTE *)&v567->_flags |= 8u;
          v567->_maxResultsPerCategory = v574;
        }

        if ((_DWORD)a3)
          v575 = CFSTR("blurredHourOfDay");
        else
          v575 = CFSTR("blurred_hour_of_day");
        objc_msgSend(v568, "objectForKeyedSubscript:", v575);
        v576 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v577 = objc_msgSend(v576, "unsignedIntValue");
          *(_BYTE *)&v567->_flags |= 1u;
          v567->_blurredHourOfDay = v577;
        }

        if ((_DWORD)a3)
          v578 = CFSTR("dayOfWeek");
        else
          v578 = CFSTR("day_of_week");
        objc_msgSend(v568, "objectForKeyedSubscript:", v578);
        v579 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v580 = objc_msgSend(v579, "unsignedIntValue");
          *(_BYTE *)&v567->_flags |= 2u;
          v567->_dayOfWeek = v580;
        }

      }
    }
    -[GEOPDPlaceRequestParameters setSearchZeroKeywordWithSearchResultsSuggestionParameters:]((uint64_t)v1335, v567);

  }
  if ((_DWORD)a3)
    v581 = CFSTR("externalTransitLookupParameters");
  else
    v581 = CFSTR("external_transit_lookup_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v581);
  v582 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v583 = [GEOPDExternalTransitLookupParameters alloc];
    if (v583)
    {
      v584 = v582;
      v583 = -[GEOPDExternalTransitLookupParameters init](v583, "init");
      if (v583)
      {
        if ((_DWORD)a3)
          v585 = CFSTR("transactionTimestamp");
        else
          v585 = CFSTR("transaction_timestamp");
        objc_msgSend(v584, "objectForKeyedSubscript:", v585);
        v586 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v586, "doubleValue");
          *(_BYTE *)&v583->_flags |= 0x20u;
          *(_BYTE *)&v583->_flags |= 1u;
          v583->_transactionTimestamp = v587;
        }

        if ((_DWORD)a3)
          v588 = CFSTR("transactionLocation");
        else
          v588 = CFSTR("transaction_location");
        objc_msgSend(v584, "objectForKeyedSubscript:", v588);
        v589 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v590 = [GEOLocation alloc];
          if ((a3 & 1) != 0)
            v591 = -[GEOLocation initWithJSON:](v590, "initWithJSON:", v589);
          else
            v591 = -[GEOLocation initWithDictionary:](v590, "initWithDictionary:", v589);
          v592 = v591;
          -[GEOPDExternalTransitLookupParameters setTransactionLocation:]((uint64_t)v583, v591);

        }
        if ((_DWORD)a3)
          v593 = CFSTR("sourceId");
        else
          v593 = CFSTR("source_id");
        objc_msgSend(v584, "objectForKeyedSubscript:", v593);
        v594 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v595 = (void *)objc_msgSend(v594, "copy");
          -[GEOPDExternalTransitLookupParameters setSourceId:]((uint64_t)v583, v595);

        }
        if ((_DWORD)a3)
          v596 = CFSTR("externalTransitStationCode");
        else
          v596 = CFSTR("external_transit_station_code");
        objc_msgSend(v584, "objectForKeyedSubscript:", v596);
        v597 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1396 = v584;
          v1448 = 0u;
          v1447 = 0u;
          v1446 = 0u;
          v1445 = 0u;
          v598 = v597;
          v599 = objc_msgSend(v598, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
          if (v599)
          {
            v600 = v599;
            v601 = *(_QWORD *)v1446;
            do
            {
              for (i4 = 0; i4 != v600; ++i4)
              {
                if (*(_QWORD *)v1446 != v601)
                  objc_enumerationMutation(v598);
                v603 = *(_QWORD *)(*((_QWORD *)&v1445 + 1) + 8 * i4);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v604 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v603, 0);
                  -[GEOPDExternalTransitLookupParameters addExternalTransitStationCode:]((uint64_t)v583, v604);

                }
              }
              v600 = objc_msgSend(v598, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
            }
            while (v600);
          }

          a3 = v1379;
          v584 = v1396;
        }

      }
    }
    -[GEOPDPlaceRequestParameters setExternalTransitLookupParameters:]((uint64_t)v1335, v583);

  }
  if ((_DWORD)a3)
    v605 = CFSTR("featureIdGeocodingParameters");
  else
    v605 = CFSTR("feature_id_geocoding_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v605);
  v606 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v607 = [GEOPDFeatureIdGeocodingParameters alloc];
    if (!v607)
    {
LABEL_1395:
      -[GEOPDPlaceRequestParameters setFeatureIdGeocodingParameters:]((uint64_t)v1335, v607);

      goto LABEL_1396;
    }
    v608 = v606;
    v607 = -[GEOPDFeatureIdGeocodingParameters init](v607, "init");
    if (!v607)
    {
LABEL_1394:

      goto LABEL_1395;
    }
    if ((_DWORD)a3)
      v609 = CFSTR("featureId");
    else
      v609 = CFSTR("feature_id");
    objc_msgSend(v608, "objectForKeyedSubscript:", v609);
    v610 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v611 = objc_msgSend(v610, "unsignedLongLongValue");
      *(_BYTE *)&v607->_flags |= 0x20u;
      *(_BYTE *)&v607->_flags |= 1u;
      v607->_featureId = v611;
    }

    if (v1379)
      v612 = CFSTR("encryptedFeatureId");
    else
      v612 = CFSTR("encrypted_feature_id");
    objc_msgSend(v608, "objectForKeyedSubscript:", v612);
    v613 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v1448 = 0u;
      v1447 = 0u;
      v1446 = 0u;
      v1445 = 0u;
      v614 = v613;
      v615 = objc_msgSend(v614, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
      if (v615)
      {
        v616 = v615;
        v617 = *(_QWORD *)v1446;
        do
        {
          for (i5 = 0; i5 != v616; ++i5)
          {
            if (*(_QWORD *)v1446 != v617)
              objc_enumerationMutation(v614);
            v619 = *(void **)(*((_QWORD *)&v1445 + 1) + 8 * i5);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v619, "unsignedLongLongValue");
              -[GEOPDFeatureIdGeocodingParameters addEncryptedFeatureId:]((uint64_t)v607);
            }
          }
          v616 = objc_msgSend(v614, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
        }
        while (v616);
      }

    }
    objc_msgSend(v608, "objectForKeyedSubscript:", CFSTR("location"));
    v620 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v621 = [GEOLatLng alloc];
      if ((v1379 & 1) != 0)
        v622 = -[GEOLatLng initWithJSON:](v621, "initWithJSON:", v620);
      else
        v622 = -[GEOLatLng initWithDictionary:](v621, "initWithDictionary:", v620);
      v623 = v622;
      -[GEOPDFeatureIdGeocodingParameters setLocation:]((uint64_t)v607, v622);

    }
    if (v1379)
      v624 = CFSTR("formattedAddressType");
    else
      v624 = CFSTR("formatted_address_type");
    objc_msgSend(v608, "objectForKeyedSubscript:", v624);
    v625 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v626 = v625;
      if ((objc_msgSend(v626, "isEqualToString:", CFSTR("FULL")) & 1) != 0)
      {
        v627 = 0;
        a3 = v1379;
      }
      else
      {
        a3 = v1379;
        if ((objc_msgSend(v626, "isEqualToString:", CFSTR("SHORT")) & 1) != 0)
        {
          v627 = 1;
        }
        else if (objc_msgSend(v626, "isEqualToString:", CFSTR("SPOKEN")))
        {
          v627 = 2;
        }
        else
        {
          v627 = 0;
        }
      }

    }
    else
    {
      objc_opt_class();
      a3 = v1379;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_1393:

        goto LABEL_1394;
      }
      v627 = objc_msgSend(v625, "intValue");
    }
    *(_BYTE *)&v607->_flags |= 0x20u;
    *(_BYTE *)&v607->_flags |= 2u;
    v607->_formattedAddressType = v627;
    goto LABEL_1393;
  }
LABEL_1396:

  if ((_DWORD)a3)
    v628 = CFSTR("mapsIdentifierPlaceLookupParameters");
  else
    v628 = CFSTR("maps_identifier_place_lookup_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v628);
  v629 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v630 = [GEOPDMapsIdentifierPlaceLookupParameters alloc];
    if (v630)
    {
      v631 = v629;
      v630 = -[GEOPDMapsIdentifierPlaceLookupParameters init](v630, "init");
      if (v630)
      {
        if ((_DWORD)a3)
          v632 = CFSTR("resultProviderId");
        else
          v632 = CFSTR("result_provider_id");
        objc_msgSend(v631, "objectForKeyedSubscript:", v632);
        v633 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v634 = objc_msgSend(v633, "intValue");
          *(_BYTE *)&v630->_flags |= 1u;
          v630->_resultProviderId = v634;
        }

        if ((_DWORD)a3)
          v635 = CFSTR("mapsId");
        else
          v635 = CFSTR("maps_id");
        objc_msgSend(v631, "objectForKeyedSubscript:", v635);
        v636 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1448 = 0u;
          v1447 = 0u;
          v1446 = 0u;
          v1445 = 0u;
          v637 = v636;
          v638 = objc_msgSend(v637, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
          if (v638)
          {
            v639 = v638;
            v640 = *(_QWORD *)v1446;
            do
            {
              for (i6 = 0; i6 != v639; ++i6)
              {
                if (*(_QWORD *)v1446 != v640)
                  objc_enumerationMutation(v637);
                v642 = *(_QWORD *)(*((_QWORD *)&v1445 + 1) + 8 * i6);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v643 = [GEOPDMapsIdentifier alloc];
                  if ((v1379 & 1) != 0)
                    v644 = -[GEOPDMapsIdentifier initWithJSON:](v643, "initWithJSON:", v642);
                  else
                    v644 = -[GEOPDMapsIdentifier initWithDictionary:](v643, "initWithDictionary:", v642);
                  v645 = v644;
                  -[GEOPDMapsIdentifierPlaceLookupParameters addMapsId:]((uint64_t)v630, v644);

                }
              }
              v639 = objc_msgSend(v637, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
            }
            while (v639);
          }

          a3 = v1379;
        }

        if ((_DWORD)a3)
          v646 = CFSTR("enablePartialClientization");
        else
          v646 = CFSTR("enable_partial_clientization");
        objc_msgSend(v631, "objectForKeyedSubscript:", v646);
        v647 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v648 = objc_msgSend(v647, "BOOLValue");
          *(_BYTE *)&v630->_flags |= 2u;
          v630->_enablePartialClientization = v648;
        }

      }
    }
    -[GEOPDPlaceRequestParameters setMapsIdentifierPlaceLookupParameters:]((uint64_t)v1335, v630);

  }
  if ((_DWORD)a3)
    v649 = CFSTR("batchReverseGeocodingParameters");
  else
    v649 = CFSTR("batch_reverse_geocoding_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v649);
  v650 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v651 = [GEOPDBatchReverseGeocodingParameters alloc];
    if (v651)
    {
      v652 = v650;
      v651 = -[GEOPDBatchReverseGeocodingParameters init](v651, "init");
      if (v651)
      {
        if ((_DWORD)a3)
          v653 = CFSTR("assetLocation");
        else
          v653 = CFSTR("asset_location");
        objc_msgSend(v652, "objectForKeyedSubscript:", v653);
        v654 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        objc = v652;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1443 = 0u;
          v1444 = 0u;
          v1441 = 0u;
          v1442 = 0u;
          v655 = v654;
          v656 = objc_msgSend(v655, "countByEnumeratingWithState:objects:count:", &v1441, v1449, 16);
          if (v656)
          {
            v657 = v656;
            v658 = *(_QWORD *)v1442;
            do
            {
              for (i7 = 0; i7 != v657; ++i7)
              {
                if (*(_QWORD *)v1442 != v658)
                  objc_enumerationMutation(v655);
                v660 = *(_QWORD *)(*((_QWORD *)&v1441 + 1) + 8 * i7);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v661 = [GEOLocation alloc];
                  if ((v1379 & 1) != 0)
                    v662 = -[GEOLocation initWithJSON:](v661, "initWithJSON:", v660);
                  else
                    v662 = -[GEOLocation initWithDictionary:](v661, "initWithDictionary:", v660);
                  v663 = v662;
                  -[GEOPDBatchReverseGeocodingParameters addAssetLocation:]((uint64_t)v651, v662);

                }
              }
              v657 = objc_msgSend(v655, "countByEnumeratingWithState:objects:count:", &v1441, v1449, 16);
            }
            while (v657);
          }

          a3 = v1379;
          v652 = objc;
        }

        if ((_DWORD)a3)
          v664 = CFSTR("additionalPlaceType");
        else
          v664 = CFSTR("additional_place_type");
        objc_msgSend(v652, "objectForKeyedSubscript:", v664);
        v665 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1439 = 0u;
          v1440 = 0u;
          v1437 = 0u;
          v1438 = 0u;
          v1370 = v665;
          v666 = v665;
          v667 = objc_msgSend(v666, "countByEnumeratingWithState:objects:count:", &v1437, &v1445, 16);
          if (!v667)
            goto LABEL_1494;
          v668 = v667;
          v669 = *(_QWORD *)v1438;
          while (1)
          {
            for (i8 = 0; i8 != v668; ++i8)
            {
              if (*(_QWORD *)v1438 != v669)
                objc_enumerationMutation(v666);
              v671 = *(void **)(*((_QWORD *)&v1437 + 1) + 8 * i8);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v672 = v671;
                if ((objc_msgSend(v672, "isEqualToString:", CFSTR("UNKNOWN_PLACE_TYPE")) & 1) == 0
                  && (objc_msgSend(v672, "isEqualToString:", CFSTR("COUNTRY")) & 1) == 0
                  && (objc_msgSend(v672, "isEqualToString:", CFSTR("ADMINISTRATIVE_AREA")) & 1) == 0
                  && (objc_msgSend(v672, "isEqualToString:", CFSTR("SUB_ADMINISTRATIVE_AREA")) & 1) == 0
                  && (objc_msgSend(v672, "isEqualToString:", CFSTR("LOCALITY")) & 1) == 0
                  && (objc_msgSend(v672, "isEqualToString:", CFSTR("TIME_ZONE")) & 1) == 0
                  && (objc_msgSend(v672, "isEqualToString:", CFSTR("SUB_LOCALITY")) & 1) == 0
                  && (objc_msgSend(v672, "isEqualToString:", CFSTR("OCEAN")) & 1) == 0
                  && (objc_msgSend(v672, "isEqualToString:", CFSTR("AOI")) & 1) == 0
                  && (objc_msgSend(v672, "isEqualToString:", CFSTR("INLAND_WATER")) & 1) == 0
                  && (objc_msgSend(v672, "isEqualToString:", CFSTR("BUSINESS")) & 1) == 0
                  && (objc_msgSend(v672, "isEqualToString:", CFSTR("ISLAND")) & 1) == 0
                  && (objc_msgSend(v672, "isEqualToString:", CFSTR("STREET")) & 1) == 0
                  && (objc_msgSend(v672, "isEqualToString:", CFSTR("ADMIN")) & 1) == 0
                  && (objc_msgSend(v672, "isEqualToString:", CFSTR("POSTAL")) & 1) == 0
                  && (objc_msgSend(v672, "isEqualToString:", CFSTR("INTERSECTION")) & 1) == 0
                  && (objc_msgSend(v672, "isEqualToString:", CFSTR("BUILDING")) & 1) == 0
                  && (objc_msgSend(v672, "isEqualToString:", CFSTR("ADDRESS")) & 1) == 0
                  && (objc_msgSend(v672, "isEqualToString:", CFSTR("CONTINENT")) & 1) == 0
                  && (objc_msgSend(v672, "isEqualToString:", CFSTR("REGION")) & 1) == 0
                  && (objc_msgSend(v672, "isEqualToString:", CFSTR("DIVISION")) & 1) == 0)
                {
                  objc_msgSend(v672, "isEqualToString:", CFSTR("PHYSICAL_FEATURE"));
                }

              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  continue;
                objc_msgSend(v671, "intValue");
              }
              -[GEOPDBatchReverseGeocodingParameters addAdditionalPlaceType:]((uint64_t)v651);
            }
            v668 = objc_msgSend(v666, "countByEnumeratingWithState:objects:count:", &v1437, &v1445, 16);
            if (!v668)
            {
LABEL_1494:

              a3 = v1379;
              v652 = objc;
              v665 = v1370;
              break;
            }
          }
        }

      }
    }
    -[GEOPDPlaceRequestParameters setBatchReverseGeocodingParameters:]((uint64_t)v1335, v651);

  }
  if ((_DWORD)a3)
    v673 = CFSTR("brandLookupParameters");
  else
    v673 = CFSTR("brand_lookup_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v673);
  v674 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v675 = [GEOPDBrandLookupParameters alloc];
    if (v675)
    {
      v676 = v674;
      v675 = -[GEOPDBrandLookupParameters init](v675, "init");
      if (v675)
      {
        if ((_DWORD)a3)
          v677 = CFSTR("imessageUid");
        else
          v677 = CFSTR("imessage_uid");
        objc_msgSend(v676, "objectForKeyedSubscript:", v677);
        v678 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v679 = (void *)objc_msgSend(v678, "copy");
          -[GEOPDBrandLookupParameters setImessageUid:]((uint64_t)v675, v679);

        }
      }

    }
    -[GEOPDPlaceRequestParameters setBrandLookupParameters:]((uint64_t)v1335, v675);

  }
  if ((_DWORD)a3)
    v680 = CFSTR("wifiFingerprintParameters");
  else
    v680 = CFSTR("wifi_fingerprint_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v680);
  v681 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v682 = [GEOPDWifiFingerprintParameters alloc];
    if (v682)
    {
      v683 = v682;
      v684 = v681;
      v1352 = -[GEOPDWifiFingerprintParameters init](v683, "init");
      if (v1352)
      {
        objc_msgSend(v684, "objectForKeyedSubscript:", CFSTR("measurement"));
        v685 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1333 = v684;
          v1334 = v681;
          v1431 = 0u;
          v1432 = 0u;
          v1429 = 0u;
          v1430 = 0u;
          v1332 = v685;
          v1355 = v685;
          v686 = objc_msgSend(v1355, "countByEnumeratingWithState:objects:count:", &v1429, &v1441, 16);
          if (v686)
          {
            v687 = v686;
            v688 = *(_QWORD *)v1430;
            if ((_DWORD)a3)
              v689 = CFSTR("wifiAccessPoint");
            else
              v689 = CFSTR("wifi_access_point");
            v690 = CFSTR("mac_id");
            if ((_DWORD)a3)
              v690 = CFSTR("macId");
            v1397 = v690;
            v691 = CFSTR("scan_timestamp");
            if ((_DWORD)a3)
              v691 = CFSTR("scanTimestamp");
            objd = v691;
            v692 = CFSTR("entryTime");
            if (!(_DWORD)a3)
              v692 = CFSTR("entry_time");
            v1340 = v692;
            v1343 = v689;
            v693 = CFSTR("exit_time");
            if ((_DWORD)a3)
              v693 = CFSTR("exitTime");
            v1337 = v693;
            v1346 = *(_QWORD *)v1430;
            do
            {
              v694 = 0;
              v1349 = v687;
              do
              {
                if (*(_QWORD *)v1430 != v688)
                  objc_enumerationMutation(v1355);
                v695 = *(void **)(*((_QWORD *)&v1429 + 1) + 8 * v694);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v696 = [GEOPDWifiMeasurement alloc];
                  if (v696)
                  {
                    v697 = v696;
                    v698 = v695;
                    v699 = -[GEOPDWifiMeasurement init](v697, "init");
                    if (v699)
                    {
                      v1371 = v698;
                      objc_msgSend(v698, "objectForKeyedSubscript:", CFSTR("location"));
                      v700 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      v1359 = v694;
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v1439 = 0u;
                        v1440 = 0u;
                        v1437 = 0u;
                        v1438 = 0u;
                        v701 = v700;
                        v702 = objc_msgSend(v701, "countByEnumeratingWithState:objects:count:", &v1437, v1449, 16);
                        if (v702)
                        {
                          v703 = v702;
                          v704 = *(_QWORD *)v1438;
                          do
                          {
                            for (i9 = 0; i9 != v703; ++i9)
                            {
                              if (*(_QWORD *)v1438 != v704)
                                objc_enumerationMutation(v701);
                              v706 = *(_QWORD *)(*((_QWORD *)&v1437 + 1) + 8 * i9);
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v707 = [GEOLocation alloc];
                                if ((a3 & 1) != 0)
                                  v708 = -[GEOLocation initWithJSON:](v707, "initWithJSON:", v706);
                                else
                                  v708 = -[GEOLocation initWithDictionary:](v707, "initWithDictionary:", v706);
                                v709 = v708;
                                -[GEOPDWifiMeasurement addLocation:](v699, v708);

                              }
                            }
                            v703 = objc_msgSend(v701, "countByEnumeratingWithState:objects:count:", &v1437, v1449, 16);
                          }
                          while (v703);
                        }

                        v688 = v1346;
                        v687 = v1349;
                        v694 = v1359;
                      }

                      v710 = v1371;
                      objc_msgSend(v1371, "objectForKeyedSubscript:", v1343);
                      v711 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v1435 = 0u;
                        v1436 = 0u;
                        v1433 = 0u;
                        v1434 = 0u;
                        v712 = v711;
                        v713 = objc_msgSend(v712, "countByEnumeratingWithState:objects:count:", &v1433, &v1445, 16);
                        if (v713)
                        {
                          v714 = v713;
                          v715 = *(_QWORD *)v1434;
                          do
                          {
                            for (i10 = 0; i10 != v714; ++i10)
                            {
                              if (*(_QWORD *)v1434 != v715)
                                objc_enumerationMutation(v712);
                              v717 = *(void **)(*((_QWORD *)&v1433 + 1) + 8 * i10);
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v718 = [GEOPDWifiAccessPoint alloc];
                                if (v718)
                                {
                                  v719 = v717;
                                  v718 = -[GEOPDWifiAccessPoint init](v718, "init");
                                  if (v718)
                                  {
                                    objc_msgSend(v719, "objectForKeyedSubscript:", v1397);
                                    v720 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v721 = (void *)objc_msgSend(v720, "copy");
                                      -[GEOPDWifiAccessPoint setMacId:]((uint64_t)v718, v721);

                                    }
                                    objc_msgSend(v719, "objectForKeyedSubscript:", CFSTR("rssi"));
                                    v722 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v723 = objc_msgSend(v722, "intValue");
                                      *(_BYTE *)&v718->_flags |= 8u;
                                      v718->_rssi = v723;
                                    }

                                    objc_msgSend(v719, "objectForKeyedSubscript:", CFSTR("channel"));
                                    v724 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v725 = objc_msgSend(v724, "intValue");
                                      *(_BYTE *)&v718->_flags |= 4u;
                                      v718->_channel = v725;
                                    }

                                    objc_msgSend(v719, "objectForKeyedSubscript:", objd);
                                    v726 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v727 = objc_msgSend(v726, "unsignedLongLongValue");
                                      *(_BYTE *)&v718->_flags |= 1u;
                                      v718->_scanTimestamp = v727;
                                    }

                                    objc_msgSend(v719, "objectForKeyedSubscript:", CFSTR("age"));
                                    v728 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v729 = objc_msgSend(v728, "unsignedIntValue");
                                      *(_BYTE *)&v718->_flags |= 2u;
                                      v718->_age = v729;
                                    }

                                  }
                                }
                                -[GEOPDWifiMeasurement addWifiAccessPoint:](v699, v718);

                              }
                            }
                            v714 = objc_msgSend(v712, "countByEnumeratingWithState:objects:count:", &v1433, &v1445, 16);
                          }
                          while (v714);
                        }

                        a3 = v1379;
                        v688 = v1346;
                        v687 = v1349;
                        v694 = v1359;
                        v710 = v1371;
                      }

                      objc_msgSend(v710, "objectForKeyedSubscript:", v1340);
                      v730 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v731 = objc_msgSend(v730, "unsignedLongLongValue");
                        *(_BYTE *)(v699 + 68) |= 0x20u;
                        *(_BYTE *)(v699 + 68) |= 1u;
                        *(_QWORD *)(v699 + 24) = v731;
                      }

                      objc_msgSend(v1371, "objectForKeyedSubscript:", v1337);
                      v732 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v733 = objc_msgSend(v732, "unsignedLongLongValue");
                        *(_BYTE *)(v699 + 68) |= 0x20u;
                        *(_BYTE *)(v699 + 68) |= 2u;
                        *(_QWORD *)(v699 + 32) = v733;
                      }

                      v698 = v1371;
                    }

                  }
                  else
                  {
                    v699 = 0;
                  }
                  -[GEOPDWifiFingerprintParameters addMeasurement:](v1352, (void *)v699);

                }
                ++v694;
              }
              while (v694 != v687);
              v734 = objc_msgSend(v1355, "countByEnumeratingWithState:objects:count:", &v1429, &v1441, 16);
              v687 = v734;
            }
            while (v734);
          }

          v684 = v1333;
          v681 = v1334;
          v685 = v1332;
        }

        if ((_DWORD)a3)
          v735 = CFSTR("maxLabels");
        else
          v735 = CFSTR("max_labels");
        objc_msgSend(v684, "objectForKeyedSubscript:", v735);
        v736 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v737 = objc_msgSend(v736, "unsignedIntValue");
          *(_BYTE *)(v1352 + 28) |= 1u;
          *(_DWORD *)(v1352 + 24) = v737;
        }

      }
    }
    else
    {
      v1352 = 0;
    }
    -[GEOPDPlaceRequestParameters setWifiFingerprintParameters:]((uint64_t)v1335, (void *)v1352);

  }
  if ((_DWORD)a3)
    v738 = CFSTR("ipGeoLookupParameters");
  else
    v738 = CFSTR("ip_geo_lookup_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v738);
  v739 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v740 = [GEOPDIpGeoLookupParameters alloc];
    if (v740)
    {
      v741 = v739;
      v740 = -[GEOPDIpGeoLookupParameters init](v740, "init");
      if (v740)
      {
        if ((_DWORD)a3)
          v742 = CFSTR("ipAddress");
        else
          v742 = CFSTR("ip_address");
        objc_msgSend(v741, "objectForKeyedSubscript:", v742);
        v743 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v744 = (void *)objc_msgSend(v743, "copy");
          -[GEOPDIpGeoLookupParameters setIpAddress:]((uint64_t)v740, v744);

        }
      }

    }
    -[GEOPDPlaceRequestParameters setIpGeoLookupParameters:]((uint64_t)v1335, v740);

  }
  if ((_DWORD)a3)
    v745 = CFSTR("groundViewLabelParameters");
  else
    v745 = CFSTR("ground_view_label_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v745);
  v746 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v747 = [GEOPDGroundViewLabelParameters alloc];
    if (v747)
    {
      v748 = v746;
      v747 = -[GEOPDGroundViewLabelParameters init](v747, "init");
      if (v747)
      {
        if ((_DWORD)a3)
          v749 = CFSTR("locationId");
        else
          v749 = CFSTR("location_id");
        objc_msgSend(v748, "objectForKeyedSubscript:", v749);
        v750 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v751 = objc_msgSend(v750, "unsignedLongLongValue");
          *(_BYTE *)&v747->_flags |= 1u;
          v747->_locationId = v751;
        }

        objc_msgSend(v748, "objectForKeyedSubscript:", CFSTR("location"));
        v752 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v753 = [GEOLocation alloc];
          if ((a3 & 1) != 0)
            v754 = -[GEOLocation initWithJSON:](v753, "initWithJSON:", v752);
          else
            v754 = -[GEOLocation initWithDictionary:](v753, "initWithDictionary:", v752);
          v755 = v754;
          -[GEOPDGroundViewLabelParameters setLocation:]((uint64_t)v747, v754);

        }
      }

    }
    -[GEOPDPlaceRequestParameters setGroundViewLabelParameters:]((uint64_t)v1335, v747);

  }
  if ((_DWORD)a3)
    v756 = CFSTR("batchSpatialLookupParameters");
  else
    v756 = CFSTR("batch_spatial_lookup_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v756);
  v757 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v758 = [GEOPDBatchSpatialLookupParameters alloc];
    if (v758)
    {
      v759 = v757;
      v758 = -[GEOPDBatchSpatialLookupParameters init](v758, "init");
      if (v758)
      {
        if ((_DWORD)a3)
          v760 = CFSTR("spatialPlaceLookup");
        else
          v760 = CFSTR("spatial_place_lookup");
        objc_msgSend(v759, "objectForKeyedSubscript:", v760);
        v761 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1443 = 0u;
          v1444 = 0u;
          v1441 = 0u;
          v1442 = 0u;
          v762 = v761;
          v763 = objc_msgSend(v762, "countByEnumeratingWithState:objects:count:", &v1441, v1449, 16);
          if (v763)
          {
            v764 = v763;
            v765 = *(_QWORD *)v1442;
            do
            {
              v766 = 0;
              do
              {
                if (*(_QWORD *)v1442 != v765)
                  objc_enumerationMutation(v762);
                v767 = *(void **)(*((_QWORD *)&v1441 + 1) + 8 * v766);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v768 = [GEOPDSpatialPlaceLookupParameters alloc];
                  if (v768)
                    v769 = (void *)-[GEOPDSpatialPlaceLookupParameters _initWithDictionary:isJSON:](v768, v767, v1379);
                  else
                    v769 = 0;
                  -[GEOPDBatchSpatialLookupParameters addSpatialPlaceLookup:]((uint64_t)v758, v769);

                }
                ++v766;
              }
              while (v764 != v766);
              v770 = objc_msgSend(v762, "countByEnumeratingWithState:objects:count:", &v1441, v1449, 16);
              v764 = v770;
            }
            while (v770);
          }

          a3 = v1379;
        }

        if ((_DWORD)a3)
          v771 = CFSTR("spatialEventLookup");
        else
          v771 = CFSTR("spatial_event_lookup");
        objc_msgSend(v759, "objectForKeyedSubscript:", v771);
        v772 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1439 = 0u;
          v1440 = 0u;
          v1437 = 0u;
          v1438 = 0u;
          v773 = v772;
          v774 = objc_msgSend(v773, "countByEnumeratingWithState:objects:count:", &v1437, &v1445, 16);
          if (v774)
          {
            v775 = v774;
            v776 = *(_QWORD *)v1438;
            do
            {
              v777 = 0;
              do
              {
                if (*(_QWORD *)v1438 != v776)
                  objc_enumerationMutation(v773);
                v778 = *(void **)(*((_QWORD *)&v1437 + 1) + 8 * v777);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v779 = [GEOPDSpatialEventLookupParameters alloc];
                  if (v779)
                    v780 = (void *)-[GEOPDSpatialEventLookupParameters _initWithDictionary:isJSON:](v779, v778, v1379);
                  else
                    v780 = 0;
                  -[GEOPDBatchSpatialLookupParameters addSpatialEventLookup:]((uint64_t)v758, v780);

                }
                ++v777;
              }
              while (v775 != v777);
              v781 = objc_msgSend(v773, "countByEnumeratingWithState:objects:count:", &v1437, &v1445, 16);
              v775 = v781;
            }
            while (v781);
          }

          a3 = v1379;
        }

      }
    }
    -[GEOPDPlaceRequestParameters setBatchSpatialLookupParameters:]((uint64_t)v1335, v758);

  }
  if ((_DWORD)a3)
    v782 = CFSTR("transitVehiclePositionParameters");
  else
    v782 = CFSTR("transit_vehicle_position_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v782);
  v783 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v784 = [GEOPDTransitVehiclePositionParameters alloc];
    if (v784)
    {
      v785 = v783;
      v784 = -[GEOPDTransitVehiclePositionParameters init](v784, "init");
      if (v784)
      {
        if ((_DWORD)a3)
          v786 = CFSTR("tripId");
        else
          v786 = CFSTR("trip_id");
        objc_msgSend(v785, "objectForKeyedSubscript:", v786);
        v787 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1448 = 0u;
          v1447 = 0u;
          v1446 = 0u;
          v1445 = 0u;
          v1398 = v787;
          v788 = v787;
          v789 = objc_msgSend(v788, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
          if (v789)
          {
            v790 = v789;
            v791 = *(_QWORD *)v1446;
            do
            {
              for (i11 = 0; i11 != v790; ++i11)
              {
                if (*(_QWORD *)v1446 != v791)
                  objc_enumerationMutation(v788);
                v793 = *(void **)(*((_QWORD *)&v1445 + 1) + 8 * i11);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v793, "unsignedLongLongValue");
                  PBRepeatedUInt64Add();
                }
              }
              v790 = objc_msgSend(v788, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
            }
            while (v790);
          }

          a3 = v1379;
          v787 = v1398;
        }

      }
    }
    -[GEOPDPlaceRequestParameters setTransitVehiclePositionParameters:]((uint64_t)v1335, v784);

  }
  if ((_DWORD)a3)
    v794 = CFSTR("placeCollectionLookupParameter");
  else
    v794 = CFSTR("place_collection_lookup_parameter");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v794);
  v795 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v796 = [GEOPDPlaceCollectionLookupParameters alloc];
    if (v796)
    {
      v797 = v795;
      v796 = -[GEOPDPlaceCollectionLookupParameters init](v796, "init");
      if (v796)
      {
        objc_msgSend(v797, "objectForKeyedSubscript:", CFSTR("center"));
        v798 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v799 = [GEOLatLng alloc];
          if ((a3 & 1) != 0)
            v800 = -[GEOLatLng initWithJSON:](v799, "initWithJSON:", v798);
          else
            v800 = -[GEOLatLng initWithDictionary:](v799, "initWithDictionary:", v798);
          v801 = v800;
          -[GEOPDPlaceCollectionLookupParameters setCenter:]((uint64_t)v796, v800);

        }
        if ((_DWORD)a3)
          v802 = CFSTR("collectionId");
        else
          v802 = CFSTR("collection_id");
        objc_msgSend(v797, "objectForKeyedSubscript:", v802);
        v803 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1448 = 0u;
          v1447 = 0u;
          v1446 = 0u;
          v1445 = 0u;
          v804 = v803;
          v805 = objc_msgSend(v804, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
          if (v805)
          {
            v806 = v805;
            v807 = *(_QWORD *)v1446;
            do
            {
              for (i12 = 0; i12 != v806; ++i12)
              {
                if (*(_QWORD *)v1446 != v807)
                  objc_enumerationMutation(v804);
                v809 = *(_QWORD *)(*((_QWORD *)&v1445 + 1) + 8 * i12);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v810 = [GEOPDMapsIdentifier alloc];
                  if ((v1379 & 1) != 0)
                    v811 = -[GEOPDMapsIdentifier initWithJSON:](v810, "initWithJSON:", v809);
                  else
                    v811 = -[GEOPDMapsIdentifier initWithDictionary:](v810, "initWithDictionary:", v809);
                  v812 = v811;
                  -[GEOPDPlaceCollectionLookupParameters addCollectionId:]((uint64_t)v796, v811);

                }
              }
              v806 = objc_msgSend(v804, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
            }
            while (v806);
          }

          a3 = v1379;
        }

      }
    }
    -[GEOPDPlaceRequestParameters setPlaceCollectionLookupParameter:]((uint64_t)v1335, v796);

  }
  if ((_DWORD)a3)
    v813 = CFSTR("transitScheduleLookupParameter");
  else
    v813 = CFSTR("transit_schedule_lookup_parameter");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v813);
  v814 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v815 = [GEOPBTransitScheduleLookupParameters alloc];
    if ((a3 & 1) != 0)
      v816 = -[GEOPBTransitScheduleLookupParameters initWithJSON:](v815, "initWithJSON:", v814);
    else
      v816 = -[GEOPBTransitScheduleLookupParameters initWithDictionary:](v815, "initWithDictionary:", v814);
    v817 = v816;
    -[GEOPDPlaceRequestParameters setTransitScheduleLookupParameter:]((uint64_t)v1335, v816);

  }
  if ((_DWORD)a3)
    v818 = CFSTR("batchCategoryLookupParameters");
  else
    v818 = CFSTR("batch_category_lookup_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v818);
  v819 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v820 = [GEOPDBatchCategoryLookupParameters alloc];
    if (v820)
    {
      v821 = v819;
      v820 = -[GEOPDBatchCategoryLookupParameters init](v820, "init");
      if (v820)
      {
        if ((_DWORD)a3)
          v822 = CFSTR("categoryLookupParameter");
        else
          v822 = CFSTR("category_lookup_parameter");
        objc_msgSend(v821, "objectForKeyedSubscript:", v822);
        v823 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1448 = 0u;
          v1447 = 0u;
          v1446 = 0u;
          v1445 = 0u;
          v824 = v823;
          v825 = objc_msgSend(v824, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
          if (v825)
          {
            v826 = v825;
            v827 = *(_QWORD *)v1446;
            do
            {
              v828 = 0;
              do
              {
                if (*(_QWORD *)v1446 != v827)
                  objc_enumerationMutation(v824);
                v829 = *(void **)(*((_QWORD *)&v1445 + 1) + 8 * v828);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v830 = [GEOPDCategoryLookupParameters alloc];
                  if (v830)
                    v831 = (void *)-[GEOPDCategoryLookupParameters _initWithDictionary:isJSON:]((uint64_t)v830, v829, v1379);
                  else
                    v831 = 0;
                  -[GEOPDBatchCategoryLookupParameters addCategoryLookupParameter:]((uint64_t)v820, v831);

                }
                ++v828;
              }
              while (v826 != v828);
              v832 = objc_msgSend(v824, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
              v826 = v832;
            }
            while (v832);
          }

          a3 = v1379;
        }

      }
    }
    -[GEOPDPlaceRequestParameters setBatchCategoryLookupParameters:]((uint64_t)v1335, v820);

  }
  if ((_DWORD)a3)
    v833 = CFSTR("batchMerchantLookupBrandParameters");
  else
    v833 = CFSTR("batch_merchant_lookup_brand_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v833);
  v834 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v835 = [GEOPDBatchMerchantLookupBrandParameters alloc];
    if (v835)
    {
      v836 = v835;
      v837 = v834;
      obje = -[GEOPDBatchMerchantLookupBrandParameters init](v836, "init");
      if (obje)
      {
        if ((_DWORD)a3)
          v838 = CFSTR("merchantLookupBrandParameter");
        else
          v838 = CFSTR("merchant_lookup_brand_parameter");
        objc_msgSend(v837, "objectForKeyedSubscript:", v838);
        v839 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1338 = v837;
          v1341 = v834;
          v1448 = 0u;
          v1447 = 0u;
          v1446 = 0u;
          v1445 = 0u;
          v1399 = v839;
          v840 = objc_msgSend(v1399, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
          if (v840)
          {
            v841 = v840;
            v842 = *(_QWORD *)v1446;
            if ((_DWORD)a3)
              v843 = CFSTR("merchantCode");
            else
              v843 = CFSTR("merchant_code");
            v844 = CFSTR("rawMerchantCode");
            if (!(_DWORD)a3)
              v844 = CFSTR("raw_merchant_code");
            v1360 = v844;
            v1372 = v843;
            v845 = CFSTR("warsaw_identifier");
            if ((_DWORD)a3)
              v845 = CFSTR("warsawIdentifier");
            v1356 = v845;
            if ((_DWORD)a3)
              v846 = CFSTR("appIdentifier");
            else
              v846 = CFSTR("app_identifier");
            v1353 = v846;
            if ((_DWORD)a3)
              v847 = CFSTR("merchantId");
            else
              v847 = CFSTR("merchant_id");
            v848 = CFSTR("merchant_canl");
            if ((_DWORD)a3)
              v848 = CFSTR("merchantCanl");
            v1347 = v848;
            v1350 = v847;
            v849 = CFSTR("identity_merchant_information");
            if ((_DWORD)a3)
              v849 = CFSTR("identityMerchantInformation");
            v1344 = v849;
            do
            {
              v850 = 0;
              do
              {
                if (*(_QWORD *)v1446 != v842)
                  objc_enumerationMutation(v1399);
                v851 = *(void **)(*((_QWORD *)&v1445 + 1) + 8 * v850);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v852 = [GEOPDMerchantLookupBrandParameters alloc];
                  if (v852)
                  {
                    v853 = v852;
                    v854 = v851;
                    v855 = -[GEOPDMerchantLookupBrandParameters init](v853, "init");
                    if (v855)
                    {
                      objc_msgSend(v854, "objectForKeyedSubscript:", v1372);
                      v856 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v857 = (void *)objc_msgSend(v856, "copy");
                        v858 = v857;
                        *(_WORD *)(v855 + 92) |= 0x10u;
                        *(_WORD *)(v855 + 92) |= 0x100u;
                        objc_storeStrong((id *)(v855 + 48), v857);

                      }
                      objc_msgSend(v854, "objectForKeyedSubscript:", v1360);
                      v859 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v860 = (void *)objc_msgSend(v859, "copy");
                        v861 = v860;
                        *(_WORD *)(v855 + 92) |= 0x40u;
                        *(_WORD *)(v855 + 92) |= 0x100u;
                        objc_storeStrong((id *)(v855 + 64), v860);

                      }
                      objc_msgSend(v854, "objectForKeyedSubscript:", v1356);
                      v862 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v863 = [GEOPDWarsawMerchantIdentifier alloc];
                        if (v863)
                          v864 = (void *)-[GEOPDWarsawMerchantIdentifier _initWithDictionary:isJSON:](v863, v862, v1379);
                        else
                          v864 = 0;
                        v865 = v864;
                        *(_WORD *)(v855 + 92) |= 0x80u;
                        *(_WORD *)(v855 + 92) |= 0x100u;
                        objc_storeStrong((id *)(v855 + 72), v864);

                      }
                      objc_msgSend(v854, "objectForKeyedSubscript:", v1353);
                      v866 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v867 = [GEOPDAdamAppIdentifier alloc];
                        if (v867)
                          v868 = (void *)-[GEOPDAdamAppIdentifier _initWithDictionary:isJSON:](v867, v866, v1379);
                        else
                          v868 = 0;
                        v869 = v868;
                        *(_WORD *)(v855 + 92) |= 2u;
                        *(_WORD *)(v855 + 92) |= 0x100u;
                        objc_storeStrong((id *)(v855 + 24), v868);

                      }
                      objc_msgSend(v854, "objectForKeyedSubscript:", v1350);
                      v870 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v871 = (void *)objc_msgSend(v870, "copy");
                        v872 = v871;
                        *(_WORD *)(v855 + 92) |= 0x20u;
                        *(_WORD *)(v855 + 92) |= 0x100u;
                        objc_storeStrong((id *)(v855 + 56), v871);

                      }
                      objc_msgSend(v854, "objectForKeyedSubscript:", v1347);
                      v873 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v874 = (void *)objc_msgSend(v873, "copy");
                        v875 = v874;
                        *(_WORD *)(v855 + 92) |= 8u;
                        *(_WORD *)(v855 + 92) |= 0x100u;
                        objc_storeStrong((id *)(v855 + 40), v874);

                      }
                      objc_msgSend(v854, "objectForKeyedSubscript:", v1344);
                      v876 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v877 = [GEOPDIdentityMerchantInformation alloc];
                        if (v877)
                          v878 = (void *)-[GEOPDIdentityMerchantInformation _initWithDictionary:isJSON:](v877, v876, v1379);
                        else
                          v878 = 0;
                        v879 = v878;
                        *(_WORD *)(v855 + 92) |= 4u;
                        *(_WORD *)(v855 + 92) |= 0x100u;
                        objc_storeStrong((id *)(v855 + 32), v878);

                      }
                    }

                  }
                  else
                  {
                    v855 = 0;
                  }
                  -[GEOPDBatchMerchantLookupBrandParameters addMerchantLookupBrandParameter:]((uint64_t)obje, (void *)v855);

                  a3 = v1379;
                }
                ++v850;
              }
              while (v841 != v850);
              v880 = objc_msgSend(v1399, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
              v841 = v880;
            }
            while (v880);
          }

          v837 = v1338;
          v834 = v1341;
        }

      }
    }
    else
    {
      obje = 0;
    }
    -[GEOPDPlaceRequestParameters setBatchMerchantLookupBrandParameters:]((uint64_t)v1335, obje);

  }
  if ((_DWORD)a3)
    v881 = CFSTR("childPlaceLookupByCategoryParameters");
  else
    v881 = CFSTR("child_place_lookup_by_category_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v881);
  v882 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v883 = [GEOPDChildPlaceLookupByCategoryParameters alloc];
    if (v883)
    {
      v884 = v882;
      v883 = -[GEOPDChildPlaceLookupByCategoryParameters init](v883, "init");
      if (v883)
      {
        if ((_DWORD)a3)
          v885 = CFSTR("categoryMetadata");
        else
          v885 = CFSTR("category_metadata");
        objc_msgSend(v884, "objectForKeyedSubscript:", v885);
        v886 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v887 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v886, 0);
          -[GEOPDChildPlaceLookupByCategoryParameters setCategoryMetadata:]((uint64_t)v883, v887);

        }
        if ((_DWORD)a3)
          v888 = CFSTR("parentMuid");
        else
          v888 = CFSTR("parent_muid");
        objc_msgSend(v884, "objectForKeyedSubscript:", v888);
        v889 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v890 = objc_msgSend(v889, "unsignedLongLongValue");
          *(_BYTE *)&v883->_flags |= 1u;
          v883->_parentMuid = v890;
        }

      }
    }
    -[GEOPDPlaceRequestParameters setChildPlaceLookupByCategoryParameters:]((uint64_t)v1335, v883);

  }
  if ((_DWORD)a3)
    v891 = CFSTR("collectionSuggestionParameters");
  else
    v891 = CFSTR("collection_suggestion_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v891);
  v892 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v893 = [GEOPDCollectionSuggestionParameters alloc];
    if (v893)
      v894 = (void *)-[GEOPDCollectionSuggestionParameters _initWithDictionary:isJSON:](v893, v892, a3);
    else
      v894 = 0;
    -[GEOPDPlaceRequestParameters setCollectionSuggestionParameters:]((uint64_t)v1335, v894);

  }
  if ((_DWORD)a3)
    v895 = CFSTR("mapsSearchHomeParameters");
  else
    v895 = CFSTR("maps_search_home_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v895);
  v896 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v897 = [GEOPDMapsSearchHomeParameters alloc];
    if (v897)
    {
      v898 = v897;
      v899 = v896;
      v900 = -[GEOPDMapsSearchHomeParameters init](v898, "init");
      if (v900)
      {
        if ((_DWORD)a3)
          v901 = CFSTR("supportedSectionType");
        else
          v901 = CFSTR("supported_section_type");
        objc_msgSend(v899, "objectForKeyedSubscript:", v901);
        v902 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        objf = v899;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1373 = v896;
          v1431 = 0u;
          v1432 = 0u;
          v1429 = 0u;
          v1430 = 0u;
          v903 = v902;
          v904 = objc_msgSend(v903, "countByEnumeratingWithState:objects:count:", &v1429, &v1441, 16);
          if (!v904)
            goto LABEL_1888;
          v905 = v904;
          v906 = *(_QWORD *)v1430;
          while (1)
          {
            for (i13 = 0; i13 != v905; ++i13)
            {
              if (*(_QWORD *)v1430 != v906)
                objc_enumerationMutation(v903);
              v908 = *(void **)(*((_QWORD *)&v1429 + 1) + 8 * i13);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v909 = v908;
                if ((objc_msgSend(v909, "isEqualToString:", CFSTR("UNKNOWN")) & 1) == 0
                  && (objc_msgSend(v909, "isEqualToString:", CFSTR("SEARCH_BROWSE_CATEGORY_SUGGESTION_RESULT")) & 1) == 0
                  && (objc_msgSend(v909, "isEqualToString:", CFSTR("COLLECTION_SUGGESTION_RESULT")) & 1) == 0
                  && (objc_msgSend(v909, "isEqualToString:", CFSTR("PUBLISHER_SUGGESTION_RESULT")) & 1) == 0
                  && (objc_msgSend(v909, "isEqualToString:", CFSTR("PLACE_SUGGESTION_RESULT")) & 1) == 0)
                {
                  objc_msgSend(v909, "isEqualToString:", CFSTR("GUIDE_LOCATION_SUGGESTION_RESULT"));
                }

              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  continue;
                objc_msgSend(v908, "intValue");
              }
              -[GEOPDMapsSearchHomeParameters addSupportedSectionType:]((uint64_t)v900);
            }
            v905 = objc_msgSend(v903, "countByEnumeratingWithState:objects:count:", &v1429, &v1441, 16);
            if (!v905)
            {
LABEL_1888:

              a3 = v1379;
              v899 = objf;
              v896 = v1373;
              break;
            }
          }
        }

        if ((_DWORD)a3)
          v910 = CFSTR("searchBrowseCategorySuggestionParameters");
        else
          v910 = CFSTR("search_browse_category_suggestion_parameters");
        objc_msgSend(v899, "objectForKeyedSubscript:", v910);
        v911 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v912 = [GEOPDSearchBrowseCategorySuggestionParameters alloc];
          if (v912)
            v913 = (void *)-[GEOPDSearchBrowseCategorySuggestionParameters _initWithDictionary:isJSON:](v912, v911, a3);
          else
            v913 = 0;
          -[GEOPDMapsSearchHomeParameters setSearchBrowseCategorySuggestionParameters:]((uint64_t)v900, v913);

        }
        objc_msgSend(v899, "objectForKeyedSubscript:", v891);
        v914 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v915 = [GEOPDCollectionSuggestionParameters alloc];
          if (v915)
            v916 = (void *)-[GEOPDCollectionSuggestionParameters _initWithDictionary:isJSON:](v915, v914, a3);
          else
            v916 = 0;
          -[GEOPDMapsSearchHomeParameters setCollectionSuggestionParameters:]((uint64_t)v900, v916);

        }
        if ((_DWORD)a3)
          v917 = CFSTR("publisherSuggestionParameters");
        else
          v917 = CFSTR("publisher_suggestion_parameters");
        objc_msgSend(v899, "objectForKeyedSubscript:", v917);
        v918 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v919 = [GEOPDPublisherSuggestionParameters alloc];
          if (v919)
            v920 = (void *)-[GEOPDPublisherSuggestionParameters _initWithDictionary:isJSON:](v919, v918, a3);
          else
            v920 = 0;
          -[GEOPDMapsSearchHomeParameters setPublisherSuggestionParameters:]((uint64_t)v900, v920);

        }
        if ((_DWORD)a3)
          v921 = CFSTR("placeSuggestionParameters");
        else
          v921 = CFSTR("place_suggestion_parameters");
        objc_msgSend(v899, "objectForKeyedSubscript:", v921);
        v922 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v923 = [GEOPDPlaceSuggestionParameters alloc];
          if (v923)
          {
            v924 = v922;
            v923 = -[GEOPDPlaceSuggestionParameters init](v923, "init");
            if (v923)
            {
              if ((_DWORD)a3)
                v925 = CFSTR("viewportInfo");
              else
                v925 = CFSTR("viewport_info");
              v1361 = v924;
              objc_msgSend(v924, "objectForKeyedSubscript:", v925);
              v926 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v927 = [GEOPDViewportInfo alloc];
                if ((a3 & 1) != 0)
                  v928 = -[GEOPDViewportInfo initWithJSON:](v927, "initWithJSON:", v926);
                else
                  v928 = -[GEOPDViewportInfo initWithDictionary:](v927, "initWithDictionary:", v926);
                v929 = v928;
                -[GEOPDPlaceSuggestionParameters setViewportInfo:]((uint64_t)v923, v928);

              }
              if ((_DWORD)a3)
                v930 = CFSTR("mapsCategoryId");
              else
                v930 = CFSTR("maps_category_id");
              objc_msgSend(v1361, "objectForKeyedSubscript:", v930);
              v931 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v1400 = v891;
              v1374 = v896;
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v1439 = 0u;
                v1440 = 0u;
                v1437 = 0u;
                v1438 = 0u;
                v932 = v931;
                v933 = objc_msgSend(v932, "countByEnumeratingWithState:objects:count:", &v1437, v1449, 16);
                if (v933)
                {
                  v934 = v933;
                  v935 = *(_QWORD *)v1438;
                  do
                  {
                    for (i14 = 0; i14 != v934; ++i14)
                    {
                      if (*(_QWORD *)v1438 != v935)
                        objc_enumerationMutation(v932);
                      v937 = *(void **)(*((_QWORD *)&v1437 + 1) + 8 * i14);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v938 = (void *)objc_msgSend(v937, "copy");
                        -[GEOPDPlaceSuggestionParameters addMapsCategoryId:]((uint64_t)v923, v938);

                      }
                    }
                    v934 = objc_msgSend(v932, "countByEnumeratingWithState:objects:count:", &v1437, v1449, 16);
                  }
                  while (v934);
                }

                a3 = v1379;
                v899 = objf;
                v891 = v1400;
                v896 = v1374;
              }

              if ((_DWORD)a3)
                v939 = CFSTR("suggestedPlaceId");
              else
                v939 = CFSTR("suggested_place_id");
              objc_msgSend(v1361, "objectForKeyedSubscript:", v939);
              v940 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v1435 = 0u;
                v1436 = 0u;
                v1433 = 0u;
                v1434 = 0u;
                v941 = v940;
                v942 = objc_msgSend(v941, "countByEnumeratingWithState:objects:count:", &v1433, &v1445, 16);
                if (v942)
                {
                  v943 = v942;
                  v944 = *(_QWORD *)v1434;
                  do
                  {
                    for (i15 = 0; i15 != v943; ++i15)
                    {
                      if (*(_QWORD *)v1434 != v944)
                        objc_enumerationMutation(v941);
                      v946 = *(_QWORD *)(*((_QWORD *)&v1433 + 1) + 8 * i15);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v947 = [GEOPDMapsIdentifier alloc];
                        if ((v1379 & 1) != 0)
                          v948 = -[GEOPDMapsIdentifier initWithJSON:](v947, "initWithJSON:", v946);
                        else
                          v948 = -[GEOPDMapsIdentifier initWithDictionary:](v947, "initWithDictionary:", v946);
                        v949 = v948;
                        -[GEOPDPlaceSuggestionParameters addSuggestedPlaceId:]((uint64_t)v923, v948);

                      }
                    }
                    v943 = objc_msgSend(v941, "countByEnumeratingWithState:objects:count:", &v1433, &v1445, 16);
                  }
                  while (v943);
                }

                a3 = v1379;
                v899 = objf;
                v891 = v1400;
                v896 = v1374;
              }

              v924 = v1361;
            }

          }
          -[GEOPDMapsSearchHomeParameters setPlaceSuggestionParameters:]((uint64_t)v900, v923);

        }
        if ((_DWORD)a3)
          v950 = CFSTR("guidesLocationsSuggestionParameters");
        else
          v950 = CFSTR("guides_locations_suggestion_parameters");
        objc_msgSend(v899, "objectForKeyedSubscript:", v950);
        v951 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v952 = [GEOPDGuidesLocationsSuggestionParameters alloc];
          if (v952)
          {
            v953 = v951;
            v952 = -[GEOPDGuidesLocationsSuggestionParameters init](v952, "init");
            if (v952)
            {
              if ((_DWORD)a3)
                v954 = CFSTR("viewportInfo");
              else
                v954 = CFSTR("viewport_info");
              objc_msgSend(v953, "objectForKeyedSubscript:", v954);
              v955 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v956 = [GEOPDViewportInfo alloc];
                if ((a3 & 1) != 0)
                  v957 = -[GEOPDViewportInfo initWithJSON:](v956, "initWithJSON:", v955);
                else
                  v957 = -[GEOPDViewportInfo initWithDictionary:](v956, "initWithDictionary:", v955);
                v958 = v957;
                -[GEOPDGuidesLocationsSuggestionParameters setViewportInfo:]((uint64_t)v952, v957);

                v899 = objf;
              }

            }
          }
          -[GEOPDMapsSearchHomeParameters setGuidesLocationsSuggestionParameters:]((uint64_t)v900, v952);

        }
        if ((_DWORD)a3)
          v959 = CFSTR("searchOriginationInfo");
        else
          v959 = CFSTR("search_origination_info");
        objc_msgSend(v899, "objectForKeyedSubscript:", v959);
        v960 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v961 = [GEOPDSearchOriginationInfo alloc];
          if (v961)
            v962 = (void *)-[GEOPDSearchOriginationInfo _initWithDictionary:isJSON:]((uint64_t)v961, v960, a3);
          else
            v962 = 0;
          -[GEOPDMapsSearchHomeParameters setSearchOriginationInfo:]((uint64_t)v900, v962);

        }
      }

    }
    else
    {
      v900 = 0;
    }
    -[GEOPDPlaceRequestParameters setMapsSearchHomeParameters:]((uint64_t)v1335, v900);

  }
  if ((_DWORD)a3)
    v963 = CFSTR("placeQuestionnaireLookupParameters");
  else
    v963 = CFSTR("place_questionnaire_lookup_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v963);
  v964 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v965 = [GEOPDPlaceQuestionnaireLookupParameters alloc];
    if (v965)
      v966 = (void *)-[GEOPDPlaceQuestionnaireLookupParameters _initWithDictionary:isJSON:](v965, v964, a3);
    else
      v966 = 0;
    -[GEOPDPlaceRequestParameters setPlaceQuestionnaireLookupParameters:]((uint64_t)v1335, v966);

  }
  if ((_DWORD)a3)
    v967 = CFSTR("publisherViewParameters");
  else
    v967 = CFSTR("publisher_view_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v967);
  v968 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v969 = [GEOPDPublisherViewParameters alloc];
    if (v969)
    {
      v970 = v968;
      v969 = -[GEOPDPublisherViewParameters init](v969, "init");
      if (v969)
      {
        if ((_DWORD)a3)
          v971 = CFSTR("publisherId");
        else
          v971 = CFSTR("publisher_id");
        objc_msgSend(v970, "objectForKeyedSubscript:", v971);
        v972 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v973 = [GEOPDMapsIdentifier alloc];
          if ((a3 & 1) != 0)
            v974 = -[GEOPDMapsIdentifier initWithJSON:](v973, "initWithJSON:", v972);
          else
            v974 = -[GEOPDMapsIdentifier initWithDictionary:](v973, "initWithDictionary:", v972);
          v975 = v974;
          -[GEOPDPublisherViewParameters setPublisherId:]((uint64_t)v969, v974);

        }
        if ((_DWORD)a3)
          v976 = CFSTR("numClientizedResults");
        else
          v976 = CFSTR("num_clientized_results");
        objc_msgSend(v970, "objectForKeyedSubscript:", v976);
        v977 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v978 = objc_msgSend(v977, "unsignedIntValue");
          *(_BYTE *)&v969->_flags |= 0x20u;
          *(_BYTE *)&v969->_flags |= 1u;
          v969->_numClientizedResults = v978;
        }

        if ((_DWORD)a3)
          v979 = CFSTR("resultFilter");
        else
          v979 = CFSTR("result_filter");
        objc_msgSend(v970, "objectForKeyedSubscript:", v979);
        v980 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v981 = [GEOPDPublisherViewResultFilter alloc];
          if (v981)
            v982 = (void *)-[GEOPDPublisherViewResultFilter _initWithDictionary:isJSON:](v981, v980, a3);
          else
            v982 = 0;
          -[GEOPDPublisherViewParameters setResultFilter:]((uint64_t)v969, v982);

        }
        if ((_DWORD)a3)
          v983 = CFSTR("viewportInfo");
        else
          v983 = CFSTR("viewport_info");
        objc_msgSend(v970, "objectForKeyedSubscript:", v983);
        v984 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v985 = [GEOPDViewportInfo alloc];
          if ((a3 & 1) != 0)
            v986 = -[GEOPDViewportInfo initWithJSON:](v985, "initWithJSON:", v984);
          else
            v986 = -[GEOPDViewportInfo initWithDictionary:](v985, "initWithDictionary:", v984);
          v987 = v986;
          -[GEOPDPublisherViewParameters setViewportInfo:]((uint64_t)v969, v986);

        }
      }

    }
    -[GEOPDPlaceRequestParameters setPublisherViewParameters:]((uint64_t)v1335, v969);

  }
  if ((_DWORD)a3)
    v988 = CFSTR("allCollectionsViewParameters");
  else
    v988 = CFSTR("all_collections_view_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v988);
  v989 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v990 = [GEOPDAllCollectionsViewParameters alloc];
    if (v990)
    {
      v991 = v989;
      v990 = -[GEOPDAllCollectionsViewParameters init](v990, "init");
      if (v990)
      {
        if ((_DWORD)a3)
          v992 = CFSTR("publisherSuggestionParameters");
        else
          v992 = CFSTR("publisher_suggestion_parameters");
        objc_msgSend(v991, "objectForKeyedSubscript:", v992);
        v993 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v994 = [GEOPDPublisherSuggestionParameters alloc];
          if (v994)
            v995 = (void *)-[GEOPDPublisherSuggestionParameters _initWithDictionary:isJSON:](v994, v993, a3);
          else
            v995 = 0;
          -[GEOPDAllCollectionsViewParameters setPublisherSuggestionParameters:]((uint64_t)v990, v995);

        }
        if ((_DWORD)a3)
          v996 = CFSTR("numClientizedResults");
        else
          v996 = CFSTR("num_clientized_results");
        objc_msgSend(v991, "objectForKeyedSubscript:", v996);
        v997 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v998 = objc_msgSend(v997, "unsignedIntValue");
          *(_BYTE *)&v990->_flags |= 0x20u;
          *(_BYTE *)&v990->_flags |= 1u;
          v990->_numClientizedResults = v998;
        }

        if ((_DWORD)a3)
          v999 = CFSTR("resultFilter");
        else
          v999 = CFSTR("result_filter");
        objc_msgSend(v991, "objectForKeyedSubscript:", v999);
        v1000 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1001 = [GEOPDAllCollectionsViewResultFilter alloc];
          if (v1001)
            v1002 = (void *)-[GEOPDAllCollectionsViewResultFilter _initWithDictionary:isJSON:](v1001, v1000, a3);
          else
            v1002 = 0;
          -[GEOPDAllCollectionsViewParameters setResultFilter:]((uint64_t)v990, v1002);

        }
        if ((_DWORD)a3)
          v1003 = CFSTR("viewportInfo");
        else
          v1003 = CFSTR("viewport_info");
        objc_msgSend(v991, "objectForKeyedSubscript:", v1003);
        v1004 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1005 = [GEOPDViewportInfo alloc];
          if ((a3 & 1) != 0)
            v1006 = -[GEOPDViewportInfo initWithJSON:](v1005, "initWithJSON:", v1004);
          else
            v1006 = -[GEOPDViewportInfo initWithDictionary:](v1005, "initWithDictionary:", v1004);
          v1007 = v1006;
          -[GEOPDAllCollectionsViewParameters setViewportInfo:]((uint64_t)v990, v1006);

        }
      }

    }
    -[GEOPDPlaceRequestParameters setAllCollectionsViewParameters:]((uint64_t)v1335, v990);

  }
  if ((_DWORD)a3)
    v1008 = CFSTR("airportEntityPlaceLookupParameters");
  else
    v1008 = CFSTR("airport_entity_place_lookup_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v1008);
  v1009 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v1010 = [GEOPDAirportEntityPlaceLookupParameters alloc];
    if (v1010)
    {
      v1011 = v1009;
      v1010 = -[GEOPDAirportEntityPlaceLookupParameters init](v1010, "init");
      if (v1010)
      {
        if ((_DWORD)a3)
          v1012 = CFSTR("airportCode");
        else
          v1012 = CFSTR("airport_code");
        objc_msgSend(v1011, "objectForKeyedSubscript:", v1012);
        v1013 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1014 = (void *)objc_msgSend(v1013, "copy");
          -[GEOPDAirportEntityPlaceLookupParameters setAirportCode:]((uint64_t)v1010, v1014);

        }
        if ((_DWORD)a3)
          v1015 = CFSTR("terminalCode");
        else
          v1015 = CFSTR("terminal_code");
        objc_msgSend(v1011, "objectForKeyedSubscript:", v1015);
        v1016 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1017 = (void *)objc_msgSend(v1016, "copy");
          -[GEOPDAirportEntityPlaceLookupParameters setTerminalCode:]((uint64_t)v1010, v1017);

        }
        if ((_DWORD)a3)
          v1018 = CFSTR("gateCode");
        else
          v1018 = CFSTR("gate_code");
        objc_msgSend(v1011, "objectForKeyedSubscript:", v1018);
        v1019 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1020 = (void *)objc_msgSend(v1019, "copy");
          -[GEOPDAirportEntityPlaceLookupParameters setGateCode:]((uint64_t)v1010, v1020);

        }
      }

    }
    -[GEOPDPlaceRequestParameters setAirportEntityPlaceLookupParameters:]((uint64_t)v1335, v1010);

  }
  if ((_DWORD)a3)
    v1021 = CFSTR("territoryLookupParameters");
  else
    v1021 = CFSTR("territory_lookup_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v1021);
  v1022 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v1023 = [GEOPDTerritoryLookupParameters alloc];
    if (v1023)
    {
      v1024 = v1022;
      v1023 = -[GEOPDTerritoryLookupParameters init](v1023, "init");
      if (v1023)
      {
        objc_msgSend(v1024, "objectForKeyedSubscript:", CFSTR("location"));
        v1025 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1401 = v891;
          v1448 = 0u;
          v1447 = 0u;
          v1446 = 0u;
          v1445 = 0u;
          v1026 = v1025;
          v1027 = objc_msgSend(v1026, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
          if (v1027)
          {
            v1028 = v1027;
            v1029 = *(_QWORD *)v1446;
            do
            {
              for (i16 = 0; i16 != v1028; ++i16)
              {
                if (*(_QWORD *)v1446 != v1029)
                  objc_enumerationMutation(v1026);
                v1031 = *(_QWORD *)(*((_QWORD *)&v1445 + 1) + 8 * i16);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v1032 = [GEOLatLngE7 alloc];
                  if ((v1379 & 1) != 0)
                    v1033 = -[GEOLatLngE7 initWithJSON:](v1032, "initWithJSON:", v1031);
                  else
                    v1033 = -[GEOLatLngE7 initWithDictionary:](v1032, "initWithDictionary:", v1031);
                  v1034 = v1033;
                  -[GEOPDTerritoryLookupParameters addLocation:]((uint64_t)v1023, v1033);

                }
              }
              v1028 = objc_msgSend(v1026, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
            }
            while (v1028);
          }

          a3 = v1379;
          v891 = v1401;
        }

      }
    }
    -[GEOPDPlaceRequestParameters setTerritoryLookupParameters:]((uint64_t)v1335, v1023);

  }
  if ((_DWORD)a3)
    v1035 = CFSTR("transitNearbyScheduleLookupParameters");
  else
    v1035 = CFSTR("transit_nearby_schedule_lookup_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v1035);
  v1036 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v1037 = [GEOPDTransitNearbyScheduleLookupParameters alloc];
    if (v1037)
    {
      v1038 = v1036;
      v1037 = -[GEOPDTransitNearbyScheduleLookupParameters init](v1037, "init");
      if (v1037)
      {
        if ((_DWORD)a3)
          v1039 = CFSTR("transitNearbyScheduleLookupOrigin");
        else
          v1039 = CFSTR("transit_nearby_schedule_lookup_origin");
        objc_msgSend(v1038, "objectForKeyedSubscript:", v1039);
        v1040 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1362 = v1040;
          v1375 = v1038;
          objg = v1036;
          v1402 = v891;
          v1448 = 0u;
          v1447 = 0u;
          v1446 = 0u;
          v1445 = 0u;
          v1041 = v1040;
          v1042 = objc_msgSend(v1041, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
          if (v1042)
          {
            v1043 = v1042;
            v1044 = *(_QWORD *)v1446;
            if ((_DWORD)a3)
              v1045 = CFSTR("waypointTyped");
            else
              v1045 = CFSTR("waypoint_typed");
            do
            {
              v1046 = 0;
              do
              {
                if (*(_QWORD *)v1446 != v1044)
                  objc_enumerationMutation(v1041);
                v1047 = *(void **)(*((_QWORD *)&v1445 + 1) + 8 * v1046);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v1048 = [GEOPDTransitNearbyScheduleLookupOrigin alloc];
                  if (v1048)
                  {
                    v1049 = v1048;
                    v1050 = v1047;
                    v1051 = -[GEOPDTransitNearbyScheduleLookupOrigin init](v1049, "init");
                    if (v1051)
                    {
                      objc_msgSend(v1050, "objectForKeyedSubscript:", v1045);
                      v1052 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v1053 = [GEOWaypointTyped alloc];
                        if ((v1379 & 1) != 0)
                          v1054 = -[GEOWaypointTyped initWithJSON:](v1053, "initWithJSON:", v1052);
                        else
                          v1054 = -[GEOWaypointTyped initWithDictionary:](v1053, "initWithDictionary:", v1052);
                        v1055 = v1054;
                        -[GEOPDTransitNearbyScheduleLookupOrigin setWaypointTyped:]((uint64_t)v1051, v1054);

                      }
                    }

                  }
                  else
                  {
                    v1051 = 0;
                  }
                  -[GEOPDTransitNearbyScheduleLookupParameters addTransitNearbyScheduleLookupOrigin:]((uint64_t)v1037, v1051);

                  a3 = v1379;
                }
                ++v1046;
              }
              while (v1043 != v1046);
              v1056 = objc_msgSend(v1041, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
              v1043 = v1056;
            }
            while (v1056);
          }

          v1036 = objg;
          v891 = v1402;
          v1040 = v1362;
          v1038 = v1375;
        }

        if ((_DWORD)a3)
          v1057 = CFSTR("userLocation");
        else
          v1057 = CFSTR("user_location");
        objc_msgSend(v1038, "objectForKeyedSubscript:", v1057);
        v1058 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1059 = [GEOWaypointTyped alloc];
          if ((a3 & 1) != 0)
            v1060 = -[GEOWaypointTyped initWithJSON:](v1059, "initWithJSON:", v1058);
          else
            v1060 = -[GEOWaypointTyped initWithDictionary:](v1059, "initWithDictionary:", v1058);
          v1061 = v1060;
          -[GEOPDTransitNearbyScheduleLookupParameters setUserLocation:]((uint64_t)v1037, v1060);

        }
      }

    }
    -[GEOPDPlaceRequestParameters setTransitNearbyScheduleLookupParameters:]((uint64_t)v1335, v1037);

  }
  if ((_DWORD)a3)
    v1062 = CFSTR("mapsHomeParameters");
  else
    v1062 = CFSTR("maps_home_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v1062);
  v1063 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v1064 = [GEOPDMapsHomeParameters alloc];
    if (v1064)
    {
      v1065 = v1063;
      v1064 = -[GEOPDMapsHomeParameters init](v1064, "init");
      if (v1064)
      {
        objc_msgSend(v1065, "objectForKeyedSubscript:", v891);
        v1066 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1067 = [GEOPDCollectionSuggestionParameters alloc];
          if (v1067)
            v1068 = (void *)-[GEOPDCollectionSuggestionParameters _initWithDictionary:isJSON:](v1067, v1066, a3);
          else
            v1068 = 0;
          -[GEOPDMapsHomeParameters setCollectionSuggestionParameters:]((uint64_t)v1064, v1068);

        }
        if ((_DWORD)a3)
          v1069 = CFSTR("shouldPopulateExploreGuidesEntry");
        else
          v1069 = CFSTR("should_populate_explore_guides_entry");
        objc_msgSend(v1065, "objectForKeyedSubscript:", v1069);
        v1070 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1071 = objc_msgSend(v1070, "BOOLValue");
          *(_BYTE *)&v1064->_flags |= 1u;
          v1064->_shouldPopulateExploreGuidesEntry = v1071;
        }

      }
    }
    -[GEOPDPlaceRequestParameters setMapsHomeParameters:]((uint64_t)v1335, v1064);

  }
  if ((_DWORD)a3)
    v1072 = CFSTR("allGuidesLocationsViewParameters");
  else
    v1072 = CFSTR("all_guides_locations_view_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v1072);
  v1073 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v1074 = [GEOPDAllGuidesLocationsViewParameters alloc];
    if (v1074)
    {
      v1075 = v1073;
      v1074 = -[GEOPDAllGuidesLocationsViewParameters init](v1074, "init");
      if (v1074)
      {
        if ((_DWORD)a3)
          v1076 = CFSTR("viewportInfo");
        else
          v1076 = CFSTR("viewport_info");
        objc_msgSend(v1075, "objectForKeyedSubscript:", v1076);
        v1077 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1078 = [GEOPDViewportInfo alloc];
          if ((a3 & 1) != 0)
            v1079 = -[GEOPDViewportInfo initWithJSON:](v1078, "initWithJSON:", v1077);
          else
            v1079 = -[GEOPDViewportInfo initWithDictionary:](v1078, "initWithDictionary:", v1077);
          v1080 = v1079;
          -[GEOPDAllGuidesLocationsViewParameters setViewportInfo:]((uint64_t)v1074, v1079);

        }
        if ((_DWORD)a3)
          v1081 = CFSTR("numClientizedResults");
        else
          v1081 = CFSTR("num_clientized_results");
        objc_msgSend(v1075, "objectForKeyedSubscript:", v1081);
        v1082 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1083 = objc_msgSend(v1082, "unsignedIntValue");
          *(_BYTE *)&v1074->_flags |= 1u;
          v1074->_numClientizedResults = v1083;
        }

      }
    }
    -[GEOPDPlaceRequestParameters setAllGuidesLocationsViewParameters:]((uint64_t)v1335, v1074);

  }
  if ((_DWORD)a3)
    v1084 = CFSTR("guidesHomeParameters");
  else
    v1084 = CFSTR("guides_home_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v1084);
  v1085 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v1086 = [GEOPDGuidesHomeParameters alloc];
    if (v1086)
    {
      v1087 = v1086;
      v1088 = v1085;
      v1089 = -[GEOPDGuidesHomeParameters init](v1087, "init");
      if (v1089)
      {
        if ((_DWORD)a3)
          v1090 = CFSTR("supportedFixedSectionType");
        else
          v1090 = CFSTR("supported_fixed_section_type");
        objc_msgSend(v1088, "objectForKeyedSubscript:", v1090);
        v1091 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        objh = v1088;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1443 = 0u;
          v1444 = 0u;
          v1441 = 0u;
          v1442 = 0u;
          v1092 = v1091;
          v1093 = objc_msgSend(v1092, "countByEnumeratingWithState:objects:count:", &v1441, v1449, 16);
          if (!v1093)
            goto LABEL_2220;
          v1094 = v1093;
          v1095 = *(_QWORD *)v1442;
          while (1)
          {
            for (i17 = 0; i17 != v1094; ++i17)
            {
              if (*(_QWORD *)v1442 != v1095)
                objc_enumerationMutation(v1092);
              v1097 = *(void **)(*((_QWORD *)&v1441 + 1) + 8 * i17);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v1098 = v1097;
                if ((objc_msgSend(v1098, "isEqualToString:", CFSTR("GUIDES_HOME_FIXED_SECTION_TYPE_UNKNOWN")) & 1) == 0
                  && (objc_msgSend(v1098, "isEqualToString:", CFSTR("GUIDES_HOME_FIXED_SECTION_TYPE_FEATURED_GUIDES")) & 1) == 0
                  && (objc_msgSend(v1098, "isEqualToString:", CFSTR("GUIDES_HOME_FIXED_SECTION_TYPE_FILTERS")) & 1) == 0)
                {
                  objc_msgSend(v1098, "isEqualToString:", CFSTR("GUIDES_HOME_FIXED_SECTION_TYPE_FILTERED_GUIDES"));
                }

              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  continue;
                objc_msgSend(v1097, "intValue");
              }
              -[GEOPDGuidesHomeParameters addSupportedFixedSectionType:]((uint64_t)v1089);
            }
            v1094 = objc_msgSend(v1092, "countByEnumeratingWithState:objects:count:", &v1441, v1449, 16);
            if (!v1094)
            {
LABEL_2220:

              a3 = v1379;
              v1088 = objh;
              break;
            }
          }
        }

        if ((_DWORD)a3)
          v1099 = CFSTR("supportedRepeatableSectionType");
        else
          v1099 = CFSTR("supported_repeatable_section_type");
        objc_msgSend(v1088, "objectForKeyedSubscript:", v1099);
        v1100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1439 = 0u;
          v1440 = 0u;
          v1437 = 0u;
          v1438 = 0u;
          v1101 = v1100;
          v1102 = objc_msgSend(v1101, "countByEnumeratingWithState:objects:count:", &v1437, &v1445, 16);
          if (!v1102)
            goto LABEL_2243;
          v1103 = v1102;
          v1104 = *(_QWORD *)v1438;
          while (1)
          {
            for (i18 = 0; i18 != v1103; ++i18)
            {
              if (*(_QWORD *)v1438 != v1104)
                objc_enumerationMutation(v1101);
              v1106 = *(void **)(*((_QWORD *)&v1437 + 1) + 8 * i18);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v1107 = v1106;
                if ((objc_msgSend(v1107, "isEqualToString:", CFSTR("GUIDES_HOME_REPEATABLE_SECTION_TYPE_UNKNOWN")) & 1) == 0
                  && (objc_msgSend(v1107, "isEqualToString:", CFSTR("GUIDES_HOME_REPEATABLE_SECTION_TYPE_GUIDES_HORIZONTAL_CAROUSEL")) & 1) == 0&& (objc_msgSend(v1107, "isEqualToString:", CFSTR("GUIDES_HOME_REPEATABLE_SECTION_TYPE_PUBLISHER")) & 1) == 0&& (objc_msgSend(v1107, "isEqualToString:", CFSTR("GUIDES_HOME_REPEATABLE_SECTION_TYPE_GUIDES_VERTICAL_CAROUSEL")) & 1) == 0)
                {
                  objc_msgSend(v1107, "isEqualToString:", CFSTR("GUIDES_HOME_REPEATABLE_SECTION_TYPE_LOCATIONS"));
                }

              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  continue;
                objc_msgSend(v1106, "intValue");
              }
              -[GEOPDGuidesHomeParameters addSupportedRepeatableSectionType:]((uint64_t)v1089);
            }
            v1103 = objc_msgSend(v1101, "countByEnumeratingWithState:objects:count:", &v1437, &v1445, 16);
            if (!v1103)
            {
LABEL_2243:

              a3 = v1379;
              v1088 = objh;
              break;
            }
          }
        }

        if ((_DWORD)a3)
          v1108 = CFSTR("viewportInfo");
        else
          v1108 = CFSTR("viewport_info");
        objc_msgSend(v1088, "objectForKeyedSubscript:", v1108);
        v1109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1110 = [GEOPDViewportInfo alloc];
          if ((a3 & 1) != 0)
            v1111 = -[GEOPDViewportInfo initWithJSON:](v1110, "initWithJSON:", v1109);
          else
            v1111 = -[GEOPDViewportInfo initWithDictionary:](v1110, "initWithDictionary:", v1109);
          v1112 = v1111;
          -[GEOPDGuidesHomeParameters setViewportInfo:]((uint64_t)v1089, v1111);

        }
        if ((_DWORD)a3)
          v1113 = CFSTR("guidesLocationEntry");
        else
          v1113 = CFSTR("guides_location_entry");
        objc_msgSend(v1088, "objectForKeyedSubscript:", v1113);
        v1114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1115 = [GEOPDGuidesLocationEntry alloc];
          if (v1115)
            v1116 = (void *)-[GEOPDGuidesLocationEntry _initWithDictionary:isJSON:]((uint64_t)v1115, v1114, a3);
          else
            v1116 = 0;
          -[GEOPDGuidesHomeParameters setGuidesLocationEntry:]((uint64_t)v1089, v1116);

        }
        if ((_DWORD)a3)
          v1117 = CFSTR("resultFilter");
        else
          v1117 = CFSTR("result_filter");
        objc_msgSend(v1088, "objectForKeyedSubscript:", v1117);
        v1118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1119 = [GEOPDGuidesHomeResultFilter alloc];
          if (v1119)
            v1120 = (void *)-[GEOPDGuidesHomeResultFilter _initWithDictionary:isJSON:](v1119, v1118, a3);
          else
            v1120 = 0;
          -[GEOPDGuidesHomeParameters setResultFilter:]((uint64_t)v1089, v1120);

        }
        if ((_DWORD)a3)
          v1121 = CFSTR("refinementGuidesHome");
        else
          v1121 = CFSTR("refinement_guides_home");
        objc_msgSend(v1088, "objectForKeyedSubscript:", v1121);
        v1122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1123 = [GEOPDResultRefinementGuidesHome alloc];
          if (v1123)
            v1124 = (void *)-[GEOPDResultRefinementGuidesHome _initWithDictionary:isJSON:]((uint64_t)v1123, v1122, a3);
          else
            v1124 = 0;
          -[GEOPDGuidesHomeParameters setRefinementGuidesHome:]((uint64_t)v1089, v1124);

        }
      }

    }
    else
    {
      v1089 = 0;
    }
    -[GEOPDPlaceRequestParameters setGuidesHomeParameters:]((uint64_t)v1335, v1089);

  }
  if ((_DWORD)a3)
    v1125 = CFSTR("extendedGeoLookupParameters");
  else
    v1125 = CFSTR("extended_geo_lookup_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v1125);
  v1126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v1127 = [GEOPDExtendedGeoLookupParameters alloc];
    if (v1127)
    {
      v1128 = v1126;
      v1127 = -[GEOPDExtendedGeoLookupParameters init](v1127, "init");
      if (v1127)
      {
        if ((_DWORD)a3)
          v1129 = CFSTR("preserveFields");
        else
          v1129 = CFSTR("preserve_fields");
        objc_msgSend(v1128, "objectForKeyedSubscript:", v1129);
        v1130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1131 = [GEOAddress alloc];
          if ((a3 & 1) != 0)
            v1132 = -[GEOAddress initWithJSON:](v1131, "initWithJSON:", v1130);
          else
            v1132 = -[GEOAddress initWithDictionary:](v1131, "initWithDictionary:", v1130);
          v1133 = v1132;
          -[GEOPDExtendedGeoLookupParameters setPreserveFields:]((uint64_t)v1127, v1132);

        }
        if ((_DWORD)a3)
          v1134 = CFSTR("primaryFeatureGeoId");
        else
          v1134 = CFSTR("primary_feature_geo_id");
        objc_msgSend(v1128, "objectForKeyedSubscript:", v1134);
        v1135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1136 = objc_msgSend(v1135, "unsignedLongLongValue");
          *(_WORD *)&v1127->_flags |= 0x400u;
          *(_WORD *)&v1127->_flags |= 1u;
          v1127->_primaryFeatureGeoId = v1136;
        }

        v1137 = v1379;
        if (v1379)
          v1138 = CFSTR("primaryFeatureLocation");
        else
          v1138 = CFSTR("primary_feature_location");
        objc_msgSend(v1128, "objectForKeyedSubscript:", v1138);
        v1139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1140 = [GEOLatLng alloc];
          if ((v1379 & 1) != 0)
            v1141 = -[GEOLatLng initWithJSON:](v1140, "initWithJSON:", v1139);
          else
            v1141 = -[GEOLatLng initWithDictionary:](v1140, "initWithDictionary:", v1139);
          v1142 = v1141;
          -[GEOPDExtendedGeoLookupParameters setPrimaryFeatureLocation:]((uint64_t)v1127, v1141);

          v1137 = v1379;
        }

        if (v1137)
          v1143 = CFSTR("intersectingFeatureGeoId");
        else
          v1143 = CFSTR("intersecting_feature_geo_id");
        objc_msgSend(v1128, "objectForKeyedSubscript:", v1143);
        v1144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1448 = 0u;
          v1447 = 0u;
          v1446 = 0u;
          v1445 = 0u;
          v1145 = v1144;
          v1146 = objc_msgSend(v1145, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
          if (v1146)
          {
            v1147 = v1146;
            v1148 = *(_QWORD *)v1446;
            do
            {
              for (i19 = 0; i19 != v1147; ++i19)
              {
                if (*(_QWORD *)v1446 != v1148)
                  objc_enumerationMutation(v1145);
                v1150 = *(void **)(*((_QWORD *)&v1445 + 1) + 8 * i19);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v1150, "unsignedLongLongValue");
                  -[GEOPDExtendedGeoLookupParameters addIntersectingFeatureGeoId:]((uint64_t)v1127);
                }
              }
              v1147 = objc_msgSend(v1145, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
            }
            while (v1147);
          }

        }
        if (v1379)
          v1151 = CFSTR("isLatlngRequest");
        else
          v1151 = CFSTR("is_latlng_request");
        objc_msgSend(v1128, "objectForKeyedSubscript:", v1151);
        v1152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1153 = objc_msgSend(v1152, "BOOLValue");
          *(_WORD *)&v1127->_flags |= 0x400u;
          *(_WORD *)&v1127->_flags |= 8u;
          v1127->_isLatlngRequest = v1153;
        }

        if (v1379)
          v1154 = CFSTR("streetSubPostalGeoId");
        else
          v1154 = CFSTR("street_sub_postal_geo_id");
        objc_msgSend(v1128, "objectForKeyedSubscript:", v1154);
        v1155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1156 = objc_msgSend(v1155, "unsignedLongLongValue");
          *(_WORD *)&v1127->_flags |= 0x400u;
          *(_WORD *)&v1127->_flags |= 2u;
          v1127->_streetSubPostalGeoId = v1156;
        }

        if (v1379)
          v1157 = CFSTR("dataSourceId");
        else
          v1157 = CFSTR("data_source_id");
        objc_msgSend(v1128, "objectForKeyedSubscript:", v1157);
        v1158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1159 = (void *)objc_msgSend(v1158, "copy");
          -[GEOPDExtendedGeoLookupParameters setDataSourceId:]((uint64_t)v1127, v1159);

        }
        if (v1379)
          v1160 = CFSTR("dataSourceIdRequired");
        else
          v1160 = CFSTR("data_source_id_required");
        objc_msgSend(v1128, "objectForKeyedSubscript:", v1160);
        v1161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1162 = objc_msgSend(v1161, "BOOLValue");
          *(_WORD *)&v1127->_flags |= 0x400u;
          *(_WORD *)&v1127->_flags |= 4u;
          v1127->_dataSourceIdRequired = v1162;
        }

        LODWORD(a3) = v1379;
        if (v1379)
          v1163 = CFSTR("interpolationParameter");
        else
          v1163 = CFSTR("interpolation_parameter");
        objc_msgSend(v1128, "objectForKeyedSubscript:", v1163);
        v1164 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1165 = [GEOInterpolationParameters alloc];
          if ((v1379 & 1) != 0)
            v1166 = -[GEOInterpolationParameters initWithJSON:](v1165, "initWithJSON:", v1164);
          else
            v1166 = -[GEOInterpolationParameters initWithDictionary:](v1165, "initWithDictionary:", v1164);
          v1167 = v1166;
          -[GEOPDExtendedGeoLookupParameters setInterpolationParameter:]((uint64_t)v1127, v1166);

        }
      }

    }
    -[GEOPDPlaceRequestParameters setExtendedGeoLookupParameters:]((uint64_t)v1335, v1127);

  }
  if ((_DWORD)a3)
    v1168 = CFSTR("queryUnderstandingParameters");
  else
    v1168 = CFSTR("query_understanding_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v1168);
  v1169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_2476;
  v1170 = [GEOPDQueryUnderstandingParameters alloc];
  if (!v1170)
  {
    v1173 = 0;
    goto LABEL_2475;
  }
  v1171 = v1170;
  v1172 = v1169;
  v1173 = -[GEOPDQueryUnderstandingParameters init](v1171, "init");
  if (v1173)
  {
    objc_msgSend(v1172, "objectForKeyedSubscript:", CFSTR("type"));
    v1174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v1175 = v1174;
      if ((objc_msgSend(v1175, "isEqualToString:", CFSTR("QUERY_UNDERSTANDING_TYPE_UNKNOWN")) & 1) != 0)
      {
        v1176 = 0;
      }
      else if ((objc_msgSend(v1175, "isEqualToString:", CFSTR("QUERY_UNDERSTANDING_TYPE_AUTOCOMPLETE")) & 1) != 0)
      {
        v1176 = 1;
      }
      else if ((objc_msgSend(v1175, "isEqualToString:", CFSTR("QUERY_UNDERSTANDING_TYPE_CORE_SEARCH")) & 1) != 0)
      {
        v1176 = 2;
      }
      else if ((objc_msgSend(v1175, "isEqualToString:", CFSTR("QUERY_UNDERSTANDING_TYPE_TAXONOMY_SEARCH")) & 1) != 0)
      {
        v1176 = 3;
      }
      else if (objc_msgSend(v1175, "isEqualToString:", CFSTR("QUERY_UNDERSTANDING_TYPE_TAXONOMY_LOOKUP")))
      {
        v1176 = 4;
      }
      else
      {
        v1176 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_2370;
      v1176 = objc_msgSend(v1174, "intValue");
    }
    *(_BYTE *)(v1173 + 76) |= 0x80u;
    *(_BYTE *)(v1173 + 76) |= 1u;
    *(_DWORD *)(v1173 + 68) = v1176;
LABEL_2370:

    if ((_DWORD)a3)
      v1177 = CFSTR("searchString");
    else
      v1177 = CFSTR("search_string");
    objc_msgSend(v1172, "objectForKeyedSubscript:", v1177);
    v1178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v1179 = (void *)objc_msgSend(v1178, "copy");
      -[GEOPDQueryUnderstandingParameters setSearchString:](v1173, v1179);

    }
    if ((_DWORD)a3)
      v1180 = CFSTR("viewportInfo");
    else
      v1180 = CFSTR("viewport_info");
    objc_msgSend(v1172, "objectForKeyedSubscript:", v1180);
    v1181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v1182 = [GEOPDViewportInfo alloc];
      if ((a3 & 1) != 0)
        v1183 = -[GEOPDViewportInfo initWithJSON:](v1182, "initWithJSON:", v1181);
      else
        v1183 = -[GEOPDViewportInfo initWithDictionary:](v1182, "initWithDictionary:", v1181);
      v1184 = v1183;
      -[GEOPDQueryUnderstandingParameters setViewportInfo:](v1173, v1183);

    }
    objc_msgSend(v1172, "objectForKeyedSubscript:", CFSTR("workflow"));
    v1185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v1403 = v1172;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v1186 = v1185;
      if ((objc_msgSend(v1186, "isEqualToString:", CFSTR("QUERY_PROCESSING_WORKFLOW_TYPE_UNKNOWN")) & 1) != 0)
      {
        v1187 = 0;
      }
      else if ((objc_msgSend(v1186, "isEqualToString:", CFSTR("QUERY_PROCESSING_WORKFLOW_TYPE_NORMALIZE")) & 1) != 0)
      {
        v1187 = 1;
      }
      else if ((objc_msgSend(v1186, "isEqualToString:", CFSTR("QUERY_PROCESSING_WORKFLOW_TYPE_REWRITE")) & 1) != 0)
      {
        v1187 = 2;
      }
      else if ((objc_msgSend(v1186, "isEqualToString:", CFSTR("QUERY_PROCESSING_WORKFLOW_TYPE_ENRICHMENTS")) & 1) != 0)
      {
        v1187 = 3;
      }
      else if (objc_msgSend(v1186, "isEqualToString:", CFSTR("QUERY_PROCESSING_WORKFLOW_TYPE_FULL_PROCESSING")))
      {
        v1187 = 4;
      }
      else
      {
        v1187 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_2399;
      v1187 = objc_msgSend(v1185, "intValue");
    }
    *(_BYTE *)(v1173 + 76) |= 0x80u;
    *(_BYTE *)(v1173 + 76) |= 2u;
    *(_DWORD *)(v1173 + 72) = v1187;
    v1172 = v1403;
LABEL_2399:

    if ((_DWORD)a3)
      v1188 = CFSTR("taxonomySearchParameters");
    else
      v1188 = CFSTR("taxonomy_search_parameters");
    objc_msgSend(v1172, "objectForKeyedSubscript:", v1188);
    v1189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_2439;
    v1190 = [GEOPDQueryUnderstandingTaxonomySearchParameters alloc];
    if (!v1190)
    {
      v1193 = 0;
      goto LABEL_2438;
    }
    v1191 = v1190;
    v1192 = v1189;
    v1193 = -[GEOPDQueryUnderstandingTaxonomySearchParameters init](v1191, "init");
    if (!v1193)
    {
LABEL_2437:

LABEL_2438:
      -[GEOPDQueryUnderstandingParameters setTaxonomySearchParameters:](v1173, (void *)v1193);

      v1172 = v1403;
LABEL_2439:

      if ((_DWORD)a3)
        v1208 = CFSTR("taxonomyLookupParameters");
      else
        v1208 = CFSTR("taxonomy_lookup_parameters");
      objc_msgSend(v1172, "objectForKeyedSubscript:", v1208);
      v1209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v1210 = [GEOPDQueryUnderstandingTaxonomyLookupParameters alloc];
        if (v1210)
        {
          v1211 = v1209;
          v1210 = -[GEOPDQueryUnderstandingTaxonomyLookupParameters init](v1210, "init");
          if (v1210)
          {
            v1377 = v1169;
            objc_msgSend(v1211, "objectForKeyedSubscript:", CFSTR("identifier"));
            v1212 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            objj = v1211;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v1443 = 0u;
              v1444 = 0u;
              v1441 = 0u;
              v1442 = 0u;
              v1213 = v1212;
              v1214 = objc_msgSend(v1213, "countByEnumeratingWithState:objects:count:", &v1441, v1449, 16);
              if (v1214)
              {
                v1215 = v1214;
                v1216 = *(_QWORD *)v1442;
                do
                {
                  for (i20 = 0; i20 != v1215; ++i20)
                  {
                    if (*(_QWORD *)v1442 != v1216)
                      objc_enumerationMutation(v1213);
                    v1218 = *(void **)(*((_QWORD *)&v1441 + 1) + 8 * i20);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v1219 = (void *)objc_msgSend(v1218, "copy");
                      -[GEOPDQueryUnderstandingTaxonomyLookupParameters addIdentifier:]((uint64_t)v1210, v1219);

                    }
                  }
                  v1215 = objc_msgSend(v1213, "countByEnumeratingWithState:objects:count:", &v1441, v1449, 16);
                }
                while (v1215);
              }

              LODWORD(a3) = v1379;
              v1211 = objj;
              v1172 = v1403;
            }

            if ((_DWORD)a3)
              v1220 = CFSTR("categoryBranch");
            else
              v1220 = CFSTR("category_branch");
            objc_msgSend(v1211, "objectForKeyedSubscript:", v1220);
            v1221 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v1169 = v1377;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v1439 = 0u;
              v1440 = 0u;
              v1437 = 0u;
              v1438 = 0u;
              v1363 = v1221;
              v1222 = v1221;
              v1223 = objc_msgSend(v1222, "countByEnumeratingWithState:objects:count:", &v1437, &v1445, 16);
              if (v1223)
              {
                v1224 = v1223;
                v1225 = *(_QWORD *)v1438;
                do
                {
                  for (i21 = 0; i21 != v1224; ++i21)
                  {
                    if (*(_QWORD *)v1438 != v1225)
                      objc_enumerationMutation(v1222);
                    v1227 = *(void **)(*((_QWORD *)&v1437 + 1) + 8 * i21);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v1228 = (void *)objc_msgSend(v1227, "copy");
                      -[GEOPDQueryUnderstandingTaxonomyLookupParameters addCategoryBranch:]((uint64_t)v1210, v1228);

                    }
                  }
                  v1224 = objc_msgSend(v1222, "countByEnumeratingWithState:objects:count:", &v1437, &v1445, 16);
                }
                while (v1224);
              }

              LODWORD(a3) = v1379;
              v1211 = objj;
              v1172 = v1403;
              v1221 = v1363;
            }

          }
        }
        -[GEOPDQueryUnderstandingParameters setTaxonomyLookupParameters:](v1173, v1210);

      }
      goto LABEL_2474;
    }
    if ((_DWORD)a3)
      v1194 = CFSTR("taxonomyType");
    else
      v1194 = CFSTR("taxonomy_type");
    objc_msgSend(v1192, "objectForKeyedSubscript:", v1194);
    v1195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      a3 = v1195;
      if ((objc_msgSend((id)a3, "isEqualToString:", CFSTR("QUERY_UNDERSTANDING_TAXONOMY_TYPE_UNKNOWN")) & 1) != 0)
      {
        v1196 = 0;
      }
      else if ((objc_msgSend((id)a3, "isEqualToString:", CFSTR("QUERY_UNDERSTANDING_TAXONOMY_TYPE_CATEGORY")) & 1) != 0)
      {
        v1196 = 1;
      }
      else if (objc_msgSend((id)a3, "isEqualToString:", CFSTR("QUERY_UNDERSTANDING_TAXONOMY_TYPE_BRAND")))
      {
        v1196 = 2;
      }
      else
      {
        v1196 = 0;
      }

      LODWORD(a3) = v1379;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_2420:

        objc_msgSend(v1192, "objectForKeyedSubscript:", v1177);
        v1197 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1198 = (void *)objc_msgSend(v1197, "copy");
          -[GEOPDQueryUnderstandingTaxonomySearchParameters setSearchString:](v1193, v1198);

        }
        if ((_DWORD)a3)
          v1199 = CFSTR("categoryBranch");
        else
          v1199 = CFSTR("category_branch");
        objc_msgSend(v1192, "objectForKeyedSubscript:", v1199);
        v1200 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          obji = v1192;
          v1448 = 0u;
          v1447 = 0u;
          v1446 = 0u;
          v1445 = 0u;
          v1376 = v1200;
          v1201 = v1200;
          v1202 = objc_msgSend(v1201, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
          if (v1202)
          {
            v1203 = v1202;
            v1204 = *(_QWORD *)v1446;
            do
            {
              for (i22 = 0; i22 != v1203; ++i22)
              {
                if (*(_QWORD *)v1446 != v1204)
                  objc_enumerationMutation(v1201);
                v1206 = *(void **)(*((_QWORD *)&v1445 + 1) + 8 * i22);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v1207 = (void *)objc_msgSend(v1206, "copy");
                  -[GEOPDQueryUnderstandingTaxonomySearchParameters addCategoryBranch:](v1193, v1207);

                }
              }
              v1203 = objc_msgSend(v1201, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
            }
            while (v1203);
          }

          LODWORD(a3) = v1379;
          v1192 = obji;
          v1200 = v1376;
        }

        goto LABEL_2437;
      }
      v1196 = objc_msgSend(v1195, "intValue");
    }
    *(_BYTE *)(v1193 + 56) |= 0x10u;
    *(_BYTE *)(v1193 + 56) |= 1u;
    *(_DWORD *)(v1193 + 52) = v1196;
    goto LABEL_2420;
  }
LABEL_2474:

LABEL_2475:
  -[GEOPDPlaceRequestParameters setQueryUnderstandingParameters:]((uint64_t)v1335, (void *)v1173);

LABEL_2476:
  if ((_DWORD)a3)
    v1229 = CFSTR("poiAtAddressLookupParameters");
  else
    v1229 = CFSTR("poi_at_address_lookup_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v1229);
  v1230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v1231 = [GEOPDPoiAtAddressLookupParameters alloc];
    if (v1231)
    {
      v1232 = v1230;
      v1231 = -[GEOPDPoiAtAddressLookupParameters init](v1231, "init");
      if (v1231)
      {
        objc_msgSend(v1232, "objectForKeyedSubscript:", CFSTR("component"));
        v1233 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1448 = 0u;
          v1447 = 0u;
          v1446 = 0u;
          v1445 = 0u;
          v1234 = v1233;
          v1235 = objc_msgSend(v1234, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
          if (v1235)
          {
            v1236 = v1235;
            v1237 = *(_QWORD *)v1446;
            do
            {
              v1238 = 0;
              do
              {
                if (*(_QWORD *)v1446 != v1237)
                  objc_enumerationMutation(v1234);
                v1239 = *(void **)(*((_QWORD *)&v1445 + 1) + 8 * v1238);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v1240 = [GEOPDComponent alloc];
                  if (v1240)
                    v1241 = -[GEOPDComponent _initWithDictionary:isJSON:]((char *)v1240, v1239, v1379);
                  else
                    v1241 = 0;
                  -[GEOPDPoiAtAddressLookupParameters addComponent:]((uint64_t)v1231, v1241);

                }
                ++v1238;
              }
              while (v1236 != v1238);
              v1242 = objc_msgSend(v1234, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
              v1236 = v1242;
            }
            while (v1242);
          }

          LODWORD(a3) = v1379;
        }

      }
    }
    -[GEOPDPlaceRequestParameters setPoiAtAddressLookupParameters:]((uint64_t)v1335, v1231);

  }
  if ((_DWORD)a3)
    v1243 = CFSTR("transitNearbyPaymentMethodLookupParameters");
  else
    v1243 = CFSTR("transit_nearby_payment_method_lookup_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v1243);
  v1244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v1245 = [GEOPDTransitNearbyPaymentMethodLookupParameters alloc];
    if (v1245)
    {
      v1246 = v1244;
      v1245 = -[GEOPDTransitNearbyPaymentMethodLookupParameters init](v1245, "init");
      if (v1245)
      {
        if ((_DWORD)a3)
          v1247 = CFSTR("transitNearbyPaymentMethodLookupOrigin");
        else
          v1247 = CFSTR("transit_nearby_payment_method_lookup_origin");
        objc_msgSend(v1246, "objectForKeyedSubscript:", v1247);
        v1248 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objk = v1246;
          v1404 = v1244;
          v1448 = 0u;
          v1447 = 0u;
          v1446 = 0u;
          v1445 = 0u;
          v1378 = v1248;
          v1249 = v1248;
          v1250 = objc_msgSend(v1249, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
          if (v1250)
          {
            v1251 = v1250;
            v1252 = *(_QWORD *)v1446;
            if ((_DWORD)a3)
              v1253 = CFSTR("waypointTyped");
            else
              v1253 = CFSTR("waypoint_typed");
            do
            {
              v1254 = 0;
              do
              {
                if (*(_QWORD *)v1446 != v1252)
                  objc_enumerationMutation(v1249);
                v1255 = *(void **)(*((_QWORD *)&v1445 + 1) + 8 * v1254);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v1256 = [GEOPDTransitNearbyPaymentMethodLookupOrigin alloc];
                  if (v1256)
                  {
                    v1257 = v1256;
                    v1258 = v1255;
                    v1259 = -[GEOPDTransitNearbyPaymentMethodLookupOrigin init](v1257, "init");
                    if (v1259)
                    {
                      objc_msgSend(v1258, "objectForKeyedSubscript:", v1253);
                      v1260 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v1261 = [GEOWaypointTyped alloc];
                        if ((v1379 & 1) != 0)
                          v1262 = -[GEOWaypointTyped initWithJSON:](v1261, "initWithJSON:", v1260);
                        else
                          v1262 = -[GEOWaypointTyped initWithDictionary:](v1261, "initWithDictionary:", v1260);
                        v1263 = v1262;
                        -[GEOPDTransitNearbyPaymentMethodLookupOrigin setWaypointTyped:]((uint64_t)v1259, v1262);

                      }
                    }

                  }
                  else
                  {
                    v1259 = 0;
                  }
                  -[GEOPDTransitNearbyPaymentMethodLookupParameters addTransitNearbyPaymentMethodLookupOrigin:]((uint64_t)v1245, v1259);

                  LODWORD(a3) = v1379;
                }
                ++v1254;
              }
              while (v1251 != v1254);
              v1264 = objc_msgSend(v1249, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
              v1251 = v1264;
            }
            while (v1264);
          }

          v1246 = objk;
          v1244 = v1404;
          v1248 = v1378;
        }

      }
    }
    -[GEOPDPlaceRequestParameters setTransitNearbyPaymentMethodLookupParameters:]((uint64_t)v1335, v1245);

  }
  if ((_DWORD)a3)
    v1265 = CFSTR("placecardEnrichmentParameters");
  else
    v1265 = CFSTR("placecard_enrichment_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v1265);
  v1266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v1267 = [GEOPDPlacecardEnrichmentParameters alloc];
    if (v1267)
    {
      v1268 = v1266;
      v1267 = -[GEOPDPlacecardEnrichmentParameters init](v1267, "init");
      if (v1267)
      {
        if ((_DWORD)a3)
          v1269 = CFSTR("mapsId");
        else
          v1269 = CFSTR("maps_id");
        objc_msgSend(v1268, "objectForKeyedSubscript:", v1269);
        v1270 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1271 = [GEOPDMapsIdentifier alloc];
          if ((a3 & 1) != 0)
            v1272 = -[GEOPDMapsIdentifier initWithJSON:](v1271, "initWithJSON:", v1270);
          else
            v1272 = -[GEOPDMapsIdentifier initWithDictionary:](v1271, "initWithDictionary:", v1270);
          v1273 = v1272;
          -[GEOPDPlacecardEnrichmentParameters setMapsId:]((uint64_t)v1267, v1272);

        }
        if ((_DWORD)a3)
          v1274 = CFSTR("enrichmentInfo");
        else
          v1274 = CFSTR("enrichment_info");
        objc_msgSend(v1268, "objectForKeyedSubscript:", v1274);
        v1275 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1448 = 0u;
          v1447 = 0u;
          v1446 = 0u;
          v1445 = 0u;
          v1276 = v1275;
          v1277 = objc_msgSend(v1276, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
          if (v1277)
          {
            v1278 = v1277;
            v1279 = *(_QWORD *)v1446;
            do
            {
              v1280 = 0;
              do
              {
                if (*(_QWORD *)v1446 != v1279)
                  objc_enumerationMutation(v1276);
                v1281 = *(void **)(*((_QWORD *)&v1445 + 1) + 8 * v1280);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v1282 = [GEOPDEnrichmentInfo alloc];
                  if (v1282)
                    v1283 = (void *)-[GEOPDEnrichmentInfo _initWithDictionary:isJSON:]((uint64_t)v1282, v1281, v1379);
                  else
                    v1283 = 0;
                  -[GEOPDPlacecardEnrichmentParameters addEnrichmentInfo:]((uint64_t)v1267, v1283);

                }
                ++v1280;
              }
              while (v1278 != v1280);
              v1284 = objc_msgSend(v1276, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
              v1278 = v1284;
            }
            while (v1284);
          }

          LODWORD(a3) = v1379;
        }

        if ((_DWORD)a3)
          v1285 = CFSTR("skipHtml");
        else
          v1285 = CFSTR("skip_html");
        objc_msgSend(v1268, "objectForKeyedSubscript:", v1285);
        v1286 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1287 = objc_msgSend(v1286, "BOOLValue");
          *(_BYTE *)&v1267->_flags |= 0x10u;
          *(_BYTE *)&v1267->_flags |= 1u;
          v1267->_skipHtml = v1287;
        }

      }
    }
    -[GEOPDPlaceRequestParameters setPlacecardEnrichmentParameters:]((uint64_t)v1335, v1267);

  }
  if ((_DWORD)a3)
    v1288 = CFSTR("offlineRegionNameParameters");
  else
    v1288 = CFSTR("offline_region_name_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v1288);
  v1289 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v1290 = [GEOPDOfflineRegionNameParameters alloc];
    if (v1290)
    {
      v1291 = v1289;
      v1290 = -[GEOPDOfflineRegionNameParameters init](v1290, "init");
      if (v1290)
      {
        objc_msgSend(v1291, "objectForKeyedSubscript:", CFSTR("region"));
        v1292 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1293 = [GEOMapRegion alloc];
          if ((a3 & 1) != 0)
            v1294 = -[GEOMapRegion initWithJSON:](v1293, "initWithJSON:", v1292);
          else
            v1294 = -[GEOMapRegion initWithDictionary:](v1293, "initWithDictionary:", v1292);
          v1295 = v1294;
          -[GEOPDOfflineRegionNameParameters setRegion:]((uint64_t)v1290, v1294);

        }
      }

    }
    -[GEOPDPlaceRequestParameters setOfflineRegionNameParameters:]((uint64_t)v1335, v1290);

  }
  if ((_DWORD)a3)
    v1296 = CFSTR("searchCapabilitiesParameters");
  else
    v1296 = CFSTR("search_capabilities_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v1296);
  v1297 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v1298 = [GEOPDSearchCapabilitiesParameters alloc];
    if (v1298)
    {
      v1299 = v1297;
      v1298 = -[GEOPDSearchCapabilitiesParameters init](v1298, "init");
      if (v1298)
      {
        if ((_DWORD)a3)
          v1300 = CFSTR("viewportInfo");
        else
          v1300 = CFSTR("viewport_info");
        objc_msgSend(v1299, "objectForKeyedSubscript:", v1300);
        v1301 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1302 = [GEOPDViewportInfo alloc];
          if ((a3 & 1) != 0)
            v1303 = -[GEOPDViewportInfo initWithJSON:](v1302, "initWithJSON:", v1301);
          else
            v1303 = -[GEOPDViewportInfo initWithDictionary:](v1302, "initWithDictionary:", v1301);
          v1304 = v1303;
          -[GEOPDSearchCapabilitiesParameters setViewportInfo:]((uint64_t)v1298, v1303);

        }
      }

    }
    -[GEOPDPlaceRequestParameters setSearchCapabilitiesParameters:]((uint64_t)v1335, v1298);

  }
  if ((_DWORD)a3)
    v1305 = CFSTR("refreshIdLookUpParameters");
  else
    v1305 = CFSTR("refresh_id_look_up_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v1305);
  v1306 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v1307 = [GEOPDRefreshIdLookUpParameters alloc];
    if (v1307)
    {
      v1308 = v1306;
      v1307 = -[GEOPDRefreshIdLookUpParameters init](v1307, "init");
      if (v1307)
      {
        if ((_DWORD)a3)
          v1309 = CFSTR("mapsId");
        else
          v1309 = CFSTR("maps_id");
        objc_msgSend(v1308, "objectForKeyedSubscript:", v1309);
        v1310 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1448 = 0u;
          v1447 = 0u;
          v1446 = 0u;
          v1445 = 0u;
          v1311 = v1310;
          v1312 = objc_msgSend(v1311, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
          if (v1312)
          {
            v1313 = v1312;
            v1314 = *(_QWORD *)v1446;
            do
            {
              for (i23 = 0; i23 != v1313; ++i23)
              {
                if (*(_QWORD *)v1446 != v1314)
                  objc_enumerationMutation(v1311);
                v1316 = *(_QWORD *)(*((_QWORD *)&v1445 + 1) + 8 * i23);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v1317 = [GEOPDMapsIdentifier alloc];
                  if ((v1379 & 1) != 0)
                    v1318 = -[GEOPDMapsIdentifier initWithJSON:](v1317, "initWithJSON:", v1316);
                  else
                    v1318 = -[GEOPDMapsIdentifier initWithDictionary:](v1317, "initWithDictionary:", v1316);
                  v1319 = v1318;
                  -[GEOPDRefreshIdLookUpParameters addMapsId:]((uint64_t)v1307, v1318);

                }
              }
              v1313 = objc_msgSend(v1311, "countByEnumeratingWithState:objects:count:", &v1445, v1449, 16);
            }
            while (v1313);
          }

          LODWORD(a3) = v1379;
        }

      }
    }
    -[GEOPDPlaceRequestParameters setRefreshIdLookUpParameters:]((uint64_t)v1335, v1307);

  }
  if ((_DWORD)a3)
    v1320 = CFSTR("addressRecommendationParameters");
  else
    v1320 = CFSTR("address_recommendation_parameters");
  objc_msgSend(v1357, "objectForKeyedSubscript:", v1320);
  v1321 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v1322 = [GEOPDAddressRecommendationParameters alloc];
    if (v1322)
    {
      v1323 = v1321;
      v1322 = -[GEOPDAddressRecommendationParameters init](v1322, "init");
      if (v1322)
      {
        if ((_DWORD)a3)
          v1324 = CFSTR("countryOrRegion");
        else
          v1324 = CFSTR("country_or_region");
        objc_msgSend(v1323, "objectForKeyedSubscript:", v1324);
        v1325 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1326 = (void *)objc_msgSend(v1325, "copy");
          -[GEOPDAddressRecommendationParameters setCountryOrRegion:]((uint64_t)v1322, v1326);

        }
        if ((_DWORD)a3)
          v1327 = CFSTR("addressWithComponents");
        else
          v1327 = CFSTR("address_with_components");
        objc_msgSend(v1323, "objectForKeyedSubscript:", v1327);
        v1328 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1329 = [GEOPDAddressWithComponents alloc];
          if (v1329)
            v1330 = -[GEOPDAddressWithComponents _initWithDictionary:isJSON:](v1329, v1328, a3);
          else
            v1330 = 0;
          -[GEOPDAddressRecommendationParameters setAddressWithComponents:]((uint64_t)v1322, v1330);

        }
      }

    }
    -[GEOPDPlaceRequestParameters setAddressRecommendationParameters:]((uint64_t)v1335, v1322);

  }
  a1 = v1335;

LABEL_2655:
  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceRequestParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOPDSearchParameters *searchParameters;
  GEOPDGeocodingParameters *geocodingParameters;
  GEOPDCanonicalLocationSearchParameters *canonicalLocationSearchParameters;
  GEOPDReverseGeocodingParameters *reverseGeocodingParameters;
  GEOPDPlaceLookupParameters *placeLookupParameters;
  GEOPDMerchantLookupParameters *merchantLookupParameters;
  GEOPDPlaceRefinementParameters *placeRefinementParameters;
  GEOPDSiriSearchParameters *siriSearchParameters;
  GEOPDLocationDirectedSearchParameters *locationDirectedSearchParameters;
  GEOPDAutocompleteParameters *autocompleteParameters;
  GEOPDSearchBrowseCategorySuggestionParameters *browseCategorySuggestionParameters;
  GEOPDCategorySearchParameters *categorySearchParameters;
  GEOPDPopularNearbySearchParameters *popularNearbySearchParameters;
  GEOPDSearchZeroKeywordCategorySuggestionParameters *searchZeroKeywordCategorySuggestionParameters;
  GEOPDSearchFieldPlaceholderParameters *searchFieldPlaceholderParameters;
  GEOPDBatchPopularNearbySearchParameters *batchPopularNearbySearchParameters;
  GEOPDVendorSpecificPlaceRefinementParameters *vendorSpecificPlaceRefinementParameters;
  GEOPDNearbySearchParameters *nearbySearchParameters;
  GEOPDAddressObjectGeocodingParameters *addressObjectGeocodingParameters;
  GEOPDSearchZeroKeywordWithSearchResultsSuggestionParameters *searchZeroKeywordWithSearchResultsSuggestionParameters;
  GEOPDExternalTransitLookupParameters *externalTransitLookupParameters;
  GEOPDFeatureIdGeocodingParameters *featureIdGeocodingParameters;
  GEOPDMapsIdentifierPlaceLookupParameters *mapsIdentifierPlaceLookupParameters;
  GEOPDBatchReverseGeocodingParameters *batchReverseGeocodingParameters;
  GEOPDBrandLookupParameters *brandLookupParameters;
  GEOPDWifiFingerprintParameters *wifiFingerprintParameters;
  GEOPDIpGeoLookupParameters *ipGeoLookupParameters;
  GEOPDGroundViewLabelParameters *groundViewLabelParameters;
  GEOPDBatchSpatialLookupParameters *batchSpatialLookupParameters;
  GEOPDTransitVehiclePositionParameters *transitVehiclePositionParameters;
  GEOPDPlaceCollectionLookupParameters *placeCollectionLookupParameter;
  GEOPBTransitScheduleLookupParameters *transitScheduleLookupParameter;
  GEOPDBatchCategoryLookupParameters *batchCategoryLookupParameters;
  GEOPDBatchMerchantLookupBrandParameters *batchMerchantLookupBrandParameters;
  GEOPDChildPlaceLookupByCategoryParameters *childPlaceLookupByCategoryParameters;
  GEOPDCollectionSuggestionParameters *collectionSuggestionParameters;
  GEOPDMapsSearchHomeParameters *mapsSearchHomeParameters;
  GEOPDPlaceQuestionnaireLookupParameters *placeQuestionnaireLookupParameters;
  GEOPDPublisherViewParameters *publisherViewParameters;
  GEOPDAllCollectionsViewParameters *allCollectionsViewParameters;
  GEOPDAirportEntityPlaceLookupParameters *airportEntityPlaceLookupParameters;
  GEOPDTerritoryLookupParameters *territoryLookupParameters;
  GEOPDTransitNearbyScheduleLookupParameters *transitNearbyScheduleLookupParameters;
  GEOPDMapsHomeParameters *mapsHomeParameters;
  GEOPDAllGuidesLocationsViewParameters *allGuidesLocationsViewParameters;
  GEOPDGuidesHomeParameters *guidesHomeParameters;
  GEOPDExtendedGeoLookupParameters *extendedGeoLookupParameters;
  GEOPDQueryUnderstandingParameters *queryUnderstandingParameters;
  GEOPDPoiAtAddressLookupParameters *poiAtAddressLookupParameters;
  GEOPDTransitNearbyPaymentMethodLookupParameters *transitNearbyPaymentMethodLookupParameters;
  GEOPDPlacecardEnrichmentParameters *placecardEnrichmentParameters;
  GEOPDOfflineRegionNameParameters *offlineRegionNameParameters;
  GEOPDSearchCapabilitiesParameters *searchCapabilitiesParameters;
  GEOPDRefreshIdLookUpParameters *refreshIdLookUpParameters;
  GEOPDAddressRecommendationParameters *addressRecommendationParameters;
  char v60;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_112;
  -[GEOPDPlaceRequestParameters readAll:]((uint64_t)self, 1);
  -[GEOPDPlaceRequestParameters readAll:]((uint64_t)v4, 1);
  searchParameters = self->_searchParameters;
  if ((unint64_t)searchParameters | v4[47])
  {
    if (!-[GEOPDSearchParameters isEqual:](searchParameters, "isEqual:"))
      goto LABEL_112;
  }
  geocodingParameters = self->_geocodingParameters;
  if ((unint64_t)geocodingParameters | v4[23]
    && !-[GEOPDGeocodingParameters isEqual:](geocodingParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  canonicalLocationSearchParameters = self->_canonicalLocationSearchParameters;
  if ((unint64_t)canonicalLocationSearchParameters | v4[16]
    && !-[GEOPDCanonicalLocationSearchParameters isEqual:](canonicalLocationSearchParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  reverseGeocodingParameters = self->_reverseGeocodingParameters;
  if ((unint64_t)reverseGeocodingParameters | v4[44]
    && !-[GEOPDReverseGeocodingParameters isEqual:](reverseGeocodingParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  placeLookupParameters = self->_placeLookupParameters;
  if ((unint64_t)placeLookupParameters | v4[35]
    && !-[GEOPDPlaceLookupParameters isEqual:](placeLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  merchantLookupParameters = self->_merchantLookupParameters;
  if ((unint64_t)merchantLookupParameters | v4[31]
    && !-[GEOPDMerchantLookupParameters isEqual:](merchantLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  placeRefinementParameters = self->_placeRefinementParameters;
  if ((unint64_t)placeRefinementParameters | v4[37]
    && !-[GEOPDPlaceRefinementParameters isEqual:](placeRefinementParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  siriSearchParameters = self->_siriSearchParameters;
  if ((unint64_t)siriSearchParameters | v4[50]
    && !-[GEOPDSiriSearchParameters isEqual:](siriSearchParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  locationDirectedSearchParameters = self->_locationDirectedSearchParameters;
  if ((unint64_t)locationDirectedSearchParameters | v4[27]
    && !-[GEOPDLocationDirectedSearchParameters isEqual:](locationDirectedSearchParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  autocompleteParameters = self->_autocompleteParameters;
  if ((unint64_t)autocompleteParameters | v4[8]
    && !-[GEOPDAutocompleteParameters isEqual:](autocompleteParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  browseCategorySuggestionParameters = self->_browseCategorySuggestionParameters;
  if ((unint64_t)browseCategorySuggestionParameters | v4[15]
    && !-[GEOPDSearchBrowseCategorySuggestionParameters isEqual:](browseCategorySuggestionParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  categorySearchParameters = self->_categorySearchParameters;
  if ((unint64_t)categorySearchParameters | v4[17]
    && !-[GEOPDCategorySearchParameters isEqual:](categorySearchParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  popularNearbySearchParameters = self->_popularNearbySearchParameters;
  if ((unint64_t)popularNearbySearchParameters | v4[40]
    && !-[GEOPDPopularNearbySearchParameters isEqual:](popularNearbySearchParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  searchZeroKeywordCategorySuggestionParameters = self->_searchZeroKeywordCategorySuggestionParameters;
  if ((unint64_t)searchZeroKeywordCategorySuggestionParameters | v4[48]
    && !-[GEOPDSearchZeroKeywordCategorySuggestionParameters isEqual:](searchZeroKeywordCategorySuggestionParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  searchFieldPlaceholderParameters = self->_searchFieldPlaceholderParameters;
  if ((unint64_t)searchFieldPlaceholderParameters | v4[46]
    && !-[GEOPDSearchFieldPlaceholderParameters isEqual:](searchFieldPlaceholderParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  batchPopularNearbySearchParameters = self->_batchPopularNearbySearchParameters;
  if ((unint64_t)batchPopularNearbySearchParameters | v4[11]
    && !-[GEOPDBatchPopularNearbySearchParameters isEqual:](batchPopularNearbySearchParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  vendorSpecificPlaceRefinementParameters = self->_vendorSpecificPlaceRefinementParameters;
  if ((unint64_t)vendorSpecificPlaceRefinementParameters | v4[56]
    && !-[GEOPDVendorSpecificPlaceRefinementParameters isEqual:](vendorSpecificPlaceRefinementParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  nearbySearchParameters = self->_nearbySearchParameters;
  if ((unint64_t)nearbySearchParameters | v4[32]
    && !-[GEOPDNearbySearchParameters isEqual:](nearbySearchParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  addressObjectGeocodingParameters = self->_addressObjectGeocodingParameters;
  if ((unint64_t)addressObjectGeocodingParameters | v4[3]
    && !-[GEOPDAddressObjectGeocodingParameters isEqual:](addressObjectGeocodingParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  searchZeroKeywordWithSearchResultsSuggestionParameters = self->_searchZeroKeywordWithSearchResultsSuggestionParameters;
  if ((unint64_t)searchZeroKeywordWithSearchResultsSuggestionParameters | v4[49]
    && !-[GEOPDSearchZeroKeywordWithSearchResultsSuggestionParameters isEqual:](searchZeroKeywordWithSearchResultsSuggestionParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  externalTransitLookupParameters = self->_externalTransitLookupParameters;
  if ((unint64_t)externalTransitLookupParameters | v4[21]
    && !-[GEOPDExternalTransitLookupParameters isEqual:](externalTransitLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  featureIdGeocodingParameters = self->_featureIdGeocodingParameters;
  if ((unint64_t)featureIdGeocodingParameters | v4[22]
    && !-[GEOPDFeatureIdGeocodingParameters isEqual:](featureIdGeocodingParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  mapsIdentifierPlaceLookupParameters = self->_mapsIdentifierPlaceLookupParameters;
  if ((unint64_t)mapsIdentifierPlaceLookupParameters | v4[29]
    && !-[GEOPDMapsIdentifierPlaceLookupParameters isEqual:](mapsIdentifierPlaceLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  batchReverseGeocodingParameters = self->_batchReverseGeocodingParameters;
  if ((unint64_t)batchReverseGeocodingParameters | v4[12]
    && !-[GEOPDBatchReverseGeocodingParameters isEqual:](batchReverseGeocodingParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  brandLookupParameters = self->_brandLookupParameters;
  if ((unint64_t)brandLookupParameters | v4[14]
    && !-[GEOPDBrandLookupParameters isEqual:](brandLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  wifiFingerprintParameters = self->_wifiFingerprintParameters;
  if ((unint64_t)wifiFingerprintParameters | v4[57]
    && !-[GEOPDWifiFingerprintParameters isEqual:](wifiFingerprintParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  ipGeoLookupParameters = self->_ipGeoLookupParameters;
  if ((unint64_t)ipGeoLookupParameters | v4[26]
    && !-[GEOPDIpGeoLookupParameters isEqual:](ipGeoLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  groundViewLabelParameters = self->_groundViewLabelParameters;
  if ((unint64_t)groundViewLabelParameters | v4[24]
    && !-[GEOPDGroundViewLabelParameters isEqual:](groundViewLabelParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  batchSpatialLookupParameters = self->_batchSpatialLookupParameters;
  if ((unint64_t)batchSpatialLookupParameters | v4[13]
    && !-[GEOPDBatchSpatialLookupParameters isEqual:](batchSpatialLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  transitVehiclePositionParameters = self->_transitVehiclePositionParameters;
  if ((unint64_t)transitVehiclePositionParameters | v4[55]
    && !-[GEOPDTransitVehiclePositionParameters isEqual:](transitVehiclePositionParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  placeCollectionLookupParameter = self->_placeCollectionLookupParameter;
  if ((unint64_t)placeCollectionLookupParameter | v4[34]
    && !-[GEOPDPlaceCollectionLookupParameters isEqual:](placeCollectionLookupParameter, "isEqual:"))
  {
    goto LABEL_112;
  }
  transitScheduleLookupParameter = self->_transitScheduleLookupParameter;
  if ((unint64_t)transitScheduleLookupParameter | v4[54]
    && !-[GEOPBTransitScheduleLookupParameters isEqual:](transitScheduleLookupParameter, "isEqual:"))
  {
    goto LABEL_112;
  }
  batchCategoryLookupParameters = self->_batchCategoryLookupParameters;
  if ((unint64_t)batchCategoryLookupParameters | v4[9]
    && !-[GEOPDBatchCategoryLookupParameters isEqual:](batchCategoryLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  batchMerchantLookupBrandParameters = self->_batchMerchantLookupBrandParameters;
  if ((unint64_t)batchMerchantLookupBrandParameters | v4[10]
    && !-[GEOPDBatchMerchantLookupBrandParameters isEqual:](batchMerchantLookupBrandParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  childPlaceLookupByCategoryParameters = self->_childPlaceLookupByCategoryParameters;
  if ((unint64_t)childPlaceLookupByCategoryParameters | v4[18]
    && !-[GEOPDChildPlaceLookupByCategoryParameters isEqual:](childPlaceLookupByCategoryParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  collectionSuggestionParameters = self->_collectionSuggestionParameters;
  if ((unint64_t)collectionSuggestionParameters | v4[19]
    && !-[GEOPDCollectionSuggestionParameters isEqual:](collectionSuggestionParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  mapsSearchHomeParameters = self->_mapsSearchHomeParameters;
  if ((unint64_t)mapsSearchHomeParameters | v4[30]
    && !-[GEOPDMapsSearchHomeParameters isEqual:](mapsSearchHomeParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  placeQuestionnaireLookupParameters = self->_placeQuestionnaireLookupParameters;
  if ((unint64_t)placeQuestionnaireLookupParameters | v4[36]
    && !-[GEOPDPlaceQuestionnaireLookupParameters isEqual:](placeQuestionnaireLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  publisherViewParameters = self->_publisherViewParameters;
  if ((unint64_t)publisherViewParameters | v4[41]
    && !-[GEOPDPublisherViewParameters isEqual:](publisherViewParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  allCollectionsViewParameters = self->_allCollectionsViewParameters;
  if ((unint64_t)allCollectionsViewParameters | v4[6]
    && !-[GEOPDAllCollectionsViewParameters isEqual:](allCollectionsViewParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  airportEntityPlaceLookupParameters = self->_airportEntityPlaceLookupParameters;
  if ((unint64_t)airportEntityPlaceLookupParameters | v4[5]
    && !-[GEOPDAirportEntityPlaceLookupParameters isEqual:](airportEntityPlaceLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  territoryLookupParameters = self->_territoryLookupParameters;
  if ((unint64_t)territoryLookupParameters | v4[51]
    && !-[GEOPDTerritoryLookupParameters isEqual:](territoryLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  transitNearbyScheduleLookupParameters = self->_transitNearbyScheduleLookupParameters;
  if ((unint64_t)transitNearbyScheduleLookupParameters | v4[53]
    && !-[GEOPDTransitNearbyScheduleLookupParameters isEqual:](transitNearbyScheduleLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  mapsHomeParameters = self->_mapsHomeParameters;
  if ((unint64_t)mapsHomeParameters | v4[28]
    && !-[GEOPDMapsHomeParameters isEqual:](mapsHomeParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  allGuidesLocationsViewParameters = self->_allGuidesLocationsViewParameters;
  if ((unint64_t)allGuidesLocationsViewParameters | v4[7]
    && !-[GEOPDAllGuidesLocationsViewParameters isEqual:](allGuidesLocationsViewParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  guidesHomeParameters = self->_guidesHomeParameters;
  if ((unint64_t)guidesHomeParameters | v4[25]
    && !-[GEOPDGuidesHomeParameters isEqual:](guidesHomeParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  extendedGeoLookupParameters = self->_extendedGeoLookupParameters;
  if ((unint64_t)extendedGeoLookupParameters | v4[20]
    && !-[GEOPDExtendedGeoLookupParameters isEqual:](extendedGeoLookupParameters, "isEqual:"))
  {
    goto LABEL_112;
  }
  if (((queryUnderstandingParameters = self->_queryUnderstandingParameters,
         !((unint64_t)queryUnderstandingParameters | v4[42]))
     || -[GEOPDQueryUnderstandingParameters isEqual:](queryUnderstandingParameters, "isEqual:"))
    && ((poiAtAddressLookupParameters = self->_poiAtAddressLookupParameters,
         !((unint64_t)poiAtAddressLookupParameters | v4[39]))
     || -[GEOPDPoiAtAddressLookupParameters isEqual:](poiAtAddressLookupParameters, "isEqual:"))
    && ((transitNearbyPaymentMethodLookupParameters = self->_transitNearbyPaymentMethodLookupParameters,
         !((unint64_t)transitNearbyPaymentMethodLookupParameters | v4[52]))
     || -[GEOPDTransitNearbyPaymentMethodLookupParameters isEqual:](transitNearbyPaymentMethodLookupParameters, "isEqual:"))&& ((placecardEnrichmentParameters = self->_placecardEnrichmentParameters, !((unint64_t)placecardEnrichmentParameters | v4[38]))|| -[GEOPDPlacecardEnrichmentParameters isEqual:](placecardEnrichmentParameters, "isEqual:"))&& ((offlineRegionNameParameters = self->_offlineRegionNameParameters, !((unint64_t)offlineRegionNameParameters | v4[33]))|| -[GEOPDOfflineRegionNameParameters isEqual:](offlineRegionNameParameters, "isEqual:"))&& ((searchCapabilitiesParameters = self->_searchCapabilitiesParameters, !((unint64_t)searchCapabilitiesParameters | v4[45]))|| -[GEOPDSearchCapabilitiesParameters isEqual:](searchCapabilitiesParameters, "isEqual:"))&& ((refreshIdLookUpParameters = self->_refreshIdLookUpParameters, !((unint64_t)refreshIdLookUpParameters | v4[43]))|| -[GEOPDRefreshIdLookUpParameters isEqual:](refreshIdLookUpParameters, "isEqual:")))
  {
    addressRecommendationParameters = self->_addressRecommendationParameters;
    if ((unint64_t)addressRecommendationParameters | v4[4])
      v60 = -[GEOPDAddressRecommendationParameters isEqual:](addressRecommendationParameters, "isEqual:");
    else
      v60 = 1;
  }
  else
  {
LABEL_112:
    v60 = 0;
  }

  return v60;
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
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;

  -[GEOPDPlaceRequestParameters readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDSearchParameters hash](self->_searchParameters, "hash");
  v4 = -[GEOPDGeocodingParameters hash](self->_geocodingParameters, "hash") ^ v3;
  v5 = -[GEOPDCanonicalLocationSearchParameters hash](self->_canonicalLocationSearchParameters, "hash");
  v6 = v4 ^ v5 ^ -[GEOPDReverseGeocodingParameters hash](self->_reverseGeocodingParameters, "hash");
  v7 = -[GEOPDPlaceLookupParameters hash](self->_placeLookupParameters, "hash");
  v8 = v7 ^ -[GEOPDMerchantLookupParameters hash](self->_merchantLookupParameters, "hash");
  v9 = v6 ^ v8 ^ -[GEOPDPlaceRefinementParameters hash](self->_placeRefinementParameters, "hash");
  v10 = -[GEOPDSiriSearchParameters hash](self->_siriSearchParameters, "hash");
  v11 = v10 ^ -[GEOPDLocationDirectedSearchParameters hash](self->_locationDirectedSearchParameters, "hash");
  v12 = v9 ^ v11 ^ -[GEOPDAutocompleteParameters hash](self->_autocompleteParameters, "hash");
  v13 = -[GEOPDSearchBrowseCategorySuggestionParameters hash](self->_browseCategorySuggestionParameters, "hash");
  v14 = v13 ^ -[GEOPDCategorySearchParameters hash](self->_categorySearchParameters, "hash");
  v15 = v14 ^ -[GEOPDPopularNearbySearchParameters hash](self->_popularNearbySearchParameters, "hash");
  v16 = v15 ^ -[GEOPDSearchZeroKeywordCategorySuggestionParameters hash](self->_searchZeroKeywordCategorySuggestionParameters, "hash");
  v17 = v12 ^ v16 ^ -[GEOPDSearchFieldPlaceholderParameters hash](self->_searchFieldPlaceholderParameters, "hash");
  v18 = -[GEOPDBatchPopularNearbySearchParameters hash](self->_batchPopularNearbySearchParameters, "hash");
  v19 = v18 ^ -[GEOPDVendorSpecificPlaceRefinementParameters hash](self->_vendorSpecificPlaceRefinementParameters, "hash");
  v20 = v19 ^ -[GEOPDNearbySearchParameters hash](self->_nearbySearchParameters, "hash");
  v21 = v20 ^ -[GEOPDAddressObjectGeocodingParameters hash](self->_addressObjectGeocodingParameters, "hash");
  v22 = v17 ^ v21 ^ -[GEOPDSearchZeroKeywordWithSearchResultsSuggestionParameters hash](self->_searchZeroKeywordWithSearchResultsSuggestionParameters, "hash");
  v23 = -[GEOPDExternalTransitLookupParameters hash](self->_externalTransitLookupParameters, "hash");
  v24 = v23 ^ -[GEOPDFeatureIdGeocodingParameters hash](self->_featureIdGeocodingParameters, "hash");
  v25 = v24 ^ -[GEOPDMapsIdentifierPlaceLookupParameters hash](self->_mapsIdentifierPlaceLookupParameters, "hash");
  v26 = v25 ^ -[GEOPDBatchReverseGeocodingParameters hash](self->_batchReverseGeocodingParameters, "hash");
  v27 = v26 ^ -[GEOPDBrandLookupParameters hash](self->_brandLookupParameters, "hash");
  v28 = v27 ^ -[GEOPDWifiFingerprintParameters hash](self->_wifiFingerprintParameters, "hash");
  v29 = v22 ^ v28 ^ -[GEOPDIpGeoLookupParameters hash](self->_ipGeoLookupParameters, "hash");
  v30 = -[GEOPDGroundViewLabelParameters hash](self->_groundViewLabelParameters, "hash");
  v31 = v30 ^ -[GEOPDBatchSpatialLookupParameters hash](self->_batchSpatialLookupParameters, "hash");
  v32 = v31 ^ -[GEOPDTransitVehiclePositionParameters hash](self->_transitVehiclePositionParameters, "hash");
  v33 = v32 ^ -[GEOPDPlaceCollectionLookupParameters hash](self->_placeCollectionLookupParameter, "hash");
  v34 = v33 ^ -[GEOPBTransitScheduleLookupParameters hash](self->_transitScheduleLookupParameter, "hash");
  v35 = v34 ^ -[GEOPDBatchCategoryLookupParameters hash](self->_batchCategoryLookupParameters, "hash");
  v36 = v35 ^ -[GEOPDBatchMerchantLookupBrandParameters hash](self->_batchMerchantLookupBrandParameters, "hash");
  v37 = v29 ^ v36 ^ -[GEOPDChildPlaceLookupByCategoryParameters hash](self->_childPlaceLookupByCategoryParameters, "hash");
  v38 = -[GEOPDCollectionSuggestionParameters hash](self->_collectionSuggestionParameters, "hash");
  v39 = v38 ^ -[GEOPDMapsSearchHomeParameters hash](self->_mapsSearchHomeParameters, "hash");
  v40 = v39 ^ -[GEOPDPlaceQuestionnaireLookupParameters hash](self->_placeQuestionnaireLookupParameters, "hash");
  v41 = v40 ^ -[GEOPDPublisherViewParameters hash](self->_publisherViewParameters, "hash");
  v42 = v41 ^ -[GEOPDAllCollectionsViewParameters hash](self->_allCollectionsViewParameters, "hash");
  v43 = v42 ^ -[GEOPDAirportEntityPlaceLookupParameters hash](self->_airportEntityPlaceLookupParameters, "hash");
  v44 = v43 ^ -[GEOPDTerritoryLookupParameters hash](self->_territoryLookupParameters, "hash");
  v45 = v37 ^ v44 ^ -[GEOPDTransitNearbyScheduleLookupParameters hash](self->_transitNearbyScheduleLookupParameters, "hash");
  v46 = -[GEOPDMapsHomeParameters hash](self->_mapsHomeParameters, "hash");
  v47 = v46 ^ -[GEOPDAllGuidesLocationsViewParameters hash](self->_allGuidesLocationsViewParameters, "hash");
  v48 = v47 ^ -[GEOPDGuidesHomeParameters hash](self->_guidesHomeParameters, "hash");
  v49 = v48 ^ -[GEOPDExtendedGeoLookupParameters hash](self->_extendedGeoLookupParameters, "hash");
  v50 = v49 ^ -[GEOPDQueryUnderstandingParameters hash](self->_queryUnderstandingParameters, "hash");
  v51 = v50 ^ -[GEOPDPoiAtAddressLookupParameters hash](self->_poiAtAddressLookupParameters, "hash");
  v52 = v51 ^ -[GEOPDTransitNearbyPaymentMethodLookupParameters hash](self->_transitNearbyPaymentMethodLookupParameters, "hash");
  v53 = v52 ^ -[GEOPDPlacecardEnrichmentParameters hash](self->_placecardEnrichmentParameters, "hash");
  v54 = v53 ^ -[GEOPDOfflineRegionNameParameters hash](self->_offlineRegionNameParameters, "hash");
  v55 = v45 ^ v54 ^ -[GEOPDSearchCapabilitiesParameters hash](self->_searchCapabilitiesParameters, "hash");
  v56 = -[GEOPDRefreshIdLookUpParameters hash](self->_refreshIdLookUpParameters, "hash");
  return v55 ^ v56 ^ -[GEOPDAddressRecommendationParameters hash](self->_addressRecommendationParameters, "hash");
}

- (GEOPDPlaceRequestParameters)initWithIdentifiers:(id)a3 resultProviderID:(int)a4
{
  uint64_t v4;
  id v6;
  GEOPDPlaceRequestParameters *v7;
  GEOPDMapsIdentifierPlaceLookupParameters *v8;
  GEOPDPlaceRequestParameters *v9;
  objc_super v11;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOPDPlaceRequestParameters;
  v7 = -[GEOPDPlaceRequestParameters init](&v11, sel_init);
  if (v7)
  {
    v8 = -[GEOPDMapsIdentifierPlaceLookupParameters initWithIdentifiers:resultProviderID:]([GEOPDMapsIdentifierPlaceLookupParameters alloc], "initWithIdentifiers:resultProviderID:", v6, v4);
    -[GEOPDPlaceRequestParameters setMapsIdentifierPlaceLookupParameters:]((uint64_t)v7, v8);

    v9 = v7;
  }

  return v7;
}

- (GEOPDPlaceRequestParameters)initWithExternalBusinessID:(id)a3 contentProvider:(id)a4
{
  id v6;
  id v7;
  GEOPDPlaceRequestParameters *v8;
  GEOPDVendorSpecificPlaceRefinementParameters *v9;
  GEOPDPlaceRequestParameters *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOPDPlaceRequestParameters;
  v8 = -[GEOPDPlaceRequestParameters init](&v12, sel_init);
  if (v8)
  {
    v9 = -[GEOPDVendorSpecificPlaceRefinementParameters initWithExternalBusinessID:contentProvider:]([GEOPDVendorSpecificPlaceRefinementParameters alloc], "initWithExternalBusinessID:contentProvider:", v6, v7);
    -[GEOPDPlaceRequestParameters setVendorSpecificPlaceRefinementParameters:]((uint64_t)v8, v9);
    v10 = v8;

  }
  return v8;
}

- (GEOPDPlaceRequestParameters)initWithMerchantCode:(id)a3 rawMerchantCode:(id)a4 relyingPartyIdentifier:(id)a5 industryCategory:(id)a6 industryCode:(id)a7 paymentNetwork:(id)a8 transactionDate:(id)a9 transactionLocation:(id)a10 terminalId:(id)a11 transactionCurrencyCode:(id)a12 transactionType:(int)a13 transactionId:(id)a14 warsawMerchantDomain:(id)a15 warsawMerchantName:(id)a16 warsawMerchantId:(id)a17 adamId:(id)a18 merchantId:(id)a19 merchantDoingBizAsName:(id)a20 merchantEnhancedName:(id)a21 merchantCity:(id)a22 merchantRawCity:(id)a23 merchantState:(id)a24 merchantRawState:(id)a25 merchantZip:(id)a26 merchantAddress:(id)a27 merchantRawAddress:(id)a28 merchantCountryCode:(id)a29 merchantType:(id)a30 merchantCleanConfidenceLevel:(id)a31 merchantAdditionalData:(id)a32 merchantCanl:(id)a33 brandFallbackSupported:(BOOL)a34 isSettlement:(BOOL)a35 isRefund:(BOOL)a36 fuzzyMatched:(id)a37 coarseLocationUsed:(id)a38 bankTransactionType:(int)a39 bankTransactionStatus:(int)a40 bankAnonymisedUserId:(id)a41 otherBankTransactionLocations:(id)a42 bankTransactionDescription:(id)a43 bankTransactionTimestamp:(id)a44 bankRawMerchantCode:(id)a45 bankIndustryCategory:(id)a46 bankIndustryCode:(id)a47 bankTransactionCurrencyCode:(id)a48 bankMerchantInfo:(id)a49 baaCerts:(id)a50 baaSignature:(id)a51 bankBrandMUIDFallbackEnabled:(id)a52 bankIdentifier:(id)a53 bankTransactionDescriptionClean:(id)a54 bankPIIRedactionIsApplied:(id)a55 bankRotationPeriodsSinceEpoch:(id)a56 traits:(id)a57
{
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  GEOPDPlaceRequestParameters *v69;
  void *v70;
  void *v71;
  GEOPDMerchantLookupParameters *v72;
  void *v73;
  int v74;
  double v75;
  double v76;
  double v77;
  GEOPDIdentityMerchantInformation *v78;
  GEOPDWarsawMerchantIdentifier *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  GEOPDAdamAppIdentifier *v84;
  void *v85;
  GEOPDMerchantInformation *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  unsigned int v104;
  uint64_t v105;
  id v106;
  GEOPDBankTransactionInformation *v107;
  GEOPDBankTransactionInformation *v108;
  _BOOL4 v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t i;
  id v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t j;
  GEOPDPlaceRequestParameters *v120;
  id v122;
  void *v123;
  id v124;
  void *v125;
  id v126;
  id v127;
  void *v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v160;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  id v172;
  id v173;
  id v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  objc_super v183;
  _BYTE v184[128];
  _BYTE v185[128];
  uint64_t v186;

  v186 = *MEMORY[0x1E0C80C00];
  v158 = a3;
  v174 = a4;
  v152 = a5;
  v60 = a6;
  v162 = a7;
  v160 = a8;
  v61 = a9;
  v62 = a10;
  v157 = a11;
  v63 = a12;
  v156 = a14;
  v64 = a15;
  v65 = a16;
  v66 = a17;
  v155 = a18;
  v67 = a19;
  v68 = a20;
  v172 = a21;
  v171 = a22;
  v170 = a23;
  v169 = a24;
  v168 = a25;
  v167 = a26;
  v166 = a27;
  v165 = a28;
  v164 = a29;
  v163 = a30;
  v148 = a31;
  v147 = a32;
  v173 = a33;
  v154 = a37;
  v153 = a38;
  v146 = a41;
  v151 = a42;
  v131 = a43;
  v145 = a44;
  v144 = a45;
  v143 = a46;
  v142 = a47;
  v141 = a48;
  v130 = a49;
  v150 = a50;
  v140 = a51;
  v139 = a52;
  v138 = a53;
  v137 = a54;
  v136 = a55;
  v149 = a56;
  v129 = a57;
  v183.receiver = self;
  v183.super_class = (Class)GEOPDPlaceRequestParameters;
  v69 = -[GEOPDPlaceRequestParameters init](&v183, sel_init);

  if (v69)
  {
    v132 = v68;
    v133 = v67;
    v135 = v63;
    if (v61)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "components:fromDate:", 124, v61);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "setMinute:", 15 * (objc_msgSend(v71, "minute") / 15));
      objc_msgSend(v70, "dateFromComponents:", v71);
      v128 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v128 = 0;
    }
    v72 = objc_alloc_init(GEOPDMerchantLookupParameters);
    -[GEOPDMerchantLookupParameters setMerchantCode:](v72, "setMerchantCode:", v158);
    if (v174)
      -[GEOPDMerchantLookupParameters setRawMerchantCode:](v72, "setRawMerchantCode:", v174);
    if (v60)
      -[GEOPDMerchantLookupParameters setIndustryCategory:](v72, "setIndustryCategory:", v60);
    if (v162)
      -[GEOPDMerchantLookupParameters setIndustryCode:](v72, "setIndustryCode:", objc_msgSend(v162, "longLongValue"));
    -[GEOPDMerchantLookupParameters setPaymentNetwork:](v72, "setPaymentNetwork:", v160);
    if (v128)
    {
      objc_msgSend(v128, "timeIntervalSinceReferenceDate");
      -[GEOPDMerchantLookupParameters setTransactionTimestamp:](v72, "setTransactionTimestamp:");
    }
    v126 = v60;
    v73 = (void *)objc_msgSend(v62, "copy");
    objc_msgSend(v73, "setHasTimestamp:", 0);
    -[GEOPDMerchantLookupParameters setTransactionLocation:](v72, "setTransactionLocation:", v73);
    v74 = objc_msgSend(v62, "hasTimestamp");
    if (v61 && v74)
    {
      objc_msgSend(v61, "timeIntervalSinceReferenceDate");
      v76 = v75;
      objc_msgSend(v62, "timestamp");
      -[GEOPDMerchantLookupParameters setTransactionLocationAge:](v72, "setTransactionLocationAge:", v76 - v77);
    }
    if (v157)
      -[GEOPDMerchantLookupParameters setTerminalId:](v72, "setTerminalId:", v157);
    if (v63)
      -[GEOPDMerchantLookupParameters setTransactionCurrencyCode:](v72, "setTransactionCurrencyCode:");
    if (a13)
    {
      -[GEOPDMerchantLookupParameters setTransactionType:](v72, "setTransactionType:", a13);
      if (v152)
      {
        if (a13 == 6)
        {
          v78 = objc_alloc_init(GEOPDIdentityMerchantInformation);
          -[GEOPDIdentityMerchantInformation setRpIdentifier:]((uint64_t)v78, v152);
          -[GEOPDMerchantLookupParameters setIdentityMerchantInformation:](v72, "setIdentityMerchantInformation:", v78);

        }
      }
    }
    if (v156)
      -[GEOPDMerchantLookupParameters setTransactionId:](v72, "setTransactionId:", v156);
    if (v64 || v65 || v66)
    {
      v79 = objc_alloc_init(GEOPDWarsawMerchantIdentifier);
      -[GEOPDMerchantLookupParameters setWarsawMerchantIdentifier:](v72, "setWarsawMerchantIdentifier:", v79);

      if (v64)
      {
        -[GEOPDMerchantLookupParameters warsawMerchantIdentifier](v72, "warsawMerchantIdentifier");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPDWarsawMerchantIdentifier setMerchantDomain:]((uint64_t)v80, v64);

      }
      if (v65)
      {
        -[GEOPDMerchantLookupParameters warsawMerchantIdentifier](v72, "warsawMerchantIdentifier");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPDWarsawMerchantIdentifier setMerchantName:]((uint64_t)v81, v65);

      }
      if (v66)
      {
        -[GEOPDMerchantLookupParameters warsawMerchantIdentifier](v72, "warsawMerchantIdentifier");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPDWarsawMerchantIdentifier setMerchantId:]((uint64_t)v82, v66);

      }
    }
    v122 = v65;
    v124 = v62;
    v127 = v64;
    v83 = v61;
    if (v155)
    {
      v84 = objc_alloc_init(GEOPDAdamAppIdentifier);
      -[GEOPDMerchantLookupParameters setAppIdentifier:](v72, "setAppIdentifier:", v84);

      -[GEOPDMerchantLookupParameters appIdentifier](v72, "appIdentifier");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDAdamAppIdentifier setAdamId:]((uint64_t)v85, v155);

      v61 = v83;
    }
    if (v133 || v132 || v172 || v171 || v170 || v169 || v168 || v167 || v166 || v165 || v164 || v163 || v173)
    {
      v86 = objc_alloc_init(GEOPDMerchantInformation);
      -[GEOPDMerchantLookupParameters setMerchantInformation:](v72, "setMerchantInformation:", v86);

      if (v133)
      {
        -[GEOPDMerchantLookupParameters merchantInformation](v72, "merchantInformation");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "setMerchantId:", v133);

      }
      if (v132)
      {
        -[GEOPDMerchantLookupParameters merchantInformation](v72, "merchantInformation");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "setMerchantDoingBusinessAsName:", v132);

      }
      if (v172)
      {
        -[GEOPDMerchantLookupParameters merchantInformation](v72, "merchantInformation");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "setMerchantEnhancedName:", v172);

      }
      if (v171)
      {
        -[GEOPDMerchantLookupParameters merchantInformation](v72, "merchantInformation");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "setMerchantCity:", v171);

      }
      if (v170)
      {
        -[GEOPDMerchantLookupParameters merchantInformation](v72, "merchantInformation");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "setMerchantRawCity:", v170);

      }
      if (v169)
      {
        -[GEOPDMerchantLookupParameters merchantInformation](v72, "merchantInformation");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "setMerchantState:", v169);

      }
      if (v168)
      {
        -[GEOPDMerchantLookupParameters merchantInformation](v72, "merchantInformation");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "setMerchantRawState:", v168);

      }
      if (v167)
      {
        -[GEOPDMerchantLookupParameters merchantInformation](v72, "merchantInformation");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "setMerchantZip:", v167);

      }
      if (v166)
      {
        -[GEOPDMerchantLookupParameters merchantInformation](v72, "merchantInformation");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "setMerchantAddress:", v166);

      }
      if (v165)
      {
        -[GEOPDMerchantLookupParameters merchantInformation](v72, "merchantInformation");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "setMerchantRawAddress:", v165);

      }
      if (v164)
      {
        -[GEOPDMerchantLookupParameters merchantInformation](v72, "merchantInformation");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "setMerchantCountryCode:", v164);

      }
      if (v163)
      {
        -[GEOPDMerchantLookupParameters merchantInformation](v72, "merchantInformation");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "setMerchantType:", v163);

      }
      if (v148)
      {
        v99 = objc_msgSend(v148, "intValue");
        -[GEOPDMerchantLookupParameters merchantInformation](v72, "merchantInformation");
        v100 = v66;
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "setMerchantCleanConfidenceLevel:", v99);

        v66 = v100;
      }
      if (v147)
      {
        -[GEOPDMerchantLookupParameters merchantInformation](v72, "merchantInformation");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "setMerchantAdditionalData:", v147);

      }
      v61 = v83;
      if (v173)
      {
        -[GEOPDMerchantLookupParameters merchantInformation](v72, "merchantInformation");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "setMerchantCanl:", v173);

        v61 = v83;
      }
    }
    -[GEOPDMerchantLookupParameters setEnableBrandMuidFallback:](v72, "setEnableBrandMuidFallback:", a34, v122, v124);
    if (a35)
      v104 = 2;
    else
      v104 = 1;
    if (a36)
      v105 = 3;
    else
      v105 = v104;
    -[GEOPDMerchantLookupParameters setTransactionStatus:](v72, "setTransactionStatus:", v105);
    if (v154)
      -[GEOPDMerchantLookupParameters setFuzzyMatched:](v72, "setFuzzyMatched:", objc_msgSend(v154, "BOOLValue"));
    v60 = v126;
    if (v153)
      -[GEOPDMerchantLookupParameters setCoarseLocationUsed:](v72, "setCoarseLocationUsed:", objc_msgSend(v153, "BOOLValue"));
    -[GEOPDPlaceRequestParameters setMerchantLookupParameters:]((uint64_t)v69, v72);
    if (!GEOConfigGetBOOL(GeoServicesConfig_Maps_493532, (uint64_t)off_1EDF4E1B8))
      goto LABEL_140;
    v106 = v66;
    v107 = objc_alloc_init(GEOPDBankTransactionInformation);
    v108 = v107;
    v109 = a39 != 0;
    if (a39)
      -[GEOPDBankTransactionInformation setBankTransactionType:](v107, "setBankTransactionType:", a39);
    if (a40)
    {
      -[GEOPDBankTransactionInformation setTransactionStatus:](v108, "setTransactionStatus:", a40);
      v109 = 1;
    }
    v61 = v83;
    -[GEOPDBankTransactionInformation setAnonymisedUserId:](v108, "setAnonymisedUserId:", v146);
    if (objc_msgSend(v151, "count"))
    {
      v181 = 0u;
      v182 = 0u;
      v179 = 0u;
      v180 = 0u;
      v110 = v151;
      v111 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v179, v185, 16);
      if (v111)
      {
        v112 = v111;
        v113 = *(_QWORD *)v180;
        do
        {
          for (i = 0; i != v112; ++i)
          {
            if (*(_QWORD *)v180 != v113)
              objc_enumerationMutation(v110);
            -[GEOPDBankTransactionInformation addOtherTransactionLocations:](v108, "addOtherTransactionLocations:", *(_QWORD *)(*((_QWORD *)&v179 + 1) + 8 * i));
          }
          v112 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v179, v185, 16);
        }
        while (v112);
      }

      v109 = 1;
      v61 = v83;
      v64 = v127;
      v66 = v106;
    }
    if (GEOConfigGetBOOL(GeoServicesConfig_Maps_133492, (uint64_t)off_1EDF4E1A8))
    {
      -[GEOPDBankTransactionInformation setBankTransactionDescription:](v108, "setBankTransactionDescription:", v131);
      v109 = 1;
    }
    if (v145)
    {
      objc_msgSend(v145, "doubleValue");
      -[GEOPDBankTransactionInformation setTransactionTimestamp:](v108, "setTransactionTimestamp:");
      v109 = 1;
    }
    if (v144)
    {
      -[GEOPDBankTransactionInformation setRawMerchantCode:](v108, "setRawMerchantCode:");
      v109 = 1;
    }
    if (v143)
    {
      -[GEOPDBankTransactionInformation setIndustryCategory:](v108, "setIndustryCategory:");
      v109 = 1;
    }
    if (v142)
    {
      -[GEOPDBankTransactionInformation setIndustryCode:](v108, "setIndustryCode:", (int)objc_msgSend(v142, "intValue"));
      v109 = 1;
    }
    if (v141)
    {
      -[GEOPDBankTransactionInformation setTransactionCurrencyCode:](v108, "setTransactionCurrencyCode:");
      v109 = 1;
    }
    if (objc_msgSend(v150, "count"))
    {
      v177 = 0u;
      v178 = 0u;
      v175 = 0u;
      v176 = 0u;
      v115 = v150;
      v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v175, v184, 16);
      if (v116)
      {
        v117 = v116;
        v118 = *(_QWORD *)v176;
        do
        {
          for (j = 0; j != v117; ++j)
          {
            if (*(_QWORD *)v176 != v118)
              objc_enumerationMutation(v115);
            -[GEOPDBankTransactionInformation addBaaCertificate:](v108, "addBaaCertificate:", *(_QWORD *)(*((_QWORD *)&v175 + 1) + 8 * j));
          }
          v117 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v175, v184, 16);
        }
        while (v117);
      }

      v109 = 1;
      v61 = v83;
      v64 = v127;
      v66 = v106;
    }
    if (v140)
    {
      -[GEOPDBankTransactionInformation setBaaSignature:](v108, "setBaaSignature:");
      v109 = 1;
    }
    if (v139)
    {
      -[GEOPDBankTransactionInformation setEnableBrandMuidFallback:](v108, "setEnableBrandMuidFallback:", objc_msgSend(v139, "BOOLValue"));
      v109 = 1;
    }
    if (v138)
    {
      -[GEOPDBankTransactionInformation setBankIdentifier:](v108, "setBankIdentifier:", v138);
      v109 = 1;
    }
    if (v137)
    {
      -[GEOPDBankTransactionInformation setBankTransactionDescriptionClean:](v108, "setBankTransactionDescriptionClean:");
      v109 = 1;
    }
    if (v136)
    {
      -[GEOPDBankTransactionInformation setPiiRedactionApplied:](v108, "setPiiRedactionApplied:", objc_msgSend(v136, "BOOLValue"));
      if (!v149)
        goto LABEL_138;
    }
    else if (!v149)
    {
      if (!v109)
        goto LABEL_139;
      goto LABEL_138;
    }
    -[GEOPDBankTransactionInformation setRotationPeriodsSinceEpoch:](v108, "setRotationPeriodsSinceEpoch:", objc_msgSend(v149, "intValue"));
LABEL_138:
    -[GEOPDMerchantLookupParameters setBankTransactionInformation:](v72, "setBankTransactionInformation:", v108);
LABEL_139:

    v60 = v126;
    v63 = v135;
LABEL_140:
    v120 = v69;

    v65 = v123;
    v62 = v125;
    v68 = v132;
    v67 = v133;
  }

  return v69;
}

- (GEOPDPlaceRequestParameters)initWithAirportCode:(id)a3 terminalCode:(id)a4 gateCode:(id)a5 traits:(id)a6
{
  id v9;
  id v10;
  id v11;
  GEOPDPlaceRequestParameters *v12;
  GEOPDAirportEntityPlaceLookupParameters *v13;
  GEOPDPlaceRequestParameters *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)GEOPDPlaceRequestParameters;
  v12 = -[GEOPDPlaceRequestParameters init](&v16, sel_init);
  if (v12)
  {
    v13 = objc_alloc_init(GEOPDAirportEntityPlaceLookupParameters);
    -[GEOPDAirportEntityPlaceLookupParameters setAirportCode:]((uint64_t)v13, v9);
    -[GEOPDAirportEntityPlaceLookupParameters setTerminalCode:]((uint64_t)v13, v10);
    -[GEOPDAirportEntityPlaceLookupParameters setGateCode:]((uint64_t)v13, v11);
    -[GEOPDPlaceRequestParameters setAirportEntityPlaceLookupParameters:]((uint64_t)v12, v13);
    v14 = v12;

  }
  return v12;
}

- (GEOPDPlaceRequestParameters)initWithExternalTransitStationCodes:(id)a3 sourceID:(id)a4 transactionDate:(id)a5 transactionLocation:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  GEOPDPlaceRequestParameters *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  GEOPDExternalTransitLookupParameters *v19;
  void *v20;
  double v21;
  void *v22;
  GEOPDPlaceRequestParameters *v23;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)GEOPDPlaceRequestParameters;
  v14 = -[GEOPDPlaceRequestParameters init](&v25, sel_init);
  if (v14)
  {
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "components:fromDate:", 124, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setMinute:", 15 * (objc_msgSend(v16, "minute") / 15));
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "dateFromComponents:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }
    v19 = objc_alloc_init(GEOPDExternalTransitLookupParameters);
    v20 = (void *)objc_msgSend(v10, "mutableCopy");
    -[GEOPDExternalTransitLookupParameters setExternalTransitStationCodes:]((uint64_t)v19, v20);

    -[GEOPDExternalTransitLookupParameters setSourceId:]((uint64_t)v19, v11);
    if (v18)
    {
      objc_msgSend(v18, "timeIntervalSinceReferenceDate");
      if (v19)
      {
        *(_BYTE *)&v19->_flags |= 0x20u;
        *(_BYTE *)&v19->_flags |= 1u;
        v19->_transactionTimestamp = v21;
      }
    }
    v22 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v22, "setTimestamp:", 0.0);
    objc_msgSend(v22, "setHasTimestamp:", 0);
    -[GEOPDExternalTransitLookupParameters setTransactionLocation:]((uint64_t)v19, v22);
    -[GEOPDPlaceRequestParameters setExternalTransitLookupParameters:]((uint64_t)v14, v19);
    v23 = v14;

  }
  return v14;
}

- (GEOPDPlaceRequestParameters)initWithReverseGeocodeCoordinate:(id)a3 preserveOriginalLocation:(BOOL)a4 floorOrdinal:(int)a5
{
  uint64_t v5;
  double var1;
  double var0;
  GEOPDPlaceRequestParameters *v9;
  GEOPDReverseGeocodingParameters *v10;
  GEOLocation *v11;
  GEOPDPlaceRequestParameters *v12;
  objc_super v14;

  v5 = *(_QWORD *)&a5;
  var1 = a3.var1;
  var0 = a3.var0;
  v14.receiver = self;
  v14.super_class = (Class)GEOPDPlaceRequestParameters;
  v9 = -[GEOPDPlaceRequestParameters init](&v14, sel_init);
  if (v9)
  {
    v10 = objc_alloc_init(GEOPDReverseGeocodingParameters);
    v11 = -[GEOLocation initWithGEOCoordinate:floorOrdinal:]([GEOLocation alloc], "initWithGEOCoordinate:floorOrdinal:", v5, var0, var1);
    -[GEOPDReverseGeocodingParameters addExtendedLocation:]((uint64_t)v10, v11);
    if (v10)
    {
      *(_BYTE *)&v10->_flags |= 0x20u;
      *(_BYTE *)&v10->_flags |= 2u;
      v10->_preserveOriginalLocation = a4;
    }
    -[GEOPDPlaceRequestParameters setReverseGeocodingParameters:]((uint64_t)v9, v10);
    v12 = v9;

  }
  return v9;
}

- (GEOPDPlaceRequestParameters)initWithReverseGeocodeCoordinate:(id)a3
{
  return -[GEOPDPlaceRequestParameters initWithReverseGeocodeCoordinate:preserveOriginalLocation:](self, "initWithReverseGeocodeCoordinate:preserveOriginalLocation:", 0, a3.var0, a3.var1);
}

- (GEOPDPlaceRequestParameters)initWithReverseGeocodeCoordinate:(id)a3 preserveOriginalLocation:(BOOL)a4
{
  return -[GEOPDPlaceRequestParameters initWithReverseGeocodeCoordinate:preserveOriginalLocation:floorOrdinal:](self, "initWithReverseGeocodeCoordinate:preserveOriginalLocation:floorOrdinal:", a4, 0x7FFFFFFFLL, a3.var0, a3.var1);
}

- (GEOPDPlaceRequestParameters)initWithBatchReverseGeocodeLocations:(id)a3 additionalPlaceTypes:(int *)a4 additionalPlaceTypesCount:(unint64_t)a5 traits:(id)a6
{
  id v9;
  GEOPDPlaceRequestParameters *v10;
  GEOPDBatchReverseGeocodingParameters *v11;
  void *v12;
  int v13;
  GEOPDPlaceRequestParameters *v14;
  objc_super v16;

  v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOPDPlaceRequestParameters;
  v10 = -[GEOPDPlaceRequestParameters init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_alloc_init(GEOPDBatchReverseGeocodingParameters);
    v12 = (void *)objc_msgSend(v9, "mutableCopy");
    -[GEOPDBatchReverseGeocodingParameters setAssetLocations:]((uint64_t)v11, v12);

    for (; a5; --a5)
    {
      v13 = *a4++;
      _PDPlaceTypeForMapItemPlaceType(v13);
      -[GEOPDBatchReverseGeocodingParameters addAdditionalPlaceType:]((uint64_t)v11);
    }
    -[GEOPDPlaceRequestParameters setBatchReverseGeocodingParameters:]((uint64_t)v10, v11);
    v14 = v10;

  }
  return v10;
}

- (GEOPDPlaceRequestParameters)initWithForwardGeocodeAddressString:(id)a3 maxResults:(unsigned int)a4 traits:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  GEOPDPlaceRequestParameters *v10;
  GEOPDGeocodingParameters *v11;
  GEOPDPlaceRequestParameters *v12;
  objc_super v14;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)GEOPDPlaceRequestParameters;
  v10 = -[GEOPDPlaceRequestParameters init](&v14, sel_init);
  if (v10)
  {
    v11 = -[GEOPDGeocodingParameters initWithForwardGeocodeAddressString:maxResults:traits:]([GEOPDGeocodingParameters alloc], "initWithForwardGeocodeAddressString:maxResults:traits:", v8, v6, v9);
    -[GEOPDPlaceRequestParameters setGeocodingParameters:]((uint64_t)v10, v11);
    v12 = v10;

  }
  return v10;
}

- (GEOPDPlaceRequestParameters)initWithMapItemToRefine:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  GEOPDPlaceRequestParameters *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "coordinate");
  v8 = -[GEOPDPlaceRequestParameters initWithMapItemToRefine:coordinate:traits:](self, "initWithMapItemToRefine:coordinate:traits:", v7, v6);

  return v8;
}

- (GEOPDPlaceRequestParameters)initWithPlaceRefinementParameters:(id)a3 traits:(id)a4
{
  id v5;
  GEOPDPlaceRequestParameters *v6;
  GEOPDPlaceRequestParameters *v7;
  GEOPDPlaceRequestParameters *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOPDPlaceRequestParameters;
  v6 = -[GEOPDPlaceRequestParameters init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[GEOPDPlaceRequestParameters setPlaceRefinementParameters:]((uint64_t)v6, v5);
    v8 = v7;
  }

  return v7;
}

- (GEOPDPlaceRequestParameters)initWithVendorSpecificPlaceRefinementParameters:(id)a3 traits:(id)a4
{
  id v5;
  GEOPDPlaceRequestParameters *v6;
  GEOPDPlaceRequestParameters *v7;
  GEOPDPlaceRequestParameters *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOPDPlaceRequestParameters;
  v6 = -[GEOPDPlaceRequestParameters init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[GEOPDPlaceRequestParameters setVendorSpecificPlaceRefinementParameters:]((uint64_t)v6, v5);
    v8 = v7;
  }

  return v7;
}

- (GEOPDPlaceRequestParameters)initWithCanonicalLocationSearchQueryString:(id)a3
{
  id v4;
  GEOPDPlaceRequestParameters *v5;
  GEOPDCanonicalLocationSearchParameters *v6;
  GEOPDPlaceRequestParameters *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOPDPlaceRequestParameters;
  v5 = -[GEOPDPlaceRequestParameters init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(GEOPDCanonicalLocationSearchParameters);
    -[GEOPDCanonicalLocationSearchParameters setQueryString:]((uint64_t)v6, v4);
    -[GEOPDPlaceRequestParameters setCanonicalLocationSearchParameters:]((uint64_t)v5, v6);
    v7 = v5;

  }
  return v5;
}

- (GEOPDPlaceRequestParameters)initWithBrandMUID:(unint64_t)a3 traits:(id)a4
{
  id v6;
  GEOPDPlaceRequestParameters *v7;
  GEOPDSBrandFilter *v8;
  GEOPDSBrandFilter *v9;
  GEOPDSSearchFilter *v10;
  GEOPDSearchParameters *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GEOPDPlaceRequestParameters;
  v7 = -[GEOPDPlaceRequestParameters init](&v15, sel_init);
  if (v7)
  {
    v8 = objc_alloc_init(GEOPDSBrandFilter);
    v9 = v8;
    if (v8)
    {
      *(_BYTE *)&v8->_flags |= 1u;
      v8->_brandMuid = a3;
    }
    v10 = objc_alloc_init(GEOPDSSearchFilter);
    -[GEOPDSSearchFilter setBrandFilter:]((uint64_t)v10, v9);
    v11 = objc_alloc_init(GEOPDSearchParameters);
    -[GEOPDSearchParameters setSearchFilter:]((uint64_t)v11, v10);
    +[GEOPDViewportInfo viewportInfoForTraits:](GEOPDViewportInfo, "viewportInfoForTraits:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSearchParameters setViewportInfo:]((uint64_t)v11, v12);

    +[GEOPDETAFilter etaFilterForTraits:](GEOPDETAFilter, "etaFilterForTraits:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSearchParameters setEtaFilter:]((uint64_t)v11, v13);

    -[GEOPDPlaceRequestParameters setSearchParameters:]((uint64_t)v7, v11);
  }

  return v7;
}

- (GEOPDPlaceRequestParameters)initWithSearchQuery:(id)a3 entryMetadata:(id)a4 metadata:(id)a5 autocompleteEntry:(id)a6 retainedSearch:(id)a7 maxResults:(unsigned int)a8 filters:(id)a9 traits:(id)a10 routeInfo:(id)a11 error:(id *)a12 searchSessionData:(id)a13
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  GEOPDPlaceRequestParameters *v26;
  GEOPDSearchParameters *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  GEOPDPlaceRequestParameters *v33;
  id v35;
  id v36;
  id v37;
  id v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a13;
  v47.receiver = self;
  v47.super_class = (Class)GEOPDPlaceRequestParameters;
  v26 = -[GEOPDPlaceRequestParameters init](&v47, sel_init);
  v41 = v23;
  v42 = v22;
  if (v26)
  {
    v40 = v17;
    v36 = v19;
    v37 = v18;
    v35 = v20;
    v27 = -[GEOPDSearchParameters initWithSearchQuery:entryMetadata:metadata:autocompleteEntry:retainedSearch:maxResults:traits:routeInfo:searchSessionData:]([GEOPDSearchParameters alloc], "initWithSearchQuery:entryMetadata:metadata:autocompleteEntry:retainedSearch:maxResults:traits:routeInfo:searchSessionData:", v17, v18, v19, v20, v21, a8, v23, v24, v25);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v28 = v22;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v44;
      while (2)
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v44 != v31)
            objc_enumerationMutation(v28);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "applyToSearchParameters:error:", v27, a12))
          {

            v33 = 0;
            goto LABEL_12;
          }
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
        if (v30)
          continue;
        break;
      }
    }

    -[GEOPDPlaceRequestParameters setSearchParameters:]((uint64_t)v26, v27);
    v33 = v26;
LABEL_12:

    v17 = v40;
    v19 = v36;
    v18 = v37;
    v20 = v35;
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (GEOPDPlaceRequestParameters)initWithSearchURLQuery:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  GEOPDPlaceRequestParameters *v8;
  GEOPDPlaceRefinementParameters *v9;
  GEOPDPlaceRequestParameters *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOPDPlaceRequestParameters;
  v8 = -[GEOPDPlaceRequestParameters init](&v12, sel_init);
  if (v8)
  {
    v9 = -[GEOPDPlaceRefinementParameters initWithSearchURLQuery:identifier:]([GEOPDPlaceRefinementParameters alloc], "initWithSearchURLQuery:identifier:", v6, v7);
    -[GEOPDPlaceRequestParameters setPlaceRefinementParameters:]((uint64_t)v8, v9);
    v10 = v8;

  }
  return v8;
}

- (GEOPDPlaceRequestParameters)initWithSearchURLQuery:(id)a3 coordinate:(id)a4 muid:(unint64_t)a5 resultProviderId:(int)a6 contentProvider:(id)a7
{
  uint64_t v8;
  double var1;
  double var0;
  id v13;
  id v14;
  GEOPDPlaceRequestParameters *v15;
  GEOPDVendorSpecificPlaceRefinementParameters *v16;
  GEOPDPlaceRequestParameters *v17;
  objc_super v19;

  v8 = *(_QWORD *)&a6;
  var1 = a4.var1;
  var0 = a4.var0;
  v13 = a3;
  v14 = a7;
  v19.receiver = self;
  v19.super_class = (Class)GEOPDPlaceRequestParameters;
  v15 = -[GEOPDPlaceRequestParameters init](&v19, sel_init);
  if (v15)
  {
    v16 = -[GEOPDVendorSpecificPlaceRefinementParameters initWithSearchURLQuery:coordinate:muid:resultProviderId:contentProvider:]([GEOPDVendorSpecificPlaceRefinementParameters alloc], "initWithSearchURLQuery:coordinate:muid:resultProviderId:contentProvider:", v13, a5, v8, v14, var0, var1);
    -[GEOPDPlaceRequestParameters setVendorSpecificPlaceRefinementParameters:]((uint64_t)v15, v16);
    v17 = v15;

  }
  return v15;
}

- (GEOPDPlaceRequestParameters)initWithSearchURLQuery:(id)a3 coordinate:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6
{
  uint64_t v7;
  double var1;
  double var0;
  id v11;
  id v12;
  GEOPDPlaceRequestParameters *v13;
  GEOPDLocationDirectedSearchParameters *v14;
  GEOPDPlaceRequestParameters *v15;
  objc_super v17;

  v7 = *(_QWORD *)&a5;
  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a3;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)GEOPDPlaceRequestParameters;
  v13 = -[GEOPDPlaceRequestParameters init](&v17, sel_init);
  if (v13)
  {
    v14 = -[GEOPDLocationDirectedSearchParameters initWithSearchURLQuery:coordinate:maxResults:traits:]([GEOPDLocationDirectedSearchParameters alloc], "initWithSearchURLQuery:coordinate:maxResults:traits:", v11, v7, v12, var0, var1);
    -[GEOPDPlaceRequestParameters setLocationDirectedSearchParameters:]((uint64_t)v13, v14);
    v15 = v13;

  }
  return v13;
}

- (void)clearLocations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (self)
  {
    -[GEOPDPlaceRequestParameters _readBatchReverseGeocodingParameters]((uint64_t)self);
    if (self->_batchReverseGeocodingParameters)
    {
      v3 = (void *)objc_opt_new();
      -[GEOPDPlaceRequestParameters batchReverseGeocodingParameters]((id *)&self->super.super.isa);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDBatchReverseGeocodingParameters setAssetLocations:]((uint64_t)v4, v3);

    }
    -[GEOPDPlaceRequestParameters _readExternalTransitLookupParameters]((uint64_t)self);
    if (self->_externalTransitLookupParameters)
    {
      -[GEOPDPlaceRequestParameters externalTransitLookupParameters]((id *)&self->super.super.isa);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDExternalTransitLookupParameters setTransactionLocation:]((uint64_t)v5, 0);

    }
    -[GEOPDPlaceRequestParameters _readFeatureIdGeocodingParameters]((uint64_t)self);
    if (self->_featureIdGeocodingParameters)
    {
      -[GEOPDPlaceRequestParameters featureIdGeocodingParameters]((id *)&self->super.super.isa);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDFeatureIdGeocodingParameters setLocation:]((uint64_t)v6, 0);

    }
    -[GEOPDPlaceRequestParameters _readLocationDirectedSearchParameters]((uint64_t)self);
    if (self->_locationDirectedSearchParameters)
    {
      -[GEOPDPlaceRequestParameters locationDirectedSearchParameters]((id *)&self->super.super.isa);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDLocationDirectedSearchParameters setSearchLocation:]((uint64_t)v7, 0);

    }
    -[GEOPDPlaceRequestParameters _readMerchantLookupParameters]((uint64_t)self);
    if (self->_merchantLookupParameters)
    {
      -[GEOPDPlaceRequestParameters merchantLookupParameters]((id *)&self->super.super.isa);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTransactionLocation:", 0);

    }
    -[GEOPDPlaceRequestParameters _readSearchZeroKeywordCategorySuggestionParameters]((uint64_t)self);
    if (self->_searchZeroKeywordCategorySuggestionParameters)
    {
      -[GEOPDPlaceRequestParameters searchZeroKeywordCategorySuggestionParameters]((id *)&self->super.super.isa);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDSearchZeroKeywordCategorySuggestionParameters setSignificantLocation:]((uint64_t)v9, 0);

    }
    -[GEOPDPlaceRequestParameters _readVendorSpecificPlaceRefinementParameters]((uint64_t)self);
    if (self->_vendorSpecificPlaceRefinementParameters)
    {
      -[GEOPDPlaceRequestParameters vendorSpecificPlaceRefinementParameters]((id *)&self->super.super.isa);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDVendorSpecificPlaceRefinementParameters setLocationHint:]((uint64_t)v10, 0);

    }
    -[GEOPDPlaceRequestParameters _readSearchParameters]((uint64_t)self);
    if (self->_searchParameters)
      -[GEOPDPlaceRequestParameters setSearchParameters:]((uint64_t)self, 0);
  }
}

@end
