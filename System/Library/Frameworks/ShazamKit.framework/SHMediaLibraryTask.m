@implementation SHMediaLibraryTask

- (SHMediaLibraryTask)init
{
  SHMediaLibraryTask *v2;
  SHShazamKitServiceConnection *v3;
  void *v4;
  SHShazamKitServiceConnection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SHMediaLibraryTask;
  v2 = -[SHMediaLibraryTask init](&v7, sel_init);
  if (v2)
  {
    v3 = [SHShazamKitServiceConnection alloc];
    v4 = (void *)objc_opt_new();
    v5 = -[SHShazamKitServiceConnection initWithConnectionProvider:](v3, "initWithConnectionProvider:", v4);
    -[SHMediaLibraryTask _initWithRemoteLibrary:](v2, "_initWithRemoteLibrary:", v5);

  }
  return v2;
}

- (void)_initWithRemoteLibrary:(id)a3
{
  SHRemoteMediaLibrary *v4;
  NSUUID *v5;
  NSUUID *identifier;
  SHRemoteMediaLibrary *remoteLibrary;
  SHRemoteMediaLibrary *v8;

  v4 = (SHRemoteMediaLibrary *)a3;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v5;

  remoteLibrary = self->_remoteLibrary;
  self->_remoteLibrary = v4;
  v8 = v4;

  -[SHRemoteMediaLibrary setDelegate:](self->_remoteLibrary, "setDelegate:", self);
}

- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SHMediaLibraryTask remoteLibrary](self, "remoteLibrary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_synchronizeSnapshot:startCondition:", v7, v6);

}

- (void)_libraryInfoWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SHMediaLibraryTask remoteLibrary](self, "remoteLibrary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_libraryInfoWithCompletionHandler:", v4);

}

- (void)_queryLibraryWithParameters:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SHMediaLibraryTask remoteLibrary](self, "remoteLibrary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_queryLibraryWithParameters:completionHandler:", v7, v6);

}

- (void)_libraryWillBeginSync:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  sh_log_object();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[SHMediaLibraryTask identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_218BF1000, v4, OS_LOG_TYPE_DEFAULT, "Library sync task <ID:%@> will begin", (uint8_t *)&v10, 0xCu);

  }
  -[SHMediaLibraryTask delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SHMediaLibraryTask delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_libraryWillBeginSync:", self);

  }
}

- (void)_library:(id)a3 didChangeWithSnapshot:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  sh_log_object();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[SHMediaLibraryTask identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_218BF1000, v6, OS_LOG_TYPE_DEFAULT, "Library sync task <ID:%@> produced changes %@", (uint8_t *)&v12, 0x16u);

  }
  -[SHMediaLibraryTask delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[SHMediaLibraryTask delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_library:didChangeWithSnapshot:", self, v5);

  }
}

- (void)_library:(id)a3 didProduceError:(id)a4 failedItemIdentifiers:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  sh_log_object();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[SHMediaLibraryTask identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v11;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_218BF1000, v9, OS_LOG_TYPE_ERROR, "Library sync task <ID:%@> produced error %@", (uint8_t *)&v15, 0x16u);

  }
  -[SHMediaLibraryTask setSyncError:](self, "setSyncError:", v7);
  -[SHMediaLibraryTask delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[SHMediaLibraryTask delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_library:didProduceError:failedItemIdentifiers:", self, v7, v8);

  }
}

- (void)_libraryDidCompleteSync:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  sh_log_object();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[SHMediaLibraryTask identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v6;
    _os_log_impl(&dword_218BF1000, v4, OS_LOG_TYPE_DEFAULT, "Library sync task <ID:%@> execution complete", (uint8_t *)&v13, 0xCu);

  }
  -[SHMediaLibraryTask delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SHMediaLibraryTask delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_libraryDidCompleteSync:", self);

  }
  -[SHMediaLibraryTask syncCompletionBlock](self, "syncCompletionBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SHMediaLibraryTask syncCompletionBlock](self, "syncCompletionBlock");
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[SHMediaLibraryTask syncError](self, "syncError");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v12);

  }
}

- (SHMediaLibrarySyncDelegate)delegate
{
  return (SHMediaLibrarySyncDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (id)syncCompletionBlock
{
  return self->_syncCompletionBlock;
}

- (void)setSyncCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SHRemoteMediaLibrary)remoteLibrary
{
  return self->_remoteLibrary;
}

- (void)setRemoteLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_remoteLibrary, a3);
}

- (NSError)syncError
{
  return self->_syncError;
}

- (void)setSyncError:(id)a3
{
  objc_storeStrong((id *)&self->_syncError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncError, 0);
  objc_storeStrong((id *)&self->_remoteLibrary, 0);
  objc_storeStrong(&self->_syncCompletionBlock, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
