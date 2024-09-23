@implementation EMContentRepresentation

+ (NSXPCInterface)contentRequestDelegateInterface
{
  if (contentRequestDelegateInterface_onceToken != -1)
    dispatch_once(&contentRequestDelegateInterface_onceToken, &__block_literal_global_5);
  return (NSXPCInterface *)(id)contentRequestDelegateInterface_contentRequestDelegateInterface;
}

+ (NSXPCInterface)distantContentRepresentationInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__EMContentRepresentation_distantContentRepresentationInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (distantContentRepresentationInterface_onceToken != -1)
    dispatch_once(&distantContentRepresentationInterface_onceToken, block);
  return (NSXPCInterface *)(id)distantContentRepresentationInterface_interface;
}

void __64__EMContentRepresentation_distantContentRepresentationInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF25FAF0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)distantContentRepresentationInterface_interface;
  distantContentRepresentationInterface_interface = v2;

  objc_msgSend((id)distantContentRepresentationInterface_interface, "setInterface:forSelector:argumentIndex:ofReply:", distantContentRepresentationInterface_interface, sel_requestRepresentationForItemWithObjectID_options_delegate_completionHandler_, 0, 1);
  v4 = (void *)distantContentRepresentationInterface_interface;
  objc_msgSend(*(id *)(a1 + 32), "contentRequestDelegateInterface");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:");

  if (_os_feature_enabled_impl() && (EMIsGreymatterSupportedWithOverride() & 1) != 0
    || _os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
  {
    v5 = (void *)distantContentRepresentationInterface_interface;
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:");

  }
}

void __58__EMContentRepresentation_contentRequestDelegateInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF25FA90);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)contentRequestDelegateInterface_contentRequestDelegateInterface;
  contentRequestDelegateInterface_contentRequestDelegateInterface = v0;

  v2 = (void *)contentRequestDelegateInterface_contentRequestDelegateInterface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:");

  v3 = (void *)contentRequestDelegateInterface_contentRequestDelegateInterface;
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:");

  v6 = (void *)contentRequestDelegateInterface_contentRequestDelegateInterface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:");

  v7 = (void *)contentRequestDelegateInterface_contentRequestDelegateInterface;
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:");

}

+ (NSObject)_temporaryURLForClientIdentifier:(void *)a3 preferredFilename:(void *)a4 pathExtension:(_QWORD *)a5 cleanupInvocable:(_QWORD *)a6 error:
{
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[2];
  uint64_t v40;
  id v41;
  _QWORD v42[6];

  v42[4] = *MEMORY[0x1E0C80C00];
  v32 = a2;
  v33 = a3;
  v31 = a4;
  objc_opt_self();
  NSTemporaryDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v10;
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v12;
  v42[2] = v32;
  objc_msgSend(MEMORY[0x1E0CB3940], "ef_UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  LOBYTE(a4) = objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v15, 1, 0, &v38);
  v17 = v38;
  v18 = v17;
  if ((a4 & 1) == 0)
  {
    if (a6)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v40 = *MEMORY[0x1E0CB3388];
      v41 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("EMErrorDomain"), 2048, v21);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    EMLogCategoryMessageLoading();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v18, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[EMContentRepresentation _temporaryURLForClientIdentifier:preferredFilename:pathExtension:cleanupInvocable:error:].cold.1();
    }
    v23 = 0;
    goto LABEL_12;
  }
  if (objc_msgSend(v33, "length"))
  {
    v19 = v33;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "ef_UUID");
    v24 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v24;
  }
  v25 = (void *)MEMORY[0x1E0C99E98];
  v39[0] = v15;
  v33 = v19;
  objc_msgSend(v19, "stringByAppendingPathExtension:", v31);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "fileURLWithPathComponents:", v28);
  v23 = objc_claimAutoreleasedReturnValue();

  if (a5)
  {
    v29 = (void *)MEMORY[0x1E0D1EED0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __115__EMContentRepresentation__temporaryURLForClientIdentifier_preferredFilename_pathExtension_cleanupInvocable_error___block_invoke;
    v34[3] = &unk_1E70F2158;
    v23 = v23;
    v35 = v23;
    v36 = v16;
    v37 = v15;
    objc_msgSend(v29, "tokenWithInvocationBlock:", v34);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v22 = v35;
LABEL_12:

  }
  return v23;
}

void __115__EMContentRepresentation__temporaryURLForClientIdentifier_preferredFilename_pathExtension_cleanupInvocable_error___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  EMLogCategoryMessageLoading();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = a1[4];
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1B99BB000, v2, OS_LOG_TYPE_INFO, "Cleaning up representation URL %@", buf, 0xCu);
  }

  v4 = (void *)a1[5];
  v5 = a1[6];
  v9 = 0;
  v6 = objc_msgSend(v4, "removeItemAtPath:error:", v5, &v9);
  v7 = v9;
  if ((v6 & 1) == 0)
  {
    EMLogCategoryMessageLoading();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __115__EMContentRepresentation__temporaryURLForClientIdentifier_preferredFilename_pathExtension_cleanupInvocable_error___block_invoke_cold_1();
    }

  }
}

+ (id)temporaryURLWithData:(id)a3 clientIdentifier:(id)a4 preferredFilename:(id)a5 pathExtension:(id)a6 cleanupInvocable:(id *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  +[EMContentRepresentation _temporaryURLForClientIdentifier:preferredFilename:pathExtension:cleanupInvocable:error:]((uint64_t)a1, v15, v16, v17, a7, a8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v27 = 0;
    v19 = objc_msgSend(v14, "writeToURL:options:error:", v18, 1073741825, &v27);
    v20 = v27;
    v21 = v20;
    if ((v19 & 1) != 0)
    {
      v22 = v18;
    }
    else
    {
      if (a8)
      {
        v23 = (void *)MEMORY[0x1E0CB35C8];
        v28 = *MEMORY[0x1E0CB3388];
        v29[0] = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("EMErrorDomain"), 2048, v24);
        *a8 = (id)objc_claimAutoreleasedReturnValue();

      }
      EMLogCategoryMessageLoading();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v21, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        +[EMContentRepresentation temporaryURLWithData:clientIdentifier:preferredFilename:pathExtension:cleanupInvocable:error:].cold.1();
      }

      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)temporaryURLWithOriginalFileURL:(id)a3 clientIdentifier:(id)a4 preferredFilename:(id)a5 pathExtension:(id)a6 cleanupInvocable:(id *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  +[EMContentRepresentation _temporaryURLForClientIdentifier:preferredFilename:pathExtension:cleanupInvocable:error:]((uint64_t)a1, v15, v16, v17, a7, a8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v20 = objc_msgSend(v19, "copyItemAtURL:toURL:error:", v14, v18, &v28);
    v21 = v28;

    if ((v20 & 1) != 0)
    {
      v22 = v18;
    }
    else
    {
      if (a8)
      {
        v23 = (void *)MEMORY[0x1E0CB35C8];
        v35 = *MEMORY[0x1E0CB3388];
        v36[0] = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("EMErrorDomain"), 2048, v24);
        *a8 = (id)objc_claimAutoreleasedReturnValue();

      }
      EMLogCategoryMessageLoading();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v21, "ef_publicDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v30 = v14;
        v31 = 2112;
        v32 = v18;
        v33 = 2114;
        v34 = v27;
        _os_log_error_impl(&dword_1B99BB000, v25, OS_LOG_TYPE_ERROR, "failed to copy data from %@ to URL %@: %{public}@", buf, 0x20u);

      }
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)_initWithRelatedItems:(void *)a3 securityInformation:
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  EMMessageContentCachedMetadata *v12;
  id v13;
  objc_super v15;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)EMContentRepresentation;
    a1 = (id *)objc_msgSendSuper2(&v15, sel_init);
    if (a1)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0D1EED0]);
      v8 = a1[1];
      a1[1] = v7;

      v9 = objc_msgSend(v5, "copy");
      v10 = (void *)v9;
      if (v9)
        v11 = (void *)v9;
      else
        v11 = (void *)MEMORY[0x1E0C9AA60];
      objc_storeStrong(a1 + 7, v11);

      objc_storeStrong(a1 + 8, a3);
      v12 = -[EMMessageContentCachedMetadata initWithDelegate:]([EMMessageContentCachedMetadata alloc], "initWithDelegate:", a1);
      v13 = a1[16];
      a1[16] = v12;

    }
  }

  return a1;
}

- (id)_initWithSandboxedURLWrapper:(void *)a3 relatedItems:(void *)a4 securityInformation:
{
  id v8;
  id v9;
  id v10;
  id *v11;
  id *v12;
  void *v13;
  EMMessageContentCachedMetadata *v14;
  id v15;
  id *v16;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1 && v8)
  {
    v11 = -[EMContentRepresentation _initWithRelatedItems:securityInformation:](a1, v9, v10);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 15, a2);
      objc_msgSend(v12[15], "url");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v12 + 16) = objc_msgSend(v13, "startAccessingSecurityScopedResource");

      v14 = -[EMMessageContentCachedMetadata initWithDelegate:]([EMMessageContentCachedMetadata alloc], "initWithDelegate:", v12);
      v15 = v12[16];
      v12[16] = v14;

    }
    a1 = v12;
    v16 = a1;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (EMContentRepresentation)initWithContentURL:(id)a3 relatedItems:(id)a4 securityInformation:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  EMContentRepresentation *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F068]), "initWithFileURL:readOnly:", v8, 1);
  v12 = (EMContentRepresentation *)-[EMContentRepresentation _initWithSandboxedURLWrapper:relatedItems:securityInformation:]((id *)&self->super.isa, v11, v9, v10);

  return v12;
}

- (EMContentRepresentation)initWithData:(id)a3 clientIdentifier:(id)a4 preferredFilename:(id)a5 extension:(id)a6 relatedItems:(id)a7 securityInformation:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  EMContentRepresentation *v22;
  EMContentRepresentation *v23;
  EMContentRepresentation *v24;
  id v26;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v26 = 0;
  objc_msgSend((id)objc_opt_class(), "temporaryURLWithData:clientIdentifier:preferredFilename:pathExtension:cleanupInvocable:error:", v14, v15, v16, v17, &v26, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v26;
  if (v20)
  {
    v22 = -[EMContentRepresentation initWithContentURL:relatedItems:securityInformation:](self, "initWithContentURL:relatedItems:securityInformation:", v20, v18, v19);
    v23 = v22;
    if (v22)
      -[EFInvocationToken addInvocable:](v22->_invocable, "addInvocable:", v21);
    else
      objc_msgSend(v21, "invoke");
    self = v23;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (EMContentRepresentation)initWithOriginalFileURL:(id)a3 clientIdentifier:(id)a4 preferredFilename:(id)a5 extension:(id)a6 relatedItems:(id)a7 securityInformation:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  EMContentRepresentation *v22;
  EMContentRepresentation *v23;
  EMContentRepresentation *v24;
  id v26;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v26 = 0;
  objc_msgSend((id)objc_opt_class(), "temporaryURLWithOriginalFileURL:clientIdentifier:preferredFilename:pathExtension:cleanupInvocable:error:", v14, v15, v16, v17, &v26, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v26;
  if (v20)
  {
    v22 = -[EMContentRepresentation initWithContentURL:relatedItems:securityInformation:](self, "initWithContentURL:relatedItems:securityInformation:", v20, v18, v19);
    v23 = v22;
    if (v22)
      -[EFInvocationToken addInvocable:](v22->_invocable, "addInvocable:", v21);
    else
      objc_msgSend(v21, "invoke");
    self = v23;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (EMContentRepresentation)initWithData:(id)a3 clientIdentifier:(id)a4 extension:(id)a5 relatedItems:(id)a6 securityInformation:(id)a7
{
  return -[EMContentRepresentation initWithData:clientIdentifier:preferredFilename:extension:relatedItems:securityInformation:](self, "initWithData:clientIdentifier:preferredFilename:extension:relatedItems:securityInformation:", a3, a4, 0, a5, a6, a7);
}

- (EMContentRepresentation)initWithContentMessage:(id)a3 data:(id)a4 clientIdentifier:(id)a5 preferredFilename:(id)a6 extension:(id)a7
{
  id v13;
  EMContentRepresentation *v14;
  EMContentRepresentation *v15;

  v13 = a3;
  v14 = -[EMContentRepresentation initWithData:clientIdentifier:preferredFilename:extension:relatedItems:securityInformation:](self, "initWithData:clientIdentifier:preferredFilename:extension:relatedItems:securityInformation:", a4, a5, a6, a7, MEMORY[0x1E0C9AA60], 0);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_contentMessage, a3);

  return v15;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_claimedScopedResource)
  {
    -[EFSandboxedURLWrapper url](self->_urlWrapper, "url");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopAccessingSecurityScopedResource");

  }
  -[EMContentRepresentation invalidate](self, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)EMContentRepresentation;
  -[EMContentRepresentation dealloc](&v4, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMContentRepresentation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  EMContentRepresentation *v11;
  uint64_t v12;
  CSSearchableItem *searchableItem;
  uint64_t v14;
  EMListUnsubscribeCommand *unsubscribeCommand;
  uint64_t v16;
  NSURL *publicMessageURL;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSArray *replyToList;
  uint64_t v24;
  EMMessage *contentMessage;
  uint64_t v26;
  EMMessageHeaders *requestedHeaders;
  uint64_t v28;
  NSData *cachedMetadataJSON;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_urlWrapper"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("EFPropertyKey_relatedContentItems"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_securityInformation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (EMContentRepresentation *)-[EMContentRepresentation _initWithSandboxedURLWrapper:relatedItems:securityInformation:]((id *)&self->super.isa, v5, v9, v10);
  if (v11)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_searchableItem"));
    v12 = objc_claimAutoreleasedReturnValue();
    searchableItem = v11->_searchableItem;
    v11->_searchableItem = (CSSearchableItem *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_unsubscribeCommand"));
    v14 = objc_claimAutoreleasedReturnValue();
    unsubscribeCommand = v11->_unsubscribeCommand;
    v11->_unsubscribeCommand = (EMListUnsubscribeCommand *)v14;

    v11->_hasMoreContent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_hasMoreContent"));
    v11->_remainingByteCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("EFPropertyKey_remainingByteCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_publicMessageURL"));
    v16 = objc_claimAutoreleasedReturnValue();
    publicMessageURL = v11->_publicMessageURL;
    v11->_publicMessageURL = (NSURL *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("EFPropertyKey_replyToList"));
    v22 = objc_claimAutoreleasedReturnValue();
    replyToList = v11->_replyToList;
    v11->_replyToList = (NSArray *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_contentMessage"));
    v24 = objc_claimAutoreleasedReturnValue();
    contentMessage = v11->_contentMessage;
    v11->_contentMessage = (EMMessage *)v24;

    v11->_transportType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_transportType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_requestedHeaders"));
    v26 = objc_claimAutoreleasedReturnValue();
    requestedHeaders = v11->_requestedHeaders;
    v11->_requestedHeaders = (EMMessageHeaders *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_cachedMetadataJSON"));
    v28 = objc_claimAutoreleasedReturnValue();
    cachedMetadataJSON = v11->_cachedMetadataJSON;
    v11->_cachedMetadataJSON = (NSData *)v28;

  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  EFSandboxedURLWrapper *urlWrapper;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  if (self)
    urlWrapper = self->_urlWrapper;
  else
    urlWrapper = 0;
  v15 = v4;
  objc_msgSend(v4, "encodeObject:forKey:", urlWrapper, CFSTR("EFPropertyKey_urlWrapper"));
  -[EMContentRepresentation contentMessage](self, "contentMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_contentMessage"));

  -[EMContentRepresentation relatedContentItems](self, "relatedContentItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v7, CFSTR("EFPropertyKey_relatedContentItems"));

  -[EMContentRepresentation securityInformation](self, "securityInformation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v8, CFSTR("EFPropertyKey_securityInformation"));

  -[EMContentRepresentation searchableItem](self, "searchableItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v9, CFSTR("EFPropertyKey_searchableItem"));

  -[EMContentRepresentation unsubscribeCommand](self, "unsubscribeCommand");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v10, CFSTR("EFPropertyKey_unsubscribeCommand"));

  objc_msgSend(v15, "encodeBool:forKey:", -[EMContentRepresentation hasMoreContent](self, "hasMoreContent"), CFSTR("EFPropertyKey_hasMoreContent"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[EMContentRepresentation remainingByteCount](self, "remainingByteCount"), CFSTR("EFPropertyKey_remainingByteCount"));
  -[EMContentRepresentation publicMessageURL](self, "publicMessageURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v11, CFSTR("EFPropertyKey_publicMessageURL"));

  -[EMContentRepresentation replyToList](self, "replyToList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v12, CFSTR("EFPropertyKey_replyToList"));

  objc_msgSend(v15, "encodeInteger:forKey:", -[EMContentRepresentation transportType](self, "transportType"), CFSTR("EFPropertyKey_transportType"));
  -[EMContentRepresentation requestedHeaders](self, "requestedHeaders");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v13, CFSTR("EFPropertyKey_requestedHeaders"));

  -[EMContentRepresentation cachedMetadataJSON](self, "cachedMetadataJSON");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v14, CFSTR("EFPropertyKey_cachedMetadataJSON"));

}

- (NSString)debugDescription
{
  EFSandboxedURLWrapper *urlWrapper;
  const __CFString *v4;
  const __CFString *v5;
  int64_t remainingByteCount;
  EFInvocationToken *invocable;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  void *v17;
  EFSandboxedURLWrapper *v18;
  void *v19;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v15 = objc_opt_class();
  -[EMContentRepresentation publicMessageURL](self, "publicMessageURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    urlWrapper = self->_urlWrapper;
  else
    urlWrapper = 0;
  v18 = urlWrapper;
  if (self->_claimedScopedResource)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (self->_hasMoreContent)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  remainingByteCount = self->_remainingByteCount;
  invocable = self->_invocable;
  -[EMContentRepresentation relatedContentItems](self, "relatedContentItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EMContentRepresentation transportType](self, "transportType");
  -[EMContentRepresentation securityInformation](self, "securityInformation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMContentRepresentation searchableItem](self, "searchableItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMContentRepresentation unsubscribeCommand](self, "unsubscribeCommand");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMContentRepresentation replyToList](self, "replyToList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p> publicMessageURL=%@, wrappedURL=%@, extended-sandbox=%@, hasMoreContent=%@ (%lld bytes), invocable=%@, related-items=%@, transport=%d, security-information=%@, searchableItem=%@, unsubscribeCommand=%@, replyToList=%@"), v15, self, v19, v18, v4, v5, remainingByteCount, invocable, v17, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (NSString)ef_publicDescription
{
  void *v3;
  int v4;
  EFSandboxedURLWrapper *urlWrapper;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  int64_t remainingByteCount;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  const __CFString *v22;
  int64_t v23;
  int64_t v24;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;

  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternal");

  if (v4)
  {
    if (self)
      urlWrapper = self->_urlWrapper;
    else
      urlWrapper = 0;
    v6 = (void *)MEMORY[0x1E0D1EF48];
    -[EFSandboxedURLWrapper url](urlWrapper, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "partiallyRedactedStringForString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)MEMORY[0x1E0CB3940];
    v27 = objc_opt_class();
    -[EMContentRepresentation publicMessageURL](self, "publicMessageURL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_claimedScopedResource)
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    v26 = v10;
    if (self->_hasMoreContent)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    remainingByteCount = self->_remainingByteCount;
    -[EMContentRepresentation relatedContentItems](self, "relatedContentItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[EMContentRepresentation transportType](self, "transportType");
    -[EMContentRepresentation securityInformation](self, "securityInformation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMContentRepresentation searchableItem](self, "searchableItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMContentRepresentation unsubscribeCommand](self, "unsubscribeCommand");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMContentRepresentation cachedMetadataJSON](self, "cachedMetadataJSON");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("<%@: %p> publicMessageURL=%@, URL=%@, extended-sandbox=%@, hasMoreContent=%@ (%lld bytes), related-items=%@, transport=%d, security-information=%@, searchableItem=%@, unsubscribeCommand=%@, cachedMetadataJSON=%{BOOL}d"), v27, self, v30, v9, v26, v11, remainingByteCount, v13, v14, v15, v16, v17, v18 != 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = (void *)MEMORY[0x1E0CB3940];
    v20 = objc_opt_class();
    if (self->_claimedScopedResource)
      v21 = CFSTR("YES");
    else
      v21 = CFSTR("NO");
    if (self->_hasMoreContent)
      v22 = CFSTR("YES");
    else
      v22 = CFSTR("NO");
    v23 = self->_remainingByteCount;
    -[EMContentRepresentation relatedContentItems](self, "relatedContentItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[EMContentRepresentation transportType](self, "transportType");
    -[EMContentRepresentation securityInformation](self, "securityInformation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMContentRepresentation searchableItem](self, "searchableItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMContentRepresentation unsubscribeCommand](self, "unsubscribeCommand");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMContentRepresentation cachedMetadataJSON](self, "cachedMetadataJSON");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("<%@: %p> extended-sandbox=%@, hasMoreContent=%@ (%lld bytes), related-items=%@, transport=%d, security-information=%@, searchableItem=%@, unsubscribeCommand=%@, cachedMetadataJSON=%{BOOL}d"), v20, self, v21, v22, v23, v9, v24, v30, v13, v15, v16 != 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v19;
}

- (NSURL)contentURL
{
  return (NSURL *)-[EFSandboxedURLWrapper url](self->_urlWrapper, "url");
}

- (void)addInvalidationHandler:(id)a3
{
  -[EFInvocationToken addInvocationBlock:](self->_invocable, "addInvocationBlock:", a3);
}

- (void)invalidate
{
  -[EFInvocationToken invoke](self->_invocable, "invoke");
}

- (id)_distantLoaderBlockForContentItem:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "distantContentRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, a1);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__EMContentRepresentation__distantLoaderBlockForContentItem___block_invoke;
    v10[3] = &unk_1E70F26C8;
    objc_copyWeak(&v13, &location);
    v11 = v5;
    v12 = v4;
    v6 = v4;
    v7 = v5;
    v8 = (void *)MEMORY[0x1BCCC8C10](v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __61__EMContentRepresentation__distantLoaderBlockForContentItem___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *v10;
  id WeakRetained;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  EMLogCategoryMessageLoading();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "requestedRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v25 = v13;
    v26 = 2114;
    v27 = v14;
    _os_log_impl(&dword_1B99BB000, v12, OS_LOG_TYPE_DEFAULT, "requesting representation %{public}@ for objectID %{public}@", buf, 0x16u);

  }
  v17 = a1 + 32;
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v17 + 8);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __61__EMContentRepresentation__distantLoaderBlockForContentItem___block_invoke_137;
  v21[3] = &unk_1E70F26A0;
  objc_copyWeak(&v23, v10);
  v18 = v9;
  v22 = v18;
  objc_msgSend(v16, "requestRepresentationForItemWithObjectID:options:delegate:completionHandler:", v15, v7, v8, v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v23);
  return v19;
}

void __61__EMContentRepresentation__distantLoaderBlockForContentItem___block_invoke_137(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7 && v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__EMContentRepresentation__distantLoaderBlockForContentItem___block_invoke_2;
    v12[3] = &unk_1E70F1FA0;
    v11 = v8;
    v13 = v11;
    objc_msgSend(WeakRetained, "addInvalidationHandler:", v12);
    objc_msgSend(v11, "setDistantContentRepresentation:", v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

id __61__EMContentRepresentation__distantLoaderBlockForContentItem___block_invoke_2()
{
  return (id)objc_opt_self();
}

- (void)setDistantContentRepresentation:(id)a3
{
  EMContentRepresentation *v6;
  EFSandboxedURLWrapper *urlWrapper;
  uint64_t v8;
  EMContentRepresentation *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  EMContentRepresentation *v18;
  EMContentRepresentation *v19;
  void *v20;
  _QWORD v21[4];
  EMContentRepresentation *v22;
  _QWORD v23[4];
  EMContentRepresentation *v24;
  id v25;
  _QWORD v26[4];
  EMContentRepresentation *v27;
  id v28;
  id location;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  EMContentRepresentation *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = (EMContentRepresentation *)a3;
  if (self->_distantContentRepresentation)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMContentRepresentation.m"), 366, CFSTR("distantContentRepresentation should only be set once"));

  }
  if (v6 != self)
  {
    objc_storeStrong((id *)&self->_distantContentRepresentation, a3);
    urlWrapper = self->_urlWrapper;
    v8 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __59__EMContentRepresentation_setDistantContentRepresentation___block_invoke;
    v34[3] = &unk_1E70F1FA0;
    v9 = v6;
    v35 = v9;
    -[EFSandboxedURLWrapper addInvalidationHandler:](urlWrapper, "addInvalidationHandler:", v34);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[EMContentRepresentation relatedContentItems](self, "relatedContentItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v31 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          -[EMContentRepresentation _distantLoaderBlockForContentItem:](self, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setLoaderBlock:", v15);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v11);
    }

    -[EMContentRepresentation contentMessage](self, "contentMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[EMContentRepresentation _distantLoaderBlockForContentItem:](self, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setLoaderBlock:", v17);

    }
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v26[0] = v8;
    v26[1] = 3221225472;
    v26[2] = __59__EMContentRepresentation_setDistantContentRepresentation___block_invoke_2;
    v26[3] = &unk_1E70F26F0;
    objc_copyWeak(&v28, &location);
    v18 = v9;
    v27 = v18;
    -[EMContentRepresentation setRequestMoreContentBlock:](self, "setRequestMoreContentBlock:", v26);
    v23[0] = v8;
    v23[1] = 3221225472;
    v23[2] = __59__EMContentRepresentation_setDistantContentRepresentation___block_invoke_3;
    v23[3] = &unk_1E70F2718;
    objc_copyWeak(&v25, &location);
    v19 = v18;
    v24 = v19;
    -[EMContentRepresentation setListUnsubscribeBlock:](self, "setListUnsubscribeBlock:", v23);
    if (_os_feature_enabled_impl() && (EMIsGreymatterSupportedWithOverride() & 1) != 0
      || _os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
    {
      v21[0] = v8;
      v21[1] = 3221225472;
      v21[2] = __59__EMContentRepresentation_setDistantContentRepresentation___block_invoke_4;
      v21[3] = &unk_1E70F2740;
      v22 = v19;
      -[EMContentRepresentation setRequestOriginalContentMessagesInReplyToContentItemBlock:](self, "setRequestOriginalContentMessagesInReplyToContentItemBlock:", v21);

    }
    objc_destroyWeak(&v25);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

  }
}

uint64_t __59__EMContentRepresentation_setDistantContentRepresentation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

id __59__EMContentRepresentation_setDistantContentRepresentation___block_invoke_2(uint64_t a1, void *a2)
{
  void (**v3)(id, id, _QWORD);
  id WeakRetained;
  void *v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(WeakRetained, "hasMoreContent") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "requestUpdatedRepresentationWithCompletion:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3[2](v3, WeakRetained, 0);
    v5 = 0;
  }

  return v5;
}

id __59__EMContentRepresentation_setDistantContentRepresentation___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void (**v5)(id, _QWORD);
  id WeakRetained;
  void *v7;
  void *v8;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "unsubscribeCommand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "performUnsubscribeAction:completion:", a2, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5[2](v5, 0);
    v8 = 0;
  }

  return v8;
}

uint64_t __59__EMContentRepresentation_setDistantContentRepresentation___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestOriginalContentMessagesInReplyToContentItemWithCompletion:", a2);
}

- (id)requestAdditionalContentWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  EMLogCategoryMessageLoading();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[EMContentRepresentation ef_publicDescription](self, "ef_publicDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "requesting additional content for content representation %{public}@", buf, 0xCu);

  }
  -[EMContentRepresentation requestMoreContentBlock](self, "requestMoreContentBlock");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__EMContentRepresentation_requestAdditionalContentWithCompletion___block_invoke;
  v11[3] = &unk_1E70F2768;
  objc_copyWeak(&v13, &location);
  v8 = v4;
  v12 = v8;
  ((void (**)(_QWORD, _QWORD *))v7)[2](v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __66__EMContentRepresentation_requestAdditionalContentWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "mergeUpdatedRepresentation:", v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)mergeUpdatedRepresentation:(id)a3
{
  EMContentRepresentation *v4;
  EMContentRepresentation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (EMContentRepresentation *)a3;
  v5 = v4;
  if (v4 != self)
  {
    -[EMContentRepresentation relatedContentItems](v4, "relatedContentItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMContentRepresentation setRelatedContentItems:](self, "setRelatedContentItems:", v6);

    -[EMContentRepresentation securityInformation](v5, "securityInformation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMContentRepresentation setSecurityInformation:](self, "setSecurityInformation:", v7);

    -[EMContentRepresentation setHasMoreContent:](self, "setHasMoreContent:", -[EMContentRepresentation hasMoreContent](v5, "hasMoreContent"));
    -[EMContentRepresentation setRemainingByteCount:](self, "setRemainingByteCount:", -[EMContentRepresentation remainingByteCount](v5, "remainingByteCount"));
    -[EMContentRepresentation distantContentRepresentation](self, "distantContentRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      -[EMContentRepresentation relatedContentItems](self, "relatedContentItems", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v9);
            v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
            -[EMContentRepresentation _distantLoaderBlockForContentItem:](self, v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setLoaderBlock:", v14);

          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v10);
      }

    }
  }

}

- (id)performUnsubscribeAction:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  -[EMContentRepresentation listUnsubscribeBlock](self, "listUnsubscribeBlock");
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__EMContentRepresentation_performUnsubscribeAction_completion___block_invoke;
  v11[3] = &unk_1E70F2550;
  v8 = v6;
  v12 = v8;
  ((void (**)(_QWORD, unint64_t, _QWORD *))v7)[2](v7, a3, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __63__EMContentRepresentation_performUnsubscribeAction_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestOriginalContentMessagesInReplyToContentItemWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[EMContentRepresentation requestOriginalContentMessagesInReplyToContentItemBlock](self, "requestOriginalContentMessagesInReplyToContentItemBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[EMContentRepresentation requestOriginalContentMessagesInReplyToContentItemBlock](self, "requestOriginalContentMessagesInReplyToContentItemBlock");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __92__EMContentRepresentation_requestOriginalContentMessagesInReplyToContentItemWithCompletion___block_invoke;
    v7[3] = &unk_1E70F2790;
    v8 = v4;
    ((void (**)(_QWORD, _QWORD *))v6)[2](v6, v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("Unable to retrieve original contents"));
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void (**)(_QWORD, _QWORD)))v4 + 2))(v4, 0, v6);
  }

}

uint64_t __92__EMContentRepresentation_requestOriginalContentMessagesInReplyToContentItemWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)showRemoteImages
{
  if (self)
    self = (EMContentRepresentation *)self->_cachedMetadata;
  return -[EMContentRepresentation showRemoteImages](self, "showRemoteImages");
}

- (void)setShowRemoteImages:(BOOL)a3
{
  if (self)
    self = (EMContentRepresentation *)self->_cachedMetadata;
  -[EMContentRepresentation setShowRemoteImages:](self, "setShowRemoteImages:", a3);
}

- (BOOL)skipMessageReformatting
{
  if (self)
    self = (EMContentRepresentation *)self->_cachedMetadata;
  return -[EMContentRepresentation skipMessageReformatting](self, "skipMessageReformatting");
}

- (void)setSkipMessageReformatting:(BOOL)a3
{
  if (self)
    self = (EMContentRepresentation *)self->_cachedMetadata;
  -[EMContentRepresentation setSkipMessageReformatting:](self, "setSkipMessageReformatting:", a3);
}

- (EMContentItem)contentItem
{
  return (EMContentItem *)objc_loadWeakRetained((id *)&self->_contentItem);
}

- (void)setContentItem:(id)a3
{
  objc_storeWeak((id *)&self->_contentItem, a3);
}

- (NSURL)publicMessageURL
{
  return self->_publicMessageURL;
}

- (void)setPublicMessageURL:(id)a3
{
  objc_storeStrong((id *)&self->_publicMessageURL, a3);
}

- (NSArray)replyToList
{
  return self->_replyToList;
}

- (void)setReplyToList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (EMMessage)contentMessage
{
  return self->_contentMessage;
}

- (void)setContentMessage:(id)a3
{
  objc_storeStrong((id *)&self->_contentMessage, a3);
}

- (NSArray)relatedContentItems
{
  return self->_relatedContentItems;
}

- (void)setRelatedContentItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (EMSecurityInformation)securityInformation
{
  return self->_securityInformation;
}

- (void)setSecurityInformation:(id)a3
{
  objc_storeStrong((id *)&self->_securityInformation, a3);
}

- (CSSearchableItem)searchableItem
{
  return self->_searchableItem;
}

- (void)setSearchableItem:(id)a3
{
  objc_storeStrong((id *)&self->_searchableItem, a3);
}

- (EMListUnsubscribeCommand)unsubscribeCommand
{
  return self->_unsubscribeCommand;
}

- (void)setUnsubscribeCommand:(id)a3
{
  objc_storeStrong((id *)&self->_unsubscribeCommand, a3);
}

- (BOOL)hasMoreContent
{
  return self->_hasMoreContent;
}

- (void)setHasMoreContent:(BOOL)a3
{
  self->_hasMoreContent = a3;
}

- (int64_t)remainingByteCount
{
  return self->_remainingByteCount;
}

- (void)setRemainingByteCount:(int64_t)a3
{
  self->_remainingByteCount = a3;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (EMMessageHeaders)requestedHeaders
{
  return self->_requestedHeaders;
}

- (void)setRequestedHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_requestedHeaders, a3);
}

- (NSData)cachedMetadataJSON
{
  return self->_cachedMetadataJSON;
}

- (void)setCachedMetadataJSON:(id)a3
{
  objc_storeStrong((id *)&self->_cachedMetadataJSON, a3);
}

- (_EMDistantContentRepresentation)distantContentRepresentation
{
  return self->_distantContentRepresentation;
}

- (id)requestMoreContentBlock
{
  return self->_requestMoreContentBlock;
}

- (void)setRequestMoreContentBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)listUnsubscribeBlock
{
  return self->_listUnsubscribeBlock;
}

- (void)setListUnsubscribeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)requestOriginalContentMessagesInReplyToContentItemBlock
{
  return self->_requestOriginalContentMessagesInReplyToContentItemBlock;
}

- (void)setRequestOriginalContentMessagesInReplyToContentItemBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestOriginalContentMessagesInReplyToContentItemBlock, 0);
  objc_storeStrong(&self->_listUnsubscribeBlock, 0);
  objc_storeStrong(&self->_requestMoreContentBlock, 0);
  objc_storeStrong((id *)&self->_distantContentRepresentation, 0);
  objc_storeStrong((id *)&self->_cachedMetadata, 0);
  objc_storeStrong((id *)&self->_urlWrapper, 0);
  objc_storeStrong((id *)&self->_cachedMetadataJSON, 0);
  objc_storeStrong((id *)&self->_requestedHeaders, 0);
  objc_storeStrong((id *)&self->_unsubscribeCommand, 0);
  objc_storeStrong((id *)&self->_searchableItem, 0);
  objc_storeStrong((id *)&self->_securityInformation, 0);
  objc_storeStrong((id *)&self->_relatedContentItems, 0);
  objc_storeStrong((id *)&self->_contentMessage, 0);
  objc_storeStrong((id *)&self->_replyToList, 0);
  objc_storeStrong((id *)&self->_publicMessageURL, 0);
  objc_destroyWeak((id *)&self->_contentItem);
  objc_storeStrong((id *)&self->_invocable, 0);
}

+ (void)_temporaryURLForClientIdentifier:preferredFilename:pathExtension:cleanupInvocable:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_1(&dword_1B99BB000, "failed to create directory %@: %{public}@", v4, v5);

  OUTLINED_FUNCTION_3_0();
}

void __115__EMContentRepresentation__temporaryURLForClientIdentifier_preferredFilename_pathExtension_cleanupInvocable_error___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_1(&dword_1B99BB000, "failed to remove URL %@: %{public}@", v4, v5);

  OUTLINED_FUNCTION_3_0();
}

+ (void)temporaryURLWithData:clientIdentifier:preferredFilename:pathExtension:cleanupInvocable:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_1(&dword_1B99BB000, "failed to write data to URL %@: %{public}@", v4, v5);

  OUTLINED_FUNCTION_3_0();
}

@end
