@implementation HFSoftwareUpdateManager

- (BOOL)hasSoftwareUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "supportsSoftwareUpdateV2"))
  {
    -[HFSoftwareUpdateManager accessoryUniqueIDToSoftwareUpdateMapTable](self, "accessoryUniqueIDToSoftwareUpdateMapTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "softwareUpdateController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "availableUpdate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
  }

  return v7 != 0;
}

- (void)startObservingSoftwareUpdatesForAccessories:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  HFSoftwareUpdateManager *v17;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "na_map:", &__block_literal_global_184);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "count"))
    {
LABEL_8:

      goto LABEL_9;
    }
    -[HFSoftwareUpdateManager dispatcher](self, "dispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "softwareUpdateController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

    }
    else
    {
      v11 = +[HFUtilities isInternalTest](HFUtilities, "isInternalTest");

      if (v11)
        goto LABEL_7;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSoftwareUpdateManager.m"), 184, CFSTR("[SUBSCRIBE] softwareUpdateObserverDispatcher is nil"));
    }

LABEL_7:
    -[HFSoftwareUpdateManager dispatcher](self, "dispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "softwareUpdateController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __71__HFSoftwareUpdateManager_startObservingSoftwareUpdatesForAccessories___block_invoke_2;
    v15[3] = &unk_1EA726360;
    v16 = v5;
    v17 = self;
    objc_msgSend(v14, "subscribe:completion:", v6, v15);

    goto LABEL_8;
  }
LABEL_9:

}

id __71__HFSoftwareUpdateManager_startObservingSoftwareUpdatesForAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "supportsSoftwareUpdateV2"))
  {
    objc_msgSend(v2, "uniqueIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)isSoftwareUpdateInstalled:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[HFSoftwareUpdateManager hasSoftwareUpdate:](self, "hasSoftwareUpdate:", v4))
    goto LABEL_9;
  v5 = -[HFSoftwareUpdateManager _softwareUpdateStateForAccessory:](self, "_softwareUpdateStateForAccessory:", v4);
  v6 = 0;
  if (v5 >= 4 && v5 != 5)
  {
    if (v5 == 4)
    {
      v6 = -[HFSoftwareUpdateManager softwareUpdatePossessesNecessaryDocumentation:](self, "softwareUpdatePossessesNecessaryDocumentation:", v4);
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Yet to handle HMSoftwareUpdateState: %lu"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0x3FuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    NSLog(CFSTR("%@"), v7);
LABEL_9:
    v6 = 0;
  }
LABEL_10:

  return v6;
}

- (BOOL)isSoftwareUpdateInProgress:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[HFSoftwareUpdateManager isDownloadingSoftwareUpdate:](self, "isDownloadingSoftwareUpdate:", v4)
    || -[HFSoftwareUpdateManager isInstallingSoftwareUpdate:](self, "isInstallingSoftwareUpdate:", v4)
    || -[HFSoftwareUpdateManager hasRequestedSoftwareUpdate:](self, "hasRequestedSoftwareUpdate:", v4);

  return v5;
}

- (BOOL)isReadyToInstallSoftwareUpdate:(id)a3
{
  id v4;
  int64_t v5;
  NSObject *v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  void *v11;
  uint8_t buf[4];
  int64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HFSoftwareUpdateManager hasSoftwareUpdate:](self, "hasSoftwareUpdate:", v4))
  {
    v5 = -[HFSoftwareUpdateManager _softwareUpdateStateForAccessory:](self, "_softwareUpdateStateForAccessory:", v4);
    HFLogForCategory(0x3FuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v13 = v5;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "[isReadyToInstallSoftwareUpdate] state: %ld for accessory: %@", buf, 0x16u);
    }

    v7 = 0;
    switch(v5)
    {
      case 0:
        v7 = -[HFSoftwareUpdateManager softwareUpdatePossessesNecessaryDocumentation:](self, "softwareUpdatePossessesNecessaryDocumentation:", v4);
        break;
      case 1:
      case 3:
      case 4:
      case 5:
        break;
      case 2:
        -[HFSoftwareUpdateManager requestedSoftwareUpdateInstalls](self, "requestedSoftwareUpdateInstalls");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (objc_msgSend(v11, "containsObject:", v4) & 1) == 0
          && -[HFSoftwareUpdateManager softwareUpdatePossessesNecessaryDocumentation:](self, "softwareUpdatePossessesNecessaryDocumentation:", v4);

        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Yet to handle HMSoftwareUpdateState: %lu"), v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        HFLogForCategory(0x3FuLL);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v13 = (int64_t)v8;
          _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        NSLog(CFSTR("%@"), v8);
        goto LABEL_9;
    }
  }
  else
  {
LABEL_9:
    v7 = 0;
  }

  return v7;
}

- (BOOL)isInstallingSoftwareUpdate:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[HFSoftwareUpdateManager hasSoftwareUpdate:](self, "hasSoftwareUpdate:", v4))
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  v5 = -[HFSoftwareUpdateManager _softwareUpdateStateForAccessory:](self, "_softwareUpdateStateForAccessory:", v4);
  if (v5 > 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Yet to handle HMSoftwareUpdateState: %lu"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0x3FuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    NSLog(CFSTR("%@"), v8);
    goto LABEL_11;
  }
  if (((1 << v5) & 0x33) != 0)
    goto LABEL_11;
  if (v5 != 2)
  {
    v7 = -[HFSoftwareUpdateManager softwareUpdatePossessesNecessaryDocumentation:](self, "softwareUpdatePossessesNecessaryDocumentation:", v4);
    goto LABEL_12;
  }
  if ((objc_msgSend(v4, "supportsCHIP") & 1) != 0)
    goto LABEL_11;
  -[HFSoftwareUpdateManager requestedSoftwareUpdateInstalls](self, "requestedSoftwareUpdateInstalls");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", v4))
    v7 = -[HFSoftwareUpdateManager softwareUpdatePossessesNecessaryDocumentation:](self, "softwareUpdatePossessesNecessaryDocumentation:", v4);
  else
    v7 = 0;

LABEL_12:
  return v7;
}

- (BOOL)isDownloadingSoftwareUpdate:(id)a3
{
  id v4;
  int64_t v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[HFSoftwareUpdateManager hasSoftwareUpdate:](self, "hasSoftwareUpdate:", v4))
    goto LABEL_9;
  v5 = -[HFSoftwareUpdateManager _softwareUpdateStateForAccessory:](self, "_softwareUpdateStateForAccessory:", v4);
  v6 = 0;
  if ((unint64_t)(v5 - 2) >= 4 && v5)
  {
    if (v5 == 1)
    {
      v6 = -[HFSoftwareUpdateManager softwareUpdatePossessesNecessaryDocumentation:](self, "softwareUpdatePossessesNecessaryDocumentation:", v4);
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Yet to handle HMSoftwareUpdateState: %lu"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0x3FuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    NSLog(CFSTR("%@"), v7);
LABEL_9:
    v6 = 0;
  }
LABEL_10:

  return v6;
}

- (BOOL)hasRequestedSoftwareUpdate:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[HFSoftwareUpdateManager hasSoftwareUpdate:](self, "hasSoftwareUpdate:", v4))
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  v5 = -[HFSoftwareUpdateManager _softwareUpdateStateForAccessory:](self, "_softwareUpdateStateForAccessory:", v4);
  if (v5 > 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Yet to handle HMSoftwareUpdateState: %lu"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0x3FuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    NSLog(CFSTR("%@"), v8);
    goto LABEL_11;
  }
  if (((1 << v5) & 0x1A) != 0)
    goto LABEL_11;
  if (((1 << v5) & 5) == 0)
  {
    v7 = -[HFSoftwareUpdateManager softwareUpdatePossessesNecessaryDocumentation:](self, "softwareUpdatePossessesNecessaryDocumentation:", v4);
    goto LABEL_12;
  }
  if (!objc_msgSend(v4, "supportsCHIP"))
    goto LABEL_11;
  -[HFSoftwareUpdateManager requestedSoftwareUpdateInstalls](self, "requestedSoftwareUpdateInstalls");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", v4))
    v7 = -[HFSoftwareUpdateManager softwareUpdatePossessesNecessaryDocumentation:](self, "softwareUpdatePossessesNecessaryDocumentation:", v4);
  else
    v7 = 0;

LABEL_12:
  return v7;
}

void __63__HFSoftwareUpdateManager_executionEnvironmentDidBecomeActive___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  if (objc_msgSend(v3, "supportsSoftwareUpdateV2"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "requestedSoftwareUpdateInstalls");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", v3);

    if (v5)
    {
      objc_msgSend(v3, "softwareUpdateController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "availableUpdate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "dispatcher");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "softwareUpdateObserverDispatcher");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "proxy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDelegate:", v10);

      objc_msgSend(*(id *)(a1 + 40), "dispatcher");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __63__HFSoftwareUpdateManager_executionEnvironmentDidBecomeActive___block_invoke_2;
      v13[3] = &unk_1EA73BC48;
      v14 = v7;
      v12 = v7;
      objc_msgSend(v11, "dispatchSoftwareUpdateMessage:sender:", v13, 0);

    }
  }

}

- (NSMutableSet)requestedSoftwareUpdateInstalls
{
  return self->_requestedSoftwareUpdateInstalls;
}

- (void)executionEnvironmentDidBecomeActive:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  HFSoftwareUpdateManager *v19;

  v4 = (void *)MEMORY[0x1E0C99E60];
  -[HFSoftwareUpdateManager dispatcher](self, "dispatcher", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v7);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[HFSoftwareUpdateManager observedAccessoryUniqueIDToAccessoryMapTable](self, "observedAccessoryUniqueIDToAccessoryMapTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    v11 = (void *)MEMORY[0x1E0C99E20];
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = (void *)objc_opt_new();
      objc_msgSend(v11, "setWithArray:", v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v12, "minusSet:", v16);
    if (objc_msgSend(v12, "count"))
      -[HFSoftwareUpdateManager stopObservingSoftwareUpdatesForAccessories:](self, "stopObservingSoftwareUpdatesForAccessories:", v12);

  }
  v14 = (void *)objc_opt_new();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __63__HFSoftwareUpdateManager_executionEnvironmentDidBecomeActive___block_invoke;
  v17[3] = &unk_1EA73BC70;
  v18 = v14;
  v19 = self;
  v15 = v14;
  objc_msgSend(v16, "na_each:", v17);
  -[HFSoftwareUpdateManager startObservingSoftwareUpdatesForAccessories:](self, "startObservingSoftwareUpdatesForAccessories:", v15);

}

- (void)resetCaches
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[5];
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[HFSoftwareUpdateManager accessoryUniqueIDToSoftwareUpdateMapTable](self, "accessoryUniqueIDToSoftwareUpdateMapTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    HFLogForCategory(0x3FuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[HFSoftwareUpdateManager accessoryUniqueIDToSoftwareUpdateMapTable](self, "accessoryUniqueIDToSoftwareUpdateMapTable");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "hf_prettyDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v23;
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "[RESET] Unexpected entries in accessoryUniqueIDToSoftwareUpdateMapTable: %@", buf, 0xCu);

    }
  }
  -[HFSoftwareUpdateManager accessoryUniqueIDToSoftwareUpdateMapTable](self, "accessoryUniqueIDToSoftwareUpdateMapTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[HFSoftwareUpdateManager accessoryUniqueIDToSoftwareUpdateProgressMapTable](self, "accessoryUniqueIDToSoftwareUpdateProgressMapTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    HFLogForCategory(0x3FuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[HFSoftwareUpdateManager accessoryUniqueIDToSoftwareUpdateProgressMapTable](self, "accessoryUniqueIDToSoftwareUpdateProgressMapTable");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "hf_prettyDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v25;
      _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "[RESET] Unexpected entries in accessoryUniqueIDToSoftwareUpdateProgressMapTable: %@", buf, 0xCu);

    }
  }
  -[HFSoftwareUpdateManager accessoryUniqueIDToSoftwareUpdateProgressMapTable](self, "accessoryUniqueIDToSoftwareUpdateProgressMapTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

  -[HFSoftwareUpdateManager accessoryUniqueIDToFetchPromisesMapTable](self, "accessoryUniqueIDToFetchPromisesMapTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "keyEnumerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __38__HFSoftwareUpdateManager_resetCaches__block_invoke;
  v29[3] = &unk_1EA73BBB8;
  v29[4] = self;
  objc_msgSend(v12, "na_each:", v29);

  -[HFSoftwareUpdateManager accessoryUniqueIDToFetchPromisesMapTable](self, "accessoryUniqueIDToFetchPromisesMapTable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeAllObjects");

  -[HFSoftwareUpdateManager observedAccessoryUniqueIDToAccessoryMapTable](self, "observedAccessoryUniqueIDToAccessoryMapTable");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    HFLogForCategory(0x3FuLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[HFSoftwareUpdateManager observedAccessoryUniqueIDToAccessoryMapTable](self, "observedAccessoryUniqueIDToAccessoryMapTable");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "hf_prettyDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v27;
      _os_log_error_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_ERROR, "[RESET] Unexpected entries in observedAccessoryUniqueIDToAccessoryMapTable: %@", buf, 0xCu);

    }
  }
  -[HFSoftwareUpdateManager observedAccessoryUniqueIDToAccessoryMapTable](self, "observedAccessoryUniqueIDToAccessoryMapTable");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeAllObjects");

  -[HFSoftwareUpdateManager documentationMetadataToDocumentationFutureMapTable](self, "documentationMetadataToDocumentationFutureMapTable");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "keyEnumerator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v13;
  v28[1] = 3221225472;
  v28[2] = __38__HFSoftwareUpdateManager_resetCaches__block_invoke_12;
  v28[3] = &unk_1EA73BBE0;
  v28[4] = self;
  objc_msgSend(v21, "na_each:", v28);

}

- (NSMapTable)observedAccessoryUniqueIDToAccessoryMapTable
{
  return self->_observedAccessoryUniqueIDToAccessoryMapTable;
}

- (NSMapTable)accessoryUniqueIDToSoftwareUpdateProgressMapTable
{
  return self->_accessoryUniqueIDToSoftwareUpdateProgressMapTable;
}

- (NSMapTable)accessoryUniqueIDToSoftwareUpdateMapTable
{
  return self->_accessoryUniqueIDToSoftwareUpdateMapTable;
}

- (NSMapTable)accessoryUniqueIDToFetchPromisesMapTable
{
  return self->_accessoryUniqueIDToFetchPromisesMapTable;
}

- (NSMapTable)documentationMetadataToDocumentationFutureMapTable
{
  return self->_documentationMetadataToDocumentationFutureMapTable;
}

- (HFHomeKitDispatcher)dispatcher
{
  return (HFHomeKitDispatcher *)objc_loadWeakRetained((id *)&self->_dispatcher);
}

- (HFSoftwareUpdateManager)initWithDispatcher:(id)a3
{
  id v4;
  HFSoftwareUpdateManager *v5;
  uint64_t v6;
  NSMapTable *accessoryUniqueIDToSoftwareUpdateMapTable;
  uint64_t v8;
  NSMapTable *accessoryUniqueIDToSoftwareUpdateProgressMapTable;
  uint64_t v10;
  NSMapTable *accessoryUniqueIDToFetchPromisesMapTable;
  uint64_t v12;
  NSMapTable *observedAccessoryUniqueIDToAccessoryMapTable;
  uint64_t v14;
  NSMapTable *documentationMetadataToDocumentationMapTable;
  uint64_t v16;
  NSMapTable *documentationMetadataToDocumentationFutureMapTable;
  uint64_t v18;
  NSMutableSet *requestedSoftwareUpdateInstalls;
  void *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HFSoftwareUpdateManager;
  v5 = -[HFSoftwareUpdateManager init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    accessoryUniqueIDToSoftwareUpdateMapTable = v5->_accessoryUniqueIDToSoftwareUpdateMapTable;
    v5->_accessoryUniqueIDToSoftwareUpdateMapTable = (NSMapTable *)v6;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    accessoryUniqueIDToSoftwareUpdateProgressMapTable = v5->_accessoryUniqueIDToSoftwareUpdateProgressMapTable;
    v5->_accessoryUniqueIDToSoftwareUpdateProgressMapTable = (NSMapTable *)v8;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    accessoryUniqueIDToFetchPromisesMapTable = v5->_accessoryUniqueIDToFetchPromisesMapTable;
    v5->_accessoryUniqueIDToFetchPromisesMapTable = (NSMapTable *)v10;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v12 = objc_claimAutoreleasedReturnValue();
    observedAccessoryUniqueIDToAccessoryMapTable = v5->_observedAccessoryUniqueIDToAccessoryMapTable;
    v5->_observedAccessoryUniqueIDToAccessoryMapTable = (NSMapTable *)v12;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v14 = objc_claimAutoreleasedReturnValue();
    documentationMetadataToDocumentationMapTable = v5->_documentationMetadataToDocumentationMapTable;
    v5->_documentationMetadataToDocumentationMapTable = (NSMapTable *)v14;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v16 = objc_claimAutoreleasedReturnValue();
    documentationMetadataToDocumentationFutureMapTable = v5->_documentationMetadataToDocumentationFutureMapTable;
    v5->_documentationMetadataToDocumentationFutureMapTable = (NSMapTable *)v16;

    v18 = objc_opt_new();
    requestedSoftwareUpdateInstalls = v5->_requestedSoftwareUpdateInstalls;
    v5->_requestedSoftwareUpdateInstalls = (NSMutableSet *)v18;

    objc_storeWeak((id *)&v5->_dispatcher, v4);
    objc_msgSend(v4, "addAccessoryObserver:", v5);
    objc_msgSend(v4, "addHomeObserver:", v5);
    objc_msgSend(v4, "addSoftwareUpdateObserver:", v5);
    objc_msgSend(v4, "addSoftwareUpdateControllerV2Observer:", v5);
    objc_msgSend(v4, "addDiagnosticInfoObserver:", v5);
    +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:", v5);

  }
  return v5;
}

- (HFSoftwareUpdateManager)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDispatcher_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSoftwareUpdateManager.m"), 113, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFSoftwareUpdateManager init]",
    v5);

  return 0;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[HFSoftwareUpdateManager dispatcher](self, "dispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAccessoryObserver:", self);

  -[HFSoftwareUpdateManager dispatcher](self, "dispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeHomeObserver:", self);

  -[HFSoftwareUpdateManager dispatcher](self, "dispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeSoftwareUpdateObserver:", self);

  -[HFSoftwareUpdateManager dispatcher](self, "dispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeDiagnosticInfoObserver:", self);

  +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  v8.receiver = self;
  v8.super_class = (Class)HFSoftwareUpdateManager;
  -[HFSoftwareUpdateManager dealloc](&v8, sel_dealloc);
}

void __38__HFSoftwareUpdateManager_resetCaches__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "accessoryUniqueIDToFetchPromisesMapTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__HFSoftwareUpdateManager_resetCaches__block_invoke_2;
  v7[3] = &unk_1EA729F18;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v6, "na_each:", v7);

}

void __38__HFSoftwareUpdateManager_resetCaches__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x3FuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "observedAccessoryUniqueIDToAccessoryMapTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_prettyDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v3;
    v10 = 2112;
    v11 = v7;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "[RESET] Unexpectedly finishing promise in accessoryUniqueIDToFetchPromisesMapTable: %@ %@", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(v3, "finishWithNoResult");

}

void __38__HFSoftwareUpdateManager_resetCaches__block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "documentationMetadataToDocumentationFutureMapTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x3FuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "[RESET] Unexpectedly cancelling future in documentationMetadataToDocumentationFutureMapTable: %@ %@", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(v5, "cancel");
}

void __71__HFSoftwareUpdateManager_startObservingSoftwareUpdatesForAccessories___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  HFLogForCategory(0x3FuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(*(id *)(a1 + 32), "count");
      v12 = *(void **)(a1 + 32);
      if (v11 == 1)
      {
        objc_msgSend(v12, "anyObject");
        a1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1, "hf_prettyDescription");
      }
      else
      {
        objc_msgSend(v12, "hf_prettyDescription");
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v4;
      v17 = 2112;
      v18 = v13;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "[SUBSCRIBE] %@: Cannot subscribe to %@", buf, 0x16u);
      if (v11 == 1)
      {

        v13 = (void *)a1;
      }

    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(*(id *)(a1 + 32), "count");
      v8 = *(void **)(a1 + 32);
      if (v7 == 1)
      {
        objc_msgSend(v8, "anyObject");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "hf_prettyDescription");
      }
      else
      {
        objc_msgSend(v8, "hf_prettyDescription");
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "[SUBSCRIBE] Subscribed to %@", buf, 0xCu);
      if (v7 == 1)
      {

        v9 = v2;
      }

    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __71__HFSoftwareUpdateManager_startObservingSoftwareUpdatesForAccessories___block_invoke_18;
    v14[3] = &unk_1EA72A2D8;
    v10 = *(void **)(a1 + 32);
    v14[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v10, "na_each:", v14);
  }

}

void __71__HFSoftwareUpdateManager_startObservingSoftwareUpdatesForAccessories___block_invoke_18(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "observedAccessoryUniqueIDToAccessoryMapTable");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v3, v4);

}

- (void)stopObservingSoftwareUpdatesForAccessories:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "na_map:", &__block_literal_global_21_10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      -[HFSoftwareUpdateManager dispatcher](self, "dispatcher");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "home");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "softwareUpdateController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "unsubscribe:", v5);

      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __70__HFSoftwareUpdateManager_stopObservingSoftwareUpdatesForAccessories___block_invoke_2;
      v12[3] = &unk_1EA73BBB8;
      v12[4] = self;
      objc_msgSend(v5, "na_each:", v12);
      HFLogForCategory(0x3FuLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_msgSend(v4, "count");
        if (v10 == 1)
        {
          objc_msgSend(v4, "anyObject");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "hf_prettyDescription");
        }
        else
        {
          objc_msgSend(v4, "hf_prettyDescription");
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v14 = v11;
        _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "[UNSUBSCRIBE] Unsubscribed from %@", buf, 0xCu);
        if (v10 == 1)
        {

          v11 = v7;
        }

      }
    }

  }
}

id __70__HFSoftwareUpdateManager_stopObservingSoftwareUpdatesForAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "supportsSoftwareUpdateV2"))
  {
    objc_msgSend(v2, "uniqueIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __70__HFSoftwareUpdateManager_stopObservingSoftwareUpdatesForAccessories___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "accessoryUniqueIDToSoftwareUpdateMapTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

  objc_msgSend(*(id *)(a1 + 32), "accessoryUniqueIDToSoftwareUpdateProgressMapTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v4);

  objc_msgSend(*(id *)(a1 + 32), "observedAccessoryUniqueIDToAccessoryMapTable");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v4);

}

- (id)softwareUpdateForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HFSoftwareUpdateManager accessoryUniqueIDToSoftwareUpdateMapTable](self, "accessoryUniqueIDToSoftwareUpdateMapTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)softwareUpdateProgressForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HFSoftwareUpdateManager accessoryUniqueIDToSoftwareUpdateProgressMapTable](self, "accessoryUniqueIDToSoftwareUpdateProgressMapTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)didUpdateDiagnosticInfo:(id)a3 forAccessory:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(a4, "uniqueIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "softwareUpdate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFSoftwareUpdateManager _didReceiveUpdateForAccessory:update:](self, "_didReceiveUpdateForAccessory:update:", v8, v7);
}

- (void)softwareUpdateController:(id)a3 accessory:(id)a4 didReceiveUpdate:(id)a5
{
  -[HFSoftwareUpdateManager _didReceiveUpdateForAccessory:update:](self, "_didReceiveUpdateForAccessory:update:", a4, a5);
}

- (void)softwareUpdateController:(id)a3 accessory:(id)a4 didUpdateProgress:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  -[HFSoftwareUpdateManager accessoryUniqueIDToSoftwareUpdateProgressMapTable](self, "accessoryUniqueIDToSoftwareUpdateProgressMapTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "isEqual:", v8) & 1) == 0)
  {
    -[HFSoftwareUpdateManager accessoryUniqueIDToSoftwareUpdateProgressMapTable](self, "accessoryUniqueIDToSoftwareUpdateProgressMapTable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v8, v7);

    -[HFSoftwareUpdateManager observedAccessoryUniqueIDToAccessoryMapTable](self, "observedAccessoryUniqueIDToAccessoryMapTable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory(0x3FuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "hf_prettyDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v15;
      _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "[PROGRESS] %@", buf, 0xCu);

    }
    -[HFSoftwareUpdateManager dispatcher](self, "dispatcher");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __80__HFSoftwareUpdateManager_softwareUpdateController_accessory_didUpdateProgress___block_invoke;
    v18[3] = &unk_1EA73BC48;
    v19 = v13;
    v17 = v13;
    objc_msgSend(v16, "dispatchSoftwareUpdateMessage:sender:", v18, 0);

  }
}

uint64_t __80__HFSoftwareUpdateManager_softwareUpdateController_accessory_didUpdateProgress___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "softwareUpdateV2DidUpdateProgressForAccessory:", *(_QWORD *)(a1 + 32));
}

void __63__HFSoftwareUpdateManager_executionEnvironmentDidBecomeActive___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "softwareUpdate:didUpdateState:", v2, objc_msgSend(v2, "state"));

}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "supportsSoftwareUpdateV2"))
  {
    HFLogForCategory(0x3FuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "hf_prettyDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hf_prettyDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "[UNSUBSCRIBE] Stopped observing accessory because it was removed from its home: %@ %@", (uint8_t *)&v12, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSoftwareUpdateManager stopObservingSoftwareUpdatesForAccessories:](self, "stopObservingSoftwareUpdatesForAccessories:", v11);

  }
}

- (void)accessoryDidUpdateReachability:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a3;
  if (objc_msgSend(v8, "supportsSoftwareUpdateV2") && (objc_msgSend(v8, "isReachable") & 1) == 0)
  {
    objc_msgSend(v8, "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSoftwareUpdateManager accessoryUniqueIDToFetchPromisesMapTable](self, "accessoryUniqueIDToFetchPromisesMapTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__HFSoftwareUpdateManager_accessoryDidUpdateReachability___block_invoke;
    v9[3] = &unk_1EA728A78;
    v10 = v8;
    objc_msgSend(v6, "na_each:", v9);
    -[HFSoftwareUpdateManager accessoryUniqueIDToFetchPromisesMapTable](self, "accessoryUniqueIDToFetchPromisesMapTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v4);

  }
}

void __58__HFSoftwareUpdateManager_accessoryDidUpdateReachability___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x3FuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v5;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "[FETCH] Accessory became unreachable; finishing unmet promise: %@ %@",
      (uint8_t *)&v6,
      0x16u);

  }
  objc_msgSend(v3, "finishWithNoResult");

}

- (void)softwareUpdate:(id)a3 didUpdateState:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  HFLogForCategory(0x3FuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "hf_prettyExpensiveDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v8;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "[STATUS] %@", buf, 0xCu);

  }
  if (v6)
  {
    -[HFSoftwareUpdateManager requestedSoftwareUpdateInstalls](self, "requestedSoftwareUpdateInstalls");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __57__HFSoftwareUpdateManager_softwareUpdate_didUpdateState___block_invoke;
    v14[3] = &unk_1EA727840;
    v10 = v6;
    v15 = v10;
    objc_msgSend(v9, "na_firstObjectPassingTest:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject version](v10, "version");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSoftwareUpdateManager _updateRequestedSoftwareUpdateInstallsWithAccessory:softwareUpdateState:softwareUpdateVersion:](self, "_updateRequestedSoftwareUpdateInstallsWithAccessory:softwareUpdateState:softwareUpdateVersion:", v11, a4, v12);

    v13 = v15;
  }
  else
  {
    HFLogForCategory(0x3FuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_ERROR, "[STATUS] softwareUpdate:didUpdateState: invoked with a nil update; ignoring.",
        buf,
        2u);
    }
  }

}

BOOL __57__HFSoftwareUpdateManager_softwareUpdate_didUpdateState___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "softwareUpdateController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "availableUpdate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == *(void **)(a1 + 32);

  return v5;
}

- (void)_didReceiveUpdateForAccessory:(id)a3 update:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t updated;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void (**v33)(_QWORD);
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  _QWORD v38[4];
  void (**v39)(_QWORD);
  _QWORD aBlock[4];
  NSObject *v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HFSoftwareUpdateManager accessoryUniqueIDToSoftwareUpdateMapTable](self, "accessoryUniqueIDToSoftwareUpdateMapTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "documentationMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[HFSoftwareUpdateManager documentationMetadataToDocumentationMapTable](self, "documentationMetadataToDocumentationMapTable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v10);
    v36 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v36 = 0;
  }
  if (objc_msgSend(v9, "isEqual:", v7, v36)
    && (objc_msgSend(v7, "error"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, !v12)
    && v37)
  {
    HFLogForCategory(0x3FuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "description");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v44 = v14;
      v45 = 2112;
      v46 = v7;
      v47 = 2112;
      v48 = v15;
      _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "[STATUS] Skipping didReceiveUpdate for accessory: %@, with software update: %@, existingDocumentation: %@", buf, 0x20u);

    }
  }
  else
  {
    -[HFSoftwareUpdateManager observedAccessoryUniqueIDToAccessoryMapTable](self, "observedAccessoryUniqueIDToAccessoryMapTable");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    updated = HMSoftwareUpdateStateFromHMSoftwareUpdateStatusV2(objc_msgSend(v7, "status"));
    if (updated == 4
      && (objc_msgSend(v7, "version"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v17, "softwareVersion"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend(v19, "isEqualToVersion:", v20),
          v20,
          v19,
          (v21 & 1) == 0))
    {
      -[HFSoftwareUpdateManager accessoryUniqueIDToSoftwareUpdateMapTable](self, "accessoryUniqueIDToSoftwareUpdateMapTable");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKey:", v6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        HFLogForCategory(0x3FuLL);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v17, "hf_prettyDescription");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v44 = v29;
          _os_log_impl(&dword_1DD34E000, v28, OS_LOG_TYPE_DEFAULT, "[STATUS] Removing update from accessoryUniqueIDToSoftwareUpdateMapTable: %@", buf, 0xCu);

        }
        -[HFSoftwareUpdateManager accessoryUniqueIDToSoftwareUpdateMapTable](self, "accessoryUniqueIDToSoftwareUpdateMapTable");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "removeObjectForKey:", v6);

      }
      v25 = 0;
    }
    else
    {
      -[HFSoftwareUpdateManager accessoryUniqueIDToSoftwareUpdateMapTable](self, "accessoryUniqueIDToSoftwareUpdateMapTable");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKey:", v7, v6);

      HFLogForCategory(0x3FuLL);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v17, "hf_prettyDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v44 = v24;
        _os_log_impl(&dword_1DD34E000, v23, OS_LOG_TYPE_DEFAULT, "[STATUS] %@", buf, 0xCu);

      }
      -[HFSoftwareUpdateManager _fetchSoftwareUpdateDocumentationWithAccessory:](self, "_fetchSoftwareUpdateDocumentationWithAccessory:", v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "version");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSoftwareUpdateManager _updateRequestedSoftwareUpdateInstallsWithAccessory:softwareUpdateState:softwareUpdateVersion:](self, "_updateRequestedSoftwareUpdateInstallsWithAccessory:softwareUpdateState:softwareUpdateVersion:", v17, updated, v31);

    objc_initWeak((id *)buf, self);
    v32 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__HFSoftwareUpdateManager__didReceiveUpdateForAccessory_update___block_invoke;
    aBlock[3] = &unk_1EA727A48;
    objc_copyWeak(&v42, (id *)buf);
    v13 = v17;
    v41 = v13;
    v33 = (void (**)(_QWORD))_Block_copy(aBlock);
    v34 = v33;
    if (v25)
    {
      v38[0] = v32;
      v38[1] = 3221225472;
      v38[2] = __64__HFSoftwareUpdateManager__didReceiveUpdateForAccessory_update___block_invoke_3;
      v38[3] = &unk_1EA73BC98;
      v39 = v33;
      v35 = (id)objc_msgSend(v25, "addCompletionBlock:", v38);

    }
    else
    {
      v33[2](v33);
    }

    objc_destroyWeak(&v42);
    objc_destroyWeak((id *)buf);

  }
}

void __64__HFSoftwareUpdateManager__didReceiveUpdateForAccessory_update___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_finishFetchPromisesWithAccessory:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "dispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__HFSoftwareUpdateManager__didReceiveUpdateForAccessory_update___block_invoke_2;
  v4[3] = &unk_1EA73BC48;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "dispatchSoftwareUpdateMessage:sender:", v4, 0);

}

uint64_t __64__HFSoftwareUpdateManager__didReceiveUpdateForAccessory_update___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "softwareUpdateV2DidUpdateForAccessory:", *(_QWORD *)(a1 + 32));
}

uint64_t __64__HFSoftwareUpdateManager__didReceiveUpdateForAccessory_update___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_markSoftwareUpdate:(id)a3 asRequested:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  uint64_t *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  id *v22;
  uint64_t *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, void *);
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, void *);
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, void *);
  void *v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v4 = a4;
  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    HFLogForCategory(0x3FuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    v9 = MEMORY[0x1E0C809B0];
    if (v4)
    {
      if (v8)
      {
        objc_msgSend(v6, "hf_prettyDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v46 = v10;
        _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "[MARK REQUESTED] Marked as requested: %@", buf, 0xCu);

      }
      -[HFSoftwareUpdateManager requestedSoftwareUpdateInstalls](self, "requestedSoftwareUpdateInstalls");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v6);

      -[HFSoftwareUpdateManager dispatcher](self, "dispatcher");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v9;
      v41 = 3221225472;
      v42 = __59__HFSoftwareUpdateManager__markSoftwareUpdate_asRequested___block_invoke;
      v43 = &unk_1EA73BC48;
      v13 = &v44;
      v44 = v6;
      v14 = &v40;
    }
    else
    {
      if (v8)
      {
        objc_msgSend(v6, "hf_prettyDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v46 = v15;
        _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "[MARK REQUESTED] Removed as requested: %@", buf, 0xCu);

      }
      -[HFSoftwareUpdateManager requestedSoftwareUpdateInstalls](self, "requestedSoftwareUpdateInstalls");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObject:", v6);

      -[HFSoftwareUpdateManager dispatcher](self, "dispatcher");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v9;
      v36 = 3221225472;
      v37 = __59__HFSoftwareUpdateManager__markSoftwareUpdate_asRequested___block_invoke_28;
      v38 = &unk_1EA73BC48;
      v13 = &v39;
      v39 = v6;
      v14 = &v35;
    }
    objc_msgSend(v12, "dispatchSoftwareUpdateMessage:sender:", v14, 0);

    v17 = objc_msgSend(v6, "supportsSoftwareUpdateV2");
    HFLogForCategory(0x3FuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        objc_msgSend(v6, "hf_prettyDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v46 = v20;
        _os_log_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_DEFAULT, "[MARK REQUESTED] Redispatching softwareUpdateController:accessory:didReceiveUpdate: %@", buf, 0xCu);

      }
      -[HFSoftwareUpdateManager dispatcher](self, "dispatcher");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v9;
      v31 = 3221225472;
      v32 = __59__HFSoftwareUpdateManager__markSoftwareUpdate_asRequested___block_invoke_29;
      v33 = &unk_1EA73BC48;
      v22 = &v34;
      v34 = v6;
      v23 = &v30;
    }
    else
    {
      if (v19)
      {
        objc_msgSend(v6, "hf_prettyDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v46 = v24;
        _os_log_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_DEFAULT, "[MARK REQUESTED] Redispatching softwareUpdate:didUpdateState: %@", buf, 0xCu);

      }
      -[HFSoftwareUpdateManager dispatcher](self, "dispatcher");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v9;
      v26 = 3221225472;
      v27 = __59__HFSoftwareUpdateManager__markSoftwareUpdate_asRequested___block_invoke_30;
      v28 = &unk_1EA73BC48;
      v22 = &v29;
      v29 = v6;
      v23 = &v25;
    }
    objc_msgSend(v21, "dispatchSoftwareUpdateMessage:sender:", v23, 0, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39,
      v40,
      v41,
      v42,
      v43,
      v44);

  }
}

uint64_t __59__HFSoftwareUpdateManager__markSoftwareUpdate_asRequested___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didUpdateToInstallingState:forAccessory:", 1, *(_QWORD *)(a1 + 32));
}

uint64_t __59__HFSoftwareUpdateManager__markSoftwareUpdate_asRequested___block_invoke_28(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didUpdateToInstallingState:forAccessory:", 0, *(_QWORD *)(a1 + 32));
}

uint64_t __59__HFSoftwareUpdateManager__markSoftwareUpdate_asRequested___block_invoke_29(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "softwareUpdateV2DidUpdateForAccessory:", *(_QWORD *)(a1 + 32));
}

void __59__HFSoftwareUpdateManager__markSoftwareUpdate_asRequested___block_invoke_30(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "softwareUpdateController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "availableUpdate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "softwareUpdateController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "availableUpdate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "softwareUpdate:didUpdateState:", v5, objc_msgSend(v7, "state"));

}

- (int64_t)_softwareUpdateStateForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t updated;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "supportsSoftwareUpdateV2"))
  {
    -[HFSoftwareUpdateManager accessoryUniqueIDToSoftwareUpdateMapTable](self, "accessoryUniqueIDToSoftwareUpdateMapTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    updated = HMSoftwareUpdateStateFromHMSoftwareUpdateStatusV2(objc_msgSend(v7, "status"));
  }
  else
  {
    objc_msgSend(v4, "softwareUpdateController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "availableUpdate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    updated = objc_msgSend(v9, "state");

  }
  return updated;
}

- (id)_fetchSoftwareUpdateDocumentationWithAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFSoftwareUpdateManager accessoryUniqueIDToSoftwareUpdateMapTable](self, "accessoryUniqueIDToSoftwareUpdateMapTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "documentationMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[HFSoftwareUpdateManager documentationMetadataToDocumentationMapTable](self, "documentationMetadataToDocumentationMapTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[HFSoftwareUpdateManager documentationMetadataToDocumentationFutureMapTable](self, "documentationMetadataToDocumentationFutureMapTable");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v16 = (void *)MEMORY[0x1E0D519C0];
        v17 = MEMORY[0x1E0C809B0];
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __74__HFSoftwareUpdateManager__fetchSoftwareUpdateDocumentationWithAccessory___block_invoke;
        v26[3] = &unk_1EA729F18;
        v27 = v4;
        v18 = v8;
        v28 = v18;
        objc_msgSend(v16, "futureWithBlock:", v26);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFSoftwareUpdateManager documentationMetadataToDocumentationFutureMapTable](self, "documentationMetadataToDocumentationFutureMapTable");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKey:", v11, v18);

        objc_initWeak(location, self);
        v23[0] = v17;
        v23[1] = 3221225472;
        v23[2] = __74__HFSoftwareUpdateManager__fetchSoftwareUpdateDocumentationWithAccessory___block_invoke_34;
        v23[3] = &unk_1EA73BCE8;
        objc_copyWeak(&v25, location);
        v24 = v18;
        v20 = (id)objc_msgSend(v11, "addCompletionBlock:", v23);

        objc_destroyWeak(&v25);
        objc_destroyWeak(location);

      }
    }
  }
  else
  {
    HFLogForCategory(0x3FuLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "hf_prettyDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v22;
      _os_log_error_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_ERROR, "[DOCUMENTATION] Software update does not contain documentation metadata: %@", (uint8_t *)location, 0xCu);

    }
    v13 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "na_genericError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "futureWithError:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

void __74__HFSoftwareUpdateManager__fetchSoftwareUpdateDocumentationWithAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x3FuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Fetching: %@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "softwareUpdateController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__HFSoftwareUpdateManager__fetchSoftwareUpdateDocumentationWithAccessory___block_invoke_33;
  v10[3] = &unk_1EA73BCC0;
  v8 = *(_QWORD *)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  v12 = v3;
  v9 = v3;
  objc_msgSend(v7, "fetchDocumentationFromMetadata:completion:", v8, v10);

}

void __74__HFSoftwareUpdateManager__fetchSoftwareUpdateDocumentationWithAccessory___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HFLogForCategory(0x3FuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v6;
      v13 = 2112;
      v14 = v9;
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "[DOCUMENTATION] Fetch error: %@ %@", (uint8_t *)&v11, 0x16u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "hf_prettyDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "[DOCUMENTATION] Completed fetch: %@ %@", (uint8_t *)&v11, 0x16u);

    goto LABEL_6;
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v5, v6);
}

void __74__HFSoftwareUpdateManager__fetchSoftwareUpdateDocumentationWithAccessory___block_invoke_34(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (!a3)
  {
    objc_msgSend(WeakRetained, "documentationMetadataToDocumentationMapTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v9, *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(v6, "documentationMetadataToDocumentationFutureMapTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

}

- (void)_waitToFinishPromise:(id)a3 untilSoftwareUpdateDocumentationFetchCompletes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  id v17;
  _BOOL4 v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  HFSoftwareUpdateManager *v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HFSoftwareUpdateManager accessoryUniqueIDToSoftwareUpdateMapTable](self, "accessoryUniqueIDToSoftwareUpdateMapTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFSoftwareUpdateManager documentationMetadataToDocumentationFutureMapTable](self, "documentationMetadataToDocumentationFutureMapTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "documentationMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x3FuLL);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      objc_msgSend(v7, "hf_prettyDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v16;
      _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "[FETCH] Waiting for documentation future to complete before finishing fetch promise: %@", buf, 0xCu);

    }
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __95__HFSoftwareUpdateManager__waitToFinishPromise_untilSoftwareUpdateDocumentationFetchCompletes___block_invoke;
    v20[3] = &unk_1EA73BD10;
    v21 = v6;
    v22 = self;
    v23 = v7;
    v17 = (id)objc_msgSend(v13, "addCompletionBlock:", v20);

  }
  else
  {
    if (v15)
    {
      v18 = -[HFSoftwareUpdateManager isReadyToInstallSoftwareUpdate:](self, "isReadyToInstallSoftwareUpdate:", v7);
      objc_msgSend(v7, "hf_prettyDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = v6;
      v26 = 1024;
      v27 = v18;
      v28 = 2112;
      v29 = v19;
      _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "[FETCH] Finishing promise %@; Ready to Install: %{BOOL}d; %@",
        buf,
        0x1Cu);

    }
    objc_msgSend(v6, "finishWithNoResult");
  }

}

uint64_t __95__HFSoftwareUpdateManager__waitToFinishPromise_untilSoftwareUpdateDocumentationFetchCompletes___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  int v4;
  void *v5;
  int v7;
  id v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x3FuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = objc_msgSend(a1[5], "isReadyToInstallSoftwareUpdate:", a1[6]);
    objc_msgSend(a1[6], "hf_prettyDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v3;
    v9 = 1024;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "[FETCH] Finishing promise %@; Ready to Install: %{BOOL}d; %@",
      (uint8_t *)&v7,
      0x1Cu);

  }
  return objc_msgSend(a1[4], "finishWithNoResult");
}

- (void)_finishFetchPromisesWithAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFSoftwareUpdateManager accessoryUniqueIDToFetchPromisesMapTable](self, "accessoryUniqueIDToFetchPromisesMapTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (-[HFSoftwareUpdateManager _softwareUpdateStateForAccessory:](self, "_softwareUpdateStateForAccessory:", v4) == 4)
    {
      HFLogForCategory(0x3FuLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = objc_msgSend(v7, "count");
        v10 = v7;
        if (v9 == 1)
        {
          objc_msgSend(v7, "anyObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v11 = v9 == 1;
        objc_msgSend(v4, "hf_prettyDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v23 = v10;
        v24 = 2112;
        v25 = v12;
        _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "[FETCH] Unfinished promises still exist, but we haven't seen the new update yet: %@ %@", buf, 0x16u);

        if (v11)
      }

    }
    else
    {
      objc_initWeak((id *)buf, self);
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __61__HFSoftwareUpdateManager__finishFetchPromisesWithAccessory___block_invoke;
      v19 = &unk_1EA72F630;
      objc_copyWeak(&v21, (id *)buf);
      v13 = v4;
      v20 = v13;
      objc_msgSend(v7, "na_each:", &v16);
      -[HFSoftwareUpdateManager accessoryUniqueIDToFetchPromisesMapTable](self, "accessoryUniqueIDToFetchPromisesMapTable", v16, v17, v18, v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "uniqueIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectForKey:", v15);

      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)buf);
    }
  }

}

void __61__HFSoftwareUpdateManager__finishFetchPromisesWithAccessory___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_waitToFinishPromise:untilSoftwareUpdateDocumentationFetchCompletes:", v4, *(_QWORD *)(a1 + 32));

}

- (void)_updateRequestedSoftwareUpdateInstallsWithAccessory:(id)a3 softwareUpdateState:(int64_t)a4 softwareUpdateVersion:(id)a5
{
  void *v5;
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  -[HFSoftwareUpdateManager requestedSoftwareUpdateInstalls](self, "requestedSoftwareUpdateInstalls");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v9);

  if (v12)
  {
    if ((unint64_t)(a4 - 3) > 2)
    {
      v17 = objc_alloc(MEMORY[0x1E0D286A0]);
      objc_msgSend(v9, "firmwareVersion");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v17, "initWithVersionString:", v18);

      if (objc_msgSend(v10, "isEqualToVersion:", v16))
      {
        HFLogForCategory(0x3FuLL);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v9, "hf_prettyDescription");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 138412546;
          v31 = v16;
          v32 = 2112;
          v33 = v20;
          _os_log_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_DEFAULT, "[MARK REQUESTED] Removing accessory from requestedSoftwareUpdateInstalls because accessory and update versions (%@) match: %@", (uint8_t *)&v30, 0x16u);

        }
        -[HFSoftwareUpdateManager requestedSoftwareUpdateInstalls](self, "requestedSoftwareUpdateInstalls");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "removeObject:", v9);

      }
    }
    else
    {
      HFLogForCategory(0x3FuLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromHMSoftwareUpdateState(a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "hf_prettyDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138412546;
        v31 = v14;
        v32 = 2112;
        v33 = v15;
        _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "[MARK REQUESTED] Removing accessory from requestedSoftwareUpdateInstalls because %@ is either Requested, Installing, Installed: %@", (uint8_t *)&v30, 0x16u);

      }
      -[HFSoftwareUpdateManager requestedSoftwareUpdateInstalls](self, "requestedSoftwareUpdateInstalls");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObject:", v9);
    }

  }
  -[HFSoftwareUpdateManager requestedSoftwareUpdateInstalls](self, "requestedSoftwareUpdateInstalls");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (v23)
  {
    HFLogForCategory(0x3FuLL);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      -[HFSoftwareUpdateManager requestedSoftwareUpdateInstalls](self, "requestedSoftwareUpdateInstalls");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count");
      -[HFSoftwareUpdateManager requestedSoftwareUpdateInstalls](self, "requestedSoftwareUpdateInstalls");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v26 == 1)
      {
        objc_msgSend(v27, "anyObject");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "hf_prettyDescription");
      }
      else
      {
        objc_msgSend(v27, "hf_prettyDescription");
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412290;
      v31 = v29;
      _os_log_impl(&dword_1DD34E000, v24, OS_LOG_TYPE_DEFAULT, "[MARK REQUESTED] requestedSoftwareUpdateInstalls still contains accessories: %@", (uint8_t *)&v30, 0xCu);
      if (v26 == 1)
      {

        v29 = v5;
      }

    }
  }

}

- (BOOL)hasValidSoftwareUpdate:(id)a3
{
  id v4;
  char v5;
  char v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "isControllable");
  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(CFSTR("MatteriPhoneOnlyPairingEnabled"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)|| (_os_feature_enabled_impl() & 1) != 0|| CFPreferencesGetAppBooleanValue(CFSTR("MatteriPhoneOnlyPairingForIPadEnabled"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)|| (_os_feature_enabled_impl() & 1) != 0)
  {
    if ((v5 & 1) != 0)
    {
      v5 = 1;
      goto LABEL_14;
    }
  }
  else
  {
    if (CFPreferencesGetAppBooleanValue(CFSTR("MatteriPhoneOnlyPairingForMacEnabled"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
    {
      v6 = v5;
    }
    else
    {
      v6 = 1;
    }
    if ((v6 & 1) != 0)
    {
LABEL_14:
      if (-[HFSoftwareUpdateManager isReadyToInstallSoftwareUpdate:](self, "isReadyToInstallSoftwareUpdate:", v4)
        && (v5 & 1) != 0)
      {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  if ((objc_msgSend(v4, "supportsCHIP") & 1) != 0)
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "homeManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "hasOptedToHH2");

    goto LABEL_14;
  }
  -[HFSoftwareUpdateManager isReadyToInstallSoftwareUpdate:](self, "isReadyToInstallSoftwareUpdate:", v4);
LABEL_18:
  if (!-[HFSoftwareUpdateManager isSoftwareUpdateInProgress:](self, "isSoftwareUpdateInProgress:", v4))
  {
    v9 = -[HFSoftwareUpdateManager isSoftwareUpdateInstalled:](self, "isSoftwareUpdateInstalled:", v4);
    goto LABEL_21;
  }
LABEL_19:
  v9 = 1;
LABEL_21:

  return v9;
}

- (BOOL)hasNewValidSoftwareUpdate:(id)a3
{
  id v4;
  char v5;
  char v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "isControllable");
  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(CFSTR("MatteriPhoneOnlyPairingEnabled"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)|| (_os_feature_enabled_impl() & 1) != 0|| CFPreferencesGetAppBooleanValue(CFSTR("MatteriPhoneOnlyPairingForIPadEnabled"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)|| (_os_feature_enabled_impl() & 1) != 0)
  {
    if ((v5 & 1) != 0)
    {
      v5 = 1;
      goto LABEL_14;
    }
  }
  else
  {
    if (CFPreferencesGetAppBooleanValue(CFSTR("MatteriPhoneOnlyPairingForMacEnabled"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
    {
      v6 = v5;
    }
    else
    {
      v6 = 1;
    }
    if ((v6 & 1) != 0)
      goto LABEL_14;
  }
  if ((objc_msgSend(v4, "supportsCHIP") & 1) == 0)
  {
    -[HFSoftwareUpdateManager isReadyToInstallSoftwareUpdate:](self, "isReadyToInstallSoftwareUpdate:", v4);
LABEL_18:
    v9 = -[HFSoftwareUpdateManager isSoftwareUpdateInProgress:](self, "isSoftwareUpdateInProgress:", v4);
    goto LABEL_19;
  }
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "hasOptedToHH2");

LABEL_14:
  if (!-[HFSoftwareUpdateManager isReadyToInstallSoftwareUpdate:](self, "isReadyToInstallSoftwareUpdate:", v4)
    || (v5 & 1) == 0)
  {
    goto LABEL_18;
  }
  v9 = 1;
LABEL_19:

  return v9;
}

- (BOOL)softwareUpdatePossessesNecessaryDocumentation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  NSObject *v11;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "hf_isHomePod"))
  {
    -[HFSoftwareUpdateManager softwareUpdateDocumentation:](self, "softwareUpdateDocumentation:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "licenseAgreement");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v5, "releaseNotes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {

LABEL_7:
        v9 = 1;
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(v5, "releaseNotesSummary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        goto LABEL_7;
    }
    if (-[HFSoftwareUpdateManager hasSoftwareUpdate:](self, "hasSoftwareUpdate:", v4))
    {
      HFLogForCategory(0x3FuLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "description");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "hf_prettyExpensiveDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v13;
        v17 = 2112;
        v18 = v14;
        _os_log_error_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_ERROR, "[DOCUMENTATION] Software update does not possess necessary documentation: %@, for accessory: %@", (uint8_t *)&v15, 0x16u);

      }
    }
    v9 = 0;
    goto LABEL_13;
  }
  v9 = 1;
LABEL_14:

  return v9;
}

- (id)softwareUpdateDocumentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "supportsSoftwareUpdateV2"))
  {
    -[HFSoftwareUpdateManager accessoryUniqueIDToSoftwareUpdateMapTable](self, "accessoryUniqueIDToSoftwareUpdateMapTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "documentationMetadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[HFSoftwareUpdateManager documentationMetadataToDocumentationMapTable](self, "documentationMetadataToDocumentationMapTable");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    objc_msgSend(v4, "softwareUpdateController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "availableUpdate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "documentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)softwareUpdateVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "supportsSoftwareUpdateV2"))
  {
    -[HFSoftwareUpdateManager accessoryUniqueIDToSoftwareUpdateMapTable](self, "accessoryUniqueIDToSoftwareUpdateMapTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "version");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "softwareUpdateController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "availableUpdate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "version");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)softwareUpdateDisplayableVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "supportsSoftwareUpdateV2"))
  {
    -[HFSoftwareUpdateManager accessoryUniqueIDToSoftwareUpdateMapTable](self, "accessoryUniqueIDToSoftwareUpdateMapTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "version");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedDescription");
  }
  else
  {
    objc_msgSend(v4, "softwareUpdateController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "availableUpdate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayableVersion");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)softwareUpdateReleaseDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if ((objc_msgSend(v3, "supportsSoftwareUpdateV2") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "softwareUpdateController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "availableUpdate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "releaseDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (unint64_t)softwareUpdateDownloadSize:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "supportsSoftwareUpdateV2"))
  {
    -[HFSoftwareUpdateManager accessoryUniqueIDToSoftwareUpdateMapTable](self, "accessoryUniqueIDToSoftwareUpdateMapTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "downloadSize");
  }
  else
  {
    objc_msgSend(v4, "softwareUpdateController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "availableUpdate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "downloadSize");

  }
  return v8;
}

- (id)softwareUpdatePortionComplete:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v11;

  v4 = a3;
  if (objc_msgSend(v4, "supportsSoftwareUpdateV2"))
  {
    -[HFSoftwareUpdateManager accessoryUniqueIDToSoftwareUpdateProgressMapTable](self, "accessoryUniqueIDToSoftwareUpdateProgressMapTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "percentageComplete");
    v9 = fabsf(v8);
    if (v8 <= 0.0 || v9 < 0.00000011921)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_fetchNeedsAttentionReasons:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  if ((objc_msgSend(v3, "supportsSoftwareUpdateV2") & 1) != 0 || (objc_msgSend(v3, "hf_isHomePod") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0D519C0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__HFSoftwareUpdateManager__fetchNeedsAttentionReasons___block_invoke;
    v8[3] = &unk_1EA728A78;
    v9 = v3;
    objc_msgSend(v5, "futureWithBlock:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "flatMap:", &__block_literal_global_57_2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

void __55__HFSoftwareUpdateManager__fetchNeedsAttentionReasons___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "softwareUpdateController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availableUpdate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__HFSoftwareUpdateManager__fetchNeedsAttentionReasons___block_invoke_2;
  v7[3] = &unk_1EA73BD38;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "fetchNeedsAttentionReasonsWithCompletionHandler:", v7);

}

void __55__HFSoftwareUpdateManager__fetchNeedsAttentionReasons___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__HFSoftwareUpdateManager__fetchNeedsAttentionReasons___block_invoke_3;
  block[3] = &unk_1EA7270A0;
  v10 = v5;
  v11 = *(id *)(a1 + 32);
  v12 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __55__HFSoftwareUpdateManager__fetchNeedsAttentionReasons___block_invoke_3(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3)
    return objc_msgSend(v2, "finishWithError:");
  else
    return objc_msgSend(v2, "finishWithResult:", a1[6]);
}

id __55__HFSoftwareUpdateManager__fetchNeedsAttentionReasons___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "unsignedIntegerValue"))
  {
    v3 = objc_msgSend(v2, "unsignedIntegerValue");
    if (v3)
    {
      v4 = v3;
      if ((v3 & 2) != 0)
      {
        v6 = 65;
      }
      else if ((v3 & 4) != 0)
      {
        v6 = 66;
      }
      else if ((v3 & 8) != 0)
      {
        v6 = 67;
      }
      else if ((v3 & 1) != 0)
      {
        v6 = 64;
      }
      else
      {
        HFLogForCategory(0x3FuLL);
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          v10 = 134217984;
          v11 = v4;
          _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "[START UPDATE] Unhandled needsAttentionReasons: %ld", (uint8_t *)&v10, 0xCu);
        }

        v6 = 68;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)startSoftwareUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  if (-[HFSoftwareUpdateManager isSoftwareUpdateInProgress:](self, "isSoftwareUpdateInProgress:", v4)
    || -[HFSoftwareUpdateManager isSoftwareUpdateInstalled:](self, "isSoftwareUpdateInstalled:", v4))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFSoftwareUpdateManager _fetchNeedsAttentionReasons:](self, "_fetchNeedsAttentionReasons:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47__HFSoftwareUpdateManager_startSoftwareUpdate___block_invoke;
    v15[3] = &unk_1EA72A050;
    v8 = v4;
    v16 = v8;
    objc_msgSend(v6, "recover:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __47__HFSoftwareUpdateManager_startSoftwareUpdate___block_invoke_2;
    v11[3] = &unk_1EA72CA50;
    objc_copyWeak(&v13, &location);
    v12 = v8;
    objc_msgSend(v9, "flatMap:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
  return v5;
}

id __47__HFSoftwareUpdateManager_startSoftwareUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "hf_serviceNameComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "composedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_errorWithOperationType:failedItemName:", CFSTR("HFOperationStartSoftwareUpdate"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __47__HFSoftwareUpdateManager_startSoftwareUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__HFSoftwareUpdateManager_startSoftwareUpdate___block_invoke_3;
  v15[3] = &unk_1EA73BD80;
  objc_copyWeak(&v17, (id *)(a1 + 40));
  v16 = *(id *)(a1 + 32);
  objc_msgSend(v4, "futureWithErrorOnlyHandlerAdapterBlock:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __47__HFSoftwareUpdateManager_startSoftwareUpdate___block_invoke_60;
  v13[3] = &unk_1EA726940;
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v6, "flatMap:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __47__HFSoftwareUpdateManager_startSoftwareUpdate___block_invoke_62;
  v10[3] = &unk_1EA73BDA8;
  v11 = *(id *)(a1 + 32);
  objc_copyWeak(&v12, (id *)(a1 + 40));
  objc_msgSend(v7, "recover:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v12);

  objc_destroyWeak(&v17);
  return v8;
}

void __47__HFSoftwareUpdateManager_startSoftwareUpdate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_markSoftwareUpdate:asRequested:", *(_QWORD *)(a1 + 32), 1);
  HFLogForCategory(0x3FuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_prettyExpensiveDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v6;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "[START UPDATE] Starting software update: %@", (uint8_t *)&v13, 0xCu);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "supportsSoftwareUpdateV2"))
  {
    objc_msgSend(WeakRetained, "accessoryUniqueIDToSoftwareUpdateMapTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "softwareUpdateController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "applySoftwareUpdate:accessory:completion:", v9, v12, v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "softwareUpdateController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "softwareUpdateController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "availableUpdate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startUpdate:completionHandler:", v11, v3);
  }

}

id __47__HFSoftwareUpdateManager_startSoftwareUpdate___block_invoke_60(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x3FuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_prettyExpensiveDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "[START UPDATE SUCCEEDED] %@", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __47__HFSoftwareUpdateManager_startSoftwareUpdate___block_invoke_62(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x3FuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_prettyExpensiveDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v3;
    v14 = 2112;
    v15 = v11;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "[START UPDATE FAILED] %@ %@", (uint8_t *)&v12, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_markSoftwareUpdate:asRequested:", *(_QWORD *)(a1 + 32), 0);

  objc_msgSend(*(id *)(a1 + 32), "hf_serviceNameComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "composedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_errorWithOperationType:failedItemName:", CFSTR("HFOperationStartSoftwareUpdate"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)fetchAvailableSoftwareUpdate:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  HFSoftwareUpdateManager *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32[2];
  _QWORD v33[4];
  id v34;
  id v35;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_msgSend(v6, "hf_isHomePod") & 1) != 0)
  {
    if (objc_msgSend(v6, "supportsSoftwareUpdateV2"))
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFSoftwareUpdateManager accessoryUniqueIDToSoftwareUpdateMapTable](self, "accessoryUniqueIDToSoftwareUpdateMapTable");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 && HMSoftwareUpdateStateFromHMSoftwareUpdateStatusV2(objc_msgSend(v9, "status")) != 4)
      {
        HFLogForCategory(0x3FuLL);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "hf_prettyDescription");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v19;
          _os_log_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_DEFAULT, "[FETCH] No scan necessary; we already have an update: %@",
            (uint8_t *)location,
            0xCu);

        }
        objc_initWeak(location, self);
        v20 = (void *)MEMORY[0x1E0D519C0];
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __64__HFSoftwareUpdateManager_fetchAvailableSoftwareUpdate_options___block_invoke;
        v33[3] = &unk_1EA72F630;
        objc_copyWeak(&v35, location);
        v34 = v6;
        objc_msgSend(v20, "futureWithBlock:", v33);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_destroyWeak(&v35);
        objc_destroyWeak(location);
      }
      else
      {
        objc_initWeak(location, self);
        v10 = (void *)MEMORY[0x1E0D519C0];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __64__HFSoftwareUpdateManager_fetchAvailableSoftwareUpdate_options___block_invoke_2;
        v29[3] = &unk_1EA73BDF8;
        v30 = v6;
        v31 = v7;
        v32[1] = (id)a4;
        objc_copyWeak(v32, location);
        objc_msgSend(v10, "futureWithBlock:", v29);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_destroyWeak(v32);

        objc_destroyWeak(location);
      }

    }
    else
    {
      v12 = MEMORY[0x1E0C809B0];
      v13 = (void *)MEMORY[0x1E0D519C0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __64__HFSoftwareUpdateManager_fetchAvailableSoftwareUpdate_options___block_invoke_64;
      v27[3] = &unk_1EA7268C8;
      v14 = v6;
      v28 = v14;
      objc_msgSend(v13, "futureWithErrorOnlyHandlerAdapterBlock:", v27);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v12;
      v25[1] = 3221225472;
      v25[2] = __64__HFSoftwareUpdateManager_fetchAvailableSoftwareUpdate_options___block_invoke_2_65;
      v25[3] = &unk_1EA72A050;
      v16 = v14;
      v26 = v16;
      objc_msgSend(v15, "recover:", v25);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v12;
      v22[1] = 3221225472;
      v22[2] = __64__HFSoftwareUpdateManager_fetchAvailableSoftwareUpdate_options___block_invoke_3_67;
      v22[3] = &unk_1EA72A0C8;
      v23 = v16;
      v24 = self;
      objc_msgSend(v17, "addCompletionBlock:", v22);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

void __64__HFSoftwareUpdateManager_fetchAvailableSoftwareUpdate_options___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_waitToFinishPromise:untilSoftwareUpdateDocumentationFetchCompletes:", v4, *(_QWORD *)(a1 + 32));

}

void __64__HFSoftwareUpdateManager_fetchAvailableSoftwareUpdate_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "softwareUpdateController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 56);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__HFSoftwareUpdateManager_fetchAvailableSoftwareUpdate_options___block_invoke_3;
  v9[3] = &unk_1EA73BDD0;
  objc_copyWeak(&v13, (id *)(a1 + 48));
  v10 = *(id *)(a1 + 32);
  v8 = v3;
  v11 = v8;
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v5, "scanForSoftwareUpdateOnAccessories:withOptions:completion:", v6, v7, v9);

  objc_destroyWeak(&v13);
}

void __64__HFSoftwareUpdateManager_fetchAvailableSoftwareUpdate_options___block_invoke_3(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  int v19;
  _BYTE v20[18];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (a2)
  {
    if (objc_msgSend(WeakRetained, "hasSoftwareUpdate:", *(_QWORD *)(a1 + 32))
      && (objc_msgSend(v5, "isSoftwareUpdateInstalled:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    {
      HFLogForCategory(0x3FuLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_msgSend(v5, "isReadyToInstallSoftwareUpdate:", *(_QWORD *)(a1 + 32));
        objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 67109378;
        *(_DWORD *)v20 = v17;
        *(_WORD *)&v20[4] = 2112;
        *(_QWORD *)&v20[6] = v18;
        _os_log_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_DEFAULT, "[FETCH] Update found; Ready To Install: %{BOOL}d; %@",
          (uint8_t *)&v19,
          0x12u);

      }
      objc_msgSend(v5, "_waitToFinishPromise:untilSoftwareUpdateDocumentationFetchCompletes:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    }
    else
    {
      HFLogForCategory(0x3FuLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412546;
        *(_QWORD *)v20 = v7;
        *(_WORD *)&v20[8] = 2112;
        *(_QWORD *)&v20[10] = v8;
        _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "[FETCH] Postpoining promise finish until next delegate callback: %@ %@", (uint8_t *)&v19, 0x16u);

      }
      objc_msgSend(v5, "accessoryUniqueIDToFetchPromisesMapTable");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v11, "setByAddingObject:", *(_QWORD *)(a1 + 40));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v5, "accessoryUniqueIDToFetchPromisesMapTable");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v12, *(_QWORD *)(a1 + 48));

    }
  }
  else
  {
    HFLogForCategory(0x3FuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412290;
      *(_QWORD *)v20 = v14;
      _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "[FETCH] No update found: %@", (uint8_t *)&v19, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }

}

void __64__HFSoftwareUpdateManager_fetchAvailableSoftwareUpdate_options___block_invoke_64(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "softwareUpdateController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchAvailableUpdateWithCompletionHandler:", v3);

}

id __64__HFSoftwareUpdateManager_fetchAvailableSoftwareUpdate_options___block_invoke_2_65(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a2;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hf_serviceNameComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "composedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeSetObject:forKey:", v7, CFSTR("HFErrorHandlerOptionFailedItemName"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("HFOperationCheckForSoftwareUpdates"), CFSTR("HFErrorUserInfoOperationKey"));
  v8 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(v4, "hf_errorWithAddedUserInfo:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "futureWithError:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __64__HFSoftwareUpdateManager_fetchAvailableSoftwareUpdate_options___block_invoke_3_67(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  _BOOL4 v8;
  int v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  int v13;
  _BYTE v14[18];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "hf_hasSoftwareUpdate");
    HFLogForCategory(0x3FuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v8)
        goto LABEL_11;
      v9 = objc_msgSend(*(id *)(a1 + 40), "isReadyToInstallSoftwareUpdate:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "hf_prettyExpensiveDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 67109378;
      *(_DWORD *)v14 = v9;
      *(_WORD *)&v14[4] = 2112;
      *(_QWORD *)&v14[6] = v6;
      v10 = "[FETCH] Update found; Ready To Install: %{BOOL}d; %@";
      v11 = v5;
      v12 = 18;
    }
    else
    {
      if (!v8)
        goto LABEL_11;
      objc_msgSend(*(id *)(a1 + 32), "hf_prettyExpensiveDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      *(_QWORD *)v14 = v6;
      v10 = "[FETCH] No update found: %@";
      v11 = v5;
      v12 = 12;
    }
    _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, v12);
    goto LABEL_10;
  }
  HFLogForCategory(0x3FuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_prettyExpensiveDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    *(_QWORD *)v14 = v4;
    *(_WORD *)&v14[8] = 2112;
    *(_QWORD *)&v14[10] = v6;
    _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "[FETCH] Failed: %@ %@", (uint8_t *)&v13, 0x16u);
LABEL_10:

  }
LABEL_11:

}

- (void)setDispatcher:(id)a3
{
  objc_storeWeak((id *)&self->_dispatcher, a3);
}

- (NSMapTable)documentationMetadataToDocumentationMapTable
{
  return self->_documentationMetadataToDocumentationMapTable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedSoftwareUpdateInstalls, 0);
  objc_storeStrong((id *)&self->_documentationMetadataToDocumentationFutureMapTable, 0);
  objc_storeStrong((id *)&self->_documentationMetadataToDocumentationMapTable, 0);
  objc_storeStrong((id *)&self->_observedAccessoryUniqueIDToAccessoryMapTable, 0);
  objc_storeStrong((id *)&self->_accessoryUniqueIDToFetchPromisesMapTable, 0);
  objc_storeStrong((id *)&self->_accessoryUniqueIDToSoftwareUpdateProgressMapTable, 0);
  objc_storeStrong((id *)&self->_accessoryUniqueIDToSoftwareUpdateMapTable, 0);
  objc_destroyWeak((id *)&self->_dispatcher);
}

@end
