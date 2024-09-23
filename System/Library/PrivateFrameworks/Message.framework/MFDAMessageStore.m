@implementation MFDAMessageStore

- (MFDAMessageStore)initWithMailbox:(id)a3 readOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  MFDAMessageStore *v7;
  void *v8;
  char v9;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFDAMessageStore;
  v7 = -[MFLibraryStore initWithMailbox:readOnly:](&v11, sel_initWithMailbox_readOnly_, v6, v4);
  if (v7)
  {
    objc_msgSend(v6, "folderID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("kDAMailAccountAllMailboxesFolderID"));

    v7->_backedByVirtualAllSearchMailbox = v9;
  }

  return v7;
}

- (id)folderIDForFetching
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore mailbox](self, "mailbox");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMailbox:", v4);

  -[MFLibraryStore mailbox](self, "mailbox");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "folderID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[MFLibraryStore account](self, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchMailboxList");

    objc_msgSend(v5, "folderID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (int64_t)fetchNumMessages:(unint64_t)a3 preservingUID:(id)a4 options:(unint64_t)a5
{
  char v5;
  id v8;
  void *v9;
  void *v10;
  _MFDAMSUpdateConsumer *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  MFMailMessageLibrary *library;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t numNewMessages;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v26;

  v5 = a5;
  v8 = a4;
  -[MFLibraryStore willFetchMessages](self, "willFetchMessages");
  -[MFDAMessageStore folderIDForFetching](self, "folderIDForFetching");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[MFLibraryStore account](self, "account");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "finishedInitialMailboxListLoad");

    numNewMessages = v22 << 63 >> 63;
    if ((v5 & 2) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  -[MFLibraryStore mailbox](self, "mailbox");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(_MFDAMSUpdateConsumer);
  objc_storeStrong((id *)&v11->super.store, self);
  objc_storeStrong((id *)&v11->super.mailbox, v10);
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MFDAMSBasicConsumer setMonitor:](v11, "setMonitor:", v12);

  -[MFLibraryStore library](self, "library");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("-[MFDAMessageStore fetchNumMessages:preservingUID:options:]", "MFDAMessageStore.m", 257, "[[self library] isKindOfClass:[MFMailMessageLibrary class]]");

  -[MFLibraryStore library](self, "library");
  v14 = objc_claimAutoreleasedReturnValue();
  library = v11->super.library;
  v11->super.library = (MFMailMessageLibrary *)v14;

  v16 = -[_MFDAMessageStoreGetUpdatesRequest initRequestForBodyFormat:withBodySizeLimit:isUserRequested:]([_MFDAMessageStoreGetUpdatesRequest alloc], "initRequestForBodyFormat:withBodySizeLimit:isUserRequested:", 0, 500, v5 & 1);
  -[MFLibraryStore account](self, "account");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addRequest:consumer:mailbox:", v16, v11, v10);

  if (!-[MFBufferedQueue isEmpty](v11, "isEmpty"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFDAMessageStore.m"), 264, CFSTR("update consumer queue should be empty at this point."));

  }
  -[_MFDAMSBasicConsumer error](v11, "error");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    numNewMessages = objc_claimAutoreleasedReturnValue();
    -[_MFDAMSBasicConsumer error](v11, "error");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)numNewMessages, "setError:", v19);

    LODWORD(numNewMessages) = -1;
  }
  else
  {
    numNewMessages = v11->super.numNewMessages;
  }

  if ((v5 & 2) != 0)
  {
LABEL_11:
    -[MFLibraryStore serverSearchResults](self, "serverSearchResults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFLibraryStore compactMessages:](self, "compactMessages:", v23);

  }
LABEL_12:
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "reset");

  return (int)numNewMessages;
}

- (void)_remoteIDsMatchingSearchText:(id)a3 predicate:(id)a4 limit:(unsigned int)a5 offset:(id)a6 filterByDate:(BOOL)a7 handler:(id)a8
{
  _BOOL4 v9;
  NSObject *v14;
  _MFDAMSSearchResponseConsumer *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  MFMailMessageLibrary *library;
  id v20;
  void *v21;
  char v22;
  MFRemoteSearchResults *v23;
  unint64_t numNewMessages;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  uint64_t v47;
  char v48;
  int v49;
  NSObject *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  uint64_t v56;
  void *v57;
  id v59;
  id v60;
  void (**v61)(id, unint64_t, MFRemoteSearchResults *);
  void *v62;
  id v63;
  id v64;
  void *v65;
  uint8_t buf[4];
  uint64_t v67;
  __int16 v68;
  unint64_t v69;
  __int16 v70;
  uint64_t v71;
  uint64_t v72;

  v9 = a7;
  v72 = *MEMORY[0x1E0C80C00];
  v63 = a3;
  v64 = a4;
  v60 = a6;
  v61 = (void (**)(id, unint64_t, MFRemoteSearchResults *))a8;
  -[MFDAMessageStore folderIDForFetching](self, "folderIDForFetching");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  MFLogGeneral();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v67 = (uint64_t)v63;
    v68 = 2112;
    v69 = (unint64_t)v64;
    _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_INFO, "About to process remote ids matching searchtext:%@ predicate: %@", buf, 0x16u);
  }

  if (v65)
  {
    -[MFLibraryStore mailbox](self, "mailbox");
    v59 = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(_MFDAMSSearchResponseConsumer);
    objc_storeStrong((id *)&v15->super.store, self);
    objc_storeStrong((id *)&v15->super.mailbox, v59);
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MFDAMSBasicConsumer setMonitor:](v15, "setMonitor:", v16);

    -[MFLibraryStore library](self, "library");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      __assert_rtn("-[MFDAMessageStore _remoteIDsMatchingSearchText:predicate:limit:offset:filterByDate:handler:]", "MFDAMessageStore.m", 313, "[[self library] isKindOfClass:[MFMailMessageLibrary class]]");

    -[MFLibraryStore library](self, "library");
    v18 = objc_claimAutoreleasedReturnValue();
    library = v15->super.library;
    v15->super.library = (MFMailMessageLibrary *)v18;

    v15->totalCount = 0;
    if (v60)
    {
      v20 = v60;
      goto LABEL_15;
    }
    if (v9)
    {
      -[MFLibraryStore dateOfOldestNonIndexedNonSearchResultMessage](self, "dateOfOldestNonIndexedNonSearchResultMessage");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "isEqualToDate:", v26);

      if (!v27)
      {
        v20 = v25;
LABEL_15:
        v62 = v20;
        -[_MFDAMSSearchResponseConsumer setLatestDateToAdd:](v15, "setLatestDateToAdd:");
        MFUserAgent();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "networkActivityStarted:", self);

        if (-[MFDAMessageStore backedByVirtualAllSearchMailbox](self, "backedByVirtualAllSearchMailbox"))
        {

          v65 = 0;
        }
        if (v15->super.numNewMessages < a5)
        {
          v29 = 0;
          v30 = a5;
          while (1)
          {
            -[_MFDAMSBasicConsumer error](v15, "error");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v31 == 0;

            if (!v32)
              goto LABEL_36;
            objc_msgSend(MEMORY[0x1E0D1C428], "mailboxSearchQueryWithSearchString:predicate:consumer:", v63, v64, v15);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setBodyType:", 1);
            objc_msgSend(v33, "setCollectionID:", v65);
            objc_msgSend(v33, "setMIMESupport:", 0);
            objc_msgSend(v33, "setRange:", v29, 100);
            objc_msgSend(v33, "setTruncationSize:", 500);
            objc_msgSend(v33, "setPriorToDate:", v62);
            objc_msgSend(v33, "setDeepTraversal:", 1);
            -[MFLibraryStore account](self, "account");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "accountConduit");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v35, "performSearchQuery:", v33);
            +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            while (1)
            {
              v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", 1.0);
              if (-[_MFDAMSSearchResponseConsumer waitUntilDoneBeforeDate:](v15, "waitUntilDoneBeforeDate:", v37))
                break;
              if (objc_msgSend(v36, "shouldCancel"))
              {
                objc_msgSend(v35, "cancelSearchQuery:", v33);
                -[_MFDAMSSearchResponseConsumer waitUntilDone](v15, "waitUntilDone");
                v39 = 0;
                goto LABEL_30;
              }

            }
            -[_MFDAMSBasicConsumer error](v15, "error");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (v38)
              break;
            if (v29 + 100 >= (unint64_t)v15->totalCount)
              goto LABEL_29;
            -[_MFDAMSSearchResponseConsumer resetDoneCondition](v15, "resetDoneCondition");
            v39 = 0;
            v29 += 100;
LABEL_30:

            if (v15->super.numNewMessages >= v30)
              v40 = 1;
            else
              v40 = v39;
            if ((v40 & 1) != 0)
              goto LABEL_36;
          }

LABEL_29:
          v39 = 1;
          goto LABEL_30;
        }
        v29 = 0;
LABEL_36:
        MFUserAgent();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "networkActivityEnded:", self);

        if (!-[MFBufferedQueue isEmpty](v15, "isEmpty"))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFDAMessageStore.m"), 377, CFSTR("update consumer queue should be empty at this point."));

        }
        -[_MFDAMSBasicConsumer error](v15, "error");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v42)
          goto LABEL_58;
        -[_MFDAMSBasicConsumer error](v15, "error");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "domain");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "isEqualToString:", *MEMORY[0x1E0D1C3B8]);

        -[_MFDAMSBasicConsumer error](v15, "error");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "code");

        v48 = v47 == 78 ? v45 : 0;
        if ((v48 & 1) != 0)
          goto LABEL_58;
        if (v47 == 29)
          v49 = v45;
        else
          v49 = 0;
        if (v49 == 1)
        {
          MFLogGeneral();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            -[MFDAMessageStore _remoteIDsMatchingSearchText:predicate:limit:offset:filterByDate:handler:].cold.1((uint64_t)v64, v50);
        }
        else
        {
          if (v47 == 30)
            v51 = v45;
          else
            v51 = 0;
          if (v51 != 1)
          {
LABEL_56:
            -[_MFDAMSBasicConsumer error](v15, "error");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            if (v52)
            {
              +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MFDAMSBasicConsumer error](v15, "error");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "setError:", v54);

              v23 = 0;
              numNewMessages = -1;
LABEL_62:

              goto LABEL_63;
            }
LABEL_58:
            -[_MFDAMSSearchResponseConsumer searchResult](v15, "searchResult");
            v23 = (MFRemoteSearchResults *)objc_claimAutoreleasedReturnValue();
            numNewMessages = v15->super.numNewMessages;
            if (numNewMessages < v29 + 100)
            {
              MFLogGeneral();
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
              {
                v56 = objc_opt_class();
                *(_DWORD *)buf = 138412802;
                v67 = v56;
                v68 = 2048;
                v69 = numNewMessages;
                v70 = 2048;
                v71 = v29 + 100;
                _os_log_impl(&dword_1A4F90000, v55, OS_LOG_TYPE_INFO, "%@ Seems like the server exhausted the search results (%ld of %lu), un-setting a continue offset", buf, 0x20u);
              }

              -[MFRemoteSearchResults setContinueOffset:](v23, "setContinueOffset:", 0);
            }
            goto LABEL_62;
          }
          MFLogGeneral();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            -[MFDAMessageStore _remoteIDsMatchingSearchText:predicate:limit:offset:filterByDate:handler:].cold.2(v50);
        }

        goto LABEL_56;
      }

    }
    v20 = 0;
    goto LABEL_15;
  }
  -[MFLibraryStore account](self, "account");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "finishedInitialMailboxListLoad");

  if ((v22 & 1) != 0)
  {
    v23 = 0;
    v65 = 0;
    numNewMessages = -1;
  }
  else
  {
    numNewMessages = 0;
    v65 = 0;
    v23 = objc_alloc_init(MFRemoteSearchResults);
  }
LABEL_63:
  v61[2](v61, numNewMessages, v23);

}

- (id)storeSearchResultMatchingQuery:(id)a3 criterion:(id)a4 limit:(unsigned int)a5 offset:(id)a6 useLocalIndex:(BOOL)a7
{
  uint64_t v9;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t v19[8];
  _QWORD v20[5];
  __int128 buf;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v9 = *(_QWORD *)&a5;
  v26 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a6;
  if (a7)
  {
    v13 = 0;
  }
  else
  {
    DALoggingwithCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_INFO, "Searching for criterion: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(v11, "daSearchPredicate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v11, "daBasicSearchString");
      v16 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v22 = 0x3032000000;
      v23 = __Block_byref_object_copy__11;
      v24 = __Block_byref_object_dispose__11;
      v25 = 0;
      if (-[NSObject length](v16, "length"))
      {
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __88__MFDAMessageStore_storeSearchResultMatchingQuery_criterion_limit_offset_useLocalIndex___block_invoke;
        v20[3] = &unk_1E4E8BE68;
        v20[4] = &buf;
        -[MFDAMessageStore _remoteIDsMatchingSearchText:predicate:limit:offset:filterByDate:handler:](self, "_remoteIDsMatchingSearchText:predicate:limit:offset:filterByDate:handler:", v16, v15, v9, v12, 1, v20);
      }
      else
      {
        DALoggingwithCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_1A4F90000, v17, OS_LOG_TYPE_DEFAULT, "Attempted to fetch messages from DA without searchText", v19, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _Block_object_dispose(&buf, 8);

    }
    else
    {
      DALoggingwithCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A4F90000, v16, OS_LOG_TYPE_INFO, "Predicate is not supported, bailing.", (uint8_t *)&buf, 2u);
      }
      v13 = 0;
    }

  }
  return v13;
}

void __88__MFDAMessageStore_storeSearchResultMatchingQuery_criterion_limit_offset_useLocalIndex___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

- (BOOL)replayFlagChange:(id)a3 forRemoteIDs:(id)a4 error:(id *)a5 completed:(BOOL *)a6
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *p_super;
  BOOL v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  MFMailMessageLibrary *library;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  id v29;
  void *v30;
  NSObject *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  id v37;
  void *v38;
  NSObject *v39;
  MFError *error;
  void *v41;
  void *v43;
  int v44;
  void *v47;
  id v49;
  id v51;
  id v52;
  _MFDAMSUpdateConsumer *v53;
  _QWORD v54[5];
  id v55;
  _BYTE *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[5];
  id v62;
  _BYTE *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t v68[128];
  uint8_t v69[4];
  id v70;
  uint8_t v71[128];
  _BYTE buf[24];
  char v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v7 = a4;
  v47 = v7;
  DALoggingwithCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v51;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_INFO, "Replaying flag change %@ for remote ids: %@", buf, 0x16u);
  }

  if (a5)
    *a5 = 0;
  -[MFLibraryStore mailbox](self, "mailbox");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v73 = 1;
  v49 = v9;
  objc_msgSend(v9, "folderID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    DALoggingwithCategory();
    p_super = objc_claimAutoreleasedReturnValue();
    v18 = 1;
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
      goto LABEL_53;
    objc_msgSend(v49, "ef_publicDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v69 = 138412290;
    v70 = v19;
    v20 = p_super;
    _os_log_impl(&dword_1A4F90000, p_super, OS_LOG_TYPE_INFO, "No folder ID for mailbox: %@", v69, 0xCu);

LABEL_52:
    p_super = v20;
    goto LABEL_53;
  }
  -[MFLibraryStore account](self, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "supportsMessageFlagging");

  v13 = objc_msgSend(v51, "readChanged");
  if (v13)
  {
    v14 = objc_msgSend(v51, "read");
    v15 = v14;
    v16 = v14 ^ 1;
    if (!v12)
      goto LABEL_17;
  }
  else
  {
    v15 = 0;
    v16 = 0;
    if (!v12)
      goto LABEL_17;
  }
  if (objc_msgSend(v51, "flaggedChanged"))
  {
    if (objc_msgSend(v51, "flagged"))
      v15 |= 2uLL;
    else
      v16 |= 2uLL;
    v13 = 1;
  }
LABEL_17:
  v44 = objc_msgSend(v51, "deleted");
  if ((v13 | v44) != 1)
  {
    DALoggingwithCategory();
    p_super = objc_claimAutoreleasedReturnValue();
    v18 = 1;
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
      goto LABEL_53;
    objc_msgSend(v51, "ef_publicDescription");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v69 = 138412290;
    v70 = v41;
    v20 = p_super;
    _os_log_impl(&dword_1A4F90000, p_super, OS_LOG_TYPE_INFO, "No request needed for flag change: %@", v69, 0xCu);

    goto LABEL_52;
  }
  v53 = objc_alloc_init(_MFDAMSUpdateConsumer);
  objc_storeStrong((id *)&v53->super.store, self);
  objc_storeStrong((id *)&v53->super.mailbox, v49);
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MFDAMSBasicConsumer setMonitor:](v53, "setMonitor:", v21);

  -[MFLibraryStore library](self, "library");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("-[MFDAMessageStore replayFlagChange:forRemoteIDs:error:completed:]", "MFDAMessageStore.m", 502, "[[self library] isKindOfClass:[MFMailMessageLibrary class]]");

  -[MFLibraryStore library](self, "library");
  v23 = objc_claimAutoreleasedReturnValue();
  library = v53->super.library;
  v53->super.library = (MFMailMessageLibrary *)v23;

  if (v13)
  {
    v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v52 = v47;
    v26 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v65 != v27)
            objc_enumerationMutation(v52);
          v29 = -[DAMailboxSetFlagsRequest initRequestWithSetFlags:unsetFlags:message:]([_MFDAMessageStoreSetFlagsRequest alloc], "initRequestWithSetFlags:unsetFlags:message:", v15, v16, *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i));
          objc_msgSend(MEMORY[0x1E0D1EF38], "pairWithFirst:second:", v29, v53);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v30);

        }
        v26 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
      }
      while (v26);
    }

    if (objc_msgSend(v25, "count"))
    {
      DALoggingwithCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v69 = 138412290;
        v70 = v25;
        _os_log_impl(&dword_1A4F90000, v31, OS_LOG_TYPE_INFO, "Adding flag change requests: %@", v69, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = 0;
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __66__MFDAMessageStore_replayFlagChange_forRemoteIDs_error_completed___block_invoke;
      v61[3] = &unk_1E4E8BE90;
      v63 = buf;
      v61[4] = self;
      v62 = v49;
      objc_msgSend(v25, "ef_enumerateObjectsInBatchesOfSize:block:", 100, v61);

    }
  }
  if (v44)
  {
    v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v33 = v47;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v58 != v35)
            objc_enumerationMutation(v33);
          v37 = -[DAMailboxDeleteMessageRequest initRequestWithMessageID:]([_MFDAMessageStoreDeleteRequest alloc], "initRequestWithMessageID:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j));
          objc_msgSend(MEMORY[0x1E0D1EF38], "pairWithFirst:second:", v37, v53);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v38);

        }
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
      }
      while (v34);
    }

    if (objc_msgSend(v32, "count"))
    {
      DALoggingwithCategory();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v69 = 138412290;
        v70 = v32;
        _os_log_impl(&dword_1A4F90000, v39, OS_LOG_TYPE_INFO, "Adding delete requests: %@", v69, 0xCu);
      }

      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __66__MFDAMessageStore_replayFlagChange_forRemoteIDs_error_completed___block_invoke_32;
      v54[3] = &unk_1E4E8BE90;
      v56 = buf;
      v54[4] = self;
      v55 = v49;
      objc_msgSend(v32, "ef_enumerateObjectsInBatchesOfSize:block:", 100, v54);

    }
  }
  if (!-[MFBufferedQueue isEmpty](v53, "isEmpty"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFDAMessageStore.m"), 541, CFSTR("update consumer queue should be empty at this point."));

  }
  p_super = &v53->super.super.super;
  error = v53->super.error;
  v18 = error == 0;
  if (a5 && error)
  {
    *a5 = objc_retainAutorelease(error);
    p_super = &v53->super.super.super;
  }
LABEL_53:

  if (a6)
    *a6 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);

  return v18;
}

void __66__MFDAMessageStore_replayFlagChange_forRemoteIDs_error_completed___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "addRequests:mailbox:combine:", v6, *(_QWORD *)(a1 + 40), 1);

  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) ^ 1;
}

void __66__MFDAMessageStore_replayFlagChange_forRemoteIDs_error_completed___block_invoke_32(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "addRequests:mailbox:combine:", v6, *(_QWORD *)(a1 + 40), 1);

  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) ^ 1;
}

- (BOOL)allowsAppend
{
  return 0;
}

- (id)messageForRemoteID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MFLibraryStore mailbox](self, "mailbox");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDAMessageStore messageForRemoteID:inMailbox:](self, "messageForRemoteID:inMailbox:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)messageForRemoteID:(id)a3 inMailbox:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[MFLibraryStore library](self, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageWithRemoteID:inRemoteMailbox:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setMessageStore:", self);
  return v10;
}

- (void)deleteMessagesOlderThanNumberOfDays:(int)a3 compact:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v12;
  const __CFString *v13;
  _QWORD v14[2];

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v14[1] = *MEMORY[0x1E0C80C00];
  -[MFLibraryStore mailbox](self, "mailbox");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFMailMessageLibrary messagesForMailbox:olderThanNumberOfDays:](self->super._library, "messagesForMailbox:olderThanNumberOfDays:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CFSTR("MessageIsDeleted");
  v14[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MFLibraryStore setFlagsFromDictionary:forMessages:](self, "setFlagsFromDictionary:forMessages:", v10, v9);

  v12.receiver = self;
  v12.super_class = (Class)MFDAMessageStore;
  -[MFLibraryStore deleteMessagesOlderThanNumberOfDays:compact:](&v12, sel_deleteMessagesOlderThanNumberOfDays_compact_, v5, v4);

}

- (BOOL)shouldDownloadBodyDataForMessage:(id)a3
{
  id v3;
  char v4;
  char v5;

  v3 = a3;
  if ((objc_msgSend(v3, "messageFlags") & 0x80) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isMessageContentsLocallyAvailable");
  v5 = v4 ^ 1;

  return v5;
}

- (BOOL)wantsLineEndingConversionForMIMEPart:(id)a3
{
  return 0;
}

- (id)loadMeetingExternalIDForMessage:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFDAMessageStore.m"), 596, CFSTR("should only have LibraryMessages in %s"), "-[MFDAMessageStore loadMeetingExternalIDForMessage:]");

  }
  -[MFMailMessageLibrary loadMeetingExternalIDForMessage:](self->super._library, "loadMeetingExternalIDForMessage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)loadMeetingDataForMessage:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFDAMessageStore.m"), 601, CFSTR("should only have LibraryMessages in %s"), "-[MFDAMessageStore loadMeetingDataForMessage:]");

  }
  -[MFMailMessageLibrary loadMeetingDataForMessage:](self->super._library, "loadMeetingDataForMessage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)loadMeetingMetadataForMessage:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFDAMessageStore.m"), 606, CFSTR("should only have LibraryMessages in %s"), "-[MFDAMessageStore loadMeetingMetadataForMessage:]");

  }
  -[MFMailMessageLibrary loadMeetingMetadataForMessage:](self->super._library, "loadMeetingMetadataForMessage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)bodyFetchRequiresNetworkActivity
{
  return 1;
}

- (id)fetchBodyDataForRemoteID:(id)a3
{
  id v4;
  NSObject *v5;
  MFDAMessageContentConsumer *v6;
  _MFDAMessageBodyFetchConsumer *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v14 = 138412290;
    v15 = v4;
    _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_INFO, "Fetching body data for remote id: %@", (uint8_t *)&v14, 0xCu);
  }

  v6 = objc_alloc_init(MFDAMessageContentConsumer);
  -[MFDAMessageContentConsumer setRequestedFormat:](v6, "setRequestedFormat:", 1);
  v7 = objc_alloc_init(_MFDAMessageBodyFetchConsumer);
  -[_MFDAMessageBodyFetchConsumer setStreamConsumer:](v7, "setStreamConsumer:", v6);
  v8 = -[DAMailboxFetchMessageRequest initRequestForBodyFormat:withMessageID:withBodySizeLimit:]([_MFDAMessageStoreFetchUsingRemoteIDRequest alloc], "initRequestForBodyFormat:withMessageID:withBodySizeLimit:", 1, v4, 0xFFFFFFFFLL);
  -[MFLibraryStore account](self, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore mailbox](self, "mailbox");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addRequest:consumer:mailbox:", v8, v7, v10);

  if (-[_MFDAMessageBodyFetchConsumer succeeded](v7, "succeeded"))
  {
    -[_MFDAMessageBodyFetchConsumer data](v7, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    DALoggingwithCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_impl(&dword_1A4F90000, v12, OS_LOG_TYPE_ERROR, "failed to download body for message \"%@\", (uint8_t *)&v14, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

- (id)_fetchBodyDataForSearchResult:(id)a3 folderID:(id)a4 format:(int)a5 streamConsumer:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  _MFDAMessageStoreSearchResultBodyConsumer *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double Current;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  NSObject *v31;
  const char *v32;
  void *v33;
  char *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  const char *v40;
  uint64_t v41;

  v7 = *(_QWORD *)&a5;
  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v35 = (char *)a4;
  v11 = a6;
  DALoggingwithCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v10, "ef_publicDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v38 = v13;
    v39 = 2112;
    v40 = v35;
    _os_log_impl(&dword_1A4F90000, v12, OS_LOG_TYPE_INFO, "Fetching body data for search result %@ in folder %@", buf, 0x16u);

  }
  objc_msgSend(v10, "remoteID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isSearchResultWithBogusRemoteId"))
  {
    v15 = objc_alloc(MEMORY[0x1E0D1C2B0]);
    v16 = 0;
    v17 = 0;
    v18 = v14;
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0D1C2B0]);
    v18 = 0;
    v16 = v35;
    v17 = v14;
  }
  v19 = (void *)objc_msgSend(v15, "initRequestForBodyFormat:withFolderID:withServerID:withLongID:withBodySizeLimit:", v7, v16, v17, v18, 0xFFFFFFFFLL);
  v20 = objc_alloc_init(_MFDAMessageStoreSearchResultBodyConsumer);
  -[_MFDAMessageStoreSearchResultBodyConsumer setStreamConsumer:](v20, "setStreamConsumer:", v11);
  -[MFLibraryStore account](self, "account");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "accountConduit");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "performFetchMessageSearchResultRequests:consumer:", v23, v20);

  Current = CFAbsoluteTimeGetCurrent();
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = Current + 60.0;
  while (1)
  {
    v28 = CFAbsoluteTimeGetCurrent();
    if (v28 >= v27)
      break;
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", 1.0);
    if (-[_MFDAMessageStoreSearchResultBodyConsumer waitUntilDoneBeforeDate:](v20, "waitUntilDoneBeforeDate:", v29))
    {

      +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
      v31 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "recordTransportType:", -[NSObject transportType](v31, "transportType"));
      goto LABEL_19;
    }
    if (objc_msgSend(v26, "shouldCancel"))
    {
      objc_msgSend(v22, "cancelTaskWithID:", v24);
      -[_MFDAMessageStoreSearchResultBodyConsumer waitUntilDone](v20, "waitUntilDone");

      break;
    }
    if (objc_msgSend(v11, "didBeginStreaming"))
    {
      objc_msgSend(v11, "timeOfLastActivity");
      v27 = v30 + 60.0;
    }

  }
  DALoggingwithCategory();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    v32 = "timed out";
    if (v28 < v27)
      v32 = "was cancelled";
    *(_DWORD *)buf = 138412546;
    v38 = v14;
    v39 = 2080;
    v40 = v32;
    _os_log_impl(&dword_1A4F90000, v31, OS_LOG_TYPE_INFO, "Search result body fetch for message %@ %s", buf, 0x16u);
  }
LABEL_19:

  objc_msgSend(v11, "data");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (id)_fetchBodyDataForNormalMessage:(id)a3 format:(int)a4 part:(id)a5 streamConsumer:(id)a6
{
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  _MFDAMessageStoreFetchRequest *v14;
  void *v15;
  id *v16;
  NSObject *v17;
  void *v18;
  _MFDAMessageBodyFetchConsumer *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v32;
  void *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v8 = *(_QWORD *)&a4;
  v36 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = [_MFDAMessageStoreFetchRequest alloc];
  objc_msgSend(v11, "remoteID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[DAMailboxFetchMessageRequest initRequestForBodyFormat:withMessageID:withBodySizeLimit:](v14, "initRequestForBodyFormat:withMessageID:withBodySizeLimit:", v8, v15, 0xFFFFFFFFLL);

  DALoggingwithCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v11, "ef_publicDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138412546;
    v33 = v18;
    v34 = 1024;
    v35 = v8;
    _os_log_impl(&dword_1A4F90000, v17, OS_LOG_TYPE_INFO, "Fetching body data for message %@. format: %d", (uint8_t *)&v32, 0x12u);

  }
  objc_storeStrong(v16 + 5, self);
  objc_storeStrong(v16 + 6, a3);
  objc_storeStrong(v16 + 7, a5);
  v19 = objc_alloc_init(_MFDAMessageBodyFetchConsumer);
  -[_MFDAMessageBodyFetchConsumer setStreamConsumer:](v19, "setStreamConsumer:", v13);
  objc_storeStrong(v16 + 4, v19);
  -[MFLibraryStore account](self, "account");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore mailbox](self, "mailbox");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addRequest:consumer:mailbox:", v16, v19, v21);

  if (-[_MFDAMessageBodyFetchConsumer succeeded](v19, "succeeded"))
  {
    DALoggingwithCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v11, "ef_publicDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138412546;
      v33 = v23;
      v34 = 1024;
      v35 = v8;
      _os_log_impl(&dword_1A4F90000, v22, OS_LOG_TYPE_INFO, "Successfully downloaded body for message: %@. format: %d", (uint8_t *)&v32, 0x12u);

    }
    -[_MFDAMessageBodyFetchConsumer data](v19, "data");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    DALoggingwithCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "remoteID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138412290;
      v33 = v26;
      _os_log_impl(&dword_1A4F90000, v25, OS_LOG_TYPE_ERROR, "Failed to download body for message \"%@\", (uint8_t *)&v32, 0xCu);

    }
    v24 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_MFDAMessageBodyFetchConsumer hasLocalCopyOfData](v19, "hasLocalCopyOfData"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "recordTransportType:", objc_msgSend(v29, "transportType"));

  objc_msgSend(MEMORY[0x1E0D1EF38], "pairWithFirst:second:", v24, v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)_fetchBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 downloadIfNecessary:(BOOL)a5 partial:(BOOL *)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  id v12;
  BOOL v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  MFDAMessageContentConsumer *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  _MFDALibraryConsumerFactory *v44;
  objc_super v45;
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v7 = a5;
  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recordTransportType:", 1);

  v45.receiver = self;
  v45.super_class = (Class)MFDAMessageStore;
  -[MFLibraryStore _fetchBodyDataForMessage:andHeaderDataIfReadilyAvailable:downloadIfNecessary:partial:](&v45, sel__fetchBodyDataForMessage_andHeaderDataIfReadilyAvailable_downloadIfNecessary_partial_, v10, a4, v7, a6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = 1;
  else
    v13 = !v7;
  if (!v13)
  {
    -[MFLibraryStore mailbox](self, "mailbox");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "folderID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v43)
    {
      v12 = 0;
LABEL_38:

      goto LABEL_39;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = v10;
    }
    else
    {
      MFLogGeneral();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v10;
        _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_DEFAULT, "#Warning DAMessageStore: this is not a MFLibraryMessage: %@", buf, 0xCu);
      }

      v40 = 0;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = v10;
    }
    else
    {
      MFLogGeneral();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v10;
        _os_log_impl(&dword_1A4F90000, v15, OS_LOG_TYPE_DEFAULT, "#Warning DAMessageStore: this is not a MFMailMessage: %@", buf, 0xCu);
      }

      v42 = 0;
    }
    -[MFLibraryStore library](self, "library");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dataConsumerForMessage:isPartial:", v40, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc_init(MFDAMessageContentConsumer);
    -[MFDAMessageContentConsumer setRequestedFormat:](v17, "setRequestedFormat:", 1);
    -[MFDAMessageContentConsumer setDataConsumer:](v17, "setDataConsumer:", v39);
    v44 = objc_alloc_init(_MFDALibraryConsumerFactory);
    -[MFLibraryStore library](self, "library");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MFDALibraryConsumerFactory setLibrary:](v44, "setLibrary:", v18);

    -[_MFDALibraryConsumerFactory setMessage:](v44, "setMessage:", v10);
    -[MFDAMessageContentConsumer setConsumerFactory:](v17, "setConsumerFactory:", v44);
    if ((objc_msgSend(v42, "messageFlags") & 0x80) != 0)
    {
      -[MFDAMessageStore _fetchBodyDataForSearchResult:folderID:format:streamConsumer:](self, "_fetchBodyDataForSearchResult:folderID:format:streamConsumer:", v42, v43, 1, v17);
      v22 = 0;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[MFDAMessageStore _fetchBodyDataForNormalMessage:format:part:streamConsumer:](self, "_fetchBodyDataForNormalMessage:format:part:streamConsumer:", v10, 1, 0, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "first");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "second");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "BOOLValue");

    }
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "recordTransportType:", objc_msgSend(v24, "transportType"));

    -[MFDAMessageContentConsumer message](v17, "message");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MFCreateExternalConversationID(v25);

    if (v26)
    {
      v27 = MFStringHashForMessageID();
      if (v20)
      {
LABEL_22:
        if ((v22 & 1) != 0)
        {
          v12 = v20;
        }
        else
        {
          v28 = objc_msgSend(v20, "mf_rangeOfRFC822HeaderData");
          v30 = v29;
          v38 = v28 + v29;
          if (v28 + v29 <= (unint64_t)objc_msgSend(v20, "length"))
          {
            objc_msgSend(v20, "mf_subdataWithRange:", v28, v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v31;
            if (a4)
            {
              v33 = objc_retainAutorelease(v31);
              *a4 = v33;
              v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D460C8]), "initWithHeaderData:encoding:", v33, 134217984);
              -[MFMailMessageLibrary updateThreadingInfoForMessage:fromHeaders:](self->super._library, "updateThreadingInfoForMessage:fromHeaders:", v40, v34);
              if (objc_msgSend(v41, "mailboxType") == 4 && v27)
                -[MFMailMessageLibrary updateAdditionalThreadingInfoForSentMessageWithHeaders:externalConversationID:](self->super._library, "updateAdditionalThreadingInfoForSentMessageWithHeaders:externalConversationID:", v34, v27);

            }
            objc_msgSend(v20, "mf_subdataWithRange:", v38, objc_msgSend(v20, "length") - v38);
            v12 = (id)objc_claimAutoreleasedReturnValue();
            -[MFMailMessageLibrary storeRemoteContentLinksFromHeaderData:bodyData:forMessage:](self->super._library, "storeRemoteContentLinksFromHeaderData:bodyData:forMessage:", v32, v12, v40);

          }
          else
          {
            v12 = 0;
          }
        }
        v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D460B8]), "initWithData:partial:incomplete:", v12, 0, 0);
        v36 = -[MFLibraryStore _cachedBodyDataContainerForMessage:valueIfNotPresent:](self, "_cachedBodyDataContainerForMessage:valueIfNotPresent:", v10, v35);
        if (a6)
          *a6 = 0;

        goto LABEL_37;
      }
    }
    else
    {
      v27 = 0;
      if (v20)
        goto LABEL_22;
    }
    v12 = 0;
LABEL_37:

    goto LABEL_38;
  }
LABEL_39:

  return v12;
}

- (id)_downloadHeadersForMessages:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  _MFDAMessageStoreFetchHeadersRequest *v9;
  void *v10;
  id *v11;
  _MFDAMessageHeaderFetchConsumer *v12;
  void *v13;
  void *v14;
  unint64_t j;
  id *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  MFLocalizedMessageHeaders *v23;
  id v25;
  void *v26;
  id v27;
  id obj;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  DALoggingwithCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_INFO, "Downloading headers for messages", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  -[MFLibraryStore mailbox](self, "mailbox");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v25;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v9 = [_MFDAMessageStoreFetchHeadersRequest alloc];
        objc_msgSend(v8, "remoteID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[DAMailboxFetchMessageRequest initRequestForBodyFormat:withMessageID:withBodySizeLimit:](v9, "initRequestForBodyFormat:withMessageID:withBodySizeLimit:", 0xFFFFFFFFLL, v10, 0xFFFFFFFFLL);

        objc_storeStrong(v11 + 5, self);
        objc_storeStrong(v11 + 6, v8);
        v12 = objc_alloc_init(_MFDAMessageHeaderFetchConsumer);
        -[_MFDAMessageHeaderFetchConsumer setStore:](v12, "setStore:", self);
        objc_msgSend(MEMORY[0x1E0D1EF38], "pairWithFirst:second:", v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", v13);
        objc_msgSend(v31, "addObject:", v11);
        objc_msgSend(v30, "addObject:", v12);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v5);
  }

  -[MFLibraryStore account](self, "account");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addRequests:mailbox:", v29, v26);

  for (j = 0; objc_msgSend(v31, "count") > j; ++j)
  {
    objc_msgSend(v31, "objectAtIndexedSubscript:", j);
    v16 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", j);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v16[6];
    objc_msgSend(v17, "error");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      MFLogGeneral();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v18, "remoteID");
        v21 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "error");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v37 = v21;
        v38 = 2112;
        v39 = v22;
        _os_log_impl(&dword_1A4F90000, v20, OS_LOG_TYPE_DEFAULT, "#Warning Error while fetching headers for message %@: %@", buf, 0x16u);

      }
    }
    else
    {
      objc_msgSend(v17, "data");
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v23 = -[MFMessageHeaders initWithHeaderData:encoding:]([MFLocalizedMessageHeaders alloc], "initWithHeaderData:encoding:", v20, objc_msgSend(v18, "preferredEncoding"));
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v23, v18);

      }
    }

  }
  return v27;
}

- (BOOL)_fetchDataForMimePart:(id)a3 range:(_NSRange)a4 isComplete:(BOOL *)a5 consumer:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  MFDAMessageContentConsumer *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  char v22;
  void *v23;
  _MFDAMessageFetchAttachmentConsumer *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  BOOL v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  uint8_t buf[4];
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v64 = a6;
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "partNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("2"));

  if ((v12 & 1) != 0)
  {
    v13 = 1;
  }
  else
  {
    objc_msgSend(v9, "partNumber");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v14, "isEqual:", CFSTR("1.1"));

  }
  -[MFLibraryStore mailbox](self, "mailbox");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "folderID");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v62)
  {
    v22 = 1;
    goto LABEL_34;
  }
  -[MFLibraryStore library](self, "library");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("-[MFDAMessageStore _fetchDataForMimePart:range:isComplete:consumer:]", "MFDAMessageStore.m", 972, "[[self library] isKindOfClass:[MFMailMessageLibrary class]]");

  objc_msgSend(v9, "mimeBody");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "message");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = v10;
  if (v13)
  {
    v17 = objc_alloc_init(MFDAMessageContentConsumer);
    -[MFDAMessageContentConsumer setRequestedFormat:](v17, "setRequestedFormat:", v12);
    if ((objc_msgSend(v63, "messageFlags") & 0x80) != 0)
    {
      -[MFDAMessageStore _fetchBodyDataForSearchResult:folderID:format:streamConsumer:](self, "_fetchBodyDataForSearchResult:folderID:format:streamConsumer:", v63, v62, v12, v17);
      v21 = 0;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[MFDAMessageStore _fetchBodyDataForNormalMessage:format:part:streamConsumer:](self, "_fetchBodyDataForNormalMessage:format:part:streamConsumer:", v63, v12, v9, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "first");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "second");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "BOOLValue");

    }
    objc_msgSend(v64, "appendData:", v19);
    if (((v12 ^ 1 | v21) & 1) == 0)
    {
      v31 = objc_msgSend(v19, "mf_rangeOfRFC822HeaderData");
      v33 = v32;
      v34 = v31 + v32;
      if (v31 + v32 <= (unint64_t)objc_msgSend(v19, "length"))
      {
        objc_msgSend(v19, "mf_subdataWithRange:", v31, v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D460C8]), "initWithHeaderData:encoding:", v35, 134217984);
        -[MFMailMessageLibrary updateThreadingInfoForMessage:fromHeaders:](self->super._library, "updateThreadingInfoForMessage:fromHeaders:", v63, v36);
        objc_msgSend(v19, "mf_subdataWithRange:", v34, objc_msgSend(v19, "length") - v34);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFLibraryStore library](self, "library");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "storeRemoteContentLinksFromHeaderData:bodyData:forMessage:", v35, v37, v63);

      }
    }

    v22 = 1;
  }
  else
  {
    objc_msgSend(v9, "contentID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      MFLogGeneral();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v66 = v9;
        _os_log_impl(&dword_1A4F90000, v39, OS_LOG_TYPE_DEFAULT, "#Warning don't know how to fetch data for mime part %@", buf, 0xCu);
      }

      v22 = 1;
      goto LABEL_33;
    }
    v24 = -[_MFDAMessageFetchAttachmentConsumer initWithActivityMonitor:]([_MFDAMessageFetchAttachmentConsumer alloc], "initWithActivityMonitor:", v10);
    objc_msgSend(v9, "range");
    -[_MFDAMessageFetchAttachmentConsumer setExpectedLength:](v24, "setExpectedLength:", v25);
    v26 = objc_alloc(MEMORY[0x1E0D1C2B8]);
    objc_msgSend(v9, "contentID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "messageID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v26, "initWithAttachmentName:andMessageServerID:", v27, v28);

    objc_msgSend(v9, "contentTransferEncoding");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = v64;
      v59 = 0;
    }
    else
    {
      v59 = objc_alloc_init(MEMORY[0x1E0D46068]);
      v40 = -[_MFDAMessageFetchAttachmentConsumer expectedLength](v24, "expectedLength");
      v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46120]), "initWithConsumer:expectedSize:", v59, v40);
      objc_msgSend(v64, "progressBlock");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setProgressBlock:", v41);

      objc_msgSend(v64, "setProgressBlock:", 0);
      v30 = v57;
    }
    -[_MFDAMessageFetchAttachmentConsumer setProgressFilter:](v24, "setProgressFilter:", v30, v55);
    v58 = v30;
    -[MFLibraryStore account](self, "account");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "accountConduit");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "performFetchAttachmentRequest:consumer:", v56, v24);

    while (1)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1.0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = -[MFDAMailAccountConsumer waitUntilDoneBeforeDate:](v24, "waitUntilDoneBeforeDate:", v45);

      if (v46)
        break;
      +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "shouldCancel");

      if (v48)
      {
        -[MailAccount accountConduit](self->super._account, "accountConduit");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "cancelTaskWithID:", v44);

        -[MFDAMailAccountConsumer waitUntilDone](v24, "waitUntilDone");
        break;
      }
    }
    v22 = -[_MFDAMessageFetchAttachmentConsumer fetchSucceeded](v24, "fetchSucceeded");
    if (!v29)
    {
      objc_msgSend(v58, "done");
      if (-[_MFDAMessageFetchAttachmentConsumer dataWasBase64](v24, "dataWasBase64"))
      {
        v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46048]), "initWithConsumer:", v64);
        objc_msgSend(v59, "data");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "appendData:", v51);

        objc_msgSend(v50, "done");
      }
      else
      {
        objc_msgSend(v59, "data");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "appendData:", v50);
      }

    }
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "recordTransportType:", objc_msgSend(v53, "transportType"));

  }
  v10 = v60;
LABEL_33:

LABEL_34:
  if (a5)
    *a5 = v22;

  return v22;
}

- (id)defaultAlternativeForPart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v4 = a3;
  -[MFDAMessageStore decryptedTopLevelPartForPart:](self, "decryptedTopLevelPartForPart:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", CFSTR("multipart"));

  if ((_DWORD)v4)
  {
    v7 = (void *)MEMORY[0x1A85B0E24]();
    v12.receiver = self;
    v12.super_class = (Class)MFDAMessageStore;
    -[MFDAMessageStore defaultAlternativeForPart:](&v12, sel_defaultAlternativeForPart_, v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copyBodyDataToOffset:resultOffset:downloadIfNecessary:", 1, 0, 0);
    if (!v9)
    {
      objc_msgSend(v5, "alternativeAtIndex:", 0);
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v10;
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (id)bestAlternativeForPart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MFDAMessageStore;
  -[MFDAMessageStore bestAlternativeForPart:](&v13, sel_bestAlternativeForPart_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "partNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("2")))
  {
    v7 = objc_msgSend(v5, "isGenerated");

    if (v7)
    {
      v8 = (void *)MEMORY[0x1A85B0E24]();
      v9 = (void *)objc_msgSend(v5, "copyBodyDataToOffset:resultOffset:downloadIfNecessary:", 1, 0, 0);
      v10 = v9;
      if (v9 && !objc_msgSend(v9, "length"))
      {
        objc_msgSend(v4, "alternativeAtIndex:", 0);
        v11 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v11;
      }

      objc_autoreleasePoolPop(v8);
    }
  }
  else
  {

  }
  return v5;
}

- (BOOL)canFetchSearchResults
{
  void *v2;
  int v3;
  NSObject *v4;
  const __CFString *v5;
  _DWORD v7[2];
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[MFLibraryStore account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsServerSearch");

  MFLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("No");
    if (v3 != 2)
      v5 = CFSTR("Yes");
    v7[0] = 67240450;
    v7[1] = v3;
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_INFO, "Account search capability: %{public}u. canFetchSearchResults: %{public}@", (uint8_t *)v7, 0x12u);
  }

  return v3 != 2;
}

- (BOOL)hasMoreFetchableMessages
{
  return 0;
}

- (unint64_t)fetchWindow
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)shouldGrowFetchWindow
{
  return 0;
}

- (unint64_t)growFetchWindow
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)messageCanBeTriaged:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "isSearchResultWithBogusRemoteId") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (id)storeData:(id)a3 forMimePart:(id)a4 isComplete:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  id v13;
  void *v14;
  objc_super v16;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "partNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("2")))
  {

    goto LABEL_7;
  }
  v11 = objc_msgSend(v9, "isHTML");

  if (!v11)
  {
LABEL_7:
    v16.receiver = self;
    v16.super_class = (Class)MFDAMessageStore;
    -[MFLibraryStore storeData:forMimePart:isComplete:](&v16, sel_storeData_forMimePart_isComplete_, v8, v9, v5);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  MFPersistenceLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    -[MFDAMessageStore storeData:forMimePart:isComplete:].cold.1(v12);

  v13 = v8;
LABEL_8:
  v14 = v13;

  return v14;
}

- (BOOL)backedByVirtualAllSearchMailbox
{
  return self->_backedByVirtualAllSearchMailbox;
}

- (void)setBackedByVirtualAllSearchMailbox:(BOOL)a3
{
  self->_backedByVirtualAllSearchMailbox = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DAFolder, 0);
}

- (void)_remoteIDsMatchingSearchText:(uint64_t)a1 predicate:(NSObject *)a2 limit:offset:filterByDate:handler:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A4F90000, a2, OS_LOG_TYPE_ERROR, "Invalid search returned for predicate: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_remoteIDsMatchingSearchText:(os_log_t)log predicate:limit:offset:filterByDate:handler:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "Received a protocol mismatch error when peforming search", v1, 2u);
}

- (void)storeData:(os_log_t)log forMimePart:isComplete:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A4F90000, log, OS_LOG_TYPE_FAULT, "Attempting to store text/html data as message part 2", v1, 2u);
}

@end
