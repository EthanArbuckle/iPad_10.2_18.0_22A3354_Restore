@implementation MFFetchResponseQueue

- (MFFetchResponseQueue)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFFetchResponseQueue;
  return -[MFBufferedQueue initWithMaximumSize:latency:](&v3, sel_initWithMaximumSize_latency_, 256, 1.0);
}

- (BOOL)shouldAddUID:(unint64_t)a3
{
  return 1;
}

- (id)insertMessages:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[MFLibraryStore library](self->_store, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageChangeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFLibraryStore mailbox](self->_store, "mailbox");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reflectNewMessages:mailboxURL:", v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)handleItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  unsigned int v16;
  double v17;
  uint64_t v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MFFetchResponseQueue insertMessages:](self, "insertMessages:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "gotNewMessagesState"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -259200.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    v9 = v8;

    v10 = objc_msgSend(v6, "gotNewMessagesState");
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v5;
    v20 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v16 = objc_msgSend(v15, "messageFlags");
          if ((v16 & 1) == 0)
          {
            objc_msgSend(v15, "dateReceivedAsTimeIntervalSince1970");
            if (v17 > v9)
            {
              if ((objc_msgSend(v15, "conversationFlags") & 1) != 0)
              {
                v10 = 3;
                goto LABEL_16;
              }
              if (((v10 < 2) & HIBYTE(v16)) != 0)
                v10 = 2;
            }
          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_16:

    v5 = v20;
    objc_msgSend(v6, "setGotNewMessagesState:", v10);
  }
  v18 = objc_msgSend(v5, "count");
  LOBYTE(v18) = objc_msgSend(v4, "count") == v18;

  return v18;
}

- (BOOL)addItem:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  int v18;
  MFIMAPMessageWithCache *v19;
  unint64_t highestModSequence;
  BOOL v21;
  NSObject *v22;
  void *v23;
  unint64_t newMessageCount;
  unint64_t numNewUIDs;
  BOOL v26;
  MFIMAPMessageWithCache *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  MFLibraryIMAPStore *v34;
  id v35;
  MFIMAPMessageWithCache *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v51;
  void *context;
  MFFetchResponseQueue *v53;
  id v54;
  unint64_t v55;
  uint64_t v56;
  int v57;
  void *v58;
  char v59;
  MFIMAPMessageWithCache *v60;
  _BOOL4 v61;
  void *v62;
  void *v63;
  void *v64;
  id obj;
  objc_super v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  void *v71;
  uint8_t buf[16];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  if (objc_msgSend(v54, "responseType") == 17)
  {
    v53 = self;
    context = (void *)MEMORY[0x1A85B0E24]();
    objc_msgSend(v54, "fetchResults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = -[MFIMAPConnection _isFetchResponseValid:](self->_connection, "_isFetchResponseValid:", v54);
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
    if (v5)
    {
      v51 = v4;
      v59 = 0;
      v63 = 0;
      v64 = 0;
      v55 = 0;
      v56 = 0;
      v57 = 0;
      v6 = 0;
      v7 = 0;
      v8 = 0;
      v9 = *(_QWORD *)v68;
      v10 = 0xFFFFFFFFLL;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v68 != v9)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          switch(objc_msgSend(v12, "type", v51))
          {
            case 2:
              objc_msgSend(v12, "internalDate");
              v16 = objc_claimAutoreleasedReturnValue();
              v15 = v64;
              v64 = (void *)v16;
              goto LABEL_15;
            case 3:
              v8 = objc_msgSend(v12, "messageSize");
              break;
            case 4:
            case 7:
              if (v61)
              {
                objc_msgSend(v12, "fetchData");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = (void *)objc_msgSend(v13, "mutableCopy");

                objc_msgSend(v14, "mf_convertNetworkLineEndingsToUnix");
                objc_msgSend(v14, "mf_makeImmutable");
                v15 = v63;
                v63 = v14;
LABEL_15:

              }
              break;
            case 8:
              v6 = objc_msgSend(v12, "uid");
              v57 = 1;
              break;
            case 9:
              v7 = objc_msgSend(v12, "uniqueRemoteId");
              break;
            case 10:
              v56 = objc_msgSend(v12, "messageFlags");
              v10 = objc_msgSend(v12, "encoding");
              v59 = 1;
              break;
            case 11:
              v55 = objc_msgSend(v12, "modSequenceNumber");
              break;
            default:
              continue;
          }
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
      }
      while (v5);

      if ((v59 & 1) == 0)
        goto LABEL_38;
      v17 = v57 ^ 1;
      v18 = !v61;
      if (objc_msgSend(v63, "length")
        && (v17 & 1) == 0
        && (v18 & 1) == 0
        && -[MFFetchResponseQueue shouldAddUID:](v53, "shouldAddUID:", v6))
      {
        v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D460C8]), "initWithHeaderData:encoding:", v63, v10);
        v19 = -[MFIMAPMessage initWithFlags:size:uid:]([MFIMAPMessageWithCache alloc], "initWithFlags:size:uid:", v56, v8, v6);
        v60 = v19;
        objc_msgSend(v64, "timeIntervalSince1970");
        -[MFIMAPMessageWithCache setDateReceivedAsTimeIntervalSince1970:](v19, "setDateReceivedAsTimeIntervalSince1970:");
        if ((_DWORD)v10 != -1)
          -[MFIMAPMessage setPreferredEncoding:](v19, "setPreferredEncoding:", v10);
        -[MFIMAPMessage setUniqueRemoteId:](v19, "setUniqueRemoteId:", v7);
        -[MFMailMessage loadCachedHeaderValuesFromHeaders:](v19, "loadCachedHeaderValuesFromHeaders:", v62);
        -[MFIMAPMessageWithCache setHeaders:](v19, "setHeaders:", v62);
        -[MFIMAPMessageWithCache setMessageStore:](v19, "setMessageStore:", v53->_store);
        if (v53->_highestModSequence <= v55)
          highestModSequence = v55;
        else
          highestModSequence = v53->_highestModSequence;
        -[MFMailMessage setModSequenceNumber:](v19, "setModSequenceNumber:", highestModSequence);
        v66.receiver = v53;
        v66.super_class = (Class)MFFetchResponseQueue;
        v21 = -[MFBufferedQueue addItem:](&v66, sel_addItem_, v19);
        MFLogGeneral();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          -[MFIMAPMessageWithCache subject](v60, "subject");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v23;
          _os_log_impl(&dword_1A4F90000, v22, OS_LOG_TYPE_INFO, "#Power [New Message] subject=%@;", buf, 0xCu);

        }
        newMessageCount = v53->_newMessageCount;
        v53->_newMessageCount = newMessageCount + 1;
        numNewUIDs = v53->_numNewUIDs;
        if (newMessageCount + 1 <= numNewUIDs)
        {
          +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setCurrentCount:", v53->_newMessageCount);
          if ((v56 & 1) == 0)
            objc_msgSend(v28, "setGotNewMessagesState:", 1);
        }
        else
        {
          v26 = newMessageCount == numNewUIDs;
          v27 = v60;
          if (!v26)
            goto LABEL_50;
          +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "reset");
        }
        goto LABEL_48;
      }
      if (((v17 | v18) & 1) != 0)
      {
LABEL_38:
        v21 = 1;
LABEL_52:

        objc_autoreleasePoolPop(context);
        goto LABEL_53;
      }
      -[MFLibraryIMAPStore serverMessagePersistence](v53->_store, "serverMessagePersistence");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", v6);
      objc_msgSend(v30, "serverMessagesForIMAPUIDs:limit:returnLastEntries:", v31, *MEMORY[0x1E0D1E990], 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        MFFlagsObjectForFlags(v56);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v53->_store;
        v35 = v29;
        v36 = v33;
        v37 = (void *)MEMORY[0x1E0D1E778];
        v60 = v36;
        v62 = v35;
        objc_msgSend(v35, "serverFlags");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "changeFrom:to:", v38, v36);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v39, "hasChanges"))
        {
          -[MFLibraryStore library](v34, "library");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "persistence");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "messageChangeManager");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "remoteID");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = v42;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFLibraryStore mailbox](v34, "mailbox");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "URL");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "reflectFlagChanges:forMessagesWithRemoteIDs:mailboxURL:", v39, v43, v45);

        }
        if (v53->_isSearching)
        {
          v21 = 1;
LABEL_49:
          v27 = v60;
LABEL_50:

          v29 = v62;
          goto LABEL_51;
        }
        -[MFLibraryStore library](v53->_store, "library");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v62, "messagePersistentID");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "numberWithLongLong:", objc_msgSend(v47, "longLongValue"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v48;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "clearServerSearchFlagsForMessagesWithLibraryIDs:", v49);

        v21 = 1;
LABEL_48:

        goto LABEL_49;
      }
      v21 = 1;
    }
    else
    {
      v63 = 0;
      v64 = 0;
      v21 = 1;
      v29 = obj;
    }
LABEL_51:

    goto LABEL_52;
  }
  v21 = 1;
LABEL_53:

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
