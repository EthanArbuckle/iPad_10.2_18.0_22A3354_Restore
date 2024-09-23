@implementation FBKDeviceDiagnosticsController

- (FBKDeviceDiagnosticsController)initWithDeviceManager:(id)a3 delegate:(id)a4 filerForm:(id)a5 pendingFileUrls:(id)a6 pendingURLExtensions:(id)a7 draftDeviceIds:(id)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[FBKDeviceDiagnosticsController initWithDeviceManager:delegate:filerForm:pendingFileUrls:pendingURLExtensions:draftDeviceIds:attachmentDescriptors:autoGathersDiagnosticExtensions:](self, "initWithDeviceManager:delegate:filerForm:pendingFileUrls:pendingURLExtensions:draftDeviceIds:attachmentDescriptors:autoGathersDiagnosticExtensions:", a3, a4, a5, a6, a7, a8, 0, v9);
}

- (FBKDeviceDiagnosticsController)initWithDeviceManager:(id)a3 delegate:(id)a4 filerForm:(id)a5 pendingFileUrls:(id)a6 pendingURLExtensions:(id)a7 draftDeviceIds:(id)a8 attachmentDescriptors:(id)a9 autoGathersDiagnosticExtensions:(BOOL)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  FBKDeviceDiagnosticsController *v25;
  FBKDeviceDiagnosticsController *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSMutableDictionary *cachedDiffableIdentifiersTable;
  uint64_t v32;
  NSArray *attachmentCollections;
  uint64_t v34;
  NSMutableSet *attachmentsBeingAttached;
  uint64_t v36;
  NSSet *deferredAttachmentCollections;
  NSObject *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  _BOOL4 v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  _BOOL4 v88;
  void *v89;
  id v90;
  id v91;
  void *v92;
  void *v93;
  id v94;
  _BOOL4 v95;
  void *v96;
  void *v97;
  id v98;
  id obj;
  FBKDeviceDiagnosticsController *v100;
  _QWORD v101[4];
  FBKDeviceDiagnosticsController *v102;
  id v103;
  id v104;
  id v105;
  _QWORD v106[4];
  id v107;
  FBKDeviceDiagnosticsController *v108;
  id v109;
  id v110;
  id v111;
  BOOL v112;
  BOOL v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  objc_super v122;
  _BYTE v123[128];
  uint8_t v124[128];
  uint8_t buf[4];
  uint64_t v126;
  __int16 v127;
  void *v128;
  uint64_t v129;

  v129 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = v19;
  v98 = v20;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v122.receiver = self;
  v122.super_class = (Class)FBKDeviceDiagnosticsController;
  v25 = -[FBKDeviceDiagnosticsController init](&v122, sel_init);
  v26 = v25;
  if (v25)
  {
    v94 = v24;
    objc_storeStrong((id *)&v25->_deviceManager, a3);
    objc_storeStrong((id *)&v26->_filerForm, a5);
    objc_msgSend(v21, "filerFormID");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    if (v27)
      v29 = (void *)v27;
    else
      v29 = &unk_24E18CCE0;
    objc_storeStrong((id *)&v26->_filerFormID, v29);

    objc_storeWeak((id *)&v26->_delegate, v18);
    v30 = objc_opt_new();
    cachedDiffableIdentifiersTable = v26->_cachedDiffableIdentifiersTable;
    v26->_cachedDiffableIdentifiersTable = (NSMutableDictionary *)v30;

    v26->_addedCurrentDeviceNeedsMatcherPredicateEvaluation = 0;
    v26->_removeDeviceMaxRetry = 3;
    v32 = objc_opt_new();
    attachmentCollections = v26->_attachmentCollections;
    v26->_attachmentCollections = (NSArray *)v32;

    v34 = objc_opt_new();
    attachmentsBeingAttached = v26->_attachmentsBeingAttached;
    v26->_attachmentsBeingAttached = (NSMutableSet *)v34;

    v36 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 1);
    deferredAttachmentCollections = v26->_deferredAttachmentCollections;
    v26->_deferredAttachmentCollections = (NSSet *)v36;

    objc_storeStrong((id *)&v26->_attachmentDescriptors, a9);
    v26->_autoGathersDiagnosticExtensions = a10;
    if (a10)
    {
      Log_6();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21D9A9000, v38, OS_LOG_TYPE_INFO, "Will auto-gather all DiagnosticExtensions", buf, 2u);
      }

    }
    v97 = v21;
    v39 = v17;
    -[FBKDeviceDiagnosticsController createCombineObjectIfNeeded](v26, "createCombineObjectIfNeeded");
    -[FBKDeviceDiagnosticsController updateFilesBeingCopiedCountCancellable](v26, "updateFilesBeingCopiedCountCancellable");
    v40 = (void *)objc_opt_class();
    -[FBKDeviceDiagnosticsController filerForm](v26, "filerForm");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "matcherPredicates");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_opt_new();
    objc_msgSend(v40, "filteredMatcherPredicatesForMatchers:ignoredMatcherPredicates:", v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v96 = v44;
    objc_storeStrong((id *)&v26->_previousMatcherPredicates, v44);
    Log_6();
    v45 = objc_claimAutoreleasedReturnValue();
    v100 = v26;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v97, "filerFormID");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "unsignedLongValue");
      -[FBKDeviceDiagnosticsController previousMatcherPredicates](v26, "previousMatcherPredicates");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "description");
      v49 = v22;
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v126 = v47;
      v127 = 2114;
      v128 = v50;
      _os_log_impl(&dword_21D9A9000, v45, OS_LOG_TYPE_DEFAULT, "Initialized form [%lu] with Matcher Predicates %{public}@", buf, 0x16u);

      v22 = v49;
      v26 = v100;

    }
    v51 = (void *)MEMORY[0x24BDBCF20];
    -[FBKDeviceDiagnosticsController deviceManager](v26, "deviceManager");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "availableDevices");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setWithArray:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    v93 = v54;
    if (v23 && objc_msgSend(v23, "count"))
    {
      v91 = v39;
      v92 = v22;
      v90 = v18;
      Log_6();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v23, "description");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v126 = (uint64_t)v56;
        _os_log_impl(&dword_21D9A9000, v55, OS_LOG_TYPE_DEFAULT, "Initialized with draft devices [%{public}@]", buf, 0xCu);

      }
      v57 = (void *)objc_msgSend(v23, "mutableCopy");
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = 0u;
      v119 = 0u;
      v120 = 0u;
      v121 = 0u;
      v59 = v54;
      v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v118, v124, 16);
      if (v60)
      {
        v61 = v60;
        v62 = *(_QWORD *)v119;
        do
        {
          for (i = 0; i != v61; ++i)
          {
            if (*(_QWORD *)v119 != v62)
              objc_enumerationMutation(v59);
            v64 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * i);
            objc_msgSend(v64, "identifier");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = objc_msgSend(v23, "containsObject:", v65);

            if (v66)
            {
              objc_msgSend(v64, "identifier");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "addObject:", v67);

              objc_msgSend(v58, "addObject:", v64);
            }
          }
          v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v118, v124, 16);
        }
        while (v61);
      }

      v68 = (void *)objc_msgSend(v23, "mutableCopy");
      objc_msgSend(v68, "minusSet:", v57);
      if (objc_msgSend(v68, "count"))
      {
        Log_6();
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v126 = (uint64_t)v68;
          _os_log_impl(&dword_21D9A9000, v69, OS_LOG_TYPE_DEFAULT, "Did not match draft device identifiers [%{public}@]", buf, 0xCu);
        }

      }
      v89 = v68;
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", v96);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = 0u;
      v115 = 0u;
      v116 = 0u;
      v117 = 0u;
      obj = v58;
      v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v123, 16);
      if (v71)
      {
        v72 = v71;
        v73 = *(_QWORD *)v115;
LABEL_30:
        v74 = 0;
        while (1)
        {
          if (*(_QWORD *)v115 != v73)
            objc_enumerationMutation(obj);
          v75 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * v74);
          v76 = (void *)objc_opt_class();
          -[FBKDeviceDiagnosticsController formPlatform](v100, "formPlatform");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "matchersForDevice:withGivenMatchers:canMatchVisibleDevices:fromCollection:formPlatform:", v75, v70, 1, 0, v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v70, "minusSet:", v78);
          v79 = objc_msgSend(v70, "count");

          if (!v79)
            break;
          if (v72 == ++v74)
          {
            v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v123, 16);
            if (v72)
              goto LABEL_30;
            break;
          }
        }
      }

      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", v59);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "minusSet:", obj);
      -[FBKDeviceDiagnosticsController devicesMatching:withConfiguredDevices:](v100, "devicesMatching:withConfiguredDevices:", v70, v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v97, "filerFormType") != 1 || objc_msgSend(v97, "type") == 7;
      v88 = v82;
      v24 = v94;
      v95 = objc_msgSend(v97, "filerFormType") == 1 && objc_msgSend(v97, "type") == 7;
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v81);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "setByAddingObjectsFromSet:", obj);
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)objc_msgSend(v81, "count") < 2)
      {
        -[FBKDeviceDiagnosticsController finishInitializationWithChosenDevices:matcherPredicates:pendingFileUrls:pendingURLExtensions:shouldGetSessionStatus:shouldCheckForDeferredDiagnostics:](v100, "finishInitializationWithChosenDevices:matcherPredicates:pendingFileUrls:pendingURLExtensions:shouldGetSessionStatus:shouldCheckForDeferredDiagnostics:", v86, v96, v98, v92, v88, v95);
      }
      else
      {
        v106[0] = MEMORY[0x24BDAC760];
        v106[1] = 3221225472;
        v106[2] = __181__FBKDeviceDiagnosticsController_initWithDeviceManager_delegate_filerForm_pendingFileUrls_pendingURLExtensions_draftDeviceIds_attachmentDescriptors_autoGathersDiagnosticExtensions___block_invoke;
        v106[3] = &unk_24E15A8A8;
        v107 = obj;
        v108 = v100;
        v109 = v96;
        v110 = v98;
        v111 = v92;
        v112 = v88;
        v113 = v95;
        -[FBKDeviceDiagnosticsController requestDeviceChoiceButDontBeAnnoyingWithGivenDeviceChoices:matcherPredicates:needsChoices:](v108, "requestDeviceChoiceButDontBeAnnoyingWithGivenDeviceChoices:matcherPredicates:needsChoices:", v81, v109, v106);

      }
      v18 = v90;

      v39 = v91;
      v22 = v92;
      v26 = v100;
      v84 = v96;
    }
    else
    {
      sub_21DA7533C(v26, "currentMatcherPredicates");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKDeviceDiagnosticsController devicesMatching:withConfiguredDevices:](v26, "devicesMatching:withConfiguredDevices:", v83, v54);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = v94;
      if ((unint64_t)objc_msgSend(v57, "count") < 2)
      {
        v84 = v96;
        -[FBKDeviceDiagnosticsController finishInitializationWithChosenDevices:matcherPredicates:pendingFileUrls:pendingURLExtensions:](v26, "finishInitializationWithChosenDevices:matcherPredicates:pendingFileUrls:pendingURLExtensions:", v57, v96, v98, v22);
      }
      else
      {
        v101[0] = MEMORY[0x24BDAC760];
        v101[1] = 3221225472;
        v101[2] = __181__FBKDeviceDiagnosticsController_initWithDeviceManager_delegate_filerForm_pendingFileUrls_pendingURLExtensions_draftDeviceIds_attachmentDescriptors_autoGathersDiagnosticExtensions___block_invoke_2;
        v101[3] = &unk_24E15A8D0;
        v102 = v26;
        v84 = v96;
        v103 = v96;
        v104 = v98;
        v105 = v22;
        -[FBKDeviceDiagnosticsController requestDeviceChoiceButDontBeAnnoyingWithGivenDeviceChoices:matcherPredicates:needsChoices:](v102, "requestDeviceChoiceButDontBeAnnoyingWithGivenDeviceChoices:matcherPredicates:needsChoices:", v57, v103, v101);

      }
    }

    v17 = v39;
    v21 = v97;
  }

  return v26;
}

void __181__FBKDeviceDiagnosticsController_initWithDeviceManager_delegate_filerForm_pendingFileUrls_pendingURLExtensions_draftDeviceIds_attachmentDescriptors_autoGathersDiagnosticExtensions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "finishInitializationWithChosenDevices:matcherPredicates:pendingFileUrls:pendingURLExtensions:shouldGetSessionStatus:shouldCheckForDeferredDiagnostics:", v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(unsigned __int8 *)(a1 + 73));
}

uint64_t __181__FBKDeviceDiagnosticsController_initWithDeviceManager_delegate_filerForm_pendingFileUrls_pendingURLExtensions_draftDeviceIds_attachmentDescriptors_autoGathersDiagnosticExtensions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishInitializationWithChosenDevices:matcherPredicates:pendingFileUrls:pendingURLExtensions:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)setAttachmentCollections:(id)a3
{
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_attachmentCollections, a3);
  -[FBKDeviceDiagnosticsController filerForm](self, "filerForm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[FBKDeviceDiagnosticsController filerForm](self, "filerForm");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKDeviceDiagnosticsController updateAttachmentCollectionObserver:formResponse:](self, "updateAttachmentCollectionObserver:formResponse:", v8, v7);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FBKDeviceDiagnosticsController;
  -[FBKDeviceDiagnosticsController dealloc](&v4, sel_dealloc);
}

- (void)setState:(int64_t)a3
{
  int64_t state;
  id v6;

  state = self->_state;
  self->_state = a3;
  -[FBKDeviceDiagnosticsController updateStatePublisher](self, "updateStatePublisher");
  if (state != a3)
  {
    -[FBKDeviceDiagnosticsController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceDiagnosticsController:didChangeState:", self, a3);

  }
}

- (void)setFilesBeingAttachedCount:(int64_t)a3
{
  int64_t filesBeingAttachedCount;
  id v5;

  filesBeingAttachedCount = self->_filesBeingAttachedCount;
  self->_filesBeingAttachedCount = a3;
  if (filesBeingAttachedCount != a3)
  {
    -[FBKDeviceDiagnosticsController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceDiagnosticsController:didChangeState:", self, -[FBKDeviceDiagnosticsController state](self, "state"));

  }
}

- (FBKDeviceDiagnosticsDelegate)delegate
{
  return (FBKDeviceDiagnosticsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (FBKDeviceManager)deviceManager
{
  return self->_deviceManager;
}

- (void)setDeviceManager:(id)a3
{
  objc_storeStrong((id *)&self->_deviceManager, a3);
}

- (FBKFilerForm)filerForm
{
  return self->_filerForm;
}

- (void)setFilerForm:(id)a3
{
  objc_storeStrong((id *)&self->_filerForm, a3);
}

- (NSMutableDictionary)cachedDiffableIdentifiersTable
{
  return self->_cachedDiffableIdentifiersTable;
}

- (void)setCachedDiffableIdentifiersTable:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDiffableIdentifiersTable, a3);
}

- (NSArray)attachmentDescriptors
{
  return self->_attachmentDescriptors;
}

- (void)setAttachmentDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentDescriptors, a3);
}

- (BOOL)autoGathersDiagnosticExtensions
{
  return self->_autoGathersDiagnosticExtensions;
}

- (void)setAutoGathersDiagnosticExtensions:(BOOL)a3
{
  self->_autoGathersDiagnosticExtensions = a3;
}

- (NSSet)previousMatcherPredicates
{
  return self->_previousMatcherPredicates;
}

- (void)setPreviousMatcherPredicates:(id)a3
{
  objc_storeStrong((id *)&self->_previousMatcherPredicates, a3);
}

- (NSSet)currentMatcherPredicates
{
  return self->_currentMatcherPredicates;
}

- (NSString)formPlatform
{
  return self->_formPlatform;
}

- (NSSet)removedDevices
{
  return self->_removedDevices;
}

- (void)setRemovedDevices:(id)a3
{
  objc_storeStrong((id *)&self->_removedDevices, a3);
}

- (NSSet)ignoredMatchers
{
  return self->_ignoredMatchers;
}

- (void)setIgnoredMatchers:(id)a3
{
  objc_storeStrong((id *)&self->_ignoredMatchers, a3);
}

- (BOOL)addedCurrentDeviceNeedsMatcherPredicateEvaluation
{
  return self->_addedCurrentDeviceNeedsMatcherPredicateEvaluation;
}

- (void)setAddedCurrentDeviceNeedsMatcherPredicateEvaluation:(BOOL)a3
{
  self->_addedCurrentDeviceNeedsMatcherPredicateEvaluation = a3;
}

- (NSArray)attachmentCollections
{
  return self->_attachmentCollections;
}

- (NSSet)deferredAttachmentCollections
{
  return self->_deferredAttachmentCollections;
}

- (void)setDeferredAttachmentCollections:(id)a3
{
  objc_storeStrong((id *)&self->_deferredAttachmentCollections, a3);
}

- (id)deviceDiagnosticsCombineObject
{
  return self->_deviceDiagnosticsCombineObject;
}

- (void)setDeviceDiagnosticsCombineObject:(id)a3
{
  objc_storeStrong(&self->_deviceDiagnosticsCombineObject, a3);
}

- (id)filesBeingCopiedCount
{
  return self->_filesBeingCopiedCount;
}

- (void)setFilesBeingCopiedCount:(id)a3
{
  objc_storeStrong(&self->_filesBeingCopiedCount, a3);
}

- (id)_filesBeingAttachedCount
{
  return self->__filesBeingAttachedCount;
}

- (void)set_filesBeingAttachedCount:(id)a3
{
  objc_storeStrong(&self->__filesBeingAttachedCount, a3);
}

- (int64_t)filesBeingAttachedCount
{
  return self->_filesBeingAttachedCount;
}

- (NSMutableSet)attachmentsBeingAttached
{
  return self->_attachmentsBeingAttached;
}

- (void)setAttachmentsBeingAttached:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentsBeingAttached, a3);
}

- (NSNumber)filerFormID
{
  return self->_filerFormID;
}

- (void)setFilerFormID:(id)a3
{
  objc_storeStrong((id *)&self->_filerFormID, a3);
}

- (int64_t)removeDeviceMaxRetry
{
  return self->_removeDeviceMaxRetry;
}

- (void)setRemoveDeviceMaxRetry:(int64_t)a3
{
  self->_removeDeviceMaxRetry = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filerFormID, 0);
  objc_storeStrong((id *)&self->_attachmentsBeingAttached, 0);
  objc_storeStrong(&self->__filesBeingAttachedCount, 0);
  objc_storeStrong(&self->_filesBeingCopiedCount, 0);
  objc_storeStrong(&self->_deviceDiagnosticsCombineObject, 0);
  objc_storeStrong((id *)&self->_deferredAttachmentCollections, 0);
  objc_storeStrong((id *)&self->_attachmentCollections, 0);
  objc_storeStrong((id *)&self->_ignoredMatchers, 0);
  objc_storeStrong((id *)&self->_removedDevices, 0);
  objc_storeStrong((id *)&self->_formPlatform, 0);
  objc_storeStrong((id *)&self->_currentMatcherPredicates, 0);
  objc_storeStrong((id *)&self->_previousMatcherPredicates, 0);
  objc_storeStrong((id *)&self->_attachmentDescriptors, 0);
  objc_storeStrong((id *)&self->_cachedDiffableIdentifiersTable, 0);
  objc_storeStrong((id *)&self->_filerForm, 0);
  objc_storeStrong((id *)&self->_deviceManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSArray)devicesInPlay
{
  return (NSArray *)sub_21DA7E27C(self, (uint64_t)a2, (void (*)(void))FBKDeviceDiagnosticsController.devicesInPlay.getter);
}

- (void)createCombineObjectIfNeeded
{
  FBKDeviceDiagnosticsController *v2;

  v2 = self;
  sub_21DA75474();

}

- (void)finishInitializationWithChosenDevices:(id)a3 matcherPredicates:(id)a4 pendingFileUrls:(id)a5 pendingURLExtensions:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  FBKDeviceDiagnosticsController *v13;

  sub_21DA3BF58(0, &qword_255399B70);
  v9 = MEMORY[0x24BEE5BD8];
  sub_21DA3BF18((unint64_t *)&qword_255399DE0, &qword_255399B70, (uint64_t)off_24E155B98, MEMORY[0x24BEE5BD8]);
  v10 = sub_21DAC49D8();
  sub_21DA3BF58(0, &qword_255399140);
  sub_21DA3BF18(&qword_255399240, &qword_255399140, (uint64_t)off_24E155BF0, v9);
  v11 = sub_21DAC49D8();
  if (a5)
  {
    sub_21DAC3E44();
    a5 = (id)sub_21DAC47EC();
  }
  if (a6)
  {
    sub_21DA3BF58(0, &qword_255399F68);
    sub_21DA3BF18(&qword_255399F70, &qword_255399F68, (uint64_t)off_24E155D28, MEMORY[0x24BEE5BD8]);
    v12 = sub_21DAC49D8();
  }
  else
  {
    v12 = 0;
  }
  v13 = self;
  sub_21DA75554(v10, v11, a5, v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)finishInitializationWithChosenDevices:(id)a3 matcherPredicates:(id)a4 pendingFileUrls:(id)a5 pendingURLExtensions:(id)a6 shouldGetSessionStatus:(BOOL)a7 shouldCheckForDeferredDiagnostics:(BOOL)a8
{
  uint64_t v12;
  void *v13;
  uint64_t v14;
  FBKDeviceDiagnosticsController *v15;

  sub_21DA3BF58(0, &qword_255399B70);
  v12 = MEMORY[0x24BEE5BD8];
  sub_21DA3BF18((unint64_t *)&qword_255399DE0, &qword_255399B70, (uint64_t)off_24E155B98, MEMORY[0x24BEE5BD8]);
  v13 = (void *)sub_21DAC49D8();
  sub_21DA3BF58(0, &qword_255399140);
  sub_21DA3BF18(&qword_255399240, &qword_255399140, (uint64_t)off_24E155BF0, v12);
  v14 = sub_21DAC49D8();
  if (a5)
  {
    sub_21DAC3E44();
    a5 = (id)sub_21DAC47EC();
  }
  if (a6)
  {
    sub_21DA3BF58(0, &qword_255399F68);
    sub_21DA3BF18(&qword_255399F70, &qword_255399F68, (uint64_t)off_24E155D28, MEMORY[0x24BEE5BD8]);
    a6 = (id)sub_21DAC49D8();
  }
  v15 = self;
  sub_21DA758CC(v13, v14, (uint64_t)a5, (uint64_t)a6, a7, a8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)requestDeviceChoiceButDontBeAnnoyingWithGivenDeviceChoices:(id)a3 matcherPredicates:(id)a4 needsChoices:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  FBKDeviceDiagnosticsController *v10;

  v6 = _Block_copy(a5);
  sub_21DA3BF58(0, &qword_255399B70);
  v7 = MEMORY[0x24BEE5BD8];
  sub_21DA3BF18((unint64_t *)&qword_255399DE0, &qword_255399B70, (uint64_t)off_24E155B98, MEMORY[0x24BEE5BD8]);
  v8 = sub_21DAC49D8();
  sub_21DA3BF58(0, &qword_255399140);
  sub_21DA3BF18(&qword_255399240, &qword_255399140, (uint64_t)off_24E155BF0, v7);
  v9 = sub_21DAC49D8();
  _Block_copy(v6);
  v10 = self;
  sub_21DA8D3BC(v8, v9, v10, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)reevaluateMatcherPredicates
{
  FBKDeviceDiagnosticsController *v2;

  v2 = self;
  FBKDeviceDiagnosticsController.reevaluateMatcherPredicates()();

}

- (id)devicesMatching:(id)a3 withConfiguredDevices:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  FBKDeviceDiagnosticsController *v8;
  void *v9;

  sub_21DA3BF58(0, &qword_255399140);
  v5 = MEMORY[0x24BEE5BD8];
  sub_21DA3BF18(&qword_255399240, &qword_255399140, (uint64_t)off_24E155BF0, MEMORY[0x24BEE5BD8]);
  v6 = sub_21DAC49D8();
  sub_21DA3BF58(0, &qword_255399B70);
  sub_21DA3BF18((unint64_t *)&qword_255399DE0, &qword_255399B70, (uint64_t)off_24E155B98, v5);
  v7 = sub_21DAC49D8();
  v8 = self;
  sub_21DA903F0(v7, v6, v8);
  swift_bridgeObjectRelease();

  v9 = (void *)sub_21DAC49CC();
  swift_release();
  return v9;
}

- (BOOL)hasAttachmentsCollecting
{
  FBKDeviceDiagnosticsController *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = FBKDeviceDiagnosticsController.hasAttachmentsCollecting()();

  return v3;
}

- (id)attachmentsForDevice:(id)a3
{
  id v4;
  FBKDeviceDiagnosticsController *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  FBKDeviceDiagnosticsController.attachmentsForDevice(_:)(v4);

  sub_21DA3BF58(0, (unint64_t *)&unk_255399230);
  v6 = (void *)sub_21DAC4960();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)abortAllSessions
{
  FBKDeviceDiagnosticsController *v2;

  v2 = self;
  FBKDeviceDiagnosticsController.abortAllSessions()();

}

- (void)addAttachmentWithItemProvider:(id)a3
{
  id v4;
  FBKDeviceDiagnosticsController *v5;

  v4 = a3;
  v5 = self;
  FBKDeviceDiagnosticsController.addAttachment(itemProvider:)((NSItemProvider)v4);

}

- (void)moveFileFrom:(id)a3
{
  sub_21DA7BE64(self, (uint64_t)a2, (uint64_t)a3, 1);
}

- (void)copyFileFrom:(id)a3
{
  sub_21DA7BE64(self, (uint64_t)a2, (uint64_t)a3, 0);
}

- (BOOL)hasUnmetRequirementAttachments
{
  FBKDeviceDiagnosticsController *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = FBKDeviceDiagnosticsController.hasUnmetRequirementAttachments()();

  return v3;
}

- (BOOL)deviceHasAnyAttachmentsWithDevice:(id)a3
{
  objc_class *v4;
  FBKDeviceDiagnosticsController *v5;
  FBKGroupedDevice v6;

  v4 = (objc_class *)a3;
  v5 = self;
  v6.super.isa = v4;
  LOBYTE(self) = FBKDeviceDiagnosticsController.deviceHasAnyAttachments(device:)(v6);

  return self & 1;
}

- (void)removeDevice:(id)a3
{
  id v4;
  FBKDeviceDiagnosticsController *v5;

  v4 = a3;
  v5 = self;
  sub_21DA7C1AC(v4, 0);

}

- (void)postLaunchAttachLocalFiles:(id)a3
{
  uint64_t v4;
  FBKDeviceDiagnosticsController *v5;

  sub_21DAC3E44();
  v4 = sub_21DAC47EC();
  v5 = self;
  FBKDeviceDiagnosticsController.postLaunchAttachLocalFiles(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)gatherAllMissingRequirementsWithAnswers:(id)a3
{
  void *v4;
  FBKDeviceDiagnosticsController *v5;
  Swift::OpaquePointer_optional v6;

  if (a3)
    v4 = (void *)sub_21DAC47EC();
  else
    v4 = 0;
  v5 = self;
  v6.value._rawValue = v4;
  FBKDeviceDiagnosticsController.gatherAllMissingRequirements(answers:)(v6);

  swift_bridgeObjectRelease();
}

- (void)gatherAttachment:(id)a3 answers:(id)a4
{
  uint64_t v6;
  FBKAttachment *v7;
  FBKDeviceDiagnosticsController *v8;

  v6 = sub_21DAC47EC();
  v7 = (FBKAttachment *)a3;
  v8 = self;
  FBKDeviceDiagnosticsController.gatherAttachment(_:answers:)(v7, (Swift::OpaquePointer)v6);

  swift_bridgeObjectRelease();
}

- (BOOL)canCancelAttachmentCollection:(id)a3
{
  id v4;
  FBKDeviceDiagnosticsController *v5;
  NSArray *v6;
  unint64_t v7;
  id v8;
  FBKDeviceDiagnosticsController *v9;
  id v10;
  unsigned __int8 v11;

  v4 = a3;
  v5 = self;
  v6 = -[FBKDeviceDiagnosticsController attachmentCollections](v5, sel_attachmentCollections);
  sub_21DA3BF58(0, (unint64_t *)&unk_255399DC0);
  v7 = sub_21DAC496C();

  v8 = v4;
  v9 = (FBKDeviceDiagnosticsController *)sub_21DA895C8(v7);
  swift_bridgeObjectRelease();

  if (v9)
  {
    v10 = -[FBKDeviceDiagnosticsController attachmentManager](v9, sel_attachmentManager);
    v11 = objc_msgSend(v10, sel_canCancelAttachmentCollection_, v8);

    v8 = v10;
    v5 = v9;
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)removeAllAttachments
{
  FBKDeviceDiagnosticsController *v2;

  v2 = self;
  FBKDeviceDiagnosticsController.removeAllAttachments()();

}

- (BOOL)hasAnyAttachments
{
  FBKDeviceDiagnosticsController *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = FBKDeviceDiagnosticsController.hasAnyAttachments()();

  return v3;
}

- (BOOL)hasAttachmentsForUpload
{
  FBKDeviceDiagnosticsController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = FBKDeviceDiagnosticsController.hasAttachmentsForUpload.getter();

  return v3 & 1;
}

- (BOOL)removeAttachment:(id)a3
{
  id v4;
  FBKDeviceDiagnosticsController *v5;
  NSArray *v6;
  unint64_t v7;
  FBKAttachment *v8;
  FBKAttachment *v9;
  FBKDeviceDiagnosticsController *v10;
  Swift::Bool v11;

  v4 = a3;
  v5 = self;
  v6 = -[FBKDeviceDiagnosticsController attachmentCollections](v5, sel_attachmentCollections);
  sub_21DA3BF58(0, (unint64_t *)&unk_255399DC0);
  v7 = sub_21DAC496C();

  v8 = (FBKAttachment *)v4;
  v9 = (FBKAttachment *)sub_21DA895C8(v7);
  swift_bridgeObjectRelease();

  if (v9)
  {
    v10 = (FBKDeviceDiagnosticsController *)-[FBKAttachment attachmentManager](v9, sel_attachmentManager);
    v11 = FBKAttachmentManager.removeAttachment(_:)(v8);

    v8 = v9;
    v5 = v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)canDeleteAttachment:(id)a3
{
  return objc_msgSend(a3, sel_canBeDeleted);
}

- (id)unreachableDevicesInPlay
{
  return sub_21DA7E27C(self, (uint64_t)a2, FBKDeviceDiagnosticsController.unreachableDevicesInPlay());
}

- (BOOL)canRemoveDevice:(id)a3
{
  objc_class *v4;
  FBKDeviceDiagnosticsController *v5;
  FBKGroupedDevice v6;

  v4 = (objc_class *)a3;
  v5 = self;
  v6.super.isa = v4;
  LOBYTE(self) = FBKDeviceDiagnosticsController.canRemoveDevice(_:)(v6);

  return self & 1;
}

- (void)addDevice:(id)a3
{
  id v4;
  FBKDeviceDiagnosticsController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_21DA7B268(v4, 1);

}

- (id)additionalDeviceCandidates
{
  FBKDeviceDiagnosticsController *v2;
  void *v3;

  v2 = self;
  FBKDeviceDiagnosticsController.additionalDeviceCandidates()();

  sub_21DA3BF58(0, &qword_255399B70);
  sub_21DA3BF18((unint64_t *)&qword_255399DE0, &qword_255399B70, (uint64_t)off_24E155B98, MEMORY[0x24BEE5BD8]);
  v3 = (void *)sub_21DAC49CC();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)generateSnapshotIdentifiersTrackingLastDevice:(BOOL)a3
{
  _BOOL4 v3;
  FBKDeviceDiagnosticsController *v4;
  void *v5;

  v3 = a3;
  v4 = self;
  FBKDeviceDiagnosticsController.generateSnapshotIdentifiers(shouldTrackLastDevice:)(v3);

  v5 = (void *)sub_21DAC4960();
  swift_bridgeObjectRelease();
  return v5;
}

- (id)generateSectionIdentifierGroupsWithDeviceSectionPrefix:(id)a3 deferredDeviceSectionPrefix:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  FBKDeviceDiagnosticsController *v11;
  void *v12;

  v5 = sub_21DAC481C();
  v7 = v6;
  v8 = sub_21DAC481C();
  v10 = v9;
  v11 = self;
  FBKDeviceDiagnosticsController.generateSectionIdentifierGroups(deviceSectionPrefix:deferredDeviceSectionPrefix:)(v5, v7, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21DA3BF58(0, (unint64_t *)&unk_255399F38);
  v12 = (void *)sub_21DAC4960();
  swift_bridgeObjectRelease();
  return v12;
}

- (id)maybeAttachmentWithIdentifier:(id)a3
{
  return sub_21DA809FC(self);
}

- (id)maybeDeviceWithIdentifier:(id)a3
{
  return sub_21DA809FC(self);
}

- (void)updateAttachmentCollectionObserver:(id)a3 formResponse:(id)a4
{
  id v5;
  FBKDeviceDiagnosticsController *v6;
  _TtC12FeedbackCore37FBKDeviceDiagnosticsControllerCombine *v7;

  v5 = a4;
  v6 = self;
  v7 = -[FBKDeviceDiagnosticsController combine](v6, sel_combine);
  sub_21DA74554(v5);

}

- (void)attachmentManager:(id)a3 didStartAttaching:(id)a4
{
  id v6;
  id v7;
  FBKDeviceDiagnosticsController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_21DA91390((uint64_t)v7);

}

- (void)attachmentManager:(id)a3 didFinishAttaching:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  FBKDeviceDiagnosticsController *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_21DA914CC((uint64_t)v9, a5);

}

- (void)attachmentManager:(id)a3 didRemoveAttachment:(id)a4 atIndex:(int64_t)a5
{
  id v7;
  id v8;
  FBKDeviceDiagnosticsController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_21DA916D0(v8);

}

- (void)attachmentManager:(id)a3 didAddAttachment:(id)a4 atIndex:(int64_t)a5
{
  id v7;
  id v8;
  FBKDeviceDiagnosticsController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_21DA918A4(v8, (SEL *)&selRef_deviceDiagnosticsController_didAddAttachment_toDevice_);

}

- (void)attachmentManager:(id)a3 didUpdateAttachment:(id)a4 atIndex:(int64_t)a5
{
  id v7;
  id v8;
  FBKDeviceDiagnosticsController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_21DA918A4(v8, (SEL *)&selRef_deviceDiagnosticsController_didUpdateAttachment_onDevice_);

}

- (void)attachmentManager:(id)a3 didStartBugSessionsForDevice:(id)a4 success:(BOOL)a5
{
  id v8;
  id v9;
  FBKDeviceDiagnosticsController *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_21DA91A1C(v9, a5);

}

- (BOOL)hasFilePromises
{
  FBKDeviceDiagnosticsController *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = FBKDeviceDiagnosticsController.hasFilePromises()();

  return v3;
}

- (void)commitAllFilesForForm:(id)a3 withCompletion:(id)a4
{
  void *v6;
  uint64_t v7;
  FBKDeviceDiagnosticsController *v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  swift_unknownObjectRetain();
  v8 = self;
  FBKDeviceDiagnosticsController.commitAllFiles(for:withCompletion:)((uint64_t)a3, (uint64_t)sub_21DA92054, v7);
  swift_unknownObjectRelease();

  swift_release();
}

- (id)deviceDataForSubmission
{
  FBKDeviceDiagnosticsController *v2;
  unint64_t v3;
  FBKDeviceDiagnosticsController *v4;
  void *v5;

  v2 = self;
  v3 = sub_21DA74FEC();
  v4 = v2;
  sub_21DA88180(v3, v4);
  swift_bridgeObjectRelease();

  __swift_instantiateConcreteTypeFromMangledName(&qword_255399F30);
  v5 = (void *)sub_21DAC4960();
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)removeDuplicateMatcherPredicatesWithDevice:(id)a3 matchers:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;

  sub_21DA3BF58(0, &qword_255399140);
  sub_21DA3BF18(&qword_255399240, &qword_255399140, (uint64_t)off_24E155BF0, MEMORY[0x24BEE5BD8]);
  v5 = sub_21DAC49D8();
  v6 = a3;
  sub_21DA72538(MEMORY[0x24BEE4B08], v5);

  swift_bridgeObjectRelease();
  v7 = (void *)sub_21DAC49CC();
  swift_bridgeObjectRelease();
  return v7;
}

+ (id)filteredMatcherPredicatesForMatchers:(id)a3 ignoredMatcherPredicates:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  sub_21DA3BF58(0, &qword_255399140);
  sub_21DA3BF18(&qword_255399240, &qword_255399140, (uint64_t)off_24E155BF0, MEMORY[0x24BEE5BD8]);
  v4 = sub_21DAC49D8();
  v5 = sub_21DAC49D8();
  sub_21DA8CDDC(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = (void *)sub_21DAC49CC();
  swift_bridgeObjectRelease();
  return v6;
}

+ (BOOL)device:(id)a3 matchesAnyPredicate:(id)a4 fromCollection:(id)a5 formPlatform:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  sub_21DA3BF58(0, &qword_255399140);
  sub_21DA3BF18(&qword_255399240, &qword_255399140, (uint64_t)off_24E155BF0, MEMORY[0x24BEE5BD8]);
  v9 = sub_21DAC49D8();
  if (a6)
  {
    v10 = sub_21DAC481C();
    a6 = v11;
  }
  else
  {
    v10 = 0;
  }
  v12 = a3;
  v13 = a5;
  v14 = sub_21DA8B350(v12, v9, 0, a5, v10, (uint64_t)a6);
  if ((v14 & 0xC000000000000001) != 0)
    v15 = sub_21DAC4C30();
  else
    v15 = *(_QWORD *)(v14 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v15 > 0;
}

+ (id)matchersForDevice:(id)a3 withGivenMatchers:(id)a4 canMatchVisibleDevices:(BOOL)a5 fromCollection:(id)a6 formPlatform:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;

  sub_21DA3BF58(0, &qword_255399140);
  sub_21DA3BF18(&qword_255399240, &qword_255399140, (uint64_t)off_24E155BF0, MEMORY[0x24BEE5BD8]);
  v11 = sub_21DAC49D8();
  if (a7)
  {
    v12 = sub_21DAC481C();
    a7 = v13;
  }
  else
  {
    v12 = 0;
  }
  v14 = a3;
  v15 = a6;
  sub_21DA8B350(v14, v11, a5, a6, v12, (uint64_t)a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v16 = (void *)sub_21DAC49CC();
  swift_bridgeObjectRelease();
  return v16;
}

+ (id)currentDeviceBiased_MatcherPredicatesForDevice:(id)a3 withGivenMatchers:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;

  sub_21DA3BF58(0, &qword_255399140);
  sub_21DA3BF18(&qword_255399240, &qword_255399140, (uint64_t)off_24E155BF0, MEMORY[0x24BEE5BD8]);
  v5 = sub_21DAC49D8();
  v6 = a3;
  sub_21DA8A374(v5, v6);

  v7 = (void *)sub_21DAC49CC();
  swift_release();
  return v7;
}

+ (id)currentDeviceAttachmentManagerWithDeviceAttachments:(id)a3
{
  unint64_t v3;
  id v4;

  sub_21DA3BF58(0, (unint64_t *)&unk_255399DC0);
  v3 = sub_21DAC496C();
  v4 = sub_21DA91C44(v3);
  swift_bridgeObjectRelease();
  return v4;
}

- (void)updateStatePublisher
{
  FBKDeviceDiagnosticsController *v2;
  _TtC12FeedbackCore37FBKDeviceDiagnosticsControllerCombine *v3;

  v2 = self;
  v3 = -[FBKDeviceDiagnosticsController combine](v2, sel_combine);
  swift_beginAccess();
  swift_retain();

  -[FBKDeviceDiagnosticsController state](v2, sel_state);
  sub_21DAC4138();

  swift_release();
}

- (_TtC12FeedbackCore37FBKDeviceDiagnosticsControllerCombine)combine
{
  FBKDeviceDiagnosticsController *v2;
  _TtC12FeedbackCore37FBKDeviceDiagnosticsControllerCombine *result;
  void *v4;
  __int128 v5;
  __int128 v6;

  v2 = self;
  result = (_TtC12FeedbackCore37FBKDeviceDiagnosticsControllerCombine *)-[FBKDeviceDiagnosticsController deviceDiagnosticsCombineObject](v2, sel_deviceDiagnosticsCombineObject);
  if (result)
  {
    sub_21DAC4BB8();
    swift_unknownObjectRelease();
    sub_21DA3B9B0(&v5, &v6);
    type metadata accessor for FBKDeviceDiagnosticsControllerCombine();
    swift_dynamicCast();

    return (_TtC12FeedbackCore37FBKDeviceDiagnosticsControllerCombine *)v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (DEDBugSession)currentDeviceBugSession
{
  FBKDeviceDiagnosticsController *v2;
  NSArray *v3;
  unint64_t v4;
  id v5;
  id v6;
  id v7;

  v2 = self;
  v3 = -[FBKDeviceDiagnosticsController attachmentCollections](v2, sel_attachmentCollections);
  sub_21DA3BF58(0, (unint64_t *)&unk_255399DC0);
  v4 = sub_21DAC496C();

  v5 = sub_21DA91C44(v4);
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v5, sel_deCollector);
  v7 = objc_msgSend(v6, sel_bugSession);

  return (DEDBugSession *)v7;
}

- (FBKAttachmentManager)currentDeviceAttachmentManager
{
  FBKDeviceDiagnosticsController *v2;
  NSArray *v3;
  unint64_t v4;
  id v5;

  v2 = self;
  v3 = -[FBKDeviceDiagnosticsController attachmentCollections](v2, sel_attachmentCollections);
  sub_21DA3BF58(0, (unint64_t *)&unk_255399DC0);
  v4 = sub_21DAC496C();

  v5 = sub_21DA91C44(v4);
  swift_bridgeObjectRelease();
  return (FBKAttachmentManager *)v5;
}

- (id)trailingSwipeActionConfigurationWithDevice:(id)a3 fromViewController:(id)a4
{
  return -[FBKDeviceDiagnosticsController trailingSwipeActionConfigurationWithAttachment:orDevice:fromViewController:](self, sel_trailingSwipeActionConfigurationWithAttachment_orDevice_fromViewController_, 0, a3, a4);
}

- (id)trailingSwipeActionConfigurationWithAttachment:(id)a3 fromViewController:(id)a4
{
  return -[FBKDeviceDiagnosticsController trailingSwipeActionConfigurationWithAttachment:orDevice:fromViewController:](self, sel_trailingSwipeActionConfigurationWithAttachment_orDevice_fromViewController_, a3, 0, a4);
}

- (id)trailingSwipeActionConfigurationWithAttachment:(id)a3 orDevice:(id)a4 fromViewController:(id)a5
{
  id v9;
  id v10;
  id v11;
  FBKDeviceDiagnosticsController *v12;
  id v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = self;
  v13 = sub_21DAA48FC(a3, a4, v11);

  return v13;
}

@end
