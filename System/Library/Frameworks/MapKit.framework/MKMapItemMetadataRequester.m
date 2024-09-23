@implementation MKMapItemMetadataRequester

+ (id)sharedInstance
{
  if (qword_1EDFB7AC0 != -1)
    dispatch_once(&qword_1EDFB7AC0, &__block_literal_global_32);
  return (id)_MergedGlobals_1_3;
}

void __44__MKMapItemMetadataRequester_sharedInstance__block_invoke()
{
  MKMapItemMetadataRequester *v0;
  void *v1;

  v0 = objc_alloc_init(MKMapItemMetadataRequester);
  v1 = (void *)_MergedGlobals_1_3;
  _MergedGlobals_1_3 = (uint64_t)v0;

}

- (MKMapItemMetadataRequester)init
{
  MKMapItemMetadataRequester *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSURLSession *session;
  uint64_t v8;
  NSMapTable *tasksForURLs;
  uint64_t v10;
  NSMapTable *requestsForURLs;
  uint64_t v12;
  NSMapTable *dataForTasks;
  MKMapItemMetadataRequester *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MKMapItemMetadataRequester;
  v2 = -[MKMapItemMetadataRequester init](&v16, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB39F0];
    objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sessionWithConfiguration:delegate:delegateQueue:", v4, v2, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    session = v2->_session;
    v2->_session = (NSURLSession *)v6;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    tasksForURLs = v2->_tasksForURLs;
    v2->_tasksForURLs = (NSMapTable *)v8;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    requestsForURLs = v2->_requestsForURLs;
    v2->_requestsForURLs = (NSMapTable *)v10;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v12 = objc_claimAutoreleasedReturnValue();
    dataForTasks = v2->_dataForTasks;
    v2->_dataForTasks = (NSMapTable *)v12;

    v14 = v2;
  }

  return v2;
}

- (void)dealloc
{
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_requestsForURLs;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        -[NSMapTable objectForKey:](self->_tasksForURLs, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "cancel");

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)MKMapItemMetadataRequester;
  -[MKMapItemMetadataRequester dealloc](&v9, sel_dealloc);
}

- (void)sendRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSMapTable *requestsForURLs;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  MKMapItemMetadataRequester *v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_requestsForURLs, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  requestsForURLs = self->_requestsForURLs;
  if (v6)
  {
    objc_msgSend(v6, "arrayByAddingObject:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](requestsForURLs, "setObject:forKey:", v9, v5);

  }
  else
  {
    v16[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](requestsForURLs, "setObject:forKey:", v10, v5);

    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__MKMapItemMetadataRequester_sendRequest___block_invoke;
    block[3] = &unk_1E20D7E80;
    v13 = v4;
    v14 = self;
    v15 = v5;
    dispatch_async(v11, block);

  }
}

void __42__MKMapItemMetadataRequester_sendRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD block[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "urlRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MKMapItemMetadataRequester_sendRequest___block_invoke_2;
  block[3] = &unk_1E20D7E80;
  v3 = *(void **)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v2;
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __42__MKMapItemMetadataRequester_sendRequest___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1[4] + 8), "dataTaskWithRequest:", a1[6]);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 24), "setObject:forKey:", v5, a1[5]);
    v3 = *(void **)(a1[4] + 32);
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, v5);

    objc_msgSend(v5, "resume");
  }
}

- (void)cancelRequestsForMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[NSMapTable objectEnumerator](self->_requestsForURLs, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v11, "count"))
        {
          objc_msgSend(v11, "objectAtIndex:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "url");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "mapItem");
          v14 = (id)objc_claimAutoreleasedReturnValue();

          if (v14 == v4 && v13 != 0)
            objc_msgSend(v5, "addObject:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v8);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = v5;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
        -[NSMapTable removeObjectForKey:](self->_requestsForURLs, "removeObjectForKey:", v21, (_QWORD)v23);
        -[NSMapTable objectForKey:](self->_tasksForURLs, "objectForKey:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "cancel");
        if (v22)
          -[NSMapTable removeObjectForKey:](self->_dataForTasks, "removeObjectForKey:", v22);
        -[NSMapTable removeObjectForKey:](self->_tasksForURLs, "removeObjectForKey:", v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

}

- (void)handleTask:(id)a3 withData:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "originalRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMapTable objectForKey:](self->_requestsForURLs, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10)
  {
    v29 = 0uLL;
    v30 = 0uLL;
    v27 = 0uLL;
    v28 = 0uLL;
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "handleError:", v10);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v16);
    }
  }
  else
  {
    v25 = 0uLL;
    v26 = 0uLL;
    v23 = 0uLL;
    v24 = 0uLL;
    v19 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v24 != v21)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "handleData:", v9);
        }
        v20 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v20);
    }
  }
  -[NSMapTable removeObjectForKey:](self->_dataForTasks, "removeObjectForKey:", v8);
  -[NSMapTable removeObjectForKey:](self->_requestsForURLs, "removeObjectForKey:", v12);
  -[NSMapTable removeObjectForKey:](self->_tasksForURLs, "removeObjectForKey:", v12);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  void *v7;
  id v8;

  v8 = a5;
  -[NSMapTable objectForKey:](self->_dataForTasks, "objectForKey:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v7, "appendData:", v8);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  NSMapTable *dataForTasks;
  id v8;
  id v9;
  id v10;

  dataForTasks = self->_dataForTasks;
  v8 = a5;
  v9 = a4;
  -[NSMapTable objectForKey:](dataForTasks, "objectForKey:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MKMapItemMetadataRequester handleTask:withData:error:](self, "handleTask:withData:error:", v9, v10, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataForTasks, 0);
  objc_storeStrong((id *)&self->_tasksForURLs, 0);
  objc_storeStrong((id *)&self->_requestsForURLs, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
