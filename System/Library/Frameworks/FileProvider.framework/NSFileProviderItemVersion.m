@implementation NSFileProviderItemVersion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEditorDeviceName, 0);
  objc_storeStrong((id *)&self->_metadataVersion, 0);
  objc_storeStrong((id *)&self->_contentVersion, 0);
  objc_storeStrong((id *)&self->_equivalentMetadataVersions, 0);
  objc_storeStrong((id *)&self->_equivalentContentVersions, 0);
}

- (NSData)contentVersion
{
  return self->_contentVersion;
}

- (NSFileProviderItemVersion)init
{
  NSFileProviderItemVersion *v3;

  +[_NSFileProviderEmptyItemVersion emptyVersion](_NSFileProviderEmptyItemVersion, "emptyVersion");
  v3 = (NSFileProviderItemVersion *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)equivalentMetadataVersions
{
  return self->_equivalentMetadataVersions;
}

- (NSArray)equivalentContentVersions
{
  return self->_equivalentContentVersions;
}

- (NSString)lastEditorDeviceName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSFileProviderItemVersion)initWithContentVersion:(id)a3 metadataVersion:(id)a4 lastEditorDeviceName:(id)a5
{
  return -[NSFileProviderItemVersion initWithMainContentVersion:equivalentContentVersions:mainMetadataVersion:equivalentMetadataVersions:lastEditorDeviceName:conflictResolved:](self, "initWithMainContentVersion:equivalentContentVersions:mainMetadataVersion:equivalentMetadataVersions:lastEditorDeviceName:conflictResolved:", a3, MEMORY[0x1E0C9AA60], a4, MEMORY[0x1E0C9AA60], a5, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentVersion, CFSTR("c"));
  if (-[NSArray count](self->_equivalentContentVersions, "count"))
    objc_msgSend(v4, "encodeObject:forKey:", self->_equivalentContentVersions, CFSTR("ec"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_metadataVersion, CFSTR("m"));
  if (-[NSArray count](self->_equivalentMetadataVersions, "count"))
    objc_msgSend(v4, "encodeObject:forKey:", self->_equivalentMetadataVersions, CFSTR("em"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_lastEditorDeviceName, CFSTR("ledn"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_conflictResolved, CFSTR("cr"));

}

- (NSFileProviderItemVersion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSFileProviderItemVersion *v18;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("c"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("ec"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E0C9AA60];
  if (v6)
    v9 = (void *)v6;
  else
    v9 = (void *)MEMORY[0x1E0C9AA60];
  v10 = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("m"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("em"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (void *)v12;
  else
    v14 = v8;
  v15 = v14;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ledn"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cr"));

  v18 = -[NSFileProviderItemVersion initWithMainContentVersion:equivalentContentVersions:mainMetadataVersion:equivalentMetadataVersions:lastEditorDeviceName:conflictResolved:](self, "initWithMainContentVersion:equivalentContentVersions:mainMetadataVersion:equivalentMetadataVersions:lastEditorDeviceName:conflictResolved:", v5, v10, v11, v15, v16, v17);
  return v18;
}

- (NSFileProviderItemVersion)initWithMainContentVersion:(id)a3 equivalentContentVersions:(id)a4 mainMetadataVersion:(id)a5 equivalentMetadataVersions:(id)a6 lastEditorDeviceName:(id)a7
{
  return -[NSFileProviderItemVersion initWithMainContentVersion:equivalentContentVersions:mainMetadataVersion:equivalentMetadataVersions:lastEditorDeviceName:conflictResolved:](self, "initWithMainContentVersion:equivalentContentVersions:mainMetadataVersion:equivalentMetadataVersions:lastEditorDeviceName:conflictResolved:", a3, a4, a5, a6, a7, 0);
}

- (NSFileProviderItemVersion)initWithContentVersion:(NSData *)contentVersion metadataVersion:(NSData *)metadataVersion
{
  return -[NSFileProviderItemVersion initWithMainContentVersion:equivalentContentVersions:mainMetadataVersion:equivalentMetadataVersions:lastEditorDeviceName:conflictResolved:](self, "initWithMainContentVersion:equivalentContentVersions:mainMetadataVersion:equivalentMetadataVersions:lastEditorDeviceName:conflictResolved:", contentVersion, MEMORY[0x1E0C9AA60], metadataVersion, MEMORY[0x1E0C9AA60], 0, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSData)beforeFirstSyncComponent
{
  if (beforeFirstSyncComponent_onceToken != -1)
    dispatch_once(&beforeFirstSyncComponent_onceToken, &__block_literal_global_0);
  return (NSData *)(id)beforeFirstSyncComponent_beforeFirstSync;
}

void __53__NSFileProviderItemVersion_beforeFirstSyncComponent__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(CFSTR("NSFileProviderEmptyItemVersionBeforeFirstSyncComponent"), "dataUsingEncoding:", 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)beforeFirstSyncComponent_beforeFirstSync;
  beforeFirstSyncComponent_beforeFirstSync = v0;

}

- (NSFileProviderItemVersion)initWithMainContentVersion:(id)a3 equivalentContentVersions:(id)a4 mainMetadataVersion:(id)a5 equivalentMetadataVersions:(id)a6 lastEditorDeviceName:(id)a7 conflictResolved:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSFileProviderItemVersion *v20;
  uint64_t v21;
  NSData *contentVersion;
  uint64_t v23;
  NSArray *equivalentContentVersions;
  uint64_t v25;
  NSData *metadataVersion;
  uint64_t v27;
  NSArray *equivalentMetadataVersions;
  uint64_t v29;
  NSString *lastEditorDeviceName;
  void *v32;
  void *v33;
  objc_super v34;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  if ((unint64_t)objc_msgSend(v16, "count") >= 0x10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileProviderItemVersion.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("equivalentContentVersions.count < 16"));

  }
  if ((unint64_t)objc_msgSend(v18, "count") >= 0x10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileProviderItemVersion.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("equivalentMetadataVersions.count < 16"));

  }
  v34.receiver = self;
  v34.super_class = (Class)NSFileProviderItemVersion;
  v20 = -[NSFileProviderItemVersion init](&v34, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v15, "copy");
    contentVersion = v20->_contentVersion;
    v20->_contentVersion = (NSData *)v21;

    v23 = objc_msgSend(v16, "copy");
    equivalentContentVersions = v20->_equivalentContentVersions;
    v20->_equivalentContentVersions = (NSArray *)v23;

    v25 = objc_msgSend(v17, "copy");
    metadataVersion = v20->_metadataVersion;
    v20->_metadataVersion = (NSData *)v25;

    v27 = objc_msgSend(v18, "copy");
    equivalentMetadataVersions = v20->_equivalentMetadataVersions;
    v20->_equivalentMetadataVersions = (NSArray *)v27;

    v29 = objc_msgSend(v19, "copy");
    lastEditorDeviceName = v20->_lastEditorDeviceName;
    v20->_lastEditorDeviceName = (NSString *)v29;

    v20->_conflictResolved = a8;
  }

  return v20;
}

- (BOOL)isEmpty
{
  return !-[NSData length](self->_contentVersion, "length") && -[NSData length](self->_metadataVersion, "length") == 0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p (%@, %@), resolved: %hhd>"), objc_opt_class(), self, self->_contentVersion, self->_metadataVersion, self->_conflictResolved);
}

- (BOOL)isEqual:(id)a3
{
  NSFileProviderItemVersion *v4;
  NSFileProviderItemVersion *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (NSFileProviderItemVersion *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[NSFileProviderItemVersion metadataVersion](v5, "metadataVersion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSFileProviderItemVersion metadataVersion](self, "metadataVersion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[NSFileProviderItemVersion contentVersion](v5, "contentVersion");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSFileProviderItemVersion contentVersion](self, "contentVersion");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[NSFileProviderItemVersion contentVersion](self, "contentVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[NSFileProviderItemVersion metadataVersion](self, "metadataVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)versionRewritingBeforeFirstSync
{
  NSFileProviderItemVersion *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSFileProviderItemVersion *v8;

  v3 = [NSFileProviderItemVersion alloc];
  -[NSFileProviderItemVersion contentVersion](self, "contentVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  rewriteBeforeFirstSync(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSFileProviderItemVersion metadataVersion](self, "metadataVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  rewriteBeforeFirstSync(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSFileProviderItemVersion initWithContentVersion:metadataVersion:](v3, "initWithContentVersion:metadataVersion:", v5, v7);

  return v8;
}

- (id)etagHash
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  -[NSFileProviderItemVersion contentVersion](self, "contentVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 1);
  if (!v5)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x1E0CB3780], "characterSetWithCharactersInString:", CFSTR("}{/\\%*|\"<>"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addCharactersInRange:", 0, 31);
  objc_msgSend(v6, "addCharactersInRange:", 127, 128);
  if (objc_msgSend(v5, "rangeOfCharacterFromSet:", v6) != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_6:
    objc_msgSend(v4, "base64EncodedDataWithOptions:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 1);

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileProviderItemVersion.m"), 231, CFSTR("Can't base64 encode version"));

    }
    v5 = v8;

    goto LABEL_9;
  }
  if ((unint64_t)objc_msgSend(v5, "length") > 0x50)
  {
    if ((unint64_t)(4 * objc_msgSend(v5, "length")) <= 0xF2)
      goto LABEL_6;

LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3940], "fp_hashForToken:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v5 = v5;
LABEL_9:

  v9 = v5;
LABEL_12:

  return v9;
}

- (NSData)metadataVersion
{
  return self->_metadataVersion;
}

- (BOOL)conflictResolved
{
  return self->_conflictResolved;
}

- (void)setConflictResolved:(BOOL)a3
{
  self->_conflictResolved = a3;
}

@end
