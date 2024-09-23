@implementation FPDFileCoordinationProvider

- (FPDFileCoordinationProvider)initWithRootURL:(id)a3
{
  id v5;
  FPDFileCoordinationProvider *v6;
  FPDFileCoordinationProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPDFileCoordinationProvider;
  v6 = -[FPDFileCoordinationProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_providedItemsURL, a3);

  return v7;
}

- (id)delegateForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[FPDFileCoordinationProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_siblingDelegateForURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    -[FPDFileCoordinationProvider delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (NSURL)_providedItemsURL
{
  return self->_providedItemsURL;
}

- (NSOperationQueue)_providedItemsOperationQueue
{
  void *v2;
  void *v3;

  -[FPDFileCoordinationProvider delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_providedItemsOperationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOperationQueue *)v3;
}

- (NSString)_fileReactorID
{
  void *v2;
  void *v3;

  -[FPDFileCoordinationProvider delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_fileReactorID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_physicalURLForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FPDFileCoordinationProvider delegateForURL:](self, "delegateForURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_physicalURLForURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_provideItemAtURL:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v7 = a4;
  v8 = a3;
  fp_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[FPDFileCoordinationProvider _provideItemAtURL:completionHandler:].cold.1(a2, v9);

  v10 = objc_alloc_init(MEMORY[0x1E0CB3638]);
  -[FPDFileCoordinationProvider delegateForURL:](self, "delegateForURL:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__FPDFileCoordinationProvider__provideItemAtURL_completionHandler___block_invoke;
  v13[3] = &unk_1E8C760A8;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v11, "_provideItemAtURL:withInfo:completionHandler:", v8, v10, v13);

}

void __67__FPDFileCoordinationProvider__provideItemAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(MEMORY[0x1E0CB3600], "_setProvidedItemRecursiveGenerationCount:", objc_msgSend(v5, "providedItemRecursiveGenerationCount"));
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

- (void)_provideItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[FPDFileCoordinationProvider delegateForURL:](self, "delegateForURL:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_provideItemAtURL:withInfo:completionHandler:", v10, v9, v8);

}

- (void)_cancelProvidingItemAtURL:(id)a3 toReaderWithID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FPDFileCoordinationProvider delegateForURL:](self, "delegateForURL:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_cancelProvidingItemAtURL:toReaderWithID:", v7, v6);

}

- (void)_writerWithID:(id)a3 didFinishWritingForURL:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FPDFileCoordinationProvider delegateForURL:](self, "delegateForURL:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_writerWithID:didFinishWritingForURL:", v7, v6);

}

- (void)_providedItemAtURL:(id)a3 didGainPresenterWithInfo:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FPDFileCoordinationProvider delegateForURL:](self, "delegateForURL:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_providedItemAtURL:didGainPresenterWithInfo:", v7, v6);

}

- (void)_providedItemAtURL:(id)a3 didLosePresenterWithID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FPDFileCoordinationProvider delegateForURL:](self, "delegateForURL:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_providedItemAtURL:didLosePresenterWithID:", v7, v6);

}

- (void)_providedItemAtURL:(id)a3 withPresenterWithID:(id)a4 didMoveToURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[FPDFileCoordinationProvider delegateForURL:](self, "delegateForURL:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_providedItemAtURL:withPresenterWithID:didMoveToURL:", v10, v9, v8);

}

- (void)_movingItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  -[FPDFileCoordinationProvider delegateForURL:](self, "delegateForURL:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "destinationDirectoryURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDFileCoordinationProvider delegateForURL:](self, "delegateForURL:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v13)
  {
    objc_msgSend(v11, "_movingItemAtURL:withInfo:completionHandler:", v8, v9, v10);
  }
  else
  {
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[FPDFileCoordinationProvider _movingItemAtURL:withInfo:completionHandler:].cold.1(v8, v9, v14);

    objc_msgSend(MEMORY[0x1E0CB3628], "providingRequiredResponse");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v15);

  }
}

- (FPDFileCoordinationProviderDelegate)delegate
{
  return (FPDFileCoordinationProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)extensionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExtensionIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (BOOL)isRegistered
{
  return self->_registered;
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_providedItemsURL, 0);
}

- (void)_provideItemAtURL:(const char *)a1 completionHandler:(NSObject *)a2 .cold.1(const char *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Calling deprecated method: %@", (uint8_t *)&v4, 0xCu);

}

- (void)_movingItemAtURL:(void *)a1 withInfo:(void *)a2 completionHandler:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "destinationDirectoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fp_shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v5;
  v10 = 2112;
  v11 = v7;
  _os_log_debug_impl(&dword_1CF55F000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] needs providing %@ for moving into a different domain %@", (uint8_t *)&v8, 0x16u);

}

@end
