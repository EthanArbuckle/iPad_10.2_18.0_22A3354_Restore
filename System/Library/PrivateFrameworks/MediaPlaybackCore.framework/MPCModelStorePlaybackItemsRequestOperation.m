@implementation MPCModelStorePlaybackItemsRequestOperation

- (MPCModelStorePlaybackItemsRequestOperation)initWithRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  MPCModelStorePlaybackItemsRequestOperation *v8;
  uint64_t v9;
  MPCModelStorePlaybackItemsRequest *request;
  uint64_t v11;
  id responseHandler;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *accessQueue;
  uint64_t v16;
  NSMutableArray *errors;

  v6 = a3;
  v7 = a4;
  v8 = -[MPAsyncOperation init](self, "init");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    request = v8->_request;
    v8->_request = (MPCModelStorePlaybackItemsRequest *)v9;

    v11 = objc_msgSend(v7, "copy");
    responseHandler = v8->_responseHandler;
    v8->_responseHandler = (id)v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelStorePlaybackItemsRequestOperation.accessQueue", v13);
    accessQueue = v8->_accessQueue;
    v8->_accessQueue = (OS_dispatch_queue *)v14;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    errors = v8->_errors;
    v8->_errors = (NSMutableArray *)v16;

  }
  return v8;
}

- (void)cancel
{
  NSObject *accessQueue;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPCModelStorePlaybackItemsRequestOperation;
  -[MPAsyncOperation cancel](&v5, sel_cancel);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__MPCModelStorePlaybackItemsRequestOperation_cancel__block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_sync(accessQueue, block);
  -[NSOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
}

- (void)execute
{
  void (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  MPCModelStorePlaybackItemsRequestOperation *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[MPCModelStorePlaybackItemsRequestOperation responseHandler](self, "responseHandler");
  v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (-[MPAsyncOperation isCancelled](self, "isCancelled"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCError"), 28, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      ((void (**)(_QWORD, _QWORD, void *))v3)[2](v3, 0, v4);
    -[MPAsyncOperation finishWithError:](self, "finishWithError:", v4);
  }
  else
  {
    -[MPCModelStorePlaybackItemsRequestOperation request](self, "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isValid") & 1) != 0)
    {
      +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __53__MPCModelStorePlaybackItemsRequestOperation_execute__block_invoke;
      v8[3] = &unk_24CAB7B40;
      v8[4] = self;
      v9 = v5;
      v11 = v3;
      v10 = v4;
      v6 = v5;
      objc_msgSend(v6, "performAfterLoadingAccounts:", v8);

    }
    else
    {
      v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v13 = self;
        _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "SPIR: %p: Request doesn't contain any storeIDs nor sectionedModelObjects, completing with an empty response.", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 1, CFSTR("Request must contain either storeIDs or sectionedModelObjects"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (v3)
        ((void (**)(_QWORD, _QWORD, id))v3)[2](v3, 0, v6);
      -[MPAsyncOperation finishWithError:](self, "finishWithError:", v6);
    }

  }
}

- (void)_runStorePlatformRequestToLoadMetadataWithAccumulator:(id)a3 previousResponse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *accessQueue;
  id v22;
  _QWORD block[5];
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  MPCModelStorePlaybackItemsRequestOperation *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v6, "newStoreItemMetadataRequest");
  objc_msgSend(v8, "setShouldIgnoreExpiration:", 1);
  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "itemIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    objc_msgSend(v8, "itemIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "msv_compactDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v31 = self;
    v32 = 2048;
    v33 = v11;
    v34 = 2114;
    v35 = v13;
    _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "SPIR: %p: requesting store metadata for %ld items itemIDs=%{public}@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x24BDDCC50], "sharedStoreItemMetadataRequestController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "beginTransaction");
  v15 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __117__MPCModelStorePlaybackItemsRequestOperation__runStorePlatformRequestToLoadMetadataWithAccumulator_previousResponse___block_invoke;
  v25[3] = &unk_24CAB7B68;
  v25[4] = self;
  v26 = v8;
  v27 = v6;
  v28 = v14;
  v29 = v7;
  v16 = v7;
  v17 = v14;
  v18 = v6;
  v19 = v8;
  objc_msgSend(v17, "getStoreItemMetadataForRequest:includeBatchResponseError:responseHandler:", v19, 1, v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  accessQueue = self->_accessQueue;
  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __117__MPCModelStorePlaybackItemsRequestOperation__runStorePlatformRequestToLoadMetadataWithAccumulator_previousResponse___block_invoke_39;
  block[3] = &unk_24CABA1D0;
  block[4] = self;
  v24 = v20;
  v22 = v20;
  dispatch_sync(accessQueue, block);

}

- (void)_runPersonalizationWithSectionCollection:(id)a3 localEquivalencyMapping:(id)a4 expirationDate:(id)a5 error:(id)a6 isFinalResponse:(BOOL)a7 isInvalidForPersonalization:(BOOL)a8 performanceMetrics:(id)a9
{
  id v14;
  id v15;
  id v16;
  _BOOL4 hasCalledResponseHandler;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  NSObject *v33;
  NSUInteger v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  MPCModelStorePlaybackItemsRequestOperation *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  _BYTE *v51;
  __int128 *v52;
  _QWORD *v53;
  BOOL v54;
  BOOL v55;
  char v56;
  _QWORD v57[5];
  id v58;
  id v59;
  _QWORD *v60;
  __int128 *p_buf;
  _QWORD v62[4];
  int v63;
  uint8_t v64[4];
  MPCModelStorePlaybackItemsRequestOperation *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  NSUInteger v69;
  __int16 v70;
  void *v71;
  _BYTE v72[24];
  void (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  __int128 buf;
  uint64_t v77;
  void *(*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v41 = a4;
  v15 = a5;
  v16 = a6;
  v42 = a9;
  if (!a8)
  {
    hasCalledResponseHandler = self->_hasCalledResponseHandler;
    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (hasCalledResponseHandler)
    {
      if (v19)
      {
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = self;
        _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "SPIR: %p: _runPersonalizationWithSectionCollection invalidating previousModelResponse [_hasCalledResponseHandler]", (uint8_t *)&buf, 0xCu);
      }

      -[MPCModelStorePlaybackItemsResponse _invalidate](self->_previousModelResponse, "_invalidate");
      goto LABEL_19;
    }
    if (v19)
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "SPIR: %p: _runPersonalizationWithSectionCollection setting hasCalledResponseHandler = YES", (uint8_t *)&buf, 0xCu);
    }

    self->_hasCalledResponseHandler = 1;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v77 = 0x3032000000;
  v78 = __Block_byref_object_copy__21698;
  v79 = __Block_byref_object_dispose__21699;
  -[MPCModelStorePlaybackItemsRequestOperation responseHandler](self, "responseHandler");
  v80 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v72 = 134218242;
      *(_QWORD *)&v72[4] = self;
      *(_WORD *)&v72[12] = 2114;
      *(_QWORD *)&v72[14] = v16;
      _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_DEFAULT, "SPIR: %p: _runPersonalizationWithSectionCollection finishing with error [non-nil error passed in] error=%{public}@", v72, 0x16u);
    }

    v21 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    if (v21)
      (*(void (**)(uint64_t, _QWORD, id))(v21 + 16))(v21, 0, v16);
    -[MPAsyncOperation finishWithError:](self, "finishWithError:", v16);
  }
  else
  {
    v62[0] = 0;
    v62[1] = v62;
    v62[2] = 0x2810000000;
    v62[3] = &unk_210F335CD;
    v63 = 0;
    -[MPCModelStorePlaybackItemsRequestOperation request](self, "request");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDCB98], "sharedRestrictionsMonitor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "allowsExplicitContent");

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCC60]), "initWithUnpersonalizedRequest:unpersonalizedContentDescriptors:", v22, v14);
    -[MPCPlaybackAccount userIdentity](self->_account, "userIdentity");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setUserIdentity:", v26);

    objc_msgSend(v25, "setMatchAlbumArtistsOnNameAndStoreID:", 0);
    v38 = v15;
    v27 = objc_alloc(MEMORY[0x24BE65C40]);
    v28 = MEMORY[0x24BDAC760];
    v57[0] = MEMORY[0x24BDAC760];
    v57[1] = 3221225472;
    v57[2] = __195__MPCModelStorePlaybackItemsRequestOperation__runPersonalizationWithSectionCollection_localEquivalencyMapping_expirationDate_error_isFinalResponse_isInvalidForPersonalization_performanceMetrics___block_invoke;
    v57[3] = &unk_24CAB7B90;
    v57[4] = self;
    v60 = v62;
    p_buf = &buf;
    v29 = v25;
    v58 = v29;
    v59 = v14;
    v30 = (void *)objc_msgSend(v27, "initWithTimeout:interruptionHandler:", v57, 60.0);
    *(_QWORD *)v72 = 0;
    *(_QWORD *)&v72[8] = v72;
    *(_QWORD *)&v72[16] = 0x3042000000;
    v73 = __Block_byref_object_copy__64;
    v74 = __Block_byref_object_dispose__65;
    v75 = 0;
    v43[0] = v28;
    v43[1] = 3221225472;
    v43[2] = __195__MPCModelStorePlaybackItemsRequestOperation__runPersonalizationWithSectionCollection_localEquivalencyMapping_expirationDate_error_isFinalResponse_isInvalidForPersonalization_performanceMetrics___block_invoke_66;
    v43[3] = &unk_24CAB7BB8;
    v51 = v72;
    v37 = v30;
    v44 = v37;
    v45 = self;
    v31 = v22;
    v46 = v31;
    v47 = v42;
    v54 = a7;
    v48 = v41;
    v55 = a8;
    v56 = v24;
    v49 = v15;
    v50 = 0;
    v52 = &buf;
    v53 = v62;
    v32 = (void *)objc_msgSend(v29, "newOperationWithResponseHandler:", v43);
    objc_storeWeak((id *)(*(_QWORD *)&v72[8] + 40), v32);
    v33 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v40 = v29;
      v34 = -[NSOperationQueue operationCount](self->_operationQueue, "operationCount");
      -[NSOperationQueue operations](self->_operationQueue, "operations");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "msv_compactDescription");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v64 = 134218754;
      v65 = self;
      v66 = 2114;
      v67 = v32;
      v68 = 2048;
      v69 = v34;
      v70 = 2114;
      v71 = v36;
      _os_log_impl(&dword_210BD8000, v33, OS_LOG_TYPE_DEFAULT, "SPIR: %p: _runPersonalizationWithSectionCollection enqueuing personalization operation [] personalizationOperation=%{public}@ self.operationQueue.operations=(:%ld)[%{public}@]", v64, 0x2Au);

      v15 = v38;
      v29 = v40;

    }
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v32);
    _Block_object_dispose(v72, 8);
    objc_destroyWeak(&v75);

    _Block_object_dispose(v62, 8);
  }
  _Block_object_dispose(&buf, 8);

LABEL_19:
}

- (id)_localStoreAdamIDToEquivalencySourceStoreAdamIDMap:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __97__MPCModelStorePlaybackItemsRequestOperation__localStoreAdamIDToEquivalencySourceStoreAdamIDMap___block_invoke;
  v8[3] = &unk_24CAB80F8;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

- (void)_handleItemMetadataBatchRequestCompletedWithAccumulator:(id)a3 previousResponse:(id)a4 error:(id)a5 isFinalResponse:(BOOL)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSMutableArray *errors;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  unsigned int v29;
  uint8_t buf[4];
  MPCModelStorePlaybackItemsRequestOperation *v31;
  __int16 v32;
  _BYTE v33[28];
  uint64_t v34;

  v6 = a6;
  v34 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v31 = self;
    v32 = 1024;
    *(_DWORD *)v33 = v6;
    *(_WORD *)&v33[4] = 2048;
    *(_QWORD *)&v33[6] = v11;
    *(_WORD *)&v33[14] = 2114;
    *(_QWORD *)&v33[16] = v12;
    _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "SPIR: %p: _handleItemMetadataBatchRequestCompletedWithAccumulator [] isFinalResponse=%{BOOL}u previousResponse=%p error=%{public}@", buf, 0x26u);
  }

  objc_msgSend(v10, "equivalencyMapping");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelStorePlaybackItemsRequestOperation _localStoreAdamIDToEquivalencySourceStoreAdamIDMap:](self, "_localStoreAdamIDToEquivalencySourceStoreAdamIDMap:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "accumulationError");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11 || !(_DWORD)v6)
    goto LABEL_11;
  v29 = v6;
  objc_msgSend(v11, "_personalizationResponse");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "request");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unpersonalizedContentDescriptors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(0, "totalItemCount");
  v21 = objc_msgSend(v19, "totalItemCount");
  if (v20 >= v21)
  {

    v6 = v29;
LABEL_11:
    objc_msgSend(v10, "unpersonalizedContentDescriptors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v22 = v21;
  v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    errors = self->_errors;
    *(_DWORD *)buf = 134218754;
    v31 = self;
    v32 = 2114;
    *(_QWORD *)v33 = errors;
    *(_WORD *)&v33[8] = 2048;
    *(_QWORD *)&v33[10] = v20;
    *(_WORD *)&v33[18] = 2048;
    *(_QWORD *)&v33[20] = v22;
    _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_ERROR, "MPCModelStorePlaybackItemsRequestOperation %p - Falling back to existing previous response from errors: %{public}@, current item count: %li, previous item count: %li", buf, 0x2Au);
  }

  objc_msgSend(v11, "localStoreAdamIDToEquivalencySourceStoreAdamIDMap");
  v25 = objc_claimAutoreleasedReturnValue();

  v15 = (void *)v25;
  v6 = v29;
  if (!v19)
    goto LABEL_11;
LABEL_12:
  if (v16)
    v26 = v16;
  else
    v26 = v12;
  v27 = v26;
  objc_msgSend(v10, "performanceMetrics");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelStorePlaybackItemsRequestOperation _runPersonalizationWithSectionCollection:localEquivalencyMapping:expirationDate:error:isFinalResponse:isInvalidForPersonalization:performanceMetrics:](self, "_runPersonalizationWithSectionCollection:localEquivalencyMapping:expirationDate:error:isFinalResponse:isInvalidForPersonalization:performanceMetrics:", v19, v15, 0, v27, v6, 0, v28);

}

- (MPCModelStorePlaybackItemsRequest)request
{
  return self->_request;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_previousModelResponse, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_activeProgress, 0);
}

void __97__MPCModelStorePlaybackItemsRequestOperation__localStoreAdamIDToEquivalencySourceStoreAdamIDMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a2;
  objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(a3, "longLongValue"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v6, "longLongValue");

  objc_msgSend(v7, "numberWithLongLong:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, v9);

}

void __195__MPCModelStorePlaybackItemsRequestOperation__runPersonalizationWithSectionCollection_localEquivalencyMapping_expirationDate_error_isFinalResponse_isInvalidForPersonalization_performanceMetrics___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[3];
  _QWORD v45[3];
  void *v46;
  uint8_t v47[128];
  uint8_t buf[4];
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_FAULT);
  if (a2)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v49 = v6;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_FAULT, "SPIR: %p: _runPersonalizationWithSectionCollection failed [personalization request dealloc'd responseHandler]", buf, 0xCu);
    }
    v7 = CFSTR("personalization request dealloc'd responseHandler");
    v8 = CFSTR("BlockGuard-Dealloc");
  }
  else
  {
    if (v5)
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v49 = v9;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_FAULT, "SPIR: %p: _runPersonalizationWithSectionCollection failed [personalization request timed out]", buf, 0xCu);
    }
    v7 = CFSTR("personalization request timed out");
    v8 = CFSTR("BlockGuard-Timeout");
  }
  v38 = v8;

  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 70, CFSTR("Block guard interrupted [%@]"), v7);
  v10 = objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v11)
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v11 + 16))(v11, 0, v10);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = 0;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
  v39 = (void *)v10;
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v10);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDDC7F0];
  objc_msgSend(*(id *)(a1 + 40), "userIdentity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deviceMediaLibraryWithUserIdentity:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = v17;
  objc_msgSend(v17, "msvDatabase");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "statementWithString:error:", CFSTR("SELECT media_type, COUNT() FROM item GROUP BY media_type"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "resultsForStatement:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v41 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v25, "objectValueAtColumnIndex:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectValueAtColumnIndex:", 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v27, v26);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v22);
  }
  v28 = (void *)MEMORY[0x24BE65C38];
  v29 = *MEMORY[0x24BE65AB0];
  v44[0] = CFSTR("request");
  objc_msgSend(*(id *)(a1 + 32), "request");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "description");
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v31;
  v33 = CFSTR("@");
  if (v31)
    v33 = (const __CFString *)v31;
  v34 = *(_QWORD *)(a1 + 48);
  v45[0] = v33;
  v45[1] = v34;
  v44[1] = CFSTR("unpersonalizedContentDescriptors");
  v44[2] = CFSTR("library-stats");
  v45[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v35;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v29, CFSTR("Bug"), CFSTR("StorePlaybackItemsRequest-Personalization"), v38, 0, v36, 0);

}

void __195__MPCModelStorePlaybackItemsRequestOperation__runPersonalizationWithSectionCollection_localEquivalencyMapping_expirationDate_error_isFinalResponse_isInvalidForPersonalization_performanceMetrics___block_invoke_66(uint64_t a1, void *a2)
{
  id v3;
  MPCModelStorePlaybackItemsResponse *WeakRetained;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  MPCModelStorePlaybackItemsResponse *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  MPCModelStorePlaybackItemsResponse *v30;
  int v31;
  uint64_t v32;
  __int16 v33;
  MPCModelStorePlaybackItemsResponse *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "disarm");
  WeakRetained = (MPCModelStorePlaybackItemsResponse *)objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88)
                                                                                              + 8)
                                                                                  + 40));
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v31 = 134218242;
    v32 = v6;
    v33 = 2114;
    v34 = WeakRetained;
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "SPIR: %p: _runPersonalizationWithSectionCollection personalization operation response handler called [] personalizationOperation=%{public}@ ", (uint8_t *)&v31, 0x16u);
  }

  objc_msgSend(v3, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v7, "_disableMissingIdentifiersFaults");
  v8 = -[MPCModelStorePlaybackItemsResponse initWithRequest:personalizationResponse:results:performanceMetrics:]([MPCModelStorePlaybackItemsResponse alloc], "initWithRequest:personalizationResponse:results:performanceMetrics:", *(_QWORD *)(a1 + 48), v3, 0, *(_QWORD *)(a1 + 56));
  -[MPCModelStorePlaybackItemsResponse setFinalResponse:](v8, "setFinalResponse:", *(unsigned __int8 *)(a1 + 112));
  -[MPCModelStorePlaybackItemsResponse setLocalStoreAdamIDToEquivalencySourceStoreAdamIDMap:](v8, "setLocalStoreAdamIDToEquivalencySourceStoreAdamIDMap:", *(_QWORD *)(a1 + 64));
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 306))
  {
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v31 = 134217984;
      v32 = v10;
      _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "SPIR: %p: producing an invalid response [_requiresFollowupRequest]", (uint8_t *)&v31, 0xCu);
    }

    -[MPCModelStorePlaybackItemsResponse _invalidate](v8, "_invalidate");
  }
  v11 = *(_QWORD *)(a1 + 72);
  if (*(_BYTE *)(a1 + 113))
  {
    -[MPCModelStorePlaybackItemsResponse setInvalidationDate:](v8, "setInvalidationDate:", v11);
  }
  else
  {
    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 72), "timeIntervalSinceNow");
      if (v12 >= 60.0)
      {
        -[MPCModelStorePlaybackItemsResponse setInvalidationDate:](v8, "setInvalidationDate:", *(_QWORD *)(a1 + 72));
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 60.0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCModelStorePlaybackItemsResponse setInvalidationDate:](v8, "setInvalidationDate:", v13);

      }
    }
    objc_msgSend(MEMORY[0x24BDDCB98], "sharedRestrictionsMonitor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "allowsExplicitContent");
    v16 = *(unsigned __int8 *)(a1 + 114);

    if (v16 != v15)
    {
      v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(a1 + 40);
        v31 = 134217984;
        v32 = v18;
        _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "SPIR: %p: producing an invalid response [allowsExplicitContent mismatch]", (uint8_t *)&v31, 0xCu);
      }

      -[MPCModelStorePlaybackItemsResponse _invalidate](v8, "_invalidate");
    }
  }
  if (*(_BYTE *)(a1 + 112))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 320), "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(_QWORD *)(a1 + 40);
      v31 = 134218498;
      v32 = v21;
      v33 = 2114;
      v34 = v8;
      v35 = 2114;
      v36 = v19;
      _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_DEFAULT, "SPIR: %p: _runPersonalizationWithSectionCollection finishing [isFinalResponse] currentModelResponse=%{public}@ error=%{public}@", (uint8_t *)&v31, 0x20u);
    }

    v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
    if (v22)
      (*(void (**)(uint64_t, MPCModelStorePlaybackItemsResponse *, void *))(v22 + 16))(v22, v8, v19);
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v19);
  }
  else
  {
    v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = *(_QWORD *)(a1 + 40);
      v25 = *(void **)(a1 + 80);
      v31 = 134218498;
      v32 = v24;
      v33 = 2114;
      v34 = v8;
      v35 = 2114;
      v36 = v25;
      _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_DEFAULT, "SPIR: %p: _runPersonalizationWithSectionCollection finishing [non-finalResponse] currentModelResponse=%{public}@ error=%{public}@", (uint8_t *)&v31, 0x20u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 32));
    v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
    if (v26)
    {
      (*(void (**)(uint64_t, MPCModelStorePlaybackItemsResponse *, _QWORD))(v26 + 16))(v26, v8, *(_QWORD *)(a1 + 80));
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v28 = *(void **)(v27 + 40);
      *(_QWORD *)(v27 + 40) = 0;

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 32));
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", *(_QWORD *)(a1 + 80));
    v29 = *(_QWORD *)(a1 + 40);
    v30 = v8;
    v19 = *(void **)(v29 + 296);
    *(_QWORD *)(v29 + 296) = v30;
  }

}

void __117__MPCModelStorePlaybackItemsRequestOperation__runStorePlatformRequestToLoadMetadataWithAccumulator_previousResponse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218754;
      v32 = v8;
      v33 = 2048;
      v34 = (uint64_t)v5;
      v35 = 2048;
      v36 = v9;
      v37 = 2114;
      v38 = v6;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "SPIR: %p: SP request=%p got response=%p with error=%{public}@ ", buf, 0x2Au);
    }

    v11 = (uint64_t *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v10 + 304))
      goto LABEL_20;
    objc_msgSend(*(id *)(v10 + 320), "addObject:", v6);
  }
  else
  {
    v11 = (uint64_t *)(a1 + 32);
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 304))
      goto LABEL_20;
    v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *v11;
      objc_msgSend(v5, "lastBatchStoreItemDictionaries");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v29, "count");
      objc_msgSend(v5, "itemIdentifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");
      objc_msgSend(v5, "lastBatchItemIdentifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "msv_compactDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v32 = v28;
      v33 = 2048;
      v34 = v27;
      v35 = 2048;
      v36 = v14;
      v37 = 2114;
      v38 = v16;
      _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "SPIR: %p: got store metadata for %ld items (accumulatedItemCount=%ld) lastBatchItemIDs=%{public}@", buf, 0x2Au);

    }
  }
  v17 = objc_msgSend(*(id *)(a1 + 48), "handleResponse:error:", v5, v6);
  if ((v17 & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 304) = 1;
    v23 = *(_QWORD *)(a1 + 32);
    v24 = *(NSObject **)(v23 + 288);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __117__MPCModelStorePlaybackItemsRequestOperation__runStorePlatformRequestToLoadMetadataWithAccumulator_previousResponse___block_invoke_37;
    block[3] = &unk_24CABA2D0;
    block[4] = v23;
    dispatch_sync(v24, block);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 306) = 0;
    objc_msgSend(*(id *)(a1 + 56), "endTransaction");
    v18 = *(void **)(a1 + 32);
    v19 = *(_QWORD *)(a1 + 48);
    v20 = *(_QWORD *)(a1 + 64);
    v21 = v6;
    v22 = 1;
    goto LABEL_15;
  }
  if ((v17 & 0x100) != 0 && objc_msgSend(*(id *)(*v11 + 328), "shouldBatchResultsWithPlaceholderObjects"))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 306) = 1;
    v18 = *(void **)(a1 + 32);
    v19 = *(_QWORD *)(a1 + 48);
    v20 = *(_QWORD *)(a1 + 64);
    v21 = v6;
    v22 = 0;
LABEL_15:
    objc_msgSend(v18, "_handleItemMetadataBatchRequestCompletedWithAccumulator:previousResponse:error:isFinalResponse:", v19, v20, v21, v22);
    goto LABEL_20;
  }
  if (objc_msgSend(v5, "isFinalResponse"))
  {
    v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = *v11;
      *(_DWORD *)buf = 134217984;
      v32 = v26;
      _os_log_impl(&dword_210BD8000, v25, OS_LOG_TYPE_DEFAULT, "SPIR: %p: metadataResponse is final, but we don't have enough items, recursing", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_runStorePlatformRequestToLoadMetadataWithAccumulator:previousResponse:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  }
LABEL_20:

}

void __117__MPCModelStorePlaybackItemsRequestOperation__runStorePlatformRequestToLoadMetadataWithAccumulator_previousResponse___block_invoke_39(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 272), *(id *)(a1 + 40));
}

void __117__MPCModelStorePlaybackItemsRequestOperation__runStorePlatformRequestToLoadMetadataWithAccumulator_previousResponse___block_invoke_37(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 272);
  *(_QWORD *)(v1 + 272) = 0;

}

void __53__MPCModelStorePlaybackItemsRequestOperation_execute__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  MPCModelStorePlaybackItemsRequestAccumulator *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  _BOOL4 v32;
  uint64_t v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  unsigned int v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const __CFString *v50;
  uint64_t v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  _BOOL4 v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  int v72;
  _QWORD v73[4];
  _QWORD v74[4];
  void *v75;
  uint8_t buf[4];
  uint64_t v77;
  __int16 v78;
  _BYTE v79[10];
  __int16 v80;
  int v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "playbackRequestEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 40), "accountForUserIdentity:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 312);
  *(_QWORD *)(v8 + 312) = v7;

  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
  if (v10)
  {
    if ((objc_msgSend(v10, "hasCatalogPlaybackCapability") & 1) != 0)
    {
      v11 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "request");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v16, "isInGroupSession");

    }
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 280))
    {
      v17 = objc_alloc_init(MEMORY[0x24BDD1710]);
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(void **)(v18 + 280);
      *(_QWORD *)(v18 + 280) = v17;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "setName:", CFSTR("com.apple.MediaPlayer.MPCModelStorePlaybackItemsRequestOperation.operationQueue"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "setMaxConcurrentOperationCount:", 1);
      v20 = *(void **)(*(_QWORD *)(a1 + 32) + 280);
      objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setQualityOfService:", objc_msgSend(v21, "qualityOfService"));

    }
    objc_msgSend(*(id *)(a1 + 48), "previousResponse");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isInvalidForPersonalization"))
    {
      v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134218240;
        v77 = v23;
        v78 = 2048;
        *(_QWORD *)v79 = v14;
        _os_log_impl(&dword_210BD8000, v22, OS_LOG_TYPE_DEFAULT, "SPIR: %p: re-running personalization [previousResponse.isInvalidForPersonalization] previousResponse=%p", buf, 0x16u);
      }

      objc_msgSend(v14, "_personalizationResponse");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "request");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "unpersonalizedContentDescriptors");
      v26 = (MPCModelStorePlaybackItemsRequestAccumulator *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "localStoreAdamIDToEquivalencySourceStoreAdamIDMap");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "invalidationDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_runPersonalizationWithSectionCollection:localEquivalencyMapping:expirationDate:error:isFinalResponse:isInvalidForPersonalization:performanceMetrics:", v26, v27, v28, 0, objc_msgSend(v14, "isFinalResponse"), 1, 0);

      goto LABEL_55;
    }
    objc_msgSend(*(id *)(a1 + 48), "storeIDs");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count");

    v31 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    if (v30)
    {
      if (!v32)
        goto LABEL_25;
      v33 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 48), "storeIDs");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "msv_compactDescription");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v77 = v33;
      v78 = 2114;
      *(_QWORD *)v79 = v35;
      v36 = "SPIR: %p: starting requestedStoreIDs=%{public}@";
    }
    else
    {
      if (!v32)
        goto LABEL_25;
      v37 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 48), "identifiers");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "debugDescription");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v77 = v37;
      v78 = 2114;
      *(_QWORD *)v79 = v35;
      v36 = "SPIR: %p: starting identifiers=%{public}@";
    }
    _os_log_impl(&dword_210BD8000, v31, OS_LOG_TYPE_DEFAULT, v36, buf, 0x16u);

LABEL_25:
    v26 = -[MPCModelStorePlaybackItemsRequestAccumulator initWithRequest:]([MPCModelStorePlaybackItemsRequestAccumulator alloc], "initWithRequest:", *(_QWORD *)(a1 + 48));
    v38 = -[MPCModelStorePlaybackItemsRequestAccumulator accumulatorResult](v26, "accumulatorResult");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 306) = BYTE2(v38) & 1;
    -[MPCModelStorePlaybackItemsRequestAccumulator accumulationError](v26, "accumulationError");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      v77 = v40;
      v78 = 1024;
      *(_DWORD *)v79 = (v38 >> 8) & 1;
      *(_WORD *)&v79[4] = 1024;
      *(_DWORD *)&v79[6] = v38 & 1;
      v80 = 1024;
      v81 = HIWORD(v38) & 1;
      v82 = 2114;
      v83 = v27;
      _os_log_impl(&dword_210BD8000, v39, OS_LOG_TYPE_DEFAULT, "SPIR: %p: initial accumulator result: didFinishPrioritizedBatch=%{BOOL}u didFinishEntireRequest=%{BOOL}u hasPrioritizedItemsToLoad=%{BOOL}u accumulationError=%{public}@", buf, 0x28u);
    }

    if (v27)
    {
      v41 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v42 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        v77 = v42;
        v78 = 2114;
        *(_QWORD *)v79 = v27;
        _os_log_impl(&dword_210BD8000, v41, OS_LOG_TYPE_DEFAULT, "SPIR: %p: completing without requests [has accumulationError] accumulationError=%{public}@", buf, 0x16u);
      }

      v43 = *(_QWORD *)(a1 + 56);
      if (v43)
        (*(void (**)(uint64_t, _QWORD, void *))(v43 + 16))(v43, 0, v27);
      objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v27);
      goto LABEL_55;
    }
    objc_msgSend(*(id *)(a1 + 48), "abc_siriAssetInfo");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "length");

    if (!v45 || (v38 & 0x100) != 0)
    {
      if ((v38 & 0x100) == 0
        || (v38 & 1) == 0 && !objc_msgSend(*(id *)(a1 + 48), "shouldBatchResultsWithPlaceholderObjects"))
      {
        goto LABEL_46;
      }
      v63 = *(void **)(a1 + 32);
      -[MPCModelStorePlaybackItemsRequestAccumulator equivalencyMapping](v26, "equivalencyMapping");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "_localStoreAdamIDToEquivalencySourceStoreAdamIDMap:", v64);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      -[MPCModelStorePlaybackItemsRequestAccumulator unpersonalizedContentDescriptors](v26, "unpersonalizedContentDescriptors");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_runPersonalizationWithSectionCollection:localEquivalencyMapping:expirationDate:error:isFinalResponse:isInvalidForPersonalization:performanceMetrics:", v58, v57, 0, 0, v38 & 1, 0, 0);
      v59 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v65 = os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT);
      if ((v38 & 1) != 0)
      {
        if (v65)
        {
          v66 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 134218242;
          v77 = v66;
          v78 = 2114;
          *(_QWORD *)v79 = v58;
          _os_log_impl(&dword_210BD8000, v59, OS_LOG_TYPE_DEFAULT, "SPIR: %p: completing without requests [no remaining IDs to request] unpersonalizedContentDescriptors=%{public}@", buf, 0x16u);
        }

        goto LABEL_53;
      }
      if (v65)
      {
        v67 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        v77 = v67;
        _os_log_impl(&dword_210BD8000, v59, OS_LOG_TYPE_DEFAULT, "SPIR: %p: first batch complete without requests [prioritized IDs initially loaded], will continue to request remaining items", buf, 0xCu);
      }
    }
    else
    {
      v72 = v11;
      v46 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v47 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        v77 = v47;
        _os_log_impl(&dword_210BD8000, v46, OS_LOG_TYPE_ERROR, "SPIR: %p: generating ABC [siriAssetInfo provided, but prioritizedBatch not finished]", buf, 0xCu);
      }

      v70 = (void *)MEMORY[0x24BE65C38];
      v71 = *MEMORY[0x24BE65AB0];
      v73[0] = CFSTR("request");
      objc_msgSend(*(id *)(a1 + 32), "request");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "description");
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = (void *)v48;
      if (v48)
        v50 = (const __CFString *)v48;
      else
        v50 = CFSTR("@");
      v74[0] = v50;
      v73[1] = CFSTR("siriAssetInfo");
      objc_msgSend(*(id *)(a1 + 48), "abc_siriAssetInfo");
      v68 = objc_claimAutoreleasedReturnValue();
      v74[1] = v68;
      v73[2] = CFSTR("preferredShuffleStartIdentifiers");
      objc_msgSend(*(id *)(a1 + 48), "abc_preferredShuffleStartIdentifiers");
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = (void *)v51;
      if (v51)
        v53 = (const __CFString *)v51;
      else
        v53 = CFSTR("@");
      v74[2] = v53;
      v73[3] = CFSTR("accumulator.stateDump");
      -[MPCModelStorePlaybackItemsRequestAccumulator abc_stateDump](v26, "abc_stateDump");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v74[3] = v54;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v74, v73, 4);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v55;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v75, 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v71, CFSTR("Bug"), CFSTR("StorePlaybackItemsRequest-SiriAssetInfo"), CFSTR("InitialAccumulation"), 0, v56, 0);

      v57 = v69;
      v58 = v49;
      v59 = v68;
      v11 = v72;
    }

LABEL_46:
    if (v11)
    {
      v60 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        v77 = v61;
        _os_log_impl(&dword_210BD8000, v60, OS_LOG_TYPE_DEFAULT, "SPIR: %p: performing remaining lookups via StorePlatform", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "_runStorePlatformRequestToLoadMetadataWithAccumulator:previousResponse:", v26, v14);
      goto LABEL_54;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 57, CFSTR("Cannot make remaining requests for content because the user identity does not support it: %@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 312));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = *(_QWORD *)(a1 + 56);
    if (v62)
      (*(void (**)(uint64_t, _QWORD, void *))(v62 + 16))(v62, 0, v57);
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v57);
LABEL_53:

LABEL_54:
    v27 = 0;
LABEL_55:

    goto LABEL_56;
  }
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    v77 = v13;
    v78 = 2114;
    *(_QWORD *)v79 = v6;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_ERROR, "SPIR: %p: Unable to find user for identity: %{public}@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 57, CFSTR("Unable to find account for identity: %@"), v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 56);
  if (v15)
    (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v14);
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v14);
LABEL_56:

}

uint64_t __52__MPCModelStorePlaybackItemsRequestOperation_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "cancel");
}

@end
