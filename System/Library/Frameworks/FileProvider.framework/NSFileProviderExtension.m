@implementation NSFileProviderExtension

+ (BOOL)writePlaceholderAtURL:(NSURL *)placeholderURL withMetadata:(NSDictionary *)metadata error:(NSError *)error
{
  return +[NSFileProviderManager writePlaceholderAtURL:withDictionary:error:](NSFileProviderManager, "writePlaceholderAtURL:withDictionary:error:", placeholderURL, metadata, error);
}

+ (NSURL)placeholderURLForURL:(NSURL *)url
{
  return +[NSFileProviderManager placeholderURLForURL:](NSFileProviderManager, "placeholderURLForURL:", url);
}

- (NSFileProviderExtension)init
{
  NSFileProviderExtension *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *extensionDispatchQueue;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *memberQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSFileProviderExtension;
  v2 = -[NSFileProviderExtension init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("serial dispatch queue for extension requests", v3);
    extensionDispatchQueue = v2->_extensionDispatchQueue;
    v2->_extensionDispatchQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("NSFileProviderExtension member sync queue", v6);
    memberQueue = v2->_memberQueue;
    v2->_memberQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (NSString)providerIdentifier
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__22;
  v11 = __Block_byref_object_dispose__22;
  v12 = 0;
  -[NSFileProviderExtension memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__NSFileProviderExtension_providerIdentifier__block_invoke;
  v6[3] = &unk_1E444B900;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __45__NSFileProviderExtension_providerIdentifier__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v4;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

- (NSURL)documentStorageURL
{
  void *v2;
  void *v3;
  void *v4;

  -[NSFileProviderExtension domain](self, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSFileProviderManager managerForDomain:](NSFileProviderManager, "managerForDomain:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentStorageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (NSURL)URLForItemWithPersistentIdentifier:(NSFileProviderItemIdentifier)identifier
{
  NSString *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = identifier;
  +[NSFileProviderManager legacyDefaultManager](NSFileProviderManager, "legacyDefaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentStorageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("NSFileProviderRootContainerItemIdentifier")))
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(v5, "URLByAppendingPathComponent:", v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (NSURL *)v7;
}

+ (id)_resourceIDOfURL:(id)a3 outError:(id *)a4
{
  id v5;

  v5 = 0;
  objc_msgSend(a3, "getResourceValue:forKey:error:", &v5, *MEMORY[0x1E0C99948], a4);
  return v5;
}

+ (id)_relativeComponentsOfURL:(id)a3 fromBaseURL:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v15;
  unint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  void *v25;
  id v26;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v7;
  v10 = (id)objc_msgSend(v7, "copy");
  v25 = v8;
  v26 = 0;
  +[NSFileProviderExtension _resourceIDOfURL:outError:](NSFileProviderExtension, "_resourceIDOfURL:outError:", v8, &v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v26;
  v13 = v12;
  if (v11)
    v14 = v12 == 0;
  else
    v14 = 0;
  if (v14)
  {
    i = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSFileProviderExtension.m"), 190, CFSTR("%s cannot resolve the resource ID of the URL (%@). Error: %@"), "+[NSFileProviderExtension _relativeComponentsOfURL:fromBaseURL:]", v25, v13);
  for (i = 0; ; ++i)
  {

LABEL_8:
    v17 = v10;
    +[NSFileProviderExtension _resourceIDOfURL:outError:](NSFileProviderExtension, "_resourceIDOfURL:outError:", v10, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v18;
    if (v18)
    {
      if ((objc_msgSend(v18, "isEqual:", v11) & 1) != 0)
        break;
    }
    objc_msgSend(v10, "lastPathComponent");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      v22 = v24;
      NSLog(CFSTR("The last component of URL (%@) cannot be extracted."), v24);
      objc_msgSend(v9, "removeAllObjects");
      goto LABEL_19;
    }
    v20 = (void *)v19;
    objc_msgSend(v9, "insertObject:atIndex:", v19, 0);
    objc_msgSend(v10, "URLByDeletingLastPathComponent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v21, "isEqual:", v10) & 1) != 0)
    {
      v22 = v24;
LABEL_17:
      objc_msgSend(v9, "removeAllObjects");

      goto LABEL_19;
    }
    v10 = v21;

    if (i >= 0x64)
    {
      v22 = v24;
      NSLog(CFSTR("The URL (%@) cannot be analyzed into components, even after %d tries."), v24, 100);
      v17 = v10;
      goto LABEL_17;
    }

  }
  v22 = v24;
LABEL_19:

  return v9;
}

- (NSFileProviderItemIdentifier)persistentIdentifierForItemAtURL:(NSURL *)url
{
  NSURL *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;

  v3 = url;
  +[NSFileProviderManager legacyDefaultManager](NSFileProviderManager, "legacyDefaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentStorageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "fp_relationshipToItemAtURL:", v3) == 1)
  {
    v6 = CFSTR("NSFileProviderRootContainerItemIdentifier");
  }
  else
  {
    +[NSFileProviderExtension _relativeComponentsOfURL:fromBaseURL:](NSFileProviderExtension, "_relativeComponentsOfURL:fromBaseURL:", v3, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "componentsJoinedByString:", CFSTR("/"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NSLog(CFSTR("%s is called with a URL %@ that is not contained within documentStorageURL (%@)."), "-[NSFileProviderExtension persistentIdentifierForItemAtURL:]", v3, v5);
      v6 = 0;
    }

  }
  return (NSFileProviderItemIdentifier)v6;
}

- (void)providePlaceholderAtURL:(NSURL *)url completionHandler:(void *)completionHandler
{
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", url, completionHandler);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileProviderExtension.m"), 246, CFSTR("%@ must implement method %@ and not call super"), v6, v7);

}

- (void)startProvidingItemAtURL:(NSURL *)url completionHandler:(void *)completionHandler
{
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", url, completionHandler);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileProviderExtension.m"), 252, CFSTR("%@ must implement method %@ and not call super"), v6, v7);

}

- (void)itemChangedAtURL:(NSURL *)url
{
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", url);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileProviderExtension.m"), 258, CFSTR("%@ must implement method %@ and not call super"), v5, v6);

}

- (NSFileProviderItem)itemForIdentifier:(NSFileProviderItemIdentifier)identifier error:(NSError *)error
{
  return 0;
}

- (void)evictItemWithIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileProviderExtension.m"), 277, CFSTR("%@ must implement method %@ and not call super"), v6, v7);

}

- (void)itemChanged:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 contents:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *, _QWORD);
  void *v17;
  void *v18;
  id v19;
  id WeakRetained;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = (void (**)(id, void *, _QWORD))a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_class();
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileProviderExtension.m"), 337, CFSTR("%@ %@ called with object of unexpected class %@."), v22, v23, objc_opt_class());

  }
  objc_msgSend(v13, "itemIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  -[NSFileProviderExtension itemForIdentifier:error:](self, "itemForIdentifier:error:", v17, &v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v24;

  if (v18)
  {
    if (hasConflictingVersion(v18, v14, a5))
    {
      v16[2](v16, v18, 0);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_extensionContext);
      objc_msgSend(WeakRetained, "applyFieldChangesToItem:baseVersion:changedFields:contents:lastKnownVendorItem:extensionInstance:completionHandler:", v13, v14, a5, v15, v18, self, v16);

    }
  }
  else
  {
    ((void (**)(id, void *, id))v16)[2](v16, 0, v19);
  }

}

- (void)changeItem:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 contents:(id)a6 options:(unint64_t)a7 completionHandler:(id)a8
{
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v13 = a8;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __99__NSFileProviderExtension_changeItem_baseVersion_changedFields_contents_options_completionHandler___block_invoke;
  v15[3] = &unk_1E444C548;
  v16 = v13;
  v14 = v13;
  -[NSFileProviderExtension itemChanged:baseVersion:changedFields:contents:completionHandler:](self, "itemChanged:baseVersion:changedFields:contents:completionHandler:", a3, a4, a5, a6, v15);

}

uint64_t __99__NSFileProviderExtension_changeItem_baseVersion_changedFields_contents_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)fetchContentsForItemWithIdentifier:(id)a3 version:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NSFileProviderExtension URLForItemWithPersistentIdentifier:](self, "URLForItemWithPersistentIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (!v9)
    {
LABEL_11:
      v18 = (void *)objc_opt_new();
      objc_msgSend(v18, "setTotalUnitCount:", 1);
      objc_msgSend(v18, "setCancellable:", 1);
      v19 = MEMORY[0x1E0C809B0];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __88__NSFileProviderExtension_fetchContentsForItemWithIdentifier_version_completionHandler___block_invoke;
      v28[3] = &unk_1E4449A40;
      v28[4] = self;
      v20 = v11;
      v29 = v20;
      objc_msgSend(v18, "setCancellationHandler:", v28);
      v23[0] = v19;
      v23[1] = 3221225472;
      v23[2] = __88__NSFileProviderExtension_fetchContentsForItemWithIdentifier_version_completionHandler___block_invoke_2;
      v23[3] = &unk_1E444E5C0;
      v27 = v10;
      v23[4] = self;
      v24 = v20;
      v25 = v8;
      v26 = v9;
      -[NSFileProviderExtension providePlaceholderAtURL:completionHandler:](self, "providePlaceholderAtURL:completionHandler:", v24, v23);

      goto LABEL_14;
    }
    v31[0] = 0;
    -[NSFileProviderExtension itemForIdentifier:error:](self, "itemForIdentifier:error:", v8, v31);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v31[0];
    if (v12)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v15 = v13;
        goto LABEL_10;
      }
      v30 = v13;
      -[NSFileProviderExtension itemForIdentifier:error:](self, "itemForIdentifier:error:", v8, &v30);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v30;

      objc_msgSend(v14, "itemVersion");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isEqual:", v9))
      {

LABEL_10:
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "fileProviderErrorForNonExistentItemWithIdentifier:", v8);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, v21);

      v18 = (void *)objc_opt_new();
      v13 = v15;
    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v13);
      v18 = (void *)objc_opt_new();
    }

    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "fileProviderErrorForNonExistentItemWithIdentifier:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, v17);

  v18 = (void *)objc_opt_new();
LABEL_14:

  return v18;
}

uint64_t __88__NSFileProviderExtension_fetchContentsForItemWithIdentifier_version_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopProvidingItemAtURL:", *(_QWORD *)(a1 + 40));
}

void __88__NSFileProviderExtension_fetchContentsForItemWithIdentifier_version_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __88__NSFileProviderExtension_fetchContentsForItemWithIdentifier_version_completionHandler___block_invoke_3;
    v7[3] = &unk_1E444E5C0;
    v5 = *(id *)(a1 + 64);
    v6 = *(_QWORD *)(a1 + 32);
    v11 = v5;
    v7[4] = v6;
    v8 = *(id *)(a1 + 48);
    v9 = *(id *)(a1 + 56);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v3, "startProvidingItemAtURL:completionHandler:", v4, v7);

  }
}

void __88__NSFileProviderExtension_fetchContentsForItemWithIdentifier_version_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v3 = a2;
  if (!v3)
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v18 = 0;
    objc_msgSend(v5, "itemForIdentifier:error:", v6, &v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v18;
    if (v7)
    {
      if (*(_QWORD *)(a1 + 48) && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v7, "itemVersion");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 48)) & 1) == 0)
        {
          v13 = *(_QWORD *)(a1 + 64);
          objc_msgSend(MEMORY[0x1E0CB35C8], "fileProviderErrorForNonExistentItemWithIdentifier:", *(_QWORD *)(a1 + 40));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v13 + 16))(v13, 0, 0, v14);

          goto LABEL_11;
        }

      }
      v9 = *(void **)(a1 + 56);
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "memberQueue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __88__NSFileProviderExtension_fetchContentsForItemWithIdentifier_version_completionHandler___block_invoke_4;
      v15[3] = &unk_1E444E598;
      v17 = *(id *)(a1 + 64);
      v16 = v7;
      v12 = (id)objc_msgSend(v9, "fp_copyToTempFolderWithFilename:queue:precomputedItemSize:completion:", v10, v11, 0, v15);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
LABEL_11:

    goto LABEL_12;
  }
  v4 = v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_12:

}

uint64_t __88__NSFileProviderExtension_fetchContentsForItemWithIdentifier_version_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

- (id)fetchContentsForItemWithIdentifier:(id)a3 version:(id)a4 usingExistingContentsAtURL:(id)a5 existingVersion:(id)a6 completionHandler:(id)a7
{
  return -[NSFileProviderExtension fetchContentsForItemWithIdentifier:version:completionHandler:](self, "fetchContentsForItemWithIdentifier:version:completionHandler:", a3, a4, a7, a6);
}

+ (BOOL)_initializedByViewServices
{
  return 0;
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  void *v5;
  uint64_t v6;
  id obj;

  obj = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_class();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileProviderExtension.m"), 481, CFSTR("extension context is of an invalid type of class (expected: %@, actual: %@)"), v6, objc_opt_class());

  }
  objc_storeWeak((id *)&self->_extensionContext, obj);

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NSFileProviderExtension domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p for %@>"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)_withRequest:(id)a3 execute:(id)a4
{
  void (**v7)(_QWORD);
  NSFileProviderRequest *currentRequest;
  id v9;

  v9 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_storeStrong((id *)&self->_currentRequest, a3);
  v7[2](v7);
  currentRequest = self->_currentRequest;
  self->_currentRequest = 0;

}

- (id)currentRequest
{
  return self->_currentRequest;
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueue, a3);
}

- (NSURL)memberQueueDocumentStorageURL
{
  return self->_memberQueueDocumentStorageURL;
}

- (void)setMemberQueueDocumentStorageURL:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueDocumentStorageURL, a3);
}

- (NSString)memberQueueProviderIdentifier
{
  return self->_memberQueueProviderIdentifier;
}

- (void)setMemberQueueProviderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSFileProviderDomain)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_memberQueueProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_memberQueueDocumentStorageURL, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_destroyWeak((id *)&self->_extensionContext);
  objc_storeStrong((id *)&self->_extensionDispatchQueue, 0);
}

- (void)importDocumentAtURL:(NSURL *)fileURL toParentItemIdentifier:(NSFileProviderItemIdentifier)parentItemIdentifier completionHandler:(void *)completionHandler
{
  void (**v5)(void *, _QWORD, void *);
  NSObject *v6;
  void *v7;

  v5 = completionHandler;
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[NSFileProviderExtension(NSFileProviderActions) importDocumentAtURL:toParentItemIdentifier:completionHandler:].cold.1();

  FPNotSupportedError();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, 0, v7);

}

- (void)createDirectoryWithName:(NSString *)directoryName inParentItemIdentifier:(NSFileProviderItemIdentifier)parentItemIdentifier completionHandler:(void *)completionHandler
{
  void (**v5)(void *, _QWORD, void *);
  NSObject *v6;
  void *v7;

  v5 = completionHandler;
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[NSFileProviderExtension(NSFileProviderActions) importDocumentAtURL:toParentItemIdentifier:completionHandler:].cold.1();

  FPNotSupportedError();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, 0, v7);

}

- (void)renameItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier toName:(NSString *)itemName completionHandler:(void *)completionHandler
{
  void (**v5)(void *, _QWORD, void *);
  NSObject *v6;
  void *v7;

  v5 = completionHandler;
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[NSFileProviderExtension(NSFileProviderActions) importDocumentAtURL:toParentItemIdentifier:completionHandler:].cold.1();

  FPNotSupportedError();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, 0, v7);

}

- (void)reparentItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier toParentItemWithIdentifier:(NSFileProviderItemIdentifier)parentItemIdentifier newName:(NSString *)newName completionHandler:(void *)completionHandler
{
  void (**v6)(void *, _QWORD, void *);
  NSObject *v7;
  void *v8;

  v6 = completionHandler;
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[NSFileProviderExtension(NSFileProviderActions) importDocumentAtURL:toParentItemIdentifier:completionHandler:].cold.1();

  FPNotSupportedError();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 0, v8);

}

- (void)trashItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler
{
  void (**v4)(void *, _QWORD, void *);
  NSObject *v5;
  void *v6;

  v4 = completionHandler;
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[NSFileProviderExtension(NSFileProviderActions) importDocumentAtURL:toParentItemIdentifier:completionHandler:].cold.1();

  FPNotSupportedError();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0, v6);

}

- (void)untrashItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier toParentItemIdentifier:(NSFileProviderItemIdentifier)parentItemIdentifier completionHandler:(void *)completionHandler
{
  void (**v5)(void *, _QWORD, void *);
  NSObject *v6;
  void *v7;

  v5 = completionHandler;
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[NSFileProviderExtension(NSFileProviderActions) importDocumentAtURL:toParentItemIdentifier:completionHandler:].cold.1();

  FPNotSupportedError();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, 0, v7);

}

- (void)deleteItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler
{
  void (**v4)(void *, void *);
  NSObject *v5;
  void *v6;

  v4 = completionHandler;
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[NSFileProviderExtension(NSFileProviderActions) importDocumentAtURL:toParentItemIdentifier:completionHandler:].cold.1();

  FPNotSupportedError();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v6);

}

- (void)setLastUsedDate:(NSDate *)lastUsedDate forItemIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler
{
  void (**v5)(void *, _QWORD, void *);
  NSObject *v6;
  void *v7;

  v5 = completionHandler;
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[NSFileProviderExtension(NSFileProviderActions) setLastUsedDate:forItemIdentifier:completionHandler:].cold.1();

  FPNotSupportedError();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, 0, v7);

}

- (void)setTagData:(NSData *)tagData forItemIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler
{
  void (**v5)(void *, _QWORD, void *);
  NSObject *v6;
  void *v7;

  v5 = completionHandler;
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[NSFileProviderExtension(NSFileProviderActions) setLastUsedDate:forItemIdentifier:completionHandler:].cold.1();

  FPNotSupportedError();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, 0, v7);

}

- (void)setFavoriteRank:(NSNumber *)favoriteRank forItemIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler
{
  void (**v5)(void *, _QWORD, void *);
  NSObject *v6;
  void *v7;

  v5 = completionHandler;
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[NSFileProviderExtension(NSFileProviderActions) setLastUsedDate:forItemIdentifier:completionHandler:].cold.1();

  FPNotSupportedError();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, 0, v7);

}

- (id)fetchPublishingURLForItemIdentifier:(id)a3 completionHandler:(id)a4
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = (void (**)(id, _QWORD, void *))a4;
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[NSFileProviderExtension(NSFileProviderActions) setLastUsedDate:forItemIdentifier:completionHandler:].cold.1();

  FPNotSupportedError();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0, v6);

  v7 = (void *)objc_opt_new();
  return v7;
}

- (id)disconnectWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = (void (**)(id, void *))a4;
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[NSFileProviderExtension(NSFileProviderActions) setLastUsedDate:forItemIdentifier:completionHandler:].cold.1();

  FPNotSupportedError();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v6);

  v7 = (void *)objc_opt_new();
  return v7;
}

- (id)performActionWithIdentifier:(id)a3 onItemsWithIdentifiers:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, void *);
  NSObject *v9;
  void *v10;
  void *v11;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *))a5;
  fp_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v13 = (void *)objc_opt_class();
    v14 = v13;
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412802;
    v17 = v13;
    v18 = 2112;
    v19 = v15;
    v20 = 2112;
    v21 = v7;
    _os_log_debug_impl(&dword_1A0A34000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ must implement method %@ and not call super (action identifier: %@)", (uint8_t *)&v16, 0x20u);

  }
  FPNotSupportedError();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v10);

  v11 = (void *)objc_opt_new();
  return v11;
}

- (void)handleEventsForBackgroundURLSession:(id)a3 completionHandler:(id)a4
{
  void (**v4)(_QWORD);
  NSObject *v5;

  v4 = (void (**)(_QWORD))a4;
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[NSFileProviderExtension(NSFileProviderActions) setLastUsedDate:forItemIdentifier:completionHandler:].cold.1();

  v4[2](v4);
}

- (NSProgress)fetchThumbnailsForItemIdentifiers:(NSArray *)itemIdentifiers requestedSize:(CGSize)size perThumbnailCompletionHandler:(void *)perThumbnailCompletionHandler completionHandler:(void *)completionHandler
{
  void *v7;
  void *v8;

  v7 = completionHandler;
  FPNotSupportedError();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void *, void *))completionHandler + 2))(v7, v8);

  return 0;
}

- (NSArray)supportedServiceSourcesForItemIdentifier:(NSFileProviderItemIdentifier)itemIdentifier error:(NSError *)error
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)enumeratorForContainerItemIdentifier:(NSFileProviderItemIdentifier)containerItemIdentifier error:(NSError *)error
{
  NSObject *v5;

  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[NSFileProviderExtension(NSFileProviderActions) setLastUsedDate:forItemIdentifier:completionHandler:].cold.1();

  if (error)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)enumeratorForSearchQuery:(id)a3 error:(id *)a4
{
  NSObject *v5;

  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[NSFileProviderExtension(NSFileProviderActions) setLastUsedDate:forItemIdentifier:completionHandler:].cold.1();

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (void)materializedItemsDidChangeWithCompletionHandler:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (BOOL)_fp_itemsMightBeTheSame:(id)a3 otherItem:(id)a4 url:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  int v15;
  char v16;
  int v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  int v31;
  id v32;
  int v33;
  id v34;
  id v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t i;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  NSObject *v49;
  BOOL v50;
  void *v52;
  void *v53;
  char v54;
  NSObject *v55;
  void *v56;
  id obj;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  char v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  stat v68;
  stat v69;
  _BYTE v70[128];
  _QWORD v71[8];

  v71[5] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  contentTypeOfItem(v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  contentTypeOfItem(v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  v14 = v12;
  v15 = isFolderContentType(v13);
  if (v15 != isFolderContentType(v14)
    || (areCompatibleContentTypes(v13, v14, (void *)*MEMORY[0x1E0CEC5F8]) & 1) == 0)
  {

LABEL_28:
    fp_current_or_default_log();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      -[NSFileProviderExtension(CreateItem) _fp_itemsMightBeTheSame:otherItem:url:].cold.1();
    goto LABEL_30;
  }
  v16 = areCompatibleContentTypes(v13, v14, (void *)*MEMORY[0x1E0CEC428]);

  if ((v16 & 1) == 0)
    goto LABEL_28;
  v17 = isFolderContentType(v13);
  if ((fpfs_supports_parent_mtime_iopolicy() & 1) != 0 || !v17)
  {
    objc_msgSend(v8, "contentModificationDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSince1970");
    v20 = v19;

    objc_msgSend(v9, "contentModificationDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeIntervalSince1970");
    v23 = v22;

    if (trunc(v20) != trunc(v23))
    {
      fp_current_or_default_log();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        -[NSFileProviderExtension(CreateItem) _fp_itemsMightBeTheSame:otherItem:url:].cold.4();
LABEL_30:

      v50 = 0;
      goto LABEL_31;
    }
  }
  if ((v17 & 1) == 0)
  {
    v62 = 0;
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "fileExistsAtPath:isDirectory:", v25, &v62);

      if (v62)
      {
        objc_msgSend(v9, "itemIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSFileProviderExtension URLForItemWithPersistentIdentifier:](self, "URLForItemWithPersistentIdentifier:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = v10;
        v29 = v27;
        memset(&v69, 0, sizeof(v69));
        memset(&v68, 0, sizeof(v68));
        objc_msgSend(v28, "path");
        v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v31 = lstat((const char *)objc_msgSend(v30, "fileSystemRepresentation"), &v69);

        if ((v31 & 0x80000000) == 0)
        {
          -[NSObject path](v29, "path");
          v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v33 = lstat((const char *)objc_msgSend(v32, "fileSystemRepresentation"), &v68);

          if ((v33 & 0x80000000) == 0
            && (v69.st_mode & 0xF000) == 0x4000
            && (v68.st_mode & 0xF000) == 0x4000
            && v69.st_mtimespec.tv_sec == v68.st_mtimespec.tv_sec)
          {
            v67 = 0;
            objc_msgSend(v28, "path");
            v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            if ((fpfs_num_entries((const char *)objc_msgSend(v34, "fileSystemRepresentation"), 0, (_DWORD *)&v67 + 1) & 0x80000000) == 0)
            {
              v56 = v28;
              -[NSObject path](v29, "path");
              v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v36 = fpfs_num_entries((const char *)objc_msgSend(v35, "fileSystemRepresentation"), 0, &v67);

              if (v36 < 0 || HIDWORD(v67) != (_DWORD)v67)
              {

              }
              else
              {
                v37 = *MEMORY[0x1E0C998D8];
                v71[0] = *MEMORY[0x1E0C99998];
                v71[1] = v37;
                v38 = *MEMORY[0x1E0C99A28];
                v71[2] = *MEMORY[0x1E0C999D0];
                v71[3] = v38;
                v71[4] = *MEMORY[0x1E0C99A18];
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 5);
                v39 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v61 = (void *)v39;
                objc_msgSend(v40, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v56, v39, 16, 0);
                v41 = (void *)objc_claimAutoreleasedReturnValue();

                v65 = 0u;
                v66 = 0u;
                v63 = 0u;
                v64 = 0u;
                obj = v41;
                v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
                if (v60)
                {
                  v58 = v29;
                  v59 = *(_QWORD *)v64;
                  while (2)
                  {
                    for (i = 0; i != v60; ++i)
                    {
                      if (*(_QWORD *)v64 != v59)
                        objc_enumerationMutation(obj);
                      v43 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
                      objc_msgSend(v43, "relativePath");
                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NSObject URLByAppendingPathComponent:](v29, "URLByAppendingPathComponent:", v44);
                      v45 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v43, "resourceValuesForKeys:error:", v61, 0);
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v45, "resourceValuesForKeys:error:", v61, 0);
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      v48 = objc_msgSend(v46, "isEqual:", v47);

                      if (!v48)
                      {
                        v29 = v58;
                        goto LABEL_48;
                      }
                      v29 = v58;
                    }
                    v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
                    if (v60)
                      continue;
                    break;
                  }
                }
                LOBYTE(v48) = 1;
LABEL_48:

                if ((v48 & 1) != 0)
                  goto LABEL_45;
              }
LABEL_42:
              fp_current_or_default_log();
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
                -[NSFileProviderExtension(CreateItem) _fp_itemsMightBeTheSame:otherItem:url:].cold.3();

LABEL_45:
              v50 = 1;
LABEL_46:

              goto LABEL_31;
            }

          }
        }

        goto LABEL_42;
      }
    }
    objc_msgSend(v8, "documentSize");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "documentSize");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v52, "isEqual:", v53);

    if ((v54 & 1) == 0)
    {
      fp_current_or_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        -[NSFileProviderExtension(CreateItem) _fp_itemsMightBeTheSame:otherItem:url:].cold.2();
      v50 = 0;
      goto LABEL_46;
    }
  }
  v50 = 1;
LABEL_31:

  return v50;
}

- (void)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 contents:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  const char *v33;
  id v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  id WeakRetained;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  const char *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  _QWORD v52[5];
  id v53;
  id v54;
  id v55;
  id v56;
  unint64_t v57;
  SEL v58;
  unint64_t v59;

  v13 = a3;
  v14 = a5;
  v15 = a7;
  v16 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileProviderExtension.m"), 876, CFSTR("Item passed into %@ is not an FPItem subclass"), v44);

    }
  }
  v17 = MEMORY[0x1E0C809B0];
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __107__NSFileProviderExtension_CreateItem__createItemBasedOnTemplate_fields_contents_options_completionHandler___block_invoke;
  v52[3] = &unk_1E444E610;
  v57 = a6;
  v52[4] = self;
  v18 = v16;
  v53 = v18;
  v19 = v14;
  v54 = v19;
  v20 = v15;
  v55 = v18;
  v56 = v20;
  v58 = a2;
  v59 = a4;
  v21 = (void *)MEMORY[0x1A1B00850](v52);
  if (objc_msgSend(v18, "isFolder") && (objc_msgSend(v18, "isPackage") & 1) == 0)
  {
    objc_msgSend(v18, "filename");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "parentItemIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSFileProviderExtension createDirectoryWithName:inParentItemIdentifier:completionHandler:](self, "createDirectoryWithName:inParentItemIdentifier:completionHandler:", v41, v42, v21);

    goto LABEL_23;
  }
  objc_msgSend(v18, "typeIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CA5C78]);
  if (v19 || (v23 & 1) == 0)
  {

    goto LABEL_13;
  }
  objc_msgSend(v18, "symlinkTargetPath");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
LABEL_15:
    if ((a6 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileProviderExtension.m"), 983, CFSTR("cannot import document without an URL"));

    }
    (*((void (**)(id, _QWORD, _QWORD))v20 + 2))(v20, 0, 0);
    v19 = 0;
    goto LABEL_23;
  }
  v48 = a2;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fp_secureTempDirectoryIgnoringPersona");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  v27 = objc_msgSend(v25, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v26, 1, 0, &v51);
  v28 = v51;
  v47 = v26;
  if ((v27 & 1) != 0)
  {
    v46 = v25;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "UUIDString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "URLByAppendingPathComponent:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "symlinkTargetPath");
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v33 = (const char *)objc_msgSend(v32, "fileSystemRepresentation");
    v34 = objc_retainAutorelease(v31);
    LODWORD(v33) = symlink(v33, (const char *)objc_msgSend(v34, "fileSystemRepresentation"));

    if ((_DWORD)v33)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
      v35 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v46, "removeItemAtURL:error:", v34, 0);
      (*((void (**)(id, _QWORD, uint64_t))v20 + 2))(v20, 0, v35);
      v19 = 0;
      v36 = 1;
      v28 = (id)v35;
    }
    else
    {
      v19 = v34;
      v36 = 0;
    }

    v17 = MEMORY[0x1E0C809B0];
    v25 = v46;
  }
  else
  {
    (*((void (**)(id, _QWORD, id))v20 + 2))(v20, 0, v28);
    v19 = 0;
    v36 = 1;
  }

  a2 = v48;
  if (!v36)
  {
LABEL_13:
    if (v19)
    {
      v37 = v17;
      WeakRetained = objc_loadWeakRetained((id *)&self->_extensionContext);
      objc_msgSend(v18, "parentItemIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "filename");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v37;
      v49[1] = 3221225472;
      v49[2] = __107__NSFileProviderExtension_CreateItem__createItemBasedOnTemplate_fields_contents_options_completionHandler___block_invoke_319;
      v49[3] = &unk_1E444E638;
      v50 = v21;
      objc_msgSend(WeakRetained, "importDocumentAtURL:intoFolderWithIdentifier:originalName:extensionInstance:reply:", v19, v39, v40, self, v49);

      goto LABEL_23;
    }
    goto LABEL_15;
  }
LABEL_23:

}

void __107__NSFileProviderExtension_CreateItem__createItemBasedOnTemplate_fields_contents_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  FPItem *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  FPItem *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if ((*(_BYTE *)(a1 + 72) & 1) != 0 && objc_msgSend(v6, "fp_isFileProviderError:", -1001))
    {
      objc_msgSend(v7, "fp_userInfoItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8
        && objc_msgSend(v8, "conformsToProtocol:", &unk_1EE5D23B0)
        && objc_msgSend(*(id *)(a1 + 32), "_fp_itemsMightBeTheSame:otherItem:url:", *(_QWORD *)(a1 + 40), v9, *(_QWORD *)(a1 + 48)))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_25:

        goto LABEL_26;
      }

    }
  }
  else if (v5)
  {
    contentTypeOfItem(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v9, "length") && (dyld_program_sdk_at_least() & 1) == 0)
    {
      fp_current_or_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0A34000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] Working around missing type identifier for item created by legacy file provider", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 40), "typeIdentifier");
      v12 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v12;
    }
    v13 = [FPItem alloc];
    objc_msgSend(*(id *)(a1 + 56), "providerDomainID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parentItemIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filename");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[FPItem initWithProviderDomainID:itemIdentifier:parentItemIdentifier:filename:typeIdentifier:](v13, "initWithProviderDomainID:itemIdentifier:parentItemIdentifier:filename:typeIdentifier:", v14, v15, v16, v17, v9);

    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("NSFileProviderExtension.m"), 910, CFSTR("item %@ was returned with incomplete properties"), v5);

    }
    objc_msgSend(*(id *)(a1 + 56), "lastUsedDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPItem setLastUsedDate:](v18, "setLastUsedDate:", v20);

    objc_msgSend(*(id *)(a1 + 56), "tags");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPItem setTags:](v18, "setTags:", v21);

    objc_msgSend(*(id *)(a1 + 56), "favoriteRank");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPItem setFavoriteRank:](v18, "setFavoriteRank:", v22);

    objc_msgSend(*(id *)(a1 + 56), "creationDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPItem setCreationDate:](v18, "setCreationDate:", v23);

    objc_msgSend(*(id *)(a1 + 56), "contentModificationDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPItem setContentModificationDate:](v18, "setContentModificationDate:", v24);

    -[FPItem setFileSystemFlags:](v18, "setFileSystemFlags:", objc_msgSend(*(id *)(a1 + 56), "fileSystemFlags"));
    objc_msgSend(*(id *)(a1 + 56), "extendedAttributes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPItem setExtendedAttributes:](v18, "setExtendedAttributes:", v25);

    objc_msgSend(*(id *)(a1 + 56), "quarantineBlob");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPItem setQuarantineBlob:](v18, "setQuarantineBlob:", v26);

    -[FPItem setContentZoneRoot:](v18, "setContentZoneRoot:", objc_msgSend(*(id *)(a1 + 56), "isContentZoneRoot"));
    -[FPItem setTypeAndCreator:](v18, "setTypeAndCreator:", objc_msgSend(*(id *)(a1 + 56), "typeAndCreator"));
    v27 = *(_QWORD *)(a1 + 88) & 0xFFFFFFFFFFFFFFF8;
    if (v27)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "itemVersion");
        v28 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = objc_opt_new();
      }
      v29 = (void *)v28;
      v30 = *(void **)(a1 + 32);
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __107__NSFileProviderExtension_CreateItem__createItemBasedOnTemplate_fields_contents_options_completionHandler___block_invoke_313;
      v31[3] = &unk_1E444E5E8;
      v32 = v5;
      v33 = *(id *)(a1 + 64);
      objc_msgSend(v30, "changeItem:baseVersion:changedFields:contents:options:completionHandler:", v18, v29, v27, 0, 0x10000, v31);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

    goto LABEL_25;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_26:

}

void __107__NSFileProviderExtension_CreateItem__createItemBasedOnTemplate_fields_contents_options_completionHandler___block_invoke_313(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  char v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  void (*v14)(void);
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a5;
  if (!v8)
  {
LABEL_6:
    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_10;
  }
  v9 = dyld_program_sdk_at_least();
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((v9 & 1) != 0)
  {
    if (v11)
    {
      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v8, "fp_prettyDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_1A0A34000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ created, but the provider failed to apply properties afterwards. Returning error: %@", (uint8_t *)&v17, 0x16u);

    }
    goto LABEL_6;
  }
  if (v11)
  {
    v15 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "fp_prettyDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v15;
    v19 = 2112;
    v20 = v16;
    _os_log_impl(&dword_1A0A34000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ created, but the provider failed to apply properties afterwards. Error ignored: %@", (uint8_t *)&v17, 0x16u);

  }
  v14 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_10:
  v14();

}

uint64_t __107__NSFileProviderExtension_CreateItem__createItemBasedOnTemplate_fields_contents_options_completionHandler___block_invoke_319(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteItemWithIdentifier:(id)a3 baseVersion:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  id obj;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__22;
  v26 = __Block_byref_object_dispose__22;
  v27 = 0;
  obj = 0;
  -[NSFileProviderExtension itemForIdentifier:error:](self, "itemForIdentifier:error:", v10, &obj);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v27, obj);
  if (v13)
  {
    if (a5 >> 31 || !hasConflictingVersion(v13, v11, 1uLL))
    {
      if ((a5 & 1) != 0
        || (objc_msgSend(v13, "childItemCount"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v16 = objc_msgSend(v15, "longValue"),
            v15,
            !v16))
      {
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __102__NSFileProviderExtension_DeleteItem__deleteItemWithIdentifier_baseVersion_options_completionHandler___block_invoke;
        v17[3] = &unk_1E444E660;
        v17[4] = self;
        v19 = v12;
        v18 = v10;
        v20 = &v22;
        -[NSFileProviderExtension deleteItemWithIdentifier:completionHandler:](self, "deleteItemWithIdentifier:completionHandler:", v18, v17);

        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderErrorDomain"), -1007, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v12 + 2))(v12, v14);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fileProviderErrorForRejectedDeletionOfItem:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v12 + 2))(v12, v14);
    }

  }
  else
  {
    (*((void (**)(id, uint64_t))v12 + 2))(v12, v23[5]);
  }
LABEL_11:
  _Block_object_dispose(&v22, 8);

}

void __102__NSFileProviderExtension_DeleteItem__deleteItemWithIdentifier_baseVersion_options_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  id WeakRetained;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id obj;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  v5 = objc_msgSend(WeakRetained, "usesFPFS");

  if (v3 || (v5 & 1) == 0)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v6 = (void *)a1[4];
    v7 = a1[5];
    v8 = *(_QWORD *)(a1[7] + 8);
    obj = *(id *)(v8 + 40);
    objc_msgSend(v6, "itemForIdentifier:error:", v7, &obj);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v8 + 40), obj);
    v10 = a1[6];
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fileProviderErrorForRejectedDeletionOfItem:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, 0);
    }

  }
}

- (void)importDidFinishWithCompletionHandler:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

@end
