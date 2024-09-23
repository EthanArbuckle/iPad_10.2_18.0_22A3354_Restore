@implementation LSBundleRecordUpdater

- (LSBundleRecordUpdater)initWithDatabase:(id)a3 bundleUnit:(unsigned int)a4 bundleData:(const LSBundleData *)a5
{
  id v8;
  LSBundleRecordUpdater *v9;
  LSBundleRecordUpdater *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LSBundleRecordUpdater;
  v9 = -[LSBundleRecordUpdater init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[LSRecordBuilder setDatabase:](v9, "setDatabase:", v8);
    v10->_bundleID = a4;
    memcpy(&v10->_bundleData, a5, 0x230uLL);
    v10->_hasContext = 0;
  }

  return v10;
}

- (LSBundleRecordUpdater)initWithBundleIdentifier:(id)a3 preferPlaceholder:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int inited;
  id v8;
  int v9;
  void *v10;
  int v11;
  uint64_t v12;
  id v13;
  LSBundleRecordUpdater *v14;
  LSBundleRecordUpdater *v15;
  NSObject *v16;
  uint64_t v17;
  id obj;
  uint64_t v20;
  unsigned int v21;
  id v22;
  uint8_t buf[40];
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  obj = 0;
  v20 = 0;
  v6 = a3;
  v22 = 0;
  inited = _LSContextInitReturningError(&obj, &v22);
  v8 = v22;
  if (inited)
  {
    if (v4)
      v9 = 1152;
    else
      v9 = 128;
    memset(buf, 0, 32);
    if (_LSBundleFindWithInfoAndNo_IOFilter((uint64_t)&obj, 0, v6, 0, buf, 2, v9, 0, 0, &v21, &v20, 0))
    {
      v10 = 0;
      v11 = 1;
      goto LABEL_9;
    }
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10814, (uint64_t)"initContextAndLookupBundle", 57, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v12;
    _LSContextDestroy(&obj);
  }
  v8 = objc_retainAutorelease(v8);
  v11 = 0;
  v10 = v8;
LABEL_9:

  v13 = v10;
  if (v11)
  {
    v14 = -[LSBundleRecordUpdater initWithDatabase:bundleUnit:bundleData:](self, "initWithDatabase:bundleUnit:bundleData:", obj, v21, v20);
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_context.db, obj);
      v15->_hasContext = 1;
      _LSDefaultLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(_QWORD *)(v20 + 172);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v17;
        _os_log_impl(&dword_182882000, v16, OS_LOG_TYPE_DEFAULT, "Created bundleRecordUpdater for app %@. flags=%llx", buf, 0x16u);
      }
      goto LABEL_18;
    }
    _LSContextDestroy(&obj);
  }
  else
  {

  }
  _LSDefaultLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[LSBundleRecordUpdater initWithBundleIdentifier:preferPlaceholder:].cold.1((uint64_t)v6, (uint64_t)v13, v16);
  v15 = 0;
LABEL_18:

  return v15;
}

- (LSBundleRecordUpdater)initWithBundleIdentifier:(id)a3
{
  return -[LSBundleRecordUpdater initWithBundleIdentifier:preferPlaceholder:](self, "initWithBundleIdentifier:preferPlaceholder:", a3, 0);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_hasContext)
    _LSContextDestroy((void **)&self->_context.db);
  v3.receiver = self;
  v3.super_class = (Class)LSBundleRecordUpdater;
  -[LSBundleRecordUpdater dealloc](&v3, sel_dealloc);
}

- (void)parseiTunesMetadata:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  __CFString *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  __CFString *v42;
  __CFString *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  __CFString *v50;
  __CFString *v51;
  __CFString *v52;
  int bundleFlags_high;
  void *v54;
  id v55;

  v4 = a3;
  if (v4 && self->_bundleID)
  {
    v55 = v4;
    v5 = *(_QWORD *)(&self->_bundleData._clas + 1);
    bundleFlags_high = HIDWORD(self->_bundleData._bundleFlags);
    _LSPlistGet((uint64_t)self->super._db, self->_bundleData.base.infoDictionary);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _LSPlistDataGetDictionary(v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = (void *)objc_msgSend(v7, "mutableCopy");
    LODWORD(v7) = objc_msgSend(v55, "_LS_BoolForKey:", CFSTR("initialODRSize"));
    v8 = objc_msgSend(v55, "_LS_BoolForKey:", CFSTR("is-purchased-redownload"));
    v9 = objc_msgSend(v55, "_LS_BoolForKey:", CFSTR("DeviceBasedVPP"));
    v10 = v5 | 0x80000000000;
    if (!(_DWORD)v7)
      v10 = v5;
    if (v8)
      v10 |= 0x400000uLL;
    if (v9)
      v10 |= 0x8000000000000uLL;
    v49 = v10;
    v11 = objc_opt_class();
    objc_msgSend(v55, "objectForKey:", CFSTR("artistName"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (const __CFString *)v12;
    if (v11 && v12)
    {
      v14 = (__CFString *)v12;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v14;
      }
      else
      {

        v13 = 0;
      }
    }
    v52 = (__CFString *)v13;
    LODWORD(self->_bundleData.installFailureReason) = _LSDatabaseCreateStringForCFString(self->super._db, v13, 0);
    v15 = objc_opt_class();
    objc_msgSend(v55, "objectForKey:", CFSTR("itemName"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (const __CFString *)v16;
    if (v15 && v16)
    {
      v18 = (__CFString *)v16;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v18;
      }
      else
      {

        v17 = 0;
      }
    }
    v51 = (__CFString *)v17;
    LODWORD(self->_bundleData.familyID) = _LSDatabaseCreateStringForCFString(self->super._db, v17, 0);
    v19 = objc_opt_class();
    objc_msgSend(v55, "objectForKey:", CFSTR("sourceApp"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (const __CFString *)v20;
    if (v19 && v20)
    {
      v22 = (__CFString *)v20;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = v22;
      }
      else
      {

        v21 = 0;
      }
    }
    v50 = (__CFString *)v21;
    HIDWORD(self->_bundleData.storefront) = _LSDatabaseCreateStringForCFString(self->super._db, v21, 0);
    *(unint64_t *)((char *)&self->_bundleData.familyID + 4) = objc_msgSend(v55, "_LS_integerForKey:", CFSTR("s"));
    v23 = objc_msgSend(v55, "_LS_integerForKey:", CFSTR("softwareVersionExternalIdentifier"));
    if (!v23)
      v23 = objc_msgSend(v55, "_LS_integerForKey:", CFSTR("betaExternalVersionIdentifier"));
    *(_QWORD *)(&self->_bundleData.itemName + 1) = v23;
    v24 = objc_opt_class();
    objc_msgSend(v55, "objectForKey:", CFSTR("com.apple.iTunesStore.downloadInfo"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if (v24 && v25)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v27 = v26;
        v26 = 0;
LABEL_39:

        goto LABEL_40;
      }
    }
    else if (!v25)
    {
      goto LABEL_40;
    }
    v28 = objc_opt_class();
    objc_msgSend(v26, "objectForKey:", CFSTR("accountInfo"));
    v29 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v29;
    if (v28 && v29)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_39;
LABEL_36:
      v30 = objc_msgSend(v27, "_LS_integerForKey:", CFSTR("PurchaserID"));
      if (!v30)
        v30 = objc_msgSend(v27, "_LS_integerForKey:", CFSTR("DSPersonID"));
      self->_bundleData.staticDiskUsage = v30;
      goto LABEL_39;
    }
    if (v29)
      goto LABEL_36;
LABEL_40:
    v31 = objc_opt_class();
    objc_msgSend(v55, "objectForKey:", CFSTR("variantID"));
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (__CFString *)v32;
    if (v31 && v32 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v33 = 0;
    }
    LODWORD(self->_bundleData.versionIdentifier) = _LSDatabaseCreateStringForCFString(self->super._db, v33, 0);
    v34 = objc_opt_class();
    objc_msgSend(v55, "objectForKey:", CFSTR("managementDeclarationIdentifier"));
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (__CFString *)v35;
    if (v34 && v35 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v36 = 0;
    }
    HIDWORD(self->_bundleData.versionIdentifier) = _LSDatabaseCreateStringForCFString(self->super._db, v36, 0);
    v37 = objc_opt_class();
    objc_msgSend(v55, "objectForKey:", CFSTR("storeCohort"));
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)v38;
    if (v37 && v38)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v39 = 0;
LABEL_54:
        self->_bundleData.compatibilityState = objc_msgSend(v55, "_LS_integerForKey:", CFSTR("itemId"));
        v40 = objc_opt_class();
        objc_msgSend(v55, "objectForKey:", CFSTR("rating"));
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = (__CFString *)v41;
        if (v40 && v41)
        {
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v43 = v42;
            v42 = 0;
LABEL_64:

            goto LABEL_65;
          }
        }
        else if (!v41)
        {
LABEL_65:
          _LSPlistRemove((uint64_t)self->super._db, self->_bundleData.ratingLabel);
          self->_bundleData.ratingLabel = 0;
          v46 = objc_opt_class();
          objc_msgSend(v55, "objectForKey:", CFSTR("distributorInfo"));
          v47 = objc_claimAutoreleasedReturnValue();
          v48 = (void *)v47;
          if (v46 && v47)
          {
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_71;
          }
          else if (!v47)
          {
LABEL_72:
            _LSPlistRemove((uint64_t)self->super._db, self->_bundleData.base.infoDictionary);
            self->_bundleData.base.infoDictionary = _LSPlistAdd((uint64_t)self->super._db, v54);
            HIDWORD(self->_bundleData._bundleFlags) = bundleFlags_high;
            *(_QWORD *)(&self->_bundleData._clas + 1) = v49;

            v4 = v55;
            goto LABEL_73;
          }
          self->_bundleData.ratingLabel = _LSPlistAdd((uint64_t)self->super._db, v48);
LABEL_71:

          goto LABEL_72;
        }
        *(_QWORD *)&self->_bundleData.sourceAppBundleID = -[__CFString _LS_integerForKey:](v42, "_LS_integerForKey:", CFSTR("rank"));
        v44 = objc_opt_class();
        -[__CFString objectForKey:](v42, "objectForKey:", CFSTR("label"));
        v45 = objc_claimAutoreleasedReturnValue();
        v43 = (__CFString *)v45;
        if (v44 && v45 && (objc_opt_isKindOfClass() & 1) == 0)
        {

          v43 = 0;
        }
        self->_bundleData.managementDeclarationIdentifier = _LSDatabaseCreateStringForCFString(self->super._db, v43, 0);
        goto LABEL_64;
      }
    }
    else if (!v38)
    {
      goto LABEL_54;
    }
    objc_msgSend(v54, "setObject:forKeyedSubscript:", v39, CFSTR("storeCohort"));
    bundleFlags_high |= 0x4000u;
    goto LABEL_54;
  }
LABEL_73:

}

- (void)parseSINFDictionary:(id)a3
{
  id v4;
  LSBundleData *p_bundleData;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  if (v4 && self->_bundleID)
  {
    v11 = v4;
    p_bundleData = &self->_bundleData;
    self->_bundleData.purchaserDSID = objc_msgSend(v4, "_LS_integerForKey:", CFSTR("DownloaderDSID"));
    self->_bundleData.staticDiskUsage = objc_msgSend(v11, "_LS_integerForKey:", CFSTR("ApplicationDSID"));
    self->_bundleData.downloaderDSID = objc_msgSend(v11, "_LS_integerForKey:", CFSTR("FamilyID"));
    v6 = *(_QWORD *)(&self->_bundleData._clas + 1);
    v7 = objc_msgSend(v11, "_LS_BoolForKey:", CFSTR("MissingSINF"));
    v8 = objc_msgSend(v11, "_LS_BoolForKey:", CFSTR("HasMIDBasedSINF"));
    v9 = 0x2000000;
    if (!v7)
      v9 = 0;
    v10 = 0x1000000;
    if (!v8)
      v10 = 0;
    *(_QWORD *)(&p_bundleData->_clas + 1) = v9 | v10 | v6 & 0xFFFFFFFFFCFFFFFFLL;
    v4 = v11;
  }

}

- (void)parsePlaceholderMetadata:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4 && self->_bundleID)
  {
    v8 = v4;
    v6 = objc_msgSend(v4, "_LS_integerForKey:", CFSTR("LSInstallType"));
    if (v6)
      self->_bundleData.bundleVersion = v6;
    v7 = objc_msgSend(v8, "_LS_integerForKey:", CFSTR("PlaceholderFailureReason"));
    v5 = v8;
    if (v7)
      *(_QWORD *)&self->_bundleData.shortVersionString = v7;
  }

}

- (BOOL)parsePersonas:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  BOOL v11;
  void *v12;
  unsigned int v13;
  unsigned int v14;
  std::vector<unsigned int>::pointer end;
  unsigned int *v16;
  std::vector<unsigned int>::pointer begin;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  char *v22;
  unsigned int *v23;
  unsigned int v24;
  LSBundleRecordUpdater *v25;
  LSBundleData *p_bundleData;
  uint64_t v27;
  unint64_t v28;
  int carPlayInstrumentClusterURLSchemes;
  uint64_t v30;
  unsigned int *p_carPlayInstrumentClusterURLSchemes;
  unsigned int v32;
  id v33;
  BOOL v34;
  NSObject *v35;
  void *v36;
  _QWORD *v39;
  LSBundleRecordUpdater *v40;
  id v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  std::vector<unsigned int> v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v41, "count"));
  memset(&v47, 0, sizeof(v47));
  std::vector<unsigned int>::reserve(&v47, objc_msgSend(v41, "count"));
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v41;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  v40 = self;
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v44 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        v11 = -[_LSPersonaWithAttributes personaType](v10) == 3;
        -[_LSDatabase store](v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        v13 = -[_LSPersonaWithAttributes personaType](v10);
        v14 = v13;
        end = v47.__end_;
        if (v47.__end_ >= v47.__end_cap_.__value_)
        {
          begin = v47.__begin_;
          v18 = v47.__end_ - v47.__begin_;
          v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62)
            abort();
          v20 = (char *)v47.__end_cap_.__value_ - (char *)v47.__begin_;
          if (((char *)v47.__end_cap_.__value_ - (char *)v47.__begin_) >> 1 > v19)
            v19 = v20 >> 1;
          if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL)
            v21 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v21 = v19;
          if (v21)
          {
            v22 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)&v47.__end_cap_, v21);
            begin = v47.__begin_;
            end = v47.__end_;
          }
          else
          {
            v22 = 0;
          }
          v23 = (unsigned int *)&v22[4 * v18];
          *v23 = v14;
          v16 = v23 + 1;
          while (end != begin)
          {
            v24 = *--end;
            *--v23 = v24;
          }
          v47.__begin_ = v23;
          v47.__end_ = v16;
          v47.__end_cap_.__value_ = (unsigned int *)&v22[4 * v21];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v47.__end_ = v13;
          v16 = end + 1;
        }
        v7 |= v11;
        v47.__end_ = v16;
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v6);

    v25 = v40;
    p_bundleData = &v40->_bundleData;
    v27 = 0x100000000000000;
    if ((v7 & 1) == 0)
      v27 = 0;
    v28 = *(_QWORD *)(&v40->_bundleData._clas + 1) & 0xFEFFFFFFFFFFFFFFLL | v27;
  }
  else
  {

    v25 = self;
    p_bundleData = &self->_bundleData;
    v28 = *(_QWORD *)(&v40->_bundleData._clas + 1) & 0xFEFFFFFFFFFFFFFFLL;
  }
  *(_QWORD *)(&p_bundleData->_clas + 1) = v28;
  carPlayInstrumentClusterURLSchemes = p_bundleData->carPlayInstrumentClusterURLSchemes;
  v30 = objc_msgSend(v5, "count", a4);
  if (v30)
    LODWORD(v30) = _LSDatabaseCreateStringArray(v25->super._db, v5, 0, 0);
  p_carPlayInstrumentClusterURLSchemes = &p_bundleData->carPlayInstrumentClusterURLSchemes;
  p_bundleData->carPlayInstrumentClusterURLSchemes = v30;
  _LSDatabaseDisposeStringArray(v25->super._db, carPlayInstrumentClusterURLSchemes);
  if (v47.__end_ == v47.__begin_)
    v32 = 0;
  else
    v32 = _CSArrayCreate();
  p_bundleData->appContainerAlias = v32;
  _CSArrayDispose();
  if (!objc_msgSend(obj, "count") || *p_carPlayInstrumentClusterURLSchemes && p_bundleData->appContainerAlias)
  {
    v33 = 0;
    v34 = 1;
  }
  else
  {
    _LSDefaultLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[LSBundleRecordUpdater parsePersonas:error:].cold.1(&p_bundleData->carPlayInstrumentClusterURLSchemes, &p_bundleData->appContainerAlias, v35);

    *(_QWORD *)p_carPlayInstrumentClusterURLSchemes = 0;
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -41, (uint64_t)"-[LSBundleRecordUpdater parsePersonas:error:]", 297, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v36;
    if (v39)
    {
      v33 = objc_retainAutorelease(v36);
      v34 = 0;
      *v39 = v33;
    }
    else
    {
      v34 = 0;
    }
  }
  if (v47.__begin_)
  {
    v47.__end_ = v47.__begin_;
    operator delete(v47.__begin_);
  }

  return v34;
}

- (BOOL)updateBundleRecord:(id *)a3
{
  uint64_t v5;
  int v6;

  v5 = _LSDatabaseGetSequenceNumber() + 1;
  *(_QWORD *)&self->_bundleData._maxSystemVersion._opaque[28] = v5;
  self->_bundleData.sandboxEnvironmentVariables = (int)CFAbsoluteTimeGetCurrent();
  _LSDatabaseSetSequenceNumber((uint64_t)self->super._db, v5);
  v6 = _CSStoreWriteToUnit();
  if (v6)
  {
    _LSDatabaseCommit((uint64_t)self->super._db);
  }
  else if (a3)
  {
    *a3 = objc_retainAutorelease(0);
  }

  return v6 != 0;
}

- (BOOL)checkNeedsUpdateForiTunesMetadata:(id)a3 SINFo:(id)a4 placeholderMetadata:(id)a5
{
  unint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;

  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  v10 = a5;
  v11 = v10;
  v12 = (v8 | v9) != 0;
  if (v10)
  {
    v13 = objc_msgSend(v10, "_LS_integerForKey:", CFSTR("LSInstallType"));
    v14 = objc_msgSend(v11, "_LS_integerForKey:", CFSTR("PlaceholderFailureReason"));
    if (v13 && v13 != self->_bundleData.bundleVersion)
      v12 = 1;
    if (v14 && v14 != *(_QWORD *)&self->_bundleData.shortVersionString)
      v12 = 1;
  }

  return v12;
}

- (void).cxx_destruct
{

}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void)initWithBundleIdentifier:(NSObject *)a3 preferPlaceholder:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_0(&dword_182882000, a2, a3, "could not make bundle record updater for %@: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

- (void)parsePersonas:(NSObject *)a3 error:.cold.1(unsigned int *a1, _DWORD *a2, NSObject *a3)
{
  _BYTE v3[18];

  *(_DWORD *)v3 = 134218240;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2048;
  *(_DWORD *)&v3[14] = *a2;
  OUTLINED_FUNCTION_2_0(&dword_182882000, (uint64_t)a2, a3, "failed to allocate personas (%llx) or persona types (%llx) CSArray", *(_QWORD *)v3, *(_QWORD *)&v3[8]);
}

@end
