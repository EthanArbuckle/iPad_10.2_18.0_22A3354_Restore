@implementation FCFeedPrewarmResult

- (FCFeedPrewarmResult)initWithSuccessfulRequests:(id)a3 failedRequests:(id)a4
{
  id v6;
  id v7;
  FCFeedPrewarmResult *v8;
  uint64_t v9;
  NSArray *successfulRequests;
  uint64_t v11;
  NSArray *failedRequests;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCFeedPrewarmResult;
  v8 = -[FCFeedPrewarmResult init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    successfulRequests = v8->_successfulRequests;
    v8->_successfulRequests = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    failedRequests = v8->_failedRequests;
    v8->_failedRequests = (NSArray *)v11;

  }
  return v8;
}

- (NSSet)feedIDs
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__FCFeedPrewarmResult_feedIDs__block_invoke;
  v3[3] = &unk_1E463AE18;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0C99E60], "fc_set:", v3);
  return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
}

void __30__FCFeedPrewarmResult_feedIDs__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "successfulRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v8), "feedID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "failedRequests", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14), "feedID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

}

- (NSArray)successfulRequests
{
  return self->_successfulRequests;
}

- (NSArray)failedRequests
{
  return self->_failedRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedRequests, 0);
  objc_storeStrong((id *)&self->_successfulRequests, 0);
}

@end
