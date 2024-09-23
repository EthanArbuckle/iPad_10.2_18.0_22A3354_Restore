@implementation _UIDocumentPickerURLContainerModel

+ (id)tagColorsByTag
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52___UIDocumentPickerURLContainerModel_tagColorsByTag__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (tagColorsByTag_onceToken != -1)
    dispatch_once(&tagColorsByTag_onceToken, block);
  return (id)objc_msgSend((id)_UIDocumentPickerURLContainerModelColorsByTag, "copy");
}

+ (id)allTags
{
  id v2;

  v2 = (id)objc_msgSend(a1, "tagColorsByTag");
  return (id)objc_msgSend((id)_UIDocumentPickerURLContainerModelAllTags, "copy");
}

+ (id)_tagBlipColors
{
  if (_tagBlipColors_onceToken != -1)
    dispatch_once(&_tagBlipColors_onceToken, &__block_literal_global_4);
  return (id)_tagBlipColors_colors;
}

+ (void)_tagColorsDidChange
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "objectForKey:", CFSTR("FinderTagDictVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 134217984;
  v5 = objc_msgSend(v3, "unsignedIntegerValue");
  _os_log_fault_impl(&dword_21F506000, a2, OS_LOG_TYPE_FAULT, "[ERROR] Finder tag dictionary has incorrect version (%lu, should be 2)", (uint8_t *)&v4, 0xCu);

}

- (_UIDocumentPickerURLContainerModel)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[_UIDocumentPickerURLContainerModel init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Don't call %@."), v5);

  return 0;
}

- (_UIDocumentPickerURLContainerModel)initWithURL:(id)a3 pickableTypes:(id)a4 mode:(unint64_t)a5
{
  id v9;
  void *v10;
  void *v11;
  int v12;
  _UIDocumentPickerRootContainerModel *v13;
  _UIDocumentPickerURLContainerModel *v14;
  _UIDocumentPickerURLContainerModel *v15;
  NSURL **p_url;
  uint64_t v17;
  NSOperationQueue *presentedItemOperationQueue;
  void *v19;
  uint64_t v20;
  id urlObserver;
  _UIDocumentPickerURLContainerModel *p_super;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;

  v9 = a4;
  objc_msgSend(a3, "br_realpathURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIDocumentPickerURLContainerModel isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class())
    && (!v10
     || (objc_msgSend(MEMORY[0x24BDBCF48], "ui_cloudDocsContainerURL"),
         v11 = (void *)objc_claimAutoreleasedReturnValue(),
         v12 = objc_msgSend(v10, "isEqual:", v11),
         v11,
         v12)))
  {
    v13 = -[_UIDocumentPickerRootContainerModel initWithPickableTypes:mode:]([_UIDocumentPickerRootContainerModel alloc], "initWithPickableTypes:mode:", v9, a5);
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)_UIDocumentPickerURLContainerModel;
    v14 = -[_UIDocumentPickerContainerModel init](&v27, sel_init);
    v15 = v14;
    if (v14)
    {
      p_url = &v14->_url;
      objc_storeStrong((id *)&v14->_url, v10);
      objc_storeStrong((id *)&v15->_pickableTypes, a4);
      v15->_pickerMode = a5;
      v17 = objc_opt_new();
      presentedItemOperationQueue = v15->_presentedItemOperationQueue;
      v15->_presentedItemOperationQueue = (NSOperationQueue *)v17;

      -[NSOperationQueue setMaxConcurrentOperationCount:](v15->_presentedItemOperationQueue, "setMaxConcurrentOperationCount:", 1);
      if (*p_url)
      {
        objc_initWeak(&location, v15);
        +[BRObservableFile observerForKey:onFileURL:](BRObservableFile, "observerForKey:onFileURL:", 0, *p_url);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __69___UIDocumentPickerURLContainerModel_initWithURL_pickableTypes_mode___block_invoke;
        v24[3] = &unk_24E43AC78;
        objc_copyWeak(&v25, &location);
        objc_msgSend(v19, "addObserverBlock:", v24);
        v20 = objc_claimAutoreleasedReturnValue();
        urlObserver = v15->_urlObserver;
        v15->_urlObserver = (id)v20;

        objc_destroyWeak(&v25);
        objc_destroyWeak(&location);
      }
    }
    v13 = v15;
    self = &v13->super;
  }
  p_super = &v13->super;

  return p_super;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_UIDocumentPickerURLContainerModel observer](self, "observer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentPickerURLContainerModel;
  -[_UIDocumentPickerContainerModel dealloc](&v4, sel_dealloc);
}

- (NSString)displayTitle
{
  NSString *displayTitle;
  NSURL *url;
  BOOL v6;
  id v7;
  uint64_t v8;
  id v9;

  displayTitle = self->_displayTitle;
  if (displayTitle)
    return displayTitle;
  url = self->_url;
  v9 = 0;
  v6 = -[NSURL getResourceValue:forKey:error:](url, "getResourceValue:forKey:error:", &v9, *MEMORY[0x24BDBCCC0], 0);
  v7 = v9;
  if (!v6)
  {
    -[NSURL lastPathComponent](self->_url, "lastPathComponent");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v8;
  }
  return (NSString *)v7;
}

- (void)startMonitoringChanges
{
  void *v3;
  void *v4;
  double v5;

  -[_UIDocumentPickerURLContainerModel observer](self, "observer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[_UIDocumentPickerURLContainerModel _createObserver](self, "_createObserver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerURLContainerModel setObserver:](self, "setObserver:", v4);

    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    self->_startObservingTime = v5;
  }
  -[_UIDocumentPickerURLContainerModel updateSortDescriptors](self, "updateSortDescriptors");
}

- (id)_createObserver
{
  void *v3;
  char v4;
  __objc2_class *v5;
  id v6;
  void *v7;
  void *v8;

  -[_UIDocumentPickerURLContainerModel url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "br_isInMobileDocuments");

  if ((v4 & 1) != 0)
    v5 = _UIDocumentPickerCloudDirectoryObserver;
  else
    v5 = _UIDocumentPickerLocalDirectoryObserver;
  v6 = [v5 alloc];
  -[_UIDocumentPickerURLContainerModel scopes](self, "scopes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithScopes:delegate:", v7, self);

  return v8;
}

- (id)scopes
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[_UIDocumentPickerURLContainerModel url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[_UIDocumentPickerURLContainerModel url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)stopMonitoringChanges
{
  void *v3;

  -[_UIDocumentPickerURLContainerModel observer](self, "observer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[_UIDocumentPickerURLContainerModel setObserver:](self, "setObserver:", 0);
  -[_UIDocumentPickerURLContainerModel callUpdateHandlerWithNewItems:diff:](self, "callUpdateHandlerWithNewItems:diff:", MEMORY[0x24BDBD1A8], 0);
}

- (void)updateSortDescriptors
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __59___UIDocumentPickerURLContainerModel_updateSortDescriptors__block_invoke;
  v21[3] = &unk_24E43ACA0;
  v5 = v3;
  v22 = v5;
  v16 = v4;
  v17 = 3221225472;
  v18 = __59___UIDocumentPickerURLContainerModel_updateSortDescriptors__block_invoke_3;
  v19 = &unk_24E43AD08;
  v6 = (id)MEMORY[0x2207C9E60](v21);
  v20 = v6;
  v7 = (void *)MEMORY[0x2207C9E60](&v16);
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:comparator:", CFSTR("title"), 1, v6, v16, v17, v18, v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:comparator:", 0, 0, &__block_literal_global_105);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:comparator:", CFSTR("tags"), 0, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_UIDocumentPickerContainerModel sortOrder](self, "sortOrder");
  switch(v11)
  {
    case 2:
      v23[0] = v10;
      v23[1] = v8;
      v23[2] = v9;
      v12 = (void *)MEMORY[0x24BDBCE30];
      v13 = v23;
      goto LABEL_7;
    case 1:
      v24[0] = v8;
      v24[1] = v9;
      v24[2] = v10;
      v12 = (void *)MEMORY[0x24BDBCE30];
      v13 = v24;
      goto LABEL_7;
    case 0:
      v25[0] = v9;
      v25[1] = v8;
      v25[2] = v10;
      v12 = (void *)MEMORY[0x24BDBCE30];
      v13 = v25;
LABEL_7:
      objc_msgSend(v12, "arrayWithObjects:count:", v13, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerURLContainerModel observer](self, "observer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSortDescriptors:", v14);

      break;
  }

}

- (void)refreshItem:(id)a3 thumbnailOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void **v13;
  const __CFString **v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  _QWORD v22[2];

  v4 = a4;
  v22[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[_UIDocumentPickerURLContainerModel modelObjects](self, "modelObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v6);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerURLContainerModel modelObjects](self, "modelObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v20 = v9;
      v21 = CFSTR("_UIDocumentPickerModelModifiedThumbnail");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v11;
      v12 = (void *)MEMORY[0x24BDBCE70];
      v13 = (void **)v22;
      v14 = &v21;
    }
    else
    {
      v15 = *MEMORY[0x24BDF80E0];
      v17 = v9;
      v18 = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v11;
      v12 = (void *)MEMORY[0x24BDBCE70];
      v13 = &v19;
      v14 = (const __CFString **)&v18;
    }
    objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerURLContainerModel callUpdateHandlerWithNewItems:diff:](self, "callUpdateHandlerWithNewItems:diff:", v10, v16);

  }
}

- (BOOL)shouldEnableContainer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "documentsTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(v4, "documentsTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKeyPath:", CFSTR("@distinctUnionOfArrays.LSItemContentTypes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          if (-[_UIDocumentPickerURLContainerModel shouldShowContainerForType:](self, "shouldShowContainerForType:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16))
          {
            v14 = 1;
            goto LABEL_12;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v11)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_12:

  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (BOOL)shouldAllowPickingType:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __CFString *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  -[_UIDocumentPickerURLContainerModel pickableTypes](self, "pickableTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[_UIDocumentPickerURLContainerModel pickableTypes](self, "pickableTypes", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      v10 = *MEMORY[0x24BDC17B8];
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v12 = *(__CFString **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (UTTypeConformsTo(v4, v12) || (-[__CFString isEqual:](v12, "isEqual:", v10) & 1) != 0)
          {
            v13 = 1;
            goto LABEL_15;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v13 = 0;
        if (v8)
          continue;
        break;
      }
    }
    else
    {
      v13 = 0;
    }
LABEL_15:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)shouldShowContainerForType:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  -[_UIDocumentPickerURLContainerModel pickableTypes](self, "pickableTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (-[_UIDocumentPickerURLContainerModel pickerMode](self, "pickerMode")
      && -[_UIDocumentPickerURLContainerModel pickerMode](self, "pickerMode") != 1)
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      -[_UIDocumentPickerURLContainerModel pickableTypes](self, "pickableTypes", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
      {
        v7 = *(_QWORD *)v11;
        while (2)
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(_QWORD *)v11 != v7)
              objc_enumerationMutation(v6);
            if (UTTypeConformsTo(*(CFStringRef *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), v4))
            {
              LOBYTE(v5) = 1;
              goto LABEL_15;
            }
          }
          v5 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          if (v5)
            continue;
          break;
        }
      }
LABEL_15:

    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }

  return (char)v5;
}

- (void)arrayController:(id)a3 modelChanged:(id)a4 differences:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  const __CFString *v24;
  _UIDocumentPickerURLContainerModel *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __CFString *v55;
  __CFString *v56;
  id obj;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  _QWORD block[5];
  id v63;
  id v64;
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
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v51 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v74;
    v54 = *(_QWORD *)v74;
    do
    {
      v11 = 0;
      v52 = v9;
      do
      {
        if (*(_QWORD *)v74 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v11);
        objc_msgSend(v12, "setParentModel:", self);
        if (objc_msgSend(v12, "type"))
        {
          if (objc_msgSend(v12, "type") != 2)
            goto LABEL_40;
          objc_msgSend(v12, "container");
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "pickable");
          -[__CFString documentsTypes](v13, "documentsTypes");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v14)
          {
            v17 = objc_msgSend(v15, "count");

            if (v17)
            {
              v60 = v12;
              v53 = v11;
              v55 = v13;
              -[__CFString documentsTypes](v13, "documentsTypes");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "valueForKeyPath:", CFSTR("@distinctUnionOfArrays.LSItemContentTypes"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              v71 = 0u;
              v72 = 0u;
              v70 = 0u;
              v69 = 0u;
              v59 = v19;
              v20 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
              if (v20)
              {
                v21 = v20;
                v22 = *(_QWORD *)v70;
                do
                {
                  for (i = 0; i != v21; ++i)
                  {
                    if (*(_QWORD *)v70 != v22)
                      objc_enumerationMutation(v59);
                    v24 = *(const __CFString **)(*((_QWORD *)&v69 + 1) + 8 * i);
                    v65 = 0u;
                    v66 = 0u;
                    v67 = 0u;
                    v68 = 0u;
                    v25 = self;
                    -[_UIDocumentPickerURLContainerModel pickableTypes](self, "pickableTypes");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
                    if (v27)
                    {
                      v28 = v27;
                      v29 = *(_QWORD *)v66;
                      while (2)
                      {
                        for (j = 0; j != v28; ++j)
                        {
                          if (*(_QWORD *)v66 != v29)
                            objc_enumerationMutation(v26);
                          v31 = *(const __CFString **)(*((_QWORD *)&v65 + 1) + 8 * j);
                          if (UTTypeConformsTo(v31, v24))
                          {
                            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Container declares type %@, which requested type %@ conforms to"), v24, v31);
                            v32 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v60, "setPickabilityReason:", v32);

                            goto LABEL_25;
                          }
                        }
                        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
                        if (v28)
                          continue;
                        break;
                      }
                    }
LABEL_25:

                    self = v25;
                  }
                  v21 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
                }
                while (v21);
              }

              v9 = v52;
              v11 = v53;
              v10 = v54;
              v13 = v55;
              v12 = v60;
              goto LABEL_39;
            }
            v46 = v12;
            v47 = CFSTR("Container doesn't declare any types, so it's pickable by default");
            goto LABEL_38;
          }
          objc_msgSend(v15, "valueForKeyPath:", CFSTR("@distinctUnionOfArrays.LSItemContentTypes"));
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          v38 = (void *)MEMORY[0x24BDD17C8];
          -[__CFString identifier](v13, "identifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "allObjects");
          v56 = v13;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "componentsJoinedByString:", CFSTR(", "));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIDocumentPickerURLContainerModel pickableTypes](self, "pickableTypes");
          v42 = v11;
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "componentsJoinedByString:", CFSTR(", "));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "stringWithFormat:", CFSTR("Container %@ declares types (%@), which doesn't overlap requested types (%@)"), v39, v41, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setPickabilityReason:", v45);

          v11 = v42;
          v10 = v54;

          v13 = v56;
        }
        else
        {
          if (-[_UIDocumentPickerURLContainerModel pickerMode](self, "pickerMode")
            && -[_UIDocumentPickerURLContainerModel pickerMode](self, "pickerMode") != 1)
          {
            objc_msgSend(v12, "setPickable:", 0);
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Document picker is in a mode that doesn't allow picking items"));
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v46 = v12;
            v47 = v13;
LABEL_38:
            objc_msgSend(v46, "setPickabilityReason:", v47);
            goto LABEL_39;
          }
          objc_msgSend(v12, "contentType");
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            objc_msgSend(v12, "setPickable:", 0);
            v48 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v12, "url");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "stringWithFormat:", CFSTR("Item %@ has nil type."), v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setPickabilityReason:", v35);
            goto LABEL_36;
          }
          if (!-[_UIDocumentPickerURLContainerModel shouldAllowPickingType:](self, "shouldAllowPickingType:", v13))
          {
            objc_msgSend(v12, "setPickable:", 0);
            v33 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v12, "url");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UIDocumentPickerURLContainerModel pickableTypes](self, "pickableTypes");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "componentsJoinedByString:", CFSTR(", "));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "stringWithFormat:", CFSTR("Item %@ has type %@, which does not conform to any of the allowed types (%@)"), v34, v13, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setPickabilityReason:", v37);

LABEL_36:
          }
        }
LABEL_39:

LABEL_40:
        objc_msgSend(v58, "addObject:", v12);
        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
    }
    while (v9);
  }

  if (self->_startObservingTime != 0.0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    self->_startObservingTime = 0.0;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79___UIDocumentPickerURLContainerModel_arrayController_modelChanged_differences___block_invoke;
  block[3] = &unk_24E43AD30;
  block[4] = self;
  v63 = v58;
  v64 = v51;
  v49 = v51;
  v50 = v58;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)callUpdateHandlerWithNewItems:(id)a3 diff:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10)
    -[_UIDocumentPickerURLContainerModel setModelObjects:](self, "setModelObjects:", v10);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("changes"));
  if (v10)
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("model"));
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("_UIDocumentPickerModelUpdatedNotification"), self, v8);

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerURLContainerModel url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)afterInitialUpdate
{
  void *v2;
  char v3;

  -[_UIDocumentPickerURLContainerModel observer](self, "observer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "afterInitialUpdate");

  return v3;
}

- (void)updateObserverForURL:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD block[5];

  v4 = a3;
  -[_UIDocumentPickerURLContainerModel url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    cdui_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[_UIDocumentPickerURLContainerModel updateObserverForURL:].cold.2(self);

    -[_UIDocumentPickerURLContainerModel setUrl:](self, "setUrl:", v4);
    -[_UIDocumentPickerURLContainerModel observer](self, "observer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      cdui_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[_UIDocumentPickerURLContainerModel updateObserverForURL:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

      -[_UIDocumentPickerURLContainerModel observer](self, "observer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "invalidate");

      -[_UIDocumentPickerURLContainerModel setObserver:](self, "setObserver:", 0);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __59___UIDocumentPickerURLContainerModel_updateObserverForURL___block_invoke;
      block[3] = &unk_24E43A808;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }

}

- (NSArray)modelObjects
{
  return self->_modelObjects;
}

- (void)setModelObjects:(id)a3
{
  objc_storeStrong((id *)&self->_modelObjects, a3);
}

- (NSArray)pickableTypes
{
  return self->_pickableTypes;
}

- (void)setPickableTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)pickerMode
{
  return self->_pickerMode;
}

- (void)setPickerMode:(unint64_t)a3
{
  self->_pickerMode = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void)setDisplayTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (_UIDocumentPickerDirectoryObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
  objc_storeStrong((id *)&self->_observer, a3);
}

- (id)urlObserver
{
  return self->_urlObserver;
}

- (void)setUrlObserver:(id)a3
{
  objc_storeStrong(&self->_urlObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_urlObserver, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_displayTitle, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_pickableTypes, 0);
  objc_storeStrong((id *)&self->_modelObjects, 0);
  objc_storeStrong((id *)&self->_presentedItemOperationQueue, 0);
}

- (void)updateObserverForURL:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21F506000, a1, a3, "[DEBUG] move: invalidating observer after move", a5, a6, a7, a8, 0);
}

- (void)updateObserverForURL:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "url");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_21F506000, v2, v3, "[DEBUG] move: observed folder %@ has moved to %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
