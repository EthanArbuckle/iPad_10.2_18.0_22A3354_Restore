@implementation MCMResultWithContainerBase

- (BOOL)encodeResultOntoReply:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  xpc_object_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v22;
  objc_super v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MCMResultWithContainerBase;
  v5 = -[MCMResultBase encodeResultOntoReply:](&v23, sel_encodeResultOntoReply_, v4);
  if (v5)
  {
    -[MCMResultBase error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = xpc_dictionary_create(0, 0, 0);
      -[MCMResultWithContainerBase url](self, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[MCMResultWithContainerBase url](self, "url");
        v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v9, "fileSystemRepresentation");

      }
      -[MCMResultWithContainerBase info](self, "info");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[MCMResultWithContainerBase info](self, "info");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();

      }
      -[MCMResultWithContainerBase userManagedAssetsRelPath](self, "userManagedAssetsRelPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[MCMResultWithContainerBase userManagedAssetsRelPath](self, "userManagedAssetsRelPath");
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v13, "UTF8String");

      }
      -[MCMResultWithContainerBase creator](self, "creator");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[MCMResultWithContainerBase creator](self, "creator");
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v15, "UTF8String");

      }
      -[MCMResultWithContainerBase existed](self, "existed");
      -[MCMResultWithContainerBase sandboxToken](self, "sandboxToken");
      -[MCMResultWithContainerBase transient](self, "transient");
      container_xpc_encode_container_metadata_as_object();
      v24[0] = 0;
      v24[1] = 0;
      -[MCMResultWithContainerBase uuid](self, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "getUUIDBytes:", v24);

      -[MCMResultWithContainerBase identifier](self, "identifier");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v17, "UTF8String");
      -[MCMResultWithContainerBase containerClass](self, "containerClass");
      -[MCMResultWithContainerBase posixUser](self, "posixUser");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "UID");
      -[MCMResultWithContainerBase containerPathIdentifier](self, "containerPathIdentifier");
      v22 = v10;
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v19, "UTF8String");
      -[MCMResultWithContainerBase personaUniqueString](self, "personaUniqueString");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v20, "UTF8String");
      container_xpc_encode_container_as_object();

    }
  }

  return v5;
}

- (NSURL)url
{
  return self->_url;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)userManagedAssetsRelPath
{
  return self->_userManagedAssetsRelPath;
}

- (BOOL)transient
{
  return self->_transient;
}

- (char)sandboxToken
{
  return self->_sandboxToken;
}

- (MCMPOSIXUser)posixUser
{
  return self->_posixUser;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (NSDictionary)info
{
  return self->_info;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)existed
{
  return self->_existed;
}

- (NSString)containerPathIdentifier
{
  return self->_containerPathIdentifier;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (void)dealloc
{
  char **p_sandboxToken;
  char *sandboxToken;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  p_sandboxToken = &self->_sandboxToken;
  sandboxToken = self->_sandboxToken;
  if (sandboxToken)
  {
    free(sandboxToken);
    memset_s(p_sandboxToken, 8uLL, 0, 8uLL);
  }
  v5.receiver = self;
  v5.super_class = (Class)MCMResultWithContainerBase;
  -[MCMResultWithContainerBase dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creator, 0);
  objc_storeStrong((id *)&self->_userManagedAssetsRelPath, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_posixUser, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_containerPathIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (MCMResultWithContainerBase)initWithUUID:(id)a3 containerPathIdentifier:(id)a4 identifier:(id)a5 containerClass:(unint64_t)a6 POSIXUser:(id)a7 personaUniqueString:(id)a8 sandboxToken:(const char *)a9 existed:(BOOL)a10 url:(id)a11 info:(id)a12 transient:(BOOL)a13 userManagedAssetsRelPath:(id)a14 creator:(id)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  MCMResultWithContainerBase *v25;
  MCMResultWithContainerBase *v26;
  char *v27;
  id v30;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v30 = a4;
  v21 = a4;
  v36 = a5;
  v35 = a7;
  v32 = a8;
  v34 = a8;
  v33 = a11;
  v22 = a12;
  v23 = a14;
  v24 = a15;
  v37.receiver = self;
  v37.super_class = (Class)MCMResultWithContainerBase;
  v25 = -[MCMResultBase init](&v37, sel_init);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_uuid, a3);
    v26->_existed = a10;
    objc_storeStrong((id *)&v26->_containerPathIdentifier, v30);
    objc_storeStrong((id *)&v26->_identifier, a5);
    v26->_containerClass = a6;
    objc_storeStrong((id *)&v26->_posixUser, a7);
    objc_storeStrong((id *)&v26->_personaUniqueString, v32);
    if (a9)
      v27 = strndup(a9, 0x800uLL);
    else
      v27 = 0;
    v26->_sandboxToken = v27;
    objc_storeStrong((id *)&v26->_url, a11);
    objc_storeStrong((id *)&v26->_info, a12);
    v26->_transient = a13;
    objc_storeStrong((id *)&v26->_userManagedAssetsRelPath, a14);
    objc_storeStrong((id *)&v26->_creator, a15);
  }

  return v26;
}

- (MCMResultWithContainerBase)initWithContainerPath:(id)a3 containerIdentity:(id)a4 uuid:(id)a5 sandboxToken:(const char *)a6 includePath:(BOOL)a7
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  MCMResultWithContainerBase *v19;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v25;
  void *v27;

  v7 = a7;
  v10 = a3;
  v23 = a5;
  v11 = a4;
  objc_msgSend(v10, "containerClassPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "userIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "containerPathIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v12, "containerClass");
  objc_msgSend(v13, "posixUser");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "personaUniqueString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v10, "exists");
  if (v7)
  {
    objc_msgSend(v10, "containerDataURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  LOBYTE(v22) = objc_msgSend(v10, "transient");
  LOBYTE(v21) = v17;
  v19 = -[MCMResultWithContainerBase initWithUUID:containerPathIdentifier:identifier:containerClass:POSIXUser:personaUniqueString:sandboxToken:existed:url:info:transient:userManagedAssetsRelPath:creator:](self, "initWithUUID:containerPathIdentifier:identifier:containerClass:POSIXUser:personaUniqueString:sandboxToken:existed:url:info:transient:userManagedAssetsRelPath:creator:", v23, v25, v27, v14, v15, v16, a6, v21, v18, 0, v22, 0, 0);

  if (v7)
  return v19;
}

- (MCMResultWithContainerBase)initWithMetadata:(id)a3 sandboxToken:(const char *)a4 includePath:(BOOL)a5 includeInfo:(BOOL)a6 includeUserManagedAssetsRelPath:(BOOL)a7 includeCreator:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  MCMResultWithContainerBase *v22;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = v12;
  if (v9 && objc_msgSend(v12, "conformsToProtocol:", &unk_1EFBC2D68))
  {
    objc_msgSend(v13, "userManagedAssetsDirName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v35 = 0;
    if (!v8)
      goto LABEL_8;
  }
  if (objc_msgSend(v13, "conformsToProtocol:", &unk_1EFBC2D68))
  {
    objc_msgSend(v13, "creator");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_8:
  v34 = 0;
LABEL_9:
  objc_msgSend(v13, "uuid");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "containerPath");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "containerPathIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containerClass");
  objc_msgSend(v13, "userIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "posixUser");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "userIdentity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "personaUniqueString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v13, "existed");
  v31 = v11;
  if (v11)
  {
    objc_msgSend(v13, "containerPath");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "containerDataURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_16;
  }
  else
  {
    v20 = 0;
    if (!v10)
      goto LABEL_16;
  }
  if (objc_msgSend(v13, "conformsToProtocol:", &unk_1EFBC2D68))
  {
    objc_msgSend(v13, "info");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 1;
    goto LABEL_17;
  }
  v10 = 0;
LABEL_16:
  v21 = 0;
LABEL_17:
  LOBYTE(v25) = objc_msgSend(v13, "transient");
  LOBYTE(v24) = v19;
  v22 = -[MCMResultWithContainerBase initWithUUID:containerPathIdentifier:identifier:containerClass:POSIXUser:personaUniqueString:sandboxToken:existed:url:info:transient:userManagedAssetsRelPath:creator:](self, "initWithUUID:containerPathIdentifier:identifier:containerClass:POSIXUser:personaUniqueString:sandboxToken:existed:url:info:transient:userManagedAssetsRelPath:creator:", v28, v33, v32, v14, v16, v18, a4, v24, v20, v21, v25, v35, v34);
  if (v10)

  if (v31)
  {

  }
  return v22;
}

- (NSString)creator
{
  return self->_creator;
}

@end
