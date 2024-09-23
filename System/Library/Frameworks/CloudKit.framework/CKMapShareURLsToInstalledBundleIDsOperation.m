@implementation CKMapShareURLsToInstalledBundleIDsOperation

- (CKMapShareURLsToInstalledBundleIDsOperation)init
{
  CKMapShareURLsToInstalledBundleIDsOperation *v2;
  uint64_t v3;
  NSMutableArray *specialURLs;
  uint64_t v5;
  NSMutableArray *genericURLs;
  uint64_t v7;
  NSMutableDictionary *errorsByURL;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKMapShareURLsToInstalledBundleIDsOperation;
  v2 = -[CKOperation init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    specialURLs = v2->_specialURLs;
    v2->_specialURLs = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    genericURLs = v2->_genericURLs;
    v2->_genericURLs = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    errorsByURL = v2->_errorsByURL;
    v2->_errorsByURL = (NSMutableDictionary *)v7;

  }
  return v2;
}

- (CKMapShareURLsToInstalledBundleIDsOperation)initWithShareURLs:(id)a3 returnLocalBundlesOnly:(BOOL)a4
{
  id v6;
  char v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CKMapShareURLsToInstalledBundleIDsOperation *v15;
  uint64_t v16;
  NSArray *shareURLs;
  void *v19;
  CKException *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  id v30;
  id v31;

  v6 = a3;
  v31 = 0;
  v7 = _CKCheckArgument((uint64_t)"shareURLs", v6, 0, 0, 0, &v31);
  v8 = v31;
  if ((v7 & 1) == 0)
  {
    v19 = v8;
    v20 = [CKException alloc];
    v24 = objc_msgSend_code(v19, v21, v22, v23);
    objc_msgSend_localizedDescription(v19, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (id)objc_msgSend_initWithCode_format_(v20, v29, v24, (uint64_t)CFSTR("%@"), v28);

    objc_exception_throw(v30);
  }

  v15 = (CKMapShareURLsToInstalledBundleIDsOperation *)objc_msgSend_init(self, v9, v10, v11);
  if (v15)
  {
    v16 = objc_msgSend_copy(v6, v12, v13, v14);
    shareURLs = v15->_shareURLs;
    v15->_shareURLs = (NSArray *)v16;

    v15->_returnLocalBundlesOnly = a4;
  }

  return v15;
}

- (void)setPerShareURLBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id perShareURLBlock;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;

  v14 = a3;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v4, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    objc_msgSend_callbackQueue(self, v7, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18A7BD380;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    perShareURLBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_perShareURLBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    perShareURLBlock = self->_perShareURLBlock;
    self->_perShareURLBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)perShareURLBlock
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *(*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_18A7BD528;
    v16 = sub_18A7BD550;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7BD558;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_perShareURLBlock);
  }
  return v8;
}

- (void)setMapBundleIDsCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id mapBundleIDsCompletionBlock;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;

  v14 = a3;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v4, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    objc_msgSend_callbackQueue(self, v7, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18A7BD6B4;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    mapBundleIDsCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_mapBundleIDsCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    mapBundleIDsCompletionBlock = self->_mapBundleIDsCompletionBlock;
    self->_mapBundleIDsCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)mapBundleIDsCompletionBlock
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *(*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_18A7BD528;
    v16 = sub_18A7BD550;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A7BD85C;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_mapBundleIDsCompletionBlock);
  }
  return v8;
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  objc_super v11;

  v4 = a3;
  objc_msgSend_shareURLs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setShareURLs_(v4, v9, (uint64_t)v8, v10);

  v11.receiver = self;
  v11.super_class = (Class)CKMapShareURLsToInstalledBundleIDsOperation;
  -[CKOperation fillOutOperationInfo:](&v11, sel_fillOutOperationInfo_, v4);

}

- (void)fillFromOperationInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKMapShareURLsToInstalledBundleIDsOperation;
  v4 = a3;
  -[CKOperation fillFromOperationInfo:](&v11, sel_fillFromOperationInfo_, v4);
  objc_msgSend_shareURLs(v4, v5, v6, v7, v11.receiver, v11.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setShareURLs_(self, v9, (uint64_t)v8, v10);
}

- (BOOL)hasCKOperationCallbacksSet
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKMapShareURLsToInstalledBundleIDsOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v13, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_perShareURLBlock(self, v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend_mapBundleIDsCompletionBlock(self, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11 != 0;

  }
  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  BOOL v48;
  objc_class *v49;
  void *v50;
  const char *v51;
  id *v52;
  objc_class *v53;
  const char *v54;
  const __CFString *v55;
  objc_class *v56;
  void *v58;
  void *v59;
  id *v60;
  id obj;
  void *v62;
  objc_super v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  objc_msgSend_shareURLs(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_count(v6, v7, v8, v9);

  if (v10)
  {
    v60 = a3;
    v11 = (void *)objc_opt_new();
    CKURLSlugsToBundleIDsMap();
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    objc_msgSend_shareURLs(self, v12, v13, v14);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v64, (uint64_t)v68, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v65;
LABEL_4:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v65 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v19);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v52 = v60;
          if (!v60)
            goto LABEL_28;
          v53 = (objc_class *)objc_opt_class();
          NSStringFromClass(v53);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v32;
          v59 = v20;
          v55 = CFSTR("Unexpected share URL passed to %@: %@");
LABEL_25:
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v54, (uint64_t)CFSTR("CKErrorDomain"), 12, v55, v58, v59);
          goto LABEL_26;
        }
        if (objc_msgSend_containsObject_(v11, v21, (uint64_t)v20, v22))
        {
          v52 = v60;
          if (!v60)
            goto LABEL_28;
          v56 = (objc_class *)objc_opt_class();
          NSStringFromClass(v56);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v20;
          v59 = v32;
          v55 = CFSTR("URL \"%@\" was passed to %@ twice");
          goto LABEL_25;
        }
        objc_msgSend_addObject_(v11, v23, (uint64_t)v20, v24);
        objc_msgSend_CKURLSlug(v20, v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lowercaseString(v28, v29, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_objectForKeyedSubscript_(v62, v33, (uint64_t)v32, v34);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v38)
          break;
        if (__sTestOverridesAvailable)
        {
          objc_msgSend_unitTestOverrides(self, v35, v36, v37);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v39, v40, (uint64_t)CFSTR("forceFetchAllshareURLs"), v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (v42)
            goto LABEL_14;
        }
        objc_msgSend_specialURLs(self, v35, v36, v37);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
        v46 = v43;
        objc_msgSend_addObject_(v43, v44, (uint64_t)v20, v45);

        if (v17 == ++v19)
        {
          v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v64, (uint64_t)v68, 16);
          if (v17)
            goto LABEL_4;
          goto LABEL_17;
        }
      }
      if (!objc_msgSend_isEqualToString_(v32, v35, (uint64_t)CFSTR("share"), v37))
      {
        v52 = v60;
        if (v60)
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v35, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("URL %@ has unknown format"), v20);
LABEL_26:
          *v52 = (id)objc_claimAutoreleasedReturnValue();
        }

LABEL_28:
        v48 = 0;
        goto LABEL_29;
      }
LABEL_14:
      objc_msgSend_genericURLs(self, v35, v36, v37);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_17:

    v63.receiver = self;
    v63.super_class = (Class)CKMapShareURLsToInstalledBundleIDsOperation;
    v48 = -[CKOperation CKOperationShouldRun:](&v63, sel_CKOperationShouldRun_, v60);
LABEL_29:

  }
  else
  {
    if (a3)
    {
      v49 = (objc_class *)objc_opt_class();
      NSStringFromClass(v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v51, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("No share URLs were passed to %@"), v50);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  return v48;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performMapShareURLsToInstalledBundleIDsOperation_withBlock_;
}

- (void)performCKOperation
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  id obj;
  objc_super v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend_specialURLs(self, a2, v2, v3);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v48, (uint64_t)v52, 16);
  if (v6)
  {
    v10 = v6;
    v11 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v49 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend_CKURLSlug(v13, v7, v8, v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lowercaseString(v14, v15, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_getStaticBundleIDsForURLSlug_withKey_(self, v19, (uint64_t)v18, (uint64_t)CFSTR("apps"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_getStaticBundleIDsForURLSlug_withKey_(self, v21, (uint64_t)v18, (uint64_t)CFSTR("daemons"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleBundleIDsFetchedForURL_appBundleIDs_daemonBundleIDs_error_(self, v23, (uint64_t)v13, (uint64_t)v20, v22, 0);

      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v48, (uint64_t)v52, 16);
    }
    while (v10);
  }

  objc_msgSend_genericURLs(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_count(v27, v28, v29, v30);

  if (v31)
  {
    objc_msgSend_operationInfo(self, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend_copy(v35, v36, v37, v38);

    objc_msgSend_genericURLs(self, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setShareURLs_(v39, v44, (uint64_t)v43, v45);

    v47.receiver = self;
    v47.super_class = (Class)CKMapShareURLsToInstalledBundleIDsOperation;
    -[CKOperation performCKOperation](&v47, sel_performCKOperation);

  }
  else
  {
    objc_msgSend__finishOnCallbackQueueWithError_(self, v32, 0, v34);
  }
}

- (void)handleBundleIDsFetchedForURL:(id)a3 appBundleIDs:(id)a4 daemonBundleIDs:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  CKSignpost *signpost;
  CKSignpost *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  CKSignpost *v39;
  CKSignpost *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  CKSignpost *v45;
  CKSignpost *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  NSObject *v52;
  os_signpost_id_t v53;
  uint32_t v54;
  CKSignpost *v55;
  CKSignpost *v56;
  CKSignpost *v57;
  CKSignpost *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  CKSignpost *v62;
  CKSignpost *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  NSObject *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  NSObject *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  _BYTE v88[24];
  void *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v11;
  v21 = v14;
  if (objc_msgSend_count(v14, v15, v16, v17))
  {
    v21 = v14;
    if (objc_msgSend_returnLocalBundlesOnly(self, v18, v19, v20))
    {
      objc_msgSend_selectLocalBundleIDs_(self, v18, (uint64_t)v14, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  if (!objc_msgSend_count(v21, v18, v19, v20))
  {

    v21 = 0;
  }
  if (!objc_msgSend_count(v12, v22, v23, v24))
  {

    v12 = 0;
  }
  objc_msgSend_CKClientSuitableError(v13, v25, v26, v27);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    objc_msgSend_errorsByURL(self, v28, v29, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v32, v33, (uint64_t)v31, (uint64_t)v10);

    if (self)
      signpost = self->super._signpost;
    else
      signpost = 0;
    v35 = signpost;

    if (v35)
    {
      if (self)
        v39 = self->super._signpost;
      else
        v39 = 0;
      v40 = v39;
      objc_msgSend_log(v40, v41, v42, v43);
      v44 = objc_claimAutoreleasedReturnValue();

      if (self)
        v45 = self->super._signpost;
      else
        v45 = 0;
      v46 = v45;
      v50 = objc_msgSend_identifier(v46, v47, v48, v49);

      if ((unint64_t)(v50 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v44))
        goto LABEL_30;
      *(_DWORD *)v88 = 138412546;
      *(_QWORD *)&v88[4] = v10;
      *(_WORD *)&v88[12] = 2112;
      *(_QWORD *)&v88[14] = v31;
      v51 = "BundleIDs fetched for shareURL %@ with error: %@";
      v52 = v44;
      v53 = v50;
      v54 = 22;
LABEL_29:
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v52, OS_SIGNPOST_EVENT, v53, "CKMapShareURLsToInstalledBundleIDsOperation", v51, v88, v54);
LABEL_30:

    }
  }
  else
  {
    if (self)
      v55 = self->super._signpost;
    else
      v55 = 0;
    v56 = v55;

    if (v56)
    {
      if (self)
        v57 = self->super._signpost;
      else
        v57 = 0;
      v58 = v57;
      objc_msgSend_log(v58, v59, v60, v61);
      v44 = objc_claimAutoreleasedReturnValue();

      if (self)
        v62 = self->super._signpost;
      else
        v62 = 0;
      v63 = v62;
      v67 = objc_msgSend_identifier(v63, v64, v65, v66);

      if ((unint64_t)(v67 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v44))
        goto LABEL_30;
      *(_DWORD *)v88 = 138412290;
      *(_QWORD *)&v88[4] = v10;
      v51 = "BundleIDs fetched for shareURL %@";
      v52 = v44;
      v53 = v67;
      v54 = 12;
      goto LABEL_29;
    }
  }
  objc_msgSend_perShareURLBlock(self, v36, v37, v38, *(_OWORD *)v88, *(_QWORD *)&v88[16]);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v69 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v78 = v69;
      objc_msgSend_operationID(self, v79, v80, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v88 = 138543874;
      *(_QWORD *)&v88[4] = v82;
      *(_WORD *)&v88[12] = 2112;
      *(_QWORD *)&v88[14] = v10;
      *(_WORD *)&v88[22] = 2112;
      v89 = v31;
      _os_log_debug_impl(&dword_18A5C5000, v78, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about fetched bundleIDs for URL %@ : %@", v88, 0x20u);

    }
    objc_msgSend_perShareURLBlock(self, v70, v71, v72);
    v73 = objc_claimAutoreleasedReturnValue();
    v74 = (void *)v73;
    if (v31)
      v75 = 0;
    else
      v75 = v21;
    if (v31)
      v76 = 0;
    else
      v76 = v12;
    (*(void (**)(uint64_t, id, void *, id, void *))(v73 + 16))(v73, v10, v75, v76, v31);

  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v77 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v83 = v77;
      objc_msgSend_operationID(self, v84, v85, v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v88 = 138543874;
      *(_QWORD *)&v88[4] = v87;
      *(_WORD *)&v88[12] = 2112;
      *(_QWORD *)&v88[14] = v10;
      *(_WORD *)&v88[22] = 2112;
      v89 = v31;
      _os_log_debug_impl(&dword_18A5C5000, v83, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received fetched bundleIDs for URL %@: %@", v88, 0x20u);

    }
  }

}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  CKSignpost *signpost;
  CKSignpost *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  CKSignpost *v10;
  CKSignpost *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  CKSignpost *v16;
  CKSignpost *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  os_signpost_id_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void (**v41)(_QWORD, _QWORD);
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  NSObject *v52;
  objc_class *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  objc_super v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  CKMapShareURLsToInstalledBundleIDsOperation *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    signpost = self->super._signpost;
  else
    signpost = 0;
  v6 = signpost;

  if (v6)
  {
    if (self)
      v10 = self->super._signpost;
    else
      v10 = 0;
    v11 = v10;
    objc_msgSend_log(v11, v12, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    if (self)
      v16 = self->super._signpost;
    else
      v16 = 0;
    v17 = v16;
    v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKMapShareURLsToInstalledBundleIDsOperation", "Finishing", buf, 2u);
    }

  }
  if (!v4)
  {
    objc_msgSend_errorsByURL(self, v7, v8, v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v7, v8, v9);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorsByURL(self, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v27, v32, (uint64_t)v31, (uint64_t)CFSTR("CKPartialErrors"));

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v27, CFSTR("Failed to fetch bundleIDs for some URLs"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  objc_msgSend_mapBundleIDsCompletionBlock(self, v7, v8, v9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v37 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v52 = v37;
      v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(self, v55, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v61 = v54;
      v62 = 2048;
      v63 = self;
      v64 = 2114;
      v65 = v58;
      v66 = 2112;
      v67 = v4;
      _os_log_debug_impl(&dword_18A5C5000, v52, OS_LOG_TYPE_DEBUG, "Calling mapBundleIDsCompletionBlock for operation <%{public}@: %p; %{public}@> with error %@",
        buf,
        0x2Au);

    }
    objc_msgSend_mapBundleIDsCompletionBlock(self, v38, v39, v40);
    v41 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKClientSuitableError(v4, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v41)[2](v41, v45);

    objc_msgSend_setMapBundleIDsCompletionBlock_(self, v46, 0, v47);
  }
  objc_msgSend_setPerShareURLBlock_(self, v35, 0, v36);
  objc_msgSend_setGenericURLs_(self, v48, 0, v49);
  objc_msgSend_setSpecialURLs_(self, v50, 0, v51);
  v59.receiver = self;
  v59.super_class = (Class)CKMapShareURLsToInstalledBundleIDsOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v59, sel__finishOnCallbackQueueWithError_, v4);

}

- (void)ckSignpostBegin
{
  CKSignpost *signpost;
  CKSignpost *v4;
  CKSignpost *v5;
  CKSignpost *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  CKSignpost *v11;
  CKSignpost *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  os_signpost_id_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  int v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (self)
    signpost = self->super._signpost;
  else
    signpost = 0;
  v4 = signpost;

  if (v4)
  {
    if (self)
      v5 = self->super._signpost;
    else
      v5 = 0;
    v6 = v5;
    objc_msgSend_log(v6, v7, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    if (self)
      v11 = self->super._signpost;
    else
      v11 = 0;
    v12 = v11;
    v16 = objc_msgSend_identifier(v12, v13, v14, v15);

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      objc_msgSend_operationID(self, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerID(self, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_group(self, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationGroupID(v28, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationGroupName(self, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationInfo(self, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      CKStringForDiscretionaryNetworkBehavior(v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      CKStringForQOS(v49, v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 138413570;
      v55 = v20;
      v56 = 2112;
      v57 = v24;
      v58 = 2112;
      v59 = v32;
      v60 = 2114;
      v61 = v36;
      v62 = 2114;
      v63 = v45;
      v64 = 2114;
      v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKMapShareURLsToInstalledBundleIDsOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

    }
  }
}

- (void)ckSignpostEndWithError:(id)a3
{
  id v4;
  CKSignpost *signpost;
  CKSignpost *v6;
  CKSignpost *v7;
  CKSignpost *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  CKSignpost *v13;
  CKSignpost *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  os_signpost_id_t v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    signpost = self->super._signpost;
  else
    signpost = 0;
  v6 = signpost;

  if (v6)
  {
    if (self)
      v7 = self->super._signpost;
    else
      v7 = 0;
    v8 = v7;
    objc_msgSend_log(v8, v9, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    if (self)
      v13 = self->super._signpost;
    else
      v13 = 0;
    v14 = v13;
    v18 = objc_msgSend_identifier(v14, v15, v16, v17);

    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      v19 = 138412290;
      v20 = v4;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKMapShareURLsToInstalledBundleIDsOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/map-share-urls-to-bundle-ids", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  objc_super v7;

  v4 = a3;
  CKErrorUserInfoClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleBundleIDsFetchedForURL_appBundleIDs_daemonBundleIDs_error_, 3, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKMapShareURLsToInstalledBundleIDsOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);

}

- (id)selectLocalBundleIDs:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  CKSelectLocalAppNamesByBundleIDs(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)getStaticBundleIDsForURLSlug:(id)a3 withKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;

  v5 = a4;
  v6 = a3;
  CKURLSlugsToBundleIDsMap();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSArray)shareURLs
{
  return self->_shareURLs;
}

- (void)setShareURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (NSMutableArray)specialURLs
{
  return self->_specialURLs;
}

- (void)setSpecialURLs:(id)a3
{
  objc_storeStrong((id *)&self->_specialURLs, a3);
}

- (NSMutableArray)genericURLs
{
  return self->_genericURLs;
}

- (void)setGenericURLs:(id)a3
{
  objc_storeStrong((id *)&self->_genericURLs, a3);
}

- (NSMutableDictionary)errorsByURL
{
  return self->_errorsByURL;
}

- (void)setErrorsByURL:(id)a3
{
  objc_storeStrong((id *)&self->_errorsByURL, a3);
}

- (BOOL)returnLocalBundlesOnly
{
  return self->_returnLocalBundlesOnly;
}

- (void)setReturnLocalBundlesOnly:(BOOL)a3
{
  self->_returnLocalBundlesOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorsByURL, 0);
  objc_storeStrong((id *)&self->_genericURLs, 0);
  objc_storeStrong((id *)&self->_specialURLs, 0);
  objc_storeStrong((id *)&self->_shareURLs, 0);
  objc_storeStrong(&self->_mapBundleIDsCompletionBlock, 0);
  objc_storeStrong(&self->_perShareURLBlock, 0);
}

@end
