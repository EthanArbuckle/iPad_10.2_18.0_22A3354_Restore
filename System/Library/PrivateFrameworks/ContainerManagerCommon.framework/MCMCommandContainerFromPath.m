@implementation MCMCommandContainerFromPath

- (MCMCommandContainerFromPath)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  MCMCommandContainerFromPath *v9;
  uint64_t v10;
  NSURL *url;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMCommandContainerFromPath;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v13, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "url");
    v10 = objc_claimAutoreleasedReturnValue();
    url = v9->_url;
    v9->_url = (NSURL *)v10;

  }
  return v9;
}

- (BOOL)preflightClientAllowed
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[MCMCommand context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "codeSignInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitlements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "allowed") & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v5, "otherIDLookup");

  return v6;
}

- (void)execute
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  container_object_s *v14;
  id v15;
  int v16;
  container_object_s *v17;
  uint64_t identifier;
  void *v19;
  uint64_t v20;
  uint64_t path;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t persona_unique_string;
  void *v26;
  MCMError *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  BOOL v32;
  NSObject *v33;
  NSObject *v34;
  int v35;
  MCMCommandContainerFromPath *v36;
  MCMError *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  MCMResultContainerFromPath *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  MCMResultContainerFromPath *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *context;
  void *__s;
  void *v70;
  uint64_t v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  MCMError *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D17D7010](self, a2);
  v71 = 0;
  v3 = containermanager_copy_global_configuration();
  objc_msgSend(v3, "classPathCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMCommand context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "posixUser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isRoleUser"))
  {
    v8 = containermanager_copy_global_configuration();
    objc_msgSend(v8, "defaultUser");
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  objc_msgSend(v4, "referenceForPOSIXUser:", v7);
  v10 = objc_claimAutoreleasedReturnValue();
  -[MCMCommandContainerFromPath url](self, "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)v10;
  objc_msgSend(v4, "containerClassPathWithURL:reference:", v11, v10);
  v12 = objc_claimAutoreleasedReturnValue();

  v70 = 0;
  v64 = (void *)v12;
  v66 = v7;
  v67 = v4;
  if (v12)
  {
    -[MCMCommandContainerFromPath url](self, "url");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v13, "fileSystemRepresentation");
    v14 = (container_object_s *)container_paths_copy_container_from_path();
  }
  else
  {
    v15 = containermanager_copy_global_configuration();
    v16 = objc_msgSend(v15, "dispositionForContainerClass:", 12);

    if (v16 != 2)
    {
      container_log_handle_for_category();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        -[MCMCommandContainerFromPath url](self, "url");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "path");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v73 = v54;
        _os_log_error_impl(&dword_1CF807000, v33, OS_LOG_TYPE_ERROR, "[%@] is not a path that container manager recognizes among its prefixes.", buf, 0xCu);

      }
      v27 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 21);
      goto LABEL_23;
    }
    -[MCMCommandContainerFromPath url](self, "url");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = -[MCMCommandContainerFromPath _containerFromRelayToDaemonWithURL:relativePath:error:](self, "_containerFromRelayToDaemonWithURL:relativePath:error:", v13, &v70, &v71);
  }
  v17 = v14;

  if (!v17)
  {
    v27 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 21);
    v28 = (void *)container_error_copy_unlocalized_description();
    __s = v28;
    container_log_handle_for_category();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      -[MCMCommandContainerFromPath url](self, "url");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "path");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v73 = v50;
      v74 = 2080;
      v75 = (uint64_t)v28;
      _os_log_error_impl(&dword_1CF807000, v29, OS_LOG_TYPE_ERROR, "Error obtaining container during reverse lookup of [%@]: %s", buf, 0x16u);

    }
    if (v28)
    {
      free(v28);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }
LABEL_23:
    v31 = 0;
    v24 = 0;
    v26 = 0;
    v32 = 0;
    v17 = 0;
    v62 = 0;
    v63 = 0;
    v19 = 0;
LABEL_28:
    v35 = 0;
    goto LABEL_29;
  }
  identifier = container_get_identifier();
  if (!identifier)
  {
    container_log_handle_for_category();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      -[MCMCommandContainerFromPath url](self, "url");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "path");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v73 = v52;
      _os_log_fault_impl(&dword_1CF807000, v30, OS_LOG_TYPE_FAULT, "[%@] produced a container object with a NULL identifier.", buf, 0xCu);

    }
    v31 = 0;
    v24 = 0;
    v26 = 0;
    v32 = 0;
    v62 = 0;
    v63 = 0;
    v19 = 0;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", identifier);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", container_object_get_uuid());
  path = container_object_get_path();
  v62 = (void *)v20;
  if (!path)
  {
    container_log_handle_for_category();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      -[MCMCommandContainerFromPath url](self, "url");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "path");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v73 = v56;
      _os_log_fault_impl(&dword_1CF807000, v34, OS_LOG_TYPE_FAULT, "[%@] produced a container object with a NULL path.", buf, 0xCu);

    }
    v31 = 0;
    v24 = 0;
    v26 = 0;
    v32 = 0;
    v63 = 0;
LABEL_27:
    v27 = 0;
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", path, 1, 0);
  v22 = objc_claimAutoreleasedReturnValue();
  v61 = container_get_class();
  v23 = MEMORY[0x1D17D6A40](v17);
  v63 = (void *)v22;
  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    persona_unique_string = container_get_persona_unique_string();
    if (persona_unique_string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", persona_unique_string);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    v31 = v61;
    buf[0] = 0;
    container_is_transient();
    v27 = 0;
    v32 = buf[0] != 0;
    v35 = 1;
  }
  else
  {
    container_log_handle_for_category();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
    {
      -[MCMCommandContainerFromPath url](self, "url");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "path");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v73 = v58;
      _os_log_fault_impl(&dword_1CF807000, v48, OS_LOG_TYPE_FAULT, "[%@] produced a container object with a NULL path identifier.", buf, 0xCu);

    }
    v24 = 0;
    v26 = 0;
    v32 = 0;
    v27 = 0;
    v35 = 0;
    v31 = v61;
  }
LABEL_29:
  v36 = self;
  MEMORY[0x1D17D69E0](v17);
  if (v71)
  {
    v37 = [MCMError alloc];
    v38 = -[MCMError initWithLibsystemError:](v37, "initWithLibsystemError:", v71);

    container_error_free();
    v27 = (MCMError *)v38;
  }
  if (v70)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v70)
    {
      free(v70);
      memset_s(&v70, 8uLL, 0, 8uLL);
    }
  }
  else
  {
    v39 = 0;
  }
  container_log_handle_for_category();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v73 = v19;
    v74 = 2048;
    v75 = v31;
    v76 = 2112;
    v77 = v27;
    _os_log_impl(&dword_1CF807000, v40, OS_LOG_TYPE_DEFAULT, "Container from path result: %@(%llu), error = %@", buf, 0x20u);
  }

  v41 = [MCMResultContainerFromPath alloc];
  if (v35)
  {
    LOBYTE(v60) = v32;
    v42 = v31;
    v44 = v62;
    v43 = v63;
    LOBYTE(v59) = 1;
    v45 = v66;
    v46 = -[MCMResultContainerFromPath initWithUUID:containerPathIdentifier:identifier:containerClass:POSIXUser:personaUniqueString:sandboxToken:existed:url:info:transient:userManagedAssetsRelPath:creator:relativePath:](v41, "initWithUUID:containerPathIdentifier:identifier:containerClass:POSIXUser:personaUniqueString:sandboxToken:existed:url:info:transient:userManagedAssetsRelPath:creator:relativePath:", v62, v24, v19, v42, v66, v26, 0, v59, v63, 0, v60, 0, 0, v39);
  }
  else
  {
    v46 = -[MCMResultBase initWithError:](v41, "initWithError:", v27);
    v45 = v66;
    v44 = v62;
    v43 = v63;
  }
  -[MCMCommand resultPromise](v36, "resultPromise");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "completeWithResult:", v46);

  objc_autoreleasePoolPop(context);
}

- (container_object_s)_containerFromRelayToDaemonWithURL:(id)a3 relativePath:(char *)a4 error:(container_error_extended_s *)a5
{
  id v8;
  void *v9;
  void *v10;
  xpc_object_t v11;
  id v12;
  id v13;
  container_object_s *v14;
  const char *string;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6844;
  v21 = __Block_byref_object_dispose__6845;
  v22 = 0;
  -[MCMCommand context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createLibsystemClient");

  v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "Command", 0x2CuLL);
  v12 = objc_retainAutorelease(v8);
  xpc_dictionary_set_string(v11, "Path", (const char *)objc_msgSend(v12, "fileSystemRepresentation"));
  v13 = v11;
  container_perform_with_client_context();
  if (v18[5])
  {
    v14 = (container_object_s *)container_xpc_decode_container_object();
    if (v14)
    {
      string = xpc_dictionary_get_string((xpc_object_t)v18[5], "ReplyRelativePath");
      if (a4)
      {
        if (string)
          *a4 = strndup(string, 0x400uLL);
      }
    }
  }
  else
  {
    v14 = 0;
  }
  container_free_client();
  if (!a5 || v14)
  {
    if (!a5)
      container_error_free();
  }
  else
  {
    *a5 = (container_error_extended_s *)v24[3];
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v14;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

void __85__MCMCommandContainerFromPath__containerFromRelayToDaemonWithURL_relativePath_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = container_xpc_send_sync_message();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (unint64_t)command
{
  return 44;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
