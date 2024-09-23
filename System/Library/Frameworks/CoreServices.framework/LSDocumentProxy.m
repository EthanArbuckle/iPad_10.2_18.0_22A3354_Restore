@implementation LSDocumentProxy

- (id)iconDataForVariant:(int)a3 withOptions:(int)a4
{
  softLink_ISIconDataForResourceProxy(self, *(uint64_t *)&a3, *(uint64_t *)&a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (LSDocumentProxy)initWithURL:(id)a3 name:(id)a4 type:(id)a5 MIMEType:(id)a6 isContentManaged:(BOOL)a7 sourceAuditToken:(id *)a8
{
  id v15;
  __CFString *v16;
  id v17;
  id v18;
  __CFString *v19;
  id *v20;
  id *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  __int128 v28;
  objc_super v30;

  v15 = a3;
  v16 = (__CFString *)a4;
  v17 = a5;
  v18 = a6;
  if (v16)
    v19 = v16;
  else
    v19 = CFSTR("untitled");
  v30.receiver = self;
  v30.super_class = (Class)LSDocumentProxy;
  v20 = -[LSResourceProxy _initWithLocalizedName:](&v30, sel__initWithLocalizedName_, v19);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong(v20 + 9, a3);
    v22 = -[__CFString copy](v19, "copy");
    v23 = v21[10];
    v21[10] = (id)v22;

    v24 = objc_msgSend(v17, "copy");
    v25 = v21[11];
    v21[11] = (id)v24;

    v26 = objc_msgSend(v18, "copy");
    v27 = v21[12];
    v21[12] = (id)v26;

    *((_BYTE *)v21 + 64) = a7;
    if (!a8)
      a8 = (const $115C4C562B26FF47E01F9F4EA65B5887 *)_LSGetAuditTokenForSelf();
    v28 = *(_OWORD *)&a8->var0[4];
    *((_OWORD *)v21 + 2) = *(_OWORD *)a8->var0;
    *((_OWORD *)v21 + 3) = v28;
  }

  return (LSDocumentProxy *)v21;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

+ (id)documentProxyForName:(id)a3 type:(id)a4 MIMEType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:name:type:MIMEType:isContentManaged:sourceAuditToken:", 0, v8, v9, v10, 0, 0);

  return v11;
}

+ (id)documentProxyForURL:(id)a3 isContentManaged:(BOOL)a4 sourceAuditToken:(id *)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v8 = a3;
  v9 = objc_alloc((Class)a1);
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithURL:name:type:MIMEType:isContentManaged:sourceAuditToken:", v8, v11, 0, 0, v6, a5);

  return v12;
}

+ (id)documentProxyForName:(id)a3 type:(id)a4 MIMEType:(id)a5 isContentManaged:(BOOL)a6 sourceAuditToken:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:name:type:MIMEType:isContentManaged:sourceAuditToken:", 0, v12, v13, v14, v8, a7);

  return v15;
}

+ (id)documentProxyForURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithURL:name:type:MIMEType:isContentManaged:sourceAuditToken:", v4, v7, 0, 0, 0, 0);

  return v8;
}

- (BOOL)isImageOrVideo
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[LSDocumentProxy name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[UTTypeRecord typeRecordsWithTag:ofClass:](UTTypeRecord, "typeRecordsWithTag:ofClass:", v3, CFSTR("public.filename-extension"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[LSDocumentProxy isImageOrVideo]::once != -1)
      dispatch_once(&-[LSDocumentProxy isImageOrVideo]::once, &__block_literal_global_32);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "pedigree", (_QWORD)v12);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "intersectsSet:", -[LSDocumentProxy isImageOrVideo]::imageAndVideoTypes);

          if ((v10 & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_14;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

void __33__LSDocumentProxy_isImageOrVideo__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("public.image"), CFSTR("public.video"), CFSTR("public.movie"), 0);
  v1 = (void *)-[LSDocumentProxy isImageOrVideo]::imageAndVideoTypes;
  -[LSDocumentProxy isImageOrVideo]::imageAndVideoTypes = v0;

}

- (NSString)containerOwnerApplicationIdentifier
{
  return 0;
}

- (const)sourceAuditToken
{
  return (const $115C4C562B26FF47E01F9F4EA65B5887 *)&self->_sourceAuditToken;
}

- (id)availableClaimBindingsReturningError:(id *)a3
{
  return -[LSDocumentProxy claimBindingsAvailableForOpeningWithStyle:handlerRank:limit:XPCConnection:error:](self, "claimBindingsAvailableForOpeningWithStyle:handlerRank:limit:XPCConnection:error:", 0, 0, -1, 0, a3);
}

- (id)availableClaimBindingsForMode:(unsigned __int8)a3 error:(id *)a4
{
  return -[LSDocumentProxy claimBindingsAvailableForOpeningWithStyle:handlerRank:limit:XPCConnection:error:](self, "claimBindingsAvailableForOpeningWithStyle:handlerRank:limit:XPCConnection:error:", a3, 0, -1, 0, a4);
}

- (id)availableClaimBindingsForMode:(unsigned __int8)a3 handlerRank:(id)a4 error:(id *)a5
{
  -[LSDocumentProxy claimBindingsAvailableForOpeningWithStyle:handlerRank:limit:XPCConnection:error:](self, "claimBindingsAvailableForOpeningWithStyle:handlerRank:limit:XPCConnection:error:", a3, a4, -1, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)applicationsAvailableForOpeningWithHandlerRanks:(id)a3 error:(id *)a4
{
  CFSetRef v6;
  void *v7;
  id v8;
  const __CFSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _LSDocumentProxyBindingQuery *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  LSDocumentProxy *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = (CFSetRef)a3;
  v7 = (void *)MEMORY[0x186DAE7A0]();
  if (!v6)
    v6 = _LSCopyAllHandlerRankStrings();
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v6;
  v10 = -[__CFSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v27;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v9);
        v13 = -[_LSDocumentProxyBindingQuery initWithDocumentProxy:style:handlerRank:]([_LSDocumentProxyBindingQuery alloc], "initWithDocumentProxy:style:handlerRank:", self, 0, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v12));
        if (v13)
          objc_msgSend(v8, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[__CFSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v10);
  }

  +[_LSQueryContext defaultContext](_LSQueryContext, "defaultContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v14, "resolveQueries:error:", v8, &v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v25;

  if (v15)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __73__LSDocumentProxy_applicationsAvailableForOpeningWithHandlerRanks_error___block_invoke;
    v23[3] = &unk_1E1043A38;
    v18 = v17;
    v24 = v18;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v23);
    v19 = v24;
  }
  else
  {
    _LSDefaultLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      -[__CFSet allObjects](v9, "allObjects");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR(", "));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v31 = self;
      v32 = 2112;
      v33 = v21;
      v34 = 2112;
      v35 = v16;
      _os_log_impl(&dword_182882000, v19, OS_LOG_TYPE_DEFAULT, "Could not find apps for %@ (ranks %@): %@.", buf, 0x20u);

    }
    v18 = 0;
  }

  objc_autoreleasePoolPop(v7);
  if (a4 && !v18)
    *a4 = objc_retainAutorelease(v16);

  return v18;
}

void __73__LSDocumentProxy_applicationsAvailableForOpeningWithHandlerRanks_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a2, "handlerRank");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && v5)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (id)applicationsAvailableForOpeningWithError:(id *)a3
{
  return -[LSDocumentProxy applicationsAvailableForOpeningWithStyle:limit:XPCConnection:error:](self, "applicationsAvailableForOpeningWithStyle:limit:XPCConnection:error:", 0, -1, 0, a3);
}

- (id)applicationsAvailableForOpeningFromAirDropWithError:(id *)a3
{
  return -[LSDocumentProxy applicationsAvailableForOpeningWithStyle:limit:XPCConnection:error:](self, "applicationsAvailableForOpeningWithStyle:limit:XPCConnection:error:", 1, -1, 0, a3);
}

- (id)applicationsAvailableForOpeningByDraggingAndDroppingWithError:(id *)a3
{
  return -[LSDocumentProxy applicationsAvailableForOpeningWithStyle:limit:XPCConnection:error:](self, "applicationsAvailableForOpeningWithStyle:limit:XPCConnection:error:", 2, -1, 0, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSDocumentProxy)initWithCoder:(id)a3
{
  id v4;
  LSDocumentProxy *v5;
  uint64_t v6;
  NSURL *URL;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSString *typeIdentifier;
  uint64_t v12;
  NSString *MIMEType;
  void *v14;
  void *v15;
  _OWORD *v16;
  __int128 v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)LSDocumentProxy;
  v5 = -[LSResourceProxy initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
    v6 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("typeIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    typeIdentifier = v5->_typeIdentifier;
    v5->_typeIdentifier = (NSString *)v10;

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MIMEType"));
    v12 = objc_claimAutoreleasedReturnValue();
    MIMEType = v5->_MIMEType;
    v5->_MIMEType = (NSString *)v12;

    v5->_isContentManaged = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("contentManaged"));
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceAuditToken"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      if (objc_msgSend(v14, "length") == 32)
      {
        v16 = (_OWORD *)objc_msgSend(objc_retainAutorelease(v15), "bytes");
        v17 = v16[1];
        *(_OWORD *)v5->_sourceAuditToken.val = *v16;
        *(_OWORD *)&v5->_sourceAuditToken.val[4] = v17;
      }
      else
      {
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB28A8], 4864, (uint64_t)"-[LSDocumentProxy initWithCoder:]", 269, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "failWithError:", v18);

      }
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)LSDocumentProxy;
  -[LSResourceProxy encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_URL, CFSTR("URL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_typeIdentifier, CFSTR("typeIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_MIMEType, CFSTR("MIMEType"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isContentManaged, CFSTR("contentManaged"));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &self->_sourceAuditToken, 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sourceAuditToken"));

}

- (id)uniqueIdentifier
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  -[LSDocumentProxy name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LSDocumentProxy name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendData:", v6);

  }
  -[LSDocumentProxy typeIdentifier](self, "typeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[LSDocumentProxy typeIdentifier](self, "typeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataUsingEncoding:", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendData:", v9);

  }
  -[LSDocumentProxy MIMEType](self, "MIMEType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[LSDocumentProxy MIMEType](self, "MIMEType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataUsingEncoding:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendData:", v12);

  }
  v15 = -[LSDocumentProxy isContentManaged](self, "isContentManaged");
  objc_msgSend(v3, "appendBytes:length:", &v15, 1);
  objc_msgSend(MEMORY[0x1E0CB3A28], "_LS_UUIDWithData:digestType:", v3, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[LSResourceProxy localizedName](self, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSDocumentProxy typeIdentifier](self, "typeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSDocumentProxy MIMEType](self, "MIMEType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("LSDocumentProxy: Name=%@ UTI=%@ MIMEType=%@"), v4, v5, v6);

  return v7;
}

- (id)debugDescription
{
  _BOOL4 v3;
  id v4;
  LSDocumentProxy *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;

  v3 = -[LSDocumentProxy isContentManaged](self, "isContentManaged");
  v4 = objc_alloc(MEMORY[0x1E0C99D50]);
  v5 = objc_retainAutorelease(self);
  v6 = (void *)objc_msgSend(v4, "initWithBytes:length:", -[LSDocumentProxy sourceAuditToken](v5, "sourceAuditToken"), 32);
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8 = objc_opt_class();
  -[LSDocumentProxy URL](v5, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSDocumentProxy name](v5, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSDocumentProxy typeIdentifier](v5, "typeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSDocumentProxy MIMEType](v5, "MIMEType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = "no";
  if (v3)
    v15 = "yes";
  v16 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("<%@ %p> { URL: %@, Name: %@, UTI: %@, MIMEType: %@, isContentManaged: %s, sourceAuditToken: %@ }"), v8, v5, v9, v10, v11, v12, v15, v13);

  return v16;
}

+ (id)documentProxyForURL:(id)a3 managedSourceAuditToken:(id *)a4
{
  objc_msgSend(a1, "documentProxyForURL:isContentManaged:sourceAuditToken:", a3, a4 != 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)documentProxyForURL:(id)a3 sourceIsManaged:(BOOL)a4
{
  objc_msgSend(a1, "documentProxyForURL:isContentManaged:sourceAuditToken:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)documentProxyForName:(id)a3 type:(id)a4 MIMEType:(id)a5 managedSourceAuditToken:(id *)a6
{
  objc_msgSend(a1, "documentProxyForName:type:MIMEType:isContentManaged:sourceAuditToken:", a3, a4, a5, a6 != 0, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)documentProxyForName:(id)a3 type:(id)a4 MIMEType:(id)a5 sourceIsManaged:(BOOL)a6
{
  objc_msgSend(a1, "documentProxyForName:type:MIMEType:isContentManaged:sourceAuditToken:", a3, a4, a5, a6, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)sourceIsManaged
{
  return self->_isContentManaged;
}

- (const)managedSourceAuditToken
{
  return (const $115C4C562B26FF47E01F9F4EA65B5887 *)&self->_sourceAuditToken;
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)MIMEType
{
  return self->_MIMEType;
}

- (optional<LaunchServices::BindingEvaluator>)_bindingEvaluatorWithAuditToken:(SEL)a3
{
  LaunchServices::BindingEvaluator *v7;
  LaunchServices::BindingEvaluator *v8;
  const CFStringRef *v9;
  _BOOL4 v10;
  const __CFString *v11;
  LaunchServices::BindingEvaluator *v12;
  NSString *v13;
  void *v14;
  __CFString *v15;
  LaunchServices::BindingEvaluator *PreferredIdentifierForTag;
  NSString *v17;
  LaunchServices::BindingEvaluator *v18;
  NSString *v19;
  LaunchServices::BindingEvaluator *v20;
  optional<LaunchServices::BindingEvaluator> *result;
  FSNode *v22[22];

  v22[21] = *(FSNode **)MEMORY[0x1E0C80C00];
  retstr->var0.var0 = 0;
  retstr->var1 = 0;
  -[LSDocumentProxy URL](self, "URL");
  v7 = (LaunchServices::BindingEvaluator *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (-[LaunchServices::BindingEvaluator hasDirectoryPath](v7, "hasDirectoryPath"))
      v9 = &kUTTypeDirectory;
    else
      v9 = &kUTTypeData;
    v10 = +[FSNode canReadURL:fromSandboxWithAuditToken:](FSNode, "canReadURL:fromSandboxWithAuditToken:", v8, a4);
    v11 = *v9;
    if (v10)
    {
      LaunchServices::BindingEvaluator::CreateWithURL(v8, v22);
      std::optional<LaunchServices::BindingEvaluator>::operator=[abi:nn180100]<LaunchServices::BindingEvaluator,void>((LaunchServices::BindingEvaluator *)retstr, (const LaunchServices::BindingEvaluator *)v22);
      LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v22);
      goto LABEL_19;
    }
  }
  else
  {
    v11 = 0;
  }
  -[LSDocumentProxy typeIdentifier](self, "typeIdentifier");
  v12 = (LaunchServices::BindingEvaluator *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[LSDocumentProxy name](self, "name");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    LaunchServices::BindingEvaluator::CreateWithUTI(v12, v13, (LaunchServices::BindingEvaluator *)v22);
    std::optional<LaunchServices::BindingEvaluator>::operator=[abi:nn180100]<LaunchServices::BindingEvaluator,void>((LaunchServices::BindingEvaluator *)retstr, (const LaunchServices::BindingEvaluator *)v22);
    LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v22);

  }
  else
  {
    -[LSDocumentProxy name](self, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pathExtension");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      PreferredIdentifierForTag = (LaunchServices::BindingEvaluator *)UTTypeCreatePreferredIdentifierForTag(CFSTR("public.filename-extension"), v15, v11);
      if (PreferredIdentifierForTag)
      {
        -[LSDocumentProxy name](self, "name");
        v17 = (NSString *)objc_claimAutoreleasedReturnValue();
        LaunchServices::BindingEvaluator::CreateWithUTI(PreferredIdentifierForTag, v17, (LaunchServices::BindingEvaluator *)v22);
        std::optional<LaunchServices::BindingEvaluator>::operator=[abi:nn180100]<LaunchServices::BindingEvaluator,void>((LaunchServices::BindingEvaluator *)retstr, (const LaunchServices::BindingEvaluator *)v22);
        LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v22);

      }
    }
    else
    {
      -[LSDocumentProxy MIMEType](self, "MIMEType");
      PreferredIdentifierForTag = (LaunchServices::BindingEvaluator *)objc_claimAutoreleasedReturnValue();
      if (PreferredIdentifierForTag)
      {
        v18 = (LaunchServices::BindingEvaluator *)UTTypeCreatePreferredIdentifierForTag(CFSTR("public.mime-type"), (CFStringRef)PreferredIdentifierForTag, v11);
        if (v18)
        {
          -[LSDocumentProxy name](self, "name");
          v19 = (NSString *)objc_claimAutoreleasedReturnValue();
          LaunchServices::BindingEvaluator::CreateWithUTI(v18, v19, (LaunchServices::BindingEvaluator *)v22);
          std::optional<LaunchServices::BindingEvaluator>::operator=[abi:nn180100]<LaunchServices::BindingEvaluator,void>((LaunchServices::BindingEvaluator *)retstr, (const LaunchServices::BindingEvaluator *)v22);
          LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v22);

        }
      }
    }

  }
LABEL_19:
  if (!retstr->var1)
  {
    if (v11)
      v20 = (LaunchServices::BindingEvaluator *)v11;
    else
      v20 = (LaunchServices::BindingEvaluator *)CFSTR("public.data");
    LaunchServices::BindingEvaluator::CreateWithUTI(v20, 0, (LaunchServices::BindingEvaluator *)v22);
    std::optional<LaunchServices::BindingEvaluator>::operator=[abi:nn180100]<LaunchServices::BindingEvaluator,void>((LaunchServices::BindingEvaluator *)retstr, (const LaunchServices::BindingEvaluator *)v22);
    LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v22);
  }

  return result;
}

- (id)_boundIconInfo
{
  LSDocumentProxy *v3;
  void *v4;
  void *v5;
  BOOL v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _LSDServiceDomain *v12;
  LSContext *v13;
  __CFString *v14;
  uint64_t active;
  uint64_t v16;
  id v17;
  uint64_t (**v18)(_QWORD, _QWORD);
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[6];
  _QWORD v26[5];
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  int v34;
  void **v35;
  id v36;
  char v37;
  id v38;
  objc_super v39;
  uint64_t v40;
  id *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD *v48;
  uint64_t *v49;
  LSContext *v50;
  _BYTE v51[176];
  _BYTE v52[168];
  char v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (IconServicesLibrary(void)::frameworkLibrary
    || (IconServicesLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2)) != 0)
  {
    v40 = 0;
    v41 = (id *)&v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__23;
    v44 = __Block_byref_object_dispose__23;
    v45 = 0;
    v3 = self;
    objc_sync_enter(v3);
    v39.receiver = v3;
    v39.super_class = (Class)LSDocumentProxy;
    -[LSResourceProxy _boundIconInfo](&v39, sel__boundIconInfo);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == 0;

    if (v6)
    {
      if (_LSCurrentProcessMayMapDatabase())
      {
        v38 = 0;
        v35 = 0;
        v36 = 0;
        v37 = 0;
        if (!LaunchServices::Database::Context::status((id *)&v35))
        {
          +[_LSDServiceDomain defaultServiceDomain]();
          v12 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
          v13 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v35, v12, 0);

          -[_LSBoundIconInfo setDocumentAllowOverride:]((uint64_t)v4, 1);
          -[_LSBoundIconInfo setPrerendered:]((uint64_t)v4, 0);
          -[LSDocumentProxy _bindingEvaluatorWithAuditToken:](v3, "_bindingEvaluatorWithAuditToken:", 0);
          if (v53)
          {
            LaunchServices::BindingEvaluator::setLimit((uint64_t)v52, 1uLL);
            LaunchServices::BindingEvaluator::getCalculatedUTI((LaunchServices::BindingEvaluator *)v52, v13);
            v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              v34 = 0;
              active = _UTGetActiveTypeForCFStringIdentifier(v13->db, v14, &v34);
              v16 = active;
              if (!active || (*(_BYTE *)(active + 9) & 2) != 0)
              {
                -[_LSBoundIconInfo setFileNames:](v4, 0);
                -[_LSBoundIconInfo setIconsDictionary:](v4, 0);
                objc_msgSend(v4, "setApplicationIdentifier:", CFSTR("com.apple.mobilecoretypes"));
                -[_LSBoundIconInfo setContainerURL:]((uint64_t)v4, 0);
                v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", CFSTR("/System/Library/CoreServices/MobileCoreTypes.bundle"), 1);
                objc_msgSend(v4, "setResourcesDirectoryURL:", v24);

                -[_LSBoundIconInfo setDocumentAllowOverride:]((uint64_t)v4, 0);
              }
              else
              {
                v28 = 0;
                v29 = &v28;
                v30 = 0x3032000000;
                v31 = __Block_byref_object_copy__23;
                v32 = __Block_byref_object_dispose__23;
                v33 = 0;
                v26[0] = 0;
                v26[1] = v26;
                v26[2] = 0x3032000000;
                v26[3] = __Block_byref_object_copy__23;
                v26[4] = __Block_byref_object_dispose__23;
                v27 = 0;
                v46[0] = MEMORY[0x1E0C809B0];
                v46[1] = 3321888768;
                v46[2] = __42__LSDocumentProxy_Binding___boundIconInfo__block_invoke;
                v46[3] = &unk_1E103E130;
                v49 = &v28;
                v50 = v13;
                v48 = v26;
                v17 = v4;
                v47 = v17;
                std::__optional_copy_base<LaunchServices::BindingEvaluator,false>::__optional_copy_base[abi:nn180100]((LaunchServices::BindingEvaluator *)v51, (const LaunchServices::BindingEvaluator *)v52);
                v18 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x186DAE9BC](v46);
                if ((v18[2](v18, v16) & 1) != 0
                  || (v19 = _UTGetActiveTypeWithIconForNSStringIdentifier(v13->db, v14, &v34),
                      v18[2](v18, v19)))
                {
                  objc_msgSend((id)v29[5], "bundleIdentifier");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "setApplicationIdentifier:", v20);

                  objc_msgSend((id)v29[5], "containerURL");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_LSBoundIconInfo setContainerURL:]((uint64_t)v17, v21);

                  objc_msgSend((id)v29[5], "_boundIconInfo");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "resourcesDirectoryURL");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "setResourcesDirectoryURL:", v23);

                  -[_LSBoundIconInfo setBadge:]((uint64_t)v17, 1);
                }

                if (v51[168])
                  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v51);

                _Block_object_dispose(v26, 8);
                _Block_object_dispose(&v28, 8);

              }
            }

            objc_storeStrong(v41 + 5, v4);
            if (v53)
              LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v52);
          }
        }
        if (v35 && v37)
          _LSContextDestroy(v35);
        v7 = v36;
        v35 = 0;
        v36 = 0;

        v37 = 0;
        v8 = v38;
        v38 = 0;

      }
      else
      {
        +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __42__LSDocumentProxy_Binding___boundIconInfo__block_invoke_140;
        v25[3] = &unk_1E1043A60;
        v25[4] = v3;
        v25[5] = &v40;
        objc_msgSend(v10, "getBoundIconInfoForDocumentProxy:completionHandler:", v3, v25);

      }
    }
    else
    {
      objc_storeStrong(v41 + 5, v4);
    }

    objc_sync_exit(v3);
    v9 = v41[5];
    _Block_object_dispose(&v40, 8);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

uint64_t __42__LSDocumentProxy_Binding___boundIconInfo__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t active;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  char *v19;
  uint64_t v20;
  LSApplicationRecord *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  char *v30;
  uint64_t i;
  void *v32;
  uint64_t v34[3];
  uint64_t v35;
  id v36;
  id v37;
  char v38;

  if (!a2)
    goto LABEL_23;
  v3 = a2;
  if (_UTTypeHasIcon(a2))
    goto LABEL_3;
  v7 = (void *)_CSStringCopyCFString();
  LODWORD(v34[0]) = 0;
  active = _UTGetActiveTypeWithIconForNSStringIdentifier(**(void ***)(a1 + 56), v7, v34);
  v3 = active;
  if (!active)
  {

LABEL_23:
    v20 = 0;
LABEL_24:
    LaunchServices::BindingEvaluator::getBestBinding((LaunchServices::BindingEvaluator *)(a1 + 64), v34);
    if (v38)
    {
      v21 = [LSApplicationRecord alloc];
      v22 = -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:](v21, "_initWithContext:bundleID:bundleData:error:", *(_QWORD *)(a1 + 56), LODWORD(v34[0]), v34[1], 0);
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v24 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = v22;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "compatibilityObject");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v27 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = v25;

      if (v35 && (*(_DWORD *)(v35 + 28) || *(_DWORD *)(v35 + 60)))
      {
        v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (*(_DWORD *)(v35 + 60))
        {
          v29 = (void *)_CSStringCopyCFString();
          objc_msgSend(v28, "addObject:", v29);

        }
        else
        {
          for (i = 28; i != 60; i += 4)
          {
            if (!*(_DWORD *)(v35 + i))
              break;
            v32 = (void *)_CSStringCopyCFString();
            objc_msgSend(v28, "addObject:", v32);

          }
        }
        v30 = (char *)objc_msgSend(v28, "copy");
        -[_LSBoundIconInfo setFileNames:](*(void **)(a1 + 32), v30);
      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "_boundIconInfo");
        v28 = (id)objc_claimAutoreleasedReturnValue();
        -[_LSBoundIconInfo iconsDictionary]((uint64_t)v28);
        v30 = (char *)objc_claimAutoreleasedReturnValue();
        -[_LSBoundIconInfo setIconsDictionary:](*(void **)(a1 + 32), v30);
      }

      if (v38)
      {

      }
      return 1;
    }
    return v20;
  }
  v9 = *(_DWORD *)(active + 8);

  if ((v9 & 0x200) != 0)
    goto LABEL_23;
LABEL_3:
  if ((*(_BYTE *)(v3 + 9) & 0x20) != 0)
  {
    v6 = -[LSApplicationExtensionRecord _initWithContext:pluginID:pluginData:error:]([LSApplicationExtensionRecord alloc], "_initWithContext:pluginID:pluginData:error:", *(_QWORD *)(a1 + 56), *(unsigned int *)(v3 + 20), 0, 0);
    objc_msgSend(v6, "containingBundleRecord");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v10);

  }
  else
  {
    v4 = -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:]([LSApplicationRecord alloc], "_initWithContext:bundleID:bundleData:error:", *(_QWORD *)(a1 + 56), *(unsigned int *)(v3 + 20), 0, 0);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(id *)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "compatibilityObject");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  _UTTypeGetIconNames(**(void ***)(a1 + 56), v3);
  v14 = (char *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(v3 + 8) & 0x20) != 0)
    -[_LSBoundIconInfo setDocumentAllowOverride:](*(_QWORD *)(a1 + 32), 0);
  -[_LSBoundIconInfo setFileNames:](*(void **)(a1 + 32), v14);
  _UTTypeGetIconName(**(void ***)(a1 + 56), v3);
  v15 = objc_claimAutoreleasedReturnValue();
  _UTTypeGetGlyphName(**(void ***)(a1 + 56), v3);
  v16 = objc_claimAutoreleasedReturnValue();
  if (v15 | v16)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18 = v17;
    if (v15)
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, CFSTR("UTTypeIconName"));
    if (v16)
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, CFSTR("UTTypeGlyphName"));
    +[_LSLazyPropertyList lazyPropertyListWithPropertyList:]((uint64_t)_LSLazyPropertyList, v18);
    v19 = (char *)objc_claimAutoreleasedReturnValue();
    -[_LSBoundIconInfo setIconsDictionary:](*(void **)(a1 + 32), v19);

  }
  else
  {
    -[_LSBoundIconInfo setIconsDictionary:](*(void **)(a1 + 32), 0);
  }

  v20 = 1;
  if (-[_LSBoundIconInfo documentAllowOverride](*(_QWORD *)(a1 + 32)))
    goto LABEL_24;
  return v20;
}

void __42__LSDocumentProxy_Binding___boundIconInfo__block_invoke_140(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v4 = a2;
  if (v4)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    objc_storeStrong((id *)(v5 + 40), a2);
    v6 = *(_QWORD *)(v5 + 40);
    v7.receiver = *(id *)(a1 + 32);
    v7.super_class = (Class)LSDocumentProxy;
    objc_msgSendSuper2(&v7, sel__setBoundIconInfo_, v6);
  }

}

- (id)applicationsOrClaimBindings:(BOOL)a3 availableForOpeningWithStyle:(unsigned __int8)a4 handlerRank:(id)a5 limit:(unint64_t)a6 XPCConnection:(id)a7 error:(id *)a8
{
  uint64_t v10;
  _BOOL8 v11;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  id v35;
  _LSDocumentProxyBindingQuery *v36;
  uint8_t buf[4];
  LSDocumentProxy *v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v10 = a4;
  v11 = a3;
  v42 = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a7;
  v15 = (void *)MEMORY[0x186DAE7A0]();
  v29 = v13;
  v36 = -[_LSDocumentProxyBindingQuery initWithDocumentProxy:style:handlerRank:]([_LSDocumentProxyBindingQuery alloc], "initWithDocumentProxy:style:handlerRank:", self, v10, v13);
  -[_LSDocumentProxyBindingQuery setYieldClaimBindings:](v36, "setYieldClaimBindings:", v11);
  +[_LSQueryContext defaultContext](_LSQueryContext, "defaultContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", &v36, 1);
  if (v14)
  {
    v35 = 0;
    objc_msgSend(v16, "_resolveQueries:XPCConnection:error:", v17, v14, &v35);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v35;
    objc_msgSend(v18, "allValues");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = 0;
    objc_msgSend(v16, "resolveQueries:error:", v17, &v34);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v34;
    objc_msgSend(v18, "allValues");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v21;

  if (v22)
  {
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v24 = v22;
    v25 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v31 != v26)
            objc_enumerationMutation(v24);
          objc_msgSend(v23, "addObject:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
        }
        v25 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
      }
      while (v25);
    }
  }
  else
  {
    _LSDefaultLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v38 = self;
      v39 = 2112;
      v40 = v19;
      _os_log_impl(&dword_182882000, v24, OS_LOG_TYPE_DEFAULT, "Could not find apps for %@: %@.", buf, 0x16u);
    }
    v23 = 0;
  }

  objc_autoreleasePoolPop(v15);
  if (a8 && !v23)
    *a8 = objc_retainAutorelease(v19);

  return v23;
}

- (id)applicationsAvailableForOpeningWithStyle:(unsigned __int8)a3 limit:(unint64_t)a4 XPCConnection:(id)a5 error:(id *)a6
{
  -[LSDocumentProxy applicationsOrClaimBindings:availableForOpeningWithStyle:handlerRank:limit:XPCConnection:error:](self, "applicationsOrClaimBindings:availableForOpeningWithStyle:handlerRank:limit:XPCConnection:error:", 0, a3, 0, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)claimBindingsAvailableForOpeningWithStyle:(unsigned __int8)a3 handlerRank:(id)a4 limit:(unint64_t)a5 XPCConnection:(id)a6 error:(id *)a7
{
  -[LSDocumentProxy applicationsOrClaimBindings:availableForOpeningWithStyle:handlerRank:limit:XPCConnection:error:](self, "applicationsOrClaimBindings:availableForOpeningWithStyle:handlerRank:limit:XPCConnection:error:", 1, a3, a4, a5, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
