@implementation NTKGalleryCollection

- (NSString)title
{
  return self->_title;
}

NTKCFacesBundleArrayGalleryCollection *__52__NTKGalleryCollection_galleryCollectionsForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  const char *v9;
  NTKCFacesBundleArrayGalleryCollection *v10;
  objc_class *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "galleryTitleForDevice:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v8;
      v9 = "Skipping bundle: %@";
      goto LABEL_9;
    }
LABEL_10:

    v10 = 0;
    goto LABEL_11;
  }
  v5 = (void *)objc_msgSend(v3, "faceClass");
  if (!*(_BYTE *)(a1 + 40) && objc_msgSend(v5, "_isInternalOnlyForDevice:", *(_QWORD *)(a1 + 32)))
  {
    _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v8;
      v9 = "Skipping internal bundle: %@";
LABEL_9:
      _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, 0xCu);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v10 = -[NTKCFacesBundleArrayGalleryCollection initWithDevice:faceBundle:]([NTKCFacesBundleArrayGalleryCollection alloc], "initWithDevice:faceBundle:", *(_QWORD *)(a1 + 32), v3);
LABEL_11:

  return v10;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setDescriptionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

+ (id)galleryCollectionsForDevice:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  char v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t i;
  void *v68;
  id v69;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[4];
  id v80;
  id v81;
  id v82;
  _QWORD aBlock[4];
  id v84;
  char v85;
  uint8_t v86[128];
  uint8_t buf[4];
  void *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "nrDeviceUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v88 = v7;
    _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "Adding galleryCollectionsForDevice with uuid:%@", buf, 0xCu);

  }
  v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.NanoTimeKit.face"));
  v8 = objc_msgSend(v74, "BOOLForKey:", CFSTR("ShowInternalFaces"));
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__NTKGalleryCollection_galleryCollectionsForDevice___block_invoke;
  aBlock[3] = &unk_1E6BD59B8;
  v10 = v4;
  v84 = v10;
  v85 = v8;
  v11 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "faceBundleForBundleIdentifier:onDevice:", CFSTR("com.apple.NTKAegirFaceBundle"), v10);
  v14 = objc_claimAutoreleasedReturnValue();

  v72 = (void *)v14;
  if (!v14)
  {
    objc_msgSend(a1, "_astronomyFacesForDevice:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v15);

  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("DAB81146-4105-445B-94AD-14033A199AC4"));
  v17 = objc_msgSend(v10, "supportsCapability:", v16);

  if ((v17 & 1) == 0)
  {
    objc_msgSend(a1, "_upNextFacesForDevice:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v18);

  }
  objc_msgSend(a1, "_kaleidoscopeFacesForDevice:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v19);

  objc_msgSend(v5, "addObjectsFromArray:", v12);
  if (objc_msgSend(v10, "isRunningGraceOrLater") && objc_msgSend(v10, "deviceCategory") != 1)
  {
    _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v20, OS_LOG_TYPE_DEFAULT, "Adding Subdials/California/FullScreen faces collection", buf, 2u);
    }

    objc_msgSend(a1, "_whistlerSubdialsFacesForDevice:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v21);

    objc_msgSend(a1, "_blackcombFacesForDevice:", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v22);

  }
  +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v9;
  v79[1] = 3221225472;
  v79[2] = __52__NTKGalleryCollection_galleryCollectionsForDevice___block_invoke_11;
  v79[3] = &unk_1E6BD59E0;
  v24 = v10;
  v80 = v24;
  v25 = v11;
  v82 = v25;
  v26 = v5;
  v81 = v26;
  objc_msgSend(v23, "enumerateFaceBundlesOnDevice:includingLegacy:withBlock:", v24, 1, v79);

  objc_msgSend(v24, "nrDeviceUUID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("F27862F8-5179-4DB0-9F89-179EA7CB4011"));
    v29 = objc_msgSend(v24, "supportsCapability:", v28);

    v30 = _os_feature_enabled_impl();
    if (!v29 || (v30 & 1) == 0)
    {
      _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B72A3000, v31, OS_LOG_TYPE_DEFAULT, "Adding Photos faces collection", buf, 2u);
      }

      objc_msgSend(a1, "_photoFacesForDevice:", v24);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v32);

    }
  }
  objc_msgSend(v26, "sortUsingComparator:", &__block_literal_global_111);
  v73 = v12;
  if (objc_msgSend(v24, "collectionType") == 5 || NTKShowHardwareSpecificFaces())
  {
    _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v33, OS_LOG_TYPE_DEFAULT, "Adding Zeus faces collection", buf, 2u);
    }

    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "faceBundleForFaceStyle:onDevice:", 14, v24);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      (*((void (**)(id, void *))v25 + 2))(v25, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
        objc_msgSend(v26, "insertObject:atIndex:", v36, 0);

    }
    if (((objc_msgSend(v24, "isZeusBlack") & 1) != 0 || NTKShowHardwareSpecificFaces())
      && objc_msgSend(v24, "isRunningGraceOrLater"))
    {
      _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B72A3000, v37, OS_LOG_TYPE_DEFAULT, "Adding SpectrumZeus faces collection", buf, 2u);
      }

      +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "faceBundleForFaceStyle:onDevice:", 42, v24);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        (*((void (**)(id, void *))v25 + 2))(v25, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40)
          objc_msgSend(v26, "insertObject:atIndex:", v40, 0);

      }
    }
    _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v41, OS_LOG_TYPE_DEFAULT, "Adding Poodle faces collection", buf, 2u);
    }

    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "faceBundleForBundleIdentifier:onDevice:", CFSTR("com.apple.NTKPoodleFaceBundle"), v24);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      (*((void (**)(id, void *))v25 + 2))(v25, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
        objc_msgSend(v26, "insertObject:atIndex:", v44, 0);

    }
    v71 = a1;
    _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v45, OS_LOG_TYPE_DEFAULT, "Adding Hades faces collection", buf, 2u);
    }

    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "faceBundleForBundleIdentifier:onDevice:", CFSTR("com.apple.NTKHadesFaceBundle"), v24);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      (*((void (**)(id, void *))v25 + 2))(v25, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (v48)
        objc_msgSend(v26, "insertObject:atIndex:", v48, 0);

    }
    _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v49, OS_LOG_TYPE_DEFAULT, "Adding Secretariat faces collection", buf, 2u);
    }

    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "faceBundleForBundleIdentifier:onDevice:", CFSTR("com.apple.NTKSecretariatFaceBundle"), v24);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      (*((void (**)(id, void *))v25 + 2))(v25, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (v52)
        objc_msgSend(v26, "insertObject:atIndex:", v52, 0);

    }
    _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v53, OS_LOG_TYPE_DEFAULT, "Adding Bellona faces collection", buf, 2u);
    }

    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "faceBundleForBundleIdentifier:onDevice:", CFSTR("com.apple.NTKBellonaFaceBundle"), v24);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55)
    {
      (*((void (**)(id, void *))v25 + 2))(v25, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if (v56)
        objc_msgSend(v26, "insertObject:atIndex:", v56, 0);

    }
    _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v57, OS_LOG_TYPE_DEFAULT, "Adding Squall faces collection", buf, 2u);
    }

    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "faceBundleForBundleIdentifier:onDevice:", CFSTR("com.apple.NTKSquallFaceBundle"), v24);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (v59)
    {
      (*((void (**)(id, void *))v25 + 2))(v25, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (v60)
        objc_msgSend(v26, "insertObject:atIndex:", v60, 0);

    }
    a1 = v71;
  }
  if (NTKGizmoOrCompanionAreRussian(v24))
    v61 = (void *)objc_msgSend(a1, "_newFacesExcludingRestrictedForDevice:", v24);
  else
    v61 = (void *)objc_msgSend(a1, "_newFacesForDevice:", v24);
  v62 = v61;
  if (objc_msgSend(v61, "hasNewFaces", v71))
    objc_msgSend(v26, "insertObject:atIndex:", v62, 0);
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v63 = v26;
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
  if (v64)
  {
    v65 = v64;
    v66 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v65; ++i)
      {
        if (*(_QWORD *)v76 != v66)
          objc_enumerationMutation(v63);
        v68 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v68, "loadFaces");
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v68, "loadFacesWithCompletion:", 0);
        }
      }
      v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
    }
    while (v65);
  }

  v69 = v63;
  return v69;
}

- (void)setCalloutName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

+ (id)_whistlerSubdialsFacesForDevice:(id)a3
{
  id v3;
  NTKCWhistlerSubdialsFacesGalleryCollection *v4;

  v3 = a3;
  if (objc_msgSend(v3, "deviceCategory") == 1)
    v4 = 0;
  else
    v4 = -[NTKDeviceSpecificFacesArrayGalleryCollection initWithDevice:]([NTKCWhistlerSubdialsFacesGalleryCollection alloc], "initWithDevice:", v3);

  return v4;
}

+ (id)_upNextFacesForDevice:(id)a3
{
  id v3;
  NTKCUpNextFacesGalleryCollection *v4;

  v3 = a3;
  v4 = -[NTKDeviceSpecificFacesArrayGalleryCollection initWithDevice:]([NTKCUpNextFacesGalleryCollection alloc], "initWithDevice:", v3);

  return v4;
}

+ (id)_newFacesForDevice:(id)a3
{
  id v3;
  NTKWhatsNewFacesGalleryCollection *v4;

  v3 = a3;
  v4 = -[NTKWhatsNewFacesGalleryCollection initWithDevice:]([NTKWhatsNewFacesGalleryCollection alloc], "initWithDevice:", v3);

  return v4;
}

+ (id)_kaleidoscopeFacesForDevice:(id)a3
{
  id v3;
  NTKCKaleidoscopeFacesGalleryCollection *v4;

  v3 = a3;
  v4 = -[NTKDeviceSpecificFacesArrayGalleryCollection initWithDevice:]([NTKCKaleidoscopeFacesGalleryCollection alloc], "initWithDevice:", v3);

  return v4;
}

+ (id)_blackcombFacesForDevice:(id)a3
{
  id v3;
  NTKCBlackcombFacesGalleryCollection *v4;

  v3 = a3;
  if (objc_msgSend(v3, "deviceCategory") == 1)
    v4 = 0;
  else
    v4 = -[NTKDeviceSpecificFacesArrayGalleryCollection initWithDevice:]([NTKCBlackcombFacesGalleryCollection alloc], "initWithDevice:", v3);

  return v4;
}

void __52__NTKGalleryCollection_galleryCollectionsForDevice___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "isHardwareSpecific") & 1) == 0)
  {
    objc_msgSend(v3, "galleryTitleForDevice:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "Adding bundled faces collection \"%@\", (uint8_t *)&v7, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

  }
}

uint64_t __52__NTKGalleryCollection_galleryCollectionsForDevice___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

+ (id)_newFacesExcludingRestrictedForDevice:(id)a3
{
  id v3;
  NTKWhatsNewFacesGalleryCollectionExcludingRestricted *v4;

  v3 = a3;
  v4 = -[NTKWhatsNewFacesGalleryCollection initWithDevice:]([NTKWhatsNewFacesGalleryCollectionExcludingRestricted alloc], "initWithDevice:", v3);

  return v4;
}

+ (id)_astronomyFacesForDevice:(id)a3
{
  id v3;
  NTKCAstronomyFacesGalleryCollection *v4;

  v3 = a3;
  v4 = -[NTKDeviceSpecificFacesArrayGalleryCollection initWithDevice:]([NTKCAstronomyFacesGalleryCollection alloc], "initWithDevice:", v3);

  return v4;
}

+ (id)_photoFacesForDevice:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[NTKCPhotoFaceCollectionGalleryCollection initForDevice:]([NTKCPhotoFaceCollectionGalleryCollection alloc], "initForDevice:", v3);

  return v4;
}

- (void)enumerateFaceNamesUsingBlock:(id)a3
{
  unint64_t v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a3;
  if (-[NTKGalleryCollection numberOfFaces](self, "numberOfFaces"))
  {
    v4 = 0;
    do
    {
      -[NTKGalleryCollection calloutName](self, "calloutName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[NTKGalleryCollection calloutName](self, "calloutName");
        v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[NTKGalleryCollection faceAtIndex:](self, "faceAtIndex:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v6)[2](v6, v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, v8);

      }
      ++v4;
    }
    while (v4 < -[NTKGalleryCollection numberOfFaces](self, "numberOfFaces"));
  }

}

- (NTKGalleryCollectionDelegate)delegate
{
  return (NTKGalleryCollectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)calloutName
{
  return self->_calloutName;
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong(&self->_calloutName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_title, 0);
}

- (unint64_t)numberOfFaces
{
  unint64_t result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (id)faceAtIndex:(unint64_t)a3
{
  id result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (unint64_t)indexOfFace:(id)a3
{
  unint64_t result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  return result;
}

@end
