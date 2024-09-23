@implementation ATXUserEducationSuggestionClient

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ATXUserEducationSuggestionClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_3 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_3, block);
  return (id)sharedInstance__pasExprOnceResult_14;
}

void __50__ATXUserEducationSuggestionClient_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A85A4F90]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_14;
  sharedInstance__pasExprOnceResult_14 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXUserEducationSuggestionClient)init
{
  ATXUserEducationSuggestionClient *v2;
  uint64_t v3;
  NSHashTable *observers;
  ATXUserEducationSuggestionConnector *v5;
  ATXUserEducationSuggestionClientRequestHandler *v6;
  uint64_t v7;
  ATXUserEducationSuggestionConnector *connector;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ATXUserEducationSuggestionClient;
  v2 = -[ATXUserEducationSuggestionClient init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = [ATXUserEducationSuggestionConnector alloc];
    v6 = -[ATXUserEducationSuggestionClientRequestHandler initWithClient:]([ATXUserEducationSuggestionClientRequestHandler alloc], "initWithClient:", v2);
    v7 = -[ATXUserEducationSuggestionConnector initWithOurInterfaceFactory:theirInterfaceFactory:ourServiceName:theirServiceName:requestHandler:](v5, "initWithOurInterfaceFactory:theirInterfaceFactory:ourServiceName:theirServiceName:requestHandler:", ATXUserEducationSuggestionClientXPCInterface, ATXUserEducationSuggestionServerXPCInterface, CFSTR("com.apple.proactive.UserEducationSuggestion.client-listener.xpc"), CFSTR("com.apple.proactive.UserEducationSuggestion.server-listener.xpc"), v6);
    connector = v2->_connector;
    v2->_connector = (ATXUserEducationSuggestionConnector *)v7;

  }
  return v2;
}

- (void)registerObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_observers;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)unregisterObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_observers;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)logUserEducationSuggestionFeedback:(id)a3
{
  ATXUserEducationSuggestionConnector *connector;
  id v4;
  id v5;

  connector = self->_connector;
  v4 = a3;
  -[ATXUserEducationSuggestionConnector remoteObjectProxy](connector, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logUserEducationSuggestionFeedback:", v4);

}

- (void)notifyObserversOfSuggestionEvent:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_observers;
  objc_sync_enter(v5);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_observers;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "didReceiveUserEducationSuggestionEvent:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connector, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
