@implementation DOCConfiguration

- (BOOL)forPickingDocuments
{
  return self->_forPickingDocuments;
}

- (BOOL)forSavingDocuments
{
  return -[DOCConfiguration interactionMode](self, "interactionMode") == 2
      || -[DOCConfiguration interactionMode](self, "interactionMode") == 3;
}

- (unint64_t)interactionMode
{
  return self->_interactionMode;
}

- (NSString)stateIdentifier
{
  return self->_stateIdentifier;
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forbiddenActionIdentifiers, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_stateIdentifier, 0);
  objc_storeStrong((id *)&self->_roleIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultEffectiveTabIdentifierForLocationRestore, 0);
  objc_storeStrong((id *)&self->_hiddenSourcesIdentifiers, 0);
  objc_storeStrong((id *)&self->_hostBundleTitle, 0);
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_recentDocumentsContentTypes, 0);
  objc_storeStrong((id *)&self->_excludedDocumentContentTypes, 0);
  objc_storeStrong((id *)&self->_allowedConversions, 0);
  objc_storeStrong((id *)&self->_documentContentTypes, 0);
  objc_storeStrong((id *)&self->_defaultLocation, 0);
}

- (NSString)hostBundleTitle
{
  NSString *hostBundleTitle;
  NSString *v3;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  void *v12;
  NSString *v13;
  NSString *v14;

  hostBundleTitle = self->_hostBundleTitle;
  if (hostBundleTitle)
  {
    v3 = hostBundleTitle;
  }
  else if (self->_hostIdentifier)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", self->_hostIdentifier);

    if (v7)
    {
      objc_msgSend(v5, "localizedInfoDictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDBD298]);
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      v10 = self->_hostBundleTitle;
      self->_hostBundleTitle = v9;

      v3 = self->_hostBundleTitle;
    }
    else
    {
      if (DOCSelfCanMapLSDatabase_onceToken != -1)
        dispatch_once(&DOCSelfCanMapLSDatabase_onceToken, &__block_literal_global_13);
      if (DOCSelfCanMapLSDatabase_canMapLSDatabase)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", self->_hostIdentifier, 0, 0);
        objc_msgSend(v11, "localizedName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (NSString *)objc_msgSend(v12, "copy");
        v14 = self->_hostBundleTitle;
        self->_hostBundleTitle = v13;

        v3 = self->_hostBundleTitle;
      }
      else
      {
        v3 = 0;
      }
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  DOCConfiguration *v4;
  uint64_t v5;
  DOCConcreteLocation *defaultLocation;
  uint64_t v7;
  NSArray *documentContentTypes;
  uint64_t v9;
  NSArray *excludedDocumentContentTypes;
  uint64_t v11;
  NSArray *recentDocumentsContentTypes;
  void *v13;
  uint64_t v14;
  NSArray *urls;
  uint64_t v16;
  NSArray *forbiddenActionIdentifiers;
  uint64_t v18;
  NSArray *hiddenSourcesIdentifiers;
  uint64_t v20;
  NSString *roleIdentifier;
  uint64_t v22;
  NSString *stateIdentifier;
  uint64_t v24;
  NSString *sceneIdentifier;

  v4 = -[DOCConfiguration init](+[DOCConfiguration allocWithZone:](DOCConfiguration, "allocWithZone:", a3), "init");
  v5 = -[DOCConcreteLocation copy](self->_defaultLocation, "copy");
  defaultLocation = v4->_defaultLocation;
  v4->_defaultLocation = (DOCConcreteLocation *)v5;

  v4->_shouldOpenInApp = self->_shouldOpenInApp;
  v4->_inProcess = self->_inProcess;
  v4->_interactionMode = self->_interactionMode;
  v4->_shouldIgnoreInteractionMode = self->_shouldIgnoreInteractionMode;
  v7 = -[NSArray copy](self->_documentContentTypes, "copy");
  documentContentTypes = v4->_documentContentTypes;
  v4->_documentContentTypes = (NSArray *)v7;

  v9 = -[NSArray copy](self->_excludedDocumentContentTypes, "copy");
  excludedDocumentContentTypes = v4->_excludedDocumentContentTypes;
  v4->_excludedDocumentContentTypes = (NSArray *)v9;

  v11 = -[NSArray copy](self->_recentDocumentsContentTypes, "copy");
  recentDocumentsContentTypes = v4->_recentDocumentsContentTypes;
  v4->_recentDocumentsContentTypes = (NSArray *)v11;

  v13 = (void *)-[NSString copy](self->_hostIdentifier, "copy");
  -[DOCConfiguration setHostIdentifier:](v4, "setHostIdentifier:", v13);

  -[DOCConfiguration setIsContentManaged:](v4, "setIsContentManaged:", self->_isContentManaged);
  v14 = -[NSArray copy](self->_urls, "copy");
  urls = v4->_urls;
  v4->_urls = (NSArray *)v14;

  v16 = -[NSArray copy](self->_forbiddenActionIdentifiers, "copy");
  forbiddenActionIdentifiers = v4->_forbiddenActionIdentifiers;
  v4->_forbiddenActionIdentifiers = (NSArray *)v16;

  v4->_neverCreateBookmarkForOpenInPlace = self->_neverCreateBookmarkForOpenInPlace;
  v4->_showCollectionControls = self->_showCollectionControls;
  v18 = -[NSArray copy](self->_hiddenSourcesIdentifiers, "copy");
  hiddenSourcesIdentifiers = v4->_hiddenSourcesIdentifiers;
  v4->_hiddenSourcesIdentifiers = (NSArray *)v18;

  v4->_useExpandedSourceList = self->_useExpandedSourceList;
  v20 = -[NSString copy](self->_roleIdentifier, "copy");
  roleIdentifier = v4->_roleIdentifier;
  v4->_roleIdentifier = (NSString *)v20;

  v22 = -[NSString copy](self->_stateIdentifier, "copy");
  stateIdentifier = v4->_stateIdentifier;
  v4->_stateIdentifier = (NSString *)v22;

  v24 = -[NSString copy](self->_sceneIdentifier, "copy");
  sceneIdentifier = v4->_sceneIdentifier;
  v4->_sceneIdentifier = (NSString *)v24;

  v4->_maximumNumberOfItemsToFetch = self->_maximumNumberOfItemsToFetch;
  v4->_maximumNumberOfRows = self->_maximumNumberOfRows;
  v4->_restoreLastVisitedLocation = self->_restoreLastVisitedLocation;
  objc_storeStrong((id *)&v4->_defaultEffectiveTabIdentifierForLocationRestore, self->_defaultEffectiveTabIdentifierForLocationRestore);
  v4->_saveLastVisitedLocation = self->_saveLastVisitedLocation;
  v4->_pickingItemsShouldBumpLastOpenDate = self->_pickingItemsShouldBumpLastOpenDate;
  v4->_shouldAdjustContentInset = self->_shouldAdjustContentInset;
  v4->_forPickingDocuments = self->_forPickingDocuments;
  v4->_forPickingFolders = self->_forPickingFolders;
  v4->_forPickingDownloadsFolder = self->_forPickingDownloadsFolder;
  v4->_forMovingDocuments = self->_forMovingDocuments;
  v4->_supportsRelatedFilesInPicker = self->_supportsRelatedFilesInPicker;
  v4->_useSharedQuickLook = self->_useSharedQuickLook;
  v4->_suppressBlackCallout = self->_suppressBlackCallout;
  v4->_preferLastUsedDate = self->_preferLastUsedDate;
  v4->_browserViewContext = self->_browserViewContext;
  v4->_skipDownload = self->_skipDownload;
  v4->_presentingMakesCollectionFirstResponder = self->_presentingMakesCollectionFirstResponder;
  v4->_thumbnailFetchingTimeOut = self->_thumbnailFetchingTimeOut;
  v4->_collectionSupportsDragAndDrop = self->_collectionSupportsDragAndDrop;
  v4->_supportsColumnView = self->_supportsColumnView;
  v4->_supportsNavigationTitleMenus = self->_supportsNavigationTitleMenus;
  v4->_supportsRemovableFileProviders = self->_supportsRemovableFileProviders;
  v4->_isInUIPDocumentLanding = self->_isInUIPDocumentLanding;
  v4->_shouldHideCatalystHostWindow = self->_shouldHideCatalystHostWindow;
  return v4;
}

- (DOCConfiguration)init
{
  DOCConfiguration *v2;
  DOCConfiguration *v3;
  void *v4;
  void *v5;
  NSArray *forbiddenActionIdentifiers;
  NSArray *v7;
  NSArray *hiddenSourcesIdentifiers;
  NSString *defaultEffectiveTabIdentifierForLocationRestore;
  void *v10;
  DOCConfiguration *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DOCConfiguration;
  v2 = -[DOCConfiguration init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_shouldIgnoreInteractionMode = 0;
    -[DOCConfiguration setIsContentManaged:](v2, "setIsContentManaged:", 0);
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCConfiguration setHostIdentifier:](v3, "setHostIdentifier:", v5);

    forbiddenActionIdentifiers = v3->_forbiddenActionIdentifiers;
    v7 = (NSArray *)MEMORY[0x24BDBD1A8];
    v3->_forbiddenActionIdentifiers = (NSArray *)MEMORY[0x24BDBD1A8];

    v3->_neverCreateBookmarkForOpenInPlace = 0;
    v3->_showCollectionControls = 1;
    hiddenSourcesIdentifiers = v3->_hiddenSourcesIdentifiers;
    v3->_hiddenSourcesIdentifiers = v7;

    v3->_useExpandedSourceList = 0;
    *(int64x2_t *)&v3->_maximumNumberOfItemsToFetch = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v3->_restoreLastVisitedLocation = 0;
    defaultEffectiveTabIdentifierForLocationRestore = v3->_defaultEffectiveTabIdentifierForLocationRestore;
    v3->_defaultEffectiveTabIdentifierForLocationRestore = (NSString *)CFSTR("Browse");

    *(_WORD *)&v3->_saveLastVisitedLocation = 256;
    *(_WORD *)&v3->_pickingItemsShouldBumpLastOpenDate = 1;
    *(_WORD *)&v3->_forPickingDocuments = 0;
    *(_WORD *)&v3->_forPickingDownloadsFolder = 0;
    v3->_forMovingDocuments = 0;
    v3->_browserViewContext = 0;
    v3->_thumbnailFetchingTimeOut = 0.25;
    v3->_presentingMakesCollectionFirstResponder = 1;
    *(_DWORD *)&v3->_supportsColumnView = 65792;
    *(_WORD *)&v3->_isInUIPDocumentLanding = 256;
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v10, "BOOLForKey:", CFSTR("DOCForceUIPDocumentLandingAlways"));

    if ((_DWORD)v5)
      v3->_isInUIPDocumentLanding = 1;
    v11 = v3;
  }

  return v3;
}

- (void)setIsContentManaged:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  id v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  v5 = docPersonaLogHandle;
  if (!docPersonaLogHandle)
  {
    DOCInitLogging();
    v5 = docPersonaLogHandle;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_2090A2000, v5, OS_LOG_TYPE_DEFAULT, "MDM : setting isContentManaged to : %@", (uint8_t *)&v8, 0xCu);
  }
  self->_isContentManaged = v3;
  +[DOCManagedPermission defaultPermission](DOCManagedPermission, "defaultPermission");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  objc_msgSend(v7, "setHostAccountDataOwnerState:", v3);
  objc_sync_exit(v7);

}

- (void)setHostIdentifier:(id)a3
{
  NSString *v4;
  NSString *hostIdentifier;
  NSString *v6;
  id v7;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  hostIdentifier = self->_hostIdentifier;
  self->_hostIdentifier = v4;

  v6 = self->_hostIdentifier;
  +[DOCManagedPermission defaultPermission](DOCManagedPermission, "defaultPermission");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHostIdentifier:", v6);

}

- (NSArray)recentDocumentsContentTypes
{
  NSArray *recentDocumentsContentTypes;

  recentDocumentsContentTypes = self->_recentDocumentsContentTypes;
  if (recentDocumentsContentTypes)
    return recentDocumentsContentTypes;
  -[DOCConfiguration documentContentTypes](self, "documentContentTypes");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)documentContentTypes
{
  NSArray *documentContentTypes;
  NSArray *v3;
  NSString *hostIdentifier;
  NSArray *v7;
  NSArray *v8;
  NSUInteger v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  documentContentTypes = self->_documentContentTypes;
  if (!documentContentTypes)
  {
    if (!self->_hostIdentifier)
    {
      v10[0] = *MEMORY[0x24BDF8348];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
      v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
    if (DOCSelfCanMapLSDatabase_onceToken != -1)
      dispatch_once(&DOCSelfCanMapLSDatabase_onceToken, &__block_literal_global_13);
    if (DOCSelfCanMapLSDatabase_canMapLSDatabase)
      hostIdentifier = self->_hostIdentifier;
    else
      hostIdentifier = 0;
    DOCContentTypesReadableByApplicationWithBundleIdentifier(hostIdentifier);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v8 = self->_documentContentTypes;
    self->_documentContentTypes = v7;

    v9 = -[NSArray count](self->_documentContentTypes, "count");
    documentContentTypes = self->_documentContentTypes;
    if (!v9)
    {
      self->_documentContentTypes = 0;

      documentContentTypes = self->_documentContentTypes;
    }
  }
  v3 = documentContentTypes;
  return v3;
}

- (BOOL)isFilesApp
{
  void *v3;
  BOOL v4;

  -[DOCConfiguration hostIdentifier](self, "hostIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.DocumentsApp")))
    v4 = -[DOCConfiguration browserViewContext](self, "browserViewContext") == 0;
  else
    v4 = 0;

  return v4;
}

- (BOOL)isPopoverOrWidget
{
  return -[DOCConfiguration isPopover](self, "isPopover") || -[DOCConfiguration isWidget](self, "isWidget");
}

- (BOOL)isWidget
{
  return -[DOCConfiguration browserViewContext](self, "browserViewContext") == 2;
}

- (BOOL)isPopover
{
  return -[DOCConfiguration browserViewContext](self, "browserViewContext") == 1;
}

- (unint64_t)browserViewContext
{
  return self->_browserViewContext;
}

- (NSString)hostIdentifier
{
  return self->_hostIdentifier;
}

- (int64_t)maximumNumberOfItemsToFetch
{
  return self->_maximumNumberOfItemsToFetch;
}

- (NSArray)excludedDocumentContentTypes
{
  return self->_excludedDocumentContentTypes;
}

- (BOOL)forMovingDocuments
{
  return self->_forMovingDocuments;
}

- (BOOL)preferLastUsedDate
{
  return self->_preferLastUsedDate;
}

- (BOOL)forBrowsingInApp
{
  return !-[DOCConfiguration isPickerUI](self, "isPickerUI");
}

- (BOOL)isPickerUI
{
  return self->_forPickingFolders
      || self->_forPickingDocuments
      || self->_forPickingDownloadsFolder
      || self->_forMovingDocuments;
}

- (BOOL)supportsRemovableFileProviders
{
  return self->_supportsRemovableFileProviders;
}

- (BOOL)forPickingFoldersOnly
{
  void *v3;
  BOOL v4;

  if (!-[DOCConfiguration forPickingFolders](self, "forPickingFolders"))
    return 0;
  -[DOCConfiguration documentContentTypes](self, "documentContentTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") == 0;

  return v4;
}

- (BOOL)forPickingFolders
{
  return self->_forPickingFolders;
}

- (BOOL)inProcess
{
  return self->_inProcess;
}

- (void)setPreferLastUsedDate:(BOOL)a3
{
  self->_preferLastUsedDate = a3;
}

- (BOOL)showCollectionControls
{
  return self->_showCollectionControls;
}

- (BOOL)forPickingDownloadsFolder
{
  return self->_forPickingDownloadsFolder;
}

- (DOCConcreteLocation)defaultLocation
{
  return (DOCConcreteLocation *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPresentingMakesCollectionFirstResponder:(BOOL)a3
{
  self->_presentingMakesCollectionFirstResponder = a3;
}

- (BOOL)restoreLastVisitedLocation
{
  return self->_restoreLastVisitedLocation;
}

- (double)thumbnailFetchingTimeOut
{
  return self->_thumbnailFetchingTimeOut;
}

- (void)setRestoreLastVisitedLocation:(BOOL)a3
{
  self->_restoreLastVisitedLocation = a3;
}

- (NSArray)forbiddenActionIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setSupportsRemovableFileProviders:(BOOL)a3
{
  self->_supportsRemovableFileProviders = a3;
}

- (void)setNeverCreateBookmarkForOpenInPlace:(BOOL)a3
{
  self->_neverCreateBookmarkForOpenInPlace = a3;
}

- (void)setDefaultLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setUseSharedQuickLook:(BOOL)a3
{
  self->_useSharedQuickLook = a3;
}

- (void)setUseExpandedSourceList:(BOOL)a3
{
  self->_useExpandedSourceList = a3;
}

- (void)setSupportsColumnView:(BOOL)a3
{
  self->_supportsColumnView = a3;
}

- (void)setStateIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setShouldOpenInApp:(BOOL)a3
{
  self->_shouldOpenInApp = a3;
}

- (void)setSceneIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setSaveLastVisitedLocation:(BOOL)a3
{
  self->_saveLastVisitedLocation = a3;
}

- (void)setRecentDocumentsContentTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setPickingItemsShouldBumpLastOpenDate:(BOOL)a3
{
  self->_pickingItemsShouldBumpLastOpenDate = a3;
}

- (void)setInProcess:(BOOL)a3
{
  self->_inProcess = a3;
}

- (void)setHiddenSourcesIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)hiddenSourcesIdentifiers
{
  return self->_hiddenSourcesIdentifiers;
}

- (NSArray)urls
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)supportsNavigationTitleMenus
{
  return self->_supportsNavigationTitleMenus;
}

- (BOOL)shouldAdjustContentInset
{
  return self->_shouldAdjustContentInset;
}

- (BOOL)saveLastVisitedLocation
{
  return self->_saveLastVisitedLocation;
}

- (BOOL)collectionSupportsDragAndDrop
{
  return self->_collectionSupportsDragAndDrop;
}

+ (id)configurationForImportingDocumentContentTypes:(id)a3 mode:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v10;

  v7 = a3;
  if (a4 >= 2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DOCConfiguration.m"), 87, CFSTR("mode must be one of DOCDocumentInteractionModeImportOpen or DOCDocumentInteractionModeImportCopy."));

  }
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setInteractionMode:", a4);
  objc_msgSend(v8, "setDocumentContentTypes:", v7);
  if (objc_msgSend(v7, "containsObject:", *MEMORY[0x24BDF83C0]))
    objc_msgSend(v8, "setForPickingFolders:", 1);

  return v8;
}

- (void)setInteractionMode:(unint64_t)a3
{
  self->_interactionMode = a3;
}

- (void)setDocumentContentTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

+ (id)configurationForOpeningDocumentsOfApplicationWithBundleIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setInteractionMode:", 1);
  objc_msgSend(v4, "setHostIdentifier:", v3);

  return v4;
}

+ (id)configurationForImportingDocumentsWithContentTypes:(id)a3 mode:(unint64_t)a4
{
  void *v6;
  void *v7;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDF8238], "doc_contentTypesForIdentifiers:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(a1, "configurationForImportingDocumentContentTypes:mode:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)configurationForImportingDocumentsWithConversionRules:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setInteractionMode:", 0);
  objc_msgSend(a1, "pickableContentTypesFromAllowedConversions:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldConvert:", 1);
  objc_msgSend(v5, "setAllowedConversions:", v4);

  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDocumentContentTypes:", v7);

  return v5;
}

+ (id)pickableContentTypesFromAllowedConversions:(id)a3
{
  id v3;
  CFArrayRef v4;
  CFArrayRef v5;
  const __CFArray *v6;
  const __CFArray *v7;
  id v8;
  _QWORD v10[4];
  const __CFArray *v11;
  const __CFArray *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a3;
  v4 = CGImageDestinationCopyTypeIdentifiers();
  v5 = CGImageSourceCopyTypeIdentifiers();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5;
  v18 = __Block_byref_object_dispose__5;
  v19 = (id)objc_opt_new();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__DOCConfiguration_pickableContentTypesFromAllowedConversions___block_invoke;
  v10[3] = &unk_24C0FF020;
  v13 = &v14;
  v6 = v4;
  v11 = v6;
  v7 = v5;
  v12 = v7;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __63__DOCConfiguration_pickableContentTypesFromAllowedConversions___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v5);
  v7 = (void *)a1[4];
  v24 = v5;
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "containsObject:", v8);

  if ((_DWORD)v7)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = v6;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v15 = (void *)a1[5];
          objc_msgSend(v14, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v15) = objc_msgSend(v15, "containsObject:", v16);

          if ((_DWORD)v15)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v14);
          }
          else
          {
            v17 = docLogHandle;
            if (!docLogHandle)
            {
              DOCInitLogging();
              v17 = docLogHandle;
            }
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              v18 = v17;
              objc_msgSend(v14, "identifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "identifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "identifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v30 = v19;
              v31 = 2112;
              v32 = v20;
              v33 = 2112;
              v34 = v21;
              _os_log_error_impl(&dword_2090A2000, v18, OS_LOG_TYPE_ERROR, "%@ is not part of Image I/O Source types so conversion from %@ to %@ not allowed", buf, 0x20u);

            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
      }
      while (v11);
    }

    v6 = v23;
  }
  else
  {
    v22 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v22 = docLogHandle;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __63__DOCConfiguration_pickableContentTypesFromAllowedConversions___block_invoke_cold_1(v22, v5);
  }

}

+ (id)configurationForExportingDocumentsToURLs:(id)a3 mode:(unint64_t)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DOCConfiguration.m"), 147, CFSTR("urls cannot be nil."));

  }
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DOCConfiguration.m"), 149, CFSTR("mode must be one of DOCDocumentInteractionModeExportMove or DOCDocumentInteractionModeExportCopy."));

  }
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setInteractionMode:", a4);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x20BD0D430]();
        v23 = 0;
        objc_msgSend(MEMORY[0x24BDC8310], "wrapperWithURL:readonly:error:", v13, a4 == 2, &v23);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v23;
        if (v15)
        {
          objc_msgSend(v8, "addObject:", v15);
        }
        else
        {
          v17 = docLogHandle;
          if (!docLogHandle)
          {
            DOCInitLogging();
            v17 = docLogHandle;
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v29 = v13;
            v30 = 2112;
            v31 = v16;
            _os_log_error_impl(&dword_2090A2000, v17, OS_LOG_TYPE_ERROR, "Failed to create FPSandboxingURLWrapper for %@. %@", buf, 0x16u);
          }
        }

        objc_autoreleasePoolPop(v14);
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v10);
  }

  objc_msgSend(v21, "setUrls:", v8);
  return v21;
}

+ (id)configurationForFolderPicking
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setInteractionMode:", 1);
  objc_msgSend(v2, "setForPickingFolders:", 1);
  return v2;
}

- (NSString)roleIdentifier
{
  __CFString *roleIdentifier;
  _BOOL4 v3;

  roleIdentifier = (__CFString *)self->_roleIdentifier;
  if (!roleIdentifier)
  {
    v3 = -[DOCConfiguration forPickingDocuments](self, "forPickingDocuments");
    roleIdentifier = CFSTR("com.apple.DocumentManager.Role.Picker");
    if (!v3)
      roleIdentifier = 0;
  }
  return (NSString *)roleIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DOCConfiguration)initWithCoder:(id)a3
{
  id v4;
  DOCConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *documentContentTypes;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *excludedDocumentContentTypes;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *recentDocumentsContentTypes;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSArray *urls;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSArray *forbiddenActionIdentifiers;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSArray *hiddenSourcesIdentifiers;
  uint64_t v37;
  NSString *roleIdentifier;
  uint64_t v39;
  NSString *stateIdentifier;
  uint64_t v41;
  NSString *sceneIdentifier;
  uint64_t v43;
  NSString *defaultEffectiveTabIdentifierForLocationRestore;
  double v45;
  DOCConfiguration *v46;
  objc_super v48;

  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)DOCConfiguration;
  v5 = -[DOCConfiguration init](&v48, sel_init);
  if (v5)
  {
    v5->_interactionMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interactionMode"));
    v5->_shouldIgnoreInteractionMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldIgnoreInteractionMode"));
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("documentContentTypes"));
    v9 = objc_claimAutoreleasedReturnValue();
    documentContentTypes = v5->_documentContentTypes;
    v5->_documentContentTypes = (NSArray *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("excludedDocumentContentTypes"));
    v14 = objc_claimAutoreleasedReturnValue();
    excludedDocumentContentTypes = v5->_excludedDocumentContentTypes;
    v5->_excludedDocumentContentTypes = (NSArray *)v14;

    v16 = (void *)MEMORY[0x24BDBCF20];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("recentDocumentsContentTypes"));
    v19 = objc_claimAutoreleasedReturnValue();
    recentDocumentsContentTypes = v5->_recentDocumentsContentTypes;
    v5->_recentDocumentsContentTypes = (NSArray *)v19;

    -[DOCConfiguration setIsContentManaged:](v5, "setIsContentManaged:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isContentManaged")));
    v21 = (void *)MEMORY[0x24BDBCF20];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("urls"));
    v24 = objc_claimAutoreleasedReturnValue();
    urls = v5->_urls;
    v5->_urls = (NSArray *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hostIdentifier"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCConfiguration setHostIdentifier:](v5, "setHostIdentifier:", v26);

    v27 = (void *)MEMORY[0x24BDBCF20];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("forbiddenActionIdentifiers"));
    v30 = objc_claimAutoreleasedReturnValue();
    forbiddenActionIdentifiers = v5->_forbiddenActionIdentifiers;
    v5->_forbiddenActionIdentifiers = (NSArray *)v30;

    v5->_neverCreateBookmarkForOpenInPlace = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("neverCreateBookmarkForOpenInPlace"));
    v5->_showCollectionControls = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showCollectionControls"));
    v32 = (void *)MEMORY[0x24BDBCF20];
    v33 = objc_opt_class();
    objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("hiddenSourcesIdentifiers"));
    v35 = objc_claimAutoreleasedReturnValue();
    hiddenSourcesIdentifiers = v5->_hiddenSourcesIdentifiers;
    v5->_hiddenSourcesIdentifiers = (NSArray *)v35;

    v5->_useExpandedSourceList = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useExpandedSourceList"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("roleIdentifier"));
    v37 = objc_claimAutoreleasedReturnValue();
    roleIdentifier = v5->_roleIdentifier;
    v5->_roleIdentifier = (NSString *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stateIdentifier"));
    v39 = objc_claimAutoreleasedReturnValue();
    stateIdentifier = v5->_stateIdentifier;
    v5->_stateIdentifier = (NSString *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sceneIdentifier"));
    v41 = objc_claimAutoreleasedReturnValue();
    sceneIdentifier = v5->_sceneIdentifier;
    v5->_sceneIdentifier = (NSString *)v41;

    v5->_maximumNumberOfItemsToFetch = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maximumNumberOfItemsToFetch"));
    v5->_maximumNumberOfRows = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maximumNumberOfRows"));
    v5->_restoreLastVisitedLocation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("restoreLastVisitedLocation"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultEffectiveTabIdentifierForLocationRestore"));
    v43 = objc_claimAutoreleasedReturnValue();
    defaultEffectiveTabIdentifierForLocationRestore = v5->_defaultEffectiveTabIdentifierForLocationRestore;
    v5->_defaultEffectiveTabIdentifierForLocationRestore = (NSString *)v43;

    v5->_saveLastVisitedLocation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("saveLastVisitedLocation"));
    v5->_pickingItemsShouldBumpLastOpenDate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pickingItemsShouldBumpLastOpenDate"));
    v5->_shouldAdjustContentInset = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldAdjustContentInset"));
    v5->_forPickingDocuments = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forPickingDocuments"));
    v5->_forPickingFolders = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forPickingFolders"));
    v5->_forPickingDownloadsFolder = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forPickingDownloadsFolder"));
    v5->_forMovingDocuments = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forMovingDocuments"));
    v5->_supportsRelatedFilesInPicker = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsRelatedFilesInPicker"));
    v5->_useSharedQuickLook = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useSharedQuickLook"));
    v5->_shouldOpenInApp = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldOpenInApp"));
    v5->_suppressBlackCallout = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("suppressBlackCallout"));
    v5->_preferLastUsedDate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("preferLastUsedDate"));
    v5->_browserViewContext = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("browserViewContext"));
    v5->_skipDownload = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("skipDownload"));
    v5->_presentingMakesCollectionFirstResponder = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("presentingMakesCollectionFirstResponder"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("thumbnailFetchingTimeOut"));
    v5->_thumbnailFetchingTimeOut = v45;
    v5->_collectionSupportsDragAndDrop = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("collectionSupportsDragAndDrop"));
    v5->_supportsColumnView = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsColumnView"));
    v5->_supportsNavigationTitleMenus = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsNavigationTitleMenus"));
    v5->_supportsRemovableFileProviders = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsRemovableFileProviders"));
    v5->_isInUIPDocumentLanding = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isInUIPDocumentLanding"));
    v5->_shouldHideCatalystHostWindow = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldHideCatalystHostWindow"));
    v46 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *urls;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", self->_interactionMode, CFSTR("interactionMode"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldIgnoreInteractionMode, CFSTR("shouldIgnoreInteractionMode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_documentContentTypes, CFSTR("documentContentTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_excludedDocumentContentTypes, CFSTR("excludedDocumentContentTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recentDocumentsContentTypes, CFSTR("recentDocumentsContentTypes"));
  urls = self->_urls;
  if (urls)
    objc_msgSend(v5, "encodeObject:forKey:", urls, CFSTR("urls"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hostIdentifier, CFSTR("hostIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isContentManaged, CFSTR("isContentManaged"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_forbiddenActionIdentifiers, CFSTR("forbiddenActionIdentifiers"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_neverCreateBookmarkForOpenInPlace, CFSTR("neverCreateBookmarkForOpenInPlace"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_showCollectionControls, CFSTR("showCollectionControls"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hiddenSourcesIdentifiers, CFSTR("hiddenSourcesIdentifiers"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_useExpandedSourceList, CFSTR("useExpandedSourceList"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_restoreLastVisitedLocation, CFSTR("restoreLastVisitedLocation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_defaultEffectiveTabIdentifierForLocationRestore, CFSTR("defaultEffectiveTabIdentifierForLocationRestore"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_saveLastVisitedLocation, CFSTR("saveLastVisitedLocation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldOpenInApp, CFSTR("shouldOpenInApp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_roleIdentifier, CFSTR("roleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stateIdentifier, CFSTR("stateIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sceneIdentifier, CFSTR("sceneIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maximumNumberOfItemsToFetch, CFSTR("maximumNumberOfItemsToFetch"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maximumNumberOfRows, CFSTR("maximumNumberOfRows"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_pickingItemsShouldBumpLastOpenDate, CFSTR("pickingItemsShouldBumpLastOpenDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldAdjustContentInset, CFSTR("shouldAdjustContentInset"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_forPickingDocuments, CFSTR("forPickingDocuments"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_forPickingFolders, CFSTR("forPickingFolders"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_forPickingDownloadsFolder, CFSTR("forPickingDownloadsFolder"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_forMovingDocuments, CFSTR("forMovingDocuments"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsRelatedFilesInPicker, CFSTR("supportsRelatedFilesInPicker"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_useSharedQuickLook, CFSTR("useSharedQuickLook"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_suppressBlackCallout, CFSTR("suppressBlackCallout"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_preferLastUsedDate, CFSTR("preferLastUsedDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_browserViewContext, CFSTR("browserViewContext"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_skipDownload, CFSTR("skipDownload"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_presentingMakesCollectionFirstResponder, CFSTR("presentingMakesCollectionFirstResponder"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("thumbnailFetchingTimeOut"), self->_thumbnailFetchingTimeOut);
  objc_msgSend(v5, "encodeBool:forKey:", self->_collectionSupportsDragAndDrop, CFSTR("collectionSupportsDragAndDrop"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsColumnView, CFSTR("supportsColumnView"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsNavigationTitleMenus, CFSTR("supportsNavigationTitleMenus"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsRemovableFileProviders, CFSTR("supportsRemovableFileProviders"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isInUIPDocumentLanding, CFSTR("isInUIPDocumentLanding"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldHideCatalystHostWindow, CFSTR("shouldHideCatalystHostWindow"));

}

- (BOOL)isEqual:(id)a3
{
  DOCConfiguration *v4;
  char v5;

  v4 = (DOCConfiguration *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[DOCConfiguration isEqualToConfiguration:](v4, "isEqualToConfiguration:", self);
    else
      v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  NSArray **v4;
  NSArray **v5;
  NSArray *documentContentTypes;
  NSArray *excludedDocumentContentTypes;
  NSArray *recentDocumentsContentTypes;
  NSArray *urls;
  NSString *hostIdentifier;
  NSArray *forbiddenActionIdentifiers;
  NSArray *hiddenSourcesIdentifiers;
  NSString *roleIdentifier;
  NSString *stateIdentifier;
  NSString *sceneIdentifier;
  BOOL v16;

  v4 = (NSArray **)a3;
  v5 = v4;
  if ((NSArray *)self->_interactionMode != v4[6])
    goto LABEL_53;
  if (self->_shouldIgnoreInteractionMode != *((unsigned __int8 *)v4 + 8))
    goto LABEL_53;
  documentContentTypes = self->_documentContentTypes;
  if (documentContentTypes != v5[7] && !-[NSArray isEqual:](documentContentTypes, "isEqual:"))
    goto LABEL_53;
  excludedDocumentContentTypes = self->_excludedDocumentContentTypes;
  if (excludedDocumentContentTypes != v5[9]
    && !-[NSArray isEqual:](excludedDocumentContentTypes, "isEqual:"))
  {
    goto LABEL_53;
  }
  recentDocumentsContentTypes = self->_recentDocumentsContentTypes;
  if (recentDocumentsContentTypes != v5[10]
    && !-[NSArray isEqual:](recentDocumentsContentTypes, "isEqual:"))
  {
    goto LABEL_53;
  }
  if (((urls = self->_urls, urls == v5[11]) || -[NSArray isEqual:](urls, "isEqual:"))
    && ((hostIdentifier = self->_hostIdentifier, hostIdentifier == (NSString *)v5[12])
     || -[NSString isEqual:](hostIdentifier, "isEqual:"))
    && self->_isContentManaged == *((unsigned __int8 *)v5 + 17)
    && ((forbiddenActionIdentifiers = self->_forbiddenActionIdentifiers, forbiddenActionIdentifiers == v5[22])
     || -[NSArray isEqual:](forbiddenActionIdentifiers, "isEqual:"))
    && self->_neverCreateBookmarkForOpenInPlace == *((unsigned __int8 *)v5 + 18)
    && self->_showCollectionControls == *((unsigned __int8 *)v5 + 30)
    && ((hiddenSourcesIdentifiers = self->_hiddenSourcesIdentifiers, hiddenSourcesIdentifiers == v5[14])
     || -[NSArray isEqual:](hiddenSourcesIdentifiers, "isEqual:"))
    && self->_useExpandedSourceList == *((unsigned __int8 *)v5 + 35)
    && self->_restoreLastVisitedLocation == *((unsigned __int8 *)v5 + 25)
    && hasEqual_defaultEffectiveTabIdentifierForLocationRestore(self, v5)
    && self->_saveLastVisitedLocation == *((unsigned __int8 *)v5 + 26)
    && self->_shouldOpenInApp == *((unsigned __int8 *)v5 + 24)
    && ((roleIdentifier = self->_roleIdentifier, roleIdentifier == (NSString *)v5[19])
     || -[NSString isEqual:](roleIdentifier, "isEqual:"))
    && ((stateIdentifier = self->_stateIdentifier, stateIdentifier == (NSString *)v5[20])
     || -[NSString isEqual:](stateIdentifier, "isEqual:"))
    && ((sceneIdentifier = self->_sceneIdentifier, sceneIdentifier == (NSString *)v5[21])
     || -[NSString isEqual:](sceneIdentifier, "isEqual:"))
    && (NSArray *)self->_maximumNumberOfItemsToFetch == v5[16]
    && (NSArray *)self->_maximumNumberOfRows == v5[17]
    && self->_pickingItemsShouldBumpLastOpenDate == *((unsigned __int8 *)v5 + 19)
    && self->_shouldAdjustContentInset == *((unsigned __int8 *)v5 + 33)
    && self->_forPickingDocuments == *((unsigned __int8 *)v5 + 11)
    && self->_forPickingFolders == *((unsigned __int8 *)v5 + 12)
    && self->_forPickingDownloadsFolder == *((unsigned __int8 *)v5 + 15)
    && self->_forMovingDocuments == *((unsigned __int8 *)v5 + 13)
    && self->_supportsRelatedFilesInPicker == *((unsigned __int8 *)v5 + 16)
    && self->_useSharedQuickLook == *((unsigned __int8 *)v5 + 34)
    && self->_suppressBlackCallout == *((unsigned __int8 *)v5 + 20)
    && self->_preferLastUsedDate == *((unsigned __int8 *)v5 + 21)
    && (NSArray *)self->_browserViewContext == v5[18]
    && self->_skipDownload == *((unsigned __int8 *)v5 + 28)
    && self->_presentingMakesCollectionFirstResponder == *((unsigned __int8 *)v5 + 29)
    && self->_thumbnailFetchingTimeOut == *((double *)v5 + 23)
    && self->_collectionSupportsDragAndDrop == *((unsigned __int8 *)v5 + 27)
    && self->_supportsColumnView == *((unsigned __int8 *)v5 + 31)
    && self->_supportsNavigationTitleMenus == *((unsigned __int8 *)v5 + 32)
    && self->_supportsRemovableFileProviders == *((unsigned __int8 *)v5 + 14)
    && self->_isInUIPDocumentLanding == *((unsigned __int8 *)v5 + 22))
  {
    v16 = self->_shouldHideCatalystHostWindow == *((unsigned __int8 *)v5 + 23);
  }
  else
  {
LABEL_53:
    v16 = 0;
  }

  return v16;
}

- (BOOL)isInUIPDocumentLanding
{
  _BOOL4 v3;

  v3 = -[DOCConfiguration forBrowsingInApp](self, "forBrowsingInApp");
  if (v3)
    LOBYTE(v3) = self->_isInUIPDocumentLanding;
  return v3;
}

- (unint64_t)interactionModeForPreparing
{
  if (-[DOCConfiguration shouldIgnoreInteractionMode](self, "shouldIgnoreInteractionMode"))
    return 1;
  else
    return -[DOCConfiguration interactionMode](self, "interactionMode");
}

- (BOOL)shouldIgnoreInteractionMode
{
  return self->_shouldIgnoreInteractionMode;
}

- (void)setShouldIgnoreInteractionMode:(BOOL)a3
{
  self->_shouldIgnoreInteractionMode = a3;
}

- (NSDictionary)allowedConversions
{
  return self->_allowedConversions;
}

- (void)setAllowedConversions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)shouldConvert
{
  return self->_shouldConvert;
}

- (void)setShouldConvert:(BOOL)a3
{
  self->_shouldConvert = a3;
}

- (void)setExcludedDocumentContentTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setUrls:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void)setHostBundleTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setForPickingDocuments:(BOOL)a3
{
  self->_forPickingDocuments = a3;
}

- (void)setForPickingFolders:(BOOL)a3
{
  self->_forPickingFolders = a3;
}

- (void)setForMovingDocuments:(BOOL)a3
{
  self->_forMovingDocuments = a3;
}

- (void)setForPickingDownloadsFolder:(BOOL)a3
{
  self->_forPickingDownloadsFolder = a3;
}

- (BOOL)supportsRelatedFilesInPicker
{
  return self->_supportsRelatedFilesInPicker;
}

- (void)setSupportsRelatedFilesInPicker:(BOOL)a3
{
  self->_supportsRelatedFilesInPicker = a3;
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (BOOL)neverCreateBookmarkForOpenInPlace
{
  return self->_neverCreateBookmarkForOpenInPlace;
}

- (BOOL)pickingItemsShouldBumpLastOpenDate
{
  return self->_pickingItemsShouldBumpLastOpenDate;
}

- (BOOL)suppressBlackCallout
{
  return self->_suppressBlackCallout;
}

- (void)setSuppressBlackCallout:(BOOL)a3
{
  self->_suppressBlackCallout = a3;
}

- (void)setIsInUIPDocumentLanding:(BOOL)a3
{
  self->_isInUIPDocumentLanding = a3;
}

- (BOOL)shouldHideCatalystHostWindow
{
  return self->_shouldHideCatalystHostWindow;
}

- (void)setShouldHideCatalystHostWindow:(BOOL)a3
{
  self->_shouldHideCatalystHostWindow = a3;
}

- (BOOL)shouldOpenInApp
{
  return self->_shouldOpenInApp;
}

- (NSString)defaultEffectiveTabIdentifierForLocationRestore
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDefaultEffectiveTabIdentifierForLocationRestore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void)setCollectionSupportsDragAndDrop:(BOOL)a3
{
  self->_collectionSupportsDragAndDrop = a3;
}

- (void)setMaximumNumberOfItemsToFetch:(int64_t)a3
{
  self->_maximumNumberOfItemsToFetch = a3;
}

- (int64_t)maximumNumberOfRows
{
  return self->_maximumNumberOfRows;
}

- (void)setMaximumNumberOfRows:(int64_t)a3
{
  self->_maximumNumberOfRows = a3;
}

- (BOOL)skipDownload
{
  return self->_skipDownload;
}

- (void)setSkipDownload:(BOOL)a3
{
  self->_skipDownload = a3;
}

- (BOOL)presentingMakesCollectionFirstResponder
{
  return self->_presentingMakesCollectionFirstResponder;
}

- (void)setShowCollectionControls:(BOOL)a3
{
  self->_showCollectionControls = a3;
}

- (BOOL)supportsColumnView
{
  return self->_supportsColumnView;
}

- (void)setSupportsNavigationTitleMenus:(BOOL)a3
{
  self->_supportsNavigationTitleMenus = a3;
}

- (void)setShouldAdjustContentInset:(BOOL)a3
{
  self->_shouldAdjustContentInset = a3;
}

- (BOOL)useSharedQuickLook
{
  return self->_useSharedQuickLook;
}

- (BOOL)useExpandedSourceList
{
  return self->_useExpandedSourceList;
}

- (void)setBrowserViewContext:(unint64_t)a3
{
  self->_browserViewContext = a3;
}

- (void)setRoleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setForbiddenActionIdentifiers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (void)setThumbnailFetchingTimeOut:(double)a3
{
  self->_thumbnailFetchingTimeOut = a3;
}

void __63__DOCConfiguration_pickableContentTypesFromAllowedConversions___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_2090A2000, v3, OS_LOG_TYPE_ERROR, "%@ is not part of Image I/O Destination types so conversion not allowed", (uint8_t *)&v5, 0xCu);

}

@end
