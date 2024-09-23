@implementation FPXV2ExtensionWrapper

- (FPXV2ExtensionWrapper)initWithDomain:(id)a3
{
  id v4;
  FPXV2ExtensionWrapper *v5;
  void *v6;
  int v7;
  int v8;
  objc_class *extensionClass;
  uint64_t v10;
  NSFileProviderExtension *extension;
  NSFileProviderExtension *v12;
  NSFileProviderExtension *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FPXV2ExtensionWrapper;
  v5 = -[FPXV2ExtensionWrapper init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("NSFileProviderDomainDefaultIdentifier"));

    if (v7)
    {

      v4 = 0;
    }
    v8 = -[objc_class instancesRespondToSelector:](v5->_extensionClass, "instancesRespondToSelector:", sel_initWithDomain_);
    extensionClass = v5->_extensionClass;
    if (v8)
    {
      v10 = objc_msgSend([extensionClass alloc], "initWithDomain:", v4);
      extension = v5->_extension;
      v5->_extension = (NSFileProviderExtension *)v10;

    }
    else
    {
      v12 = (NSFileProviderExtension *)objc_alloc_init(extensionClass);
      v13 = v5->_extension;
      v5->_extension = v12;

      if (v4)
        -[NSFileProviderExtension setDomain:](v5->_extension, "setDomain:", v4);
    }
  }

  return v5;
}

- (void)invalidate
{
  -[NSFileProviderExtension invalidate](self->_extension, "invalidate");
}

- (id)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 contents:(id)a5 options:(unint64_t)a6 request:(id)a7 completionHandler:(id)a8
{
  id v13;
  NSFileProviderExtension *extension;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v13 = a8;
  extension = self->_extension;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __101__FPXV2ExtensionWrapper_createItemBasedOnTemplate_fields_contents_options_request_completionHandler___block_invoke;
  v18[3] = &unk_1E444C548;
  v19 = v13;
  v15 = v13;
  -[NSFileProviderExtension createItemBasedOnTemplate:fields:contents:options:completionHandler:](extension, "createItemBasedOnTemplate:fields:contents:options:completionHandler:", a3, a4, a5, a6, v18);

  v16 = (void *)objc_opt_new();
  return v16;
}

uint64_t __101__FPXV2ExtensionWrapper_createItemBasedOnTemplate_fields_contents_options_request_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)deleteItemWithIdentifier:(id)a3 baseVersion:(id)a4 options:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7
{
  -[NSFileProviderExtension deleteItemWithIdentifier:baseVersion:options:completionHandler:](self->_extension, "deleteItemWithIdentifier:baseVersion:options:completionHandler:", a3, a4, a5, a7);
  return (id)objc_opt_new();
}

- (id)enumeratorForContainerItemIdentifier:(id)a3 request:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSFileProviderExtension *extension;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__11;
  v28 = __Block_byref_object_dispose__11;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__11;
  v22 = __Block_byref_object_dispose__11;
  v23 = 0;
  extension = self->_extension;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__FPXV2ExtensionWrapper_enumeratorForContainerItemIdentifier_request_error___block_invoke;
  v14[3] = &unk_1E444C570;
  v16 = &v24;
  v14[4] = self;
  v11 = v8;
  v15 = v11;
  v17 = &v18;
  -[NSFileProviderExtension _withRequest:execute:](extension, "_withRequest:execute:", v9, v14);
  if (a5)
    *a5 = objc_retainAutorelease((id)v19[5]);
  v12 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

void __76__FPXV2ExtensionWrapper_enumeratorForContainerItemIdentifier_request_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = a1[5];
  v3 = *(void **)(a1[4] + 16);
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "enumeratorForContainerItemIdentifier:error:", v2, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)enumeratorForSearch:(id)a3 request:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSFileProviderExtension *extension;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  FPXV2ExtensionWrapper *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v8 = a3;
  v9 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__11;
  v29 = __Block_byref_object_dispose__11;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__11;
  v23 = __Block_byref_object_dispose__11;
  v24 = 0;
  extension = self->_extension;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__FPXV2ExtensionWrapper_enumeratorForSearch_request_error___block_invoke;
  v14[3] = &unk_1E444C598;
  v11 = v8;
  v15 = v11;
  v16 = self;
  v17 = &v25;
  v18 = &v19;
  -[NSFileProviderExtension _withRequest:execute:](extension, "_withRequest:execute:", v9, v14);
  if (a5)
    *a5 = objc_retainAutorelease((id)v20[5]);
  v12 = (id)v26[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

void __59__FPXV2ExtensionWrapper_enumeratorForSearch_request_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "legacySearchQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "enumeratorForSearchQuery:error:", v2, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)fetchContentsForItemWithIdentifier:(id)a3 version:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSFileProviderExtension *extension;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__11;
  v29 = __Block_byref_object_dispose__11;
  v30 = 0;
  extension = self->_extension;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __94__FPXV2ExtensionWrapper_fetchContentsForItemWithIdentifier_version_request_completionHandler___block_invoke;
  v20[3] = &unk_1E444C5C0;
  v24 = &v25;
  v20[4] = self;
  v15 = v10;
  v21 = v15;
  v16 = v11;
  v22 = v16;
  v17 = v13;
  v23 = v17;
  -[NSFileProviderExtension _withRequest:execute:](extension, "_withRequest:execute:", v12, v20);
  v18 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v18;
}

void __94__FPXV2ExtensionWrapper_fetchContentsForItemWithIdentifier_version_request_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "fetchContentsForItemWithIdentifier:version:completionHandler:", a1[5], a1[6], a1[7]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[8] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)fetchContentsForItemWithIdentifier:(id)a3 version:(id)a4 usingExistingContentsAtURL:(id)a5 existingVersion:(id)a6 request:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSFileProviderExtension *extension;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__11;
  v39 = __Block_byref_object_dispose__11;
  v40 = 0;
  extension = self->_extension;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __137__FPXV2ExtensionWrapper_fetchContentsForItemWithIdentifier_version_usingExistingContentsAtURL_existingVersion_request_completionHandler___block_invoke;
  v28[3] = &unk_1E444C5E8;
  v34 = &v35;
  v28[4] = self;
  v21 = v14;
  v29 = v21;
  v22 = v15;
  v30 = v22;
  v23 = v16;
  v31 = v23;
  v24 = v17;
  v32 = v24;
  v25 = v19;
  v33 = v25;
  -[NSFileProviderExtension _withRequest:execute:](extension, "_withRequest:execute:", v18, v28);
  v26 = (id)v36[5];

  _Block_object_dispose(&v35, 8);
  return v26;
}

void __137__FPXV2ExtensionWrapper_fetchContentsForItemWithIdentifier_version_usingExistingContentsAtURL_existingVersion_request_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "fetchContentsForItemWithIdentifier:version:usingExistingContentsAtURL:existingVersion:completionHandler:", a1[5], a1[6], a1[7], a1[8], a1[9]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[10] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)itemForIdentifier:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  NSFileProviderExtension *extension;
  void (**v7)(id, void *, id);
  void *v8;
  id v9;
  void *v10;
  id v12;

  extension = self->_extension;
  v12 = 0;
  v7 = (void (**)(id, void *, id))a5;
  -[NSFileProviderExtension itemForIdentifier:error:](extension, "itemForIdentifier:error:", a3, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  v7[2](v7, v8, v9);

  v10 = (void *)objc_opt_new();
  return v10;
}

- (id)modifyItem:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 contents:(id)a6 options:(unint64_t)a7 request:(id)a8 completionHandler:(id)a9
{
  -[NSFileProviderExtension changeItem:baseVersion:changedFields:contents:options:completionHandler:](self->_extension, "changeItem:baseVersion:changedFields:contents:options:completionHandler:", a3, a4, a5, a6, a7, a9);
  return (id)objc_opt_new();
}

- (void)importDidFinishWithCompletionHandler:(id)a3
{
  -[NSFileProviderExtension importDidFinishWithCompletionHandler:](self->_extension, "importDidFinishWithCompletionHandler:", a3);
}

- (void)materializedItemsDidChangeWithCompletionHandler:(id)a3
{
  -[NSFileProviderExtension materializedItemsDidChangeWithCompletionHandler:](self->_extension, "materializedItemsDidChangeWithCompletionHandler:", a3);
}

- (id)supportedServiceSourcesForItemIdentifier:(id)a3 completionHandler:(id)a4
{
  NSFileProviderExtension *extension;
  void (**v6)(id, void *, id);
  void *v7;
  id v8;
  void *v9;
  id v11;

  extension = self->_extension;
  v11 = 0;
  v6 = (void (**)(id, void *, id))a4;
  -[NSFileProviderExtension supportedServiceSourcesForItemIdentifier:error:](extension, "supportedServiceSourcesForItemIdentifier:error:", a3, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  v6[2](v6, v7, v8);

  v9 = (void *)objc_opt_new();
  return v9;
}

- (id)performActionWithIdentifier:(id)a3 onItemsWithIdentifiers:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  uint64_t v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSFileProviderExtension performActionWithIdentifier:onItemsWithIdentifiers:completionHandler:](self->_extension, "performActionWithIdentifier:onItemsWithIdentifiers:completionHandler:", v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v12);

    v11 = objc_opt_new();
  }
  v13 = (void *)v11;

  return v13;
}

- (id)fetchThumbnailsForItemIdentifiers:(id)a3 requestedSize:(CGSize)a4 perThumbnailCompletionHandler:(id)a5 completionHandler:(id)a6
{
  return -[NSFileProviderExtension fetchThumbnailsForItemIdentifiers:requestedSize:perThumbnailCompletionHandler:completionHandler:](self->_extension, "fetchThumbnailsForItemIdentifiers:requestedSize:perThumbnailCompletionHandler:completionHandler:", a3, a5, a6, a4.width, a4.height);
}

- (BOOL)isInteractionSuppressedForIdentifier:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = -[NSFileProviderExtension isInteractionSuppressedForIdentifier:](self->_extension, "isInteractionSuppressedForIdentifier:", v4);
  else
    v5 = 0;

  return v5;
}

- (void)setInteractionSuppressed:(BOOL)a3 forIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[NSFileProviderExtension setInteractionSuppressed:forIdentifier:](self->_extension, "setInteractionSuppressed:forIdentifier:", v4, v6);

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  -[NSFileProviderExtension methodSignatureForSelector:](self->_extension, "methodSignatureForSelector:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)FPXV2ExtensionWrapper;
    -[FPXV2ExtensionWrapper methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_, a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FPXV2ExtensionWrapper;
  if (-[FPXV2ExtensionWrapper conformsToProtocol:](&v7, sel_conformsToProtocol_, v4))
    v5 = 1;
  else
    v5 = -[NSFileProviderExtension conformsToProtocol:](self->_extension, "conformsToProtocol:", v4);

  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_extension;
}

- (Class)extensionClass
{
  return self->_extensionClass;
}

- (void)setExtensionClass:(Class)a3
{
  objc_storeStrong((id *)&self->_extensionClass, a3);
}

- (NSFileProviderExtension)extension
{
  return self->_extension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_extensionClass, 0);
}

@end
