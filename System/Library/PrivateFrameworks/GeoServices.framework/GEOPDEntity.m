@implementation GEOPDEntity

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDEntity;
  -[GEOPDEntity dealloc](&v3, sel_dealloc);
}

void __51__GEOPDEntity_PlaceDataExtras__entityForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue entity](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  $F2AA8D11DDD6D71BA01031F215D029B3 flags;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  void *v35;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t n;
  void *v40;
  NSMutableArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t ii;
  void *v45;
  $F2AA8D11DDD6D71BA01031F215D029B3 v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  NSMutableArray *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t jj;
  void *v61;
  $F2AA8D11DDD6D71BA01031F215D029B3 v62;
  uint64_t v63;
  void *v64;
  NSMutableArray *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t kk;
  void *v69;
  NSMutableArray *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t mm;
  void *v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
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
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 5) & 4) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDEntityReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_96;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDEntity readAll:](self, "readAll:", 0);
  if ((*((_BYTE *)&self->_flags + 1) & 8) != 0)
  {
    *(_DWORD *)(v5 + 316) = self->_type;
    *(_QWORD *)(v5 + 328) |= 0x800uLL;
  }
  v9 = -[NSString copyWithZone:](self->_telephone, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = v9;

  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  v11 = self->_altTelephones;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v115, v127, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v116;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v116 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v115 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAltTelephone:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v115, v127, 16);
    }
    while (v12);
  }

  v16 = -[NSString copyWithZone:](self->_fax, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v16;

  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v18 = self->_altFaxs;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v111, v126, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v112;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v112 != v20)
          objc_enumerationMutation(v18);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v111 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAltFax:", v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v111, v126, 16);
    }
    while (v19);
  }

  v23 = -[NSString copyWithZone:](self->_url, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 264);
  *(_QWORD *)(v5 + 264) = v23;

  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v25 = self->_altUrls;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v107, v125, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v108;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v108 != v27)
          objc_enumerationMutation(v25);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAltUrl:", v29);

      }
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v107, v125, 16);
    }
    while (v26);
  }

  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x8000) != 0)
  {
    *(_BYTE *)(v5 + 323) = self->_isPermanentlyClosed;
    *(_QWORD *)(v5 + 328) |= 0x8000uLL;
    flags = self->_flags;
  }
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    *(_BYTE *)(v5 + 322) = self->_isDisputed;
    *(_QWORD *)(v5 + 328) |= 0x4000uLL;
  }
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v31 = self->_names;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v103, v124, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v104;
    do
    {
      for (m = 0; m != v32; ++m)
      {
        if (*(_QWORD *)v104 != v33)
          objc_enumerationMutation(v31);
        v35 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addName:", v35);

      }
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v103, v124, 16);
    }
    while (v32);
  }

  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v36 = self->_spokenNames;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v99, v123, 16);
  if (v37)
  {
    v38 = *(_QWORD *)v100;
    do
    {
      for (n = 0; n != v37; ++n)
      {
        if (*(_QWORD *)v100 != v38)
          objc_enumerationMutation(v36);
        v40 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSpokenName:", v40);

      }
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v99, v123, 16);
    }
    while (v37);
  }

  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v41 = self->_localizedCategorys;
  v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v95, v122, 16);
  if (v42)
  {
    v43 = *(_QWORD *)v96;
    do
    {
      for (ii = 0; ii != v42; ++ii)
      {
        if (*(_QWORD *)v96 != v43)
          objc_enumerationMutation(v41);
        v45 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * ii), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addLocalizedCategory:", v45);

      }
      v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v95, v122, 16);
    }
    while (v42);
  }

  v46 = self->_flags;
  if ((*(_DWORD *)&v46 & 0x20000) != 0)
  {
    *(_BYTE *)(v5 + 325) = self->_telephoneAdsOptOut;
    *(_QWORD *)(v5 + 328) |= 0x20000uLL;
    v46 = self->_flags;
    if ((*(_WORD *)&v46 & 0x1000) == 0)
    {
LABEL_55:
      if ((*(_DWORD *)&v46 & 0x10000) == 0)
        goto LABEL_56;
      goto LABEL_99;
    }
  }
  else if ((*(_WORD *)&v46 & 0x1000) == 0)
  {
    goto LABEL_55;
  }
  *(_BYTE *)(v5 + 320) = self->_altTelephoneAdsOptOut;
  *(_QWORD *)(v5 + 328) |= 0x1000uLL;
  v46 = self->_flags;
  if ((*(_DWORD *)&v46 & 0x10000) == 0)
  {
LABEL_56:
    if ((*(_BYTE *)&v46 & 0x40) == 0)
      goto LABEL_57;
    goto LABEL_100;
  }
LABEL_99:
  *(_BYTE *)(v5 + 324) = self->_isStandaloneBrand;
  *(_QWORD *)(v5 + 328) |= 0x10000uLL;
  v46 = self->_flags;
  if ((*(_BYTE *)&v46 & 0x40) == 0)
  {
LABEL_57:
    if ((*(_WORD *)&v46 & 0x400) == 0)
      goto LABEL_58;
    goto LABEL_101;
  }
LABEL_100:
  *(_DWORD *)(v5 + 296) = self->_displayStyle;
  *(_QWORD *)(v5 + 328) |= 0x40uLL;
  v46 = self->_flags;
  if ((*(_WORD *)&v46 & 0x400) == 0)
  {
LABEL_58:
    if ((*(_WORD *)&v46 & 0x200) == 0)
      goto LABEL_59;
    goto LABEL_102;
  }
LABEL_101:
  *(_DWORD *)(v5 + 312) = self->_searchSection;
  *(_QWORD *)(v5 + 328) |= 0x400uLL;
  v46 = self->_flags;
  if ((*(_WORD *)&v46 & 0x200) == 0)
  {
LABEL_59:
    if ((*(_BYTE *)&v46 & 2) == 0)
      goto LABEL_60;
    goto LABEL_103;
  }
LABEL_102:
  *(_DWORD *)(v5 + 308) = self->_placeDisplayType;
  *(_QWORD *)(v5 + 328) |= 0x200uLL;
  v46 = self->_flags;
  if ((*(_BYTE *)&v46 & 2) == 0)
  {
LABEL_60:
    if ((*(_BYTE *)&v46 & 0x20) == 0)
      goto LABEL_62;
    goto LABEL_61;
  }
LABEL_103:
  *(_QWORD *)(v5 + 112) = self->_brandMuid;
  *(_QWORD *)(v5 + 328) |= 2uLL;
  if ((*(_QWORD *)&self->_flags & 0x20) != 0)
  {
LABEL_61:
    *(_DWORD *)(v5 + 292) = self->_capacity;
    *(_QWORD *)(v5 + 328) |= 0x20uLL;
  }
LABEL_62:
  PBRepeatedInt32Copy();
  v47 = -[GEOLocalizedString copyWithZone:](self->_secondaryName, "copyWithZone:", a3);
  v48 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v47;

  v49 = -[GEOLocalizedString copyWithZone:](self->_secondarySpokenName, "copyWithZone:", a3);
  v50 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v49;

  v51 = -[GEOStyleAttributes copyWithZone:](self->_styleAttributes, "copyWithZone:", a3);
  v52 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v51;

  v53 = -[NSString copyWithZone:](self->_walletCategoryId, "copyWithZone:", a3);
  v54 = *(void **)(v5 + 272);
  *(_QWORD *)(v5 + 272) = v53;

  v55 = -[NSString copyWithZone:](self->_mapsCategoryId, "copyWithZone:", a3);
  v56 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v55;

  if ((*((_BYTE *)&self->_flags + 1) & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 321) = self->_enableRapLightweightFeedback;
    *(_QWORD *)(v5 + 328) |= 0x2000uLL;
  }
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v57 = self->_alternateSearchableNames;
  v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v91, v121, 16);
  if (v58)
  {
    v59 = *(_QWORD *)v92;
    do
    {
      for (jj = 0; jj != v58; ++jj)
      {
        if (*(_QWORD *)v92 != v59)
          objc_enumerationMutation(v57);
        v61 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * jj), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAlternateSearchableName:", v61);

      }
      v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v91, v121, 16);
    }
    while (v58);
  }

  v62 = self->_flags;
  if ((*(_BYTE *)&v62 & 8) == 0)
  {
    if ((*(_BYTE *)&v62 & 4) == 0)
      goto LABEL_73;
LABEL_106:
    *(_QWORD *)(v5 + 120) = self->_buildingId;
    *(_QWORD *)(v5 + 328) |= 4uLL;
    if ((*(_QWORD *)&self->_flags & 1) == 0)
      goto LABEL_75;
    goto LABEL_74;
  }
  *(_QWORD *)(v5 + 144) = self->_globalBrandMuid;
  *(_QWORD *)(v5 + 328) |= 8uLL;
  v62 = self->_flags;
  if ((*(_BYTE *)&v62 & 4) != 0)
    goto LABEL_106;
LABEL_73:
  if ((*(_BYTE *)&v62 & 1) != 0)
  {
LABEL_74:
    *(_QWORD *)(v5 + 104) = self->_areaHighlightId;
    *(_QWORD *)(v5 + 328) |= 1uLL;
  }
LABEL_75:
  v63 = -[NSString copyWithZone:](self->_modernMapsCategoryId, "copyWithZone:", a3);
  v64 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v63;

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v65 = self->_modernLocalizedCategorys;
  v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v87, v120, 16);
  if (v66)
  {
    v67 = *(_QWORD *)v88;
    do
    {
      for (kk = 0; kk != v66; ++kk)
      {
        if (*(_QWORD *)v88 != v67)
          objc_enumerationMutation(v65);
        v69 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * kk), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addModernLocalizedCategory:", v69);

      }
      v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v87, v120, 16);
    }
    while (v66);
  }

  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    *(float *)(v5 + 300) = self->_photosMemoryScore;
    *(_QWORD *)(v5 + 328) |= 0x80uLL;
  }
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v70 = self->_mapsAltCategoryIds;
  v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v83, v119, 16);
  if (v71)
  {
    v72 = *(_QWORD *)v84;
    do
    {
      for (mm = 0; mm != v71; ++mm)
      {
        if (*(_QWORD *)v84 != v72)
          objc_enumerationMutation(v70);
        v74 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * mm), "copyWithZone:", a3, (_QWORD)v83);
        objc_msgSend((id)v5, "addMapsAltCategoryId:", v74);

      }
      v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v83, v119, 16);
    }
    while (v71);
  }

  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    *(_DWORD *)(v5 + 304) = self->_placeCategoryType;
    *(_QWORD *)(v5 + 328) |= 0x100uLL;
  }
  v75 = -[GEOPDInlineRapEnablement copyWithZone:](self->_inlineRapEnablement, "copyWithZone:", a3, (_QWORD)v83);
  v76 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v75;

  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *(_QWORD *)(v5 + 184) = self->_mapsCategoryMuid;
    *(_QWORD *)(v5 + 328) |= 0x10uLL;
  }
  PBRepeatedUInt64Copy();
  v77 = -[GEOLocalizedString copyWithZone:](self->_disclaimerText, "copyWithZone:", a3);
  v78 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v77;

  v79 = -[GEOPDURLData copyWithZone:](self->_urlData, "copyWithZone:", a3);
  v80 = *(void **)(v5 + 256);
  *(_QWORD *)(v5 + 256) = v79;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  v81 = (id)v5;
LABEL_96:

  return (id)v5;
}

- (id)bestLocalizedName
{
  void *v2;
  void *v3;

  -[GEOPDEntity names](self, "names");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOLocalizedString bestLocalizedStringForCurrentLocale:fallbackToFirstAvailable:](GEOLocalizedString, "bestLocalizedStringForCurrentLocale:fallbackToFirstAvailable:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSMutableArray)names
{
  -[GEOPDEntity _readNames]((uint64_t)self);
  return self->_names;
}

- (void)_readNames
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 332) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNames_tags_3324);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletCategoryId, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_urlData, 0);
  objc_storeStrong((id *)&self->_telephone, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_spokenNames, 0);
  objc_storeStrong((id *)&self->_secondarySpokenName, 0);
  objc_storeStrong((id *)&self->_secondaryName, 0);
  objc_storeStrong((id *)&self->_names, 0);
  objc_storeStrong((id *)&self->_modernMapsCategoryId, 0);
  objc_storeStrong((id *)&self->_modernLocalizedCategorys, 0);
  objc_storeStrong((id *)&self->_mapsCategoryId, 0);
  objc_storeStrong((id *)&self->_mapsAltCategoryIds, 0);
  objc_storeStrong((id *)&self->_localizedCategorys, 0);
  objc_storeStrong((id *)&self->_inlineRapEnablement, 0);
  objc_storeStrong((id *)&self->_fax, 0);
  objc_storeStrong((id *)&self->_disclaimerText, 0);
  objc_storeStrong((id *)&self->_alternateSearchableNames, 0);
  objc_storeStrong((id *)&self->_altUrls, 0);
  objc_storeStrong((id *)&self->_altTelephones, 0);
  objc_storeStrong((id *)&self->_altFaxs, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDEntity)init
{
  GEOPDEntity *v2;
  GEOPDEntity *v3;
  GEOPDEntity *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDEntity;
  v2 = -[GEOPDEntity init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)_addNoFlagsName:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 208);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 208);
      *(_QWORD *)(a1 + 208) = v5;

      v4 = *(void **)(a1 + 208);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  $F2AA8D11DDD6D71BA01031F215D029B3 flags;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t m;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t n;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t ii;
  $F2AA8D11DDD6D71BA01031F215D029B3 v31;
  unint64_t v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t jj;
  $F2AA8D11DDD6D71BA01031F215D029B3 v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t kk;
  NSMutableArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t mm;
  unint64_t v46;
  PBDataReader *v47;
  void *v48;
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
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDEntityIsDirty((uint64_t)self) & 1) == 0)
  {
    v47 = self->_reader;
    objc_sync_enter(v47);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v48);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v47);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDEntity readAll:](self, "readAll:", 0);
    if ((*((_BYTE *)&self->_flags + 1) & 8) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_telephone)
      PBDataWriterWriteStringField();
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v6 = self->_altTelephones;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v82;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v82 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
      }
      while (v7);
    }

    if (self->_fax)
      PBDataWriterWriteStringField();
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v10 = self->_altFaxs;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v78;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v78 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteStringField();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
      }
      while (v11);
    }

    if (self->_url)
      PBDataWriterWriteStringField();
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v14 = self->_altUrls;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v74;
      do
      {
        for (k = 0; k != v15; ++k)
        {
          if (*(_QWORD *)v74 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteStringField();
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
      }
      while (v15);
    }

    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x8000) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = self->_flags;
    }
    if ((*(_WORD *)&flags & 0x4000) != 0)
      PBDataWriterWriteBOOLField();
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v19 = self->_names;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v69, v90, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v70;
      do
      {
        for (m = 0; m != v20; ++m)
        {
          if (*(_QWORD *)v70 != v21)
            objc_enumerationMutation(v19);
          PBDataWriterWriteSubmessage();
        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v69, v90, 16);
      }
      while (v20);
    }

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v23 = self->_spokenNames;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v65, v89, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v66;
      do
      {
        for (n = 0; n != v24; ++n)
        {
          if (*(_QWORD *)v66 != v25)
            objc_enumerationMutation(v23);
          PBDataWriterWriteSubmessage();
        }
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v65, v89, 16);
      }
      while (v24);
    }

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v27 = self->_localizedCategorys;
    v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v61, v88, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v62;
      do
      {
        for (ii = 0; ii != v28; ++ii)
        {
          if (*(_QWORD *)v62 != v29)
            objc_enumerationMutation(v27);
          PBDataWriterWriteSubmessage();
        }
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v61, v88, 16);
      }
      while (v28);
    }

    v31 = self->_flags;
    if ((*(_DWORD *)&v31 & 0x20000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v31 = self->_flags;
    }
    if ((*(_WORD *)&v31 & 0x1000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v31 = self->_flags;
    }
    if ((*(_DWORD *)&v31 & 0x10000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v31 = self->_flags;
    }
    if ((*(_BYTE *)&v31 & 0x40) != 0)
    {
      PBDataWriterWriteInt32Field();
      v31 = self->_flags;
    }
    if ((*(_WORD *)&v31 & 0x400) != 0)
    {
      PBDataWriterWriteInt32Field();
      v31 = self->_flags;
    }
    if ((*(_WORD *)&v31 & 0x200) != 0)
    {
      PBDataWriterWriteInt32Field();
      v31 = self->_flags;
    }
    if ((*(_BYTE *)&v31 & 2) != 0)
    {
      PBDataWriterWriteUint64Field();
      v31 = self->_flags;
    }
    if ((*(_BYTE *)&v31 & 0x20) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_placeLookupCategorys.count)
    {
      v32 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v32;
      }
      while (v32 < self->_placeLookupCategorys.count);
    }
    if (self->_secondaryName)
      PBDataWriterWriteSubmessage();
    if (self->_secondarySpokenName)
      PBDataWriterWriteSubmessage();
    if (self->_styleAttributes)
      PBDataWriterWriteSubmessage();
    if (self->_walletCategoryId)
      PBDataWriterWriteStringField();
    if (self->_mapsCategoryId)
      PBDataWriterWriteStringField();
    if ((*((_BYTE *)&self->_flags + 1) & 0x20) != 0)
      PBDataWriterWriteBOOLField();
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v33 = self->_alternateSearchableNames;
    v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v57, v87, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v58;
      do
      {
        for (jj = 0; jj != v34; ++jj)
        {
          if (*(_QWORD *)v58 != v35)
            objc_enumerationMutation(v33);
          PBDataWriterWriteSubmessage();
        }
        v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v57, v87, 16);
      }
      while (v34);
    }

    v37 = self->_flags;
    if ((*(_BYTE *)&v37 & 8) != 0)
    {
      PBDataWriterWriteUint64Field();
      v37 = self->_flags;
    }
    if ((*(_BYTE *)&v37 & 4) != 0)
    {
      PBDataWriterWriteUint64Field();
      v37 = self->_flags;
    }
    if ((*(_BYTE *)&v37 & 1) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_modernMapsCategoryId)
      PBDataWriterWriteStringField();
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v38 = self->_modernLocalizedCategorys;
    v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v53, v86, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v54;
      do
      {
        for (kk = 0; kk != v39; ++kk)
        {
          if (*(_QWORD *)v54 != v40)
            objc_enumerationMutation(v38);
          PBDataWriterWriteSubmessage();
        }
        v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v53, v86, 16);
      }
      while (v39);
    }

    if ((*(_BYTE *)&self->_flags & 0x80) != 0)
      PBDataWriterWriteFloatField();
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v42 = self->_mapsAltCategoryIds;
    v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v49, v85, 16);
    if (v43)
    {
      v44 = *(_QWORD *)v50;
      do
      {
        for (mm = 0; mm != v43; ++mm)
        {
          if (*(_QWORD *)v50 != v44)
            objc_enumerationMutation(v42);
          PBDataWriterWriteStringField();
        }
        v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v49, v85, 16);
      }
      while (v43);
    }

    if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_inlineRapEnablement)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_mapsAltCategoryMuids.count)
    {
      v46 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v46;
      }
      while (v46 < self->_mapsAltCategoryMuids.count);
    }
    if (self->_disclaimerText)
      PBDataWriterWriteSubmessage();
    if (self->_urlData)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v49);
  }

}

- (BOOL)hasIsDisputed
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (int)type
{
  os_unfair_lock_s *p_readerLock;
  $F2AA8D11DDD6D71BA01031F215D029B3 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x800) != 0)
    return self->_type;
  else
    return 0;
}

+ (id)entityForPlaceData:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__36;
  v11 = __Block_byref_object_dispose__36;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__GEOPDEntity_PlaceDataExtras__entityForPlaceData___block_invoke;
  v6[3] = &unk_1E1C09718;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateValidComponentValuesOfType:usingBlock:", 1, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (NSString)walletCategoryId
{
  -[GEOPDEntity _readWalletCategoryId]((uint64_t)self);
  return self->_walletCategoryId;
}

- (NSString)url
{
  -[GEOPDEntity _readUrl]((uint64_t)self);
  return self->_url;
}

- (NSString)telephone
{
  -[GEOPDEntity _readTelephone]((uint64_t)self);
  return self->_telephone;
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEOPDEntity _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes;
}

- (GEOLocalizedString)secondarySpokenName
{
  -[GEOPDEntity _readSecondarySpokenName]((uint64_t)self);
  return self->_secondarySpokenName;
}

- (GEOLocalizedString)secondaryName
{
  -[GEOPDEntity _readSecondaryName]((uint64_t)self);
  return self->_secondaryName;
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_3456;
    else
      v8 = (int *)&readAll__nonRecursiveTag_3457;
    GEOPDEntityReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPDEntityCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

- (NSString)modernMapsCategoryId
{
  -[GEOPDEntity _readModernMapsCategoryId]((uint64_t)self);
  return self->_modernMapsCategoryId;
}

- (NSString)mapsCategoryId
{
  -[GEOPDEntity _readMapsCategoryId]((uint64_t)self);
  return self->_mapsCategoryId;
}

- (GEOPDInlineRapEnablement)inlineRapEnablement
{
  -[GEOPDEntity _readInlineRapEnablement]((uint64_t)self);
  return self->_inlineRapEnablement;
}

- (NSString)fax
{
  -[GEOPDEntity _readFax]((uint64_t)self);
  return self->_fax;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDEntity _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (void)_readWalletCategoryId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 333) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWalletCategoryId_tags_3327);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (void)_readUrl
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 333) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUrl_tags_3323);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (void)_readTelephone
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 332) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTelephone_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (void)_readStyleAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 332) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleAttributes_tags_3326);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (void)_readSecondarySpokenName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 332) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSecondarySpokenName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (void)_readSecondaryName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 332) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSecondaryName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (void)_readModernMapsCategoryId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 332) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readModernMapsCategoryId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (void)_readMapsCategoryId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 331) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsCategoryId_tags_3328);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (void)_readInlineRapEnablement
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 331) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInlineRapEnablement_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (void)_readFax
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 331) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFax_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int *v5;
  int v6;
  __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  id v37;
  const __CFString *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  id v46;
  const __CFString *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  _QWORD *v51;
  unint64_t v52;
  uint64_t v53;
  __CFString *v54;
  const __CFString *v55;
  void *v56;
  void *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  const __CFString *v65;
  uint64_t v66;
  __CFString *v67;
  id v68;
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
  const __CFString *v80;
  void *v81;
  const __CFString *v82;
  void *v83;
  const __CFString *v84;
  void *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t m;
  void *v91;
  id v92;
  const __CFString *v93;
  uint64_t v94;
  void *v95;
  const __CFString *v96;
  void *v97;
  const __CFString *v98;
  double v99;
  void *v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t n;
  void *v106;
  id v107;
  const __CFString *v108;
  void *v109;
  const __CFString *v110;
  void *v111;
  const __CFString *v112;
  uint64_t v113;
  __CFString *v114;
  void *v115;
  const __CFString *v116;
  void *v117;
  const __CFString *v118;
  const __CFString *v119;
  uint64_t v120;
  __CFString *v121;
  void *v122;
  void *v123;
  void *v124;
  const __CFString *v125;
  id v126;
  void *v127;
  const __CFString *v128;
  void *v129;
  const __CFString *v130;
  void *v131;
  void *v132;
  void *v133;
  const __CFString *v134;
  id v135;
  void *v136;
  void *v137;
  void *v138;
  const __CFString *v139;
  id v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  id v145;
  id v146;
  id v147;
  const __CFString *v149;
  uint64_t v150;
  __CFString *v151;
  const __CFString *v152;
  void *v153;
  const __CFString *v154;
  _QWORD v155[4];
  id v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  _BYTE v181[128];
  uint64_t v182;

  v182 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = &OBJC_IVAR___GEOPDButtonModuleConfiguration__unknownFields;
  if ((*(_BYTE *)(a1 + 329) & 8) != 0)
  {
    v6 = *(_DWORD *)(a1 + 316);
    switch(v6)
    {
      case '#':
        v7 = CFSTR("TIME_ZONE");
        break;
      case '$':
      case '%':
      case '&':
      case '\'':
      case '(':
      case ')':
      case '*':
      case '4':
      case '5':
      case '8':
      case ':':
      case ';':
      case '<':
      case '>':
LABEL_9:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 316));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case '+':
        v7 = CFSTR("SUB_LOCALITY");
        break;
      case ',':
        v7 = CFSTR("OCEAN");
        break;
      case '-':
        v7 = CFSTR("AOI");
        break;
      case '.':
        v7 = CFSTR("INLAND_WATER");
        break;
      case '/':
        v7 = CFSTR("BUSINESS");
        break;
      case '0':
        v7 = CFSTR("ISLAND");
        break;
      case '1':
        v7 = CFSTR("STREET");
        break;
      case '2':
        v7 = CFSTR("ADMIN");
        break;
      case '3':
        v7 = CFSTR("POSTAL");
        break;
      case '6':
        v7 = CFSTR("INTERSECTION");
        break;
      case '7':
        v7 = CFSTR("BUILDING");
        break;
      case '9':
        v7 = CFSTR("ADDRESS");
        break;
      case '=':
        v7 = CFSTR("CONTINENT");
        break;
      case '?':
        v7 = CFSTR("REGION");
        break;
      case '@':
        v7 = CFSTR("DIVISION");
        break;
      case 'A':
        v7 = CFSTR("PHYSICAL_FEATURE");
        break;
      default:
        v7 = CFSTR("UNKNOWN_PLACE_TYPE");
        switch(v6)
        {
          case 0:
            goto LABEL_28;
          case 1:
            v7 = CFSTR("COUNTRY");
            break;
          case 2:
            v7 = CFSTR("ADMINISTRATIVE_AREA");
            break;
          case 3:
            goto LABEL_9;
          case 4:
            v7 = CFSTR("SUB_ADMINISTRATIVE_AREA");
            break;
          default:
            if (v6 != 16)
              goto LABEL_9;
            v7 = CFSTR("LOCALITY");
            break;
        }
        break;
    }
LABEL_28:
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("type"));

  }
  objc_msgSend((id)a1, "telephone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("telephone"));

  if (*(_QWORD *)(a1 + 80))
  {
    objc_msgSend((id)a1, "altTelephones");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("altTelephone");
    else
      v10 = CFSTR("alt_telephone");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  objc_msgSend((id)a1, "fax");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("fax"));

  if (*(_QWORD *)(a1 + 72))
  {
    objc_msgSend((id)a1, "altFaxs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("altFax");
    else
      v13 = CFSTR("alt_fax");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  objc_msgSend((id)a1, "url");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("url"));

  if (*(_QWORD *)(a1 + 88))
  {
    objc_msgSend((id)a1, "altUrls");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("altUrl");
    else
      v16 = CFSTR("alt_url");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  v17 = *(_QWORD *)(a1 + 328);
  if ((v17 & 0x8000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 323));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v19 = CFSTR("isPermanentlyClosed");
    else
      v19 = CFSTR("is_permanently_closed");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

    v17 = *(_QWORD *)(a1 + 328);
  }
  if ((v17 & 0x4000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 322));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v21 = CFSTR("isDisputed");
    else
      v21 = CFSTR("is_disputed");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  if (objc_msgSend(*(id *)(a1 + 208), "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 208), "count"));
    v173 = 0u;
    v174 = 0u;
    v175 = 0u;
    v176 = 0u;
    v23 = *(id *)(a1 + 208);
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v173, v181, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v174;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v174 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v28, "jsonRepresentation");
          else
            objc_msgSend(v28, "dictionaryRepresentation");
          v29 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "addObject:", v29);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v173, v181, 16);
      }
      while (v25);
    }

    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("name"));
    v5 = &OBJC_IVAR___GEOPDButtonModuleConfiguration__unknownFields;
  }
  if (objc_msgSend(*(id *)(a1 + 232), "count"))
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 232), "count"));
    v169 = 0u;
    v170 = 0u;
    v171 = 0u;
    v172 = 0u;
    v31 = *(id *)(a1 + 232);
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v169, v180, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v170;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v170 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v36, "jsonRepresentation");
          else
            objc_msgSend(v36, "dictionaryRepresentation");
          v37 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v30, "addObject:", v37);
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v169, v180, 16);
      }
      while (v33);
    }

    if (a2)
      v38 = CFSTR("spokenName");
    else
      v38 = CFSTR("spoken_name");
    objc_msgSend(v4, "setObject:forKey:", v30, v38);

    v5 = &OBJC_IVAR___GEOPDButtonModuleConfiguration__unknownFields;
  }
  if (objc_msgSend(*(id *)(a1 + 160), "count"))
  {
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 160), "count"));
    v165 = 0u;
    v166 = 0u;
    v167 = 0u;
    v168 = 0u;
    v40 = *(id *)(a1 + 160);
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v165, v179, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v166;
      do
      {
        for (k = 0; k != v42; ++k)
        {
          if (*(_QWORD *)v166 != v43)
            objc_enumerationMutation(v40);
          v45 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v45, "jsonRepresentation");
          else
            objc_msgSend(v45, "dictionaryRepresentation");
          v46 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "addObject:", v46);
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v165, v179, 16);
      }
      while (v42);
    }

    if (a2)
      v47 = CFSTR("localizedCategory");
    else
      v47 = CFSTR("localized_category");
    objc_msgSend(v4, "setObject:forKey:", v39, v47);

    v5 = &OBJC_IVAR___GEOPDButtonModuleConfiguration__unknownFields;
  }
  v48 = *(_QWORD *)(a1 + v5[251]);
  if ((v48 & 0x20000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 325));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v61 = CFSTR("telephoneAdsOptOut");
    else
      v61 = CFSTR("telephone_ads_opt_out");
    objc_msgSend(v4, "setObject:forKey:", v60, v61);

    v48 = *(_QWORD *)(a1 + 328);
    if ((v48 & 0x1000) == 0)
    {
LABEL_104:
      if ((v48 & 0x10000) == 0)
        goto LABEL_105;
      goto LABEL_133;
    }
  }
  else if ((v48 & 0x1000) == 0)
  {
    goto LABEL_104;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 320));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v63 = CFSTR("altTelephoneAdsOptOut");
  else
    v63 = CFSTR("alt_telephone_ads_opt_out");
  objc_msgSend(v4, "setObject:forKey:", v62, v63);

  v48 = *(_QWORD *)(a1 + 328);
  if ((v48 & 0x10000) == 0)
  {
LABEL_105:
    if ((v48 & 0x40) == 0)
      goto LABEL_106;
    goto LABEL_137;
  }
LABEL_133:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 324));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v65 = CFSTR("isStandaloneBrand");
  else
    v65 = CFSTR("is_standalone_brand");
  objc_msgSend(v4, "setObject:forKey:", v64, v65);

  v48 = *(_QWORD *)(a1 + 328);
  if ((v48 & 0x40) == 0)
  {
LABEL_106:
    if ((v48 & 0x400) == 0)
      goto LABEL_107;
    goto LABEL_235;
  }
LABEL_137:
  v66 = *(int *)(a1 + 296);
  if (v66 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 296));
    v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v67 = off_1E1C0B9A8[v66];
  }
  if (a2)
    v119 = CFSTR("displayStyle");
  else
    v119 = CFSTR("display_style");
  objc_msgSend(v4, "setObject:forKey:", v67, v119);

  v48 = *(_QWORD *)(a1 + v5[251]);
  if ((v48 & 0x400) == 0)
  {
LABEL_107:
    if ((v48 & 0x200) == 0)
      goto LABEL_108;
    goto LABEL_274;
  }
LABEL_235:
  v120 = *(int *)(a1 + 312);
  if (v120 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 312));
    v121 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v121 = off_1E1C0B9C0[v120];
  }
  if (a2)
    v149 = CFSTR("searchSection");
  else
    v149 = CFSTR("search_section");
  objc_msgSend(v4, "setObject:forKey:", v121, v149);

  v48 = *(_QWORD *)(a1 + v5[251]);
  if ((v48 & 0x200) == 0)
  {
LABEL_108:
    if ((v48 & 2) == 0)
      goto LABEL_109;
    goto LABEL_281;
  }
LABEL_274:
  v150 = *(int *)(a1 + 308);
  if (v150 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 308));
    v151 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v151 = off_1E1C0B9D8[v150];
  }
  if (a2)
    v152 = CFSTR("placeDisplayType");
  else
    v152 = CFSTR("place_display_type");
  objc_msgSend(v4, "setObject:forKey:", v151, v152);

  v48 = *(_QWORD *)(a1 + v5[251]);
  if ((v48 & 2) == 0)
  {
LABEL_109:
    if ((v48 & 0x20) == 0)
      goto LABEL_111;
    goto LABEL_110;
  }
LABEL_281:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 112));
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v154 = CFSTR("brandMuid");
  else
    v154 = CFSTR("brand_muid");
  objc_msgSend(v4, "setObject:forKey:", v153, v154);

  if ((*(_QWORD *)(a1 + 328) & 0x20) != 0)
  {
LABEL_110:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 292));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("capacity"));

  }
LABEL_111:
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 56))
    {
      v52 = 0;
      do
      {
        v53 = *(int *)(*v51 + 4 * v52);
        if (v53 >= 0x18)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v53);
          v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v54 = off_1E1C0C2C0[v53];
        }
        objc_msgSend(v50, "addObject:", v54);

        ++v52;
        v51 = (_QWORD *)(a1 + 48);
      }
      while (v52 < *(_QWORD *)(a1 + 56));
    }
    if (a2)
      v55 = CFSTR("placeLookupCategory");
    else
      v55 = CFSTR("place_lookup_category");
    objc_msgSend(v4, "setObject:forKey:", v50, v55);

    v5 = &OBJC_IVAR___GEOPDButtonModuleConfiguration__unknownFields;
  }
  objc_msgSend((id)a1, "secondaryName");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v56;
  if (v56)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v56, "jsonRepresentation");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = CFSTR("secondaryName");
    }
    else
    {
      objc_msgSend(v56, "dictionaryRepresentation");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = CFSTR("secondary_name");
    }
    v68 = v58;

    objc_msgSend(v4, "setObject:forKey:", v68, v59);
  }

  objc_msgSend((id)a1, "secondarySpokenName");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v69;
  if (v69)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v69, "jsonRepresentation");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = CFSTR("secondarySpokenName");
    }
    else
    {
      objc_msgSend(v69, "dictionaryRepresentation");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = CFSTR("secondary_spoken_name");
    }
    v73 = v71;

    objc_msgSend(v4, "setObject:forKey:", v73, v72);
  }

  objc_msgSend((id)a1, "styleAttributes");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v74;
  if (v74)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v74, "jsonRepresentation");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = CFSTR("styleAttributes");
    }
    else
    {
      objc_msgSend(v74, "dictionaryRepresentation");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = CFSTR("style_attributes");
    }
    v78 = v76;

    objc_msgSend(v4, "setObject:forKey:", v78, v77);
  }

  objc_msgSend((id)a1, "walletCategoryId");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (v79)
  {
    if (a2)
      v80 = CFSTR("walletCategoryId");
    else
      v80 = CFSTR("wallet_category_id");
    objc_msgSend(v4, "setObject:forKey:", v79, v80);
  }

  objc_msgSend((id)a1, "mapsCategoryId");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (v81)
  {
    if (a2)
      v82 = CFSTR("mapsCategoryId");
    else
      v82 = CFSTR("maps_category_id");
    objc_msgSend(v4, "setObject:forKey:", v81, v82);
  }

  if ((*(_BYTE *)(a1 + v5[251] + 1) & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 321));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v84 = CFSTR("enableRapLightweightFeedback");
    else
      v84 = CFSTR("enable_rap_lightweight_feedback");
    objc_msgSend(v4, "setObject:forKey:", v83, v84);

  }
  if (objc_msgSend(*(id *)(a1 + 96), "count"))
  {
    v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    v161 = 0u;
    v162 = 0u;
    v163 = 0u;
    v164 = 0u;
    v86 = *(id *)(a1 + 96);
    v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v161, v178, 16);
    if (v87)
    {
      v88 = v87;
      v89 = *(_QWORD *)v162;
      do
      {
        for (m = 0; m != v88; ++m)
        {
          if (*(_QWORD *)v162 != v89)
            objc_enumerationMutation(v86);
          v91 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v91, "jsonRepresentation");
          else
            objc_msgSend(v91, "dictionaryRepresentation");
          v92 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v85, "addObject:", v92);
        }
        v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v161, v178, 16);
      }
      while (v88);
    }

    if (a2)
      v93 = CFSTR("alternateSearchableName");
    else
      v93 = CFSTR("alternate_searchable_name");
    objc_msgSend(v4, "setObject:forKey:", v85, v93);

    v5 = &OBJC_IVAR___GEOPDButtonModuleConfiguration__unknownFields;
  }
  v94 = *(_QWORD *)(a1 + v5[251]);
  if ((v94 & 8) == 0)
  {
    if ((v94 & 4) == 0)
      goto LABEL_183;
LABEL_225:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 120));
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v118 = CFSTR("buildingId");
    else
      v118 = CFSTR("building_id");
    objc_msgSend(v4, "setObject:forKey:", v117, v118);

    if ((*(_QWORD *)(a1 + 328) & 1) == 0)
      goto LABEL_188;
    goto LABEL_184;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 144));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v116 = CFSTR("globalBrandMuid");
  else
    v116 = CFSTR("global_brand_muid");
  objc_msgSend(v4, "setObject:forKey:", v115, v116);

  v94 = *(_QWORD *)(a1 + 328);
  if ((v94 & 4) != 0)
    goto LABEL_225;
LABEL_183:
  if ((v94 & 1) != 0)
  {
LABEL_184:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 104));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v96 = CFSTR("areaHighlightId");
    else
      v96 = CFSTR("area_highlight_id");
    objc_msgSend(v4, "setObject:forKey:", v95, v96);

  }
LABEL_188:
  objc_msgSend((id)a1, "modernMapsCategoryId");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  if (v97)
  {
    if (a2)
      v98 = CFSTR("modernMapsCategoryId");
    else
      v98 = CFSTR("modern_maps_category_id");
    objc_msgSend(v4, "setObject:forKey:", v97, v98);
  }

  if (objc_msgSend(*(id *)(a1 + 192), "count"))
  {
    v100 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 192), "count"));
    v157 = 0u;
    v158 = 0u;
    v159 = 0u;
    v160 = 0u;
    v101 = *(id *)(a1 + 192);
    v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v157, v177, 16);
    if (v102)
    {
      v103 = v102;
      v104 = *(_QWORD *)v158;
      do
      {
        for (n = 0; n != v103; ++n)
        {
          if (*(_QWORD *)v158 != v104)
            objc_enumerationMutation(v101);
          v106 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * n);
          if ((a2 & 1) != 0)
            objc_msgSend(v106, "jsonRepresentation");
          else
            objc_msgSend(v106, "dictionaryRepresentation");
          v107 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v100, "addObject:", v107);
        }
        v103 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v157, v177, 16);
      }
      while (v103);
    }

    if (a2)
      v108 = CFSTR("modernLocalizedCategory");
    else
      v108 = CFSTR("modern_localized_category");
    objc_msgSend(v4, "setObject:forKey:", v100, v108);

    v5 = &OBJC_IVAR___GEOPDButtonModuleConfiguration__unknownFields;
  }
  if ((*(_BYTE *)(a1 + v5[251]) & 0x80) != 0)
  {
    LODWORD(v99) = *(_DWORD *)(a1 + 300);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v99);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v110 = CFSTR("photosMemoryScore");
    else
      v110 = CFSTR("photos_memory_score");
    objc_msgSend(v4, "setObject:forKey:", v109, v110);

  }
  if (*(_QWORD *)(a1 + 168))
  {
    objc_msgSend((id)a1, "mapsAltCategoryIds");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v112 = CFSTR("mapsAltCategoryId");
    else
      v112 = CFSTR("maps_alt_category_id");
    objc_msgSend(v4, "setObject:forKey:", v111, v112);

  }
  if ((*(_BYTE *)(a1 + v5[251] + 1) & 1) != 0)
  {
    v113 = *(int *)(a1 + 304);
    if (v113 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 304));
      v114 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v114 = off_1E1C0BA08[v113];
    }
    objc_msgSend(v4, "setObject:forKey:", v114, CFSTR("placeCategoryType"));

  }
  objc_msgSend((id)a1, "inlineRapEnablement");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v122;
  if (v122)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v122, "jsonRepresentation");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = CFSTR("inlineRapEnablement");
    }
    else
    {
      objc_msgSend(v122, "dictionaryRepresentation");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = CFSTR("inline_rap_enablement");
    }
    v126 = v124;

    objc_msgSend(v4, "setObject:forKey:", v126, v125);
  }

  if ((*(_BYTE *)(a1 + v5[251]) & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 184));
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v128 = CFSTR("mapsCategoryMuid");
    else
      v128 = CFSTR("maps_category_muid");
    objc_msgSend(v4, "setObject:forKey:", v127, v128);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    PBRepeatedUInt64NSArray();
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v130 = CFSTR("mapsAltCategoryMuid");
    else
      v130 = CFSTR("maps_alt_category_muid");
    objc_msgSend(v4, "setObject:forKey:", v129, v130);

  }
  objc_msgSend((id)a1, "disclaimerText");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = v131;
  if (v131)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v131, "jsonRepresentation");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = CFSTR("disclaimerText");
    }
    else
    {
      objc_msgSend(v131, "dictionaryRepresentation");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = CFSTR("disclaimer_text");
    }
    v135 = v133;

    objc_msgSend(v4, "setObject:forKey:", v135, v134);
  }

  objc_msgSend((id)a1, "urlData");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = v136;
  if (v136)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v136, "jsonRepresentation");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = CFSTR("urlData");
    }
    else
    {
      objc_msgSend(v136, "dictionaryRepresentation");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = CFSTR("url_data");
    }
    v140 = v138;

    objc_msgSend(v4, "setObject:forKey:", v140, v139);
  }

  v141 = *(void **)(a1 + 16);
  if (v141)
  {
    objc_msgSend(v141, "dictionaryRepresentation");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = v142;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v142, "count"));
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v155[0] = MEMORY[0x1E0C809B0];
      v155[1] = 3221225472;
      v155[2] = __41__GEOPDEntity__dictionaryRepresentation___block_invoke;
      v155[3] = &unk_1E1C00600;
      v145 = v144;
      v156 = v145;
      objc_msgSend(v143, "enumerateKeysAndObjectsUsingBlock:", v155);
      v146 = v145;

      v143 = v146;
    }
    objc_msgSend(v4, "setObject:forKey:", v143, CFSTR("Unknown Fields"));

  }
  v147 = v4;

  return v147;
}

- (id)bestLocalizedString
{
  void *v2;
  void *v3;

  -[GEOPDEntity names](self, "names");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOLocalizedString bestStringForCurrentLocale:fallbackToFirstAvailable:](GEOLocalizedString, "bestStringForCurrentLocale:fallbackToFirstAvailable:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (GEOPDEntity)initWithData:(id)a3
{
  GEOPDEntity *v3;
  GEOPDEntity *v4;
  GEOPDEntity *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDEntity;
  v3 = -[GEOPDEntity initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setType:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x40000000800uLL;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000000800;
  self->_flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasType
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;
  id result;

  switch(a3)
  {
    case '#':
      v3 = CFSTR("TIME_ZONE");
      goto LABEL_3;
    case '$':
    case '%':
    case '&':
    case '\'':
    case '(':
    case ')':
    case '*':
    case '4':
    case '5':
    case '8':
    case ':':
    case ';':
    case '<':
    case '>':
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_3:
      result = v3;
      break;
    case '+':
      result = CFSTR("SUB_LOCALITY");
      break;
    case ',':
      result = CFSTR("OCEAN");
      break;
    case '-':
      result = CFSTR("AOI");
      break;
    case '.':
      result = CFSTR("INLAND_WATER");
      break;
    case '/':
      result = CFSTR("BUSINESS");
      break;
    case '0':
      result = CFSTR("ISLAND");
      break;
    case '1':
      result = CFSTR("STREET");
      break;
    case '2':
      result = CFSTR("ADMIN");
      break;
    case '3':
      result = CFSTR("POSTAL");
      break;
    case '6':
      result = CFSTR("INTERSECTION");
      break;
    case '7':
      result = CFSTR("BUILDING");
      break;
    case '9':
      result = CFSTR("ADDRESS");
      break;
    case '=':
      result = CFSTR("CONTINENT");
      break;
    case '?':
      result = CFSTR("REGION");
      break;
    case '@':
      result = CFSTR("DIVISION");
      break;
    case 'A':
      result = CFSTR("PHYSICAL_FEATURE");
      break;
    default:
      v3 = CFSTR("UNKNOWN_PLACE_TYPE");
      switch(a3)
      {
        case 0:
          goto LABEL_3;
        case 1:
          result = CFSTR("COUNTRY");
          break;
        case 2:
          result = CFSTR("ADMINISTRATIVE_AREA");
          break;
        case 3:
          goto LABEL_9;
        case 4:
          result = CFSTR("SUB_ADMINISTRATIVE_AREA");
          break;
        default:
          if (a3 != 16)
            goto LABEL_9;
          result = CFSTR("LOCALITY");
          break;
      }
      break;
  }
  return result;
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_PLACE_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COUNTRY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADMINISTRATIVE_AREA")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUB_ADMINISTRATIVE_AREA")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCALITY")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIME_ZONE")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUB_LOCALITY")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OCEAN")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AOI")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INLAND_WATER")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ISLAND")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STREET")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADMIN")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POSTAL")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERSECTION")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUILDING")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTINENT")) & 1) != 0)
  {
    v4 = 61;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REGION")) & 1) != 0)
  {
    v4 = 63;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIVISION")) & 1) != 0)
  {
    v4 = 64;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PHYSICAL_FEATURE")))
  {
    v4 = 65;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasTelephone
{
  -[GEOPDEntity _readTelephone]((uint64_t)self);
  return self->_telephone != 0;
}

- (void)setTelephone:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x44000000000uLL;
  objc_storeStrong((id *)&self->_telephone, a3);
}

- (void)_readAltTelephones
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 330) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAltTelephones_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)altTelephones
{
  -[GEOPDEntity _readAltTelephones]((uint64_t)self);
  return self->_altTelephones;
}

- (void)setAltTelephones:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *altTelephones;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  altTelephones = self->_altTelephones;
  self->_altTelephones = v4;

}

- (void)clearAltTelephones
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  -[NSMutableArray removeAllObjects](self->_altTelephones, "removeAllObjects");
}

- (void)addAltTelephone:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDEntity _readAltTelephones]((uint64_t)self);
  -[GEOPDEntity _addNoFlagsAltTelephone:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
}

- (void)_addNoFlagsAltTelephone:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 80);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v5;

      v4 = *(void **)(a1 + 80);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)altTelephonesCount
{
  -[GEOPDEntity _readAltTelephones]((uint64_t)self);
  return -[NSMutableArray count](self->_altTelephones, "count");
}

- (id)altTelephoneAtIndex:(unint64_t)a3
{
  -[GEOPDEntity _readAltTelephones]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_altTelephones, "objectAtIndex:", a3);
}

+ (Class)altTelephoneType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasFax
{
  -[GEOPDEntity _readFax]((uint64_t)self);
  return self->_fax != 0;
}

- (void)setFax:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x40004000000uLL;
  objc_storeStrong((id *)&self->_fax, a3);
}

- (void)_readAltFaxs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 330) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAltFaxs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)altFaxs
{
  -[GEOPDEntity _readAltFaxs]((uint64_t)self);
  return self->_altFaxs;
}

- (void)setAltFaxs:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *altFaxs;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  altFaxs = self->_altFaxs;
  self->_altFaxs = v4;

}

- (void)clearAltFaxs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  -[NSMutableArray removeAllObjects](self->_altFaxs, "removeAllObjects");
}

- (void)addAltFax:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDEntity _readAltFaxs]((uint64_t)self);
  -[GEOPDEntity _addNoFlagsAltFax:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
}

- (void)_addNoFlagsAltFax:(uint64_t)a1
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

- (unint64_t)altFaxsCount
{
  -[GEOPDEntity _readAltFaxs]((uint64_t)self);
  return -[NSMutableArray count](self->_altFaxs, "count");
}

- (id)altFaxAtIndex:(unint64_t)a3
{
  -[GEOPDEntity _readAltFaxs]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_altFaxs, "objectAtIndex:", a3);
}

+ (Class)altFaxType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasUrl
{
  -[GEOPDEntity _readUrl]((uint64_t)self);
  return self->_url != 0;
}

- (void)setUrl:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x50000000000uLL;
  objc_storeStrong((id *)&self->_url, a3);
}

- (void)_readAltUrls
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 330) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAltUrls_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)altUrls
{
  -[GEOPDEntity _readAltUrls]((uint64_t)self);
  return self->_altUrls;
}

- (void)setAltUrls:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *altUrls;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  altUrls = self->_altUrls;
  self->_altUrls = v4;

}

- (void)clearAltUrls
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  -[NSMutableArray removeAllObjects](self->_altUrls, "removeAllObjects");
}

- (void)addAltUrl:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDEntity _readAltUrls]((uint64_t)self);
  -[GEOPDEntity _addNoFlagsAltUrl:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
}

- (void)_addNoFlagsAltUrl:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 88);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v5;

      v4 = *(void **)(a1 + 88);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)altUrlsCount
{
  -[GEOPDEntity _readAltUrls]((uint64_t)self);
  return -[NSMutableArray count](self->_altUrls, "count");
}

- (id)altUrlAtIndex:(unint64_t)a3
{
  -[GEOPDEntity _readAltUrls]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_altUrls, "objectAtIndex:", a3);
}

+ (Class)altUrlType
{
  return (Class)objc_opt_class();
}

- (BOOL)isPermanentlyClosed
{
  return self->_isPermanentlyClosed;
}

- (void)setIsPermanentlyClosed:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x40000008000uLL;
  self->_isPermanentlyClosed = a3;
}

- (void)setHasIsPermanentlyClosed:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000008000;
  self->_flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasIsPermanentlyClosed
{
  return *((unsigned __int8 *)&self->_flags + 1) >> 7;
}

- (BOOL)isDisputed
{
  return self->_isDisputed;
}

- (void)setIsDisputed:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x40000004000uLL;
  self->_isDisputed = a3;
}

- (void)setHasIsDisputed:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000004000;
  self->_flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (void)setNames:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *names;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  names = self->_names;
  self->_names = v4;

}

- (void)clearNames
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  -[NSMutableArray removeAllObjects](self->_names, "removeAllObjects");
}

- (void)addName:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDEntity _readNames]((uint64_t)self);
  -[GEOPDEntity _addNoFlagsName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
}

- (unint64_t)namesCount
{
  -[GEOPDEntity _readNames]((uint64_t)self);
  return -[NSMutableArray count](self->_names, "count");
}

- (id)nameAtIndex:(unint64_t)a3
{
  -[GEOPDEntity _readNames]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_names, "objectAtIndex:", a3);
}

+ (Class)nameType
{
  return (Class)objc_opt_class();
}

- (void)_readSpokenNames
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 332) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSpokenNames_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)spokenNames
{
  -[GEOPDEntity _readSpokenNames]((uint64_t)self);
  return self->_spokenNames;
}

- (void)setSpokenNames:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *spokenNames;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  spokenNames = self->_spokenNames;
  self->_spokenNames = v4;

}

- (void)clearSpokenNames
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  -[NSMutableArray removeAllObjects](self->_spokenNames, "removeAllObjects");
}

- (void)addSpokenName:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDEntity _readSpokenNames]((uint64_t)self);
  -[GEOPDEntity _addNoFlagsSpokenName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
}

- (void)_addNoFlagsSpokenName:(uint64_t)a1
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

- (unint64_t)spokenNamesCount
{
  -[GEOPDEntity _readSpokenNames]((uint64_t)self);
  return -[NSMutableArray count](self->_spokenNames, "count");
}

- (id)spokenNameAtIndex:(unint64_t)a3
{
  -[GEOPDEntity _readSpokenNames]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_spokenNames, "objectAtIndex:", a3);
}

+ (Class)spokenNameType
{
  return (Class)objc_opt_class();
}

- (void)_readLocalizedCategorys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 331) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalizedCategorys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)localizedCategorys
{
  -[GEOPDEntity _readLocalizedCategorys]((uint64_t)self);
  return self->_localizedCategorys;
}

- (void)setLocalizedCategorys:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *localizedCategorys;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  localizedCategorys = self->_localizedCategorys;
  self->_localizedCategorys = v4;

}

- (void)clearLocalizedCategorys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  -[NSMutableArray removeAllObjects](self->_localizedCategorys, "removeAllObjects");
}

- (void)addLocalizedCategory:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDEntity _readLocalizedCategorys]((uint64_t)self);
  -[GEOPDEntity _addNoFlagsLocalizedCategory:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
}

- (void)_addNoFlagsLocalizedCategory:(uint64_t)a1
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

- (unint64_t)localizedCategorysCount
{
  -[GEOPDEntity _readLocalizedCategorys]((uint64_t)self);
  return -[NSMutableArray count](self->_localizedCategorys, "count");
}

- (id)localizedCategoryAtIndex:(unint64_t)a3
{
  -[GEOPDEntity _readLocalizedCategorys]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_localizedCategorys, "objectAtIndex:", a3);
}

+ (Class)localizedCategoryType
{
  return (Class)objc_opt_class();
}

- (BOOL)telephoneAdsOptOut
{
  return self->_telephoneAdsOptOut;
}

- (void)setTelephoneAdsOptOut:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x40000020000uLL;
  self->_telephoneAdsOptOut = a3;
}

- (void)setHasTelephoneAdsOptOut:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000020000;
  self->_flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasTelephoneAdsOptOut
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 1) & 1;
}

- (BOOL)altTelephoneAdsOptOut
{
  return self->_altTelephoneAdsOptOut;
}

- (void)setAltTelephoneAdsOptOut:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x40000001000uLL;
  self->_altTelephoneAdsOptOut = a3;
}

- (void)setHasAltTelephoneAdsOptOut:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000001000;
  self->_flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasAltTelephoneAdsOptOut
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (BOOL)isStandaloneBrand
{
  return self->_isStandaloneBrand;
}

- (void)setIsStandaloneBrand:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x40000010000uLL;
  self->_isStandaloneBrand = a3;
}

- (void)setHasIsStandaloneBrand:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000010000;
  self->_flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasIsStandaloneBrand
{
  return *((_BYTE *)&self->_flags + 2) & 1;
}

- (int)displayStyle
{
  os_unfair_lock_s *p_readerLock;
  $F2AA8D11DDD6D71BA01031F215D029B3 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x40) != 0)
    return self->_displayStyle;
  else
    return 1;
}

- (void)setDisplayStyle:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x40000000040uLL;
  self->_displayStyle = a3;
}

- (void)setHasDisplayStyle:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000000040;
  self->_flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasDisplayStyle
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (id)displayStyleAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C0B9A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDisplayStyle:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_DISPLAY_STYLE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_DISPLAY_STYLE_FULL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_DISPLAY_STYLE_SHORT")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)searchSection
{
  os_unfair_lock_s *p_readerLock;
  $F2AA8D11DDD6D71BA01031F215D029B3 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x400) != 0)
    return self->_searchSection;
  else
    return 0;
}

- (void)setSearchSection:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x40000000400uLL;
  self->_searchSection = a3;
}

- (void)setHasSearchSection:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000000400;
  self->_flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(_QWORD *)&self->_flags & 0xFFFFFBFFFFFFFBFFLL | v3);
}

- (BOOL)hasSearchSection
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (id)searchSectionAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C0B9C0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSearchSection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SEARCH_SECTION_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SEARCH_SECTION_MAPS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SEARCH_SECTION_BUSINESS")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)placeDisplayType
{
  os_unfair_lock_s *p_readerLock;
  $F2AA8D11DDD6D71BA01031F215D029B3 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x200) != 0)
    return self->_placeDisplayType;
  else
    return 0;
}

- (void)setPlaceDisplayType:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x40000000200uLL;
  self->_placeDisplayType = a3;
}

- (void)setHasPlaceDisplayType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000000200;
  self->_flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasPlaceDisplayType
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (id)placeDisplayTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C0B9D8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPlaceDisplayType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REGION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("BRAND")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)brandMuid
{
  return self->_brandMuid;
}

- (void)setBrandMuid:(unint64_t)a3
{
  *(_QWORD *)&self->_flags |= 0x40000000002uLL;
  self->_brandMuid = a3;
}

- (void)setHasBrandMuid:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000000002;
  self->_flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasBrandMuid
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x40000000020uLL;
  self->_capacity = a3;
}

- (void)setHasCapacity:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000000020;
  self->_flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasCapacity
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (void)_readPlaceLookupCategorys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 330) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceLookupCategorys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (unint64_t)placeLookupCategorysCount
{
  -[GEOPDEntity _readPlaceLookupCategorys]((uint64_t)self);
  return self->_placeLookupCategorys.count;
}

- (int)placeLookupCategorys
{
  -[GEOPDEntity _readPlaceLookupCategorys]((uint64_t)self);
  return self->_placeLookupCategorys.list;
}

- (void)clearPlaceLookupCategorys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  PBRepeatedInt32Clear();
}

- (void)addPlaceLookupCategory:(int)a3
{
  -[GEOPDEntity _readPlaceLookupCategorys]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
}

- (int)placeLookupCategoryAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_placeLookupCategorys;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPDEntity _readPlaceLookupCategorys]((uint64_t)self);
  p_placeLookupCategorys = &self->_placeLookupCategorys;
  count = self->_placeLookupCategorys.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_placeLookupCategorys->list[a3];
}

- (void)setPlaceLookupCategorys:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  PBRepeatedInt32Set();
}

- (id)placeLookupCategorysAsString:(int)a3
{
  if (a3 < 0x18)
    return off_1E1C0C2C0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPlaceLookupCategorys:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_ENTERTAINMENT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_AMUSEMENTPARK")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_AQUARIUM")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_ZOO")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_STADIUM")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_SKATE_PARK")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_CULTURE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_LANDMARK")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_MUSEUM")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_RESTAURANT")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_NIGHTLIFE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_PARK")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_AIRPORT")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_SHOPPING")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_BEACH")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_MOUNTAIN")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_FITNESS")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_ACTIVITY")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_DIVING")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_HIKING")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_PERFORMANCE")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_HOSPITAL")) & 1) != 0)
  {
    v4 = 22;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_AMUSEMENTPARK_RIDE")))
  {
    v4 = 23;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasSecondaryName
{
  -[GEOPDEntity _readSecondaryName]((uint64_t)self);
  return self->_secondaryName != 0;
}

- (void)setSecondaryName:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x40400000000uLL;
  objc_storeStrong((id *)&self->_secondaryName, a3);
}

- (BOOL)hasSecondarySpokenName
{
  -[GEOPDEntity _readSecondarySpokenName]((uint64_t)self);
  return self->_secondarySpokenName != 0;
}

- (void)setSecondarySpokenName:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x40800000000uLL;
  objc_storeStrong((id *)&self->_secondarySpokenName, a3);
}

- (BOOL)hasStyleAttributes
{
  -[GEOPDEntity _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes != 0;
}

- (void)setStyleAttributes:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x42000000000uLL;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (BOOL)hasWalletCategoryId
{
  -[GEOPDEntity _readWalletCategoryId]((uint64_t)self);
  return self->_walletCategoryId != 0;
}

- (void)setWalletCategoryId:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x60000000000uLL;
  objc_storeStrong((id *)&self->_walletCategoryId, a3);
}

- (BOOL)hasMapsCategoryId
{
  -[GEOPDEntity _readMapsCategoryId]((uint64_t)self);
  return self->_mapsCategoryId != 0;
}

- (void)setMapsCategoryId:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x40040000000uLL;
  objc_storeStrong((id *)&self->_mapsCategoryId, a3);
}

- (BOOL)enableRapLightweightFeedback
{
  os_unfair_lock_s *p_readerLock;
  $F2AA8D11DDD6D71BA01031F215D029B3 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x2000) != 0 && self->_enableRapLightweightFeedback;
}

- (void)setEnableRapLightweightFeedback:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x40000002000uLL;
  self->_enableRapLightweightFeedback = a3;
}

- (void)setHasEnableRapLightweightFeedback:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000002000;
  self->_flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasEnableRapLightweightFeedback
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (void)_readAlternateSearchableNames
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 331) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAlternateSearchableNames_tags_3329);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)alternateSearchableNames
{
  -[GEOPDEntity _readAlternateSearchableNames]((uint64_t)self);
  return self->_alternateSearchableNames;
}

- (void)setAlternateSearchableNames:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *alternateSearchableNames;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  alternateSearchableNames = self->_alternateSearchableNames;
  self->_alternateSearchableNames = v4;

}

- (void)clearAlternateSearchableNames
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  -[NSMutableArray removeAllObjects](self->_alternateSearchableNames, "removeAllObjects");
}

- (void)addAlternateSearchableName:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDEntity _readAlternateSearchableNames]((uint64_t)self);
  -[GEOPDEntity _addNoFlagsAlternateSearchableName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
}

- (void)_addNoFlagsAlternateSearchableName:(uint64_t)a1
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

- (unint64_t)alternateSearchableNamesCount
{
  -[GEOPDEntity _readAlternateSearchableNames]((uint64_t)self);
  return -[NSMutableArray count](self->_alternateSearchableNames, "count");
}

- (id)alternateSearchableNameAtIndex:(unint64_t)a3
{
  -[GEOPDEntity _readAlternateSearchableNames]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_alternateSearchableNames, "objectAtIndex:", a3);
}

+ (Class)alternateSearchableNameType
{
  return (Class)objc_opt_class();
}

- (unint64_t)globalBrandMuid
{
  return self->_globalBrandMuid;
}

- (void)setGlobalBrandMuid:(unint64_t)a3
{
  *(_QWORD *)&self->_flags |= 0x40000000008uLL;
  self->_globalBrandMuid = a3;
}

- (void)setHasGlobalBrandMuid:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000000008;
  self->_flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasGlobalBrandMuid
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (unint64_t)buildingId
{
  return self->_buildingId;
}

- (void)setBuildingId:(unint64_t)a3
{
  *(_QWORD *)&self->_flags |= 0x40000000004uLL;
  self->_buildingId = a3;
}

- (void)setHasBuildingId:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000000004;
  self->_flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasBuildingId
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unint64_t)areaHighlightId
{
  return self->_areaHighlightId;
}

- (void)setAreaHighlightId:(unint64_t)a3
{
  *(_QWORD *)&self->_flags |= 0x40000000001uLL;
  self->_areaHighlightId = a3;
}

- (void)setHasAreaHighlightId:(BOOL)a3
{
  self->_flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x40000000000);
}

- (BOOL)hasAreaHighlightId
{
  return *(_DWORD *)&self->_flags & 1;
}

- (BOOL)hasModernMapsCategoryId
{
  -[GEOPDEntity _readModernMapsCategoryId]((uint64_t)self);
  return self->_modernMapsCategoryId != 0;
}

- (void)setModernMapsCategoryId:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x40100000000uLL;
  objc_storeStrong((id *)&self->_modernMapsCategoryId, a3);
}

- (void)_readModernLocalizedCategorys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 331) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readModernLocalizedCategorys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)modernLocalizedCategorys
{
  -[GEOPDEntity _readModernLocalizedCategorys]((uint64_t)self);
  return self->_modernLocalizedCategorys;
}

- (void)setModernLocalizedCategorys:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *modernLocalizedCategorys;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  modernLocalizedCategorys = self->_modernLocalizedCategorys;
  self->_modernLocalizedCategorys = v4;

}

- (void)clearModernLocalizedCategorys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  -[NSMutableArray removeAllObjects](self->_modernLocalizedCategorys, "removeAllObjects");
}

- (void)addModernLocalizedCategory:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDEntity _readModernLocalizedCategorys]((uint64_t)self);
  -[GEOPDEntity _addNoFlagsModernLocalizedCategory:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
}

- (void)_addNoFlagsModernLocalizedCategory:(uint64_t)a1
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

- (unint64_t)modernLocalizedCategorysCount
{
  -[GEOPDEntity _readModernLocalizedCategorys]((uint64_t)self);
  return -[NSMutableArray count](self->_modernLocalizedCategorys, "count");
}

- (id)modernLocalizedCategoryAtIndex:(unint64_t)a3
{
  -[GEOPDEntity _readModernLocalizedCategorys]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_modernLocalizedCategorys, "objectAtIndex:", a3);
}

+ (Class)modernLocalizedCategoryType
{
  return (Class)objc_opt_class();
}

- (float)photosMemoryScore
{
  return self->_photosMemoryScore;
}

- (void)setPhotosMemoryScore:(float)a3
{
  *(_QWORD *)&self->_flags |= 0x40000000080uLL;
  self->_photosMemoryScore = a3;
}

- (void)setHasPhotosMemoryScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000000080;
  self->_flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasPhotosMemoryScore
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (void)_readMapsAltCategoryIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 331) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsAltCategoryIds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)mapsAltCategoryIds
{
  -[GEOPDEntity _readMapsAltCategoryIds]((uint64_t)self);
  return self->_mapsAltCategoryIds;
}

- (void)setMapsAltCategoryIds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *mapsAltCategoryIds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  mapsAltCategoryIds = self->_mapsAltCategoryIds;
  self->_mapsAltCategoryIds = v4;

}

- (void)clearMapsAltCategoryIds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  -[NSMutableArray removeAllObjects](self->_mapsAltCategoryIds, "removeAllObjects");
}

- (void)addMapsAltCategoryId:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDEntity _readMapsAltCategoryIds]((uint64_t)self);
  -[GEOPDEntity _addNoFlagsMapsAltCategoryId:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
}

- (void)_addNoFlagsMapsAltCategoryId:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 168);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 168);
      *(_QWORD *)(a1 + 168) = v5;

      v4 = *(void **)(a1 + 168);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)mapsAltCategoryIdsCount
{
  -[GEOPDEntity _readMapsAltCategoryIds]((uint64_t)self);
  return -[NSMutableArray count](self->_mapsAltCategoryIds, "count");
}

- (id)mapsAltCategoryIdAtIndex:(unint64_t)a3
{
  -[GEOPDEntity _readMapsAltCategoryIds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_mapsAltCategoryIds, "objectAtIndex:", a3);
}

+ (Class)mapsAltCategoryIdType
{
  return (Class)objc_opt_class();
}

- (int)placeCategoryType
{
  os_unfair_lock_s *p_readerLock;
  $F2AA8D11DDD6D71BA01031F215D029B3 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x100) != 0)
    return self->_placeCategoryType;
  else
    return 0;
}

- (void)setPlaceCategoryType:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x40000000100uLL;
  self->_placeCategoryType = a3;
}

- (void)setHasPlaceCategoryType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000000100;
  self->_flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasPlaceCategoryType
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (id)placeCategoryTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C0BA08[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPlaceCategoryType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_CATEGORY_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_CATEGORY_TYPE_TRAIL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_CATEGORY_TYPE_TRAIL_HEAD")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_CATEGORY_TYPE_PHYSICAL_FEATURE_MOUNTAIN")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_CATEGORY_TYPE_PHYSICAL_FEATURE_VOLCANO")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasInlineRapEnablement
{
  -[GEOPDEntity _readInlineRapEnablement]((uint64_t)self);
  return self->_inlineRapEnablement != 0;
}

- (void)setInlineRapEnablement:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x40008000000uLL;
  objc_storeStrong((id *)&self->_inlineRapEnablement, a3);
}

- (unint64_t)mapsCategoryMuid
{
  return self->_mapsCategoryMuid;
}

- (void)setMapsCategoryMuid:(unint64_t)a3
{
  *(_QWORD *)&self->_flags |= 0x40000000010uLL;
  self->_mapsCategoryMuid = a3;
}

- (void)setHasMapsCategoryMuid:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000000010;
  self->_flags = ($F2AA8D11DDD6D71BA01031F215D029B3)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasMapsCategoryMuid
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (void)_readMapsAltCategoryMuids
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 330) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsAltCategoryMuids_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (unint64_t)mapsAltCategoryMuidsCount
{
  -[GEOPDEntity _readMapsAltCategoryMuids]((uint64_t)self);
  return self->_mapsAltCategoryMuids.count;
}

- (unint64_t)mapsAltCategoryMuids
{
  -[GEOPDEntity _readMapsAltCategoryMuids]((uint64_t)self);
  return self->_mapsAltCategoryMuids.list;
}

- (void)clearMapsAltCategoryMuids
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  PBRepeatedUInt64Clear();
}

- (void)addMapsAltCategoryMuid:(unint64_t)a3
{
  -[GEOPDEntity _readMapsAltCategoryMuids]((uint64_t)self);
  if (self)
    PBRepeatedUInt64Add();
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
}

- (unint64_t)mapsAltCategoryMuidAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_mapsAltCategoryMuids;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPDEntity _readMapsAltCategoryMuids]((uint64_t)self);
  p_mapsAltCategoryMuids = &self->_mapsAltCategoryMuids;
  count = self->_mapsAltCategoryMuids.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_mapsAltCategoryMuids->list[a3];
}

- (void)setMapsAltCategoryMuids:(unint64_t *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  PBRepeatedUInt64Set();
}

- (void)_readDisclaimerText
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 331) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisclaimerText_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasDisclaimerText
{
  -[GEOPDEntity _readDisclaimerText]((uint64_t)self);
  return self->_disclaimerText != 0;
}

- (GEOLocalizedString)disclaimerText
{
  -[GEOPDEntity _readDisclaimerText]((uint64_t)self);
  return self->_disclaimerText;
}

- (void)setDisclaimerText:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x40002000000uLL;
  objc_storeStrong((id *)&self->_disclaimerText, a3);
}

- (void)_readUrlData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 332) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUrlData_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasUrlData
{
  -[GEOPDEntity _readUrlData]((uint64_t)self);
  return self->_urlData != 0;
}

- (GEOPDURLData)urlData
{
  -[GEOPDEntity _readUrlData]((uint64_t)self);
  return self->_urlData;
}

- (void)setUrlData:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x48000000000uLL;
  objc_storeStrong((id *)&self->_urlData, a3);
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
  v8.super_class = (Class)GEOPDEntity;
  -[GEOPDEntity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDEntity dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)jsonRepresentation
{
  return -[GEOPDEntity _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEOPDEntity__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDEntity)initWithDictionary:(id)a3
{
  return (GEOPDEntity *)-[GEOPDEntity _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t m;
  uint64_t v53;
  GEOLocalizedString *v54;
  uint64_t v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t n;
  uint64_t v64;
  GEOLocalizedString *v65;
  uint64_t v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t ii;
  uint64_t v75;
  GEOPDCategory *v76;
  uint64_t v77;
  void *v78;
  const __CFString *v79;
  void *v80;
  const __CFString *v81;
  void *v82;
  const __CFString *v83;
  void *v84;
  const __CFString *v85;
  void *v86;
  id v87;
  uint64_t v88;
  const __CFString *v89;
  void *v90;
  id v91;
  uint64_t v92;
  const __CFString *v93;
  void *v94;
  id v95;
  uint64_t v96;
  const __CFString *v97;
  void *v98;
  void *v99;
  const __CFString *v100;
  void *v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t jj;
  void *v107;
  id v108;
  uint64_t v109;
  const __CFString *v110;
  void *v111;
  GEOLocalizedString *v112;
  uint64_t v113;
  void *v114;
  const __CFString *v115;
  void *v116;
  GEOLocalizedString *v117;
  uint64_t v118;
  void *v119;
  const __CFString *v120;
  void *v121;
  GEOStyleAttributes *v122;
  uint64_t v123;
  void *v124;
  const __CFString *v125;
  void *v126;
  void *v127;
  const __CFString *v128;
  void *v129;
  void *v130;
  const __CFString *v131;
  void *v132;
  const __CFString *v133;
  void *v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t kk;
  uint64_t v140;
  GEOLocalizedString *v141;
  uint64_t v142;
  void *v143;
  const __CFString *v144;
  void *v145;
  const __CFString *v146;
  void *v147;
  const __CFString *v148;
  void *v149;
  const __CFString *v150;
  void *v151;
  void *v152;
  const __CFString *v153;
  void *v154;
  id v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t mm;
  uint64_t v160;
  GEOPDCategory *v161;
  uint64_t v162;
  void *v163;
  const __CFString *v164;
  void *v165;
  const __CFString *v166;
  void *v167;
  id v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t nn;
  void *v173;
  void *v174;
  void *v175;
  id v176;
  uint64_t v177;
  const __CFString *v178;
  void *v179;
  GEOPDInlineRapEnablement *v180;
  uint64_t v181;
  void *v182;
  const __CFString *v183;
  void *v184;
  const __CFString *v185;
  void *v186;
  id v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t i1;
  void *v192;
  const __CFString *v193;
  void *v194;
  GEOLocalizedString *v195;
  uint64_t v196;
  void *v197;
  const __CFString *v198;
  void *v199;
  GEOPDURLData *v200;
  uint64_t v201;
  void *v202;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  id v210;
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
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  _BYTE v255[128];
  _BYTE v256[128];
  _BYTE v257[128];
  _BYTE v258[128];
  _BYTE v259[128];
  _BYTE v260[128];
  _BYTE v261[128];
  _BYTE v262[128];
  _BYTE v263[128];
  _BYTE v264[128];
  _BYTE v265[128];
  uint64_t v266;

  v266 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_471;
  v6 = (id)objc_msgSend(a1, "init");

  if (!v6)
  {
    a1 = 0;
    goto LABEL_471;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v210 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UNKNOWN_PLACE_TYPE")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COUNTRY")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ADMINISTRATIVE_AREA")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SUB_ADMINISTRATIVE_AREA")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LOCALITY")) & 1) != 0)
    {
      v9 = 16;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TIME_ZONE")) & 1) != 0)
    {
      v9 = 35;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SUB_LOCALITY")) & 1) != 0)
    {
      v9 = 43;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("OCEAN")) & 1) != 0)
    {
      v9 = 44;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AOI")) & 1) != 0)
    {
      v9 = 45;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("INLAND_WATER")) & 1) != 0)
    {
      v9 = 46;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
    {
      v9 = 47;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ISLAND")) & 1) != 0)
    {
      v9 = 48;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("STREET")) & 1) != 0)
    {
      v9 = 49;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ADMIN")) & 1) != 0)
    {
      v9 = 50;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("POSTAL")) & 1) != 0)
    {
      v9 = 51;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("INTERSECTION")) & 1) != 0)
    {
      v9 = 54;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("BUILDING")) & 1) != 0)
    {
      v9 = 55;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
    {
      v9 = 57;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CONTINENT")) & 1) != 0)
    {
      v9 = 61;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REGION")) & 1) != 0)
    {
      v9 = 63;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DIVISION")) & 1) != 0)
    {
      v9 = 64;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("PHYSICAL_FEATURE")))
    {
      v9 = 65;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_54;
    v9 = objc_msgSend(v7, "intValue");
  }
  objc_msgSend(v6, "setType:", v9);
LABEL_54:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("telephone"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v6, "setTelephone:", v11);

  }
  if (a3)
    v12 = CFSTR("altTelephone");
  else
    v12 = CFSTR("alt_telephone");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v253 = 0u;
    v254 = 0u;
    v251 = 0u;
    v252 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v251, v265, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v252;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v252 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v251 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v20 = (void *)objc_msgSend(v19, "copy");
            objc_msgSend(v6, "addAltTelephone:", v20);

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v251, v265, 16);
      }
      while (v16);
    }

    v5 = v210;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("fax"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v6, "setFax:", v22);

  }
  if (a3)
    v23 = CFSTR("altFax");
  else
    v23 = CFSTR("alt_fax");
  objc_msgSend(v5, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v249 = 0u;
    v250 = 0u;
    v247 = 0u;
    v248 = 0u;
    v25 = v24;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v247, v264, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v248;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v248 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v247 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v31 = (void *)objc_msgSend(v30, "copy");
            objc_msgSend(v6, "addAltFax:", v31);

          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v247, v264, 16);
      }
      while (v27);
    }

    v5 = v210;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("url"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = (void *)objc_msgSend(v32, "copy");
    objc_msgSend(v6, "setUrl:", v33);

  }
  if (a3)
    v34 = CFSTR("altUrl");
  else
    v34 = CFSTR("alt_url");
  objc_msgSend(v5, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v245 = 0u;
    v246 = 0u;
    v243 = 0u;
    v244 = 0u;
    v36 = v35;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v243, v263, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v244;
      do
      {
        for (k = 0; k != v38; ++k)
        {
          if (*(_QWORD *)v244 != v39)
            objc_enumerationMutation(v36);
          v41 = *(void **)(*((_QWORD *)&v243 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v42 = (void *)objc_msgSend(v41, "copy");
            objc_msgSend(v6, "addAltUrl:", v42);

          }
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v243, v263, 16);
      }
      while (v38);
    }

    v5 = v210;
  }

  if (a3)
    v43 = CFSTR("isPermanentlyClosed");
  else
    v43 = CFSTR("is_permanently_closed");
  objc_msgSend(v5, "objectForKeyedSubscript:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIsPermanentlyClosed:", objc_msgSend(v44, "BOOLValue"));

  if (a3)
    v45 = CFSTR("isDisputed");
  else
    v45 = CFSTR("is_disputed");
  objc_msgSend(v5, "objectForKeyedSubscript:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIsDisputed:", objc_msgSend(v46, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v241 = 0u;
    v242 = 0u;
    v239 = 0u;
    v240 = 0u;
    v204 = v47;
    v48 = v47;
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v239, v262, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v240;
      do
      {
        for (m = 0; m != v50; ++m)
        {
          if (*(_QWORD *)v240 != v51)
            objc_enumerationMutation(v48);
          v53 = *(_QWORD *)(*((_QWORD *)&v239 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v54 = [GEOLocalizedString alloc];
            if ((a3 & 1) != 0)
              v55 = -[GEOLocalizedString initWithJSON:](v54, "initWithJSON:", v53);
            else
              v55 = -[GEOLocalizedString initWithDictionary:](v54, "initWithDictionary:", v53);
            v56 = (void *)v55;
            objc_msgSend(v6, "addName:", v55, v204);

          }
        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v239, v262, 16);
      }
      while (v50);
    }

    v47 = v204;
    v5 = v210;
  }

  if (a3)
    v57 = CFSTR("spokenName");
  else
    v57 = CFSTR("spoken_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v57, v204);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v237 = 0u;
    v238 = 0u;
    v235 = 0u;
    v236 = 0u;
    v205 = v58;
    v59 = v58;
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v235, v261, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v236;
      do
      {
        for (n = 0; n != v61; ++n)
        {
          if (*(_QWORD *)v236 != v62)
            objc_enumerationMutation(v59);
          v64 = *(_QWORD *)(*((_QWORD *)&v235 + 1) + 8 * n);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v65 = [GEOLocalizedString alloc];
            if ((a3 & 1) != 0)
              v66 = -[GEOLocalizedString initWithJSON:](v65, "initWithJSON:", v64);
            else
              v66 = -[GEOLocalizedString initWithDictionary:](v65, "initWithDictionary:", v64);
            v67 = (void *)v66;
            objc_msgSend(v6, "addSpokenName:", v66, v205);

          }
        }
        v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v235, v261, 16);
      }
      while (v61);
    }

    v58 = v205;
    v5 = v210;
  }

  if (a3)
    v68 = CFSTR("localizedCategory");
  else
    v68 = CFSTR("localized_category");
  objc_msgSend(v5, "objectForKeyedSubscript:", v68, v205);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v233 = 0u;
    v234 = 0u;
    v231 = 0u;
    v232 = 0u;
    v206 = v69;
    v70 = v69;
    v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v231, v260, 16);
    if (v71)
    {
      v72 = v71;
      v73 = *(_QWORD *)v232;
      do
      {
        for (ii = 0; ii != v72; ++ii)
        {
          if (*(_QWORD *)v232 != v73)
            objc_enumerationMutation(v70);
          v75 = *(_QWORD *)(*((_QWORD *)&v231 + 1) + 8 * ii);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v76 = [GEOPDCategory alloc];
            if ((a3 & 1) != 0)
              v77 = -[GEOPDCategory initWithJSON:](v76, "initWithJSON:", v75);
            else
              v77 = -[GEOPDCategory initWithDictionary:](v76, "initWithDictionary:", v75);
            v78 = (void *)v77;
            objc_msgSend(v6, "addLocalizedCategory:", v77, v206);

          }
        }
        v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v231, v260, 16);
      }
      while (v72);
    }

    v69 = v206;
    v5 = v210;
  }

  if (a3)
    v79 = CFSTR("telephoneAdsOptOut");
  else
    v79 = CFSTR("telephone_ads_opt_out");
  objc_msgSend(v5, "objectForKeyedSubscript:", v79, v206);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setTelephoneAdsOptOut:", objc_msgSend(v80, "BOOLValue"));

  if (a3)
    v81 = CFSTR("altTelephoneAdsOptOut");
  else
    v81 = CFSTR("alt_telephone_ads_opt_out");
  objc_msgSend(v5, "objectForKeyedSubscript:", v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setAltTelephoneAdsOptOut:", objc_msgSend(v82, "BOOLValue"));

  if (a3)
    v83 = CFSTR("isStandaloneBrand");
  else
    v83 = CFSTR("is_standalone_brand");
  objc_msgSend(v5, "objectForKeyedSubscript:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIsStandaloneBrand:", objc_msgSend(v84, "BOOLValue"));

  if (a3)
    v85 = CFSTR("displayStyle");
  else
    v85 = CFSTR("display_style");
  objc_msgSend(v5, "objectForKeyedSubscript:", v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v87 = v86;
    if ((objc_msgSend(v87, "isEqualToString:", CFSTR("PLACE_DISPLAY_STYLE_UNKNOWN")) & 1) != 0)
    {
      v88 = 0;
    }
    else if ((objc_msgSend(v87, "isEqualToString:", CFSTR("PLACE_DISPLAY_STYLE_FULL")) & 1) != 0)
    {
      v88 = 1;
    }
    else if (objc_msgSend(v87, "isEqualToString:", CFSTR("PLACE_DISPLAY_STYLE_SHORT")))
    {
      v88 = 2;
    }
    else
    {
      v88 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_190;
    v88 = objc_msgSend(v86, "intValue");
  }
  objc_msgSend(v6, "setDisplayStyle:", v88);
LABEL_190:

  if (a3)
    v89 = CFSTR("searchSection");
  else
    v89 = CFSTR("search_section");
  objc_msgSend(v5, "objectForKeyedSubscript:", v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v91 = v90;
    if ((objc_msgSend(v91, "isEqualToString:", CFSTR("PLACE_SEARCH_SECTION_UNKNOWN")) & 1) != 0)
    {
      v92 = 0;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("PLACE_SEARCH_SECTION_MAPS")) & 1) != 0)
    {
      v92 = 1;
    }
    else if (objc_msgSend(v91, "isEqualToString:", CFSTR("PLACE_SEARCH_SECTION_BUSINESS")))
    {
      v92 = 2;
    }
    else
    {
      v92 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_205;
    v92 = objc_msgSend(v90, "intValue");
  }
  objc_msgSend(v6, "setSearchSection:", v92);
LABEL_205:

  if (a3)
    v93 = CFSTR("placeDisplayType");
  else
    v93 = CFSTR("place_display_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v95 = v94;
    if ((objc_msgSend(v95, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v96 = 0;
    }
    else if ((objc_msgSend(v95, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
    {
      v96 = 1;
    }
    else if ((objc_msgSend(v95, "isEqualToString:", CFSTR("REGION")) & 1) != 0)
    {
      v96 = 2;
    }
    else if ((objc_msgSend(v95, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
    {
      v96 = 3;
    }
    else if ((objc_msgSend(v95, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
    {
      v96 = 4;
    }
    else if (objc_msgSend(v95, "isEqualToString:", CFSTR("BRAND")))
    {
      v96 = 5;
    }
    else
    {
      v96 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_226;
    v96 = objc_msgSend(v94, "intValue");
  }
  objc_msgSend(v6, "setPlaceDisplayType:", v96);
LABEL_226:

  if (a3)
    v97 = CFSTR("brandMuid");
  else
    v97 = CFSTR("brand_muid");
  objc_msgSend(v5, "objectForKeyedSubscript:", v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setBrandMuid:", objc_msgSend(v98, "unsignedLongLongValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("capacity"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setCapacity:", objc_msgSend(v99, "intValue"));

  if (a3)
    v100 = CFSTR("placeLookupCategory");
  else
    v100 = CFSTR("place_lookup_category");
  objc_msgSend(v5, "objectForKeyedSubscript:", v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v229 = 0u;
    v230 = 0u;
    v227 = 0u;
    v228 = 0u;
    v207 = v101;
    v102 = v101;
    v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v227, v259, 16);
    if (!v103)
      goto LABEL_298;
    v104 = v103;
    v105 = *(_QWORD *)v228;
    while (1)
    {
      for (jj = 0; jj != v104; ++jj)
      {
        if (*(_QWORD *)v228 != v105)
          objc_enumerationMutation(v102);
        v107 = *(void **)(*((_QWORD *)&v227 + 1) + 8 * jj);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v108 = v107;
          if ((objc_msgSend(v108, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_UNKNOWN")) & 1) != 0)
          {
            v109 = 0;
          }
          else if ((objc_msgSend(v108, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_ENTERTAINMENT")) & 1) != 0)
          {
            v109 = 1;
          }
          else if ((objc_msgSend(v108, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_AMUSEMENTPARK")) & 1) != 0)
          {
            v109 = 2;
          }
          else if ((objc_msgSend(v108, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_AQUARIUM")) & 1) != 0)
          {
            v109 = 3;
          }
          else if ((objc_msgSend(v108, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_ZOO")) & 1) != 0)
          {
            v109 = 4;
          }
          else if ((objc_msgSend(v108, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_STADIUM")) & 1) != 0)
          {
            v109 = 5;
          }
          else if ((objc_msgSend(v108, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_SKATE_PARK")) & 1) != 0)
          {
            v109 = 6;
          }
          else if ((objc_msgSend(v108, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_CULTURE")) & 1) != 0)
          {
            v109 = 7;
          }
          else if ((objc_msgSend(v108, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_LANDMARK")) & 1) != 0)
          {
            v109 = 8;
          }
          else if ((objc_msgSend(v108, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_MUSEUM")) & 1) != 0)
          {
            v109 = 9;
          }
          else if ((objc_msgSend(v108, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_RESTAURANT")) & 1) != 0)
          {
            v109 = 10;
          }
          else if ((objc_msgSend(v108, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_NIGHTLIFE")) & 1) != 0)
          {
            v109 = 11;
          }
          else if ((objc_msgSend(v108, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_PARK")) & 1) != 0)
          {
            v109 = 12;
          }
          else if ((objc_msgSend(v108, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_AIRPORT")) & 1) != 0)
          {
            v109 = 13;
          }
          else if ((objc_msgSend(v108, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_SHOPPING")) & 1) != 0)
          {
            v109 = 14;
          }
          else if ((objc_msgSend(v108, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_BEACH")) & 1) != 0)
          {
            v109 = 15;
          }
          else if ((objc_msgSend(v108, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_MOUNTAIN")) & 1) != 0)
          {
            v109 = 16;
          }
          else if ((objc_msgSend(v108, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_FITNESS")) & 1) != 0)
          {
            v109 = 17;
          }
          else if ((objc_msgSend(v108, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_ACTIVITY")) & 1) != 0)
          {
            v109 = 18;
          }
          else if ((objc_msgSend(v108, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_DIVING")) & 1) != 0)
          {
            v109 = 19;
          }
          else if ((objc_msgSend(v108, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_HIKING")) & 1) != 0)
          {
            v109 = 20;
          }
          else if ((objc_msgSend(v108, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_PERFORMANCE")) & 1) != 0)
          {
            v109 = 21;
          }
          else if ((objc_msgSend(v108, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_HOSPITAL")) & 1) != 0)
          {
            v109 = 22;
          }
          else if (objc_msgSend(v108, "isEqualToString:", CFSTR("SPATIAL_PLACE_LOOKUP_CATEGORY_AMUSEMENTPARK_RIDE")))
          {
            v109 = 23;
          }
          else
          {
            v109 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v109 = objc_msgSend(v107, "intValue");
        }
        objc_msgSend(v6, "addPlaceLookupCategory:", v109, v207);
      }
      v104 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v227, v259, 16);
      if (!v104)
      {
LABEL_298:

        v101 = v207;
        v5 = v210;
        break;
      }
    }
  }

  if (a3)
    v110 = CFSTR("secondaryName");
  else
    v110 = CFSTR("secondary_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v110, v207);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v112 = [GEOLocalizedString alloc];
    if ((a3 & 1) != 0)
      v113 = -[GEOLocalizedString initWithJSON:](v112, "initWithJSON:", v111);
    else
      v113 = -[GEOLocalizedString initWithDictionary:](v112, "initWithDictionary:", v111);
    v114 = (void *)v113;
    objc_msgSend(v6, "setSecondaryName:", v113);

  }
  if (a3)
    v115 = CFSTR("secondarySpokenName");
  else
    v115 = CFSTR("secondary_spoken_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v117 = [GEOLocalizedString alloc];
    if ((a3 & 1) != 0)
      v118 = -[GEOLocalizedString initWithJSON:](v117, "initWithJSON:", v116);
    else
      v118 = -[GEOLocalizedString initWithDictionary:](v117, "initWithDictionary:", v116);
    v119 = (void *)v118;
    objc_msgSend(v6, "setSecondarySpokenName:", v118);

  }
  if (a3)
    v120 = CFSTR("styleAttributes");
  else
    v120 = CFSTR("style_attributes");
  objc_msgSend(v5, "objectForKeyedSubscript:", v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v122 = [GEOStyleAttributes alloc];
    if ((a3 & 1) != 0)
      v123 = -[GEOStyleAttributes initWithJSON:](v122, "initWithJSON:", v121);
    else
      v123 = -[GEOStyleAttributes initWithDictionary:](v122, "initWithDictionary:", v121);
    v124 = (void *)v123;
    objc_msgSend(v6, "setStyleAttributes:", v123);

  }
  if (a3)
    v125 = CFSTR("walletCategoryId");
  else
    v125 = CFSTR("wallet_category_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v125);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v127 = (void *)objc_msgSend(v126, "copy");
    objc_msgSend(v6, "setWalletCategoryId:", v127);

  }
  if (a3)
    v128 = CFSTR("mapsCategoryId");
  else
    v128 = CFSTR("maps_category_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v130 = (void *)objc_msgSend(v129, "copy");
    objc_msgSend(v6, "setMapsCategoryId:", v130);

  }
  if (a3)
    v131 = CFSTR("enableRapLightweightFeedback");
  else
    v131 = CFSTR("enable_rap_lightweight_feedback");
  objc_msgSend(v5, "objectForKeyedSubscript:", v131);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setEnableRapLightweightFeedback:", objc_msgSend(v132, "BOOLValue"));

  if (a3)
    v133 = CFSTR("alternateSearchableName");
  else
    v133 = CFSTR("alternate_searchable_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v133);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v225 = 0u;
    v226 = 0u;
    v223 = 0u;
    v224 = 0u;
    v208 = v134;
    v135 = v134;
    v136 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v223, v258, 16);
    if (v136)
    {
      v137 = v136;
      v138 = *(_QWORD *)v224;
      do
      {
        for (kk = 0; kk != v137; ++kk)
        {
          if (*(_QWORD *)v224 != v138)
            objc_enumerationMutation(v135);
          v140 = *(_QWORD *)(*((_QWORD *)&v223 + 1) + 8 * kk);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v141 = [GEOLocalizedString alloc];
            if ((a3 & 1) != 0)
              v142 = -[GEOLocalizedString initWithJSON:](v141, "initWithJSON:", v140);
            else
              v142 = -[GEOLocalizedString initWithDictionary:](v141, "initWithDictionary:", v140);
            v143 = (void *)v142;
            objc_msgSend(v6, "addAlternateSearchableName:", v142, v208);

          }
        }
        v137 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v223, v258, 16);
      }
      while (v137);
    }

    v134 = v208;
    v5 = v210;
  }

  if (a3)
    v144 = CFSTR("globalBrandMuid");
  else
    v144 = CFSTR("global_brand_muid");
  objc_msgSend(v5, "objectForKeyedSubscript:", v144, v208);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setGlobalBrandMuid:", objc_msgSend(v145, "unsignedLongLongValue"));

  if (a3)
    v146 = CFSTR("buildingId");
  else
    v146 = CFSTR("building_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v146);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setBuildingId:", objc_msgSend(v147, "unsignedLongLongValue"));

  if (a3)
    v148 = CFSTR("areaHighlightId");
  else
    v148 = CFSTR("area_highlight_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v148);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setAreaHighlightId:", objc_msgSend(v149, "unsignedLongLongValue"));

  if (a3)
    v150 = CFSTR("modernMapsCategoryId");
  else
    v150 = CFSTR("modern_maps_category_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v150);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v152 = (void *)objc_msgSend(v151, "copy");
    objc_msgSend(v6, "setModernMapsCategoryId:", v152);

  }
  if (a3)
    v153 = CFSTR("modernLocalizedCategory");
  else
    v153 = CFSTR("modern_localized_category");
  objc_msgSend(v5, "objectForKeyedSubscript:", v153);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v221 = 0u;
    v222 = 0u;
    v219 = 0u;
    v220 = 0u;
    v209 = v154;
    v155 = v154;
    v156 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v219, v257, 16);
    if (v156)
    {
      v157 = v156;
      v158 = *(_QWORD *)v220;
      do
      {
        for (mm = 0; mm != v157; ++mm)
        {
          if (*(_QWORD *)v220 != v158)
            objc_enumerationMutation(v155);
          v160 = *(_QWORD *)(*((_QWORD *)&v219 + 1) + 8 * mm);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v161 = [GEOPDCategory alloc];
            if ((a3 & 1) != 0)
              v162 = -[GEOPDCategory initWithJSON:](v161, "initWithJSON:", v160);
            else
              v162 = -[GEOPDCategory initWithDictionary:](v161, "initWithDictionary:", v160);
            v163 = (void *)v162;
            objc_msgSend(v6, "addModernLocalizedCategory:", v162, v209);

          }
        }
        v157 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v219, v257, 16);
      }
      while (v157);
    }

    v154 = v209;
    v5 = v210;
  }

  if (a3)
    v164 = CFSTR("photosMemoryScore");
  else
    v164 = CFSTR("photos_memory_score");
  objc_msgSend(v5, "objectForKeyedSubscript:", v164, v209);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v165, "floatValue");
    objc_msgSend(v6, "setPhotosMemoryScore:");
  }

  if (a3)
    v166 = CFSTR("mapsAltCategoryId");
  else
    v166 = CFSTR("maps_alt_category_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v166);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v217 = 0u;
    v218 = 0u;
    v215 = 0u;
    v216 = 0u;
    v168 = v167;
    v169 = objc_msgSend(v168, "countByEnumeratingWithState:objects:count:", &v215, v256, 16);
    if (v169)
    {
      v170 = v169;
      v171 = *(_QWORD *)v216;
      do
      {
        for (nn = 0; nn != v170; ++nn)
        {
          if (*(_QWORD *)v216 != v171)
            objc_enumerationMutation(v168);
          v173 = *(void **)(*((_QWORD *)&v215 + 1) + 8 * nn);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v174 = (void *)objc_msgSend(v173, "copy");
            objc_msgSend(v6, "addMapsAltCategoryId:", v174);

          }
        }
        v170 = objc_msgSend(v168, "countByEnumeratingWithState:objects:count:", &v215, v256, 16);
      }
      while (v170);
    }

    v5 = v210;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("placeCategoryType"));
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v176 = v175;
    if ((objc_msgSend(v176, "isEqualToString:", CFSTR("PLACE_CATEGORY_TYPE_UNKNOWN")) & 1) != 0)
    {
      v177 = 0;
    }
    else if ((objc_msgSend(v176, "isEqualToString:", CFSTR("PLACE_CATEGORY_TYPE_TRAIL")) & 1) != 0)
    {
      v177 = 1;
    }
    else if ((objc_msgSend(v176, "isEqualToString:", CFSTR("PLACE_CATEGORY_TYPE_TRAIL_HEAD")) & 1) != 0)
    {
      v177 = 2;
    }
    else if ((objc_msgSend(v176, "isEqualToString:", CFSTR("PLACE_CATEGORY_TYPE_PHYSICAL_FEATURE_MOUNTAIN")) & 1) != 0)
    {
      v177 = 3;
    }
    else if (objc_msgSend(v176, "isEqualToString:", CFSTR("PLACE_CATEGORY_TYPE_PHYSICAL_FEATURE_VOLCANO")))
    {
      v177 = 4;
    }
    else
    {
      v177 = 0;
    }

    goto LABEL_426;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v177 = objc_msgSend(v175, "intValue");
LABEL_426:
    objc_msgSend(v6, "setPlaceCategoryType:", v177);
  }

  if (a3)
    v178 = CFSTR("inlineRapEnablement");
  else
    v178 = CFSTR("inline_rap_enablement");
  objc_msgSend(v5, "objectForKeyedSubscript:", v178);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v180 = [GEOPDInlineRapEnablement alloc];
    if ((a3 & 1) != 0)
      v181 = -[GEOPDInlineRapEnablement initWithJSON:](v180, "initWithJSON:", v179);
    else
      v181 = -[GEOPDInlineRapEnablement initWithDictionary:](v180, "initWithDictionary:", v179);
    v182 = (void *)v181;
    objc_msgSend(v6, "setInlineRapEnablement:", v181);

  }
  if (a3)
    v183 = CFSTR("mapsCategoryMuid");
  else
    v183 = CFSTR("maps_category_muid");
  objc_msgSend(v5, "objectForKeyedSubscript:", v183);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setMapsCategoryMuid:", objc_msgSend(v184, "unsignedLongLongValue"));

  if (a3)
    v185 = CFSTR("mapsAltCategoryMuid");
  else
    v185 = CFSTR("maps_alt_category_muid");
  objc_msgSend(v5, "objectForKeyedSubscript:", v185);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v213 = 0u;
    v214 = 0u;
    v211 = 0u;
    v212 = 0u;
    v187 = v186;
    v188 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v211, v255, 16);
    if (v188)
    {
      v189 = v188;
      v190 = *(_QWORD *)v212;
      do
      {
        for (i1 = 0; i1 != v189; ++i1)
        {
          if (*(_QWORD *)v212 != v190)
            objc_enumerationMutation(v187);
          v192 = *(void **)(*((_QWORD *)&v211 + 1) + 8 * i1);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v6, "addMapsAltCategoryMuid:", objc_msgSend(v192, "unsignedLongLongValue"));
        }
        v189 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v211, v255, 16);
      }
      while (v189);
    }

    v5 = v210;
  }

  if (a3)
    v193 = CFSTR("disclaimerText");
  else
    v193 = CFSTR("disclaimer_text");
  objc_msgSend(v5, "objectForKeyedSubscript:", v193);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v195 = [GEOLocalizedString alloc];
    if ((a3 & 1) != 0)
      v196 = -[GEOLocalizedString initWithJSON:](v195, "initWithJSON:", v194);
    else
      v196 = -[GEOLocalizedString initWithDictionary:](v195, "initWithDictionary:", v194);
    v197 = (void *)v196;
    objc_msgSend(v6, "setDisclaimerText:", v196);

  }
  if (a3)
    v198 = CFSTR("urlData");
  else
    v198 = CFSTR("url_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v198);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v200 = [GEOPDURLData alloc];
    if ((a3 & 1) != 0)
      v201 = -[GEOPDURLData initWithJSON:](v200, "initWithJSON:", v199);
    else
      v201 = -[GEOPDURLData initWithDictionary:](v200, "initWithDictionary:", v199);
    v202 = (void *)v201;
    objc_msgSend(v6, "setUrlData:", v201);

  }
  a1 = v6;

LABEL_471:
  return a1;
}

- (GEOPDEntity)initWithJSON:(id)a3
{
  return (GEOPDEntity *)-[GEOPDEntity _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDEntityIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDEntityReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  $F2AA8D11DDD6D71BA01031F215D029B3 flags;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t n;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t ii;
  void *v28;
  $F2AA8D11DDD6D71BA01031F215D029B3 v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t jj;
  unint64_t v33;
  unint64_t v34;
  uint64_t kk;
  void *v36;
  $F2AA8D11DDD6D71BA01031F215D029B3 v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t mm;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t nn;
  void *v45;
  id *v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t i1;
  id *v50;
  id *v51;

  v51 = (id *)a3;
  -[GEOPDEntity readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v51 + 1, self->_reader);
  *((_DWORD *)v51 + 70) = self->_readerMarkPos;
  *((_DWORD *)v51 + 71) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*((_BYTE *)&self->_flags + 1) & 8) != 0)
  {
    *((_DWORD *)v51 + 79) = self->_type;
    v51[41] = (id)((unint64_t)v51[41] | 0x800);
  }
  if (self->_telephone)
    objc_msgSend(v51, "setTelephone:");
  if (-[GEOPDEntity altTelephonesCount](self, "altTelephonesCount"))
  {
    objc_msgSend(v51, "clearAltTelephones");
    v4 = -[GEOPDEntity altTelephonesCount](self, "altTelephonesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOPDEntity altTelephoneAtIndex:](self, "altTelephoneAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addAltTelephone:", v7);

      }
    }
  }
  if (self->_fax)
    objc_msgSend(v51, "setFax:");
  if (-[GEOPDEntity altFaxsCount](self, "altFaxsCount"))
  {
    objc_msgSend(v51, "clearAltFaxs");
    v8 = -[GEOPDEntity altFaxsCount](self, "altFaxsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOPDEntity altFaxAtIndex:](self, "altFaxAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addAltFax:", v11);

      }
    }
  }
  if (self->_url)
    objc_msgSend(v51, "setUrl:");
  if (-[GEOPDEntity altUrlsCount](self, "altUrlsCount"))
  {
    objc_msgSend(v51, "clearAltUrls");
    v12 = -[GEOPDEntity altUrlsCount](self, "altUrlsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEOPDEntity altUrlAtIndex:](self, "altUrlAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addAltUrl:", v15);

      }
    }
  }
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x8000) != 0)
  {
    *((_BYTE *)v51 + 323) = self->_isPermanentlyClosed;
    v51[41] = (id)((unint64_t)v51[41] | 0x8000);
    flags = self->_flags;
  }
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    *((_BYTE *)v51 + 322) = self->_isDisputed;
    v51[41] = (id)((unint64_t)v51[41] | 0x4000);
  }
  if (-[GEOPDEntity namesCount](self, "namesCount"))
  {
    objc_msgSend(v51, "clearNames");
    v17 = -[GEOPDEntity namesCount](self, "namesCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[GEOPDEntity nameAtIndex:](self, "nameAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addName:", v20);

      }
    }
  }
  if (-[GEOPDEntity spokenNamesCount](self, "spokenNamesCount"))
  {
    objc_msgSend(v51, "clearSpokenNames");
    v21 = -[GEOPDEntity spokenNamesCount](self, "spokenNamesCount");
    if (v21)
    {
      v22 = v21;
      for (n = 0; n != v22; ++n)
      {
        -[GEOPDEntity spokenNameAtIndex:](self, "spokenNameAtIndex:", n);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addSpokenName:", v24);

      }
    }
  }
  if (-[GEOPDEntity localizedCategorysCount](self, "localizedCategorysCount"))
  {
    objc_msgSend(v51, "clearLocalizedCategorys");
    v25 = -[GEOPDEntity localizedCategorysCount](self, "localizedCategorysCount");
    if (v25)
    {
      v26 = v25;
      for (ii = 0; ii != v26; ++ii)
      {
        -[GEOPDEntity localizedCategoryAtIndex:](self, "localizedCategoryAtIndex:", ii);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addLocalizedCategory:", v28);

      }
    }
  }
  v29 = self->_flags;
  if ((*(_DWORD *)&v29 & 0x20000) != 0)
  {
    *((_BYTE *)v51 + 325) = self->_telephoneAdsOptOut;
    v51[41] = (id)((unint64_t)v51[41] | 0x20000);
    v29 = self->_flags;
    if ((*(_WORD *)&v29 & 0x1000) == 0)
    {
LABEL_39:
      if ((*(_DWORD *)&v29 & 0x10000) == 0)
        goto LABEL_40;
      goto LABEL_99;
    }
  }
  else if ((*(_WORD *)&v29 & 0x1000) == 0)
  {
    goto LABEL_39;
  }
  *((_BYTE *)v51 + 320) = self->_altTelephoneAdsOptOut;
  v51[41] = (id)((unint64_t)v51[41] | 0x1000);
  v29 = self->_flags;
  if ((*(_DWORD *)&v29 & 0x10000) == 0)
  {
LABEL_40:
    if ((*(_BYTE *)&v29 & 0x40) == 0)
      goto LABEL_41;
    goto LABEL_100;
  }
LABEL_99:
  *((_BYTE *)v51 + 324) = self->_isStandaloneBrand;
  v51[41] = (id)((unint64_t)v51[41] | 0x10000);
  v29 = self->_flags;
  if ((*(_BYTE *)&v29 & 0x40) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&v29 & 0x400) == 0)
      goto LABEL_42;
    goto LABEL_101;
  }
LABEL_100:
  *((_DWORD *)v51 + 74) = self->_displayStyle;
  v51[41] = (id)((unint64_t)v51[41] | 0x40);
  v29 = self->_flags;
  if ((*(_WORD *)&v29 & 0x400) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&v29 & 0x200) == 0)
      goto LABEL_43;
    goto LABEL_102;
  }
LABEL_101:
  *((_DWORD *)v51 + 78) = self->_searchSection;
  v51[41] = (id)((unint64_t)v51[41] | 0x400);
  v29 = self->_flags;
  if ((*(_WORD *)&v29 & 0x200) == 0)
  {
LABEL_43:
    if ((*(_BYTE *)&v29 & 2) == 0)
      goto LABEL_44;
LABEL_103:
    v51[14] = (id)self->_brandMuid;
    v51[41] = (id)((unint64_t)v51[41] | 2);
    if ((*(_QWORD *)&self->_flags & 0x20) == 0)
      goto LABEL_46;
    goto LABEL_45;
  }
LABEL_102:
  *((_DWORD *)v51 + 77) = self->_placeDisplayType;
  v51[41] = (id)((unint64_t)v51[41] | 0x200);
  v29 = self->_flags;
  if ((*(_BYTE *)&v29 & 2) != 0)
    goto LABEL_103;
LABEL_44:
  if ((*(_BYTE *)&v29 & 0x20) != 0)
  {
LABEL_45:
    *((_DWORD *)v51 + 73) = self->_capacity;
    v51[41] = (id)((unint64_t)v51[41] | 0x20);
  }
LABEL_46:
  if (-[GEOPDEntity placeLookupCategorysCount](self, "placeLookupCategorysCount"))
  {
    objc_msgSend(v51, "clearPlaceLookupCategorys");
    v30 = -[GEOPDEntity placeLookupCategorysCount](self, "placeLookupCategorysCount");
    if (v30)
    {
      v31 = v30;
      for (jj = 0; jj != v31; ++jj)
        objc_msgSend(v51, "addPlaceLookupCategory:", -[GEOPDEntity placeLookupCategoryAtIndex:](self, "placeLookupCategoryAtIndex:", jj));
    }
  }
  if (self->_secondaryName)
    objc_msgSend(v51, "setSecondaryName:");
  if (self->_secondarySpokenName)
    objc_msgSend(v51, "setSecondarySpokenName:");
  if (self->_styleAttributes)
    objc_msgSend(v51, "setStyleAttributes:");
  if (self->_walletCategoryId)
    objc_msgSend(v51, "setWalletCategoryId:");
  if (self->_mapsCategoryId)
    objc_msgSend(v51, "setMapsCategoryId:");
  if ((*((_BYTE *)&self->_flags + 1) & 0x20) != 0)
  {
    *((_BYTE *)v51 + 321) = self->_enableRapLightweightFeedback;
    v51[41] = (id)((unint64_t)v51[41] | 0x2000);
  }
  if (-[GEOPDEntity alternateSearchableNamesCount](self, "alternateSearchableNamesCount"))
  {
    objc_msgSend(v51, "clearAlternateSearchableNames");
    v33 = -[GEOPDEntity alternateSearchableNamesCount](self, "alternateSearchableNamesCount");
    if (v33)
    {
      v34 = v33;
      for (kk = 0; kk != v34; ++kk)
      {
        -[GEOPDEntity alternateSearchableNameAtIndex:](self, "alternateSearchableNameAtIndex:", kk);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addAlternateSearchableName:", v36);

      }
    }
  }
  v37 = self->_flags;
  if ((*(_BYTE *)&v37 & 8) != 0)
  {
    v51[18] = (id)self->_globalBrandMuid;
    v51[41] = (id)((unint64_t)v51[41] | 8);
    v37 = self->_flags;
    if ((*(_BYTE *)&v37 & 4) == 0)
    {
LABEL_68:
      if ((*(_BYTE *)&v37 & 1) == 0)
        goto LABEL_70;
      goto LABEL_69;
    }
  }
  else if ((*(_BYTE *)&v37 & 4) == 0)
  {
    goto LABEL_68;
  }
  v51[15] = (id)self->_buildingId;
  v51[41] = (id)((unint64_t)v51[41] | 4);
  if ((*(_QWORD *)&self->_flags & 1) != 0)
  {
LABEL_69:
    v51[13] = (id)self->_areaHighlightId;
    v51[41] = (id)((unint64_t)v51[41] | 1);
  }
LABEL_70:
  if (self->_modernMapsCategoryId)
    objc_msgSend(v51, "setModernMapsCategoryId:");
  if (-[GEOPDEntity modernLocalizedCategorysCount](self, "modernLocalizedCategorysCount"))
  {
    objc_msgSend(v51, "clearModernLocalizedCategorys");
    v38 = -[GEOPDEntity modernLocalizedCategorysCount](self, "modernLocalizedCategorysCount");
    if (v38)
    {
      v39 = v38;
      for (mm = 0; mm != v39; ++mm)
      {
        -[GEOPDEntity modernLocalizedCategoryAtIndex:](self, "modernLocalizedCategoryAtIndex:", mm);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addModernLocalizedCategory:", v41);

      }
    }
  }
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    *((_DWORD *)v51 + 75) = LODWORD(self->_photosMemoryScore);
    v51[41] = (id)((unint64_t)v51[41] | 0x80);
  }
  if (-[GEOPDEntity mapsAltCategoryIdsCount](self, "mapsAltCategoryIdsCount"))
  {
    objc_msgSend(v51, "clearMapsAltCategoryIds");
    v42 = -[GEOPDEntity mapsAltCategoryIdsCount](self, "mapsAltCategoryIdsCount");
    if (v42)
    {
      v43 = v42;
      for (nn = 0; nn != v43; ++nn)
      {
        -[GEOPDEntity mapsAltCategoryIdAtIndex:](self, "mapsAltCategoryIdAtIndex:", nn);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addMapsAltCategoryId:", v45);

      }
    }
  }
  v46 = v51;
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    *((_DWORD *)v51 + 76) = self->_placeCategoryType;
    v51[41] = (id)((unint64_t)v51[41] | 0x100);
  }
  if (self->_inlineRapEnablement)
  {
    objc_msgSend(v51, "setInlineRapEnablement:");
    v46 = v51;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    v46[23] = (id)self->_mapsCategoryMuid;
    v46[41] = (id)((unint64_t)v46[41] | 0x10);
  }
  if (-[GEOPDEntity mapsAltCategoryMuidsCount](self, "mapsAltCategoryMuidsCount"))
  {
    objc_msgSend(v51, "clearMapsAltCategoryMuids");
    v47 = -[GEOPDEntity mapsAltCategoryMuidsCount](self, "mapsAltCategoryMuidsCount");
    if (v47)
    {
      v48 = v47;
      for (i1 = 0; i1 != v48; ++i1)
        objc_msgSend(v51, "addMapsAltCategoryMuid:", -[GEOPDEntity mapsAltCategoryMuidAtIndex:](self, "mapsAltCategoryMuidAtIndex:", i1));
    }
  }
  if (self->_disclaimerText)
    objc_msgSend(v51, "setDisclaimerText:");
  v50 = v51;
  if (self->_urlData)
  {
    objc_msgSend(v51, "setUrlData:");
    v50 = v51;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSString *telephone;
  NSMutableArray *altTelephones;
  NSString *fax;
  NSMutableArray *altFaxs;
  NSString *url;
  NSMutableArray *altUrls;
  $F2AA8D11DDD6D71BA01031F215D029B3 flags;
  uint64_t v13;
  NSMutableArray *names;
  NSMutableArray *spokenNames;
  NSMutableArray *localizedCategorys;
  $F2AA8D11DDD6D71BA01031F215D029B3 v17;
  uint64_t v18;
  GEOLocalizedString *secondaryName;
  GEOLocalizedString *secondarySpokenName;
  GEOStyleAttributes *styleAttributes;
  NSString *walletCategoryId;
  NSString *mapsCategoryId;
  $F2AA8D11DDD6D71BA01031F215D029B3 v24;
  uint64_t v25;
  NSMutableArray *alternateSearchableNames;
  NSString *modernMapsCategoryId;
  NSMutableArray *modernLocalizedCategorys;
  $F2AA8D11DDD6D71BA01031F215D029B3 v29;
  uint64_t v30;
  NSMutableArray *mapsAltCategoryIds;
  GEOPDInlineRapEnablement *inlineRapEnablement;
  GEOLocalizedString *disclaimerText;
  GEOPDURLData *urlData;
  char v35;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_157;
  -[GEOPDEntity readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_QWORD *)v4 + 41);
  if ((*((_BYTE *)&self->_flags + 1) & 8) != 0)
  {
    if ((v5 & 0x800) == 0 || self->_type != *((_DWORD *)v4 + 79))
      goto LABEL_157;
  }
  else if ((v5 & 0x800) != 0)
  {
    goto LABEL_157;
  }
  telephone = self->_telephone;
  if ((unint64_t)telephone | *((_QWORD *)v4 + 31) && !-[NSString isEqual:](telephone, "isEqual:"))
    goto LABEL_157;
  altTelephones = self->_altTelephones;
  if ((unint64_t)altTelephones | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](altTelephones, "isEqual:"))
      goto LABEL_157;
  }
  fax = self->_fax;
  if ((unint64_t)fax | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](fax, "isEqual:"))
      goto LABEL_157;
  }
  altFaxs = self->_altFaxs;
  if ((unint64_t)altFaxs | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](altFaxs, "isEqual:"))
      goto LABEL_157;
  }
  url = self->_url;
  if ((unint64_t)url | *((_QWORD *)v4 + 33))
  {
    if (!-[NSString isEqual:](url, "isEqual:"))
      goto LABEL_157;
  }
  altUrls = self->_altUrls;
  if ((unint64_t)altUrls | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](altUrls, "isEqual:"))
      goto LABEL_157;
  }
  flags = self->_flags;
  v13 = *((_QWORD *)v4 + 41);
  if ((*(_WORD *)&flags & 0x8000) != 0)
  {
    if ((v13 & 0x8000) == 0)
      goto LABEL_157;
    if (self->_isPermanentlyClosed)
    {
      if (!*((_BYTE *)v4 + 323))
        goto LABEL_157;
    }
    else if (*((_BYTE *)v4 + 323))
    {
      goto LABEL_157;
    }
  }
  else if ((v13 & 0x8000) != 0)
  {
    goto LABEL_157;
  }
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    if ((v13 & 0x4000) == 0)
      goto LABEL_157;
    if (self->_isDisputed)
    {
      if (!*((_BYTE *)v4 + 322))
        goto LABEL_157;
    }
    else if (*((_BYTE *)v4 + 322))
    {
      goto LABEL_157;
    }
  }
  else if ((v13 & 0x4000) != 0)
  {
    goto LABEL_157;
  }
  names = self->_names;
  if ((unint64_t)names | *((_QWORD *)v4 + 26) && !-[NSMutableArray isEqual:](names, "isEqual:"))
    goto LABEL_157;
  spokenNames = self->_spokenNames;
  if ((unint64_t)spokenNames | *((_QWORD *)v4 + 29))
  {
    if (!-[NSMutableArray isEqual:](spokenNames, "isEqual:"))
      goto LABEL_157;
  }
  localizedCategorys = self->_localizedCategorys;
  if ((unint64_t)localizedCategorys | *((_QWORD *)v4 + 20))
  {
    if (!-[NSMutableArray isEqual:](localizedCategorys, "isEqual:"))
      goto LABEL_157;
  }
  v17 = self->_flags;
  v18 = *((_QWORD *)v4 + 41);
  if ((*(_DWORD *)&v17 & 0x20000) != 0)
  {
    if ((v18 & 0x20000) == 0)
      goto LABEL_157;
    if (self->_telephoneAdsOptOut)
    {
      if (!*((_BYTE *)v4 + 325))
        goto LABEL_157;
    }
    else if (*((_BYTE *)v4 + 325))
    {
      goto LABEL_157;
    }
  }
  else if ((v18 & 0x20000) != 0)
  {
    goto LABEL_157;
  }
  if ((*(_WORD *)&v17 & 0x1000) != 0)
  {
    if ((v18 & 0x1000) == 0)
      goto LABEL_157;
    if (self->_altTelephoneAdsOptOut)
    {
      if (!*((_BYTE *)v4 + 320))
        goto LABEL_157;
    }
    else if (*((_BYTE *)v4 + 320))
    {
      goto LABEL_157;
    }
  }
  else if ((v18 & 0x1000) != 0)
  {
    goto LABEL_157;
  }
  if ((*(_DWORD *)&v17 & 0x10000) != 0)
  {
    if ((v18 & 0x10000) == 0)
      goto LABEL_157;
    if (self->_isStandaloneBrand)
    {
      if (!*((_BYTE *)v4 + 324))
        goto LABEL_157;
    }
    else if (*((_BYTE *)v4 + 324))
    {
      goto LABEL_157;
    }
  }
  else if ((v18 & 0x10000) != 0)
  {
    goto LABEL_157;
  }
  if ((*(_BYTE *)&v17 & 0x40) != 0)
  {
    if ((v18 & 0x40) == 0 || self->_displayStyle != *((_DWORD *)v4 + 74))
      goto LABEL_157;
  }
  else if ((v18 & 0x40) != 0)
  {
    goto LABEL_157;
  }
  if ((*(_WORD *)&v17 & 0x400) != 0)
  {
    if ((v18 & 0x400) == 0 || self->_searchSection != *((_DWORD *)v4 + 78))
      goto LABEL_157;
  }
  else if ((v18 & 0x400) != 0)
  {
    goto LABEL_157;
  }
  if ((*(_WORD *)&v17 & 0x200) != 0)
  {
    if ((v18 & 0x200) == 0 || self->_placeDisplayType != *((_DWORD *)v4 + 77))
      goto LABEL_157;
  }
  else if ((v18 & 0x200) != 0)
  {
    goto LABEL_157;
  }
  if ((*(_BYTE *)&v17 & 2) != 0)
  {
    if ((v18 & 2) == 0 || self->_brandMuid != *((_QWORD *)v4 + 14))
      goto LABEL_157;
  }
  else if ((v18 & 2) != 0)
  {
    goto LABEL_157;
  }
  if ((*(_BYTE *)&v17 & 0x20) != 0)
  {
    if ((v18 & 0x20) == 0 || self->_capacity != *((_DWORD *)v4 + 73))
      goto LABEL_157;
  }
  else if ((v18 & 0x20) != 0)
  {
    goto LABEL_157;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_157;
  secondaryName = self->_secondaryName;
  if ((unint64_t)secondaryName | *((_QWORD *)v4 + 27))
  {
    if (!-[GEOLocalizedString isEqual:](secondaryName, "isEqual:"))
      goto LABEL_157;
  }
  secondarySpokenName = self->_secondarySpokenName;
  if ((unint64_t)secondarySpokenName | *((_QWORD *)v4 + 28))
  {
    if (!-[GEOLocalizedString isEqual:](secondarySpokenName, "isEqual:"))
      goto LABEL_157;
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((_QWORD *)v4 + 30))
  {
    if (!-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
      goto LABEL_157;
  }
  walletCategoryId = self->_walletCategoryId;
  if ((unint64_t)walletCategoryId | *((_QWORD *)v4 + 34))
  {
    if (!-[NSString isEqual:](walletCategoryId, "isEqual:"))
      goto LABEL_157;
  }
  mapsCategoryId = self->_mapsCategoryId;
  if ((unint64_t)mapsCategoryId | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](mapsCategoryId, "isEqual:"))
      goto LABEL_157;
  }
  v24 = self->_flags;
  v25 = *((_QWORD *)v4 + 41);
  if ((*(_WORD *)&v24 & 0x2000) != 0)
  {
    if ((v25 & 0x2000) == 0)
      goto LABEL_157;
    if (self->_enableRapLightweightFeedback)
    {
      if (!*((_BYTE *)v4 + 321))
        goto LABEL_157;
    }
    else if (*((_BYTE *)v4 + 321))
    {
      goto LABEL_157;
    }
  }
  else if ((v25 & 0x2000) != 0)
  {
    goto LABEL_157;
  }
  alternateSearchableNames = self->_alternateSearchableNames;
  if ((unint64_t)alternateSearchableNames | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](alternateSearchableNames, "isEqual:"))
      goto LABEL_157;
    v24 = self->_flags;
    v25 = *((_QWORD *)v4 + 41);
  }
  if ((*(_BYTE *)&v24 & 8) != 0)
  {
    if ((v25 & 8) == 0 || self->_globalBrandMuid != *((_QWORD *)v4 + 18))
      goto LABEL_157;
  }
  else if ((v25 & 8) != 0)
  {
    goto LABEL_157;
  }
  if ((*(_BYTE *)&v24 & 4) != 0)
  {
    if ((v25 & 4) == 0 || self->_buildingId != *((_QWORD *)v4 + 15))
      goto LABEL_157;
  }
  else if ((v25 & 4) != 0)
  {
    goto LABEL_157;
  }
  if ((*(_BYTE *)&v24 & 1) != 0)
  {
    if ((v25 & 1) == 0 || self->_areaHighlightId != *((_QWORD *)v4 + 13))
      goto LABEL_157;
  }
  else if ((v25 & 1) != 0)
  {
    goto LABEL_157;
  }
  modernMapsCategoryId = self->_modernMapsCategoryId;
  if ((unint64_t)modernMapsCategoryId | *((_QWORD *)v4 + 25)
    && !-[NSString isEqual:](modernMapsCategoryId, "isEqual:"))
  {
    goto LABEL_157;
  }
  modernLocalizedCategorys = self->_modernLocalizedCategorys;
  if ((unint64_t)modernLocalizedCategorys | *((_QWORD *)v4 + 24))
  {
    if (!-[NSMutableArray isEqual:](modernLocalizedCategorys, "isEqual:"))
      goto LABEL_157;
  }
  v29 = self->_flags;
  v30 = *((_QWORD *)v4 + 41);
  if ((*(_BYTE *)&v29 & 0x80) != 0)
  {
    if ((v30 & 0x80) == 0 || self->_photosMemoryScore != *((float *)v4 + 75))
      goto LABEL_157;
  }
  else if ((v30 & 0x80) != 0)
  {
    goto LABEL_157;
  }
  mapsAltCategoryIds = self->_mapsAltCategoryIds;
  if ((unint64_t)mapsAltCategoryIds | *((_QWORD *)v4 + 21))
  {
    if (!-[NSMutableArray isEqual:](mapsAltCategoryIds, "isEqual:"))
      goto LABEL_157;
    v29 = self->_flags;
    v30 = *((_QWORD *)v4 + 41);
  }
  if ((*(_WORD *)&v29 & 0x100) != 0)
  {
    if ((v30 & 0x100) == 0 || self->_placeCategoryType != *((_DWORD *)v4 + 76))
      goto LABEL_157;
  }
  else if ((v30 & 0x100) != 0)
  {
    goto LABEL_157;
  }
  inlineRapEnablement = self->_inlineRapEnablement;
  if ((unint64_t)inlineRapEnablement | *((_QWORD *)v4 + 19))
  {
    if (-[GEOPDInlineRapEnablement isEqual:](inlineRapEnablement, "isEqual:"))
    {
      v29 = self->_flags;
      v30 = *((_QWORD *)v4 + 41);
      goto LABEL_147;
    }
LABEL_157:
    v35 = 0;
    goto LABEL_158;
  }
LABEL_147:
  if ((*(_BYTE *)&v29 & 0x10) != 0)
  {
    if ((v30 & 0x10) == 0 || self->_mapsCategoryMuid != *((_QWORD *)v4 + 23))
      goto LABEL_157;
  }
  else if ((v30 & 0x10) != 0)
  {
    goto LABEL_157;
  }
  if (!PBRepeatedUInt64IsEqual())
    goto LABEL_157;
  disclaimerText = self->_disclaimerText;
  if ((unint64_t)disclaimerText | *((_QWORD *)v4 + 16))
  {
    if (!-[GEOLocalizedString isEqual:](disclaimerText, "isEqual:"))
      goto LABEL_157;
  }
  urlData = self->_urlData;
  if ((unint64_t)urlData | *((_QWORD *)v4 + 32))
    v35 = -[GEOPDURLData isEqual:](urlData, "isEqual:");
  else
    v35 = 1;
LABEL_158:

  return v35;
}

- (unint64_t)hash
{
  $F2AA8D11DDD6D71BA01031F215D029B3 flags;
  $F2AA8D11DDD6D71BA01031F215D029B3 v4;
  $F2AA8D11DDD6D71BA01031F215D029B3 v5;
  unint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  unint64_t v10;
  float photosMemoryScore;
  double v12;
  long double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  NSUInteger v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSUInteger v27;
  NSUInteger v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSUInteger v47;
  uint64_t v48;
  NSUInteger v49;
  uint64_t v50;
  NSUInteger v51;
  uint64_t v52;

  -[GEOPDEntity readAll:](self, "readAll:", 1);
  if ((*((_BYTE *)&self->_flags + 1) & 8) != 0)
    v52 = 2654435761 * self->_type;
  else
    v52 = 0;
  v51 = -[NSString hash](self->_telephone, "hash");
  v50 = -[NSMutableArray hash](self->_altTelephones, "hash");
  v49 = -[NSString hash](self->_fax, "hash");
  v48 = -[NSMutableArray hash](self->_altFaxs, "hash");
  v47 = -[NSString hash](self->_url, "hash");
  v46 = -[NSMutableArray hash](self->_altUrls, "hash");
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x8000) != 0)
  {
    v45 = 2654435761 * self->_isPermanentlyClosed;
    if ((*(_WORD *)&flags & 0x4000) != 0)
      goto LABEL_6;
  }
  else
  {
    v45 = 0;
    if ((*(_WORD *)&flags & 0x4000) != 0)
    {
LABEL_6:
      v44 = 2654435761 * self->_isDisputed;
      goto LABEL_9;
    }
  }
  v44 = 0;
LABEL_9:
  v43 = -[NSMutableArray hash](self->_names, "hash");
  v42 = -[NSMutableArray hash](self->_spokenNames, "hash");
  v41 = -[NSMutableArray hash](self->_localizedCategorys, "hash");
  v4 = self->_flags;
  if ((*(_DWORD *)&v4 & 0x20000) != 0)
  {
    v40 = 2654435761 * self->_telephoneAdsOptOut;
    if ((*(_WORD *)&v4 & 0x1000) != 0)
    {
LABEL_11:
      v39 = 2654435761 * self->_altTelephoneAdsOptOut;
      if ((*(_DWORD *)&v4 & 0x10000) != 0)
        goto LABEL_12;
      goto LABEL_20;
    }
  }
  else
  {
    v40 = 0;
    if ((*(_WORD *)&v4 & 0x1000) != 0)
      goto LABEL_11;
  }
  v39 = 0;
  if ((*(_DWORD *)&v4 & 0x10000) != 0)
  {
LABEL_12:
    v38 = 2654435761 * self->_isStandaloneBrand;
    if ((*(_BYTE *)&v4 & 0x40) != 0)
      goto LABEL_13;
    goto LABEL_21;
  }
LABEL_20:
  v38 = 0;
  if ((*(_BYTE *)&v4 & 0x40) != 0)
  {
LABEL_13:
    v37 = 2654435761 * self->_displayStyle;
    if ((*(_WORD *)&v4 & 0x400) != 0)
      goto LABEL_14;
    goto LABEL_22;
  }
LABEL_21:
  v37 = 0;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
LABEL_14:
    v36 = 2654435761 * self->_searchSection;
    if ((*(_WORD *)&v4 & 0x200) != 0)
      goto LABEL_15;
    goto LABEL_23;
  }
LABEL_22:
  v36 = 0;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
LABEL_15:
    v35 = 2654435761 * self->_placeDisplayType;
    if ((*(_BYTE *)&v4 & 2) != 0)
      goto LABEL_16;
LABEL_24:
    v34 = 0;
    if ((*(_BYTE *)&v4 & 0x20) != 0)
      goto LABEL_17;
    goto LABEL_25;
  }
LABEL_23:
  v35 = 0;
  if ((*(_BYTE *)&v4 & 2) == 0)
    goto LABEL_24;
LABEL_16:
  v34 = 2654435761u * self->_brandMuid;
  if ((*(_BYTE *)&v4 & 0x20) != 0)
  {
LABEL_17:
    v33 = 2654435761 * self->_capacity;
    goto LABEL_26;
  }
LABEL_25:
  v33 = 0;
LABEL_26:
  v32 = PBRepeatedInt32Hash();
  v31 = -[GEOLocalizedString hash](self->_secondaryName, "hash");
  v30 = -[GEOLocalizedString hash](self->_secondarySpokenName, "hash");
  v29 = -[GEOStyleAttributes hash](self->_styleAttributes, "hash");
  v28 = -[NSString hash](self->_walletCategoryId, "hash");
  v27 = -[NSString hash](self->_mapsCategoryId, "hash");
  if ((*((_BYTE *)&self->_flags + 1) & 0x20) != 0)
    v26 = 2654435761 * self->_enableRapLightweightFeedback;
  else
    v26 = 0;
  v25 = -[NSMutableArray hash](self->_alternateSearchableNames, "hash");
  v5 = self->_flags;
  if ((*(_BYTE *)&v5 & 8) == 0)
  {
    v23 = 0;
    if ((*(_BYTE *)&v5 & 4) != 0)
      goto LABEL_31;
LABEL_34:
    v6 = 0;
    if ((*(_BYTE *)&v5 & 1) != 0)
      goto LABEL_32;
    goto LABEL_35;
  }
  v23 = 2654435761u * self->_globalBrandMuid;
  if ((*(_BYTE *)&v5 & 4) == 0)
    goto LABEL_34;
LABEL_31:
  v6 = 2654435761u * self->_buildingId;
  if ((*(_BYTE *)&v5 & 1) != 0)
  {
LABEL_32:
    v7 = 2654435761u * self->_areaHighlightId;
    goto LABEL_36;
  }
LABEL_35:
  v7 = 0;
LABEL_36:
  v8 = -[NSString hash](self->_modernMapsCategoryId, "hash", v23);
  v9 = -[NSMutableArray hash](self->_modernLocalizedCategorys, "hash");
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    photosMemoryScore = self->_photosMemoryScore;
    v12 = photosMemoryScore;
    if (photosMemoryScore < 0.0)
      v12 = -photosMemoryScore;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  v15 = -[NSMutableArray hash](self->_mapsAltCategoryIds, "hash");
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
    v16 = 2654435761 * self->_placeCategoryType;
  else
    v16 = 0;
  v17 = -[GEOPDInlineRapEnablement hash](self->_inlineRapEnablement, "hash");
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    v18 = 2654435761u * self->_mapsCategoryMuid;
  else
    v18 = 0;
  v19 = v51 ^ v52 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v15 ^ v16 ^ v17 ^ v18;
  v20 = PBRepeatedUInt64Hash();
  v21 = v20 ^ -[GEOLocalizedString hash](self->_disclaimerText, "hash");
  return v19 ^ v21 ^ -[GEOPDURLData hash](self->_urlData, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
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
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t n;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t ii;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t jj;
  GEOLocalizedString *secondaryName;
  uint64_t v41;
  GEOLocalizedString *secondarySpokenName;
  uint64_t v43;
  GEOStyleAttributes *styleAttributes;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t kk;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t mm;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t nn;
  GEOPDInlineRapEnablement *inlineRapEnablement;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i1;
  GEOLocalizedString *disclaimerText;
  uint64_t v68;
  GEOPDURLData *urlData;
  uint64_t v70;
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
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 329) & 8) != 0)
  {
    self->_type = *((_DWORD *)v4 + 79);
    *(_QWORD *)&self->_flags |= 0x800uLL;
  }
  if (*((_QWORD *)v4 + 31))
    -[GEOPDEntity setTelephone:](self, "setTelephone:");
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v5 = *((id *)v4 + 10);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v103, v115, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v104;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v104 != v8)
          objc_enumerationMutation(v5);
        -[GEOPDEntity addAltTelephone:](self, "addAltTelephone:", *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v103, v115, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 17))
    -[GEOPDEntity setFax:](self, "setFax:");
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v10 = *((id *)v4 + 9);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v99, v114, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v100;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v100 != v13)
          objc_enumerationMutation(v10);
        -[GEOPDEntity addAltFax:](self, "addAltFax:", *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v99, v114, 16);
    }
    while (v12);
  }

  if (*((_QWORD *)v4 + 33))
    -[GEOPDEntity setUrl:](self, "setUrl:");
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v15 = *((id *)v4 + 11);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v95, v113, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v96;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v96 != v18)
          objc_enumerationMutation(v15);
        -[GEOPDEntity addAltUrl:](self, "addAltUrl:", *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v95, v113, 16);
    }
    while (v17);
  }

  v20 = *((_QWORD *)v4 + 41);
  if ((v20 & 0x8000) != 0)
  {
    self->_isPermanentlyClosed = *((_BYTE *)v4 + 323);
    *(_QWORD *)&self->_flags |= 0x8000uLL;
    v20 = *((_QWORD *)v4 + 41);
  }
  if ((v20 & 0x4000) != 0)
  {
    self->_isDisputed = *((_BYTE *)v4 + 322);
    *(_QWORD *)&self->_flags |= 0x4000uLL;
  }
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v21 = *((id *)v4 + 26);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v91, v112, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v92;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v92 != v24)
          objc_enumerationMutation(v21);
        -[GEOPDEntity addName:](self, "addName:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * m));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v91, v112, 16);
    }
    while (v23);
  }

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v26 = *((id *)v4 + 29);
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v87, v111, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v88;
    do
    {
      for (n = 0; n != v28; ++n)
      {
        if (*(_QWORD *)v88 != v29)
          objc_enumerationMutation(v26);
        -[GEOPDEntity addSpokenName:](self, "addSpokenName:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * n));
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v87, v111, 16);
    }
    while (v28);
  }

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v31 = *((id *)v4 + 20);
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v83, v110, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v84;
    do
    {
      for (ii = 0; ii != v33; ++ii)
      {
        if (*(_QWORD *)v84 != v34)
          objc_enumerationMutation(v31);
        -[GEOPDEntity addLocalizedCategory:](self, "addLocalizedCategory:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * ii));
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v83, v110, 16);
    }
    while (v33);
  }

  v36 = *((_QWORD *)v4 + 41);
  if ((v36 & 0x20000) != 0)
  {
    self->_telephoneAdsOptOut = *((_BYTE *)v4 + 325);
    *(_QWORD *)&self->_flags |= 0x20000uLL;
    v36 = *((_QWORD *)v4 + 41);
    if ((v36 & 0x1000) == 0)
    {
LABEL_57:
      if ((v36 & 0x10000) == 0)
        goto LABEL_58;
      goto LABEL_72;
    }
  }
  else if ((v36 & 0x1000) == 0)
  {
    goto LABEL_57;
  }
  self->_altTelephoneAdsOptOut = *((_BYTE *)v4 + 320);
  *(_QWORD *)&self->_flags |= 0x1000uLL;
  v36 = *((_QWORD *)v4 + 41);
  if ((v36 & 0x10000) == 0)
  {
LABEL_58:
    if ((v36 & 0x40) == 0)
      goto LABEL_59;
    goto LABEL_73;
  }
LABEL_72:
  self->_isStandaloneBrand = *((_BYTE *)v4 + 324);
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  v36 = *((_QWORD *)v4 + 41);
  if ((v36 & 0x40) == 0)
  {
LABEL_59:
    if ((v36 & 0x400) == 0)
      goto LABEL_60;
    goto LABEL_74;
  }
LABEL_73:
  self->_displayStyle = *((_DWORD *)v4 + 74);
  *(_QWORD *)&self->_flags |= 0x40uLL;
  v36 = *((_QWORD *)v4 + 41);
  if ((v36 & 0x400) == 0)
  {
LABEL_60:
    if ((v36 & 0x200) == 0)
      goto LABEL_61;
    goto LABEL_75;
  }
LABEL_74:
  self->_searchSection = *((_DWORD *)v4 + 78);
  *(_QWORD *)&self->_flags |= 0x400uLL;
  v36 = *((_QWORD *)v4 + 41);
  if ((v36 & 0x200) == 0)
  {
LABEL_61:
    if ((v36 & 2) == 0)
      goto LABEL_62;
    goto LABEL_76;
  }
LABEL_75:
  self->_placeDisplayType = *((_DWORD *)v4 + 77);
  *(_QWORD *)&self->_flags |= 0x200uLL;
  v36 = *((_QWORD *)v4 + 41);
  if ((v36 & 2) == 0)
  {
LABEL_62:
    if ((v36 & 0x20) == 0)
      goto LABEL_64;
    goto LABEL_63;
  }
LABEL_76:
  self->_brandMuid = *((_QWORD *)v4 + 14);
  *(_QWORD *)&self->_flags |= 2uLL;
  if ((*((_QWORD *)v4 + 41) & 0x20) != 0)
  {
LABEL_63:
    self->_capacity = *((_DWORD *)v4 + 73);
    *(_QWORD *)&self->_flags |= 0x20uLL;
  }
LABEL_64:
  v37 = objc_msgSend(v4, "placeLookupCategorysCount");
  if (v37)
  {
    v38 = v37;
    for (jj = 0; jj != v38; ++jj)
      -[GEOPDEntity addPlaceLookupCategory:](self, "addPlaceLookupCategory:", objc_msgSend(v4, "placeLookupCategoryAtIndex:", jj));
  }
  secondaryName = self->_secondaryName;
  v41 = *((_QWORD *)v4 + 27);
  if (secondaryName)
  {
    if (v41)
      -[GEOLocalizedString mergeFrom:](secondaryName, "mergeFrom:");
  }
  else if (v41)
  {
    -[GEOPDEntity setSecondaryName:](self, "setSecondaryName:");
  }
  secondarySpokenName = self->_secondarySpokenName;
  v43 = *((_QWORD *)v4 + 28);
  if (secondarySpokenName)
  {
    if (v43)
      -[GEOLocalizedString mergeFrom:](secondarySpokenName, "mergeFrom:");
  }
  else if (v43)
  {
    -[GEOPDEntity setSecondarySpokenName:](self, "setSecondarySpokenName:");
  }
  styleAttributes = self->_styleAttributes;
  v45 = *((_QWORD *)v4 + 30);
  if (styleAttributes)
  {
    if (v45)
      -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
  }
  else if (v45)
  {
    -[GEOPDEntity setStyleAttributes:](self, "setStyleAttributes:");
  }
  if (*((_QWORD *)v4 + 34))
    -[GEOPDEntity setWalletCategoryId:](self, "setWalletCategoryId:");
  if (*((_QWORD *)v4 + 22))
    -[GEOPDEntity setMapsCategoryId:](self, "setMapsCategoryId:");
  if ((*((_BYTE *)v4 + 329) & 0x20) != 0)
  {
    self->_enableRapLightweightFeedback = *((_BYTE *)v4 + 321);
    *(_QWORD *)&self->_flags |= 0x2000uLL;
  }
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v46 = *((id *)v4 + 12);
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v79, v109, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v80;
    do
    {
      for (kk = 0; kk != v48; ++kk)
      {
        if (*(_QWORD *)v80 != v49)
          objc_enumerationMutation(v46);
        -[GEOPDEntity addAlternateSearchableName:](self, "addAlternateSearchableName:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * kk));
      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v79, v109, 16);
    }
    while (v48);
  }

  v51 = *((_QWORD *)v4 + 41);
  if ((v51 & 8) != 0)
  {
    self->_globalBrandMuid = *((_QWORD *)v4 + 18);
    *(_QWORD *)&self->_flags |= 8uLL;
    v51 = *((_QWORD *)v4 + 41);
    if ((v51 & 4) == 0)
    {
LABEL_105:
      if ((v51 & 1) == 0)
        goto LABEL_107;
      goto LABEL_106;
    }
  }
  else if ((v51 & 4) == 0)
  {
    goto LABEL_105;
  }
  self->_buildingId = *((_QWORD *)v4 + 15);
  *(_QWORD *)&self->_flags |= 4uLL;
  if ((*((_QWORD *)v4 + 41) & 1) != 0)
  {
LABEL_106:
    self->_areaHighlightId = *((_QWORD *)v4 + 13);
    *(_QWORD *)&self->_flags |= 1uLL;
  }
LABEL_107:
  if (*((_QWORD *)v4 + 25))
    -[GEOPDEntity setModernMapsCategoryId:](self, "setModernMapsCategoryId:");
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v52 = *((id *)v4 + 24);
  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v75, v108, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v76;
    do
    {
      for (mm = 0; mm != v54; ++mm)
      {
        if (*(_QWORD *)v76 != v55)
          objc_enumerationMutation(v52);
        -[GEOPDEntity addModernLocalizedCategory:](self, "addModernLocalizedCategory:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * mm));
      }
      v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v75, v108, 16);
    }
    while (v54);
  }

  if ((*((_BYTE *)v4 + 328) & 0x80) != 0)
  {
    self->_photosMemoryScore = *((float *)v4 + 75);
    *(_QWORD *)&self->_flags |= 0x80uLL;
  }
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v57 = *((id *)v4 + 21);
  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v71, v107, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v72;
    do
    {
      for (nn = 0; nn != v59; ++nn)
      {
        if (*(_QWORD *)v72 != v60)
          objc_enumerationMutation(v57);
        -[GEOPDEntity addMapsAltCategoryId:](self, "addMapsAltCategoryId:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * nn), (_QWORD)v71);
      }
      v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v71, v107, 16);
    }
    while (v59);
  }

  if ((*((_BYTE *)v4 + 329) & 1) != 0)
  {
    self->_placeCategoryType = *((_DWORD *)v4 + 76);
    *(_QWORD *)&self->_flags |= 0x100uLL;
  }
  inlineRapEnablement = self->_inlineRapEnablement;
  v63 = *((_QWORD *)v4 + 19);
  if (inlineRapEnablement)
  {
    if (v63)
      -[GEOPDInlineRapEnablement mergeFrom:](inlineRapEnablement, "mergeFrom:");
  }
  else if (v63)
  {
    -[GEOPDEntity setInlineRapEnablement:](self, "setInlineRapEnablement:");
  }
  if ((*((_BYTE *)v4 + 328) & 0x10) != 0)
  {
    self->_mapsCategoryMuid = *((_QWORD *)v4 + 23);
    *(_QWORD *)&self->_flags |= 0x10uLL;
  }
  v64 = objc_msgSend(v4, "mapsAltCategoryMuidsCount", (_QWORD)v71);
  if (v64)
  {
    v65 = v64;
    for (i1 = 0; i1 != v65; ++i1)
      -[GEOPDEntity addMapsAltCategoryMuid:](self, "addMapsAltCategoryMuid:", objc_msgSend(v4, "mapsAltCategoryMuidAtIndex:", i1));
  }
  disclaimerText = self->_disclaimerText;
  v68 = *((_QWORD *)v4 + 16);
  if (disclaimerText)
  {
    if (v68)
      -[GEOLocalizedString mergeFrom:](disclaimerText, "mergeFrom:");
  }
  else if (v68)
  {
    -[GEOPDEntity setDisclaimerText:](self, "setDisclaimerText:");
  }
  urlData = self->_urlData;
  v70 = *((_QWORD *)v4 + 32);
  if (urlData)
  {
    if (v70)
      -[GEOPDURLData mergeFrom:](urlData, "mergeFrom:");
  }
  else if (v70)
  {
    -[GEOPDEntity setUrlData:](self, "setUrlData:");
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((_BYTE *)&self->_flags + 2) & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPDEntityReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3460);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
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
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v3 = a3;
  v57 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40000040000uLL;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPDEntity readAll:](self, "readAll:", 0);
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v7 = self->_names;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v49;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v49 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v9);
    }

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v12 = self->_spokenNames;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v45;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v45 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v16++), "clearUnknownFields:", 1);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
      }
      while (v14);
    }

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v17 = self->_localizedCategorys;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v41;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v41 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v21++), "clearUnknownFields:", 1);
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
      }
      while (v19);
    }

    -[GEOLocalizedString clearUnknownFields:](self->_secondaryName, "clearUnknownFields:", 1);
    -[GEOLocalizedString clearUnknownFields:](self->_secondarySpokenName, "clearUnknownFields:", 1);
    -[GEOStyleAttributes clearUnknownFields:](self->_styleAttributes, "clearUnknownFields:", 1);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v22 = self->_alternateSearchableNames;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v37;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v37 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v26++), "clearUnknownFields:", 1);
        }
        while (v24 != v26);
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
      }
      while (v24);
    }

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v27 = self->_modernLocalizedCategorys;
    v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v33;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v33 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v31++), "clearUnknownFields:", 1, (_QWORD)v32);
        }
        while (v29 != v31);
        v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
      }
      while (v29);
    }

    -[GEOPDInlineRapEnablement clearUnknownFields:](self->_inlineRapEnablement, "clearUnknownFields:", 1);
    -[GEOLocalizedString clearUnknownFields:](self->_disclaimerText, "clearUnknownFields:", 1);
    -[GEOPDURLData clearUnknownFields:](self->_urlData, "clearUnknownFields:", 1);
  }
}

@end
