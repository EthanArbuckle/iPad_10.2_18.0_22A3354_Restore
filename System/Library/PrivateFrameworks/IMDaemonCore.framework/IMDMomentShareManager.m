@implementation IMDMomentShareManager

+ (id)sharedInstance
{
  if (qword_1ED935C68 != -1)
    dispatch_once(&qword_1ED935C68, &unk_1E9229C10);
  return (id)qword_1ED935D98;
}

- (IMDMomentShareManager)init
{
  IMDMomentShareManager *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMDMomentShareManager;
  v2 = -[IMDMomentShareManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[IMDMomentShareManager setShareURLsToContexts:](v2, "setShareURLsToContexts:", v3);

    objc_msgSend(MEMORY[0x1E0CD16F8], "sharedMomentSharePhotoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerChangeObserver:", v2);

  }
  return v2;
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1D1477398;
  v6[3] = &unk_1E9228750;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)_updateContext:(id)a3 withChange:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "momentShare");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changeDetailsForObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAfterChanges");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v10, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "message");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "guid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v25 = v12;
        v26 = 2112;
        v27 = v14;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Updating moment share %@ in response to photo library change for message %@", buf, 0x16u);

      }
    }
    objc_msgSend(v5, "setMomentShare:", v10);
  }
  objc_msgSend(v5, "assetsFetch");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changeDetailsForFetchResult:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "fetchResultAfterChanges");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled(v18))
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "message");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "guid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v18, "count");
        *(_DWORD *)buf = 138412802;
        v25 = v20;
        v26 = 2112;
        v27 = v17;
        v28 = 2048;
        v29 = v21;
        _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Updating moment share fetch for message %@ with change %@. Count is now %lu", buf, 0x20u);

      }
    }
    objc_msgSend(v5, "setAssetsFetch:", v18);

    goto LABEL_14;
  }
  if (v10)
LABEL_14:
    -[IMDMomentShareManager _transitionToGenerateTransfersStateForContextIfNecessary:](self, "_transitionToGenerateTransfersStateForContextIfNecessary:", v5);

}

- (void)_transitionToFetchingMomentShareForContext:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  if (objc_msgSend(v4, "state"))
  {
    IMLogHandleForCategory();
    v5 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
      sub_1D1666B04(v4, v5);

  }
  else
  {
    objc_msgSend(v4, "setState:", 1);
    v6 = (void *)objc_opt_class();
    objc_msgSend(v4, "shareURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "message");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1D14778F4;
    v9[3] = &unk_1E9229C60;
    v9[4] = self;
    v10 = v4;
    objc_msgSend(v6, "fetchMomentShareFromShareURL:forMessage:completionHandler:", v7, v8, v9);

  }
}

- (void)_handleMomentShareFetchForContext:(id)a3 momentShare:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  char *v9;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "state") == 1)
  {
    if (v8)
    {
      objc_msgSend(v7, "setMomentShare:", v8);
      objc_msgSend(v7, "setState:", 2);
      -[IMDMomentShareManager _acceptMomentShareIfNecessaryForContext:isRetry:](self, "_acceptMomentShareIfNecessaryForContext:isRetry:", v7, 0);
    }
    else
    {
      -[IMDMomentShareManager _handleIngestionFailureForContext:](self, "_handleIngestionFailureForContext:", v7);
    }
  }
  else
  {
    IMLogHandleForCategory();
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
      sub_1D1666B9C(v7, v9);

  }
}

- (void)_transitionToWaitingForAssetsForContext:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "state") == 2)
  {
    objc_msgSend(v4, "momentShare");
    v5 = (char *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend((id)objc_opt_class(), "_fetchResultForCuratedOrFirstForMomentShare:outFetchType:", v5, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFetchType:", v11);
    objc_msgSend(v4, "setAssetsFetch:", v6);
    if (IMOSLoggingEnabled(objc_msgSend(v4, "setState:", 3)))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "message");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "guid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "momentShare");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v13 = v6;
        v14 = 2112;
        v15 = v9;
        v16 = 2112;
        v17 = v10;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Starting to monitor fetch result: %@ for message: %@ moment share: %@", buf, 0x20u);

      }
    }
    -[IMDMomentShareManager _transitionToGenerateTransfersStateForContextIfNecessary:](self, "_transitionToGenerateTransfersStateForContextIfNecessary:", v4);

  }
  else
  {
    IMLogHandleForCategory();
    v5 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
      sub_1D1666C34(v4, v5);
  }

}

- (void)_transitionToGenerateTransfersStateForContextIfNecessary:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    v5 = objc_msgSend((id)objc_opt_class(), "_targetCountForContext:", v4);
    objc_msgSend(v4, "assetsFetch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 >= v5)
    {
      if (IMOSLoggingEnabled(v8))
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "momentShare");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "uuid");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 138412546;
          v13 = v11;
          v14 = 2048;
          v15 = v5;
          _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Moment share %@ is done fetching %lu assets. Generating transfers", (uint8_t *)&v12, 0x16u);

        }
      }
      objc_msgSend(v4, "setState:", 4);
      -[IMDMomentShareManager _generateTransfersForContext:](self, "_generateTransfersForContext:", v4);
    }
  }

}

- (void)_transitionToCompletedStateForContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "state") == 4)
  {
    if (IMOSLoggingEnabled(4))
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "message");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "guid");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "momentShare");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uuid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412546;
        v12 = v7;
        v13 = 2112;
        v14 = v9;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Moment share ingestion complete for message %@. moment share UUID %@", (uint8_t *)&v11, 0x16u);

      }
    }
    objc_msgSend(v4, "setState:", 5);
    -[IMDMomentShareManager _removeFinishedIngestionContext:](self, "_removeFinishedIngestionContext:", v4);
  }
  else
  {
    IMLogHandleForCategory();
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
      sub_1D1666CD8(v4, v10);

  }
}

- (void)_generateTransfersForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "assetsFetch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11), "uuid", (_QWORD)v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_opt_class();
  objc_msgSend(v4, "message");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentShare");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_generateTransfersForAssetUUIDs:forMessage:inChat:momentShare:", v6, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDMomentShareManager _assetUUIDToUnfinishedTransferMapFromTransfers:](self, "_assetUUIDToUnfinishedTransferMapFromTransfers:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTransfers:", v18);
  -[IMDMomentShareManager _startAssetExportForContext:](self, "_startAssetExportForContext:", v4);

}

+ (void)fetchMomentShareFromShareURL:(id)a3 forMessage:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  dispatch_time_t v22;
  id v23;
  id v24;
  _QWORD block[4];
  id v26;
  id v27;
  _BYTE *v28;
  _QWORD aBlock[4];
  id v30;
  id v31;
  id v32;
  _BYTE *v33;
  _BYTE buf[24];
  const __CFString *v35;
  __int16 v36;
  unint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v8, "getCMMState");
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "guid");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v10 > 4)
        v14 = CFSTR("invalid CMM state");
      else
        v14 = off_1E9229D98[v10];
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      v35 = v14;
      v36 = 2048;
      v37 = v10;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Fetching moment share from %@ for message %@ CMM state %@ (%lu)", buf, 0x2Au);

    }
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v15 = MEMORY[0x1E0C809B0];
  LOBYTE(v35) = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D14783A4;
  aBlock[3] = &unk_1E9229C88;
  v33 = buf;
  v16 = v8;
  v30 = v16;
  v17 = v7;
  v31 = v17;
  v18 = v9;
  v32 = v18;
  v19 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CD16F8], "sharedMomentSharePhotoLibrary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "librarySpecificFetchOptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1680], "fetchMomentShareFromShareURL:options:completionHandler:", v17, v21, v19);
  v22 = dispatch_time(0, 5000000000);
  block[0] = v15;
  block[1] = 3221225472;
  block[2] = sub_1D14785D4;
  block[3] = &unk_1E9228778;
  v27 = v16;
  v28 = buf;
  v26 = v17;
  v23 = v16;
  v24 = v17;
  dispatch_after(v22, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(buf, 8);
}

+ (void)_acceptMomentShare:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D1478774;
  v7[3] = &unk_1E9227FA8;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "acceptMomentShareWithCompletion:", v7);

}

- (id)_contextForMomentShareURL:(id)a3 forMessage:(id)a4 inChat:(id)a5 createIfNeeded:(BOOL)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  IMDMomentShareIngestionContext *v23;
  void *v24;
  _BOOL4 v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v26 = a6;
  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v28 = a5;
  -[IMDMomentShareManager shareURLsToContexts](self, "shareURLsToContexts");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "guid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
LABEL_3:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v17);
      objc_msgSend(v18, "message");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "guid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v12, "isEqualToString:", v20) & 1) != 0)
        break;

      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v15)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v23 = v18;

    if (v23)
    {
      v22 = v27;
      v21 = v28;
      goto LABEL_17;
    }
    v22 = v27;
    v21 = v28;
    if (!v26)
      goto LABEL_17;
  }
  else
  {
LABEL_9:

    v22 = v27;
    v21 = v28;
    if (!v26)
    {
      v23 = 0;
      goto LABEL_17;
    }
  }
  v23 = -[IMDMomentShareIngestionContext initWithURL:message:inChat:]([IMDMomentShareIngestionContext alloc], "initWithURL:message:inChat:", v9, v10, v21);
  if (v13)
  {
    objc_msgSend(v13, "addObject:", v23);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v24, v9);

  }
LABEL_17:

  return v23;
}

- (void)_removeFinishedIngestionContext:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  IMDMomentShareManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1D1478AE0;
  v6[3] = &unk_1E9228750;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)_handleIngestionFailureForContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IMLogHandleForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1D1666EA8();

  objc_msgSend(v5, "setCMMState:", 1);
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v9) = 1;
  v8 = (id)objc_msgSend(v7, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:", v5, 1, 0, 0, 0, 1, v9);

  objc_msgSend(v4, "setState:", 6);
  -[IMDMomentShareManager _removeFinishedIngestionContext:](self, "_removeFinishedIngestionContext:", v4);

}

- (void)registerAndAcceptMomentShareForMessage:(id)a3 inChat:(id)a4 resetAssetTransfers:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  unint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  _BOOL4 v53;
  int v54;
  NSObject *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  const __CFString *v69;
  __int16 v70;
  unint64_t v71;
  uint64_t v72;

  v5 = a5;
  v72 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "guid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "balloonBundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "payloadData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("YES");
      *(_DWORD *)buf = 138413058;
      v65 = v11;
      if (v13)
        v15 = CFSTR("YES");
      else
        v15 = CFSTR("NO");
      if (!v5)
        v14 = CFSTR("NO");
      v66 = 2112;
      v67 = (uint64_t)v12;
      v68 = 2112;
      v69 = v15;
      v70 = 2112;
      v71 = (unint64_t)v14;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Register and accept ShareURL for message: %@ with bundleID: %@ hasPayload: %@ reset asset transfers: %@", buf, 0x2Au);

    }
  }
  v16 = (void *)MEMORY[0x1E0D39960];
  objc_msgSend(v8, "balloonBundleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "body");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "payloadData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "photoShareURLFromPluginBundleID:contentString:payload:shouldAccept:", v17, v18, v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v22 = objc_msgSend(v8, "getCMMState");
    v23 = IMOSLoggingEnabled(v22);
    if ((_DWORD)v23)
    {
      OSLogHandleForIMEventCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "guid");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        if (v22 > 4)
          v27 = CFSTR("invalid CMM state");
        else
          v27 = off_1E9229D98[v22];
        *(_DWORD *)buf = 138413058;
        v65 = v20;
        v66 = 2112;
        v67 = v25;
        v68 = 2112;
        v69 = v27;
        v70 = 2048;
        v71 = v22;
        _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Processing CMM shareURL %@ for message %@ with state %@ (%lu)", buf, 0x2Au);

      }
    }
    if (v22 == 4 && !v5)
    {
      if (!IMOSLoggingEnabled(v23))
        goto LABEL_64;
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "guid");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v65 = v20;
        v66 = 2112;
        v67 = (uint64_t)v30;
        _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "Moment shareURL %@ for message %@ is already done", buf, 0x16u);

      }
      goto LABEL_18;
    }
    if (v5)
    {
      -[IMDMomentShareManager _contextForMomentShareURL:forMessage:inChat:createIfNeeded:](self, "_contextForMomentShareURL:forMessage:inChat:createIfNeeded:", v20, v8, v9, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31)
      {
        v33 = objc_msgSend(v31, "state");
        if (v33 > 3)
        {
          v44 = objc_msgSend(v32, "state");
          if (v44 != 4)
          {
            IMLogHandleForCategory();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              sub_1D1666F40((uint64_t)v20, v32);

          }
          if (IMOSLoggingEnabled(v44))
          {
            OSLogHandleForIMFoundationCategory();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v8, "guid");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v65 = v47;
              v66 = 2112;
              v67 = (uint64_t)v20;
              _os_log_impl(&dword_1D1413000, v46, OS_LOG_TYPE_INFO, "Clearing and restarting transfers for in-progress message %@, moment share %@", buf, 0x16u);

            }
          }
          objc_msgSend((id)objc_opt_class(), "_clearCMMTransfersForCMMMessage:", v8);
          objc_msgSend(v32, "clearAllTransfers");
          objc_msgSend(v8, "fileTransferGUIDs");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "count");

          objc_msgSend(v8, "setCMMAssetOffset:", v49);
          +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          LOWORD(v63) = 1;
          v51 = (id)objc_msgSend(v50, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:", v8, 1, 0, 0, 0, 1, v63);

          -[IMDMomentShareManager _generateTransfersForContext:](self, "_generateTransfersForContext:", v32);
        }
        else
        {
          if (IMOSLoggingEnabled(v33))
          {
            OSLogHandleForIMFoundationCategory();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v8, "guid");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v65 = v35;
              v66 = 2112;
              v67 = (uint64_t)v20;
              _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, "Message %@. No need to reset transfers for in-progress ingestion of moment share %@", buf, 0x16u);

            }
          }
          objc_msgSend(v8, "fileTransferGUIDs");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "count");

          objc_msgSend(v8, "setCMMAssetOffset:", v37);
          +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          LOWORD(v63) = 1;
          v39 = (id)objc_msgSend(v38, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:", v8, 1, 0, 0, 0, 1, v63);

        }
LABEL_63:

        goto LABEL_64;
      }
      if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v8, "guid");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v8, "getCMMState");
          if (v42 > 4)
            v43 = CFSTR("invalid CMM state");
          else
            v43 = off_1E9229D98[v42];
          *(_DWORD *)buf = 138412546;
          v65 = v41;
          v66 = 2112;
          v67 = (uint64_t)v43;
          _os_log_impl(&dword_1D1413000, v40, OS_LOG_TYPE_INFO, "Resetting transfers on message %@ in state %@ and restarting ingestion", buf, 0x16u);

        }
      }
      objc_msgSend((id)objc_opt_class(), "_clearCMMTransfersForCMMMessage:", v8);
    }
    -[IMDMomentShareManager _contextForMomentShareURL:forMessage:inChat:createIfNeeded:](self, "_contextForMomentShareURL:forMessage:inChat:createIfNeeded:", v20, v8, v9, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v32, "state");
    v53 = v52 == 0;
    v54 = IMOSLoggingEnabled(v52);
    if (v53)
    {
      if (v54)
      {
        OSLogHandleForIMFoundationCategory();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v8, "guid");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v65 = v20;
          v66 = 2112;
          v67 = (uint64_t)v58;
          _os_log_impl(&dword_1D1413000, v57, OS_LOG_TYPE_INFO, "Registering moment shareURL %@ for message %@ and beginning ingestion", buf, 0x16u);

        }
      }
      objc_msgSend(v8, "fileTransferGUIDs");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "count");

      objc_msgSend(v8, "setCMMStateToRegisteredAndAssetOffsetTo:", v60);
      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      LOWORD(v63) = 1;
      v62 = (id)objc_msgSend(v61, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:", v8, 1, 0, 0, 0, 1, v63);

      -[IMDMomentShareManager _transitionToFetchingMomentShareForContext:](self, "_transitionToFetchingMomentShareForContext:", v32);
    }
    else if (v54)
    {
      OSLogHandleForIMFoundationCategory();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "guid");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v65 = v20;
        v66 = 2112;
        v67 = (uint64_t)v56;
        _os_log_impl(&dword_1D1413000, v55, OS_LOG_TYPE_INFO, "Ingestion of moment shareURL %@ for message %@ is already underway", buf, 0x16u);

      }
    }
    goto LABEL_63;
  }
  if (IMOSLoggingEnabled(v21))
  {
    OSLogHandleForIMEventCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "guid");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v65 = v29;
      _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "No share URL found for %@", buf, 0xCu);

    }
LABEL_18:

  }
LABEL_64:

}

- (void)_acceptMomentShareIfNecessaryForContext:(id)a3 isRetry:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  IMDMomentShareManager *v17;
  id v18;
  BOOL v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "momentShare");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "status");
  if ((_DWORD)v9 == 2)
  {
    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "guid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v21 = v7;
        v22 = 2112;
        v23 = v11;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Accepting share %@ for message %@", buf, 0x16u);

      }
    }
    v12 = (void *)objc_opt_class();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1D14797E8;
    v14[3] = &unk_1E9229CD8;
    v15 = v7;
    v16 = v8;
    v17 = self;
    v18 = v6;
    v19 = a4;
    objc_msgSend(v12, "_acceptMomentShare:completionHandler:", v15, v14);

  }
  else if (objc_msgSend(v7, "status") == 1 || objc_msgSend(v7, "status") == 3)
  {
    -[IMDMomentShareManager _fetchAssetsForAcceptedMomentShareWithContext:](self, "_fetchAssetsForAcceptedMomentShareWithContext:", v6);
  }
  else
  {
    IMLogHandleForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1D1666FD4();

    -[IMDMomentShareManager _handleIngestionFailureForContext:](self, "_handleIngestionFailureForContext:", v6);
  }

}

- (void)_fetchAssetsForAcceptedMomentShareWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "momentShare");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "guid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Transitioning to accepted state for moment share %@ message %@", buf, 0x16u);

    }
  }
  objc_msgSend(v6, "setCMMState:", 2);
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v12) = 1;
  v11 = (id)objc_msgSend(v10, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:", v6, 1, 0, 0, 0, 1, v12);

  -[IMDMomentShareManager _transitionToWaitingForAssetsForContext:](self, "_transitionToWaitingForAssetsForContext:", v4);
}

+ (id)_loadCMMTransfersForMessage:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "getCMMAssetOffset");
  objc_msgSend(v3, "fileTransferGUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subarrayWithRange:", v4, objc_msgSend(v5, "count") - v4);
  v6 = objc_claimAutoreleasedReturnValue();

  +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)v6;
  objc_msgSend(v7, "attachmentsWithGUIDs:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    v14 = *MEMORY[0x1E0D37F40];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v16, "attributionInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
          objc_msgSend(v9, "addObject:", v16);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  return v9;
}

- (void)regenerateTransfersForMessage:(id)a3 inChat:(id)a4 addingAssetWithUUID:(id)a5
{
  NSObject *v5;

  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    sub_1D16671E4(v5);

}

- (id)_assetUUIDToUnfinishedTransferMapFromTransfers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v20;
    v9 = *MEMORY[0x1E0D37F40];
    *(_QWORD *)&v7 = 138412546;
    v18 = v7;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v11, "transferState", v18, (_QWORD)v19) <= 4)
        {
          objc_msgSend(v11, "attributionInfo");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v11, "attributionInfo");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKey:", v9);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
              if (IMOSLoggingEnabled(v15))
              {
                OSLogHandleForIMFoundationCategory();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = v18;
                  v24 = v14;
                  v25 = 2112;
                  v26 = v11;
                  _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "TransferMap entry %@ to %@", buf, 0x16u);
                }

              }
              objc_msgSend(v4, "setValue:forKey:", v11, v14);
            }

          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v6);
  }

  return v4;
}

- (BOOL)messageHasUnfinishedTransfers:(id)a3
{
  id v3;
  void *v4;
  char v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_msgSend((id)objc_opt_class(), "_loadCMMTransfersForMessage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D147A134;
  v7[3] = &unk_1E9229D00;
  v7[4] = &v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  v5 = *((_BYTE *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)_startAssetExportForContext:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  void *v21;
  id obj;
  id v23;
  _QWORD v24[5];
  id v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  objc_msgSend(v23, "assetsFetch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "message");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "assetUUIDsToFileTransfers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v29;
    *(_QWORD *)&v7 = 138412802;
    v20 = v7;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v10, "uuid", v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = IMOSLoggingEnabled(v12);
        if (v12)
        {
          if (v13)
          {
            OSLogHandleForIMEventCategory();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v21, "guid");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v33 = v15;
              v34 = 2112;
              v35 = v11;
              _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Message %@: Begin request for resource file URLs for asset %@", buf, 0x16u);

            }
          }
          v16 = (void *)objc_opt_class();
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = sub_1D147A4F0;
          v24[3] = &unk_1E9229D28;
          v24[4] = self;
          v25 = v23;
          v26 = v10;
          v27 = v12;
          objc_msgSend(v16, "_requestResourceFileURLsForAsset:fileTransfer:completionHandler:", v10, v27, v24);

        }
        else
        {
          if (v13)
          {
            OSLogHandleForIMEventCategory();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v21, "guid");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v5, "count");
              *(_DWORD *)buf = v20;
              v33 = v18;
              v34 = 2112;
              v35 = v11;
              v36 = 2048;
              v37 = v19;
              _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Message %@: Not requesting asset for %@, not in transfer map. %lu left for processing", buf, 0x20u);

            }
          }
          -[IMDMomentShareManager _handleIngestionFailureForContext:](self, "_handleIngestionFailureForContext:", v23);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v6);
  }

}

- (void)_handleResourceRequestForContext:(id)a3 asset:(id)a4 transfer:(id)a5 didCompleteWithFileURL:(id)a6 error:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v34 = a7;
  objc_msgSend(v11, "message");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assetUUIDsToFileTransfers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v16);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if ((id)v18 == v13)
  {
    if (v14)
    {
      if (IMOSLoggingEnabled(v18))
      {
        OSLogHandleForIMEventCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v15, "guid");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v42 = v23;
          v43 = 2112;
          v44 = v16;
          _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Message %@: Completed request for resource file URLs for asset: %@", buf, 0x16u);

        }
      }
      objc_msgSend(v13, "guid");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = IMOSLoggingEnabled(v32);
      if (v32)
      {
        if (v24)
        {
          OSLogHandleForIMEventCategory();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v13, "guid");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v42 = v26;
            v43 = 2112;
            v44 = v16;
            _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Setting syndication identifier to %@ on asset with UUID %@", buf, 0x16u);

          }
        }
        objc_msgSend(MEMORY[0x1E0CD16F8], "sharedMomentSharePhotoLibrary");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = MEMORY[0x1E0C809B0];
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = sub_1D147AA24;
        v38[3] = &unk_1E9228750;
        v39 = v12;
        v40 = v13;
        v35[0] = v28;
        v35[1] = 3221225472;
        v35[2] = sub_1D147AA84;
        v35[3] = &unk_1E9229230;
        v36 = v40;
        v37 = v16;
        objc_msgSend(v27, "performChanges:completionHandler:", v38, v35);

      }
      else if (v24)
      {
        OSLogHandleForIMFoundationCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v16;
          _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "IMDMomentShareManager - Not setting syndication identifier on asset with UUID %@ due to missing syndication identifier", buf, 0xCu);
        }

      }
      -[IMDMomentShareManager _persistAttachmentAtFileURL:forFileTransfer:](self, "_persistAttachmentAtFileURL:forFileTransfer:", v14, v13);
      -[IMDMomentShareManager _updatePendingTransferMapForContext:completedTransfer:](self, "_updatePendingTransferMapForContext:completedTransfer:", v11, v13);

    }
    else
    {
      IMLogHandleForCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v15, "guid");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v42 = v31;
        v43 = 2112;
        v44 = v16;
        v45 = 2112;
        v46 = v34;
        _os_log_error_impl(&dword_1D1413000, v29, OS_LOG_TYPE_ERROR, "Message %@: Failed request for resource file URLs for asset: %@, error: %@", buf, 0x20u);

      }
      -[IMDMomentShareManager _handleIngestionFailureForContext:](self, "_handleIngestionFailureForContext:", v11);
    }
  }
  else if (IMOSLoggingEnabled(v18))
  {
    OSLogHandleForIMEventCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v15, "guid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v42 = v21;
      v43 = 2112;
      v44 = v19;
      v45 = 2112;
      v46 = v16;
      _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Message %@: Original transfer %@ not found for asset %@", buf, 0x20u);

    }
  }

}

+ (id)_copyItemAtURL:(id)a3 toTemporaryDirectoryWithName:(id)a4 isDirectory:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  id v19;
  char v20;
  id v21;
  NSObject *v22;
  char v23;
  NSObject *v24;
  NSObject *v25;
  id v27;
  id v28;
  id v29;

  v7 = a5;
  v9 = a3;
  v10 = a4;
  IMSafeTemporaryDirectory();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathComponent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "lastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingPathComponent:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v17 = objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v29);
  v18 = v29;
  v19 = v18;
  if ((v17 & 1) == 0)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v18);
    IMLogHandleForCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1D1667390();
    goto LABEL_15;
  }
  v28 = v18;
  v20 = objc_msgSend(v16, "removeItemAtPath:error:", v15, &v28);
  v21 = v28;

  if ((v20 & 1) != 0 || objc_msgSend(v21, "code") == 4)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v15, v7);
    v22 = objc_claimAutoreleasedReturnValue();
    v27 = v21;
    v23 = objc_msgSend(v16, "copyItemAtURL:toURL:error:", v9, v22, &v27);
    v19 = v27;

    if ((v23 & 1) != 0)
    {
      v22 = v22;
      v24 = v22;
      goto LABEL_16;
    }
    if (a6)
      *a6 = objc_retainAutorelease(v19);
    IMLogHandleForCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_1D16672C8();

LABEL_15:
    v24 = 0;
    goto LABEL_16;
  }
  if (a6)
    *a6 = objc_retainAutorelease(v21);
  IMLogHandleForCategory();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    sub_1D166732C();
  v24 = 0;
  v19 = v21;
LABEL_16:

  return v24;
}

+ (id)_copiedFileURLFromAssetExportFileURLs:(id)a3 transferGUID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  BOOL v25;
  NSObject *v27;
  id *v29;
  id *v30;
  id v31;
  id v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CD18B0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CD18B8]);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10)
    v13 = v10;
  else
    v13 = (void *)v11;
  v14 = v13;
  if (!v14)
  {
    v29 = a5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No photo or video file URL in file URLs: %@, for transfer: %@"), v8, v9);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0CB2938];
    v34[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("IMDMomentShareManagerErrorDomain"), -1, v22);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    IMLogHandleForCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_1D16673F4();
    v15 = 0;
    goto LABEL_24;
  }
  v32 = 0;
  v15 = (void *)objc_msgSend(a1, "_copyItemAtURL:toTemporaryDirectoryWithName:isDirectory:error:", v14, v9, 0, &v32);
  v16 = v32;
  v17 = v16;
  if (v15)
  {
    v18 = v15;
    v19 = 0;
  }
  else
  {
    v30 = a5;
    v19 = v16;
    IMLogHandleForCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_1D16674C0();

    a5 = v30;
  }

  if (v10)
    v25 = v12 == 0;
  else
    v25 = 1;
  if (!v25 && v15 != 0)
  {
    v31 = 0;
    v23 = objc_msgSend(a1, "_copyItemAtURL:toTemporaryDirectoryWithName:isDirectory:error:", v12, v9, 0, &v31);
    v20 = v31;
    if (v23)
    {
LABEL_25:

      goto LABEL_26;
    }
    v29 = a5;

    v20 = v20;
    IMLogHandleForCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_1D1667458();

    v15 = 0;
    v19 = v20;
LABEL_24:
    a5 = v29;
    goto LABEL_25;
  }
LABEL_26:
  if (a5 && !v15)
    *a5 = objc_retainAutorelease(v19);

  return v15;
}

+ (void)_requestResourceFileURLsForAsset:(id)a3 fileTransfer:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v42 = 0;
  objc_msgSend(MEMORY[0x1E0CD1410], "exportRequestForAsset:error:", v8, &v42);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v42;
  if (v11)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0CD1748]);
    objc_msgSend(v13, "setDontAllowRAW:", 1);
    v41 = 0;
    objc_msgSend(MEMORY[0x1E0CD1740], "fetchResourcesToShareForAsset:requestOptions:error:", v8, v13, &v41);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v41;
    v29 = v14;
    if (v14)
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v15 = v14;
      v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      if (v16)
      {
        v17 = v16;
        v26 = a1;
        v27 = v12;
        v18 = 0;
        v19 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v38 != v19)
              objc_enumerationMutation(v15);
            v18 += objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "fileSize", v26, v27, v28, v29);
          }
          v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        }
        while (v17);
        a1 = v26;
        v12 = v27;
        goto LABEL_17;
      }
    }
    else
    {
      IMLogHandleForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_1D16675A4();
    }
    v18 = 0;
LABEL_17:

    objc_msgSend(v9, "guid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "updateTransfer:currentBytes:totalBytes:", v22, 0, v18);

    v24 = objc_alloc_init(MEMORY[0x1E0CD1418]);
    objc_msgSend(v24, "setVariant:", 1);
    objc_msgSend(v24, "setDontAllowRAW:", 1);
    objc_msgSend(v24, "setDisableMetadataCorrections:", 1);
    objc_msgSend(v24, "setResultHandlerQueue:", MEMORY[0x1E0C80D38]);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_1D147B3C0;
    v30[3] = &unk_1E9229D50;
    v31 = v22;
    v35 = v18;
    v36 = a1;
    v32 = v9;
    v34 = v10;
    v33 = v8;
    v25 = v22;
    objc_msgSend(v11, "exportWithOptions:completionHandler:", v24, v30);

    goto LABEL_18;
  }
  IMLogHandleForCategory();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    sub_1D1667528();

  (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v12);
LABEL_18:

}

- (void)_persistAttachmentAtFileURL:(id)a3 forFileTransfer:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "guid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMEventCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v17 = 138412546;
      v18 = v5;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Persisting attachment at fileURL: %@ for transfer: %@", (uint8_t *)&v17, 0x16u);
    }

  }
  +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transferForGUID:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  IMUTITypeForFilename();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFilename:", v13);

  objc_msgSend(v10, "setTransferredFilename:", v11);
  objc_msgSend(v10, "setType:", v12);
  objc_msgSend(v5, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setLocalPath:", v14);

  objc_msgSend(v10, "_setLocalURL:", v5);
  +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "storeAttachment:associateWithMessageWithGUID:", v10, 0);

  +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "endTransfer:", v7);

}

- (void)_updatePendingTransferMapForContext:(id)a3 completedTransfer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "guid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetUUIDsToFileTransfers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v7, "attributionInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0D37F40]);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "completeTransferForAssetUUID:", v12);
    v13 = objc_msgSend(v10, "count");
    v14 = IMOSLoggingEnabled(v13);
    if (v13)
    {
      if (v14)
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v22 = objc_msgSend(v10, "count");
          _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "%lu assets still pending export", buf, 0xCu);
        }

      }
    }
    else
    {
      if (v14)
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v22 = (uint64_t)v9;
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Last outstanding asset requested for message %@, setting IMCMMStateCompleted", buf, 0xCu);
        }

      }
      if (v8 && !-[IMDMomentShareManager messageHasUnfinishedTransfers:](self, "messageHasUnfinishedTransfers:", v8))
      {
        objc_msgSend(v8, "setCMMState:", 4);
        +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LOWORD(v20) = 257;
        v19 = (id)objc_msgSend(v18, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:", v8, 1, 0, 0, 0, 1, v20);

        -[IMDMomentShareManager _transitionToCompletedStateForContext:](self, "_transitionToCompletedStateForContext:", v6);
      }
      else
      {
        IMLogHandleForCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          sub_1D166776C();

        -[IMDMomentShareManager _handleIngestionFailureForContext:](self, "_handleIngestionFailureForContext:", v6);
      }
    }
  }
  else
  {
    IMLogHandleForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1D1667708();
  }

}

+ (void)_clearCMMTransfersForCMMMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_loadCMMTransfersForMessage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(v6, "arrayByApplyingSelector:", sel_guid);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteAttachmentsWithGUIDs:", v7);

    objc_msgSend(v4, "fileTransferGUIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(v10, "removeObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14++), (_QWORD)v19);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
      }
      while (v12);
    }

    if (IMOSLoggingEnabled(v15))
    {
      OSLogHandleForIMEventCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = objc_msgSend(v11, "count");
        objc_msgSend(v4, "guid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v24 = v17;
        v25 = 2112;
        v26 = v18;
        v27 = 2112;
        v28 = v10;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Deleting %lu transferGUIDS from CMM message %@, rl transfers left %@", buf, 0x20u);

      }
    }
    objc_msgSend(v4, "setFileTransferGUIDs:", v10, (_QWORD)v19);

  }
}

+ (id)_generateTransfersForAssetUUIDs:(id)a3 forMessage:(id)a4 inChat:(id)a5 momentShare:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  uint64_t v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v51 = a6;
  v50 = v11;
  if (objc_msgSend(v10, "count"))
  {
    v13 = objc_msgSend(v11, "getCMMAssetOffset");
    v14 = objc_msgSend(v10, "count");
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v14);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v14 + v13);
    objc_msgSend(v11, "fileTransferGUIDs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "subarrayWithRange:", 0, v13);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled(v18))
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v62 = v49;
        _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Starting with RL transfer GUIDs %@", buf, 0xCu);
      }

    }
    objc_msgSend(v16, "addObjectsFromArray:", v49);
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = sub_1D147C2C0;
    v52[3] = &unk_1E9229D78;
    v57 = a1;
    v20 = v50;
    v53 = v20;
    v54 = v51;
    v58 = v13;
    v59 = v14;
    v46 = v15;
    v55 = v46;
    v48 = v16;
    v56 = v48;
    if (IMOSLoggingEnabled(objc_msgSend(v10, "enumerateObjectsUsingBlock:", v52)))
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v20, "guid");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v62 = v22;
        _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Setting Message %@ to CMM state Generated", buf, 0xCu);

      }
    }
    v23 = (void *)objc_msgSend(v48, "copy");
    objc_msgSend(v20, "setFileTransferGUIDs:", v23);

    objc_msgSend(v20, "setCMMState:", 3);
    if ((objc_msgSend(v20, "isFromMe") & 1) != 0)
    {
      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LOWORD(v45) = 1;
      v25 = (id)objc_msgSend(v24, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:", v20, 1, 0, 0, 0, 1, v45, v46);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithCurrentServerTime");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTimeRead:", v30);

      objc_msgSend(v20, "setFlags:", objc_msgSend(v20, "flags") | 0x2000);
      v31 = objc_msgSend(v20, "flags");
      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LOWORD(v45) = 1;
      v32 = (id)objc_msgSend(v24, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:", v20, 1, 0, 1, v31 | 0x2000, 1, v45, v46);
    }

    v60 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)IMCreateSerializedItemsFromArray();

    +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "broadcasterForChatListenersUsingBlackholeRegistry:", objc_msgSend(v12, "isBlackholed"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accountID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "chatIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v12, "style");
    objc_msgSend(v12, "properties");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "account:chat:style:chatProperties:messagesUpdated:", v37, v38, v39, v40, v34);

    if (IMOSLoggingEnabled(v41))
    {
      OSLogHandleForIMEventCategory();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v20, "guid");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v62 = v43;
        _os_log_impl(&dword_1D1413000, v42, OS_LOG_TYPE_INFO, "Persisted attachments to message %@", buf, 0xCu);

      }
    }
    v29 = v47;

  }
  else
  {
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v11, "guid");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v51, "assetCount"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v62 = v27;
        v63 = 2112;
        v64 = v28;
        v65 = 2112;
        v66 = v51;
        _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Not generating transfers for message %@ because there are no asset UUIDs moment share with count %@: %@", buf, 0x20u);

      }
    }
    v29 = (id)MEMORY[0x1E0C9AA60];
  }

  return v29;
}

+ (id)_fileTransferForAssetUUID:(id)a3 forMessage:(id)a4 momentShare:(id)a5 atIndex:(unint64_t)a6 ofTotal:(unint64_t)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "guid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  IMFileTransferGUIDForLocalOnlyFileTransferRepresentingCMMAssetAtIndexInMessageGUID();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "transferForGUID:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v11, "shareURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "absoluteString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v18, *MEMORY[0x1E0D37F38]);

  objc_msgSend(v16, "setObject:forKey:", v27, *MEMORY[0x1E0D37F40]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v19, *MEMORY[0x1E0D37F28]);

  if (v15)
  {
    if (IMOSLoggingEnabled(v20))
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v29 = v13;
        v30 = 2112;
        v31 = v16;
        _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Existing transfer found for %@, setting attribution %@", buf, 0x16u);
      }

    }
    objc_msgSend(v15, "setAttributionInfo:", v16);
  }
  else
  {
    +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v26) = 0;
    objc_msgSend(v22, "makeNewIncomingTransferWithGUID:filename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:", v13, 0, 0, 0, 0, 0, v26);

    +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "transferForGUID:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "guid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMessageGUID:", v24);

    objc_msgSend(v15, "setAttributionInfo:", v16);
  }

  return v15;
}

+ (id)_fetchResultForCuratedOrFirstForMomentShare:(id)a3 outFetchType:(int64_t *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v13;
  NSObject *v14;
  void *v15;
  int64_t v16;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CD16F8], "sharedMomentSharePhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "preview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "curatedAssetIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  v11 = objc_msgSend(v5, "assetCount");
  v13 = v10 > 9 || v10 >= v11;
  if (v10 && !v13)
  {
    IMLogHandleForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1D16677D0(v5, v14);

  }
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchCuratedAssetsInAssetCollection:options:", v5, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 1;
    if (!a4)
      goto LABEL_17;
    goto LABEL_16;
  }
  objc_msgSend(v7, "setFetchLimit:", 10);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v5, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 2;
  if (a4)
LABEL_16:
    *a4 = v16;
LABEL_17:

  return v15;
}

+ (int64_t)_targetCountForContext:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int64_t v8;
  NSObject *v9;

  v3 = a3;
  objc_msgSend(v3, "momentShare");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1D1667850(v3, v9);
    goto LABEL_10;
  }
  v5 = objc_msgSend(v3, "fetchType");
  if (!v5)
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1D16678E4(v4, v9);
LABEL_10:

    goto LABEL_11;
  }
  if (v5 != 2)
  {
    if (v5 == 1)
    {
      objc_msgSend(v4, "preview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "curatedAssetIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      goto LABEL_12;
    }
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  if ((unint64_t)objc_msgSend(v4, "assetCount") > 9)
    v8 = 10;
  else
    v8 = objc_msgSend(v4, "assetCount");
LABEL_12:

  return v8;
}

- (NSMutableDictionary)shareURLsToContexts
{
  return self->_shareURLsToContexts;
}

- (void)setShareURLsToContexts:(id)a3
{
  objc_storeStrong((id *)&self->_shareURLsToContexts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareURLsToContexts, 0);
}

@end
