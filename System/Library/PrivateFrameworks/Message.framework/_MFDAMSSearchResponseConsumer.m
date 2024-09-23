@implementation _MFDAMSSearchResponseConsumer

- (_MFDAMSSearchResponseConsumer)initWithMaximumSize:(unsigned int)a3 latency:(double)a4
{
  _MFDAMSSearchResponseConsumer *v4;
  uint64_t v5;
  MFConditionLock *doneCondition;
  MFRemoteSearchResults *v7;
  MFRemoteSearchResults *searchResult;
  uint64_t v9;
  NSDate *earliestDateAdded;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_MFDAMSSearchResponseConsumer;
  v4 = -[_MFDAMSBasicConsumer initWithMaximumSize:latency:](&v12, sel_initWithMaximumSize_latency_, *(_QWORD *)&a3, a4);
  if (v4)
  {
    v4->timeReceivedLastResponse = CFAbsoluteTimeGetCurrent();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D46070]), "initWithName:condition:andDelegate:", CFSTR("done"), 0, v4);
    doneCondition = v4->doneCondition;
    v4->doneCondition = (MFConditionLock *)v5;

    v7 = objc_alloc_init(MFRemoteSearchResults);
    searchResult = v4->searchResult;
    v4->searchResult = v7;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v9 = objc_claimAutoreleasedReturnValue();
    earliestDateAdded = v4->earliestDateAdded;
    v4->earliestDateAdded = (NSDate *)v9;

  }
  return v4;
}

- (BOOL)waitUntilDoneBeforeDate:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = -[MFConditionLock lockWhenCondition:beforeDate:](self->doneCondition, "lockWhenCondition:beforeDate:", 1, v4);
  if (v5)
    -[MFConditionLock unlock](self->doneCondition, "unlock");

  return v5;
}

- (void)waitUntilDone
{
  -[MFConditionLock lockWhenCondition:](self->doneCondition, "lockWhenCondition:", 1);
  -[MFConditionLock unlock](self->doneCondition, "unlock");
}

- (void)resetDoneCondition
{
  -[MFConditionLock lock](self->doneCondition, "lock");
  -[MFConditionLock unlockWithCondition:](self->doneCondition, "unlockWithCondition:", 0);
}

- (BOOL)handleItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  MFMailMessageLibrary *library;
  _QWORD v13[5];

  v4 = a3;
  -[_MFDAMSBasicConsumer error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5
    || ((objc_msgSend(v5, "domain"),
         v7 = (void *)objc_claimAutoreleasedReturnValue(),
         v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D1C3B8]),
         v7,
         objc_msgSend(v6, "code") == 78)
      ? (v9 = v8)
      : (v9 = 0),
        (v9 & 1) != 0))
  {
    if (!-[MFActivityMonitor shouldCancel](self->super.monitor, "shouldCancel"))
    {
      if (-[MFDAMessageStore backedByVirtualAllSearchMailbox](self->super.store, "backedByVirtualAllSearchMailbox"))
      {
        objc_msgSend(v4, "ef_groupBy:", &__block_literal_global_28);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __45___MFDAMSSearchResponseConsumer_handleItems___block_invoke_2;
        v13[3] = &unk_1E4E8BED8;
        v13[4] = self;
        objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v13);
      }
      else
      {
        library = self->super.library;
        -[MFLibraryStore account](self->super.store, "account");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        self->super.numNewMessages += insertDAMessages(v4, library, v10, self->super.mailbox, 1, 0);
      }

    }
  }

  return 1;
}

- (void)searchQuery:(id)a3 returnedResults:(id)a4
{
  uint64_t v5;
  __int128 v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  MFDAMailbox *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  _BOOL4 v20;
  MFDAMessage *v21;
  NSDate *earliestDateAdded;
  NSDate *v23;
  NSDate *v24;
  uint64_t v25;
  NSDate *v26;
  NSDate *v27;
  void *v28;
  BOOL v29;
  NSDate *v30;
  _MFDAMSSearchResponseConsumer *v31;
  __int128 v32;
  id v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  _MFDAMSSearchResponseConsumer *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v33 = a4;
  self->timeReceivedLastResponse = CFAbsoluteTimeGetCurrent();
  if (!-[MFActivityMonitor shouldCancel](self->super.monitor, "shouldCancel"))
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v33;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    v37 = self;
    if (v5)
    {
      v35 = *(_QWORD *)v39;
      *(_QWORD *)&v6 = 138412290;
      v32 = v6;
      do
      {
        v36 = v5;
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v39 != v35)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v8, "date", v32);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (!self->latestDateToAdd
            || (objc_msgSend(v9, "earlierDate:"),
                v11 = (void *)objc_claimAutoreleasedReturnValue(),
                v12 = v10 == v11,
                v11,
                self = v37,
                v12))
          {
            objc_msgSend(v8, "longID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v13)
            {
              objc_msgSend(v8, "serverID");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v14 = self->super.mailbox;
            if (-[MFDAMessageStore backedByVirtualAllSearchMailbox](self->super.store, "backedByVirtualAllSearchMailbox"))
            {
              -[MFMailboxUid account](self->super.mailbox, "account");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "folderID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "mailboxForFolderID:", v16);
              v17 = objc_claimAutoreleasedReturnValue();

              v14 = (MFDAMailbox *)v17;
              if (!v17)
              {
                MFLogGeneral();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v32;
                  v43 = v16;
                  _os_log_error_impl(&dword_1A4F90000, v18, OS_LOG_TYPE_ERROR, "DAMessageStore - allMailboxes searchQuery returned result with invalid folderID: %@", buf, 0xCu);
                }

                v14 = v37->super.mailbox;
              }

              self = v37;
            }
            if (v13 && v14)
              -[MFRemoteSearchResults addRemoteID:mailbox:](self->searchResult, "addRemoteID:mailbox:", v13, v14);
            -[MFDAMessageStore messageForRemoteID:inMailbox:](self->super.store, "messageForRemoteID:inMailbox:", v13, v14);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19 == 0;

            if (v20)
            {
              v21 = -[MFDAMessage initWithDAMailMessage:mailbox:]([MFDAMessage alloc], "initWithDAMailMessage:mailbox:", v8, v14);
              -[MFBufferedQueue addItem:](v37, "addItem:", v21);
              earliestDateAdded = v37->earliestDateAdded;
              -[MFDAMessage dateReceived](v21, "dateReceived");
              v23 = (NSDate *)objc_claimAutoreleasedReturnValue();
              v24 = v23;
              if (!v23)
                v24 = v37->earliestDateAdded;
              -[NSDate earlierDate:](earliestDateAdded, "earlierDate:", v24);
              v25 = objc_claimAutoreleasedReturnValue();
              v26 = v37->earliestDateAdded;
              v37->earliestDateAdded = (NSDate *)v25;

            }
          }

          self = v37;
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v5);
    }

    v27 = v37->earliestDateAdded;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[NSDate isEqualToDate:](v27, "isEqualToDate:", v28);

    if (v29)
    {
      v30 = 0;
      v31 = v37;
    }
    else
    {
      v31 = v37;
      v30 = v37->earliestDateAdded;
    }
    -[MFRemoteSearchResults setContinueOffset:](v31->searchResult, "setContinueOffset:", v30);
  }

}

- (void)searchQuery:(id)a3 finishedWithError:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:userInfo:](MFError, "errorWithDomain:code:userInfo:", v8, objc_msgSend(v7, "code"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MFDAMSBasicConsumer setError:](self, "setError:", v9);

  }
  -[MFBufferedQueue flush](self, "flush");
  -[MFConditionLock lock](self->doneCondition, "lock");
  -[MFConditionLock unlockWithCondition:](self->doneCondition, "unlockWithCondition:", 1);

}

- (void)searchQuery:(id)a3 returnedTotalCount:(id)a4
{
  self->totalCount = objc_msgSend(a4, "unsignedIntValue", a3);
}

- (NSDate)latestDateToAdd
{
  return self->latestDateToAdd;
}

- (void)setLatestDateToAdd:(id)a3
{
  objc_storeStrong((id *)&self->latestDateToAdd, a3);
}

- (MFRemoteSearchResults)searchResult
{
  return self->searchResult;
}

- (NSDate)earliestDateAdded
{
  return self->earliestDateAdded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->searchResult, 0);
  objc_storeStrong((id *)&self->doneCondition, 0);
  objc_storeStrong((id *)&self->earliestDateAdded, 0);
  objc_storeStrong((id *)&self->latestDateToAdd, 0);
}

@end
