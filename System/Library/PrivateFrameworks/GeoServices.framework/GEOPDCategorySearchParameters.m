@implementation GEOPDCategorySearchParameters

- (GEOPDCategorySearchParameters)init
{
  GEOPDCategorySearchParameters *v2;
  GEOPDCategorySearchParameters *v3;
  GEOPDCategorySearchParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDCategorySearchParameters;
  v2 = -[GEOPDCategorySearchParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDCategorySearchParameters)initWithData:(id)a3
{
  GEOPDCategorySearchParameters *v3;
  GEOPDCategorySearchParameters *v4;
  GEOPDCategorySearchParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDCategorySearchParameters;
  v3 = -[GEOPDCategorySearchParameters initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEOPDCategorySearchParameters;
  -[GEOPDCategorySearchParameters dealloc](&v3, sel_dealloc);
}

- (void)_readViewportInfo
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
  if ((*(_BYTE *)(a1 + 291) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDCategorySearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readViewportInfo_tags_1875);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 288) |= 0x8000000u;
    *(_DWORD *)(a1 + 288) |= 0x10000000u;
    objc_storeStrong((id *)(a1 + 240), a2);
  }

}

- (void)setSuggestionEntryMetadata:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 288) |= 0x4000000u;
    *(_DWORD *)(a1 + 288) |= 0x10000000u;
    objc_storeStrong((id *)(a1 + 232), a2);
  }

}

- (void)setRecentRouteInfo:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 288) |= 0x100000u;
    *(_DWORD *)(a1 + 288) |= 0x10000000u;
    objc_storeStrong((id *)(a1 + 184), a2);
  }

}

- (void)setEvChargingParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 288) |= 0x20000u;
    *(_DWORD *)(a1 + 288) |= 0x10000000u;
    objc_storeStrong((id *)(a1 + 160), a2);
  }

}

- (void)_readSupportedRelatedEntitySectionTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 289) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedRelatedEntitySectionTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (void)addSupportedRelatedEntitySectionType:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    -[GEOPDCategorySearchParameters _readSupportedRelatedEntitySectionTypes]((uint64_t)a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    a1[72]._os_unfair_lock_opaque |= 0x1000u;
    os_unfair_lock_unlock(a1 + 64);
    a1[72]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_readEtaFilter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 290) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEtaFilter_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (id)etaFilter
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDCategorySearchParameters _readEtaFilter]((uint64_t)a1);
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
    *(_DWORD *)(a1 + 288) |= 0x10000u;
    *(_DWORD *)(a1 + 288) |= 0x10000000u;
    objc_storeStrong((id *)(a1 + 152), a2);
  }

}

- (void)_readSupportedSearchTierTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 289) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedSearchTierTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (void)addSupportedSearchTierType:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    -[GEOPDCategorySearchParameters _readSupportedSearchTierTypes]((uint64_t)a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    a1[72]._os_unfair_lock_opaque |= 0x4000u;
    os_unfair_lock_unlock(a1 + 64);
    a1[72]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_readResultRefinementQuery
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
  if ((*(_BYTE *)(a1 + 290) & 0x20) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDCategorySearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResultRefinementQuery_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
}

- (void)setResultRefinementQuery:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 288) |= 0x200000u;
    *(_DWORD *)(a1 + 288) |= 0x10000000u;
    objc_storeStrong((id *)(a1 + 192), a2);
  }

}

- (void)_readKnownRefinementTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 289) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readKnownRefinementTypes_tags_1877);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (void)addKnownRefinementType:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    -[GEOPDCategorySearchParameters _readKnownRefinementTypes]((uint64_t)a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    a1[72]._os_unfair_lock_opaque |= 0x400u;
    os_unfair_lock_unlock(a1 + 64);
    a1[72]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_readPreviousSearchViewport
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
  if ((*(_BYTE *)(a1 + 290) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDCategorySearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPreviousSearchViewport_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
}

- (void)setPreviousSearchViewport:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 288) |= 0x80000u;
    *(_DWORD *)(a1 + 288) |= 0x10000000u;
    objc_storeStrong((id *)(a1 + 176), a2);
  }

}

- (void)_readSupportedPlaceSummaryFormatTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 289) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedPlaceSummaryFormatTypes_tags_1878);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (void)addSupportedPlaceSummaryFormatType:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    -[GEOPDCategorySearchParameters _readSupportedPlaceSummaryFormatTypes]((uint64_t)a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    a1[72]._os_unfair_lock_opaque |= 0x800u;
    os_unfair_lock_unlock(a1 + 64);
    a1[72]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_readSupportedSearchSectionTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 289) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCategorySearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedSearchSectionTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

- (void)addSupportedSearchSectionType:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    -[GEOPDCategorySearchParameters _readSupportedSearchSectionTypes]((uint64_t)a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    a1[72]._os_unfair_lock_opaque |= 0x2000u;
    os_unfair_lock_unlock(a1 + 64);
    a1[72]._os_unfair_lock_opaque |= 0x10000000u;
  }
}

- (void)_readSearchOriginationInfo
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
  if ((*(_BYTE *)(a1 + 290) & 0x80) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDCategorySearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchOriginationInfo_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
}

- (void)setSearchOriginationInfo:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 288) |= 0x800000u;
    *(_DWORD *)(a1 + 288) |= 0x10000000u;
    objc_storeStrong((id *)(a1 + 208), a2);
  }

}

- (void)setEnrichmentCampaignNamespace:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_DWORD *)(a1 + 288) |= 0x8000u;
  *(_DWORD *)(a1 + 288) |= 0x10000000u;
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    if ((*(_BYTE *)(a1 + 290) & 0x40) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDCategorySearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchEnrichmentRevisionMetadatas_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
    -[GEOPDCategorySearchParameters _addNoFlagsSearchEnrichmentRevisionMetadata:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 288) |= 0x400000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
    *(_DWORD *)(a1 + 288) |= 0x10000000u;
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
    v4 = *(void **)(a1 + 200);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 200);
      *(_QWORD *)(a1 + 200) = v5;

      v4 = *(void **)(a1 + 200);
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
    *(_DWORD *)(a1 + 288) |= 0x1000000u;
    *(_DWORD *)(a1 + 288) |= 0x10000000u;
    objc_storeStrong((id *)(a1 + 216), a2);
  }

}

- (void)setSessionUserActionMetadata:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_DWORD *)(a1 + 288) |= 0x2000000u;
    *(_DWORD *)(a1 + 288) |= 0x10000000u;
    objc_storeStrong((id *)(a1 + 224), a2);
  }

}

- (void)setPaginationParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_DWORD *)(a1 + 288) |= 0x40000u;
  *(_DWORD *)(a1 + 288) |= 0x10000000u;
  objc_storeStrong((id *)(a1 + 168), a2);

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
  v8.super_class = (Class)GEOPDCategorySearchParameters;
  -[GEOPDCategorySearchParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDCategorySearchParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDCategorySearchParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  const __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  __CFString *v22;
  const __CFString *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  id v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  id v39;
  void *v40;
  _QWORD *v41;
  unint64_t v42;
  uint64_t v43;
  __CFString *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  const __CFString *v49;
  id v50;
  void *v51;
  _QWORD *v52;
  unint64_t v53;
  uint64_t v54;
  __CFString *v55;
  const __CFString *v56;
  void *v57;
  const __CFString *v58;
  id v59;
  void *v60;
  void *v61;
  const __CFString *v62;
  id v63;
  void *v64;
  _QWORD *v65;
  unint64_t v66;
  uint64_t v67;
  __CFString *v68;
  const __CFString *v69;
  uint64_t v70;
  __CFString *v71;
  const __CFString *v72;
  id v73;
  void *v74;
  void *v75;
  const __CFString *v76;
  id v77;
  void *v78;
  _QWORD *v79;
  unint64_t v80;
  uint64_t v81;
  __CFString *v82;
  const __CFString *v83;
  void *v84;
  _QWORD *v85;
  unint64_t v86;
  uint64_t v87;
  __CFString *v88;
  const __CFString *v89;
  int v90;
  void *v91;
  const __CFString *v92;
  void *v93;
  const __CFString *v94;
  id v95;
  void *v96;
  void *v97;
  const __CFString *v98;
  id v99;
  void *v100;
  id v101;
  id v102;
  const __CFString *v103;
  void *v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t i;
  void *v109;
  id v110;
  const __CFString *v111;
  void *v112;
  id v113;
  id v114;
  void *v115;
  void *v116;
  const __CFString *v117;
  id v118;
  void *v119;
  id v120;
  id v121;
  void *v122;
  void *v123;
  const __CFString *v124;
  id v125;
  void *v126;
  id v127;
  id v128;
  void *v129;
  void *v130;
  const __CFString *v131;
  id v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  id v137;
  id v138;
  id v139;
  void *v141;
  _QWORD v142[4];
  id v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  _BYTE v148[128];
  uint64_t v149;

  v149 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDCategorySearchParameters readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 288) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 272));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v5 = CFSTR("maxResults");
    else
      v5 = CFSTR("max_results");
    objc_msgSend(v141, "setObject:forKey:", v4, v5);

  }
  -[GEOPDCategorySearchParameters _readViewportInfo](a1);
  v6 = *(id *)(a1 + 240);
  v7 = v6;
  if (v6)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v6, "jsonRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("viewportInfo");
    }
    else
    {
      objc_msgSend(v6, "dictionaryRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("viewport_info");
    }
    v10 = v8;

    objc_msgSend(v141, "setObject:forKey:", v10, v9);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
  if ((*(_BYTE *)(a1 + 291) & 4) == 0)
  {
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = v11;
      objc_sync_enter(v12);
      GEOPDCategorySearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSuggestionEntryMetadata_tags);
      objc_sync_exit(v12);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  v13 = *(id *)(a1 + 232);
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "setObject:forKey:", v15, CFSTR("suggestionEntryMetadata"));

    }
    else
    {
      objc_msgSend(v141, "setObject:forKey:", v13, CFSTR("suggestion_entry_metadata"));
    }
  }

  v16 = *(_DWORD *)(a1 + 288);
  if ((v16 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 264));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v18 = CFSTR("blurredHourOfDay");
    else
      v18 = CFSTR("blurred_hour_of_day");
    objc_msgSend(v141, "setObject:forKey:", v17, v18);

    v16 = *(_DWORD *)(a1 + 288);
  }
  if ((v16 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 268));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v20 = CFSTR("dayOfWeek");
    else
      v20 = CFSTR("day_of_week");
    objc_msgSend(v141, "setObject:forKey:", v19, v20);

    v16 = *(_DWORD *)(a1 + 288);
  }
  if ((v16 & 0x20) != 0)
  {
    v21 = *(int *)(a1 + 280);
    if (v21 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 280));
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E1C04A28[v21];
    }
    if (a2)
      v23 = CFSTR("searchType");
    else
      v23 = CFSTR("search_type");
    objc_msgSend(v141, "setObject:forKey:", v22, v23);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
  if ((*(_BYTE *)(a1 + 290) & 0x10) == 0)
  {
    v24 = *(void **)(a1 + 8);
    if (v24)
    {
      v25 = v24;
      objc_sync_enter(v25);
      GEOPDCategorySearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRecentRouteInfo_tags);
      objc_sync_exit(v25);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  v26 = *(id *)(a1 + 184);
  v27 = v26;
  if (v26)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v26, "jsonRepresentation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("recentRouteInfo");
    }
    else
    {
      objc_msgSend(v26, "dictionaryRepresentation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("recent_route_info");
    }
    v30 = v28;

    objc_msgSend(v141, "setObject:forKey:", v30, v29);
  }

  if ((*(_BYTE *)(a1 + 288) & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 284));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v32 = CFSTR("supportCategorySearchResultSection");
    else
      v32 = CFSTR("support_category_search_result_section");
    objc_msgSend(v141, "setObject:forKey:", v31, v32);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
  if ((*(_BYTE *)(a1 + 290) & 2) == 0)
  {
    v33 = *(void **)(a1 + 8);
    if (v33)
    {
      v34 = v33;
      objc_sync_enter(v34);
      GEOPDCategorySearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEvChargingParameters_tags_1876);
      objc_sync_exit(v34);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  v35 = *(id *)(a1 + 160);
  v36 = v35;
  if (v35)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v35, "jsonRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("evChargingParameters");
    }
    else
    {
      objc_msgSend(v35, "dictionaryRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("ev_charging_parameters");
    }
    v39 = v37;

    objc_msgSend(v141, "setObject:forKey:", v39, v38);
  }

  if (*(_QWORD *)(a1 + 80))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (_QWORD *)(a1 + 72);
    if (*(_QWORD *)(a1 + 80))
    {
      v42 = 0;
      do
      {
        v43 = *(unsigned int *)(*v41 + 4 * v42);
        if ((_DWORD)v43)
        {
          if ((_DWORD)v43 == 1)
          {
            v44 = CFSTR("RELATED_ENTITY_SECTION_TYPE_COLLECTION");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v43);
            v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v44 = CFSTR("RELATED_ENTITY_SECTION_TYPE_UNKNOWN");
        }
        objc_msgSend(v40, "addObject:", v44);

        ++v42;
        v41 = (_QWORD *)(a1 + 72);
      }
      while (v42 < *(_QWORD *)(a1 + 80));
    }
    if (a2)
      v45 = CFSTR("supportedRelatedEntitySectionType");
    else
      v45 = CFSTR("supported_related_entity_section_type");
    objc_msgSend(v141, "setObject:forKey:", v40, v45);

  }
  -[GEOPDCategorySearchParameters etaFilter]((id *)a1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (v46)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v46, "jsonRepresentation");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = CFSTR("etaFilter");
    }
    else
    {
      objc_msgSend(v46, "dictionaryRepresentation");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = CFSTR("eta_filter");
    }
    v50 = v48;

    objc_msgSend(v141, "setObject:forKey:", v50, v49);
  }

  if (*(_QWORD *)(a1 + 128))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (_QWORD *)(a1 + 120);
    if (*(_QWORD *)(a1 + 128))
    {
      v53 = 0;
      do
      {
        v54 = *(int *)(*v52 + 4 * v53);
        if (v54 >= 3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v54);
          v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v55 = off_1E1C04F40[v54];
        }
        objc_msgSend(v51, "addObject:", v55);

        ++v53;
        v52 = (_QWORD *)(a1 + 120);
      }
      while (v53 < *(_QWORD *)(a1 + 128));
    }
    if (a2)
      v56 = CFSTR("supportedSearchTierType");
    else
      v56 = CFSTR("supported_search_tier_type");
    objc_msgSend(v141, "setObject:forKey:", v51, v56);

  }
  if ((*(_BYTE *)(a1 + 288) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 260));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v58 = CFSTR("auxiliaryTierNumResults");
    else
      v58 = CFSTR("auxiliary_tier_num_results");
    objc_msgSend(v141, "setObject:forKey:", v57, v58);

  }
  -[GEOPDCategorySearchParameters _readResultRefinementQuery](a1);
  v59 = *(id *)(a1 + 192);
  v60 = v59;
  if (v59)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v59, "jsonRepresentation");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = CFSTR("resultRefinementQuery");
    }
    else
    {
      objc_msgSend(v59, "dictionaryRepresentation");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = CFSTR("result_refinement_query");
    }
    v63 = v61;

    objc_msgSend(v141, "setObject:forKey:", v63, v62);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v66 = 0;
      do
      {
        v67 = *(int *)(*v65 + 4 * v66);
        if (v67 >= 7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v67);
          v68 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v68 = off_1E1C04F58[v67];
        }
        objc_msgSend(v64, "addObject:", v68);

        ++v66;
        v65 = (_QWORD *)(a1 + 24);
      }
      while (v66 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v69 = CFSTR("knownRefinementType");
    else
      v69 = CFSTR("known_refinement_type");
    objc_msgSend(v141, "setObject:forKey:", v64, v69);

  }
  if ((*(_BYTE *)(a1 + 288) & 0x10) != 0)
  {
    v70 = *(int *)(a1 + 276);
    if (v70 >= 0x24)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 276));
      v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v71 = off_1E1C04F90[v70];
    }
    if (a2)
      v72 = CFSTR("placeSummaryRevision");
    else
      v72 = CFSTR("place_summary_revision");
    objc_msgSend(v141, "setObject:forKey:", v71, v72);

  }
  -[GEOPDCategorySearchParameters _readPreviousSearchViewport](a1);
  v73 = *(id *)(a1 + 176);
  v74 = v73;
  if (v73)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v73, "jsonRepresentation");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = CFSTR("previousSearchViewport");
    }
    else
    {
      objc_msgSend(v73, "dictionaryRepresentation");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = CFSTR("previous_search_viewport");
    }
    v77 = v75;

    objc_msgSend(v141, "setObject:forKey:", v77, v76);
  }

  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = (_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 56))
    {
      v80 = 0;
      do
      {
        v81 = *(int *)(*v79 + 4 * v80);
        if (v81 >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v81);
          v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v82 = off_1E1C050B0[v81];
        }
        objc_msgSend(v78, "addObject:", v82);

        ++v80;
        v79 = (_QWORD *)(a1 + 48);
      }
      while (v80 < *(_QWORD *)(a1 + 56));
    }
    if (a2)
      v83 = CFSTR("supportedPlaceSummaryFormatType");
    else
      v83 = CFSTR("supported_place_summary_format_type");
    objc_msgSend(v141, "setObject:forKey:", v78, v83);

  }
  if (*(_QWORD *)(a1 + 104))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = (_QWORD *)(a1 + 96);
    if (*(_QWORD *)(a1 + 104))
    {
      v86 = 0;
      do
      {
        v87 = *(int *)(*v85 + 4 * v86);
        if (v87 >= 3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v87);
          v88 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v88 = off_1E1C050D8[v87];
        }
        objc_msgSend(v84, "addObject:", v88);

        ++v86;
        v85 = (_QWORD *)(a1 + 96);
      }
      while (v86 < *(_QWORD *)(a1 + 104));
    }
    if (a2)
      v89 = CFSTR("supportedSearchSectionType");
    else
      v89 = CFSTR("supported_search_section_type");
    objc_msgSend(v141, "setObject:forKey:", v84, v89);

  }
  v90 = *(_DWORD *)(a1 + 288);
  if ((v90 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 285));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v92 = CFSTR("supportSearchEnrichment");
    else
      v92 = CFSTR("support_search_enrichment");
    objc_msgSend(v141, "setObject:forKey:", v91, v92);

    v90 = *(_DWORD *)(a1 + 288);
  }
  if ((v90 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 286));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v94 = CFSTR("supportStructuredRapAffordance");
    else
      v94 = CFSTR("support_structured_rap_affordance");
    objc_msgSend(v141, "setObject:forKey:", v93, v94);

  }
  -[GEOPDCategorySearchParameters _readSearchOriginationInfo](a1);
  v95 = *(id *)(a1 + 208);
  v96 = v95;
  if (v95)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v95, "jsonRepresentation");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = CFSTR("searchOriginationInfo");
    }
    else
    {
      objc_msgSend(v95, "dictionaryRepresentation");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = CFSTR("search_origination_info");
    }
    v99 = v97;

    objc_msgSend(v141, "setObject:forKey:", v99, v98);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
  if ((*(_BYTE *)(a1 + 289) & 0x80) == 0)
  {
    v100 = *(void **)(a1 + 8);
    if (v100)
    {
      v101 = v100;
      objc_sync_enter(v101);
      GEOPDCategorySearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEnrichmentCampaignNamespace_tags);
      objc_sync_exit(v101);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  v102 = *(id *)(a1 + 144);
  if (v102)
  {
    if (a2)
      v103 = CFSTR("enrichmentCampaignNamespace");
    else
      v103 = CFSTR("enrichment_campaign_namespace");
    objc_msgSend(v141, "setObject:forKey:", v102, v103);
  }

  if (objc_msgSend(*(id *)(a1 + 200), "count"))
  {
    v104 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 200), "count"));
    v144 = 0u;
    v145 = 0u;
    v146 = 0u;
    v147 = 0u;
    v105 = *(id *)(a1 + 200);
    v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v144, v148, 16);
    if (v106)
    {
      v107 = *(_QWORD *)v145;
      do
      {
        for (i = 0; i != v106; ++i)
        {
          if (*(_QWORD *)v145 != v107)
            objc_enumerationMutation(v105);
          v109 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v109, "jsonRepresentation");
          else
            objc_msgSend(v109, "dictionaryRepresentation");
          v110 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v104, "addObject:", v110);
        }
        v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v144, v148, 16);
      }
      while (v106);
    }

    if (a2)
      v111 = CFSTR("searchEnrichmentRevisionMetadata");
    else
      v111 = CFSTR("search_enrichment_revision_metadata");
    objc_msgSend(v141, "setObject:forKey:", v104, v111);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
  if ((*(_BYTE *)(a1 + 291) & 1) == 0)
  {
    v112 = *(void **)(a1 + 8);
    if (v112)
    {
      v113 = v112;
      objc_sync_enter(v113);
      GEOPDCategorySearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchSessionData_tags);
      objc_sync_exit(v113);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  v114 = *(id *)(a1 + 216);
  v115 = v114;
  if (v114)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v114, "jsonRepresentation");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = CFSTR("searchSessionData");
    }
    else
    {
      objc_msgSend(v114, "dictionaryRepresentation");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = CFSTR("search_session_data");
    }
    v118 = v116;

    objc_msgSend(v141, "setObject:forKey:", v118, v117);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
  if ((*(_BYTE *)(a1 + 291) & 2) == 0)
  {
    v119 = *(void **)(a1 + 8);
    if (v119)
    {
      v120 = v119;
      objc_sync_enter(v120);
      GEOPDCategorySearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSessionUserActionMetadata_tags);
      objc_sync_exit(v120);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  v121 = *(id *)(a1 + 224);
  v122 = v121;
  if (v121)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v121, "jsonRepresentation");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = CFSTR("sessionUserActionMetadata");
    }
    else
    {
      objc_msgSend(v121, "dictionaryRepresentation");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = CFSTR("session_user_action_metadata");
    }
    v125 = v123;

    objc_msgSend(v141, "setObject:forKey:", v125, v124);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
  if ((*(_BYTE *)(a1 + 290) & 4) == 0)
  {
    v126 = *(void **)(a1 + 8);
    if (v126)
    {
      v127 = v126;
      objc_sync_enter(v127);
      GEOPDCategorySearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPaginationParameters_tags);
      objc_sync_exit(v127);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  v128 = *(id *)(a1 + 168);
  v129 = v128;
  if (v128)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v128, "jsonRepresentation");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = CFSTR("paginationParameters");
    }
    else
    {
      objc_msgSend(v128, "dictionaryRepresentation");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = CFSTR("pagination_parameters");
    }
    v132 = v130;

    objc_msgSend(v141, "setObject:forKey:", v132, v131);
  }

  v133 = *(void **)(a1 + 16);
  if (v133)
  {
    objc_msgSend(v133, "dictionaryRepresentation");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = v134;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v134, "count"));
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v142[0] = MEMORY[0x1E0C809B0];
      v142[1] = 3221225472;
      v142[2] = __59__GEOPDCategorySearchParameters__dictionaryRepresentation___block_invoke;
      v142[3] = &unk_1E1C00600;
      v137 = v136;
      v143 = v137;
      objc_msgSend(v135, "enumerateKeysAndObjectsUsingBlock:", v142);
      v138 = v137;

    }
    else
    {
      v138 = v134;
    }
    objc_msgSend(v141, "setObject:forKey:", v138, CFSTR("Unknown Fields"));

  }
  v139 = v141;

  return v139;
}

- (id)jsonRepresentation
{
  return -[GEOPDCategorySearchParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_1963;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1964;
      GEOPDCategorySearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDCategorySearchParametersCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 256));
  }
}

void __59__GEOPDCategorySearchParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDCategorySearchParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $B1EDBE28F93122CC43DE0324E96A3F6C flags;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  $B1EDBE28F93122CC43DE0324E96A3F6C v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  PBDataReader *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDCategorySearchParametersIsDirty((uint64_t)self) & 1) == 0)
  {
    v17 = self->_reader;
    objc_sync_enter(v17);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v18);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v17);
    goto LABEL_70;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDCategorySearchParameters readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_viewportInfo)
    PBDataWriterWriteSubmessage();
  if (self->_suggestionEntryMetadata)
    PBDataWriterWriteDataField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) == 0)
  {
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_11;
LABEL_67:
    PBDataWriterWriteUint32Field();
    if ((*(_DWORD *)&self->_flags & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  PBDataWriterWriteUint32Field();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) != 0)
    goto LABEL_67;
LABEL_11:
  if ((*(_BYTE *)&flags & 0x20) != 0)
LABEL_12:
    PBDataWriterWriteInt32Field();
LABEL_13:
  if (self->_recentRouteInfo)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_evChargingParameters)
    PBDataWriterWriteSubmessage();
  if (self->_supportedRelatedEntitySectionTypes.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v7;
    }
    while (v7 < self->_supportedRelatedEntitySectionTypes.count);
  }
  if (self->_etaFilter)
    PBDataWriterWriteSubmessage();
  if (self->_supportedSearchTierTypes.count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v8;
    }
    while (v8 < self->_supportedSearchTierTypes.count);
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_resultRefinementQuery)
    PBDataWriterWriteSubmessage();
  if (self->_knownRefinementTypes.count)
  {
    v9 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v9;
    }
    while (v9 < self->_knownRefinementTypes.count);
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_previousSearchViewport)
    PBDataWriterWriteSubmessage();
  if (self->_supportedPlaceSummaryFormatTypes.count)
  {
    v10 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v10;
    }
    while (v10 < self->_supportedPlaceSummaryFormatTypes.count);
  }
  if (self->_supportedSearchSectionTypes.count)
  {
    v11 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v11;
    }
    while (v11 < self->_supportedSearchSectionTypes.count);
  }
  v12 = self->_flags;
  if ((*(_BYTE *)&v12 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    v12 = self->_flags;
  }
  if ((*(_WORD *)&v12 & 0x100) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_searchOriginationInfo)
    PBDataWriterWriteSubmessage();
  if (self->_enrichmentCampaignNamespace)
    PBDataWriterWriteStringField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = self->_searchEnrichmentRevisionMetadatas;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v13);
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  if (self->_searchSessionData)
    PBDataWriterWriteSubmessage();
  if (self->_sessionUserActionMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_paginationParameters)
    PBDataWriterWriteSubmessage();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v19);
LABEL_70:

}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    -[GEOPDCategorySearchParameters _readPreviousSearchViewport](result);
    if ((objc_msgSend(*(id *)(v3 + 176), "hasGreenTeaWithValue:", a2) & 1) != 0)
      return 1;
    -[GEOPDCategorySearchParameters _readResultRefinementQuery](v3);
    if ((objc_msgSend(*(id *)(v3 + 192), "hasGreenTeaWithValue:", a2) & 1) != 0)
      return 1;
    -[GEOPDCategorySearchParameters _readSearchOriginationInfo](v3);
    if (-[GEOPDSearchOriginationInfo hasGreenTeaWithValue:](*(_QWORD *)(v3 + 208), a2))
    {
      return 1;
    }
    else
    {
      -[GEOPDCategorySearchParameters _readViewportInfo](v3);
      return objc_msgSend(*(id *)(v3 + 240), "hasGreenTeaWithValue:", a2);
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  $B1EDBE28F93122CC43DE0324E96A3F6C flags;
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
  $B1EDBE28F93122CC43DE0324E96A3F6C v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  PBUnknownFields *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 3) & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDCategorySearchParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_29;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDCategorySearchParameters readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 272) = self->_maxResults;
    *(_DWORD *)(v5 + 288) |= 8u;
  }
  v9 = -[GEOPDViewportInfo copyWithZone:](self->_viewportInfo, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v9;

  v11 = -[NSData copyWithZone:](self->_suggestionEntryMetadata, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = v11;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) == 0)
  {
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_9;
LABEL_31:
    *(_DWORD *)(v5 + 268) = self->_dayOfWeek;
    *(_DWORD *)(v5 + 288) |= 4u;
    if ((*(_DWORD *)&self->_flags & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  *(_DWORD *)(v5 + 264) = self->_blurredHourOfDay;
  *(_DWORD *)(v5 + 288) |= 2u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) != 0)
    goto LABEL_31;
LABEL_9:
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
LABEL_10:
    *(_DWORD *)(v5 + 280) = self->_searchType;
    *(_DWORD *)(v5 + 288) |= 0x20u;
  }
LABEL_11:
  v14 = -[GEOPDRecentRouteInfo copyWithZone:](self->_recentRouteInfo, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v14;

  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 284) = self->_supportCategorySearchResultSection;
    *(_DWORD *)(v5 + 288) |= 0x40u;
  }
  v16 = -[GEOPDSSearchEvChargingParameters copyWithZone:](self->_evChargingParameters, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v16;

  PBRepeatedInt32Copy();
  v18 = -[GEOPDETAFilter copyWithZone:](self->_etaFilter, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v18;

  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 260) = self->_auxiliaryTierNumResults;
    *(_DWORD *)(v5 + 288) |= 1u;
  }
  v20 = -[GEOPDResultRefinementQuery copyWithZone:](self->_resultRefinementQuery, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v20;

  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 276) = self->_placeSummaryRevision;
    *(_DWORD *)(v5 + 288) |= 0x10u;
  }
  v22 = -[GEOPDViewportInfo copyWithZone:](self->_previousSearchViewport, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v22;

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  v24 = self->_flags;
  if ((*(_BYTE *)&v24 & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 285) = self->_supportSearchEnrichment;
    *(_DWORD *)(v5 + 288) |= 0x80u;
    v24 = self->_flags;
  }
  if ((*(_WORD *)&v24 & 0x100) != 0)
  {
    *(_BYTE *)(v5 + 286) = self->_supportStructuredRapAffordance;
    *(_DWORD *)(v5 + 288) |= 0x100u;
  }
  v25 = -[GEOPDSearchOriginationInfo copyWithZone:](self->_searchOriginationInfo, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v25;

  v27 = -[NSString copyWithZone:](self->_enrichmentCampaignNamespace, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v27;

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v29 = self->_searchEnrichmentRevisionMetadatas;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v43 != v31)
          objc_enumerationMutation(v29);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v42);
        -[GEOPDCategorySearchParameters addSearchEnrichmentRevisionMetadata:](v5, v33);

      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v30);
  }

  v34 = -[GEOPDSSearchSessionData copyWithZone:](self->_searchSessionData, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v34;

  v36 = -[GEOPDSSessionUserActionMetadata copyWithZone:](self->_sessionUserActionMetadata, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v36;

  v38 = -[GEOPDPaginationParameters copyWithZone:](self->_paginationParameters, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v38;

  v40 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v40;
LABEL_29:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  GEOPDViewportInfo *viewportInfo;
  NSData *suggestionEntryMetadata;
  $B1EDBE28F93122CC43DE0324E96A3F6C flags;
  int v9;
  GEOPDRecentRouteInfo *recentRouteInfo;
  GEOPDSSearchEvChargingParameters *evChargingParameters;
  GEOPDETAFilter *etaFilter;
  int v13;
  GEOPDResultRefinementQuery *resultRefinementQuery;
  int v15;
  GEOPDViewportInfo *previousSearchViewport;
  $B1EDBE28F93122CC43DE0324E96A3F6C v17;
  int v18;
  GEOPDSearchOriginationInfo *searchOriginationInfo;
  NSString *enrichmentCampaignNamespace;
  NSMutableArray *searchEnrichmentRevisionMetadatas;
  GEOPDSSearchSessionData *searchSessionData;
  GEOPDSSessionUserActionMetadata *sessionUserActionMetadata;
  GEOPDPaginationParameters *paginationParameters;
  char v25;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_88;
  -[GEOPDCategorySearchParameters readAll:]((uint64_t)self, 1);
  -[GEOPDCategorySearchParameters readAll:]((uint64_t)v4, 1);
  v5 = *((_DWORD *)v4 + 72);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((v5 & 8) == 0 || self->_maxResults != *((_DWORD *)v4 + 68))
      goto LABEL_88;
  }
  else if ((v5 & 8) != 0)
  {
    goto LABEL_88;
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((_QWORD *)v4 + 30) && !-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:"))
    goto LABEL_88;
  suggestionEntryMetadata = self->_suggestionEntryMetadata;
  if ((unint64_t)suggestionEntryMetadata | *((_QWORD *)v4 + 29))
  {
    if (!-[NSData isEqual:](suggestionEntryMetadata, "isEqual:"))
      goto LABEL_88;
  }
  flags = self->_flags;
  v9 = *((_DWORD *)v4 + 72);
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_blurredHourOfDay != *((_DWORD *)v4 + 66))
      goto LABEL_88;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_dayOfWeek != *((_DWORD *)v4 + 67))
      goto LABEL_88;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_searchType != *((_DWORD *)v4 + 70))
      goto LABEL_88;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_88;
  }
  recentRouteInfo = self->_recentRouteInfo;
  if ((unint64_t)recentRouteInfo | *((_QWORD *)v4 + 23))
  {
    if (!-[GEOPDRecentRouteInfo isEqual:](recentRouteInfo, "isEqual:"))
      goto LABEL_88;
    flags = self->_flags;
    v9 = *((_DWORD *)v4 + 72);
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0)
      goto LABEL_88;
    if (self->_supportCategorySearchResultSection)
    {
      if (!*((_BYTE *)v4 + 284))
        goto LABEL_88;
    }
    else if (*((_BYTE *)v4 + 284))
    {
      goto LABEL_88;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_88;
  }
  evChargingParameters = self->_evChargingParameters;
  if ((unint64_t)evChargingParameters | *((_QWORD *)v4 + 20)
    && !-[GEOPDSSearchEvChargingParameters isEqual:](evChargingParameters, "isEqual:"))
  {
    goto LABEL_88;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_88;
  etaFilter = self->_etaFilter;
  if ((unint64_t)etaFilter | *((_QWORD *)v4 + 19))
  {
    if (!-[GEOPDETAFilter isEqual:](etaFilter, "isEqual:"))
      goto LABEL_88;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_88;
  v13 = *((_DWORD *)v4 + 72);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v13 & 1) == 0 || self->_auxiliaryTierNumResults != *((_DWORD *)v4 + 65))
      goto LABEL_88;
  }
  else if ((v13 & 1) != 0)
  {
    goto LABEL_88;
  }
  resultRefinementQuery = self->_resultRefinementQuery;
  if ((unint64_t)resultRefinementQuery | *((_QWORD *)v4 + 24)
    && !-[GEOPDResultRefinementQuery isEqual:](resultRefinementQuery, "isEqual:")
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_88;
  }
  v15 = *((_DWORD *)v4 + 72);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0 || self->_placeSummaryRevision != *((_DWORD *)v4 + 69))
      goto LABEL_88;
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_88;
  }
  previousSearchViewport = self->_previousSearchViewport;
  if ((unint64_t)previousSearchViewport | *((_QWORD *)v4 + 22)
    && !-[GEOPDViewportInfo isEqual:](previousSearchViewport, "isEqual:")
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_88;
  }
  v17 = self->_flags;
  v18 = *((_DWORD *)v4 + 72);
  if ((*(_BYTE *)&v17 & 0x80) != 0)
  {
    if ((v18 & 0x80) == 0)
      goto LABEL_88;
    if (self->_supportSearchEnrichment)
    {
      if (!*((_BYTE *)v4 + 285))
        goto LABEL_88;
    }
    else if (*((_BYTE *)v4 + 285))
    {
      goto LABEL_88;
    }
  }
  else if ((v18 & 0x80) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&v17 & 0x100) != 0)
  {
    if ((v18 & 0x100) != 0)
    {
      if (self->_supportStructuredRapAffordance)
      {
        if (!*((_BYTE *)v4 + 286))
          goto LABEL_88;
        goto LABEL_76;
      }
      if (!*((_BYTE *)v4 + 286))
        goto LABEL_76;
    }
LABEL_88:
    v25 = 0;
    goto LABEL_89;
  }
  if ((v18 & 0x100) != 0)
    goto LABEL_88;
LABEL_76:
  searchOriginationInfo = self->_searchOriginationInfo;
  if ((unint64_t)searchOriginationInfo | *((_QWORD *)v4 + 26)
    && !-[GEOPDSearchOriginationInfo isEqual:](searchOriginationInfo, "isEqual:"))
  {
    goto LABEL_88;
  }
  enrichmentCampaignNamespace = self->_enrichmentCampaignNamespace;
  if ((unint64_t)enrichmentCampaignNamespace | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](enrichmentCampaignNamespace, "isEqual:"))
      goto LABEL_88;
  }
  searchEnrichmentRevisionMetadatas = self->_searchEnrichmentRevisionMetadatas;
  if ((unint64_t)searchEnrichmentRevisionMetadatas | *((_QWORD *)v4 + 25))
  {
    if (!-[NSMutableArray isEqual:](searchEnrichmentRevisionMetadatas, "isEqual:"))
      goto LABEL_88;
  }
  searchSessionData = self->_searchSessionData;
  if ((unint64_t)searchSessionData | *((_QWORD *)v4 + 27))
  {
    if (!-[GEOPDSSearchSessionData isEqual:](searchSessionData, "isEqual:"))
      goto LABEL_88;
  }
  sessionUserActionMetadata = self->_sessionUserActionMetadata;
  if ((unint64_t)sessionUserActionMetadata | *((_QWORD *)v4 + 28))
  {
    if (!-[GEOPDSSessionUserActionMetadata isEqual:](sessionUserActionMetadata, "isEqual:"))
      goto LABEL_88;
  }
  paginationParameters = self->_paginationParameters;
  if ((unint64_t)paginationParameters | *((_QWORD *)v4 + 21))
    v25 = -[GEOPDPaginationParameters isEqual:](paginationParameters, "isEqual:");
  else
    v25 = 1;
LABEL_89:

  return v25;
}

- (unint64_t)hash
{
  $B1EDBE28F93122CC43DE0324E96A3F6C flags;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  $B1EDBE28F93122CC43DE0324E96A3F6C v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  NSUInteger v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;

  -[GEOPDCategorySearchParameters readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    v31 = 2654435761 * self->_maxResults;
  else
    v31 = 0;
  v30 = -[GEOPDViewportInfo hash](self->_viewportInfo, "hash");
  v29 = -[NSData hash](self->_suggestionEntryMetadata, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) == 0)
  {
    v28 = 0;
    if ((*(_BYTE *)&flags & 4) != 0)
      goto LABEL_6;
LABEL_9:
    v27 = 0;
    if ((*(_BYTE *)&flags & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v28 = 2654435761 * self->_blurredHourOfDay;
  if ((*(_BYTE *)&flags & 4) == 0)
    goto LABEL_9;
LABEL_6:
  v27 = 2654435761 * self->_dayOfWeek;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
LABEL_7:
    v26 = 2654435761 * self->_searchType;
    goto LABEL_11;
  }
LABEL_10:
  v26 = 0;
LABEL_11:
  v25 = -[GEOPDRecentRouteInfo hash](self->_recentRouteInfo, "hash");
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
    v24 = 2654435761 * self->_supportCategorySearchResultSection;
  else
    v24 = 0;
  v23 = -[GEOPDSSearchEvChargingParameters hash](self->_evChargingParameters, "hash");
  v22 = PBRepeatedInt32Hash();
  v21 = -[GEOPDETAFilter hash](self->_etaFilter, "hash");
  v4 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v5 = 2654435761 * self->_auxiliaryTierNumResults;
  else
    v5 = 0;
  v6 = -[GEOPDResultRefinementQuery hash](self->_resultRefinementQuery, "hash");
  v7 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    v8 = 2654435761 * self->_placeSummaryRevision;
  else
    v8 = 0;
  v9 = -[GEOPDViewportInfo hash](self->_previousSearchViewport, "hash");
  v10 = PBRepeatedInt32Hash();
  v11 = PBRepeatedInt32Hash();
  v12 = self->_flags;
  if ((*(_BYTE *)&v12 & 0x80) != 0)
  {
    v13 = 2654435761 * self->_supportSearchEnrichment;
    if ((*(_WORD *)&v12 & 0x100) != 0)
      goto LABEL_22;
LABEL_24:
    v14 = 0;
    goto LABEL_25;
  }
  v13 = 0;
  if ((*(_WORD *)&v12 & 0x100) == 0)
    goto LABEL_24;
LABEL_22:
  v14 = 2654435761 * self->_supportStructuredRapAffordance;
LABEL_25:
  v15 = v10 ^ v11 ^ v13 ^ v14 ^ -[GEOPDSearchOriginationInfo hash](self->_searchOriginationInfo, "hash");
  v16 = v15 ^ -[NSString hash](self->_enrichmentCampaignNamespace, "hash");
  v17 = v16 ^ -[NSMutableArray hash](self->_searchEnrichmentRevisionMetadatas, "hash");
  v18 = v17 ^ -[GEOPDSSearchSessionData hash](self->_searchSessionData, "hash");
  v19 = v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v18 ^ -[GEOPDSSessionUserActionMetadata hash](self->_sessionUserActionMetadata, "hash");
  return v19 ^ -[GEOPDPaginationParameters hash](self->_paginationParameters, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_suggestionEntryMetadata, 0);
  objc_storeStrong((id *)&self->_sessionUserActionMetadata, 0);
  objc_storeStrong((id *)&self->_searchSessionData, 0);
  objc_storeStrong((id *)&self->_searchOriginationInfo, 0);
  objc_storeStrong((id *)&self->_searchEnrichmentRevisionMetadatas, 0);
  objc_storeStrong((id *)&self->_resultRefinementQuery, 0);
  objc_storeStrong((id *)&self->_recentRouteInfo, 0);
  objc_storeStrong((id *)&self->_previousSearchViewport, 0);
  objc_storeStrong((id *)&self->_paginationParameters, 0);
  objc_storeStrong((id *)&self->_evChargingParameters, 0);
  objc_storeStrong((id *)&self->_etaFilter, 0);
  objc_storeStrong((id *)&self->_enrichmentCampaignNamespace, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
