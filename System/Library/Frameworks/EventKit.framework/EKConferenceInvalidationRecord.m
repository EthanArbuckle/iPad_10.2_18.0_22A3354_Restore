@implementation EKConferenceInvalidationRecord

- (void)generateNewValidURLForOriginalURL:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (generateNewValidURLForOriginalURL__onceToken != -1)
    dispatch_once(&generateNewValidURLForOriginalURL__onceToken, &__block_literal_global_104);
  v5 = generateNewValidURLForOriginalURL__generationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__EKConferenceInvalidationRecord_generateNewValidURLForOriginalURL___block_invoke_2;
  v7[3] = &unk_1E47891B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  +[EKConferenceUtils _findRoomTypeForURL:queue:completionHandler:](EKConferenceUtils, "_findRoomTypeForURL:queue:completionHandler:", v6, v5, v7);

}

void __68__EKConferenceInvalidationRecord_generateNewValidURLForOriginalURL___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.eventkit.ConferenceCreationQueue", v2);
  v1 = (void *)generateNewValidURLForOriginalURL__generationQueue;
  generateNewValidURLForOriginalURL__generationQueue = (uint64_t)v0;

}

void __68__EKConferenceInvalidationRecord_generateNewValidURLForOriginalURL___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  _QWORD v5[5];
  id v6;

  if (a2)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __68__EKConferenceInvalidationRecord_generateNewValidURLForOriginalURL___block_invoke_3;
    v5[3] = &unk_1E4789188;
    v4 = *(void **)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    +[EKVirtualConference virtualConferenceForRoomType:completion:queue:](EKVirtualConference, "virtualConferenceForRoomType:completion:queue:", a2, v5, generateNewValidURLForOriginalURL__generationQueue);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithURL:error:", 0, a3);
  }
}

void __68__EKConferenceInvalidationRecord_generateNewValidURLForOriginalURL___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(a2, "joinMethods");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "logHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1A2318000, v7, OS_LOG_TYPE_DEFAULT, "Generated URL %@ to replace %@", (uint8_t *)&v9, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithURL:error:", v6, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithURL:error:", 0, a3);
  }
}

- (void)finishWithURL:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  NSMutableArray *v9;
  NSMutableArray *waitingCompletionHandlers;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  os_unfair_lock_lock(&_invalidationLock);
  objc_storeStrong((id *)&self->_validURL, a3);
  v9 = self->_waitingCompletionHandlers;
  waitingCompletionHandlers = self->_waitingCompletionHandlers;
  self->_waitingCompletionHandlers = 0;

  v11 = (void *)-[NSMutableSet copy](self->_replacementForURLs, "copy");
  os_unfair_lock_unlock(&_invalidationLock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v9;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16) + 16))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16));
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (NSURL)validURL
{
  return self->_validURL;
}

- (void)setValidURL:(id)a3
{
  objc_storeStrong((id *)&self->_validURL, a3);
}

- (NSMutableSet)replacementForURLs
{
  return self->_replacementForURLs;
}

- (void)setReplacementForURLs:(id)a3
{
  objc_storeStrong((id *)&self->_replacementForURLs, a3);
}

- (NSMutableArray)waitingCompletionHandlers
{
  return self->_waitingCompletionHandlers;
}

- (void)setWaitingCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_waitingCompletionHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_replacementForURLs, 0);
  objc_storeStrong((id *)&self->_validURL, 0);
}

@end
