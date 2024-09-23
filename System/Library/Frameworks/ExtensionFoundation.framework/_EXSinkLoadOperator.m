@implementation _EXSinkLoadOperator

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXSinkLoadOperator)initWithCoder:(id)a3
{
  id v4;
  _EXSinkLoadOperator *v5;
  uint64_t v6;
  NSXPCListenerEndpoint *endpoint;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EXSinkLoadOperator;
  v5 = -[_EXLoadOperator _init](&v9, sel__init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endpoint"));
    v6 = objc_claimAutoreleasedReturnValue();
    endpoint = v5->_endpoint;
    v5->_endpoint = (NSXPCListenerEndpoint *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;

  v3 = a3;
  _EXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v5 = 136315650;
    v6 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtension/NSExtensionSup"
         "port/ItemProvider/EXLoadOperator.m";
    v7 = 1024;
    v8 = 229;
    v9 = 2080;
    v10 = "-[_EXSinkLoadOperator encodeWithCoder:]";
    _os_log_fault_impl(&dword_190C25000, v4, OS_LOG_TYPE_FAULT, "%s - %d: %s unexpected call in destination process", (uint8_t *)&v5, 0x1Cu);
  }

  __break(1u);
}

- (void)loadItemForTypeIdentifier:(id)a3 completionHandler:(id)a4 expectedValueClass:(Class)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  const __CFString *v41;
  void *v42;
  _QWORD v43[2];
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  _EXDefaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromClass(a5);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446978;
    v45 = "-[_EXSinkLoadOperator loadItemForTypeIdentifier:completionHandler:expectedValueClass:options:]";
    v46 = 2114;
    v47 = v10;
    v48 = 2114;
    v49 = v34;
    v50 = 2114;
    v51 = v12;
    _os_log_debug_impl(&dword_190C25000, v13, OS_LOG_TYPE_DEBUG, "%{public}s typeIdentifier: %{public}@ expectedValueClass: %{public}@ options: %{public}@", buf, 0x2Au);

  }
  if (!a5)
  {
    +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "itemProviderTypes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    _EXDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[_EXSinkLoadOperator loadItemForTypeIdentifier:completionHandler:expectedValueClass:options:].cold.1();
    goto LABEL_15;
  }
  if ((Class)objc_opt_class() == a5)
  {
    +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "itemProviderTypes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    _EXDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[_EXSinkLoadOperator loadItemForTypeIdentifier:completionHandler:expectedValueClass:options:].cold.2();
    goto LABEL_15;
  }
  if ((Class)objc_opt_class() == a5)
  {
    v19 = (void *)MEMORY[0x1E0C99E60];
    v43[0] = a5;
    v43[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if ((-[objc_class isSubclassOfClass:](a5, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || -[objc_class isSubclassOfClass:](a5, "isSubclassOfClass:", objc_opt_class()))
  {
    +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject plistAndValueTypes](v14, "plistAndValueTypes");
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v17 = (void *)v15;
LABEL_15:

    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE216820);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_resolveWithIdentifier_className_options_reply_, 0, 1);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", self->_endpoint);
  objc_msgSend(v21, "setRemoteObjectInterface:", v20);
  objc_msgSend(v21, "resume");
  v22 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __94___EXSinkLoadOperator_loadItemForTypeIdentifier_completionHandler_expectedValueClass_options___block_invoke;
  v39[3] = &unk_1E2CFC660;
  v23 = v11;
  v40 = v23;
  objc_msgSend(v21, "remoteObjectProxyWithErrorHandler:", v39);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = v17;
    v27 = v10;
    v28 = v12;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("com.apple.Foundation.NSItemProviderExpectedClass"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (!v29 || !objc_msgSend(v29, "length"))
    {
      v41 = CFSTR("com.apple.Foundation.NSItemProviderExpectedClass");
      v42 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    v10 = v27;
    v17 = v26;
    v22 = MEMORY[0x1E0C809B0];
  }
  v35[0] = v22;
  v35[1] = 3221225472;
  v35[2] = __94___EXSinkLoadOperator_loadItemForTypeIdentifier_completionHandler_expectedValueClass_options___block_invoke_122;
  v35[3] = &unk_1E2CFD588;
  v36 = v25;
  v37 = v10;
  v38 = v23;
  v31 = v23;
  v32 = v10;
  v33 = v25;
  objc_msgSend(v24, "resolveWithIdentifier:className:options:reply:", v32, v33, v12, v35);

}

- (void)loadPreviewImageWithCompletionHandler:(id)a3 expectedValueClass:(Class)a4 options:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;

  v8 = a3;
  v9 = a5;
  _EXDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[_EXSinkLoadOperator loadPreviewImageWithCompletionHandler:expectedValueClass:options:].cold.1(a4, (uint64_t)v9, v10);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE216820);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "plistTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_previewImageWithClassName_options_reply_, 2, 0);

  +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_previewImageWithClassName_options_reply_, 0, 1);

  +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "errorTypes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_previewImageWithClassName_options_reply_, 1, 1);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", self->_endpoint);
  objc_msgSend(v18, "setRemoteObjectInterface:", v11);
  objc_msgSend(v18, "resume");
  v19 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __88___EXSinkLoadOperator_loadPreviewImageWithCompletionHandler_expectedValueClass_options___block_invoke;
  v26[3] = &unk_1E2CFC660;
  v20 = v8;
  v27 = v20;
  objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v19;
  v24[1] = 3221225472;
  v24[2] = __88___EXSinkLoadOperator_loadPreviewImageWithCompletionHandler_expectedValueClass_options___block_invoke_125;
  v24[3] = &unk_1E2CFD5B0;
  v25 = v20;
  v23 = v20;
  objc_msgSend(v21, "previewImageWithClassName:options:reply:", v22, v9, v24);

}

- (NSXPCListenerEndpoint)endpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEndpoint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (void)loadItemForTypeIdentifier:completionHandler:expectedValueClass:options:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_2_3(&dword_190C25000, v0, v1, "%{public}s nil expectedValueClass allowing %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)loadItemForTypeIdentifier:completionHandler:expectedValueClass:options:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_6();
}

- (void)loadPreviewImageWithCompletionHandler:(objc_class *)a1 expectedValueClass:(uint64_t)a2 options:(NSObject *)a3 .cold.1(objc_class *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  NSStringFromClass(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315650;
  v8 = "-[_EXSinkLoadOperator loadPreviewImageWithCompletionHandler:expectedValueClass:options:]";
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = a2;
  OUTLINED_FUNCTION_17(&dword_190C25000, a3, v6, "%s expectedValueClass: %@ options: %@", (uint8_t *)&v7);

}

@end
