@implementation FPDDomainDeadEndBackend

- (FPDDomainDeadEndBackend)initWithDomain:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  FPDDomainDeadEndBackend *v8;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CAAB48];
  v6 = a3;
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, -1004, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FPDDomainDeadEndBackend initWithDomain:materializationError:](self, "initWithDomain:materializationError:", v6, v7);

  return v8;
}

- (FPDDomainDeadEndBackend)initWithDomain:(id)a3 materializationError:(id)a4
{
  id v6;
  id v7;
  FPDDomainDeadEndBackend *v8;
  FPDDomainDeadEndBackend *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FPDDomainDeadEndBackend;
  v8 = -[FPDDomainDeadEndBackend init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_domain, v6);
    objc_storeStrong((id *)&v9->_materializationError, a4);
  }

  return v9;
}

- (BOOL)startWithReason:(id)a3 userAllowedDBDrop:(BOOL)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)isProviderForRealPathURL:(id)a3
{
  FPDDomain **p_domain;
  id v4;
  id WeakRetained;
  void *v6;
  char v7;

  p_domain = &self->_domain;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_domain);
  objc_msgSend(WeakRetained, "deactivatedBackend");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isProviderForRealPathURL:", v4);

  return v7;
}

- (NSArray)rootURLs
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  objc_msgSend(WeakRetained, "deactivatedBackend");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootURLs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)coordinationRootURLs
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  objc_msgSend(WeakRetained, "deactivatedBackend");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coordinationRootURLs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)checkableURLs
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  objc_msgSend(WeakRetained, "deactivatedBackend");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "checkableURLs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)rootURLsWithTransientState:(BOOL *)a3
{
  *a3 = 0;
  return -[FPDDomainDeadEndBackend rootURLs](self, "rootURLs");
}

- (NSData)backingStoreIdentity
{
  return 0;
}

- (NSFileProviderDomainVersion)domainVersion
{
  return 0;
}

- (void)itemForItemID:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, 0, 0);
}

- (void)itemForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 request:(id)a6 completionHandler:(id)a7
{
  (*((void (**)(id, _QWORD, _QWORD))a7 + 2))(a7, 0, 0);
}

- (void)itemForURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, 0, 0);
}

- (void)itemIDForURL:(id)a3 requireProviderItemID:(BOOL)a4 request:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, _QWORD, _QWORD))a6 + 2))(a6, 0, 0);
}

- (void)putBackURLForTrashedItemAtURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, 0, 0);
}

- (void)setPutBackInfoOnItemAtURL:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)fetchFSItemsForItemIdentifiers:(id)a3 materializingIfNeeded:(BOOL)a4 request:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, _QWORD, _QWORD))a6 + 2))(a6, 0, 0);
}

- (id)startProvidingItemAtURL:(id)a3 readerID:(id)a4 readingOptions:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7
{
  void (**v9)(id, NSError *);
  void *v10;
  int v11;

  v9 = (void (**)(id, NSError *))a7;
  objc_msgSend(a3, "fp_isDatalessWithError:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
    v9[2](v9, self->_materializationError);
  v9[2](v9, 0);

  return 0;
}

- (id)evictItemAtURL:(id)a3 evictionReason:(unsigned int)a4 request:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))a6 + 2))(a6, 0, 0, *(_QWORD *)&a4, a5);
  return 0;
}

- (void)evictItemWithID:(id)a3 evictionReason:(unsigned int)a4 request:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
}

- (void)materializeItemWithID:(id)a3 requestedRange:(_NSRange)a4 request:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, NSError *))a6 + 2))(a6, self->_materializationError);
}

- (void)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 urlWrapper:(id)a5 options:(unint64_t)a6 bounceOnCollision:(BOOL)a7 request:(id)a8 completionHandler:(id)a9
{
  (*((void (**)(id, _QWORD, _QWORD))a9 + 2))(a9, 0, 0);
}

- (BOOL)updateRootAfterDomainChangeWithError:(id *)a3
{
  return 1;
}

- (void)URLForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 forBookmarkResolution:(BOOL)a6 request:(id)a7 completionHandler:(id)a8
{
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a8;
  objc_msgSend(a3, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CAABA0]);

  if (v11
    && (-[FPDDomainDeadEndBackend rootURLs](self, "rootURLs"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "firstObject"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v13))
  {
    objc_msgSend(MEMORY[0x1E0CAACB8], "wrapperWithURL:readonly:error:", v13, 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *, _QWORD))v15 + 2))(v15, 0, v14, 0);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v15 + 2))(v15, 0, 0, 0);
  }

}

- (void)waitForStabilizationForRequest:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)dumpStateTo:(id)a3 limitNumberOfItems:(BOOL)a4 request:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
}

- (void)copyDatabaseToURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  FPNotSupportedError();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);

}

- (void)enumerateMaterializedSetFromSyncAnchor:(id)a3 suggestedBatchSize:(int64_t)a4 completionHandler:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a5 + 2))(a5, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, 0, 0, 0);
}

- (void)currentMaterializedSetSyncAnchorWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)enumeratePendingSetFromSyncAnchor:(id)a3 suggestedBatchSize:(int64_t)a4 completionHandler:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, double))a5 + 2))(a5, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, 0, 0, 0, 0, 0.0);
}

- (void)currentPendingSetSyncAnchorWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD, double))a3 + 2))(a3, 0, 0, 0.0);
}

- (void)enumerateWithSettings:(id)a3 lifetimeExtender:(id)a4 observer:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, _QWORD, NSError *))a6 + 2))(a6, 0, self->_materializationError);
}

- (void)valuesForAttributes:(id)a3 forURL:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, _QWORD, _QWORD))a6 + 2))(a6, 0, 0);
}

- (void)reimportItemsBelowItemWithID:(id)a3 markItemDataless:(BOOL)a4 completionHandler:(id)a5
{
  void (*v6)(void);
  id v7;
  id v8;

  if (self->_materializationError)
  {
    v6 = (void (*)(void))*((_QWORD *)a5 + 2);
    v8 = a5;
    v6();
  }
  else
  {
    v7 = a5;
    FPNotSupportedError();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id))a5 + 2))(v7);

  }
}

- (id)createIndexerWithExtension:(id)a3 enabled:(BOOL)a4 error:(id *)a5
{
  return 0;
}

- (id)createRootByImportingURL:(id)a3 knownFolders:(id)a4 error:(id *)a5
{
  if (a5)
  {
    FPNotSupportedError();
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)needsRootsCreation
{
  return 0;
}

- (BOOL)isDeadEndBackend
{
  return 1;
}

- (void)fetchOperationServiceOrEndpointWithRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  FPDomainUnavailableError();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, id))a4 + 2))(v5, 0, 0, v6);

}

- (void)forceUpdateBlockedProcessNamesFromDomain:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  FPDomainUnavailableError();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);

}

- (void)fetchServicesForItemID:(id)a3 allowRestrictedSources:(BOOL)a4 request:(id)a5 completionHandler:(id)a6
{
  id v7;
  id v8;

  v7 = a6;
  FPDomainUnavailableError();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, id))a6 + 2))(v7, 0, 0, v8);

}

- (void)fetchVendorEndpointWithRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  FPDomainUnavailableError();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a4 + 2))(v5, 0, v6);

}

- (BOOL)isAllowedToProvideItemID:(id)a3 toConsumerWithIdentifier:(id)a4
{
  return 0;
}

- (void)bulkItemChanges:(id)a3 changedFields:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, _QWORD, _QWORD))a6 + 2))(a6, 0, 0);
}

- (void)trashItemAtURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  FPNotSupportedError();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a5 + 2))(v6, 0, v7);

}

- (void)movingItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB3628];
  v7 = a5;
  objc_msgSend(v6, "providingRequiredResponse");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v7, v8);

}

- (void)workingSetDidChangeWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)stateWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  FPNotSupportedError();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v4, 0, v5);

}

- (void)wakeForPushWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  FPDomainUnavailableError();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v4, v5);

}

- (void)resolveConflictAtURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  FPNotSupportedError();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);

}

- (void)listRemoteVersionsOfItemAtURL:(id)a3 includeCachedVersions:(BOOL)a4 completionHandler:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  FPNotSupportedError();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, id))a5 + 2))(v6, 0, MEMORY[0x1E0C9AA60], v7);

}

- (void)fetchThumbnailsAtURL:(id)a3 versions:(id)a4 size:(CGSize)a5 perThumbnailCompletionHandler:(id)a6 completionHandler:(id)a7
{
  id v8;
  id v9;

  v8 = a7;
  FPNotSupportedError();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a7 + 2))(v8, v9);

}

- (void)hasNonUploadedFilesWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  FPNotSupportedError();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v4, 0, v5);

}

- (void)hierarchyForURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  FPNotSupportedError();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a5 + 2))(v6, MEMORY[0x1E0C9AA60], v7);

}

- (void)signalNeedsReindexFromScratchWithDropReason:(unint64_t)a3 completionHandler:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (void)didUpdateAlternateContentsDocumentForDocumentWithURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  FPNotSupportedError();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v6, v7);

}

- (void)reindexAllItemsWithDropReason:(unint64_t)a3 completionHandler:(id)a4
{
  void (**v4)(id, void *);
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = (void (**)(id, void *))a4;
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[FPDDomainDeadEndBackend reindexAllItemsWithDropReason:completionHandler:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  FPNotSupportedError();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v13);

}

- (void)reindexItemsWithIndexReason:(int64_t)a3 identifiers:(id)a4 completionHandler:(id)a5
{
  void (**v5)(id, void *);
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void (**)(id, void *))a5;
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[FPDDomainDeadEndBackend reindexItemsWithIndexReason:identifiers:completionHandler:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  FPNotSupportedError();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v14);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materializationError, 0);
  objc_destroyWeak((id *)&self->_domain);
}

- (void)reindexAllItemsWithDropReason:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_1CF55F000, a1, a3, "[ERROR] Error reindex all items on unsupported backend", a5, a6, a7, a8, 0);
}

- (void)reindexItemsWithIndexReason:(uint64_t)a3 identifiers:(uint64_t)a4 completionHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_1CF55F000, a1, a3, "[ERROR] Error reindex items with identifiers on unsupported backend", a5, a6, a7, a8, 0);
}

@end
