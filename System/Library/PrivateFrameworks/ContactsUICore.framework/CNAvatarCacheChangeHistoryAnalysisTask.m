@implementation CNAvatarCacheChangeHistoryAnalysisTask

- (CNAvatarCacheChangeHistoryAnalysisTask)initWithContactStore:(id)a3 startingToken:(id)a4
{
  id v7;
  id v8;
  CNAvatarCacheChangeHistoryAnalysisTask *v9;
  CNAvatarCacheChangeHistoryAnalysisTask *v10;
  CNAvatarCacheChangeHistoryAnalysisTask *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNAvatarCacheChangeHistoryAnalysisTask;
  v9 = -[CNTask initWithName:](&v13, sel_initWithName_, CFSTR("com.apple.contacts.ui.avatar-cache.change-history-analysis"));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    objc_storeStrong((id *)&v10->_startingToken, a4);
    v11 = v10;
  }

  return v10;
}

- (id)run:(id *)a3
{
  void *v5;
  char v6;
  CNAvatarCacheChangeAnalysis *v7;
  void *v8;
  void *v9;
  CNAvatarCacheChangeAnalysis *v10;
  void *v11;

  -[CNAvatarCacheChangeHistoryAnalysisTask makeRequest](self, "makeRequest");
  -[CNAvatarCacheChangeHistoryAnalysisTask executeRequest](self, "executeRequest");
  -[CNAvatarCacheChangeHistoryAnalysisTask enumerator](self, "enumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSuccess");

  if ((v6 & 1) != 0)
  {
    -[CNAvatarCacheChangeHistoryAnalysisTask extractIdentifiers](self, "extractIdentifiers");
    v7 = [CNAvatarCacheChangeAnalysis alloc];
    -[CNAvatarCacheChangeHistoryAnalysisTask finalToken](self, "finalToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCacheChangeHistoryAnalysisTask identifiers](self, "identifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CNAvatarCacheChangeAnalysis initWithCurrentChangeHistoryToken:identifiersOfAffectedContacts:](v7, "initWithCurrentChangeHistoryToken:identifiersOfAffectedContacts:", v8, v9);
  }
  else
  {
    -[CNAvatarCacheChangeHistoryAnalysisTask enumerator](self, "enumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;
    v10 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v11);
  }

  return v10;
}

- (void)makeRequest
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0C971E8]);
  -[CNAvatarCacheChangeHistoryAnalysisTask startingToken](self, "startingToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStartingToken:", v3);

  objc_msgSend(v4, "setIncludeGroupChanges:", 0);
  -[CNAvatarCacheChangeHistoryAnalysisTask setRequest:](self, "setRequest:", v4);

}

- (void)executeRequest
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DD140000, a2, OS_LOG_TYPE_ERROR, "Error fetching changes: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)extractIdentifiers
{
  void *v3;
  CNAvatarCacheFingerprintCollector *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CNAvatarCacheChangeHistoryAnalysisTask enumerator](self, "enumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isSuccess"))
  {
    v4 = objc_alloc_init(CNAvatarCacheFingerprintCollector);
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v3, "value", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "acceptEventVisitor:", v4);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

    -[CNAvatarCacheFingerprintCollector fingerprintsOfAffectedContacts](v4, "fingerprintsOfAffectedContacts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCacheChangeHistoryAnalysisTask setIdentifiers:](self, "setIdentifiers:", v10);

  }
}

- (CNContactStore)store
{
  return self->_store;
}

- (NSData)startingToken
{
  return self->_startingToken;
}

- (CNChangeHistoryFetchRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (CNResult)enumerator
{
  return self->_enumerator;
}

- (void)setEnumerator:(id)a3
{
  objc_storeStrong((id *)&self->_enumerator, a3);
}

- (NSData)finalToken
{
  return self->_finalToken;
}

- (void)setFinalToken:(id)a3
{
  objc_storeStrong((id *)&self->_finalToken, a3);
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_identifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_finalToken, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_startingToken, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
