@implementation MOPassthroughSubject

- (MOPassthroughSubject)init
{
  MOPassthroughSubject *v2;
  uint64_t v3;
  NSMutableDictionary *downstreams;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MOPassthroughSubject;
  v2 = -[MOSubject initSubject](&v6, sel_initSubject);
  v3 = objc_opt_new();
  downstreams = v2->_downstreams;
  v2->_downstreams = (NSMutableDictionary *)v3;

  return v2;
}

- (void)subscribe:(id)a3
{
  MOPassthroughSubjectConduit *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *downstreams;
  void *v7;
  id v8;

  v8 = a3;
  v4 = -[MOPassthroughSubjectConduit initWithDownstream:parent:]([MOPassthroughSubjectConduit alloc], "initWithDownstream:parent:", v8, self);
  v5 = self->_downstreams;
  objc_sync_enter(v5);
  downstreams = self->_downstreams;
  -[MOPassthroughSubjectConduit identifier](v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](downstreams, "setObject:forKeyedSubscript:", v4, v7);

  objc_sync_exit(v5);
  objc_msgSend(v8, "receiveSubscription:", v4);

}

- (void)disassociate:(id)a3
{
  NSMutableDictionary *v4;
  id v5;

  v5 = a3;
  v4 = self->_downstreams;
  objc_sync_enter(v4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_downstreams, "setObject:forKeyedSubscript:", 0, v5);
  objc_sync_exit(v4);

}

- (void)sendValue:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_downstreams;
  objc_sync_enter(v5);
  -[NSMutableDictionary allValues](self->_downstreams, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_sync_exit(v5);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v12, "hasDemand", (_QWORD)v13))
          objc_msgSend(v12, "offerInput:", v4);
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)sendCompletion:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_downstreams;
  objc_sync_enter(v5);
  -[NSMutableDictionary allValues](self->_downstreams, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_sync_exit(v5);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "finishWithCompletion:", v4, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (BOOL)hasSubscriptionWithIdentifier:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;

  v4 = a3;
  v5 = self->_downstreams;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_downstreams, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v6 != 0;

  objc_sync_exit(v5);
  return (char)self;
}

- (NSMutableDictionary)downstreams
{
  return self->_downstreams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downstreams, 0);
}

@end
