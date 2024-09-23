@implementation SHMediaLibrary

void __34___SHMediaLibrary__defaultLibrary__block_invoke()
{
  _SHMediaLibrary *v0;
  void *v1;

  v0 = objc_alloc_init(_SHMediaLibrary);
  v1 = (void *)_defaultLibrary_library;
  _defaultLibrary_library = (uint64_t)v0;

}

void __70___SHMediaLibrary__queryLibraryWithTask_parameters_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;

  v7 = (id *)(a1 + 48);
  v8 = a4;
  v9 = a3;
  v11 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "removeInflightTask:", *(_QWORD *)(a1 + 32));

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __58___SHMediaLibrary__libraryInfoWithTask_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;
  id v8;

  v5 = (id *)(a1 + 48);
  v6 = a3;
  v8 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "removeInflightTask:", *(_QWORD *)(a1 + 32));

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (SHMediaLibrary)defaultLibrary
{
  if (defaultLibrary_onceToken != -1)
    dispatch_once(&defaultLibrary_onceToken, &__block_literal_global_8);
  return (SHMediaLibrary *)(id)defaultLibrary_library;
}

void __32__SHMediaLibrary_defaultLibrary__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SHMediaLibrary _init]([SHMediaLibrary alloc], "_init");
  v1 = (void *)defaultLibrary_library;
  defaultLibrary_library = (uint64_t)v0;

}

- (id)_init
{
  SHMediaLibrary *v2;
  uint64_t v3;
  _SHMediaLibrary *underlyingLibrary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SHMediaLibrary;
  v2 = -[SHMediaLibrary init](&v6, sel_init);
  if (v2)
  {
    +[_SHMediaLibrary _defaultLibrary](_SHMediaLibrary, "_defaultLibrary");
    v3 = objc_claimAutoreleasedReturnValue();
    underlyingLibrary = v2->_underlyingLibrary;
    v2->_underlyingLibrary = (_SHMediaLibrary *)v3;

    -[_SHMediaLibrary setDelegate:](v2->_underlyingLibrary, "setDelegate:", v2);
  }
  return v2;
}

- (void)addMediaItems:(NSArray *)mediaItems completionHandler:(void *)completionHandler
{
  void *v6;
  NSArray *v7;
  id v8;

  v6 = completionHandler;
  v7 = mediaItems;
  -[SHMediaLibrary underlyingLibrary](self, "underlyingLibrary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_addMediaItems:completionHandler:", v7, v6);

}

- (void)_libraryInfoWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SHMediaLibrary underlyingLibrary](self, "underlyingLibrary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_libraryInfoWithCompletionHandler:", v4);

}

- (void)_queryLibraryWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SHMediaLibrary underlyingLibrary](self, "underlyingLibrary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_queryLibraryWithCompletionHandler:", v4);

}

- (void)_queryLibraryWithParameters:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SHMediaLibrary underlyingLibrary](self, "underlyingLibrary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_queryLibraryWithParameters:completionHandler:", v7, v6);

}

- (void)_synchronize
{
  id v2;

  -[SHMediaLibrary underlyingLibrary](self, "underlyingLibrary");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_synchronize");

}

- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SHMediaLibrary underlyingLibrary](self, "underlyingLibrary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_synchronizeSnapshot:startCondition:", v7, v6);

}

- (void)_libraryWillBeginSync:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[SHMediaLibrary delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SHMediaLibrary delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_libraryWillBeginSync:", self);

  }
}

- (void)_library:(id)a3 didChangeWithSnapshot:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[SHMediaLibrary delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SHMediaLibrary delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_library:didChangeWithSnapshot:", self, v8);

  }
}

- (void)_library:(id)a3 didProduceError:(id)a4 failedItemIdentifiers:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  -[SHMediaLibrary delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[SHMediaLibrary delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_library:didProduceError:failedItemIdentifiers:", self, v11, v7);

  }
}

- (void)_libraryDidCompleteSync:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[SHMediaLibrary delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SHMediaLibrary delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_libraryDidCompleteSync:", self);

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

- (_SHMediaLibrary)underlyingLibrary
{
  return self->_underlyingLibrary;
}

- (void)setUnderlyingLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingLibrary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingLibrary, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
