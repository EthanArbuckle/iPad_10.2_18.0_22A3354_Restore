@implementation EMRepository

- (void)prepareRepositoryObjects:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  _BOOL4 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "repository", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9 == 0;

        if (v10)
          objc_msgSend(v8, "setRepository:", self);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (EMRemoteConnection)connection
{
  return (EMRemoteConnection *)objc_getProperty(self, a2, 8, 1);
}

- (EMRepository)initWithRemoteConnection:(id)a3
{
  id v5;
  EMRepository *v6;
  EMRepository *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  EFScheduler *observerScheduler;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EMRepository;
  v6 = -[EMRepository init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = (void *)MEMORY[0x1E0D1F070];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.email.%@.observer"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serialDispatchQueueSchedulerWithName:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    observerScheduler = v7->_observerScheduler;
    v7->_observerScheduler = (EFScheduler *)v10;

  }
  return v7;
}

- (id)trampoliningObserverForObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (+[EMForceBlankCellsController shouldBlockXPCQueue](EMForceBlankCellsController, "shouldBlockXPCQueue"))
  {
    +[EMForceBlankCellsController blockForRandomDurationWithMessage:](EMForceBlankCellsController, "blockForRandomDurationWithMessage:", CFSTR("Block trampolining"));
  }
  -[EMRepository observerScheduler](self, "observerScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performWithObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (EFScheduler)observerScheduler
{
  return self->_observerScheduler;
}

+ (NSXPCInterface)remoteInterface
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  __assert_rtn("+[EMRepository remoteInterface]", "EMRepository.m", 28, "0");
}

- (id)initForTesting
{
  return -[EMRepository initWithRemoteConnection:](self, "initWithRemoteConnection:", 0);
}

- (id)performQuery:(id)a3 withObserver:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[EMRepository doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMRepository performQuery:withObserver:]", "EMRepository.m", 45, "0");
}

- (void)refreshQueryWithObserver:(id)a3
{
  id v5;

  v5 = a3;
  -[EMRepository doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMRepository refreshQueryWithObserver:]", "EMRepository.m", 49, "0");
}

- (void)setObserverScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_observerScheduler, a3);
}

- (Protocol)interfaceProtocol
{
  return (Protocol *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceProtocol, 0);
  objc_storeStrong((id *)&self->_observerScheduler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
