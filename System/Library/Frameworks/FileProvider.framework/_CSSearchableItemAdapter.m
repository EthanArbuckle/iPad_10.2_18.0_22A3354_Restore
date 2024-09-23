@implementation _CSSearchableItemAdapter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
}

- (NSDate)creationDate
{
  void *v2;
  void *v3;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentCreationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSNumber)childItemCount
{
  void *v2;
  void *v3;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subItemCount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (unint64_t)capabilities
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeForKey:", CFSTR("FPCapabilities"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributeForKey:", CFSTR("FPEvictable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v7, "BOOLValue");

  if ((_DWORD)v4)
    return v5 | 0x40;
  else
    return v5;
}

- (CSSearchableItemAttributeSet)attributeSet
{
  return -[CSSearchableItem attributeSet](self->_item, "attributeSet");
}

- (NSString)parentItemIdentifier
{
  void *v2;
  void *v3;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", CFSTR("FPParentFileItemID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)itemIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CSSearchableItem attributeSet](self->_item, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeForKey:", CFSTR("FPOnDiskIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "fp_fromParsedDiskIdentifier:", objc_msgSend(v4, "integerValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CSSearchableItem uniqueIdentifier](self->_item, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSearchableItem attributeSet](self->_item, "attributeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileProviderDomainIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPItemID fpIdentifierFromCoreSpotlightIdentifier:domainIdentifier:](FPItemID, "fpIdentifierFromCoreSpotlightIdentifier:domainIdentifier:", v6, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (NSString)filename
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeForKey:", CFSTR("FPFilename"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[_CSSearchableItemAdapter item](self, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filename");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (_CSSearchableItemAdapter)initWithSearchableItem:(id)a3
{
  id v5;
  _CSSearchableItemAdapter *v6;
  _CSSearchableItemAdapter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CSSearchableItemAdapter;
  v6 = -[_CSSearchableItemAdapter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_item, a3);

  return v7;
}

- (UTType)contentType
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CEC3F8];
  -[_CSSearchableItemAdapter typeIdentifier](self, "typeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fp_cachedTypeWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UTType *)v4;
}

- (NSString)typeIdentifier
{
  void *v2;
  void *v3;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)tags
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeForKey:", CFSTR("_kMDItemUserTags"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "fp_mapWithIndex:", &__block_literal_global_100);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userTags");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "attributeForKey:", CFSTR("FPTagColors"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 && (v10 = objc_msgSend(v7, "count"), v10 == objc_msgSend(v9, "count")))
      {
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __32___CSSearchableItemAdapter_tags__block_invoke_2;
        v12[3] = &unk_1E444DD30;
        v13 = v9;
        objc_msgSend(v7, "fp_mapWithIndex:", v12);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v7, "fp_mapWithIndex:", &__block_literal_global_102);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (NSDictionary)userInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeForKey:", CFSTR("FPUserInfoKeys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && (-[_CSSearchableItemAdapter attributeSet](self, "attributeSet"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "attributeForKey:", CFSTR("FPUserInfoValues")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    FPDecodeUserInfo(v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return (NSDictionary *)v7;
}

- (NSError)uploadingError
{
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v4 = (_QWORD *)getMDItemUploadErrorSymbolLoc_ptr;
  v14 = getMDItemUploadErrorSymbolLoc_ptr;
  if (!getMDItemUploadErrorSymbolLoc_ptr)
  {
    v5 = (void *)CoreSpotlightLibrary_1();
    v4 = dlsym(v5, "MDItemUploadError");
    v12[3] = (uint64_t)v4;
    getMDItemUploadErrorSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v11, 8);
  if (!v4)
    -[_CSSearchableItemAdapter uploadingError].cold.1();
  objc_msgSend(v3, "attributeForKey:", *v4, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[FPSearchableItemError errorFromString:](FPSearchableItemError, "errorFromString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CSSearchableItemAdapter fileURL](self, "fileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fp_annotatedErrorWithURL:variant:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return (NSError *)v9;
}

- (NSString)providerIdentifier
{
  void *v2;
  void *v3;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileProviderID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)preformattedOwnerName
{
  void *v2;
  void *v3;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ownerName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)preformattedMostRecentEditorName
{
  void *v2;
  void *v3;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastEditorName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSPersonNameComponents)ownerNameComponents
{
  return 0;
}

- (NSData)originatorInfo
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", CFSTR("com.apple.synapse:DocumentAttributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = (id)objc_opt_class();
      v6 = v9;
      _os_log_impl(&dword_1A0A34000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Found invalid class for originatorInfo, expected NSData, got %@", (uint8_t *)&v8, 0xCu);

    }
    goto LABEL_7;
  }
  v4 = v3;
LABEL_8:

  return (NSData *)v4;
}

- (NSPersonNameComponents)mostRecentEditorNameComponents
{
  return 0;
}

- (NSDate)lastUsedDate
{
  void *v2;
  void *v3;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastUsedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSFileProviderItemVersion)itemVersion
{
  void *v2;
  void *v3;
  NSFileProviderItemVersion *v4;
  NSFileProviderItemVersion *v5;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", CFSTR("FPItemVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[FPSearchableItemVersion versionFromString:](FPSearchableItemVersion, "versionFromString:", v3);
    v4 = (NSFileProviderItemVersion *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_alloc_init(NSFileProviderItemVersion);
  }
  v5 = v4;

  return v5;
}

- (BOOL)isUploading
{
  void *v2;
  void *v3;
  char v4;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isUploading");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isUploaded
{
  void *v2;
  void *v3;
  char v4;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isUploaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isTrashed
{
  void *v2;
  void *v3;
  char v4;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isTrashed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isTopLevelSharedItem
{
  void *v2;
  void *v3;
  char v4;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", CFSTR("FPIsTopLevelSharedItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isShared
{
  void *v2;
  void *v3;
  char v4;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isShared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isSharedByCurrentUser
{
  void *v2;
  void *v3;
  char v4;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isUserOwned");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isRecursivelyDownloaded
{
  void *v2;
  void *v3;
  char v4;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", CFSTR("FPItemIsRecursivelyDownloaded"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isPinned
{
  void *v2;
  void *v3;
  char v4;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", CFSTR("FPItemIsPinned"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isMostRecentVersionDownloaded
{
  void *v2;
  void *v3;
  char v4;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", CFSTR("FPMostRecentVersionDownloaded"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isInPinnedFolder
{
  void *v2;
  void *v3;
  char v4;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", CFSTR("FPItemIsInPinnedFolder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isDownloading
{
  void *v2;
  void *v3;
  char v4;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isDownloading");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isDownloaded
{
  void *v2;
  void *v3;
  char v4;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", CFSTR("FPDownloaded"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isCollaborationInvitation
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", CFSTR("com_apple_mobilesms_syndicationContentType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") > 0;

  return v4;
}

- (NSString)fp_parentDomainIdentifier
{
  void *v2;
  void *v3;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", CFSTR("FPParentDomainID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)fp_isUbiquitous
{
  void *v2;
  void *v3;
  char v4;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", CFSTR("FPIsUbiquitous"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)fp_isLastModifiedByCurrentUser
{
  void *v2;
  void *v3;
  char v4;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", CFSTR("FPLastModifiedByCurrentUser"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)fp_isContainer
{
  void *v2;
  void *v3;
  char v4;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", CFSTR("FPIsContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (NSString)fp_domainIdentifier
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  -[CSSearchableItem attributeSet](self->_item, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileProviderDomainIdentifier");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("NSFileProviderDomainDefaultIdentifier");
  v5 = v3;

  return v5;
}

- (NSString)fp_cloudContainerIdentifier
{
  void *v2;
  void *v3;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", CFSTR("FPCloudContainerID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)formerIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CSSearchableItem attributeSet](self->_item, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeForKey:", CFSTR("FPOnDiskIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CSSearchableItem uniqueIdentifier](self->_item, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSearchableItem attributeSet](self->_item, "attributeSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileProviderDomainIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPItemID fpIdentifierFromCoreSpotlightIdentifier:domainIdentifier:](FPItemID, "fpIdentifierFromCoreSpotlightIdentifier:domainIdentifier:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSNumber)favoriteRank
{
  void *v2;
  void *v3;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "favoriteRank");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSError)downloadingError
{
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v4 = (_QWORD *)getMDItemDownloadErrorSymbolLoc_ptr;
  v14 = getMDItemDownloadErrorSymbolLoc_ptr;
  if (!getMDItemDownloadErrorSymbolLoc_ptr)
  {
    v5 = (void *)CoreSpotlightLibrary_1();
    v4 = dlsym(v5, "MDItemDownloadError");
    v12[3] = (uint64_t)v4;
    getMDItemDownloadErrorSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v11, 8);
  if (!v4)
    -[_CSSearchableItemAdapter downloadingError].cold.1();
  objc_msgSend(v3, "attributeForKey:", *v4, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[FPSearchableItemError errorFromString:](FPSearchableItemError, "errorFromString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CSSearchableItemAdapter fileURL](self, "fileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fp_annotatedErrorWithURL:variant:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return (NSError *)v9;
}

- (NSNumber)documentSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileSize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileSize");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v5, "numberWithDouble:", v8 * 1000000.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return (NSNumber *)v9;
}

- (NSString)displayName
{
  void *v2;
  void *v3;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDate)contentModificationDate
{
  void *v2;
  void *v3;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentModificationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (id)collaborationIdentifier
{
  void *v2;
  void *v3;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", CFSTR("FPCollaborationIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSData)tagData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_CSSearchableItemAdapter tags](self, "tags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    FPGetTagsDataForTags(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributeForKey:", CFSTR("FPTagsData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSData *)v5;
}

+ (id)fp_queryFetchAttributes
{
  return +[FPItem fp_queryFetchAttributes](FPItem, "fp_queryFetchAttributes");
}

- (id)sharingCurrentUserRole
{
  void *v2;
  void *v3;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedItemCurrentUserRole");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)containerSubitemCount
{
  void *v2;
  void *v3;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subItemCount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSPersonNameComponents)fp_addedByNameComponents
{
  return 0;
}

- (BOOL)fp_isAddedByCurrentUser
{
  return 0;
}

- (NSData)versionIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[_CSSearchableItemAdapter itemVersion](self, "itemVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "contentVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "versionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 0);
    else
      v6 = 0;

  }
  return (NSData *)v6;
}

- (id)sharingCurrentUserPermissions
{
  void *v2;
  void *v3;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", CFSTR("FPSharingCurrentUserPermissions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)fp_appContainerBundleIdentifier
{
  void *v2;
  void *v3;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", CFSTR("FPAppContainerBundleID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)fp_isContainerPristine
{
  void *v2;
  void *v3;
  char v4;

  -[_CSSearchableItemAdapter attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", CFSTR("FPIsContainerPristine"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (CSSearchableItem)item
{
  return self->_item;
}

- (void)uploadingError
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMDItemUploadError(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("FPItem+CSSearchableItem.m"), 58, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

- (void)downloadingError
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMDItemDownloadError(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("FPItem+CSSearchableItem.m"), 59, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

@end
