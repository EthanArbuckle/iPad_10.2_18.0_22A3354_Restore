@implementation MSDeleter

- (MSDeleter)initWithPersonID:(id)a3 baseURL:(id)a4
{
  id v6;
  id v7;
  MSDeleter *v8;
  MSObjectQueue *v9;
  void *v10;
  uint64_t v11;
  MSObjectQueue *deleteQueue;
  NSMutableArray *v13;
  NSMutableArray *requestedDeleteWrappers;
  MSDeleteStreamsProtocol *v15;
  MSDeleteStreamsProtocol *protocol;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MSDeleter;
  v8 = -[MSCupidStateMachine initWithPersonID:](&v18, sel_initWithPersonID_, v6);
  if (v8)
  {
    v9 = [MSObjectQueue alloc];
    MSPathDeleteQueueForPersonID(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MSObjectQueue initWithPath:](v9, "initWithPath:", v10);
    deleteQueue = v8->_deleteQueue;
    v8->_deleteQueue = (MSObjectQueue *)v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    requestedDeleteWrappers = v8->_requestedDeleteWrappers;
    v8->_requestedDeleteWrappers = v13;

    v15 = -[MSDeleteStreamsProtocol initWithPersonID:baseURL:]([MSDeleteStreamsProtocol alloc], "initWithPersonID:baseURL:", v6, v7);
    protocol = v8->_protocol;
    v8->_protocol = v15;

    -[MSStreamsProtocol setDelegate:](v8->_protocol, "setDelegate:", v8);
    v8->_batchSize = 10;
    v8->_maxErrorCount = 3;
  }

  return v8;
}

- (void)deactivate
{
  MSDeleteStreamsProtocol *protocol;
  MSObjectQueue *deleteQueue;
  NSMutableArray *requestedDeleteWrappers;
  objc_super v6;

  -[MSDeleter stop](self, "stop");
  protocol = self->_protocol;
  self->_protocol = 0;

  deleteQueue = self->_deleteQueue;
  self->_deleteQueue = 0;

  requestedDeleteWrappers = self->_requestedDeleteWrappers;
  self->_requestedDeleteWrappers = 0;

  v6.receiver = self;
  v6.super_class = (Class)MSDeleter;
  -[MSCupidStateMachine deactivate](&v6, sel_deactivate);
}

- (void)dealloc
{
  objc_super v3;

  -[MSDeleter deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)MSDeleter;
  -[MSCupidStateMachine dealloc](&v3, sel_dealloc);
}

- (void)_updateMasterManifest
{
  int64_t v3;
  void *v4;
  BOOL v5;
  id v6;
  id v7;

  -[MSCupidStateMachine _latestNextActivityDate](self, "_latestNextActivityDate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[MSObjectQueue count](self->_deleteQueue, "count");
  -[MSCupidStateMachine personID](self, "personID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v5 = v7 == 0;
  else
    v5 = 1;
  if (v5)
    v6 = 0;
  else
    v6 = v7;
  +[MSDeleter _setMasterNextActivityDate:forPersonID:](MSDeleter, "_setMasterNextActivityDate:forPersonID:", v6, v4);

  _commitMasterManifest_2926();
}

- (BOOL)_isAllowedToDelete
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  BOOL result;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  MSPlatform();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  MSPlatform();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    v7 = objc_msgSend(v5, "policyMaySendDelete");

    if ((v7 & 1) == 0)
      goto LABEL_6;
  }
  else
  {
    v8 = objc_msgSend(v5, "policyMayUpload");

    if (!v8)
      goto LABEL_6;
  }
  -[MSCupidStateMachine _latestNextActivityDate](self, "_latestNextActivityDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "compare:", v10);

  if (v11 != 1)
    return 1;
LABEL_6:
  v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v12)
  {
    v14 = (void *)objc_opt_class();
    v15 = v14;
    -[MSCupidStateMachine personID](self, "personID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v14;
    v19 = 2112;
    v20 = v16;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Not sending delete request at this time.", (uint8_t *)&v17, 0x16u);

    return 0;
  }
  return result;
}

- (void)deleteAssetCollections:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD block[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    -[MSCupidStateMachine personID](self, "personID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = v5;
    v23 = 2112;
    v24 = v7;
    v25 = 2114;
    v26 = v4;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@ - %@ Deleting asset collections: %{public}@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        +[MSObjectWrapper wrapperWithObject:size:](MSObjectWrapper, "wrapperWithObject:size:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  -[MSObjectQueue appendObjectWrappers:](self->_deleteQueue, "appendObjectWrappers:", v8);
  -[MSDeleter _updateMasterManifest](self, "_updateMasterManifest");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__MSDeleter_deleteAssetCollections___block_invoke;
  block[3] = &unk_1E95BCED0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)performOutstandingActivities
{
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[MSCupidStateMachine hasDeactivated](self, "hasDeactivated"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_opt_class();
      -[MSCupidStateMachine personID](self, "personID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138543618;
      v6 = v3;
      v7 = 2112;
      v8 = v4;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Not deleting because we're shutting down.", (uint8_t *)&v5, 0x16u);

    }
  }
  else if (self->_state <= 1u && -[MSDeleter _isAllowedToDelete](self, "_isAllowedToDelete"))
  {
    -[MSDaemon retainBusy](self->_daemon, "retainBusy");
    self->_state = 2;
    -[MSDeleter _sendDeleteRequest](self, "_sendDeleteRequest");
  }
}

- (void)_sendDeleteRequest
{
  NSMutableArray *requestedDeleteWrappers;
  void *v4;
  MSDeleteStreamsProtocol *protocol;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray removeAllObjects](self->_requestedDeleteWrappers, "removeAllObjects");
  requestedDeleteWrappers = self->_requestedDeleteWrappers;
  -[MSObjectQueue objectWrappersWithZeroSizeMaxCount:](self->_deleteQueue, "objectWrappersWithZeroSizeMaxCount:", self->_batchSize);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](requestedDeleteWrappers, "addObjectsFromArray:", v4);

  if (-[NSMutableArray count](self->_requestedDeleteWrappers, "count"))
  {
    self->_state = 3;
    protocol = self->_protocol;
    +[MSObjectWrapper objectsFromWrappers:](MSObjectWrapper, "objectsFromWrappers:", self->_requestedDeleteWrappers);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[MSDeleteStreamsProtocol sendDeletionRequestForAssetCollections:](protocol, "sendDeletionRequestForAssetCollections:");

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_opt_class();
      v7 = v6;
      -[MSCupidStateMachine personID](self, "personID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v11 = v6;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ No outstanding deletes to send.", buf, 0x16u);

    }
    -[MSDeleter _updateMasterManifest](self, "_updateMasterManifest");
    self->_state = 0;
    -[MSDaemon releaseBusy](self->_daemon, "releaseBusy");
  }
}

- (void)deleteProtocol:(id)a3 didReceiveAuthenticationError:(id)a4
{
  id v5;
  MSMediaStreamDaemon *daemon;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    -[MSCupidStateMachine personID](self, "personID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v8;
    v13 = 2112;
    v14 = v10;
    v15 = 2114;
    v16 = v5;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Found authentication error. Will try again later. %{public}@", (uint8_t *)&v11, 0x20u);

  }
  -[MSCupidStateMachine _resetStreamsBackoffTimer](self, "_resetStreamsBackoffTimer");
  self->_state = 1;
  daemon = self->_daemon;
  -[MSCupidStateMachine personID](self, "personID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSMediaStreamDaemon didReceiveAuthenticationFailureForPersonID:](daemon, "didReceiveAuthenticationFailureForPersonID:", v7);

  -[MSDaemon releaseBusy](self->_daemon, "releaseBusy");
}

- (void)deleteProtocol:(id)a3 didFinishSuccessfulCollections:(id)a4 failedCollections:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int state;
  unint64_t v15;
  int v16;
  _BOOL4 v17;
  char v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  unint64_t v36;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  MSMediaStreamDaemon *daemon;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  uint64_t v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  _QWORD block[5];
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
  _BYTE v80[128];
  _BYTE v81[128];
  uint8_t v82[128];
  uint8_t buf[4];
  _BYTE v84[10];
  void *v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  id v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  state = self->_state;
  if (state == 3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v45 = (void *)objc_opt_class();
      v46 = v10;
      v47 = v45;
      -[MSCupidStateMachine personID](self, "personID");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)v84 = v45;
      *(_WORD *)&v84[8] = 2112;
      v85 = v48;
      v86 = 2114;
      v87 = (uint64_t)v11;
      v88 = 2114;
      v89 = v12;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Received delete response. Successful deletes: %{public}@\n\nFailed deletes: %{public}@", buf, 0x2Au);

      v10 = v46;
    }
    v15 = 0x1EFE31000;
    if (v13)
    {
      v16 = objc_msgSend(v13, "MSIsTemporaryNetworkError");
      v17 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v16)
      {
        if (v17)
        {
          v49 = (void *)objc_opt_class();
          v50 = v10;
          v51 = v49;
          -[MSCupidStateMachine personID](self, "personID");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)v84 = v49;
          *(_WORD *)&v84[8] = 2112;
          v85 = v52;
          _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Encountered temporary network issues during deletion. Will retry later.", buf, 0x16u);

          v15 = 0x1EFE31000;
          v10 = v50;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)v84 = v13;
          _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "... Error: %{public}@", buf, 0xCu);
        }
        v18 = 1;
      }
      else
      {
        if (v17)
        {
          v53 = (void *)objc_opt_class();
          v61 = v53;
          -[MSCupidStateMachine personID](self, "personID");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "MSVerboseDescription");
          v55 = v10;
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)v84 = v53;
          *(_WORD *)&v84[8] = 2112;
          v85 = v54;
          v86 = 2114;
          v87 = (uint64_t)v56;
          _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Error sending delete request: %{public}@", buf, 0x20u);

          v10 = v55;
          v15 = 0x1EFE31000;

        }
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "MSNeedsBackoff"))
          -[MSCupidStateMachine _backoffStreamsBackoffTimer](self, "_backoffStreamsBackoffTimer");
        v65 = v12;
        if (objc_msgSend(v13, "MSIsCounted"))
        {
          v74 = 0u;
          v75 = 0u;
          v72 = 0u;
          v73 = 0u;
          v63 = v10;
          v24 = self->_requestedDeleteWrappers;
          v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v73;
            do
            {
              for (i = 0; i != v26; ++i)
              {
                if (*(_QWORD *)v73 != v27)
                  objc_enumerationMutation(v24);
                v29 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
                objc_msgSend(v29, "setErrorCount:", objc_msgSend(v29, "errorCount") + 1);
                if ((int)objc_msgSend(v29, "errorCount") >= self->_maxErrorCount)
                  objc_msgSend(v23, "addObject:", v29);
              }
              v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
            }
            while (v26);
          }

          -[MSObjectQueue commitErrorCountsForObjectWrappers:](self->_deleteQueue, "commitErrorCountsForObjectWrappers:", self->_requestedDeleteWrappers);
          v10 = v63;
          v12 = v65;
          v15 = 0x1EFE31000;
        }
        if (objc_msgSend(v23, "count"))
        {
          v30 = v10;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v57 = (void *)objc_opt_class();
            v58 = v57;
            -[MSCupidStateMachine personID](self, "personID");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v23, "count");
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)v84 = v57;
            *(_WORD *)&v84[8] = 2112;
            v85 = v59;
            v86 = 2048;
            v87 = v60;
            _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Giving up sending %lu delete requests.", buf, 0x20u);

          }
          -[NSMutableArray removeObjectsInArray:](self->_requestedDeleteWrappers, "removeObjectsInArray:", v23);
          -[MSObjectQueue removeObjectWrappersFromQueue:](self->_deleteQueue, "removeObjectWrappersFromQueue:", v23);
          -[MSDeleter _updateMasterManifest](self, "_updateMasterManifest");
          +[MSObjectWrapper objectsFromWrappers:](MSObjectWrapper, "objectsFromWrappers:", v23);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = 0u;
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v69;
            do
            {
              for (j = 0; j != v33; ++j)
              {
                if (*(_QWORD *)v69 != v34)
                  objc_enumerationMutation(v31);
                -[MSDeleterDelegate deleter:didFinishDeletingAssetCollection:error:](self->_delegate, "deleter:didFinishDeletingAssetCollection:error:", self, *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j), v13);
              }
              v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
            }
            while (v33);
          }

          v10 = v30;
          v12 = v65;
          v15 = 0x1EFE31000;
        }

        v18 = 0;
      }
      v36 = 0x1EFE31000;
    }
    else
    {
      v62 = v10;
      v64 = v12;
      v66 = v11;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v19 = (void *)objc_opt_class();
        v20 = v19;
        -[MSCupidStateMachine personID](self, "personID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[NSMutableArray count](self->_requestedDeleteWrappers, "count");
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)v84 = v19;
        *(_WORD *)&v84[8] = 2112;
        v85 = v21;
        v86 = 2048;
        v87 = v22;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@ - %@ Successfully sent %lu delete requests.", buf, 0x20u);

      }
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v37 = self->_requestedDeleteWrappers;
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v77;
        do
        {
          for (k = 0; k != v39; ++k)
          {
            if (*(_QWORD *)v77 != v40)
              objc_enumerationMutation(v37);
            objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * k), "object");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[MSDeleterDelegate deleter:didFinishDeletingAssetCollection:error:](self->_delegate, "deleter:didFinishDeletingAssetCollection:error:", self, v42, 0);

          }
          v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
        }
        while (v39);
      }

      v36 = 0x1EFE31000uLL;
      -[MSObjectQueue removeObjectWrappersFromQueue:](self->_deleteQueue, "removeObjectWrappersFromQueue:", self->_requestedDeleteWrappers);
      -[NSMutableArray removeAllObjects](self->_requestedDeleteWrappers, "removeAllObjects");
      v15 = 0x1EFE31000uLL;
      daemon = self->_daemon;
      -[MSCupidStateMachine personID](self, "personID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSMediaStreamDaemon didReceiveAuthenticationSuccessForPersonID:](daemon, "didReceiveAuthenticationSuccessForPersonID:", v44);

      -[MSCupidStateMachine _resetStreamsBackoffTimer](self, "_resetStreamsBackoffTimer");
      v18 = 0;
      v10 = v62;
      v12 = v64;
      v11 = v66;
    }
    if (objc_msgSend(*(id *)((char *)&self->super.super.isa + *(int *)(v36 + 3204)), "count"))
    {
      self->_state = 1;
      if ((v18 & 1) == 0)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __83__MSDeleter_deleteProtocol_didFinishSuccessfulCollections_failedCollections_error___block_invoke;
        block[3] = &unk_1E95BCED0;
        block[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], block);
      }
    }
    else
    {
      self->_state = 0;
    }
    objc_msgSend(*(id *)((char *)&self->super.super.isa + *(int *)(v15 + 3228)), "releaseBusy");
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v84 = 3;
    *(_WORD *)&v84[4] = 1024;
    *(_DWORD *)&v84[6] = state;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Wrong state detected. Expected %d, actually %d. Not serving message.", buf, 0xEu);
  }

}

- (void)_stop
{
  int state;

  state = self->_state;
  if (state == 3)
  {
    -[MSDeleteStreamsProtocol abort](self->_protocol, "abort");
    state = self->_state;
  }
  if ((state & 0xFFFFFFFE) == 2)
    -[MSDaemon releaseBusy](self->_daemon, "releaseBusy");
  -[NSMutableArray removeAllObjects](self->_requestedDeleteWrappers, "removeAllObjects");
  self->_state = 0;
}

- (id)_abortedError
{
  void *v2;
  __CFString *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_DELETER_ABORTED"));
  objc_msgSend(v2, "MSErrorWithDomain:code:description:", CFSTR("MSDeleterErrorDomain"), 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_abort
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  MSDeleterDelegate *delegate;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MSDeleter _stop](self, "_stop");
  -[MSDeleter _abortedError](self, "_abortedError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSObjectQueue allObjectWrappersMaxCount:](self->_deleteQueue, "allObjectWrappersMaxCount:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  while (objc_msgSend(v4, "count"))
  {
    v5 = (void *)MEMORY[0x1D8255C20]();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          delegate = self->_delegate;
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "object");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSDeleterDelegate deleter:didFinishDeletingAssetCollection:error:](delegate, "deleter:didFinishDeletingAssetCollection:error:", self, v12, v3);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    -[MSObjectQueue removeObjectWrappersFromQueue:](self->_deleteQueue, "removeObjectWrappersFromQueue:", v6);
    objc_autoreleasePoolPop(v5);
    -[MSObjectQueue allObjectWrappersMaxCount:](self->_deleteQueue, "allObjectWrappersMaxCount:", 5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[MSDeleter _updateMasterManifest](self, "_updateMasterManifest");

}

- (void)_forget
{
  MSObjectQueue *deleteQueue;

  deleteQueue = self->_deleteQueue;
  self->_deleteQueue = 0;

}

- (BOOL)_isInRetryState
{
  return self->_state == 1;
}

- (MSDeleterDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MSDeleterDelegate *)a3;
}

- (MSMediaStreamDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
  self->_daemon = (MSMediaStreamDaemon *)a3;
}

- (int)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(int)a3
{
  self->_batchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedDeleteWrappers, 0);
  objc_storeStrong((id *)&self->_deleteQueue, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
}

uint64_t __83__MSDeleter_deleteProtocol_didFinishSuccessfulCollections_failedCollections_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performOutstandingActivities");
}

uint64_t __36__MSDeleter_deleteAssetCollections___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performOutstandingActivities");
}

+ (id)deleterForPersonID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  MSDeleter *v7;
  MSDeleter *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)_deleterByID;
    if (!_deleterByID)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v6 = (void *)_deleterByID;
      _deleterByID = (uint64_t)v5;

      v4 = (void *)_deleterByID;
    }
    objc_msgSend(v4, "objectForKey:", v3);
    v7 = (MSDeleter *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v8 = [MSDeleter alloc];
      MSPlatform();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "baseURLForPersonID:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[MSDeleter initWithPersonID:baseURL:](v8, "initWithPersonID:baseURL:", v3, v10);

      objc_msgSend((id)_deleterByID, "setObject:forKey:", v7, v3);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)existingDeleterForPersonID:(id)a3
{
  return (id)objc_msgSend((id)_deleterByID, "objectForKey:", a3);
}

+ (id)_clearInstantiatedDeletersByPersonID
{
  id v2;
  void *v3;

  v2 = (id)_deleterByID;
  v3 = (void *)_deleterByID;
  _deleterByID = 0;

  return v2;
}

+ (void)forgetPersonID:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend((id)_deleterByID, "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "forget");
    objc_msgSend((id)_deleterByID, "removeObjectForKey:", v5);
  }

}

+ (void)_setMasterNextActivityDate:(id)a3 forPersonID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    _masterNextActivityDateByPersonID_2948();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
      objc_msgSend(v7, "setObject:forKey:", v5, v6);
    else
      objc_msgSend(v7, "removeObjectForKey:", v6);
    _commitMasterManifest_2926();
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = 138543362;
    v10 = (id)objc_opt_class();
    v8 = v10;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - Found empty person ID.", (uint8_t *)&v9, 0xCu);
LABEL_8:

  }
}

+ (id)nextActivityDate
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _masterNextActivityDateByPersonID_2948();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(v2, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (!v5 || objc_msgSend(v8, "compare:", v5) == -1)
        {
          v10 = v9;

          v5 = v10;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)nextActivityDateForPersonID:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  _masterNextActivityDateByPersonID_2948();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)personIDsWithOutstandingActivities
{
  void *v2;
  void *v3;

  _masterNextActivityDateByPersonID_2948();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)stopAllActivities
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend((id)_deleterByID, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "stop");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

+ (void)abortAllActivities
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend((id)_deleterByID, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "abort");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

+ (BOOL)isInRetryState
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend((id)_deleterByID, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "_isInRetryState") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

@end
