@implementation _SFSafariViewControllerPrewarmingRequestThrottler

- (_SFSafariViewControllerPrewarmingRequestThrottler)init
{
  _SFSafariViewControllerPrewarmingRequestThrottler *v2;
  uint64_t v3;
  NSHashTable *requestedTokens;
  uint64_t v5;
  NSHashTable *prewarmedTokens;
  uint64_t v7;
  NSMutableSet *prewarmedURLs;
  uint64_t v9;
  NSMutableDictionary *tokensByID;
  _SFSafariViewControllerPrewarmingRequestThrottler *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_SFSafariViewControllerPrewarmingRequestThrottler;
  v2 = -[_SFSafariViewControllerPrewarmingRequestThrottler init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    requestedTokens = v2->_requestedTokens;
    v2->_requestedTokens = (NSHashTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    prewarmedTokens = v2->_prewarmedTokens;
    v2->_prewarmedTokens = (NSHashTable *)v5;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    prewarmedURLs = v2->_prewarmedURLs;
    v2->_prewarmedURLs = (NSMutableSet *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    tokensByID = v2->_tokensByID;
    v2->_tokensByID = (NSMutableDictionary *)v9;

    v11 = v2;
  }

  return v2;
}

- (void)requestToken:(id)a3
{
  NSMutableDictionary *tokensByID;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "isValid"))
  {
    tokensByID = self->_tokensByID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "requestID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](tokensByID, "setObject:forKeyedSubscript:", v8, v5);

    -[_SFSafariViewControllerPrewarmingRequestThrottler _URLsToPrewarmForToken:](self, "_URLsToPrewarmForToken:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      -[NSHashTable addObject:](self->_requestedTokens, "addObject:", v8);
      if (!self->_suspended)
      {
        -[_SFSafariViewControllerPrewarmingRequestThrottler _stopRequestTimer](self, "_stopRequestTimer");
        -[_SFSafariViewControllerPrewarmingRequestThrottler _startRequestTimer](self, "_startRequestTimer");
      }
    }
    else
    {
      -[_SFSafariViewControllerPrewarmingRequestThrottler _didPrewarmToken:](self, "_didPrewarmToken:", v8);
    }
  }

}

- (void)suspend
{
  self->_suspended = 1;
  -[_SFSafariViewControllerPrewarmingRequestThrottler _stopRequestTimer](self, "_stopRequestTimer");
}

- (void)resume
{
  self->_suspended = 0;
  -[_SFSafariViewControllerPrewarmingRequestThrottler _performNextRequest](self, "_performNextRequest");
}

- (void)invalidateTokenWithID:(unint64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_tokensByID, "objectForKeyedSubscript:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tokensByID, "setObject:forKeyedSubscript:", 0, v5);
  if (!self->_requestDelayTimer && !self->_suspended)
    -[_SFSafariViewControllerPrewarmingRequestThrottler _performNextRequest](self, "_performNextRequest");

}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_requestDelayTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_SFSafariViewControllerPrewarmingRequestThrottler;
  -[_SFSafariViewControllerPrewarmingRequestThrottler dealloc](&v3, sel_dealloc);
}

- (void)_stopRequestTimer
{
  NSTimer *requestDelayTimer;

  -[NSTimer invalidate](self->_requestDelayTimer, "invalidate");
  requestDelayTimer = self->_requestDelayTimer;
  self->_requestDelayTimer = 0;

}

- (void)_startRequestTimer
{
  void *v3;
  double minimumRequestDelay;
  NSTimer *v5;
  NSTimer *requestDelayTimer;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  if (self->_minimumRequestDelay <= 0.0)
  {
    -[_SFSafariViewControllerPrewarmingRequestThrottler _performNextRequest](self, "_performNextRequest");
  }
  else
  {
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x1E0C99E88];
    minimumRequestDelay = self->_minimumRequestDelay;
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __71___SFSafariViewControllerPrewarmingRequestThrottler__startRequestTimer__block_invoke;
    v11 = &unk_1E4AC1450;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v3, "timerWithTimeInterval:repeats:block:", 0, &v8, minimumRequestDelay);
    v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    requestDelayTimer = self->_requestDelayTimer;
    self->_requestDelayTimer = v5;

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop", v8, v9, v10, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTimer:forMode:", self->_requestDelayTimer, *MEMORY[0x1E0C99860]);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)_performNextRequest
{
  void *v3;
  void *v4;
  unint64_t maximumValidConnectionCount;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[_SFSafariViewControllerPrewarmingRequestThrottler _nextTokenToPrewarm](self, "_nextTokenToPrewarm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v12 = v3;
    -[_SFSafariViewControllerPrewarmingRequestThrottler _URLsToPrewarmForToken:](self, "_URLsToPrewarmForToken:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      maximumValidConnectionCount = self->_maximumValidConnectionCount;
      -[_SFSafariViewControllerPrewarmingRequestThrottler _prewarmedURLsWithValidTokens](self, "_prewarmedURLsWithValidTokens");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (self->_maximumValidConnectionCount)
      {
        v8 = maximumValidConnectionCount - v7;
        if (maximumValidConnectionCount - v7 < objc_msgSend(v4, "count"))
        {
          if (maximumValidConnectionCount != v7)
          {
            v9 = (void *)objc_msgSend(v4, "mutableCopy");
            objc_msgSend(v9, "removeObjectsInRange:", v8, objc_msgSend(v4, "count") - v8);
            objc_msgSend(v9, "array");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[_SFSafariViewControllerPrewarmingRequestThrottler _prewarmURLs:](self, "_prewarmURLs:", v10);

            -[_SFSafariViewControllerPrewarmingRequestThrottler _didPartiallyPrewarmToken:](self, "_didPartiallyPrewarmToken:", v12);
          }
          goto LABEL_9;
        }
      }
      objc_msgSend(v4, "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFSafariViewControllerPrewarmingRequestThrottler _prewarmURLs:](self, "_prewarmURLs:", v11);

    }
    -[_SFSafariViewControllerPrewarmingRequestThrottler _didPrewarmToken:](self, "_didPrewarmToken:", v12);
    -[_SFSafariViewControllerPrewarmingRequestThrottler _performNextRequest](self, "_performNextRequest");
LABEL_9:

    v3 = v12;
  }

}

- (void)_prewarmURLs:(id)a3
{
  void (**connectionHandler)(id, id);
  id v5;

  v5 = a3;
  -[NSMutableSet addObjectsFromArray:](self->_prewarmedURLs, "addObjectsFromArray:");
  connectionHandler = (void (**)(id, id))self->_connectionHandler;
  if (connectionHandler)
    connectionHandler[2](connectionHandler, v5);

}

- (id)_nextTokenToPrewarm
{
  NSHashTable *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = self->_requestedTokens;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "isValid", (_QWORD)v12))
        {
          if (!v5 || (v9 = objc_msgSend(v5, "requestID"), v9 < objc_msgSend(v8, "requestID")))
          {
            v10 = v8;

            v5 = v10;
          }
        }
      }
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_URLsToPrewarmForToken:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "URLs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "minusSet:", self->_prewarmedURLs);
  return v5;
}

- (id)_prewarmedURLsWithValidTokens
{
  void *v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_prewarmedTokens;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "isValid", (_QWORD)v13))
        {
          objc_msgSend(v9, "URLs");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "array");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v11);

        }
      }
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "intersectSet:", self->_prewarmedURLs);
  return v3;
}

- (void)_didPartiallyPrewarmToken:(id)a3
{
  -[NSHashTable addObject:](self->_prewarmedTokens, "addObject:", a3);
}

- (void)_didPrewarmToken:(id)a3
{
  NSHashTable *requestedTokens;
  id v5;

  requestedTokens = self->_requestedTokens;
  v5 = a3;
  -[NSHashTable removeObject:](requestedTokens, "removeObject:", v5);
  -[NSHashTable addObject:](self->_prewarmedTokens, "addObject:", v5);

}

- (id)connectionHandler
{
  return self->_connectionHandler;
}

- (void)setConnectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (double)minimumRequestDelay
{
  return self->_minimumRequestDelay;
}

- (void)setMinimumRequestDelay:(double)a3
{
  self->_minimumRequestDelay = a3;
}

- (unint64_t)maximumValidConnectionCount
{
  return self->_maximumValidConnectionCount;
}

- (void)setMaximumValidConnectionCount:(unint64_t)a3
{
  self->_maximumValidConnectionCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_connectionHandler, 0);
  objc_storeStrong((id *)&self->_requestDelayTimer, 0);
  objc_storeStrong((id *)&self->_tokensByID, 0);
  objc_storeStrong((id *)&self->_prewarmedURLs, 0);
  objc_storeStrong((id *)&self->_prewarmedTokens, 0);
  objc_storeStrong((id *)&self->_requestedTokens, 0);
}

@end
