@implementation FPXObserver

- (FPXObserver)init
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("shouldn't be called"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_fault_impl(&dword_1A0A34000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[FPXObserver init]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 50, (const char *)objc_msgSend(objc_retainAutorelease(v2), "UTF8String"));
}

- (FPXObserver)initWithObservedItemID:(id)a3 domainContext:(id)a4 nsFileProviderRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  FPXObserver *v11;
  uint64_t v12;
  FPItemID *observedItemID;
  uint64_t v14;
  NSFileProviderReplicatedExtension *strongVendorInstance;
  uint64_t v16;
  FPXExtensionContext *strongExtensionContext;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FPXObserver;
  v11 = -[FPXObserver init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    observedItemID = v11->_observedItemID;
    v11->_observedItemID = (FPItemID *)v12;

    objc_storeStrong((id *)&v11->_domainContext, a4);
    -[FPXDomainContext vendorInstance](v11->_domainContext, "vendorInstance");
    v14 = objc_claimAutoreleasedReturnValue();
    strongVendorInstance = v11->_strongVendorInstance;
    v11->_strongVendorInstance = (NSFileProviderReplicatedExtension *)v14;

    -[FPXDomainContext extensionContext](v11->_domainContext, "extensionContext");
    v16 = objc_claimAutoreleasedReturnValue();
    strongExtensionContext = v11->_strongExtensionContext;
    v11->_strongExtensionContext = (FPXExtensionContext *)v16;

    objc_storeStrong((id *)&v11->_nsFileProviderRequest, a5);
  }

  return v11;
}

- (void)_fixupFavoriteRank:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "favoriteRank");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  if (v6 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    v9 = v8;

    v10 = arc4random_uniform(0x7D0u) - 1000 + (unint64_t)(v9 * 1000.0);
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[FPXObserver _fixupFavoriteRank:].cold.1((uint64_t)v4, v10, v11);

    objc_msgSend(v4, "strippedCopy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFavoriteRank:", v13);

    -[FPXExtensionContext singleItemChange:changedFields:bounce:completionHandler:](self->_strongExtensionContext, "singleItemChange:changedFields:bounce:completionHandler:", v12, 32, 0, &__block_literal_global_20);
  }

}

void __34__FPXObserver__fixupFavoriteRank___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a2;
  v5 = a3;
  if (v5)
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __34__FPXObserver__fixupFavoriteRank___block_invoke_cold_1((uint64_t)v4, v5, v6);

  }
}

- (id)updateForProviderItem:(id)a3
{
  FPXEnumeratorAlternateContentsItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FPXEnumeratorAlternateContentsItem *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  void *v20;

  v5 = (FPXEnumeratorAlternateContentsItem *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPXEnumerator.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("providerItem"));

  }
  -[FPXDomainContext itemFromVendorItem:](self->_domainContext, "itemFromVendorItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && +[FPExtensionCollection item:isValidForObservedItemID:](FPExtensionCollection, "item:isValidForObservedItemID:", v6, self->_observedItemID))
  {
    -[FPXDomainContext extensionContext](self->_domainContext, "extensionContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alternateContentsURLWrapperForItemID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = -[FPXEnumeratorAlternateContentsItem initWithOriginalDocumentItem:alternateContentsURL:]([FPXEnumeratorAlternateContentsItem alloc], "initWithOriginalDocumentItem:alternateContentsURL:", v6, v10);

      -[FPXDomainContext itemFromVendorItem:](self->_domainContext, "itemFromVendorItem:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v5 = v11;
      v6 = (void *)v12;
    }

    objc_msgSend(v6, "favoriteRank");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(v6, "favoriteRank");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "unsignedLongLongValue");

      if (v16 == 1)
        -[FPXObserver _fixupFavoriteRank:](self, "_fixupFavoriteRank:", v6);
    }
    v17 = v6;
    v6 = v17;
  }
  else
  {
    fp_current_or_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[FPXObserver updateForProviderItem:].cold.1();

    v17 = 0;
  }

  return v17;
}

- (void)verifyVendorToken:(id)a3
{
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  -[FPItemID identifier](self->_observedItemID, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"));

  if (v6 && (unint64_t)objc_msgSend(v8, "length") > 0x1F4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPXEnumerator.m"), 144, CFSTR("page and sync anchor length shouldn't exceed 500 bytes!"));

  }
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nsFileProviderRequest, 0);
  objc_storeStrong((id *)&self->_strongExtensionContext, 0);
  objc_storeStrong((id *)&self->_strongVendorInstance, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_domainContext, 0);
  objc_storeStrong((id *)&self->_observedItemID, 0);
}

- (void)_fixupFavoriteRank:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, a2, a3, "[DEBUG] fixing up favorite rank (%llu) for %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_3();
}

void __34__FPXObserver__fixupFavoriteRank___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_ERROR, "[ERROR] couldn't set favorite rank for %@; %@",
    (uint8_t *)&v6,
    0x16u);

}

- (void)updateForProviderItem:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v0, v1, "[DEBUG] item %@ isn't valid for current enumeration (enumeratedItem: %@)");
  OUTLINED_FUNCTION_3();
}

@end
