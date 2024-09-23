@implementation CKFetchShareMetadataOperation

- (CKFetchShareMetadataOperation)init
{
  CKFetchShareMetadataOperation *v2;
  uint64_t v3;
  NSMutableDictionary *errorsByURL;
  uint64_t v5;
  NSMutableSet *packagesToDestroy;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKFetchShareMetadataOperation;
  v2 = -[CKOperation init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    errorsByURL = v2->_errorsByURL;
    v2->_errorsByURL = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    packagesToDestroy = v2->_packagesToDestroy;
    v2->_packagesToDestroy = (NSMutableSet *)v5;

  }
  return v2;
}

- (CKFetchShareMetadataOperation)initWithShareURLs:(NSArray *)shareURLs
{
  NSArray *v4;
  char v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CKFetchShareMetadataOperation *v13;
  uint64_t v14;
  NSArray *v15;
  void *v17;
  CKException *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  id v28;
  id v29;

  v4 = shareURLs;
  v29 = 0;
  v5 = _CKCheckArgument((uint64_t)"shareURLs", v4, 0, 0, 0, &v29);
  v6 = v29;
  if ((v5 & 1) == 0)
  {
    v17 = v6;
    v18 = [CKException alloc];
    v22 = objc_msgSend_code(v17, v19, v20, v21);
    objc_msgSend_localizedDescription(v17, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (id)objc_msgSend_initWithCode_format_(v18, v27, v22, (uint64_t)CFSTR("%@"), v26);

    objc_exception_throw(v28);
  }

  v13 = (CKFetchShareMetadataOperation *)objc_msgSend_init(self, v7, v8, v9);
  if (v13)
  {
    v14 = objc_msgSend_copy(v4, v10, v11, v12);
    v15 = v13->_shareURLs;
    v13->_shareURLs = (NSArray *)v14;

  }
  return v13;
}

- (CKFetchShareMetadataOperation)initWithShareURLs:(id)a3 invitationTokensByShareURL:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  CKFetchShareMetadataOperation *v12;
  uint64_t v13;
  NSDictionary *shareInvitationTokensByShareURL;

  v6 = a4;
  v12 = (CKFetchShareMetadataOperation *)objc_msgSend_initWithShareURLs_(self, v7, (uint64_t)a3, v8);
  if (v12)
  {
    v13 = objc_msgSend_copy(v6, v9, v10, v11);
    shareInvitationTokensByShareURL = v12->_shareInvitationTokensByShareURL;
    v12->_shareInvitationTokensByShareURL = (NSDictionary *)v13;

  }
  return v12;
}

- (void)setPerShareMetadataBlock:(void *)perShareMetadataBlock
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;

  v14 = perShareMetadataBlock;
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
    block[2] = sub_18A70E8C4;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    v12 = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_perShareMetadataBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    v12 = self->_perShareMetadataBlock;
    self->_perShareMetadataBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)perShareMetadataBlock
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
    v15 = sub_18A70EA6C;
    v16 = sub_18A70EA94;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A70EA9C;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_perShareMetadataBlock);
  }
  return v8;
}

- (void)setFetchShareMetadataCompletionBlockIVar:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id fetchShareMetadataCompletionBlock;
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
    block[2] = sub_18A70EBF8;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    fetchShareMetadataCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_fetchShareMetadataCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    fetchShareMetadataCompletionBlock = self->_fetchShareMetadataCompletionBlock;
    self->_fetchShareMetadataCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (void)fetchShareMetadataCompletionBlock
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
    v15 = sub_18A70EA6C;
    v16 = sub_18A70EA94;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A70EDA0;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_fetchShareMetadataCompletionBlock);
  }
  return v8;
}

- (void)setFetchShareMetadataCompletionBlock:(void *)fetchShareMetadataCompletionBlock
{
  _BOOL8 v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;

  v4 = fetchShareMetadataCompletionBlock == 0;
  v9 = fetchShareMetadataCompletionBlock;
  objc_msgSend_setCanDropItemResultsEarly_(self, v5, v4, v6);
  objc_msgSend_setFetchShareMetadataCompletionBlockIVar_(self, v7, (uint64_t)v9, v8);

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
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t RootRecord;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  objc_super v41;

  v4 = a3;
  objc_msgSend_shareURLs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setShareURLsToFetch_(v4, v9, (uint64_t)v8, v10);

  RootRecord = objc_msgSend_shouldFetchRootRecord(self, v11, v12, v13);
  objc_msgSend_setShouldFetchRootRecord_(v4, v15, RootRecord, v16);
  objc_msgSend_rootRecordDesiredKeys(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRootRecordDesiredKeys_(v4, v21, (uint64_t)v20, v22);

  objc_msgSend_shareInvitationTokensByShareURL(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setShareInvitationTokensByShareURL_(v4, v27, (uint64_t)v26, v28);

  v32 = objc_msgSend_overwriteContainerPCSServiceIfManatee(self, v29, v30, v31);
  objc_msgSend_setOverwriteContainerPCSServiceIfManatee_(v4, v33, v32, v34);
  v38 = objc_msgSend_skipShareDecryption(self, v35, v36, v37);
  objc_msgSend_setSkipShareDecryption_(v4, v39, v38, v40);
  v41.receiver = self;
  v41.super_class = (Class)CKFetchShareMetadataOperation;
  -[CKOperation fillOutOperationInfo:](&v41, sel_fillOutOperationInfo_, v4);

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
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t RootRecord;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)CKFetchShareMetadataOperation;
  v4 = a3;
  -[CKOperation fillFromOperationInfo:](&v41, sel_fillFromOperationInfo_, v4);
  objc_msgSend_shareURLsToFetch(v4, v5, v6, v7, v41.receiver, v41.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setShareURLs_(self, v9, (uint64_t)v8, v10);

  RootRecord = objc_msgSend_shouldFetchRootRecord(v4, v11, v12, v13);
  objc_msgSend_setShouldFetchRootRecord_(self, v15, RootRecord, v16);
  objc_msgSend_rootRecordDesiredKeys(v4, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRootRecordDesiredKeys_(self, v21, (uint64_t)v20, v22);

  objc_msgSend_shareInvitationTokensByShareURL(v4, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setShareInvitationTokensByShareURL_(self, v27, (uint64_t)v26, v28);

  v32 = objc_msgSend_overwriteContainerPCSServiceIfManatee(v4, v29, v30, v31);
  objc_msgSend_setOverwriteContainerPCSServiceIfManatee_(self, v33, v32, v34);
  v38 = objc_msgSend_skipShareDecryption(v4, v35, v36, v37);

  objc_msgSend_setSkipShareDecryption_(self, v39, v38, v40);
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
  v13.super_class = (Class)CKFetchShareMetadataOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v13, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_perShareMetadataBlock(self, v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend_fetchShareMetadataCompletionBlock(self, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11 != 0;

  }
  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v3;
  id *v4;
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
  uint64_t v20;
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
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  objc_class *v40;
  void *v41;
  const char *v42;
  objc_class *v43;
  void *v44;
  const char *v45;
  objc_class *v46;
  const char *v47;
  objc_class *v48;
  const char *v49;
  id obj;
  objc_super v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v4 = a3;
  v58 = *MEMORY[0x1E0C80C00];
  objc_msgSend_shareURLs(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_count(v6, v7, v8, v9);

  if (v10)
  {
    v11 = (void *)objc_opt_new();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend_shareURLs(self, v12, v13, v14);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v53, (uint64_t)v57, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v54;
LABEL_4:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v54 != v18)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v19);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v4)
          {
            v43 = (objc_class *)objc_opt_class();
            NSStringFromClass(v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v45, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Unexpected share URL passed to %@: %@"), v44, v20);
            goto LABEL_24;
          }
          goto LABEL_25;
        }
        if (objc_msgSend_containsObject_(v11, v21, v20, v22))
          break;
        objc_msgSend_addObject_(v11, v23, v20, v24);
        objc_msgSend_shareInvitationTokensByShareURL(self, v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_count(v28, v29, v30, v31))
        {
          objc_msgSend_shareInvitationTokensByShareURL(self, v32, v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v35, v36, v20, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v38)
          {
            if (v4)
            {
              v48 = (objc_class *)objc_opt_class();
              NSStringFromClass(v48);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v49, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("No sharing invitation token for URL \"%@\" was passed to %@"), v20, v44);
LABEL_24:
              *v4 = (id)objc_claimAutoreleasedReturnValue();

            }
            goto LABEL_25;
          }
        }
        else
        {

        }
        if (v17 == ++v19)
        {
          v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v39, (uint64_t)&v53, (uint64_t)v57, 16);
          if (v17)
            goto LABEL_4;
          goto LABEL_15;
        }
      }
      if (v4)
      {
        v46 = (objc_class *)objc_opt_class();
        NSStringFromClass(v46);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v47, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("URL \"%@\" was passed to %@ twice"), v20, v44);
        goto LABEL_24;
      }
LABEL_25:

      LOBYTE(v4) = 0;
      goto LABEL_26;
    }
LABEL_15:

    v52.receiver = self;
    v52.super_class = (Class)CKFetchShareMetadataOperation;
    LOBYTE(v4) = -[CKOperation CKOperationShouldRun:](&v52, sel_CKOperationShouldRun_, v4);
LABEL_26:

  }
  else if (v4)
  {
    v40 = (objc_class *)objc_opt_class();
    NSStringFromClass(v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v42, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("No share URLs were passed to %@"), v41);
    *v4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performFetchShareMetadataOperation_withBlock_;
}

- (BOOL)claimPackagesInRecord:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  void *v8;
  char v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[5];
  CKFetchShareMetadataOperation *v24;

  v6 = a3;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_18A70F588;
  v23[4] = sub_18A70F598;
  v24 = self;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_18A70F588;
  v17 = sub_18A70F598;
  v18 = 0;
  v11[5] = &v13;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18A70F5A0;
  v12[3] = &unk_1E1F626E8;
  v12[4] = v23;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A70F5F0;
  v11[3] = &unk_1E1F62710;
  v11[4] = &v19;
  objc_msgSend_claimPackagesWithSuccessBlock_failureBlock_completionBlock_(v6, v7, (uint64_t)v12, (uint64_t)v11, 0);
  if (a4)
  {
    v8 = (void *)v14[5];
    if (v8)
      *a4 = objc_retainAutorelease(v8);
  }
  v9 = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v23, 8);

  return v9;
}

- (void)handleShareMetadataFetchForURL:(id)a3 shareMetadata:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CKSignpost *signpost;
  CKSignpost *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  CKSignpost *v21;
  CKSignpost *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  CKSignpost *v27;
  CKSignpost *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  NSObject *v34;
  os_signpost_id_t v35;
  uint32_t v36;
  CKSignpost *v37;
  CKSignpost *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  CKSignpost *v42;
  CKSignpost *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  int v50;
  id v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void (**v71)(void *, id, _QWORD, void *);
  void *v72;
  void *v73;
  id v74;
  NSObject *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  id v88;
  uint8_t buf[4];
  id v90;
  __int16 v91;
  id v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  void *v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend_CKClientSuitableError(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    signpost = self->super._signpost;
  else
    signpost = 0;
  v17 = signpost;

  if (v15)
  {
    if (v17)
    {
      if (self)
        v21 = self->super._signpost;
      else
        v21 = 0;
      v22 = v21;
      objc_msgSend_log(v22, v23, v24, v25);
      v26 = objc_claimAutoreleasedReturnValue();

      if (self)
        v27 = self->super._signpost;
      else
        v27 = 0;
      v28 = v27;
      v32 = objc_msgSend_identifier(v28, v29, v30, v31);

      if ((unint64_t)(v32 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v26))
        goto LABEL_21;
      *(_DWORD *)buf = 138412546;
      v90 = v9;
      v91 = 2112;
      v92 = v15;
      v33 = "Shared %@ fetched metadata with error: %@";
      v34 = v26;
      v35 = v32;
      v36 = 22;
LABEL_20:
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v34, OS_SIGNPOST_EVENT, v35, "CKFetchShareMetadataOperation", v33, buf, v36);
LABEL_21:

    }
  }
  else if (v17)
  {
    if (self)
      v37 = self->super._signpost;
    else
      v37 = 0;
    v38 = v37;
    objc_msgSend_log(v38, v39, v40, v41);
    v26 = objc_claimAutoreleasedReturnValue();

    if (self)
      v42 = self->super._signpost;
    else
      v42 = 0;
    v43 = v42;
    v47 = objc_msgSend_identifier(v43, v44, v45, v46);

    if ((unint64_t)(v47 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v26))
      goto LABEL_21;
    *(_DWORD *)buf = 138412290;
    v90 = v9;
    v33 = "Shared %@ fetched metadata";
    v34 = v26;
    v35 = v47;
    v36 = 12;
    goto LABEL_20;
  }
  if (!v11)
  {
    objc_msgSend_rootRecord(v10, v18, v19, v20);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend_rootRecord(v10, v18, v19, v20);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = 0;
      v50 = objc_msgSend_claimPackagesInRecord_error_(self, v49, (uint64_t)v48, (uint64_t)&v88);
      v51 = v88;

      if (v50 == (v51 == 0))
      {
        if ((v50 & 1) != 0)
        {
LABEL_26:
          v11 = 0;
LABEL_32:

          goto LABEL_33;
        }
      }
      else
      {
        objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v52, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v55;
        if (v50)
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v55, v56, (uint64_t)a2, (uint64_t)self, CFSTR("CKFetchShareMetadataOperation.m"), 164, CFSTR("Expecting packageClaimError(%@) only on failure (%s)"), v51, "succeeded");
        else
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v55, v56, (uint64_t)a2, (uint64_t)self, CFSTR("CKFetchShareMetadataOperation.m"), 164, CFSTR("Expecting packageClaimError(%@) only on failure (%s)"), v51, "failed");

        if ((v50 & 1) != 0)
          goto LABEL_26;
      }
      v11 = v51;
      objc_msgSend_setRootRecord_(v10, v58, 0, v59);
      goto LABEL_32;
    }
  }
LABEL_33:
  objc_msgSend_CKClientSuitableError(v11, v18, v19, v20);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60 && (objc_msgSend_canDropItemResultsEarly(self, v61, v62, v63) & 1) == 0)
  {
    objc_msgSend_errorsByURL(self, v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v64, v65, (uint64_t)v60, (uint64_t)v9);

  }
  objc_msgSend_perShareMetadataBlock_wrapper(self, v61, v62, v63);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v66;
  if (v66)
  {
    v71 = (void (**)(void *, id, _QWORD, void *))_Block_copy(v66);
  }
  else
  {
    objc_msgSend_perShareMetadataBlock(self, v67, v68, v69);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (void (**)(void *, id, _QWORD, void *))_Block_copy(v72);

  }
  if (v71)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v73 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v75 = v73;
      objc_msgSend_operationID(self, v76, v77, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_share(v10, v80, v81, v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v83, v84, v85, v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v90 = v79;
      v91 = 2112;
      v92 = v9;
      v93 = 2112;
      v94 = v87;
      v95 = 2112;
      v96 = v60;
      _os_log_debug_impl(&dword_18A5C5000, v75, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about fetched share metadata for URL %@ with ID %@: %@", buf, 0x2Au);

    }
    if (v60)
      v74 = 0;
    else
      v74 = v10;
    ((void (**)(void *, id, id, void *))v71)[2](v71, v9, v74, v60);
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
  uint64_t v37;
  void *v38;
  void (**v39)(void *, void *);
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  const char *v60;
  uint64_t v61;
  NSObject *v62;
  objc_class *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  objc_super v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t v74[128];
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  CKFetchShareMetadataOperation *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  id v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKFetchShareMetadataOperation", "Finishing", buf, 2u);
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

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v27, CFSTR("Failed to fetch some share info"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  objc_msgSend_fetchShareMetadataCompletionBlock_wrapper(self, v7, v8, v9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v34;
  if (v34)
  {
    v39 = (void (**)(void *, void *))_Block_copy(v34);
  }
  else
  {
    objc_msgSend_fetchShareMetadataCompletionBlock(self, v35, v36, v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void (**)(void *, void *))_Block_copy(v40);

  }
  if (v39)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v44 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v62 = v44;
      v63 = (objc_class *)objc_opt_class();
      NSStringFromClass(v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(self, v65, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v76 = v64;
      v77 = 2048;
      v78 = self;
      v79 = 2114;
      v80 = v68;
      v81 = 2112;
      v82 = v4;
      _os_log_debug_impl(&dword_18A5C5000, v62, OS_LOG_TYPE_DEBUG, "Calling fetchShareMetadataCompletionBlock for operation <%{public}@: %p; %{public}@> with error %@",
        buf,
        0x2Au);

    }
    objc_msgSend_CKClientSuitableError(v4, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2](v39, v48);

    objc_msgSend_setFetchShareMetadataCompletionBlock_(self, v49, 0, v50);
  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  objc_msgSend_packagesToDestroy(self, v41, v42, v43);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v52, (uint64_t)&v70, (uint64_t)v74, 16);
  if (v53)
  {
    v57 = v53;
    v58 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v57; ++i)
      {
        if (*(_QWORD *)v71 != v58)
          objc_enumerationMutation(v51);
        objc_msgSend_removeDB(*(void **)(*((_QWORD *)&v70 + 1) + 8 * i), v54, v55, v56);
      }
      v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v54, (uint64_t)&v70, (uint64_t)v74, 16);
    }
    while (v57);
  }

  objc_msgSend_setPerShareMetadataBlock_(self, v60, 0, v61);
  v69.receiver = self;
  v69.super_class = (Class)CKFetchShareMetadataOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v69, sel__finishOnCallbackQueueWithError_, v4);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKFetchShareMetadataOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKFetchShareMetadataOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/fetch-share-metadatas", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleShareMetadataFetchForURL_shareMetadata_error_, 2, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKFetchShareMetadataOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);

}

- (NSArray)shareURLs
{
  return self->_shareURLs;
}

- (void)setShareURLs:(NSArray *)shareURLs
{
  objc_setProperty_nonatomic_copy(self, a2, shareURLs, 528);
}

- (BOOL)shouldFetchRootRecord
{
  return self->_shouldFetchRootRecord;
}

- (void)setShouldFetchRootRecord:(BOOL)shouldFetchRootRecord
{
  self->_shouldFetchRootRecord = shouldFetchRootRecord;
}

- (NSArray)rootRecordDesiredKeys
{
  return self->_rootRecordDesiredKeys;
}

- (void)setRootRecordDesiredKeys:(NSArray *)rootRecordDesiredKeys
{
  objc_setProperty_nonatomic_copy(self, a2, rootRecordDesiredKeys, 536);
}

- (NSMutableDictionary)errorsByURL
{
  return self->_errorsByURL;
}

- (void)setErrorsByURL:(id)a3
{
  objc_storeStrong((id *)&self->_errorsByURL, a3);
}

- (NSMutableSet)packagesToDestroy
{
  return self->_packagesToDestroy;
}

- (void)setPackagesToDestroy:(id)a3
{
  objc_storeStrong((id *)&self->_packagesToDestroy, a3);
}

- (id)perShareMetadataBlock_wrapper
{
  return self->_perShareMetadataBlock_wrapper;
}

- (void)setPerShareMetadataBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (id)fetchShareMetadataCompletionBlock_wrapper
{
  return self->_fetchShareMetadataCompletionBlock_wrapper;
}

- (void)setFetchShareMetadataCompletionBlock_wrapper:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (NSDictionary)shareInvitationTokensByShareURL
{
  return self->_shareInvitationTokensByShareURL;
}

- (void)setShareInvitationTokensByShareURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (BOOL)overwriteContainerPCSServiceIfManatee
{
  return self->_overwriteContainerPCSServiceIfManatee;
}

- (void)setOverwriteContainerPCSServiceIfManatee:(BOOL)a3
{
  self->_overwriteContainerPCSServiceIfManatee = a3;
}

- (BOOL)skipShareDecryption
{
  return self->_skipShareDecryption;
}

- (void)setSkipShareDecryption:(BOOL)a3
{
  self->_skipShareDecryption = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareInvitationTokensByShareURL, 0);
  objc_storeStrong(&self->_fetchShareMetadataCompletionBlock_wrapper, 0);
  objc_storeStrong(&self->_perShareMetadataBlock_wrapper, 0);
  objc_storeStrong((id *)&self->_packagesToDestroy, 0);
  objc_storeStrong((id *)&self->_errorsByURL, 0);
  objc_storeStrong((id *)&self->_rootRecordDesiredKeys, 0);
  objc_storeStrong((id *)&self->_shareURLs, 0);
  objc_storeStrong(&self->_fetchShareMetadataCompletionBlock, 0);
  objc_storeStrong(&self->_perShareMetadataBlock, 0);
}

@end
