@implementation MapsSuggestionsRealWalletConnector

+ (BOOL)isAvailable
{
  return objc_msgSend(MEMORY[0x1E0D66F08], "isPassLibraryAvailable");
}

- (MapsSuggestionsRealWalletConnector)init
{
  MapsSuggestionsRealWalletConnector *v2;
  PKPassLibrary *v3;
  PKPassLibrary *passLibrary;
  PKPaymentService *v5;
  PKPaymentService *paymentService;
  _RealPKPassFlightFieldReader *v7;
  MapsSuggestionsWalletPassFieldReader *fieldReader;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MapsSuggestionsRealWalletConnector;
  v2 = -[MapsSuggestionsRealWalletConnector init](&v10, sel_init);
  if (v2)
  {
    v3 = (PKPassLibrary *)objc_alloc_init(MEMORY[0x1E0D66F08]);
    passLibrary = v2->_passLibrary;
    v2->_passLibrary = v3;

    v5 = (PKPaymentService *)objc_alloc_init(MEMORY[0x1E0D672B0]);
    paymentService = v2->_paymentService;
    v2->_paymentService = v5;

    v7 = objc_alloc_init(_RealPKPassFlightFieldReader);
    fieldReader = v2->_fieldReader;
    v2->_fieldReader = (MapsSuggestionsWalletPassFieldReader *)v7;

  }
  return v2;
}

- (void)startListeningForChanges
{
  void *v3;
  uint64_t v4;
  PKPassLibrary *passLibrary;
  id v6;
  _QWORD v7[5];
  id v8;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D6A788];
  passLibrary = self->_passLibrary;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__MapsSuggestionsRealWalletConnector_startListeningForChanges__block_invoke;
  v7[3] = &unk_1E4BDF668;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  v6 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, passLibrary, 0, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __62__MapsSuggestionsRealWalletConnector_startListeningForChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446722;
      v9 = "MapsSuggestionsRealWalletConnector.mm";
      v10 = 1026;
      v11 = 65;
      v12 = 2082;
      v13 = "-[MapsSuggestionsRealWalletConnector startListeningForChanges]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
    v6 = v7;
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136446722;
      v9 = "MapsSuggestionsRealWalletConnector.mm";
      v10 = 1026;
      v11 = 66;
      v12 = 2082;
      v13 = "-[MapsSuggestionsRealWalletConnector startListeningForChanges]_block_invoke";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongDelegate went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }

    v6 = 0;
LABEL_10:

    goto LABEL_11;
  }
  -[NSObject passKitDidChange:](v5, "passKitDidChange:", WeakRetained);
LABEL_11:

}

- (void)stopListeningForChanges
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D6A788], 0);

}

- (id)fieldReader
{
  return self->_fieldReader;
}

- (id)defaultPass
{
  void *v2;
  void *v3;

  -[PKPassLibrary defaultPaymentPassesWithRemotePasses:](self->_passLibrary, "defaultPaymentPassesWithRemotePasses:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)expressSupportedByPass:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  NSObject *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "devicePaymentApplications", 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "supportsExpress"))
        {
          GEOFindOrCreateLog();
          v9 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v3, "organizationName");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v17 = v10;
            _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "%@ card supports express transit", buf, 0xCu);

          }
          v8 = 1;
          goto LABEL_15;
        }
      }
      v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
      if (v5)
        continue;
      break;
    }
  }

  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "Found no paymentApplication on the pass that supports express transit", buf, 2u);
  }
  v8 = 0;
LABEL_15:

  return v8;
}

- (id)supportedTransitIdsForPass:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "devicePrimaryPaymentApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedTransitNetworkIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (id)passesOfType:(unint64_t)a3
{
  return -[PKPassLibrary passesOfType:](self->_passLibrary, "passesOfType:", a3);
}

- (int64_t)paymentNetworkIdentiferForPass:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "devicePrimaryPaymentApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "paymentNetworkIdentifier");

  return v4;
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (MapsSuggestionsWalletConnectorDelegate)delegate
{
  return (MapsSuggestionsWalletConnectorDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_fieldReader, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
}

@end
