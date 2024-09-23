@implementation GEOAddressObject

void __63__GEOAddressObject_PlaceDataExtras__addressObjectForPlaceData___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id *v5;
  void *v6;
  id *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id *v17;

  v5 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v17 = v5;
    -[GEOPDComponent values](v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;
    if (!v17)
    {
      objc_msgSend(*(id *)(a1 + 32), "hasMuid");
      goto LABEL_28;
    }
    if ((*((_WORD *)v17 + 50) & 0x80) != 0)
    {
      if (*((_DWORD *)v17 + 22) != 31)
        goto LABEL_34;
      objc_msgSend(v6, "firstObject");
      v12 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v12;
      if (v12 && *(_QWORD *)(v12 + 40))
      {
        -[GEOPDComponentValue addressObject]((id *)v12);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1 + 40);
        goto LABEL_26;
      }

      v7 = v17;
      if ((*((_WORD *)v17 + 50) & 0x80) != 0)
      {
LABEL_34:
        if (*((_DWORD *)v7 + 22) != 5)
          goto LABEL_22;
        objc_msgSend(v6, "firstObject");
        v13 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v13;
        if (v13 && *(_QWORD *)(v13 + 56))
        {
          -[GEOPDComponentValue address]((id *)v13);
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = *(_QWORD *)(a1 + 56);
          goto LABEL_26;
        }

        v7 = v17;
        if ((*((_WORD *)v17 + 50) & 0x80) != 0)
        {
LABEL_22:
          if (*((_DWORD *)v7 + 22) == 2)
          {
            objc_msgSend(v6, "firstObject");
            v14 = objc_claimAutoreleasedReturnValue();
            v9 = (void *)v14;
            if (v14 && *(_QWORD *)(v14 + 400))
            {
              -[GEOPDComponentValue placeInfo]((id *)v14);
              v10 = objc_claimAutoreleasedReturnValue();
              v11 = *(_QWORD *)(a1 + 48);
              goto LABEL_26;
            }

          }
        }
      }
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "hasMuid") & 1) != 0
      || (*((_WORD *)v17 + 50) & 0x80) == 0
      || *((_DWORD *)v17 + 22) != 1)
    {
      goto LABEL_28;
    }
    objc_msgSend(v6, "firstObject");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (!v8 || !*(_QWORD *)(v8 + 192))
      goto LABEL_27;
    -[GEOPDComponentValue entity]((id *)v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 64);
LABEL_26:
    v15 = *(_QWORD *)(v11 + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v10;

LABEL_27:
LABEL_28:

    v5 = v17;
    goto LABEL_29;
  }
  *a3 = 1;
LABEL_29:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pimpl, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)addressObjectForPlaceData:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__36;
  v34 = __Block_byref_object_dispose__36;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__36;
  v28 = __Block_byref_object_dispose__36;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__36;
  v22 = __Block_byref_object_dispose__36;
  v23 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__36;
  v16[4] = __Block_byref_object_dispose__36;
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__GEOAddressObject_PlaceDataExtras__addressObjectForPlaceData___block_invoke;
  v10[3] = &unk_1E1C09940;
  v12 = &v30;
  v13 = &v18;
  v14 = &v24;
  v5 = v4;
  v11 = v5;
  v15 = v16;
  objc_msgSend(v5, "enumerateValidComponentsWithValuesUsingBlock:", v10);
  if (v31[5] && v19[5] || v25[5])
  {
    +[GEOAddressObject addressObjectWithPlaceDataAddressObject:placeDataAddress:placeDataInfo:placeDataEntity:](GEOAddressObject, "addressObjectWithPlaceDataAddressObject:placeDataAddress:placeDataInfo:placeDataEntity:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOPlaceDataExtras");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v37 = v8;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "%{private}@ cannot build GEOAddressObject unless it has a GEOPDAddressObject and a GEOPDPlaceInfo, or an old GEOPDAddress.", buf, 0xCu);

    }
    v6 = 0;
  }

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v6;
}

+ (GEOAddressObject)addressObjectWithPlaceDataAddressObject:(id)a3 placeDataAddress:(id)a4 placeDataInfo:(id)a5 placeDataEntity:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  NSObject *v18;
  GEOAddressObject *v19;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[NSLocale currentLocale] failed for NSLocaleCountryCode"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v17;
      _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_ERROR, "%{public}@@", buf, 0xCu);
    }

    v16 = &stru_1E1C241D0;
  }
  v19 = -[GEOAddressObject initWithPlaceDataAddressObject:placeDataAddress:placeDataInfo:placeDataEntity:language:country:phoneticLocale:]([GEOAddressObject alloc], "initWithPlaceDataAddressObject:placeDataAddress:placeDataInfo:placeDataEntity:language:country:phoneticLocale:", v9, v10, v11, v12, v14, v16, v14);

  return v19;
}

- (GEOAddressObject)initWithPlaceDataAddressObject:(id)a3 placeDataAddress:(id)a4 placeDataInfo:(id)a5 placeDataEntity:(id)a6 language:(id)a7 country:(id)a8 phoneticLocale:(id)a9
{
  id v16;
  id v17;
  _WORD *v18;
  id v19;
  void *v20;
  _QWORD *v21;
  _QWORD *v22;
  _GEOAddressObject *v23;
  void *v24;
  id *v25;
  id v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  NSObject *v30;
  void *v31;
  GEOAddressObject *v32;
  void *v33;
  void *v34;
  void *v35;
  _DWORD *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  id *v41;
  NSString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t i;
  GEOLocalizedString *v55;
  NSObject *v56;
  void *v57;
  uint64_t v58;
  unsigned __int8 v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t j;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  int v69;
  NSObject *v70;
  NSObject *v71;
  GEOAddress *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t k;
  NSObject *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  PBDataReader *reader;
  unint64_t *v83;
  unint64_t v84;
  _DWORD *v85;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  GEOPDLocalizedSpokenStructuredAddress *v91;
  NSString *v92;
  id obj;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  CNPostalAddress *v97;
  id v98;
  NSString *v99;
  NSString *v100;
  NSString *v101;
  id *v102;
  NSString *v103;
  id v104;
  id v105;
  id v106;
  id v107;
  GEOAddress v108;
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
  uint8_t v120[4];
  _BYTE v121[12];
  __int128 v122[8];
  __int128 v123;
  unsigned __int8 v124;
  _BYTE buf[12];
  char v126;
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = v17;
  v107 = v19;
  v104 = a7;
  v105 = a8;
  v106 = a9;
  v108._unknownFields = (PBUnknownFields *)self;
  v108._formattedAddressLines = (NSMutableArray *)GEOAddressObject;
  v21 = objc_msgSendSuper2((objc_super *)&v108._unknownFields, sel_init);
  v22 = v21;
  if (!v21)
  {
LABEL_20:
    v32 = 0;
    goto LABEL_127;
  }
  v21[2] = 0;
  v23 = objc_alloc_init(_GEOAddressObject);
  v24 = (void *)v22[1];
  v22[1] = v23;

  if (v16)
  {
    v25 = (id *)v16;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s forbids %s to be nil"), "addr_obj::AddressObjectPtr _AddressObjectPtrFromGEOPDAddressObject(GEOPDAddressObject *__strong)", "pdAddressObject");

    v26 = v25[2];
    -[NSData cppData](buf, v26);

    if (_MergedGlobals_332 != -1)
      dispatch_once(&_MergedGlobals_332, &__block_literal_global_200);
    addr_obj::AddressObjectFactory::fromBytes((addr_obj::Logger *)qword_1ECDBCBB8, buf, v122);
    if (v126 < 0)
      operator delete(*(void **)buf);

    std::shared_ptr<zilch::TrafficDynamicTile::Incident>::operator=[abi:ne180100](v22[1] + 8, v122);
    v27 = (std::__shared_weak_count *)*((_QWORD *)&v122[0] + 1);
    if (*((_QWORD *)&v122[0] + 1))
    {
      v28 = (unint64_t *)(*((_QWORD *)&v122[0] + 1) + 8);
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
      }
    }
    if (*(_QWORD *)(v22[1] + 8))
    {
      if (v18 && (v18[46] & 2) != 0)
      {
        v36 = (_DWORD *)operator new();
        v37 = -[GEOPDPlaceInfo knownAccuracy]((uint64_t)v18);
      }
      else
      {
        if (!v17 || (*((_BYTE *)v17 + 64) & 1) == 0)
        {
          GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
          v30 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            NSStringFromSelector(a2);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138477827;
            *(_QWORD *)&buf[4] = v31;
            _os_log_impl(&dword_1885A9000, v30, OS_LOG_TYPE_DEBUG, "%{private}@ did not find a value for knownAccuracy", buf, 0xCu);

          }
          goto LABEL_27;
        }
        v36 = (_DWORD *)operator new();
        v37 = -[GEOPDAddress knownAccuracy]((uint64_t)v17);
      }
      *v36 = v37;
      v22[2] = v36;
LABEL_27:
      v32 = v22;
      goto LABEL_127;
    }
    goto LABEL_20;
  }
  if (v107)
  {
    if (objc_msgSend(v107, "namesCount"))
    {
      objc_msgSend(v107, "names");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "firstObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringValue");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v35 = 0;
    }
    if (objc_msgSend(v107, "spokenNamesCount"))
    {
      objc_msgSend(v107, "spokenNames");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "firstObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringValue");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_33;
    }
  }
  else
  {
    v35 = 0;
  }
  v40 = 0;
LABEL_33:
  v41 = v20;
  v103 = v35;
  v42 = v40;
  v100 = (NSString *)v104;
  v99 = (NSString *)v105;
  v98 = v106;
  v101 = v42;
  v102 = v41;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Check %s against nullptr before calling %s"), "pdAddress", "addr_obj::AddressObjectPtr _AddressObjectPtrFromGEOPDAddress(GEOPDAddress *__strong, NSString *__strong, NSString *__strong, NSString *__strong, NSString *__strong, NSString *__strong)");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v41)
  {

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Check %s against nullptr before calling %s"), "language", "addr_obj::AddressObjectPtr _AddressObjectPtrFromGEOPDAddress(GEOPDAddress *__strong, NSString *__strong, NSString *__strong, NSString *__strong, NSString *__strong, NSString *__strong)");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v45;
    if (v100)
    {

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Check %s against nullptr before calling %s"), "country", "addr_obj::AddressObjectPtr _AddressObjectPtrFromGEOPDAddress(GEOPDAddress *__strong, NSString *__strong, NSString *__strong, NSString *__strong, NSString *__strong, NSString *__strong)");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v46;
      if (v99)
      {

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Check %s against nullptr before calling %s"), "phoneticLocale", "addr_obj::AddressObjectPtr _AddressObjectPtrFromGEOPDAddress(GEOPDAddress *__strong, NSString *__strong, NSString *__strong, NSString *__strong, NSString *__strong, NSString *__strong)");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v47;
        if (v98)
        {

          -[GEOPDAddress _readLocalizedAddress]((uint64_t)v41);
          if (objc_msgSend(v41[3], "count"))
          {
            -[GEOPDAddress _readSpokenNavigationAddress]((uint64_t)v41);
            if (objc_msgSend(v41[4], "count"))
            {
              -[GEOPDAddress spokenNavigationAddress](v41);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "firstObject");
              v91 = (GEOPDLocalizedSpokenStructuredAddress *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v91 = 0;
            }
            -[GEOPDAddress _readSpokenStructuredAddress]((uint64_t)v41);
            if (objc_msgSend(v41[5], "count"))
            {
              -[GEOPDAddress spokenStructuredAddress](v41);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "firstObject");
              v92 = (NSString *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v92 = 0;
            }
            v117 = 0u;
            v118 = 0u;
            v115 = 0u;
            v116 = 0u;
            -[GEOPDAddress localizedAddress](v41);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            obj = v52;
            v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v115, buf, 16);
            if (v53)
            {
              v95 = *(_QWORD *)v116;
              v90 = v20;
              do
              {
                v94 = v53;
                for (i = 0; i != v94; ++i)
                {
                  if (*(_QWORD *)v116 != v95)
                    objc_enumerationMutation(obj);
                  -[GEOPDLocalizedAddress address](*(id **)(*((_QWORD *)&v115 + 1) + 8 * i));
                  v55 = (GEOLocalizedString *)objc_claimAutoreleasedReturnValue();
                  if (-[GEOLocalizedString formattedAddressLinesCount](v55, "formattedAddressLinesCount"))
                  {
                    _AddressObjectPtrFromLegacy(&v108, v55, v91, v92, v103, v101, v100, v99, v98);

                    goto LABEL_116;
                  }
                  if ((-[GEOLocalizedString hasStructuredAddress](v55, "hasStructuredAddress") & 1) != 0)
                  {
                    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
                    v56 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                    {
                      LODWORD(v123) = 138477827;
                      *(_QWORD *)((char *)&v123 + 4) = v55;
                      _os_log_impl(&dword_1885A9000, v56, OS_LOG_TYPE_DEBUG, "The GEOAddress is missing the formattedAddress: %{private}@", (uint8_t *)&v123, 0xCu);
                    }

                    -[GEOLocalizedString structuredAddress](v55, "structuredAddress");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    _buildCNPostalAddressFromStructuredAddress(v57);
                    v97 = (CNPostalAddress *)objc_claimAutoreleasedReturnValue();

                    _buildMissingFormattedAddressStringFromCNPostalAddress(v97);
                    v96 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSString stdString](&v123, v96);
                    v58 = v124;
                    if ((v124 & 0x80u) != 0)
                      v58 = *((_QWORD *)&v123 + 1);
                    if (v58)
                    {
                      v59 = atomic_load((unsigned __int8 *)&qword_1ECDBCBC8);
                      if ((v59 & 1) == 0 && __cxa_guard_acquire(&qword_1ECDBCBC8))
                      {
                        v78 = objc_alloc(MEMORY[0x1E0C99E60]);
                        getCNPostalAddressStreetKey();
                        v79 = (void *)objc_claimAutoreleasedReturnValue();
                        getCNPostalAddressCityKey();
                        v89 = (void *)objc_claimAutoreleasedReturnValue();
                        getCNPostalAddressStateKey();
                        v88 = (void *)objc_claimAutoreleasedReturnValue();
                        getCNPostalAddressPostalCodeKey();
                        v87 = (void *)objc_claimAutoreleasedReturnValue();
                        getCNPostalAddressCountryKey();
                        v80 = (void *)objc_claimAutoreleasedReturnValue();
                        getCNPostalAddressISOCountryCodeKey();
                        v81 = (void *)objc_claimAutoreleasedReturnValue();
                        qword_1ECDBCBC0 = objc_msgSend(v78, "initWithObjects:", v79, v89, v88, v87, v80, v81, 0);

                        __cxa_guard_release(&qword_1ECDBCBC8);
                      }
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s forbids %s to be nil"), "addr_obj::AddressObjectPtr _AddressObjectPtrFromGEOPDAddress(GEOPDAddress *__strong, NSString *__strong, NSString *__strong, NSString *__strong, NSString *__strong, NSString *__strong)", "ContactKeySet");
                      v60 = (void *)objc_claimAutoreleasedReturnValue();
                      v61 = v60;
                      if (qword_1ECDBCBC0)
                      {

                        v113 = 0u;
                        v114 = 0u;
                        v111 = 0u;
                        v112 = 0u;
                        -[CNPostalAddress dictionaryRepresentation](v97, "dictionaryRepresentation");
                        v62 = (void *)objc_claimAutoreleasedReturnValue();
                        v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v111, v122, 16);
                        if (v63)
                        {
                          v64 = *(_QWORD *)v112;
                          while (2)
                          {
                            for (j = 0; j != v63; ++j)
                            {
                              if (*(_QWORD *)v112 != v64)
                                objc_enumerationMutation(v62);
                              if ((objc_msgSend((id)qword_1ECDBCBC0, "containsObject:", *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * j)) & 1) == 0)
                              {

                                v72 = [GEOAddress alloc];
                                -[GEOLocalizedString copyTo:](v55, "copyTo:", v72);
                                v109 = 0u;
                                v110 = 0u;
                                memset(&v108._structuredAddress, 0, 32);
                                objc_msgSend(v96, "componentsSeparatedByString:", CFSTR("\n"));
                                v73 = (void *)objc_claimAutoreleasedReturnValue();
                                v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v108._structuredAddress, v119, 16);
                                if (v74)
                                {
                                  v75 = **(_QWORD **)&v108._readerLock._os_unfair_lock_opaque;
                                  do
                                  {
                                    for (k = 0; k != v74; ++k)
                                    {
                                      if (**(_QWORD **)&v108._readerLock._os_unfair_lock_opaque != v75)
                                        objc_enumerationMutation(v73);
                                      -[GEOAddress addFormattedAddressLine:](v72, "addFormattedAddressLine:", *(_QWORD *)(*(_QWORD *)&v108._readerMarkPos + 8 * k));
                                    }
                                    v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v108._structuredAddress, v119, 16);
                                  }
                                  while (v74);
                                }

                                v20 = v90;
                                _AddressObjectPtrFromLegacy(&v108, (GEOLocalizedString *)v72, v91, v92, v103, v101, v100, v99, v98);

                                goto LABEL_104;
                              }
                            }
                            v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v111, v122, 16);
                            if (v63)
                              continue;
                            break;
                          }
                        }

                        _AddressObjectPtrFromCNPostalAddress((CNPostalAddress *)v120, (NSString *)&v97->super.isa, v100, v99, v98);
                        v66 = *(std::__shared_weak_count **)&v121[4];
                        if (*(_QWORD *)&v121[4])
                        {
                          v67 = (unint64_t *)(*(_QWORD *)&v121[4] + 8);
                          do
                            v68 = __ldaxr(v67);
                          while (__stlxr(v68 - 1, v67));
                          if (!v68)
                          {
                            ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
                            std::__shared_weak_count::__release_weak(v66);
                          }
                        }
                        v69 = 1;
                      }
                      else
                      {
                        GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
                        v77 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)v120 = 138543362;
                          *(_QWORD *)v121 = v61;
                          _os_log_impl(&dword_1885A9000, v77, OS_LOG_TYPE_ERROR, "%{public}@", v120, 0xCu);
                        }

                        v108.super.super.isa = 0;
                        v108._reader = 0;

LABEL_104:
                        v69 = 0;
                      }
                    }
                    else
                    {
                      GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
                      v71 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
                      {
                        *(_WORD *)v120 = 0;
                        _os_log_impl(&dword_1885A9000, v71, OS_LOG_TYPE_DEBUG, "Empty formatted address and address dictionary, can't create AddressObject", v120, 2u);
                      }

                      v69 = 0;
                      v108.super.super.isa = 0;
                      v108._reader = 0;
                    }
                    if ((char)v124 < 0)
                      operator delete((void *)v123);

                    if (!v69)
                    {

                      goto LABEL_116;
                    }
                  }
                  else
                  {
                    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
                    v70 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
                    {
                      LODWORD(v123) = 138477827;
                      *(_QWORD *)((char *)&v123 + 4) = v55;
                      _os_log_impl(&dword_1885A9000, v70, OS_LOG_TYPE_DEBUG, "A GEOPDLocalizedAddress in localizedAddress is missing formatted and structured address: %{private}@", (uint8_t *)&v123, 0xCu);
                    }

                  }
                }
                v52 = obj;
                v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, buf, 16);
              }
              while (v53);
            }

            v108.super.super.isa = 0;
            v108._reader = 0;
LABEL_116:

          }
          else
          {
            GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1885A9000, v50, OS_LOG_TYPE_DEBUG, "No localized addresses, can't create AddressObject", buf, 2u);
            }

            v108.super.super.isa = 0;
            v108._reader = 0;
          }
          goto LABEL_117;
        }
        GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v44;
          _os_log_impl(&dword_1885A9000, v49, OS_LOG_TYPE_ERROR, "%{public}@@", buf, 0xCu);
        }
      }
      else
      {
        GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v44;
          _os_log_impl(&dword_1885A9000, v49, OS_LOG_TYPE_ERROR, "%{public}@@", buf, 0xCu);
        }
      }
    }
    else
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v44;
        _os_log_impl(&dword_1885A9000, v49, OS_LOG_TYPE_ERROR, "%{public}@@", buf, 0xCu);
      }
    }
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v44;
      _os_log_impl(&dword_1885A9000, v49, OS_LOG_TYPE_ERROR, "%{public}@@", buf, 0xCu);
    }
  }

  v108.super.super.isa = 0;
  v108._reader = 0;

LABEL_117:
  std::shared_ptr<zilch::TrafficDynamicTile::Incident>::operator=[abi:ne180100](v22[1] + 8, (__int128 *)&v108);
  reader = v108._reader;
  if (v108._reader)
  {
    v83 = (unint64_t *)((char *)v108._reader + 8);
    do
      v84 = __ldaxr(v83);
    while (__stlxr(v84 - 1, v83));
    if (!v84)
    {
      (*(void (**)(PBDataReader *))(*(_QWORD *)reader + 16))(reader);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)reader);
    }
  }
  if (*(_QWORD *)(v22[1] + 8))
  {
    if (-[GEOPDAddress knownAccuracy]((uint64_t)v102))
    {
      v85 = (_DWORD *)operator new();
      *v85 = -[GEOPDAddress knownAccuracy]((uint64_t)v102);
      v22[2] = v85;
    }
    v32 = v22;
  }
  else
  {
    v32 = 0;
  }

LABEL_127:
  return v32;
}

+ (BOOL)isLoggingDebug
{
  return isLoggingDebug_;
}

- (GEOAddressObject)initWithCoder:(id)a3
{
  id v4;
  GEOAddressObject *v5;
  _GEOAddressObject *v6;
  _GEOAddressObject *pimpl;
  id v8;
  void *v9;
  GEOAddressObject *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  int *v14;
  __int128 v16;
  void *__p[2];
  char v18;
  size_t __len;
  objc_super v20;

  v4 = a3;
  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("addrObj")) & 1) != 0)
  {
    v20.receiver = self;
    v20.super_class = (Class)GEOAddressObject;
    v5 = -[GEOAddressObject init](&v20, sel_init);
    if (v5)
    {
      v6 = objc_alloc_init(_GEOAddressObject);
      pimpl = v5->_pimpl;
      v5->_pimpl = v6;

      __len = 0;
      v8 = objc_retainAutorelease(v4);
      v9 = (void *)objc_msgSend(v8, "decodeBytesForKey:returnedLength:", CFSTR("addrObj"), &__len);
      v10 = 0;
      if (__len && v9)
      {
        std::string::basic_string[abi:ne180100](__p, v9, __len);
        if (_MergedGlobals_332 != -1)
          dispatch_once(&_MergedGlobals_332, &__block_literal_global_200);
        addr_obj::AddressObjectFactory::fromBytes((addr_obj::Logger *)qword_1ECDBCBB8, (unsigned __int8 *)__p, &v16);
        std::shared_ptr<zilch::TrafficDynamicTile::Incident>::operator=[abi:ne180100]((uint64_t)&v5->_pimpl->_addrObjPtr, &v16);
        v11 = (std::__shared_weak_count *)*((_QWORD *)&v16 + 1);
        if (*((_QWORD *)&v16 + 1))
        {
          v12 = (unint64_t *)(*((_QWORD *)&v16 + 1) + 8);
          do
            v13 = __ldaxr(v12);
          while (__stlxr(v13 - 1, v12));
          if (!v13)
          {
            ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
            std::__shared_weak_count::__release_weak(v11);
          }
        }
        if (v5->_pimpl->_addrObjPtr.__ptr_)
        {
          if (objc_msgSend(v8, "containsValueForKey:", CFSTR("knownAccuracy")))
          {
            v14 = (int *)operator new();
            *v14 = objc_msgSend(v8, "decodeIntForKey:", CFSTR("knownAccuracy"));
            v5->_knownAccuracy = v14;
          }
          v10 = v5;
        }
        else
        {
          v10 = 0;
        }
        if (v18 < 0)
          operator delete(__p[0]);
      }
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
    v5 = self;
  }

  return v10;
}

- (id)address
{
  AddressObject *ptr;
  uint64_t DisplayLanguage;
  uint64_t v5;
  const void **v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v11;
  void *v12;
  uint8_t v13[4];
  void *v14;
  _BYTE buf[12];
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  if (ptr)
  {
    (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)ptr + 24))(buf);
    DisplayLanguage = addr_obj::Localization::getDisplayLanguage((addr_obj::Localization *)buf);
    v5 = *(unsigned __int8 *)(DisplayLanguage + 23);
    if ((v5 & 0x80u) != 0)
      v5 = *(_QWORD *)(DisplayLanguage + 8);
    if (v5)
    {
      v6 = (const void **)addr_obj::Localization::getDisplayLanguage((addr_obj::Localization *)buf);
      _protobufCPPDataToObjC<GEOAddress>(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v13 = 138477827;
        v14 = v12;
        _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEBUG, "%{private}@ could not get a GEOAddress", v13, 0xCu);

      }
      v7 = 0;
    }
    if (v16 < 0)
      operator delete(*(void **)buf);
    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject address]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v8;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "%{public}@@", buf, 0xCu);
    }

    return 0;
  }
}

- (void)dealloc
{
  int *knownAccuracy;
  objc_super v4;

  knownAccuracy = self->_knownAccuracy;
  if (knownAccuracy)
  {
    MEMORY[0x18D76437C](knownAccuracy, 0x1000C4052888210);
    self->_knownAccuracy = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)GEOAddressObject;
  -[GEOAddressObject dealloc](&v4, sel_dealloc);
}

+ (BOOL)isMarkingMMStrings
{
  return GEOConfigGetBOOL(GeoServicesConfig_AddressObjectMarkStrings, (uint64_t)off_1EDF4D488);
}

- (NSString)displayLanguage
{
  AddressObject *ptr;
  uint64_t v3;
  addr_obj::Localization *v4;
  uint64_t *DisplayLanguage;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  v3 = MEMORY[0x1E0CB3940];
  if (ptr)
  {
    v4 = (addr_obj::Localization *)(*(uint64_t (**)(AddressObject *, SEL))(*(_QWORD *)ptr + 152))(ptr, a2);
    DisplayLanguage = (uint64_t *)addr_obj::Localization::getDisplayLanguage(v4);
    +[NSString stringWithStdString:copy:](v3, DisplayLanguage);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject displayLanguage]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "%{public}@@", buf, 0xCu);
    }

    v6 = 0;
  }
  return (NSString *)v6;
}

+ (id)libraryVersion
{
  uint64_t v2;
  void *v3;
  void *__p[2];
  char v6;

  v2 = MEMORY[0x1E0CB3940];
  addr_obj::getVersion(__p);
  +[NSString stringWithStdString:copy:](v2, (uint64_t *)__p);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 < 0)
    operator delete(__p[0]);
  return v3;
}

- (id)rawBytes
{
  AddressObject *ptr;
  id v3;
  void *__p[2];
  char v6;

  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  if (ptr)
  {
    (*(void (**)(void **__return_ptr))(*(_QWORD *)ptr + 192))(__p);
    objc_opt_self();
    v3 = -[NSData initWithCPPData:copy:](objc_alloc(MEMORY[0x1E0C99D50]), (const void **)__p);
    if (v6 < 0)
      operator delete(__p[0]);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)hasKnownAccuracy
{
  return self->_knownAccuracy != 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  AddressObject *ptr;
  void **v6;
  int *knownAccuracy;
  void *__p[2];
  char v9;

  v4 = a3;
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  if (ptr)
  {
    (*(void (**)(void **__return_ptr))(*(_QWORD *)ptr + 192))(__p);
    if (v9 < 0)
    {
      if (!__p[1])
      {
LABEL_8:
        operator delete(__p[0]);
        goto LABEL_9;
      }
      v6 = (void **)__p[0];
    }
    else
    {
      if (!v9)
        goto LABEL_9;
      v6 = __p;
    }
    objc_msgSend(v4, "encodeBytes:length:forKey:", v6);
    if ((v9 & 0x80000000) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_9:
  knownAccuracy = self->_knownAccuracy;
  if (knownAccuracy)
    objc_msgSend(v4, "encodeInt:forKey:", *knownAccuracy, CFSTR("knownAccuracy"));

}

- (int)knownAccuracy
{
  void *v3;
  void *v4;
  NSObject *v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Check %s against nullptr before calling %s"), "_knownAccuracy", "-[GEOAddressObject knownAccuracy]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_knownAccuracy)
  {

    return *self->_knownAccuracy;
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v8 = v4;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "%{public}@@", buf, 0xCu);
    }

    return 0;
  }
}

+ (void)setLoggingDebug:(BOOL)a3
{
  isLoggingDebug_ = a3;
}

- (GEOAddressObject)initWithContactAddressDictionary:(id)a3 language:(id)a4 country:(id)a5 phoneticLocale:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  GEOAddressObject *v14;
  GEOAddressObject *v15;
  _GEOAddressObject *v16;
  _GEOAddressObject *pimpl;
  id v18;
  NSString *v19;
  NSString *v20;
  id v21;
  GEOStructuredAddress *v22;
  NSString *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  GEOAddressObject *v27;
  id v29;
  __int128 v30;
  objc_super v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v31.receiver = self;
  v31.super_class = (Class)GEOAddressObject;
  v14 = -[GEOAddressObject init](&v31, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_9;
  v14->_knownAccuracy = 0;
  v16 = objc_alloc_init(_GEOAddressObject);
  pimpl = v15->_pimpl;
  v15->_pimpl = v16;

  v29 = v10;
  v18 = v10;
  v19 = (NSString *)v11;
  v20 = (NSString *)v12;
  v21 = v13;
  v22 = -[GEOStructuredAddress initWithAddressDictionary:]([GEOStructuredAddress alloc], "initWithAddressDictionary:", v18);
  _buildCNPostalAddressFromStructuredAddress(v22);
  v23 = (NSString *)objc_claimAutoreleasedReturnValue();
  _AddressObjectPtrFromCNPostalAddress((CNPostalAddress *)&v30, v23, v19, v20, v21);

  std::shared_ptr<zilch::TrafficDynamicTile::Incident>::operator=[abi:ne180100]((uint64_t)&v15->_pimpl->_addrObjPtr, &v30);
  v24 = (std::__shared_weak_count *)*((_QWORD *)&v30 + 1);
  v10 = v29;
  if (*((_QWORD *)&v30 + 1))
  {
    v25 = (unint64_t *)(*((_QWORD *)&v30 + 1) + 8);
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  if (v15->_pimpl->_addrObjPtr.__ptr_)
    v27 = v15;
  else
LABEL_9:
    v27 = 0;

  return v27;
}

- (GEOAddressObject)initWithCNPostalAddress:(id)a3 language:(id)a4 country:(id)a5 phoneticLocale:(id)a6
{
  NSString *v10;
  NSString *v11;
  NSString *v12;
  id v13;
  GEOAddressObject *v14;
  GEOAddressObject *v15;
  _GEOAddressObject *v16;
  _GEOAddressObject *pimpl;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  GEOAddressObject *v21;
  __int128 v23;
  objc_super v24;

  v10 = (NSString *)a3;
  v11 = (NSString *)a4;
  v12 = (NSString *)a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)GEOAddressObject;
  v14 = -[GEOAddressObject init](&v24, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_9;
  v14->_knownAccuracy = 0;
  v16 = objc_alloc_init(_GEOAddressObject);
  pimpl = v15->_pimpl;
  v15->_pimpl = v16;

  _AddressObjectPtrFromCNPostalAddress((CNPostalAddress *)&v23, v10, v11, v12, v13);
  std::shared_ptr<zilch::TrafficDynamicTile::Incident>::operator=[abi:ne180100]((uint64_t)&v15->_pimpl->_addrObjPtr, &v23);
  v18 = (std::__shared_weak_count *)*((_QWORD *)&v23 + 1);
  if (*((_QWORD *)&v23 + 1))
  {
    v19 = (unint64_t *)(*((_QWORD *)&v23 + 1) + 8);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  if (v15->_pimpl->_addrObjPtr.__ptr_)
    v21 = v15;
  else
LABEL_9:
    v21 = 0;

  return v21;
}

- (GEOAddressObject)initWithCurrentCountry
{
  GEOAddressObject *v2;
  _GEOAddressObject *v3;
  _GEOAddressObject *pimpl;
  void *v5;
  void *v6;
  addr_obj::Logger *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  GEOAddressObject *v11;
  void *__p[2];
  char v14;
  void *v15[2];
  char v16;
  void *v17[2];
  char v18;
  void *v19[2];
  char v20;
  void *v21[2];
  char v22;
  void *v23[2];
  char v24;
  void *v25[2];
  char v26;
  void *v27[2];
  char v28;
  void *v29[2];
  char v30;
  void *v31[2];
  char v32;
  void *v33[2];
  char v34;
  void *v35[2];
  char v36;
  void *v37[2];
  char v38;
  void *v39;
  char v40;
  void *v41;
  char v42;
  __int128 v43;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)GEOAddressObject;
  v2 = -[GEOAddressObject init](&v44, sel_init);
  if (v2 && ContactsLibraryCore())
  {
    v2->_knownAccuracy = 0;
    v3 = objc_alloc_init(_GEOAddressObject);
    pimpl = v2->_pimpl;
    v2->_pimpl = v3;

    +[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "countryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (_MergedGlobals_332 != -1)
      dispatch_once(&_MergedGlobals_332, &__block_literal_global_200);
    v7 = (addr_obj::Logger *)qword_1ECDBCBB8;
    std::string::basic_string[abi:ne180100]<0>(v35, "");
    std::string::basic_string[abi:ne180100]<0>(v33, "");
    std::string::basic_string[abi:ne180100]<0>(v31, "");
    addr_obj::Localization::Localization(v37, v35, v33, v31);
    -[NSString stdString](v29, v6);
    std::string::basic_string[abi:ne180100]<0>(v27, "");
    std::string::basic_string[abi:ne180100]<0>(v25, "");
    std::string::basic_string[abi:ne180100]<0>(v23, "");
    std::string::basic_string[abi:ne180100]<0>(v21, "");
    std::string::basic_string[abi:ne180100]<0>(v19, "");
    -[NSString stdString](v17, v6);
    std::string::basic_string[abi:ne180100]<0>(v15, "");
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    addr_obj::AddressObjectFactory::fromContact(v7, (addr_obj::Localization *)v37, (uint64_t)v29, (uint64_t)v27, (uint64_t)v25, (uint64_t)v23, (uint64_t)v21, (uint64_t)v19, &v43, (uint64_t)v17, (uint64_t)v15, (uint64_t)__p);
    std::shared_ptr<zilch::TrafficDynamicTile::Incident>::operator=[abi:ne180100]((uint64_t)&v2->_pimpl->_addrObjPtr, &v43);
    v8 = (std::__shared_weak_count *)*((_QWORD *)&v43 + 1);
    if (*((_QWORD *)&v43 + 1))
    {
      v9 = (unint64_t *)(*((_QWORD *)&v43 + 1) + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    if (v14 < 0)
      operator delete(__p[0]);
    if (v16 < 0)
      operator delete(v15[0]);
    if (v18 < 0)
      operator delete(v17[0]);
    if (v20 < 0)
      operator delete(v19[0]);
    if (v22 < 0)
      operator delete(v21[0]);
    if (v24 < 0)
      operator delete(v23[0]);
    if (v26 < 0)
      operator delete(v25[0]);
    if (v28 < 0)
      operator delete(v27[0]);
    if (v30 < 0)
      operator delete(v29[0]);
    if (v42 < 0)
      operator delete(v41);
    if (v40 < 0)
      operator delete(v39);
    if (v38 < 0)
      operator delete(v37[0]);
    if (v32 < 0)
      operator delete(v31[0]);
    if (v34 < 0)
      operator delete(v33[0]);
    if (v36 < 0)
      operator delete(v35[0]);
    v11 = v2;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (GEOAddressObject)initWithProtobufEncodedAsBase64String:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  GEOAddressObject *v7;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v4, 0);
  v6 = (void *)objc_opt_new();
  -[GEOPDAddressObject setAddressObject:]((uint64_t)v6, v5);
  +[GEOAddressObject addressObjectWithPlaceDataAddressObject:placeDataAddress:placeDataInfo:placeDataEntity:](GEOAddressObject, "addressObjectWithPlaceDataAddressObject:placeDataAddress:placeDataInfo:placeDataEntity:", v6, 0, 0, 0);
  v7 = (GEOAddressObject *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)name
{
  AddressObject *ptr;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BYTE __p[12];
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  v3 = MEMORY[0x1E0CB3940];
  if (ptr)
  {
    (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)ptr + 16))(__p);
    +[NSString stringWithStdString:copy:](v3, (uint64_t *)__p);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 < 0)
      operator delete(*(void **)__p);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject name]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(_QWORD *)&__p[4] = v5;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    v4 = 0;
  }
  return v4;
}

- (id)addressDictionary
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[GEOAddressObject address](self, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasStructuredAddress");

  if (v4)
  {
    -[GEOAddressObject address](self, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "structuredAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _buildGEODictionaryFromStructuredAddress(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    -[GEOAddressObject cityDisplayNameWithFallback:](self, "cityDisplayNameWithFallback:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      -[GEOAddressObject cityDisplayNameWithFallback:](self, "cityDisplayNameWithFallback:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("City"));

    }
    else
    {
      objc_msgSend(v8, "removeObjectForKey:", CFSTR("City"));
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)cnPostalAddress
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (ContactsLibraryCore())
  {
    -[GEOAddressObject address](self, "address");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "structuredAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _buildCNPostalAddressFromStructuredAddress(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    -[GEOAddressObject cityDisplayNameWithFallback:](self, "cityDisplayNameWithFallback:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[GEOAddressObject cityDisplayNameWithFallback:](self, "cityDisplayNameWithFallback:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCity:", v8);

    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)spokenName
{
  AddressObject *ptr;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BYTE __p[12];
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  v3 = MEMORY[0x1E0CB3940];
  if (ptr)
  {
    (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)ptr + 32))(__p);
    +[NSString stringWithStdString:copy:](v3, (uint64_t *)__p);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 < 0)
      operator delete(*(void **)__p);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject spokenName]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(_QWORD *)&__p[4] = v5;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    v4 = 0;
  }
  return v4;
}

- (id)spokenAddress
{
  AddressObject *ptr;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BYTE __p[12];
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  v3 = MEMORY[0x1E0CB3940];
  if (ptr)
  {
    (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)ptr + 40))(__p);
    +[NSString stringWithStdString:copy:](v3, (uint64_t *)__p);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 < 0)
      operator delete(*(void **)__p);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject spokenAddress]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(_QWORD *)&__p[4] = v5;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    v4 = 0;
  }
  return v4;
}

- (id)spokenAddressForLocale:(id)a3
{
  id v4;
  AddressObject *ptr;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BYTE __p[12];
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  v6 = MEMORY[0x1E0CB3940];
  if (ptr)
  {
    (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)ptr + 40))(__p);
    +[NSString stringWithStdString:copy:](v6, (uint64_t *)__p);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 < 0)
      operator delete(*(void **)__p);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject spokenAddressForLocale:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(_QWORD *)&__p[4] = v8;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (id)spokenStructuredAddress
{
  AddressObject *ptr;
  uint64_t DisplayLanguage;
  uint64_t v5;
  const void **v6;
  NSObject *v7;
  GEOStructuredAddress *v8;
  void *v9;
  NSObject *v10;
  void *v12;
  uint8_t v13[4];
  void *v14;
  _BYTE buf[12];
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  if (ptr)
  {
    (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)ptr + 48))(buf);
    DisplayLanguage = addr_obj::Localization::getDisplayLanguage((addr_obj::Localization *)buf);
    v5 = *(unsigned __int8 *)(DisplayLanguage + 23);
    if ((v5 & 0x80u) != 0)
      v5 = *(_QWORD *)(DisplayLanguage + 8);
    if (v5)
    {
      v6 = (const void **)addr_obj::Localization::getDisplayLanguage((addr_obj::Localization *)buf);
      v7 = -[NSData initWithCPPData:copy:](objc_alloc(MEMORY[0x1E0C99D50]), v6);
      v8 = -[GEOStructuredAddress initWithData:]([GEOStructuredAddress alloc], "initWithData:", v7);
    }
    else
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v13 = 138477827;
        v14 = v12;
        _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "%{private}@ could not get a GEOStructuredAddress", v13, 0xCu);

      }
      v8 = 0;
    }

    if (v16 < 0)
      operator delete(*(void **)buf);
    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject spokenStructuredAddress]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v9;
      _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_ERROR, "%{public}@@", buf, 0xCu);
    }

    return 0;
  }
}

- (id)phoneticName
{
  AddressObject *ptr;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BYTE __p[12];
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  v3 = MEMORY[0x1E0CB3940];
  if (ptr)
  {
    (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)ptr + 56))(__p);
    +[NSString stringWithStdString:copy:](v3, (uint64_t *)__p);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 < 0)
      operator delete(*(void **)__p);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject phoneticName]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(_QWORD *)&__p[4] = v5;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    v4 = 0;
  }
  return v4;
}

- (id)phoneticAddress
{
  AddressObject *ptr;
  uint64_t DisplayLanguage;
  uint64_t v5;
  const void **v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v11;
  void *v12;
  uint8_t v13[4];
  void *v14;
  _BYTE buf[12];
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  if (ptr)
  {
    (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)ptr + 64))(buf);
    DisplayLanguage = addr_obj::Localization::getDisplayLanguage((addr_obj::Localization *)buf);
    v5 = *(unsigned __int8 *)(DisplayLanguage + 23);
    if ((v5 & 0x80u) != 0)
      v5 = *(_QWORD *)(DisplayLanguage + 8);
    if (v5)
    {
      v6 = (const void **)addr_obj::Localization::getDisplayLanguage((addr_obj::Localization *)buf);
      _protobufCPPDataToObjC<GEOAddress>(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v13 = 138477827;
        v14 = v12;
        _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEBUG, "%{private}@ could not get a GEOAddress", v13, 0xCu);

      }
      v7 = 0;
    }
    if (v16 < 0)
      operator delete(*(void **)buf);
    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject phoneticAddress]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v8;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "%{public}@@", buf, 0xCu);
    }

    return 0;
  }
}

- (id)fullAddressWithMultiline:(BOOL)a3
{
  AddressObject *ptr;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BYTE __p[12];
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  if (ptr)
  {
    v4 = MEMORY[0x1E0CB3940];
    (*(void (**)(_BYTE *__return_ptr, AddressObject *, BOOL))(*(_QWORD *)ptr + 72))(__p, ptr, !a3);
    +[NSString stringWithStdString:copy:](v4, (uint64_t *)__p);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 < 0)
      operator delete(*(void **)__p);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject fullAddressWithMultiline:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(_QWORD *)&__p[4] = v6;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    v5 = 0;
  }
  return v5;
}

- (id)fullAddressWithMultiline:(BOOL)a3 relative:(id)a4
{
  _BOOL4 v4;
  _QWORD *v6;
  AddressObject *ptr;
  _BOOL8 v8;
  uint64_t v9;
  void *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v17;
  std::__shared_weak_count *v18;
  _BYTE __p[12];
  char v20;
  uint64_t v21;

  v4 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  if (ptr)
  {
    v8 = !v4;
    v17 = 0;
    v18 = 0;
    if (v6)
    {
      std::shared_ptr<addr_obj::AddressObject>::operator=[abi:ne180100](&v17, *(_QWORD *)(v6[1] + 8), *(_QWORD *)(v6[1] + 16));
      ptr = self->_pimpl->_addrObjPtr.__ptr_;
    }
    v9 = MEMORY[0x1E0CB3940];
    (*(void (**)(_BYTE *__return_ptr, AddressObject *, uint64_t *, _BOOL8))(*(_QWORD *)ptr + 80))(__p, ptr, &v17, v8);
    +[NSString stringWithStdString:copy:](v9, (uint64_t *)__p);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20 < 0)
      operator delete(*(void **)__p);
    v11 = v18;
    if (v18)
    {
      p_shared_owners = (unint64_t *)&v18->__shared_owners_;
      do
        v13 = __ldaxr(p_shared_owners);
      while (__stlxr(v13 - 1, p_shared_owners));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject fullAddressWithMultiline:relative:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(_QWORD *)&__p[4] = v14;
      _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    v10 = 0;
  }

  return v10;
}

- (id)fullAddressNoCurrentCountryWithMultiline:(BOOL)a3
{
  _BOOL8 v3;
  GEOAddressObject *v5;
  void *v6;

  v3 = a3;
  v5 = -[GEOAddressObject initWithCurrentCountry]([GEOAddressObject alloc], "initWithCurrentCountry");
  -[GEOAddressObject fullAddressWithMultiline:relative:](self, "fullAddressWithMultiline:relative:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)shortAddress
{
  AddressObject *ptr;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BYTE __p[12];
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  v3 = MEMORY[0x1E0CB3940];
  if (ptr)
  {
    (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)ptr + 88))(__p);
    +[NSString stringWithStdString:copy:](v3, (uint64_t *)__p);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 < 0)
      operator delete(*(void **)__p);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject shortAddress]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(_QWORD *)&__p[4] = v5;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    v4 = 0;
  }
  return v4;
}

- (id)cityDisplayNameWithFallback:(BOOL)a3
{
  AddressObject *ptr;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BYTE __p[12];
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  v4 = MEMORY[0x1E0CB3940];
  if (ptr)
  {
    (*(void (**)(_BYTE *__return_ptr, AddressObject *, BOOL))(*(_QWORD *)ptr + 136))(__p, ptr, a3);
    +[NSString stringWithStdString:copy:](v4, (uint64_t *)__p);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 < 0)
      operator delete(*(void **)__p);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject cityDisplayNameWithFallback:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(_QWORD *)&__p[4] = v6;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    v5 = 0;
  }
  return v5;
}

- (id)countryName
{
  void *v2;
  void *v3;
  void *v4;

  -[GEOAddressObject address](self, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "structuredAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "country");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)weatherDisplayName
{
  AddressObject *ptr;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BYTE __p[12];
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  v3 = MEMORY[0x1E0CB3940];
  if (ptr)
  {
    (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)ptr + 224))(__p);
    +[NSString stringWithStdString:copy:](v3, (uint64_t *)__p);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 < 0)
      operator delete(*(void **)__p);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject weatherDisplayName]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(_QWORD *)&__p[4] = v5;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    v4 = 0;
  }
  return v4;
}

- (id)weatherLocationName
{
  AddressObject *ptr;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BYTE __p[12];
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  v3 = MEMORY[0x1E0CB3940];
  if (ptr)
  {
    (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)ptr + 232))(__p);
    +[NSString stringWithStdString:copy:](v3, (uint64_t *)__p);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 < 0)
      operator delete(*(void **)__p);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject weatherLocationName]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(_QWORD *)&__p[4] = v5;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    v4 = 0;
  }
  return v4;
}

- (id)parkingDisplayName
{
  AddressObject *ptr;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BYTE __p[12];
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  v3 = MEMORY[0x1E0CB3940];
  if (ptr)
  {
    (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)ptr + 216))(__p);
    +[NSString stringWithStdString:copy:](v3, (uint64_t *)__p);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 < 0)
      operator delete(*(void **)__p);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject parkingDisplayName]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(_QWORD *)&__p[4] = v5;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    v4 = 0;
  }
  return v4;
}

- (id)venueLabel:(int64_t)a3
{
  AddressObject *ptr;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  std::string __p;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  if (ptr)
  {
    if ((unint64_t)(a3 - 1) < 3)
      v4 = a3;
    else
      v4 = 0;
    v5 = MEMORY[0x1E0CB3940];
    v6 = (*(uint64_t (**)(AddressObject *, SEL))(*(_QWORD *)ptr + 160))(ptr, a2);
    addr_obj::VenueInfo::getLabel(v6, v4, &__p);
    +[NSString stringWithStdString:copy:](v5, (uint64_t *)&__p);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject venueLabel:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__p.__r_.__value_.__l.__data_) = 138543362;
      *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)v8;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "%{public}@@", (uint8_t *)&__p, 0xCu);
    }

    v7 = 0;
  }
  return v7;
}

- (id)venueLabel
{
  return -[GEOAddressObject venueLabel:](self, "venueLabel:", 3);
}

- (id)venueLevel
{
  AddressObject *ptr;
  uint64_t v3;
  addr_obj::VenueInfo *v4;
  uint64_t *Level;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  v3 = MEMORY[0x1E0CB3940];
  if (ptr)
  {
    v4 = (addr_obj::VenueInfo *)(*(uint64_t (**)(AddressObject *, SEL))(*(_QWORD *)ptr + 160))(ptr, a2);
    Level = (uint64_t *)addr_obj::VenueInfo::getLevel(v4);
    +[NSString stringWithStdString:copy:](v3, Level);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject venueLevel]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "%{public}@@", buf, 0xCu);
    }

    v6 = 0;
  }
  return v6;
}

- (id)venueShortAddress
{
  AddressObject *ptr;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BYTE __p[12];
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  v3 = MEMORY[0x1E0CB3940];
  if (ptr)
  {
    (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)ptr + 240))(__p);
    +[NSString stringWithStdString:copy:](v3, (uint64_t *)__p);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 < 0)
      operator delete(*(void **)__p);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject venueShortAddress]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(_QWORD *)&__p[4] = v5;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    v4 = 0;
  }
  return v4;
}

- (id)locationAddress
{
  AddressObject *ptr;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BYTE __p[12];
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  v3 = MEMORY[0x1E0CB3940];
  if (ptr)
  {
    (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)ptr + 256))(__p);
    +[NSString stringWithStdString:copy:](v3, (uint64_t *)__p);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 < 0)
      operator delete(*(void **)__p);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject locationAddress]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(_QWORD *)&__p[4] = v5;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    v4 = 0;
  }
  return v4;
}

- (id)titlesForMapRect:(id)a3
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  const __CFArray *v17;
  const __CFArray *v18;
  const __CFString *ValueAtIndex;
  const __CFString *v20;
  uint64_t v21;

  v4 = GEOMetersBetweenMapPoints(a3.var0.var0, a3.var0.var1 + a3.var1.var1 * 0.5, a3.var0.var0 + a3.var1.var0, a3.var0.var1 + a3.var1.var1 * 0.5);
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", 10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAddressObject address](self, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "structuredAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "hasOcean") & 1) == 0)
  {
    if (v4 < 7500.0 && objc_msgSend(v7, "hasSubLocality"))
    {
      objc_msgSend(v7, "subLocality");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v8);

    }
    if (v4 < 30000.0)
    {
      -[GEOAddressObject cityDisplayNameWithFallback:](self, "cityDisplayNameWithFallback:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (v10)
      {
        -[GEOAddressObject cityDisplayNameWithFallback:](self, "cityDisplayNameWithFallback:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

      }
    }
    if (v4 < 45000.0 && objc_msgSend(v7, "hasSubAdministrativeArea"))
    {
      objc_msgSend(v7, "subAdministrativeArea");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v12);

    }
    if (v4 < 130000.0 && objc_msgSend(v7, "hasAdministrativeArea"))
    {
      objc_msgSend(v7, "administrativeArea");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v13);

    }
    if (v4 < 2500000.0 && objc_msgSend(v7, "hasCountry"))
    {
      objc_msgSend(v7, "country");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v14);

    }
  }
  v15 = v5;
  v16 = v15;
  if ((unint64_t)objc_msgSend(v15, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithOrderedSet:range:copyItems:", v15, 0, 2, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = CFLocaleCopyPreferredLanguages();
    v18 = v17;
    if (v17)
    {
      if (CFArrayGetCount(v17) >= 1)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v18, 0);
        v20 = ValueAtIndex;
        if (ValueAtIndex)
        {
          if (CFStringHasPrefix(ValueAtIndex, CFSTR("ja"))
            || CFStringHasPrefix(v20, CFSTR("zh"))
            || CFStringHasPrefix(v20, CFSTR("ko")))
          {
            objc_msgSend(v16, "reversedOrderedSet");
            v21 = objc_claimAutoreleasedReturnValue();

            v16 = (void *)v21;
          }
        }
      }
      CFRelease(v18);
    }
  }

  return v16;
}

- (id)neighborhoodName:(BOOL)a3
{
  AddressObject *ptr;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BYTE __p[12];
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  v4 = MEMORY[0x1E0CB3940];
  if (ptr)
  {
    (*(void (**)(_BYTE *__return_ptr, AddressObject *, BOOL))(*(_QWORD *)ptr + 264))(__p, ptr, a3);
    +[NSString stringWithStdString:copy:](v4, (uint64_t *)__p);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 < 0)
      operator delete(*(void **)__p);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject neighborhoodName:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(_QWORD *)&__p[4] = v6;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    v5 = 0;
  }
  return v5;
}

- (id)cityAndAboveWithFallback:(BOOL)a3
{
  AddressObject *ptr;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BYTE __p[12];
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  v4 = MEMORY[0x1E0CB3940];
  if (ptr)
  {
    (*(void (**)(_BYTE *__return_ptr, AddressObject *, BOOL))(*(_QWORD *)ptr + 112))(__p, ptr, a3);
    +[NSString stringWithStdString:copy:](v4, (uint64_t *)__p);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 < 0)
      operator delete(*(void **)__p);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject cityAndAboveWithFallback:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(_QWORD *)&__p[4] = v6;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    v5 = 0;
  }
  return v5;
}

- (id)cityAndAboveWithFallback:(BOOL)a3 relative:(id)a4
{
  _BOOL8 v4;
  _QWORD *v6;
  AddressObject *ptr;
  uint64_t v8;
  void *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v16;
  std::__shared_weak_count *v17;
  _BYTE __p[12];
  char v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  if (ptr)
  {
    v16 = 0;
    v17 = 0;
    if (v6)
    {
      std::shared_ptr<addr_obj::AddressObject>::operator=[abi:ne180100](&v16, *(_QWORD *)(v6[1] + 8), *(_QWORD *)(v6[1] + 16));
      ptr = self->_pimpl->_addrObjPtr.__ptr_;
    }
    v8 = MEMORY[0x1E0CB3940];
    (*(void (**)(_BYTE *__return_ptr, AddressObject *, uint64_t *, _BOOL8))(*(_QWORD *)ptr + 120))(__p, ptr, &v16, v4);
    +[NSString stringWithStdString:copy:](v8, (uint64_t *)__p);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 < 0)
      operator delete(*(void **)__p);
    v10 = v17;
    if (v17)
    {
      p_shared_owners = (unint64_t *)&v17->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject cityAndAboveWithFallback:relative:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(_QWORD *)&__p[4] = v13;
      _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (id)cityAndAboveNoCurrentCountryWithFallback:(BOOL)a3
{
  _BOOL8 v3;
  GEOAddressObject *v5;
  void *v6;

  v3 = a3;
  v5 = -[GEOAddressObject initWithCurrentCountry]([GEOAddressObject alloc], "initWithCurrentCountry");
  -[GEOAddressObject cityAndAboveWithFallback:relative:](self, "cityAndAboveWithFallback:relative:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)aboveDoorShortAddress
{
  AddressObject *ptr;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BYTE __p[12];
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  v3 = MEMORY[0x1E0CB3940];
  if (ptr)
  {
    (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)ptr + 104))(__p);
    +[NSString stringWithStdString:copy:](v3, (uint64_t *)__p);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 < 0)
      operator delete(*(void **)__p);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject aboveDoorShortAddress]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(_QWORD *)&__p[4] = v5;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    v4 = 0;
  }
  return v4;
}

- (id)phoneticLocaleIdentifier
{
  AddressObject *ptr;
  uint64_t v3;
  addr_obj::Localization *v4;
  uint64_t *PhoneticLocale;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  v3 = MEMORY[0x1E0CB3940];
  if (ptr)
  {
    v4 = (addr_obj::Localization *)(*(uint64_t (**)(AddressObject *, SEL))(*(_QWORD *)ptr + 152))(ptr, a2);
    PhoneticLocale = (uint64_t *)addr_obj::Localization::getPhoneticLocale(v4);
    +[NSString stringWithStdString:copy:](v3, PhoneticLocale);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject phoneticLocaleIdentifier]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "%{public}@@", buf, 0xCu);
    }

    v6 = 0;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  GEOAddressObject *v4;
  GEOAddressObject *v5;
  AddressObject *ptr;
  AddressObject *v7;
  char v8;
  BOOL v9;

  v4 = (GEOAddressObject *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  if (v4 == self)
  {
    v8 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    ptr = self->_pimpl->_addrObjPtr.__ptr_;
    v7 = v5->_pimpl->_addrObjPtr.__ptr_;
    v8 = ((unint64_t)ptr | (unint64_t)v7) == 0;
    if (ptr)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (!v9)
      v8 = (*(uint64_t (**)(AddressObject *))(*(_QWORD *)ptr + 272))(ptr);
  }
  else
  {
LABEL_9:
    v8 = 0;
  }
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  AddressObject *ptr;
  void *v4;
  NSObject *v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  if (ptr)
    return (*(uint64_t (**)(AddressObject *, SEL))(*(_QWORD *)ptr + 288))(ptr, a2);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The AO has not been created prior to calling %s"), "-[GEOAddressObject hash]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "%{public}@@", buf, 0xCu);
  }

  return 0;
}

+ (void)markMMStrings:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  GEOConfigSetBOOL(GeoServicesConfig_AddressObjectMarkStrings, (uint64_t)off_1EDF4D488);
  addr_obj::Debugging::addChar(v3);
}

@end
