@implementation MPCMediaRemoteCommandOperation

- (MPCMediaRemoteCommandOperation)initWithCommandRequest:(id)a3 options:(unint64_t)a4 sendDate:(id)a5
{
  id v9;
  id v10;
  MPCMediaRemoteCommandOperation *v11;
  MPCMediaRemoteCommandOperation *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MPCMediaRemoteCommandOperation;
  v11 = -[MPAsyncOperation init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_request, a3);
    v12->_options = a4;
    objc_storeStrong((id *)&v12->_sendDate, a5);
  }

  return v12;
}

- (BOOL)_checkDependenciesForFailures:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  MPCPlayerCommandStatus *v15;
  void *v16;
  void *v17;
  void *v18;
  MPCPlayerCommandStatus *v19;
  MPCPlayerCommandStatus *status;
  NSObject *v21;
  void *v22;
  MPCPlayerCommandStatus *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  MPCPlayerCommandStatus *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[MPCMediaRemoteCommandOperation dependencies](self, "dependencies", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          objc_msgSend(v11, "status");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "statusCode");

          if (v13)
          {
            -[MPAsyncOperation cancel](self, "cancel");
            v15 = [MPCPlayerCommandStatus alloc];
            v16 = (void *)MEMORY[0x24BDDCB80];
            objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlayerRequestError"), 1000, CFSTR("Did not attempt command because dependent command failed."));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "statusWithCode:error:", 200, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = -[MPCPlayerCommandStatus initWithMPStatus:request:](v15, "initWithMPStatus:request:", v18, self->_request);
            status = self->_status;
            self->_status = v19;

            v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              MPCRemoteCommandDescriptionCopy(-[MPCPlayerCommandRequest command](self->_request, "command"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = self->_status;
              *(_DWORD *)buf = 138543874;
              v32 = v22;
              v33 = 2114;
              v34 = v4;
              v35 = 2114;
              v36 = v23;
              _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_ERROR, "[PCR:%{public}@:%{public}@] performWithExtendedStatusCompletion: | failed to perform command [dependent command failed] status=%{public}@", buf, 0x20u);

            }
            objc_msgSend(v11, "status");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "error");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPAsyncOperation finishWithError:](self, "finishWithError:", v25);

            v14 = 1;
            goto LABEL_15;
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_15:

  return v14;
}

- (id)_wrapUnderlyingErrorsIfNeeded:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;

  v4 = a3;
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "statusCode");
  if (!v6)
    goto LABEL_11;
  v7 = v6;
  if (v6 == 1004)
  {
    v12 = (void *)MEMORY[0x24BDDCB80];
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlayerEnqueueError"), 2, v5, CFSTR("Feature requires active subscription"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12;
    v11 = 1004;
    goto LABEL_6;
  }
  if (v6 != 1001)
  {
    if (objc_msgSend(v4, "type") == 1 || objc_msgSend(v4, "type") == 3)
    {
      objc_msgSend(v5, "msv_errorByUnwrappingDomain:code:", CFSTR("MPCMusicSharePlayBehaviorError"), 10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "msv_errorByUnwrappingDomain:code:", CFSTR("MPCMusicBehaviorError"), 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "msv_errorByUnwrappingDomain:code:", CFSTR("MPCMusicBehaviorError"), 9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v17 = (void *)MEMORY[0x24BDDCB80];
        v18 = (void *)MEMORY[0x24BDD1540];
        v19 = CFSTR("Attempted to add unsupported content to Share Play");
      }
      else
      {
        if (!v15)
        {
          v17 = (void *)MEMORY[0x24BDDCB80];
          v18 = (void *)MEMORY[0x24BDD1540];
          if (!v16)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlayerRequestError"), 1001, v5, CFSTR("Failed to perform command %@"), self->_request);
            goto LABEL_16;
          }
          v19 = CFSTR("Radio station requires subscription");
          v20 = 5;
LABEL_15:
          objc_msgSend(v18, "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlayerEnqueueError"), v20, v5, v19, v23);
LABEL_16:
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "statusWithCode:error:", v7, v21);
          v13 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_17;
        }
        v17 = (void *)MEMORY[0x24BDDCB80];
        v18 = (void *)MEMORY[0x24BDD1540];
        v19 = CFSTR("Attempted to convert queue with unsupported content to Share Play");
      }
      v20 = 3;
      goto LABEL_15;
    }
LABEL_11:
    v13 = v4;
    goto LABEL_17;
  }
  v8 = (void *)MEMORY[0x24BDDCB80];
  objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlayerEnqueueError"), 1, v5, CFSTR("Queue is user curated and requires override"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v11 = 1001;
LABEL_6:
  objc_msgSend(v10, "statusWithCode:error:", v11, v9);
  v13 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v13;
}

- (BOOL)_handleLibraryManipulationCommandsForRequestID:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id *v11;
  uint64_t *v12;
  char v13;
  BOOL v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void *v19;
  MPCMediaRemoteCommandOperation *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void *v25;
  MPCMediaRemoteCommandOperation *v26;
  id v27;

  v4 = a3;
  -[MPCMediaRemoteCommandOperation request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[MPCMediaRemoteCommandOperation request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((isKindOfClass & 1) != 0)
  {
    if (objc_msgSend(v7, "value"))
      v9 = 2;
    else
      v9 = 3;
    objc_msgSend(v8, "modelObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __81__MPCMediaRemoteCommandOperation__handleLibraryManipulationCommandsForRequestID___block_invoke;
    v25 = &unk_24CAB3C88;
    v26 = self;
    v11 = &v27;
    v27 = v4;
    v12 = &v22;
  }
  else
  {
    objc_opt_class();
    v13 = objc_opt_isKindOfClass();

    if ((v13 & 1) == 0)
    {
      v14 = 0;
      goto LABEL_10;
    }
    -[MPCMediaRemoteCommandOperation request](self, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "value") ^ 1;
    objc_msgSend(v8, "modelObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __81__MPCMediaRemoteCommandOperation__handleLibraryManipulationCommandsForRequestID___block_invoke_2;
    v19 = &unk_24CAB3C88;
    v20 = self;
    v11 = &v21;
    v21 = v4;
    v12 = &v16;
  }
  -[MPCMediaRemoteCommandOperation performLibraryFavoriteEntityChangeRequestFor:withFavoriteEntityChangeRequestAction:completion:](self, "performLibraryFavoriteEntityChangeRequestFor:withFavoriteEntityChangeRequestAction:completion:", v10, v9, v12, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27);

  v14 = 1;
LABEL_10:

  return v14;
}

- (void)_completeRequestID:(id)a3 withStatus:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  NSData *v12;
  NSData *tokenB;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD);
  MPCPlayerCommandStatus *v19;
  MPCPlayerCommandStatus *status;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  MPCPlayerCommandStatus *v25;
  const char *v26;
  NSObject *v27;
  os_log_type_t v28;
  MPCPlayerCommandStatus *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  MPCPlayerCommandStatus *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[MPCMediaRemoteCommandOperation request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "command");

  if (v9 != 125 && v9 != 122
    || objc_msgSend(v7, "type") != 999
    || (objc_msgSend(v7, "customDataType"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isEqual:", CFSTR("com.apple.music/wha-delegation/b")),
        v10,
        !v11))
  {
    -[MPCMediaRemoteCommandOperation _wrapUnderlyingErrorsIfNeeded:](self, "_wrapUnderlyingErrorsIfNeeded:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCMediaRemoteCommandOperation request](self, "request");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "statusTransformer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[MPCMediaRemoteCommandOperation request](self, "request");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "statusTransformer");
      v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v18)[2](v18, v14);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = v14;
    }
    v19 = -[MPCPlayerCommandStatus initWithMPStatus:request:]([MPCPlayerCommandStatus alloc], "initWithMPStatus:request:", v7, self->_request);
    status = self->_status;
    self->_status = v19;

    -[MPCPlayerCommandStatus error](self->_status, "error");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        MPCRemoteCommandDescriptionCopy(-[MPCPlayerCommandRequest command](self->_request, "command"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = self->_status;
        v31 = 138543874;
        v32 = v24;
        v33 = 2114;
        v34 = v6;
        v35 = 2114;
        v36 = v25;
        v26 = "[PCR:%{public}@:%{public}@] performWithExtendedStatusCompletion: | failed to perform command [failed statu"
              "s] status=%{public}@";
        v27 = v23;
        v28 = OS_LOG_TYPE_ERROR;
LABEL_14:
        _os_log_impl(&dword_210BD8000, v27, v28, v26, (uint8_t *)&v31, 0x20u);

      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      MPCRemoteCommandDescriptionCopy(-[MPCPlayerCommandRequest command](self->_request, "command"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = self->_status;
      v31 = 138543874;
      v32 = v24;
      v33 = 2114;
      v34 = v6;
      v35 = 2114;
      v36 = v29;
      v26 = "[PCR:%{public}@:%{public}@] performWithExtendedStatusCompletion: | finished command [] status=%{public}@";
      v27 = v23;
      v28 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_14;
    }

    objc_msgSend(v7, "error");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAsyncOperation finishWithError:](self, "finishWithError:", v30);

    goto LABEL_16;
  }
  objc_msgSend(v7, "customData");
  v12 = (NSData *)objc_claimAutoreleasedReturnValue();
  tokenB = self->_tokenB;
  self->_tokenB = v12;

  -[MPCMediaRemoteCommandOperation execute](self, "execute");
LABEL_16:

}

- (void)execute
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  MPCPlayerCommandStatus *v14;
  void *v15;
  void *v16;
  void *v17;
  MPCPlayerCommandStatus *v18;
  MPCPlayerCommandStatus *status;
  NSObject *v20;
  void *v21;
  MPCPlayerCommandStatus *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  MPCPlayerCommandStatus *v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  MPCMediaRemoteCommandOperation *v55;
  id v56;
  _QWORD v57[4];
  id v58;
  MPCMediaRemoteCommandOperation *v59;
  id v60;
  id v61;
  int v62;
  _QWORD v63[6];
  _QWORD v64[5];
  id v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  MPCPlayerCommandStatus *v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  -[MPCMediaRemoteCommandOperation request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  v10 = *MEMORY[0x24BE658C0];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE658C0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v10);
  }
  if (self->_tokenB)
  {
    objc_msgSend(v11, "stringByAppendingString:", CFSTR("-tokenE"));
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v10);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", self->_tokenB, CFSTR("MPCPlayerCommandRequestMediaRemoteOptionDelegationTokenB"));
    v11 = (void *)v13;
  }
  if (-[MPAsyncOperation isCancelled](self, "isCancelled"))
  {
    v14 = [MPCPlayerCommandStatus alloc];
    v15 = (void *)MEMORY[0x24BDDCB80];
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCPlayerRequestError"), 1000, CFSTR("Command was cancelled before it was performed."));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "statusWithCode:error:", 200, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[MPCPlayerCommandStatus initWithMPStatus:request:](v14, "initWithMPStatus:request:", v17, self->_request);
    status = self->_status;
    self->_status = v18;

    v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      MPCRemoteCommandDescriptionCopy(-[MPCPlayerCommandRequest command](self->_request, "command"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = self->_status;
      *(_DWORD *)buf = 138543874;
      v67 = v21;
      v68 = 2114;
      v69 = v11;
      v70 = 2114;
      v71 = v22;
      _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_ERROR, "[PCR:%{public}@:%{public}@] performWithExtendedStatusCompletion: | failed to perform command [canceled before sending] status=%{public}@", buf, 0x20u);

    }
    -[MPAsyncOperation finish](self, "finish");
    goto LABEL_36;
  }
  if ((-[MPCMediaRemoteCommandOperation options](self, "options") & 1) == 0
    && -[MPCMediaRemoteCommandOperation _checkDependenciesForFailures:](self, "_checkDependenciesForFailures:", v11))
  {
    goto LABEL_36;
  }
  v23 = *MEMORY[0x24BE658A0];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE658A0]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    v25 = (void *)MEMORY[0x24BDD16E0];
    -[NSDate timeIntervalSinceReferenceDate](self->_sendDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(v25, "numberWithDouble:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v26, v23);

  }
  -[MPCMediaRemoteCommandOperation request](self, "request");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "label");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v28, "length"))
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v28, *MEMORY[0x24BE65990]);
  if ((-[MPCMediaRemoteCommandOperation options](self, "options") & 0x10000) != 0)
  {
    -[MPCMediaRemoteCommandOperation request](self, "request");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "userInitiatedOptions");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v30, "count"))
      objc_msgSend(v9, "addEntriesFromDictionary:", v30);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE658F0]);

  }
  -[MPCMediaRemoteCommandOperation request](self, "request");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "controller");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {

  }
  else
  {
    -[MPCMediaRemoteCommandOperation request](self, "request");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "playerPath");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
      goto LABEL_26;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlayerChangeRequest.m"), 429, CFSTR("Either Controller or PlayerPath is required to perform a change request."));
  }

LABEL_26:
  -[MPCMediaRemoteCommandOperation request](self, "request");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "command");

  if (!-[MPCMediaRemoteCommandOperation _handleLibraryManipulationCommandsForRequestID:](self, "_handleLibraryManipulationCommandsForRequestID:", v11))
  {
    -[MPCMediaRemoteCommandOperation request](self, "request");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "controller");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        MPCRemoteCommandDescriptionCopy(-[MPCPlayerCommandRequest command](self->_request, "command"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v67 = v40;
        v68 = 2114;
        v69 = v11;
        _os_log_impl(&dword_210BD8000, v39, OS_LOG_TYPE_DEFAULT, "[PCR:%{public}@:%{public}@] performWithExtendedStatusCompletion: | sending command []", buf, 0x16u);

      }
      -[MPCMediaRemoteCommandOperation request](self, "request");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "controller");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = MEMORY[0x24BDAC760];
      v64[1] = 3221225472;
      v64[2] = __41__MPCMediaRemoteCommandOperation_execute__block_invoke;
      v64[3] = &unk_24CAB3C88;
      v64[4] = self;
      v65 = v11;
      objc_msgSend(v42, "sendCommand:options:completion:", v36, v9, v64);

      v43 = v65;
    }
    else
    {
      v44 = objc_alloc(MEMORY[0x24BE65C40]);
      v45 = MEMORY[0x24BDAC760];
      v63[0] = MEMORY[0x24BDAC760];
      v63[1] = 3221225472;
      v63[2] = __41__MPCMediaRemoteCommandOperation_execute__block_invoke_2;
      v63[3] = &unk_24CAB90B0;
      v63[4] = self;
      v63[5] = a2;
      v46 = (void *)objc_msgSend(v44, "initWithDeallocHandler:", v63);
      v47 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        MPCRemoteCommandDescriptionCopy(-[MPCPlayerCommandRequest command](self->_request, "command"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCMediaRemoteCommandOperation request](self, "request");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "playerPath");
        v50 = (MPCPlayerCommandStatus *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v67 = v48;
        v68 = 2114;
        v69 = v11;
        v70 = 2114;
        v71 = v50;
        _os_log_impl(&dword_210BD8000, v47, OS_LOG_TYPE_DEFAULT, "[PCR:%{public}@:%{public}@] performWithExtendedStatusCompletion: | resolving player path [] playerPath=%{public}@", buf, 0x20u);

        v45 = MEMORY[0x24BDAC760];
      }

      -[MPCMediaRemoteCommandOperation request](self, "request");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "playerPath");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = v45;
      v57[1] = 3221225472;
      v57[2] = __41__MPCMediaRemoteCommandOperation_execute__block_invoke_167;
      v57[3] = &unk_24CAB3CB0;
      v58 = v46;
      v59 = self;
      v60 = v11;
      v62 = v36;
      v61 = v9;
      v53[0] = v45;
      v53[1] = 3221225472;
      v53[2] = __41__MPCMediaRemoteCommandOperation_execute__block_invoke_2_171;
      v53[3] = &unk_24CAB3CD8;
      v54 = v58;
      v55 = self;
      v56 = v60;
      v43 = v58;
      objc_msgSend(v52, "resolveWithRouteResolvedHandler:completion:", v57, v53);

    }
  }

LABEL_36:
}

- (void)performLibraryFavoriteEntityChangeRequestFor:(id)a3 withFavoriteEntityChangeRequestAction:(int64_t)a4 completion:(id)a5
{
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v7 = a5;
  v8 = (objc_class *)MEMORY[0x24BDDC8D8];
  v9 = a3;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithChangeAction:", a4);
  v11 = objc_alloc_init(MEMORY[0x24BDDC8D0]);
  objc_msgSend(v11, "setModelObject:", v9);

  objc_msgSend(v11, "setRequestAction:", v10);
  objc_msgSend(MEMORY[0x24BDDC908], "sharedDeviceLibraryController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __128__MPCMediaRemoteCommandOperation_performLibraryFavoriteEntityChangeRequestFor_withFavoriteEntityChangeRequestAction_completion___block_invoke;
  v14[3] = &unk_24CAB9A98;
  v15 = v7;
  v13 = v7;
  objc_msgSend(v12, "performFavoriteStateChangeRequest:withRelatedModelObjects:completion:", v11, 0, v14);

}

- (MPCPlayerCommandRequest)request
{
  return self->_request;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSDate)sendDate
{
  return self->_sendDate;
}

- (MPCPlayerCommandStatus)status
{
  return self->_status;
}

- (NSData)tokenB
{
  return self->_tokenB;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenB, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_sendDate, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

void __128__MPCMediaRemoteCommandOperation_performLibraryFavoriteEntityChangeRequestFor_withFavoriteEntityChangeRequestAction_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (a2)
  {
    v3 = 200;
    v4 = a2;
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x24BDDCB80], "statusWithCode:error:", v3, v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __41__MPCMediaRemoteCommandOperation_execute__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeRequestID:withStatus:", *(_QWORD *)(a1 + 40), a2);
}

void __41__MPCMediaRemoteCommandOperation_execute__block_invoke_2(uint64_t a1)
{
  id v2;

  if (MSVDeviceOSIsInternalInstall())
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("MPCPlayerChangeRequest.m"), 444, CFSTR("MPCPlayerCommandRequest player path resolution completion not called"));

  }
}

void __41__MPCMediaRemoteCommandOperation_execute__block_invoke_167(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
  {
    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      MPCRemoteCommandDescriptionCopy(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 272), "command"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v13 = v5;
      v14 = 2114;
      v15 = v6;
      v16 = 2114;
      v17 = v3;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[PCR:%{public}@:%{public}@] performWithExtendedStatusCompletion: | resolved player path route [] playerPath=%{public}@", buf, 0x20u);

    }
    v7 = *(unsigned int *)(a1 + 64);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __41__MPCMediaRemoteCommandOperation_execute__block_invoke_169;
    v10[3] = &unk_24CAB3C88;
    v8 = *(void **)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v10[4] = *(_QWORD *)(a1 + 40);
    v11 = v8;
    +[MPCMediaRemoteController sendCommand:options:toPlayerPath:completion:](MPCMediaRemoteController, "sendCommand:options:toPlayerPath:completion:", v7, v9, v3, v10);

  }
}

void __41__MPCMediaRemoteCommandOperation_execute__block_invoke_2_171(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(*(id *)(a1 + 40), "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "playerPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCError"), 1000, v6, CFSTR("PlayerPath did not resolve route to origin: %@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      MPCRemoteCommandDescriptionCopy(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 272), "command"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v10, "msv_description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v17 = v12;
      v18 = 2114;
      v19 = v13;
      v20 = 2114;
      v21 = v5;
      v22 = 2114;
      v23 = v14;
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_ERROR, "[PCR:%{public}@:%{public}@] performWithExtendedStatusCompletion: | failed to resolve player path route [] playerPath=%{public}@ error=%{public}@", buf, 0x2Au);

    }
    objc_msgSend(MEMORY[0x24BDDCB80], "statusWithCode:error:", 200, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_completeRequestID:withStatus:", *(_QWORD *)(a1 + 48), v15);

  }
}

uint64_t __41__MPCMediaRemoteCommandOperation_execute__block_invoke_169(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeRequestID:withStatus:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __81__MPCMediaRemoteCommandOperation__handleLibraryManipulationCommandsForRequestID___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeRequestID:withStatus:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __81__MPCMediaRemoteCommandOperation__handleLibraryManipulationCommandsForRequestID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeRequestID:withStatus:", *(_QWORD *)(a1 + 40), a2);
}

@end
