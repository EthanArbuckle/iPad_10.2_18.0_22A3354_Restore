@implementation FPItem

- (NSDate)lastUsedDate
{
  return self->_lastUsedDate;
}

- (BOOL)isUploaded
{
  return self->_uploaded;
}

- (NSNumber)childItemCount
{
  return self->_childItemCount;
}

- (NSNumber)documentSize
{
  return self->_documentSize;
}

- (NSDate)contentModificationDate
{
  return self->_contentModificationDate;
}

- (NSDictionary)extendedAttributes
{
  return self->_extendedAttributes;
}

- (NSArray)tags
{
  return self->_tags;
}

- (void)setMostRecentVersionDownloaded:(BOOL)a3
{
  self->_mostRecentVersionDownloaded = a3;
}

- (BOOL)isTopLevelSharedItem
{
  return self->_topLevelSharedItem;
}

- (void)setFileID:(unint64_t)a3
{
  self->_fileID = a3;
}

- (void)setFp_lastModifiedByCurrentUser:(BOOL)a3
{
  self->_fp_lastModifiedByCurrentUser = a3;
}

- (void)setUploading:(BOOL)a3
{
  self->_uploading = a3;
}

- (void)setUploaded:(BOOL)a3
{
  self->_uploaded = a3;
}

- (BOOL)isIgnoreRoot
{
  return self->_ignoreRoot;
}

- (NSFileProviderTypeAndCreator)typeAndCreator
{
  return self->_typeAndCreator;
}

- (BOOL)fp_isLastModifiedByCurrentUser
{
  return self->_fp_lastModifiedByCurrentUser;
}

- (BOOL)isMostRecentVersionDownloaded
{
  return self->_mostRecentVersionDownloaded;
}

- (NSNumber)isDownloadRequested
{
  return self->_isDownloadRequested;
}

- (NSNumber)favoriteRank
{
  return self->_favoriteRank;
}

- (NSString)sharingPermissions
{
  return self->_sharingPermissions;
}

- (BOOL)isSharedByCurrentUser
{
  return self->_sharedByCurrentUser;
}

- (BOOL)isPackage
{
  FPItem *v2;
  _BOOL4 isPackage;
  UTType *v4;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_typesEvaluated)
  {
    isPackage = v2->_isPackage;
    objc_sync_exit(v2);
  }
  else
  {
    v4 = v2->_contentType;
    objc_sync_exit(v2);

    -[FPItem _evaluateTypes:](v2, "_evaluateTypes:", v4);
    isPackage = v2->_isPackage;
    v2 = (FPItem *)v4;
  }

  return isPackage;
}

- (FPItemID)itemID
{
  return -[FPItemID initWithProviderID:domainIdentifier:itemIdentifier:]([FPItemID alloc], "initWithProviderID:domainIdentifier:itemIdentifier:", self->_providerID, self->_domainIdentifier, self->_itemIdentifier);
}

- (FPItemID)formerItemID
{
  FPItemID *v2;

  if (self->_formerIdentifier)
    v2 = -[FPItemID initWithProviderID:domainIdentifier:itemIdentifier:]([FPItemID alloc], "initWithProviderID:domainIdentifier:itemIdentifier:", self->_providerID, self->_domainIdentifier, self->_formerIdentifier);
  else
    v2 = 0;
  return v2;
}

- (NSString)parentItemIdentifier
{
  return self->_parentItemIdentifier;
}

- (void)setOffline:(BOOL)a3
{
  self->_offline = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileSystemFilename, 0);
  objc_storeStrong((id *)&self->_originatorInfo, 0);
  objc_storeStrong((id *)&self->_collaborationIdentifier, 0);
  objc_storeStrong((id *)&self->_quarantineBlob, 0);
  objc_storeStrong((id *)&self->_providerID, 0);
  objc_storeStrong((id *)&self->_cloudContainerIdentifier, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_favoriteRank, 0);
  objc_storeStrong((id *)&self->_placeholderIdentifier, 0);
  objc_storeStrong((id *)&self->_hasUnresolvedConflicts, 0);
  objc_storeStrong((id *)&self->_parentFormerIdentifier, 0);
  objc_storeStrong((id *)&self->_formerIdentifier, 0);
  objc_storeStrong((id *)&self->_preformattedMostRecentEditorName, 0);
  objc_storeStrong((id *)&self->_preformattedOwnerName, 0);
  objc_storeStrong((id *)&self->_fp_appContainerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_spotlightDomainIdentifier, 0);
  objc_storeStrong((id *)&self->_fp_spotlightSubDomainIdentifier, 0);
  objc_storeStrong((id *)&self->_conflictingVersions, 0);
  objc_storeStrong((id *)&self->_inheritedUserInfo, 0);
  objc_storeStrong((id *)&self->_symlinkTargetPath, 0);
  objc_storeStrong((id *)&self->_decorations, 0);
  objc_storeStrong((id *)&self->_detachedRootLogicalURL, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_fp_parentDomainIdentifier, 0);
  objc_storeStrong((id *)&self->_extendedAttributes, 0);
  objc_storeStrong((id *)&self->_containerDisplayName, 0);
  objc_storeStrong((id *)&self->_sharingPermissions, 0);
  objc_storeStrong((id *)&self->_isDownloadRequested, 0);
  objc_storeStrong((id *)&self->_mostRecentEditorNameComponents, 0);
  objc_storeStrong((id *)&self->_ownerNameComponents, 0);
  objc_storeStrong((id *)&self->_itemVersion, 0);
  objc_storeStrong((id *)&self->_versionIdentifier, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_documentSize, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_childItemCount, 0);
  objc_storeStrong((id *)&self->_uploadingError, 0);
  objc_storeStrong((id *)&self->_downloadingError, 0);
  objc_storeStrong((id *)&self->_contentModificationDate, 0);
  objc_storeStrong((id *)&self->_parentItemIdentifier, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_resolvedUserInfoCache, 0);
  objc_storeStrong((id *)&self->_urlWrapper, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

- (void)setFp_isDownloadRequested:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *isDownloadRequested;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  isDownloadRequested = self->_isDownloadRequested;
  self->_isDownloadRequested = v4;

}

- (void)setIsContainerPristine:(BOOL)a3
{
  self->_isContainerPristine = a3;
}

- (void)setUploadingError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setUbiquitous:(BOOL)a3
{
  self->_isUbiquitous = a3;
}

- (void)setTypeAndCreator:(NSFileProviderTypeAndCreator)a3
{
  self->_typeAndCreator = a3;
}

- (void)setTopLevelSharedItem:(BOOL)a3
{
  self->_topLevelSharedItem = a3;
}

- (void)setTags:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setSupportsMostRecentVersionDownloaded:(BOOL)a3
{
  self->_supportsMostRecentVersionDownloaded = a3;
}

- (void)setSpotlightDomainIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (void)setSharingPermissions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void)setSharedByCurrentUser:(BOOL)a3
{
  self->_sharedByCurrentUser = a3;
}

- (void)setShared:(BOOL)a3
{
  self->_shared = a3;
}

- (void)setRecursivelyDownloaded:(BOOL)a3
{
  self->_recursivelyDownloaded = a3;
}

- (void)setLastUsedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (void)setInheritedUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void)setInheritedContentPolicy:(int64_t)a3
{
  self->_inheritedContentPolicy = a3;
}

- (void)setIgnoreRoot:(BOOL)a3
{
  self->_ignoreRoot = a3;
}

- (void)setHasUnresolvedConflicts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (void)setFileSystemFlags:(unint64_t)a3
{
  self->_fileSystemFlags = a3;
}

- (void)setFavoriteRank:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (void)setExcludedFromSync:(BOOL)a3
{
  self->_excludedFromSync = a3;
}

- (void)setEffectiveContentPolicy:(int64_t)a3
{
  self->_effectiveContentPolicy = a3;
}

- (void)setDownloadingError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setDownloading:(BOOL)a3
{
  self->_downloading = a3;
}

- (void)setDownloaded:(BOOL)a3
{
  self->_downloaded = a3;
}

- (void)setDocumentSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setContentPolicy:(int64_t)a3
{
  self->_contentPolicy = a3;
}

- (void)setContentModificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setContainerDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void)setCloudContainerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (NSError)uploadingError
{
  NSError *uploadingError;
  void *v4;

  uploadingError = self->_uploadingError;
  if (uploadingError)
    return uploadingError;
  if (self->_uploading && self->_offline)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderErrorDomain"), -1004, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSError *)v4;
}

- (unint64_t)fileID
{
  return self->_fileID;
}

- (void)setFp_displayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSPersonNameComponents)ownerNameComponents
{
  void *v3;
  NSPersonNameComponents *v4;
  NSPersonNameComponents *ownerNameComponents;

  if (!self->_ownerNameComponents && -[NSString length](self->_preformattedOwnerName, "length"))
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "personNameComponentsFromString:", self->_preformattedOwnerName);
    v4 = (NSPersonNameComponents *)objc_claimAutoreleasedReturnValue();
    ownerNameComponents = self->_ownerNameComponents;
    self->_ownerNameComponents = v4;

  }
  return self->_ownerNameComponents;
}

- (FPItem)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSString *v26;
  NSString *formerIdentifier;
  NSString *v28;
  NSString *displayName;
  NSNumber *v30;
  NSNumber *documentSize;
  FPSandboxingURLWrapper *v32;
  FPSandboxingURLWrapper *urlWrapper;
  NSURL *v34;
  NSURL *fileURL;
  NSURL *v36;
  NSURL *detachedRootLogicalURL;
  NSDate *v38;
  NSDate *creationDate;
  NSDate *v40;
  NSDate *contentModificationDate;
  NSDate *v42;
  NSDate *lastUsedDate;
  void *v44;
  uint64_t v45;
  void *v46;
  NSArray *v47;
  NSArray *tags;
  NSNumber *v49;
  NSNumber *favoriteRank;
  NSError *v51;
  NSError *uploadingError;
  NSError *v53;
  NSError *downloadingError;
  NSPersonNameComponents *v55;
  NSPersonNameComponents *ownerNameComponents;
  NSPersonNameComponents *v57;
  NSPersonNameComponents *mostRecentEditorNameComponents;
  NSString *v59;
  NSString *collaborationIdentifier;
  NSData *v61;
  NSData *originatorInfo;
  NSNumber *v63;
  NSNumber *childItemCount;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  NSDictionary *v71;
  NSDictionary *userInfo;
  NSString *v73;
  NSString *placeholderIdentifier;
  NSData *v75;
  NSData *versionIdentifier;
  NSFileProviderItemVersion *v77;
  NSFileProviderItemVersion *itemVersion;
  NSString *v79;
  NSString *spotlightDomainIdentifier;
  NSString *v81;
  NSString *fp_spotlightSubDomainIdentifier;
  NSNumber *v83;
  NSNumber *hasUnresolvedConflicts;
  NSNumber *v85;
  NSNumber *isDownloadRequested;
  NSString *v87;
  NSString *sharingPermissions;
  NSString *v89;
  NSString *containerDisplayName;
  NSString *v91;
  NSString *fp_appContainerBundleIdentifier;
  NSString *v93;
  NSString *fp_parentDomainIdentifier;
  NSString *v95;
  NSString *cloudContainerIdentifier;
  void *v97;
  uint64_t v98;
  void *v99;
  NSArray *v100;
  NSArray *conflictingVersions;
  void *v102;
  void *v103;
  void *v104;
  NSDictionary *v105;
  NSDictionary *extendedAttributes;
  void *v107;
  void *v108;
  void *v109;
  NSArray *v110;
  NSArray *decorations;
  NSDictionary *v112;
  NSDictionary *inheritedUserInfo;
  FPItem *v114;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *context;
  void *v122;
  __CFString *v123;
  _QWORD v124[2];
  _QWORD v125[5];

  v125[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  context = (void *)MEMORY[0x1A1B00664]();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_providerIdentifier"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_domainIdentifier"));
  v123 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v123)
    v123 = CFSTR("NSFileProviderDomainDefaultIdentifier");
  objc_msgSend(MEMORY[0x1E0CB3940], "fp_providerDomainIDFromProviderID:domainIdentifier:", v122, v123);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fp_checkProviderIdentifier:", v6);

  if (!v7)
  {
    v20 = 1;
    goto LABEL_22;
  }
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_itemIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_parentItemIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_filename"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_contentType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = v11;
    v13 = v10;
    v14 = v9;
    v15 = v8;
    v16 = (void *)MEMORY[0x1E0CEC3F8];
    objc_msgSend(v11, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fp_cachedTypeWithIdentifier:alreadyAvailableType:", v17, v12);
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v18;
    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v15;
        v9 = v14;
        v10 = v13;
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPItem.m"), 961, CFSTR("received contentType with an invalid type"));

    }
    v8 = v15;
    v9 = v14;
    v10 = v13;
  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_typeIdentifier"));
  v22 = objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    fp_current_or_default_log();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
      -[FPItem initWithCoder:].cold.1((uint64_t)v8, v10);
    v20 = 1;
    goto LABEL_19;
  }
  v23 = (void *)v22;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "fp_cachedTypeWithIdentifier:", v22);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v19;
  v19 = (void *)v24;

LABEL_14:
  self = -[FPItem initWithProviderID:domainIdentifier:itemIdentifier:parentItemIdentifier:filename:contentType:](self, "initWithProviderID:domainIdentifier:itemIdentifier:parentItemIdentifier:filename:contentType:", v122, v123, v8, v9, v10, v19);
  if (!self)
  {
    v20 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_formerIdentifier"));
  v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  formerIdentifier = self->_formerIdentifier;
  self->_formerIdentifier = v26;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_displayName"));
  v28 = (NSString *)objc_claimAutoreleasedReturnValue();
  displayName = self->_displayName;
  self->_displayName = v28;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_documentSize"));
  v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  documentSize = self->_documentSize;
  self->_documentSize = v30;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_urlWrapper"));
  v32 = (FPSandboxingURLWrapper *)objc_claimAutoreleasedReturnValue();
  urlWrapper = self->_urlWrapper;
  self->_urlWrapper = v32;

  -[FPSandboxingURLWrapper url](self->_urlWrapper, "url");
  v34 = (NSURL *)objc_claimAutoreleasedReturnValue();
  fileURL = self->_fileURL;
  self->_fileURL = v34;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_detachedRootLogicalURL"));
  v36 = (NSURL *)objc_claimAutoreleasedReturnValue();
  detachedRootLogicalURL = self->_detachedRootLogicalURL;
  self->_detachedRootLogicalURL = v36;

  self->_capabilities = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("_capabilities"));
  self->_enumerationOrigin = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("_enumerationOrigin"));
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_creationDate"));
  v38 = (NSDate *)objc_claimAutoreleasedReturnValue();
  creationDate = self->_creationDate;
  self->_creationDate = v38;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_contentModificationDate"));
  v40 = (NSDate *)objc_claimAutoreleasedReturnValue();
  contentModificationDate = self->_contentModificationDate;
  self->_contentModificationDate = v40;

  self->_trashed = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("_trashed"));
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastUsedDate"));
  v42 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastUsedDate = self->_lastUsedDate;
  self->_lastUsedDate = v42;

  v44 = (void *)MEMORY[0x1E0C99E60];
  v120 = v19;
  v45 = objc_opt_class();
  objc_msgSend(v44, "setWithObjects:", v45, objc_opt_class(), 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v46, CFSTR("_tags"));
  v47 = (NSArray *)objc_claimAutoreleasedReturnValue();
  tags = self->_tags;
  self->_tags = v47;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_favoriteRank"));
  v49 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  favoriteRank = self->_favoriteRank;
  self->_favoriteRank = v49;

  self->_uploaded = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("_uploaded"));
  self->_uploading = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("_uploading"));
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_uploadingError"));
  v51 = (NSError *)objc_claimAutoreleasedReturnValue();
  uploadingError = self->_uploadingError;
  self->_uploadingError = v51;

  self->_excludedFromSync = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("_excludedFromSync"));
  self->_ignoreRoot = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("_ignoreRoot"));
  self->_exclusionType = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("_exclusionType"));
  self->_downloaded = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("_downloaded"));
  self->_downloading = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("_downloading"));
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_downloadingError"));
  v53 = (NSError *)objc_claimAutoreleasedReturnValue();
  downloadingError = self->_downloadingError;
  self->_downloadingError = v53;

  self->_mostRecentVersionDownloaded = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("_mostRecentVersionDownloaded"));
  self->_shared = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("_shared"));
  self->_sharedByCurrentUser = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("_sharedByCurrentUser"));
  self->_fp_lastModifiedByCurrentUser = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("_fp_lastModifiedByCurrentUser"));
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ownerNameComponents"));
  v55 = (NSPersonNameComponents *)objc_claimAutoreleasedReturnValue();
  ownerNameComponents = self->_ownerNameComponents;
  self->_ownerNameComponents = v55;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_mostRecentEditorNameComponents"));
  v57 = (NSPersonNameComponents *)objc_claimAutoreleasedReturnValue();
  mostRecentEditorNameComponents = self->_mostRecentEditorNameComponents;
  self->_mostRecentEditorNameComponents = v57;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_collaborationIdentifier"));
  v59 = (NSString *)objc_claimAutoreleasedReturnValue();
  collaborationIdentifier = self->_collaborationIdentifier;
  self->_collaborationIdentifier = v59;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_originatorInfo"));
  v61 = (NSData *)objc_claimAutoreleasedReturnValue();
  originatorInfo = self->_originatorInfo;
  self->_originatorInfo = v61;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_childItemCount"));
  v63 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  childItemCount = self->_childItemCount;
  self->_childItemCount = v63;

  v117 = (void *)MEMORY[0x1E0C99E60];
  v116 = objc_opt_class();
  v65 = objc_opt_class();
  v118 = v9;
  v66 = objc_opt_class();
  v67 = objc_opt_class();
  v119 = v8;
  v68 = objc_opt_class();
  v69 = objc_opt_class();
  v19 = v120;
  objc_msgSend(v117, "setWithObjects:", v116, v65, v66, v67, v68, v69, objc_opt_class(), 0);
  v70 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v70, CFSTR("_userInfo"));
  v71 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  userInfo = self->_userInfo;
  self->_userInfo = v71;

  self->_state = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("_state"));
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_placeholdIdentifier"));
  v73 = (NSString *)objc_claimAutoreleasedReturnValue();
  placeholderIdentifier = self->_placeholderIdentifier;
  self->_placeholderIdentifier = v73;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_versionIdentifier"));
  v75 = (NSData *)objc_claimAutoreleasedReturnValue();
  versionIdentifier = self->_versionIdentifier;
  self->_versionIdentifier = v75;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_itemVersion"));
  v77 = (NSFileProviderItemVersion *)objc_claimAutoreleasedReturnValue();
  itemVersion = self->_itemVersion;
  self->_itemVersion = v77;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rsdi"));
  v79 = (NSString *)objc_claimAutoreleasedReturnValue();
  spotlightDomainIdentifier = self->_spotlightDomainIdentifier;
  self->_spotlightDomainIdentifier = v79;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_spotlightDomainIdentifier"));
  v81 = (NSString *)objc_claimAutoreleasedReturnValue();
  fp_spotlightSubDomainIdentifier = self->_fp_spotlightSubDomainIdentifier;
  self->_fp_spotlightSubDomainIdentifier = v81;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hasUnresolvedConflicts"));
  v83 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  hasUnresolvedConflicts = self->_hasUnresolvedConflicts;
  self->_hasUnresolvedConflicts = v83;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isDownloadRequested"));
  v85 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  isDownloadRequested = self->_isDownloadRequested;
  self->_isDownloadRequested = v85;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sharingPermissions"));
  v87 = (NSString *)objc_claimAutoreleasedReturnValue();
  sharingPermissions = self->_sharingPermissions;
  self->_sharingPermissions = v87;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_containerDisplayName"));
  v89 = (NSString *)objc_claimAutoreleasedReturnValue();
  containerDisplayName = self->_containerDisplayName;
  self->_containerDisplayName = v89;

  self->_supportsMostRecentVersionDownloaded = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("_supportsMostRecentVersionDownloaded"));
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fp_appContainerBundleIdentifier"));
  v91 = (NSString *)objc_claimAutoreleasedReturnValue();
  fp_appContainerBundleIdentifier = self->_fp_appContainerBundleIdentifier;
  self->_fp_appContainerBundleIdentifier = v91;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fp_parentDomainIdentifier"));
  v93 = (NSString *)objc_claimAutoreleasedReturnValue();
  fp_parentDomainIdentifier = self->_fp_parentDomainIdentifier;
  self->_fp_parentDomainIdentifier = v93;

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_cloudContainerIdentifier"));
  v95 = (NSString *)objc_claimAutoreleasedReturnValue();
  cloudContainerIdentifier = self->_cloudContainerIdentifier;
  self->_cloudContainerIdentifier = v95;

  self->_isUbiquitous = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("_isUbiquitous"));
  self->_isContainer = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("_isContainer"));
  self->_isContainerPristine = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("_isContainerPristine"));
  self->_topLevelSharedItem = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("_topLevelSharedItem"));
  self->_inPinnedFolder = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("_inPinnedFolder"));
  self->_pinned = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("_pinned"));
  self->_contentZoneRoot = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("_contentZoneRoot"));
  self->_isCollaborationInvitation = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("_isCollaborationInvitation"));
  self->_recursivelyDownloaded = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("_recursivelyDownloaded"));
  v97 = (void *)MEMORY[0x1E0C99E60];
  v98 = objc_opt_class();
  objc_msgSend(v97, "setWithObjects:", v98, objc_opt_class(), 0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v99, CFSTR("_conflictingVersions"));
  v100 = (NSArray *)objc_claimAutoreleasedReturnValue();
  conflictingVersions = self->_conflictingVersions;
  self->_conflictingVersions = v100;

  self->_fileSystemFlags = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("_fileSystemFlags"));
  v102 = (void *)MEMORY[0x1E0C99E60];
  v125[0] = objc_opt_class();
  v125[1] = objc_opt_class();
  v125[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v125, 3);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setWithArray:", v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v104, CFSTR("_extendedAttributes"));
  v105 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  extendedAttributes = self->_extendedAttributes;
  self->_extendedAttributes = v105;

  v107 = (void *)MEMORY[0x1E0C99E60];
  v9 = v118;
  v8 = v119;
  v124[0] = objc_opt_class();
  v124[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 2);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "setWithArray:", v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v109, CFSTR("_decorations"));
  v110 = (NSArray *)objc_claimAutoreleasedReturnValue();
  decorations = self->_decorations;
  self->_decorations = v110;

  self->_fileID = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("_fileID"));
  self->_documentID = objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("_documentID"));
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v70, CFSTR("_inheritedUserInfo"));
  v112 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  inheritedUserInfo = self->_inheritedUserInfo;
  self->_inheritedUserInfo = v112;

  self->_allowsContextualMenuDownloadEntry = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("_allowsContextualMenuDownloadEntry"));
  self->_typeAndCreator.type = objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("_typeAndCreator.type"));
  self->_typeAndCreator.creator = objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("_typeAndCreator.creator"));
  self->_contentPolicy = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("_contentPolicy"));
  self->_inheritedContentPolicy = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("_inheritedContentPolicy"));
  self->_effectiveContentPolicy = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("_effectiveContentPolicy"));
  v20 = 0;
  self->_unsupportedFields = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("_unsupportedFields"));
LABEL_19:

LABEL_21:
LABEL_22:

  objc_autoreleasePoolPop(context);
  if (v20)
    v114 = 0;
  else
    v114 = self;

  return v114;
}

- (FPItem)initWithProviderID:(id)a3 domainIdentifier:(id)a4 itemIdentifier:(id)a5 parentItemIdentifier:(id)a6 filename:(id)a7 contentType:(id)a8
{
  __CFString *v15;
  id v16;
  id v17;
  FPItem *v18;
  FPItem *v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  void *v24;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v27 = a5;
  v15 = (__CFString *)a6;
  v16 = a7;
  v17 = a8;
  v30.receiver = self;
  v30.super_class = (Class)FPItem;
  v18 = -[FPItem init](&v30, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_providerID, a3);
    objc_storeStrong((id *)&v19->_domainIdentifier, a4);
    objc_storeStrong((id *)&v19->_itemIdentifier, a5);
    objc_storeStrong((id *)&v19->_parentItemIdentifier, a6);
    if (CFSTR("NSFileProviderTrashContainerItemIdentifier") == v15)
      v19->_trashed = 1;
    objc_storeStrong((id *)&v19->_filename, a7);
    v19->_capabilities = 3;
    v19->_contentPolicy = 0;
    v20 = -[NSString hasPrefix:](v19->_filename, "hasPrefix:", CFSTR("."));
    v21 = 22;
    if (v20)
      v21 = 30;
    v19->_fileSystemFlags = v21;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v19, CFSTR("FPItem.m"), 491, CFSTR("contentType is not of the current type"));

      }
    }
    -[FPItem setContentType:](v19, "setContentType:", v17, a2, v27, v28, v29);
    if (!v19->_domainIdentifier)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", v26, v19, CFSTR("FPItem.m"), 494, CFSTR("domain identifier must not be nil"));

    }
    -[FPItem setAllowsContextualMenuDownloadEntry:](v19, "setAllowsContextualMenuDownloadEntry:", 1);
  }

  return v19;
}

- (void)setAllowsContextualMenuDownloadEntry:(BOOL)a3
{
  self->_allowsContextualMenuDownloadEntry = a3;
}

- (void)setContentType:(id)a3
{
  UTType *v4;
  UTType *contentType;
  FPItem *obj;

  v4 = (UTType *)a3;
  obj = self;
  objc_sync_enter(obj);
  contentType = obj->_contentType;
  obj->_contentType = v4;

  obj->_typesEvaluated = 0;
  objc_sync_exit(obj);

}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (BOOL)isDownloaded
{
  return self->_downloaded;
}

- (NSString)providerDomainID
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "fp_providerDomainIDFromProviderID:domainIdentifier:", self->_providerID, self->_domainIdentifier);
}

- (BOOL)isExcludedFromSync
{
  return self->_excludedFromSync;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)displayName
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  NSString *v12;
  _BOOL8 v13;
  NSString *v14;
  uint64_t v15;
  NSString *v16;
  NSString *displayName;
  NSString *v18;
  NSString *filename;
  uint64_t v21;

  v3 = -[FPItem fileSystemFlags](self, "fileSystemFlags");
  v11 = -[FPItem folderType](self, "folderType") - 2;
  if (v11 > 2)
  {
    v12 = 0;
  }
  else
  {
    FPLoc(off_1E444AB28[v11], v4, v5, v6, v7, v8, v9, v10, v21);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  if (-[NSString length](v12, "length"))
  {
    v13 = -[FPItem isFolder](self, "isFolder");
    v14 = v12;
    v15 = (v3 >> 4) & 1;
  }
  else
  {
    displayName = self->_displayName;
    if (displayName)
    {
      v16 = displayName;
      goto LABEL_9;
    }
    filename = self->_filename;
    v13 = -[FPItem isFolder](self, "isFolder");
    v14 = filename;
    v15 = 1;
  }
  -[NSString fp_displayNameFromFilenameWithHiddenPathExtension:isFolder:](v14, "fp_displayNameFromFilenameWithHiddenPathExtension:isFolder:", v15, v13);
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v18 = v16;

  return v18;
}

- (unint64_t)fileSystemFlags
{
  return self->_fileSystemFlags;
}

- (unint64_t)folderType
{
  unint64_t result;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  if (!-[FPItem isFolder](self, "isFolder"))
    return 0;
  result = self->_folderType;
  if (!result)
  {
    -[FPItem filename](self, "filename");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPItem parentItemIdentifier](self, "parentItemIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPItem providerID](self, "providerID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPItem detachedRootLogicalURL](self, "detachedRootLogicalURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      -[FPItem fileURL](self, "fileURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = -[FPItem isContainer](self, "isContainer");
    -[FPItem cloudContainerIdentifier](self, "cloudContainerIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_folderType = CalculateFolderType(v4, v5, v6, v8, v9, v10);

    if (!v7)
    return self->_folderType;
  }
  return result;
}

- (BOOL)isFolder
{
  FPItem *v2;
  _BOOL4 isFolder;
  UTType *v4;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_typesEvaluated)
  {
    isFolder = v2->_isFolder;
    objc_sync_exit(v2);
  }
  else
  {
    v4 = v2->_contentType;
    objc_sync_exit(v2);

    -[FPItem _evaluateTypes:](v2, "_evaluateTypes:", v4);
    isFolder = v2->_isFolder;
    v2 = (FPItem *)v4;
  }

  return isFolder;
}

- (unint64_t)exclusionType
{
  return self->_exclusionType;
}

- (BOOL)isContainer
{
  return self->_isContainer;
}

- (BOOL)isCloudItem
{
  return -[FPItem isUbiquitous](self, "isUbiquitous") || self->_uploaded || self->_downloaded;
}

- (BOOL)isUbiquitous
{
  return self->_isUbiquitous;
}

- (BOOL)isActionable
{
  return (self->_state & 9) == 0;
}

- (BOOL)isRecursivelyDownloaded
{
  return self->_recursivelyDownloaded;
}

- (BOOL)isBusy
{
  void *v2;
  double v3;
  char is_busy_date;

  -[FPItem creationDate](self, "creationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  is_busy_date = fpfs_is_busy_date((uint64_t)v3);

  return is_busy_date;
}

- (void)_evaluateTypes:(id)a3
{
  BOOL v4;
  BOOL v5;
  BOOL v6;
  FPItem *obj;

  v4 = -[UTType conformsToType:](self->_contentType, "conformsToType:", *MEMORY[0x1E0CEC588]);
  v5 = -[UTType conformsToType:](self->_contentType, "conformsToType:", *MEMORY[0x1E0CEC4B8]);
  v6 = 1;
  if (!v4)
    v6 = -[FPItem isFlattenedPackage](self, "isFlattenedPackage");
  obj = self;
  objc_sync_enter(obj);
  obj->_isFolder = v5 && !v4;
  obj->_isPackage = v6;
  obj->_typesEvaluated = 1;
  objc_sync_exit(obj);

}

- (BOOL)isFlattenedPackage
{
  void *v2;
  void *v3;
  char v4;

  -[FPItem filename](self, "filename");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("pkgf"));

  return v4;
}

- (NSString)filename
{
  return self->_filename;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (BOOL)isCollaborationInvitation
{
  return self->_isCollaborationInvitation;
}

- (NSString)cloudContainerIdentifier
{
  return self->_cloudContainerIdentifier;
}

- (NSURL)detachedRootLogicalURL
{
  return self->_detachedRootLogicalURL;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void)setQuarantineBlob:(id)a3
{
  objc_storeStrong((id *)&self->_quarantineBlob, a3);
}

- (void)setItemVersion:(id)a3
{
  objc_storeStrong((id *)&self->_itemVersion, a3);
}

- (void)setExtendedAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_extendedAttributes, a3);
}

- (void)setDecorations:(id)a3
{
  objc_storeStrong((id *)&self->_decorations, a3);
}

- (void)setCollaborationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationIdentifier, a3);
}

- (void)setFormerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_formerIdentifier, a3);
}

- (NSFileProviderItemVersion)itemVersion
{
  NSFileProviderItemVersion *itemVersion;
  NSFileProviderItemVersion *v4;

  itemVersion = self->_itemVersion;
  if (itemVersion)
    return itemVersion;
  v4 = objc_alloc_init(NSFileProviderItemVersion);
  return v4;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setDocumentID:(unsigned int)a3
{
  self->_documentID = a3;
}

- (NSString)preformattedOwnerName
{
  return self->_preformattedOwnerName;
}

- (NSString)preformattedMostRecentEditorName
{
  return self->_preformattedMostRecentEditorName;
}

- (NSNumber)hasUnresolvedConflicts
{
  return self->_hasUnresolvedConflicts;
}

- (NSString)fp_displayName
{
  return self->_displayName;
}

- (NSArray)decorations
{
  return self->_decorations;
}

- (int64_t)contentPolicy
{
  return self->_contentPolicy;
}

- (NSString)containerDisplayName
{
  return self->_containerDisplayName;
}

- (NSArray)conflictingVersions
{
  return self->_conflictingVersions;
}

- (NSError)downloadingError
{
  NSError *downloadingError;
  void *v4;

  downloadingError = self->_downloadingError;
  if (downloadingError)
    return downloadingError;
  if (self->_downloading && self->_offline)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderErrorDomain"), -1004, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSError *)v4;
}

- (void)setChildItemCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *itemIdentifier;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  FPSandboxingURLWrapper *urlWrapper;
  FPItem *v16;
  NSURL *v17;
  void *v18;
  uint64_t v19;

  v4 = a3;
  if (!self->_providerID || (itemIdentifier = self->_itemIdentifier) == 0 || !self->_filename || !self->_contentType)
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[FPItem encodeWithCoder:].cold.2(self, (uint64_t *)&self->_providerID, v6);

    fp_simulate_crash(CFSTR("item does not have all the required properties; encoding will be invalid"),
      v7,
      v8,
      v9,
      v10,
      v11,
      v12,
      v13,
      v19);
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[FPItem encodeWithCoder:].cold.1();

    itemIdentifier = self->_itemIdentifier;
  }
  objc_msgSend(v4, "encodeObject:forKey:", itemIdentifier, CFSTR("_itemIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_formerIdentifier, CFSTR("_formerIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_parentItemIdentifier, CFSTR("_parentItemIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_providerID, CFSTR("_providerIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_domainIdentifier, CFSTR("_domainIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_filename, CFSTR("_filename"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayName, CFSTR("_displayName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentType, CFSTR("_contentType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_documentSize, CFSTR("_documentSize"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    urlWrapper = self->_urlWrapper;
    if (urlWrapper)
    {
      objc_msgSend(v4, "encodeObject:forKey:", urlWrapper, CFSTR("_urlWrapper"));
    }
    else
    {
      v16 = self;
      objc_sync_enter(v16);
      v17 = v16->_fileURL;
      objc_sync_exit(v16);

      if (v17)
      {
        +[FPSandboxingURLWrapper wrapperWithURL:readonly:error:](FPSandboxingURLWrapper, "wrapperWithURL:readonly:error:", v17, 0, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("_urlWrapper"));

      }
    }
  }
  objc_msgSend(v4, "encodeObject:forKey:", self->_detachedRootLogicalURL, CFSTR("_detachedRootLogicalURL"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_capabilities, CFSTR("_capabilities"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_enumerationOrigin, CFSTR("_enumerationOrigin"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_creationDate, CFSTR("_creationDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentModificationDate, CFSTR("_contentModificationDate"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_trashed, CFSTR("_trashed"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_lastUsedDate, CFSTR("_lastUsedDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_tags, CFSTR("_tags"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_favoriteRank, CFSTR("_favoriteRank"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_uploaded, CFSTR("_uploaded"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_uploading, CFSTR("_uploading"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_uploadingError, CFSTR("_uploadingError"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_excludedFromSync, CFSTR("_excludedFromSync"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_ignoreRoot, CFSTR("_ignoreRoot"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_exclusionType, CFSTR("_exclusionType"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_downloaded, CFSTR("_downloaded"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_downloading, CFSTR("_downloading"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_downloadingError, CFSTR("_downloadingError"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_mostRecentVersionDownloaded, CFSTR("_mostRecentVersionDownloaded"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shared, CFSTR("_shared"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_sharedByCurrentUser, CFSTR("_sharedByCurrentUser"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_fp_lastModifiedByCurrentUser, CFSTR("_fp_lastModifiedByCurrentUser"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_ownerNameComponents, CFSTR("_ownerNameComponents"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_mostRecentEditorNameComponents, CFSTR("_mostRecentEditorNameComponents"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_collaborationIdentifier, CFSTR("_collaborationIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_originatorInfo, CFSTR("_originatorInfo"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_childItemCount, CFSTR("_childItemCount"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_userInfo, CFSTR("_userInfo"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_state, CFSTR("_state"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_placeholderIdentifier, CFSTR("_placeholdIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_versionIdentifier, CFSTR("_versionIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_itemVersion, CFSTR("_itemVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_spotlightDomainIdentifier, CFSTR("rsdi"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fp_spotlightSubDomainIdentifier, CFSTR("_spotlightDomainIdentifier"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_inPinnedFolder, CFSTR("_inPinnedFolder"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_pinned, CFSTR("_pinned"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_hasUnresolvedConflicts, CFSTR("_hasUnresolvedConflicts"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_isDownloadRequested, CFSTR("_isDownloadRequested"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sharingPermissions, CFSTR("_sharingPermissions"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_containerDisplayName, CFSTR("_containerDisplayName"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsMostRecentVersionDownloaded, CFSTR("_supportsMostRecentVersionDownloaded"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fp_appContainerBundleIdentifier, CFSTR("_fp_appContainerBundleIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fp_parentDomainIdentifier, CFSTR("_fp_parentDomainIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cloudContainerIdentifier, CFSTR("_cloudContainerIdentifier"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isUbiquitous, CFSTR("_isUbiquitous"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isContainer, CFSTR("_isContainer"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isContainerPristine, CFSTR("_isContainerPristine"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_topLevelSharedItem, CFSTR("_topLevelSharedItem"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_recursivelyDownloaded, CFSTR("_recursivelyDownloaded"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_contentZoneRoot, CFSTR("_contentZoneRoot"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_conflictingVersions, CFSTR("_conflictingVersions"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isCollaborationInvitation, CFSTR("_isCollaborationInvitation"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_fileSystemFlags, CFSTR("_fileSystemFlags"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_extendedAttributes, CFSTR("_extendedAttributes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_decorations, CFSTR("_decorations"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_fileID, CFSTR("_fileID"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_documentID, CFSTR("_documentID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_inheritedUserInfo, CFSTR("_inheritedUserInfo"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_allowsContextualMenuDownloadEntry, CFSTR("_allowsContextualMenuDownloadEntry"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_typeAndCreator.type, CFSTR("_typeAndCreator.type"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_typeAndCreator.creator, CFSTR("_typeAndCreator.creator"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_contentPolicy, CFSTR("_contentPolicy"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_inheritedContentPolicy, CFSTR("_inheritedContentPolicy"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_effectiveContentPolicy, CFSTR("_effectiveContentPolicy"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_unsupportedFields, CFSTR("_unsupportedFields"));

}

- (NSProgress)uploadingProgress
{
  void *v2;

  if (self->_uploading)
  {
    -[FPItem progress](self, "progress");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSProgress *)v2;
}

- (BOOL)isEqual:(id)a3
{
  FPItem *v4;
  BOOL v5;

  v4 = (FPItem *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[FPItem isEqualToItem:](self, "isEqualToItem:", v4);
  }

  return v5;
}

- (BOOL)isEqualToItem:(id)a3
{
  FPItem *v4;
  FPItem *v5;
  NSString *itemIdentifier;
  void *v7;
  NSString *domainIdentifier;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSString *v13;
  void *v14;
  NSString *providerID;
  void *v16;
  BOOL v17;

  v4 = (FPItem *)a3;
  v5 = v4;
  if (self == v4)
    goto LABEL_9;
  itemIdentifier = self->_itemIdentifier;
  -[FPItem itemIdentifier](v4, "itemIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(itemIdentifier) = -[NSString isEqualToString:](itemIdentifier, "isEqualToString:", v7);

  if (!(_DWORD)itemIdentifier)
    goto LABEL_11;
  domainIdentifier = self->_domainIdentifier;
  -[FPItem domainIdentifier](v5, "domainIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  if (domainIdentifier == (NSString *)v9)
  {

  }
  else
  {
    v10 = (void *)v9;
    -[FPItem domainIdentifier](v5, "domainIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {

      goto LABEL_11;
    }
    v12 = (void *)v11;
    v13 = self->_domainIdentifier;
    -[FPItem domainIdentifier](v5, "domainIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = -[NSString isEqualToString:](v13, "isEqualToString:", v14);

    if (!(_DWORD)v13)
      goto LABEL_11;
  }
  providerID = self->_providerID;
  -[FPItem providerID](v5, "providerID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(providerID) = -[NSString isEqualToString:](providerID, "isEqualToString:", v16);

  if ((providerID & 1) == 0)
  {
LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }
LABEL_9:
  v17 = 1;
LABEL_12:

  return v17;
}

- (FPItem)initWithProviderDomainID:(id)a3 itemIdentifier:(id)a4 parentItemIdentifier:(id)a5 filename:(id)a6 contentType:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  FPItem *v19;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v16, "fp_toProviderID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fp_toDomainIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[FPItem initWithProviderID:domainIdentifier:itemIdentifier:parentItemIdentifier:filename:contentType:](self, "initWithProviderID:domainIdentifier:itemIdentifier:parentItemIdentifier:filename:contentType:", v17, v18, v15, v14, v13, v12);
  return v19;
}

- (NSString)collaborationIdentifier
{
  return self->_collaborationIdentifier;
}

- (FPItem)initWithSearchableItem:(id)a3
{
  id v4;
  _CSSearchableItemAdapter *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  FPItem *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  FPItem *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;

  v4 = a3;
  v5 = -[_CSSearchableItemAdapter initWithSearchableItem:]([_CSSearchableItemAdapter alloc], "initWithSearchableItem:", v4);

  -[_CSSearchableItemAdapter attributeSet](v5, "attributeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileProviderID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
    goto LABEL_14;
  -[_CSSearchableItemAdapter typeIdentifier](v5, "typeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length"))
  {
LABEL_13:

LABEL_14:
    goto LABEL_15;
  }
  -[_CSSearchableItemAdapter filename](v5, "filename");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "length"))
  {
LABEL_12:

    goto LABEL_13;
  }
  -[_CSSearchableItemAdapter parentItemIdentifier](v5, "parentItemIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "length"))
  {

    goto LABEL_12;
  }
  -[_CSSearchableItemAdapter itemIdentifier](v5, "itemIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (!v12)
  {
LABEL_15:
    -[_CSSearchableItemAdapter typeIdentifier](v5, "typeIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v30, "length");

    if (v23)
    {
      -[_CSSearchableItemAdapter contentType](v5, "contentType");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[_CSSearchableItemAdapter attributeSet](v5, "attributeSet");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "fileProviderID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CSSearchableItemAdapter itemIdentifier](v5, "itemIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CSSearchableItemAdapter filename](v5, "filename");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    __FILEPROVIDER_BAD_ITEM__(v5, v25, v26, v27, (uint64_t)v23, 0, 0);
    v22 = 0;
    goto LABEL_18;
  }
  v13 = [FPItem alloc];
  -[_CSSearchableItemAdapter attributeSet](v5, "attributeSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fileProviderID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CSSearchableItemAdapter attributeSet](v5, "attributeSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fileProviderDomainIdentifier");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = CFSTR("NSFileProviderDomainDefaultIdentifier");
  -[_CSSearchableItemAdapter attributeSet](v5, "attributeSet");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "domainIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[FPItem initWithVendorItem:provider:domain:spotlightDomainIdentifier:extensionCapabilities:useFPFS:](v13, "initWithVendorItem:provider:domain:spotlightDomainIdentifier:extensionCapabilities:useFPFS:", v5, v15, v19, v21, -1, 0);

  -[FPItem setEnumerationOrigin:](v22, "setEnumerationOrigin:", 2);
  if (-[FPItem isFolder](v22, "isFolder"))
  {
    -[FPItem filename](v22, "filename");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPItem parentItemIdentifier](v22, "parentItemIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPItem providerID](v22, "providerID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CSSearchableItemAdapter attributeSet](v5, "attributeSet");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "contentURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[FPItem isContainer](v22, "isContainer");
    -[FPItem cloudContainerIdentifier](v22, "cloudContainerIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPItem setFolderType:](v22, "setFolderType:", CalculateFolderType(v23, v24, v25, v27, v28, v29));

LABEL_18:
  }

  return v22;
}

- (void)setEnumerationOrigin:(unint64_t)a3
{
  self->_enumerationOrigin = a3;
}

- (NSProgress)copyingProgress
{
  void *v2;
  void *v3;
  NSProgress *v4;

  -[FPItem progress](self, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "fp_isAccountedAsCopyProgress"))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSProgress)downloadingProgress
{
  void *v3;

  if (self->_downloading || -[FPItem isExternalDownloadPlaceholder](self, "isExternalDownloadPlaceholder"))
  {
    -[FPItem progress](self, "progress");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSProgress *)v3;
}

- (NSProgress)progress
{
  FPItem *v2;
  NSProgress *progress;
  NSProgress *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  FPItem *v8;
  NSProgress *v9;

  v2 = self;
  objc_sync_enter(v2);
  progress = v2->_progress;
  if (progress)
  {
    v4 = progress;
    objc_sync_exit(v2);
    v5 = v2;
  }
  else
  {
    objc_sync_exit(v2);

    +[FPProgressManager defaultManager](FPProgressManager, "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2->_offline)
    {
      v6 = 0;
    }
    else
    {
      if (v2->_downloading || -[FPItem isExternalDownloadPlaceholder](v2, "isExternalDownloadPlaceholder"))
      {
        objc_msgSend(v5, "downloadProgressForItem:", v2);
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else if (v2->_uploading)
      {
        objc_msgSend(v5, "uploadProgressForItem:", v2);
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = objc_msgSend(v5, "copyProgressForItem:", v2);
      }
      v6 = (void *)v7;
    }
    v8 = v2;
    objc_sync_enter(v8);
    v9 = v2->_progress;
    if (!v9)
    {
      objc_storeStrong((id *)&v2->_progress, v6);
      v9 = v2->_progress;
    }
    v4 = v9;
    objc_sync_exit(v8);

  }
  return v4;
}

- (BOOL)isExternalDownloadPlaceholder
{
  void *v2;
  char v3;

  -[FPItem typeIdentifier](self, "typeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.safari.download"));

  return v3;
}

- (NSString)typeIdentifier
{
  void *v2;
  void *v3;

  -[FPItem contentType](self, "contentType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (UTType)contentType
{
  return self->_contentType;
}

- (BOOL)isDownloading
{
  return self->_downloading;
}

- (BOOL)isUploading
{
  return self->_uploading;
}

- (NSData)originatorInfo
{
  return self->_originatorInfo;
}

- (void)setFileURL:(id)a3
{
  NSURL *v4;
  NSURL *fileURL;
  FPItem *obj;

  v4 = (NSURL *)a3;
  obj = self;
  objc_sync_enter(obj);
  fileURL = obj->_fileURL;
  obj->_fileURL = v4;

  objc_sync_exit(obj);
}

- (BOOL)isReadable
{
  return self->_capabilities & 1;
}

+ (id)fp_queryFetchAttributes
{
  id *v2;
  void *v3;
  id v4;
  id *v5;
  void *v6;
  id v7;
  id *v8;
  void *v9;
  id v10;
  id *v11;
  void *v12;
  id *v13;
  void *v14;
  id *v15;
  void *v16;
  id *v17;
  void *v18;
  id v19;
  id *v20;
  void *v21;
  id v22;
  id *v23;
  void *v24;
  id v25;
  id *v26;
  void *v27;
  id *v28;
  void *v29;
  id *v30;
  void *v31;
  id *v32;
  void *v33;
  id *v34;
  void *v35;
  id v36;
  id *v37;
  void *v38;
  id v39;
  id *v40;
  void *v41;
  id v42;
  id *v43;
  void *v44;
  id v45;
  id *v46;
  void *v47;
  id v48;
  id *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id *v54;
  void *v55;
  id v56;
  id *v57;
  void *v58;
  id v59;
  id *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD v88[55];
  id v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v2 = (id *)getMDItemFilenameSymbolLoc_ptr;
  v87 = getMDItemFilenameSymbolLoc_ptr;
  if (!getMDItemFilenameSymbolLoc_ptr)
  {
    v3 = (void *)CoreSpotlightLibrary_1();
    v2 = (id *)dlsym(v3, "MDItemFilename");
    v85[3] = (uint64_t)v2;
    getMDItemFilenameSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v84, 8);
  if (!v2)
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.1();
  v4 = *v2;
  v88[0] = v4;
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v5 = (id *)getMDItemDisplayNameSymbolLoc_ptr;
  v87 = getMDItemDisplayNameSymbolLoc_ptr;
  if (!getMDItemDisplayNameSymbolLoc_ptr)
  {
    v6 = (void *)CoreSpotlightLibrary_1();
    v5 = (id *)dlsym(v6, "MDItemDisplayName");
    v85[3] = (uint64_t)v5;
    getMDItemDisplayNameSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v84, 8);
  if (!v5)
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.2();
  v7 = *v5;
  v88[1] = v7;
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v8 = (id *)getMDItemContentTypeSymbolLoc_ptr;
  v87 = getMDItemContentTypeSymbolLoc_ptr;
  if (!getMDItemContentTypeSymbolLoc_ptr)
  {
    v9 = (void *)CoreSpotlightLibrary_1();
    v8 = (id *)dlsym(v9, "MDItemContentType");
    v85[3] = (uint64_t)v8;
    getMDItemContentTypeSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v84, 8);
  if (!v8)
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.3();
  v10 = *v8;
  v88[2] = v10;
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v11 = (id *)getMDItemContentCreationDateSymbolLoc_ptr;
  v87 = getMDItemContentCreationDateSymbolLoc_ptr;
  if (!getMDItemContentCreationDateSymbolLoc_ptr)
  {
    v12 = (void *)CoreSpotlightLibrary_1();
    v11 = (id *)dlsym(v12, "MDItemContentCreationDate");
    v85[3] = (uint64_t)v11;
    getMDItemContentCreationDateSymbolLoc_ptr = (uint64_t)v11;
  }
  _Block_object_dispose(&v84, 8);
  if (!v11)
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.4();
  v80 = *v11;
  v88[3] = v80;
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v13 = (id *)getMDItemContentModificationDateSymbolLoc_ptr;
  v87 = getMDItemContentModificationDateSymbolLoc_ptr;
  if (!getMDItemContentModificationDateSymbolLoc_ptr)
  {
    v14 = (void *)CoreSpotlightLibrary_1();
    v13 = (id *)dlsym(v14, "MDItemContentModificationDate");
    v85[3] = (uint64_t)v13;
    getMDItemContentModificationDateSymbolLoc_ptr = (uint64_t)v13;
  }
  _Block_object_dispose(&v84, 8);
  if (!v13)
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.5();
  v79 = *v13;
  v88[4] = v79;
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v15 = (id *)getMDItemUserTagsSymbolLoc_ptr;
  v87 = getMDItemUserTagsSymbolLoc_ptr;
  if (!getMDItemUserTagsSymbolLoc_ptr)
  {
    v16 = (void *)CoreSpotlightLibrary_1();
    v15 = (id *)dlsym(v16, "MDItemUserTags");
    v85[3] = (uint64_t)v15;
    getMDItemUserTagsSymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v84, 8);
  if (!v15)
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.6();
  v76 = v7;
  v77 = v10;
  v75 = v4;
  v78 = *v15;
  v88[5] = v78;
  v88[6] = CFSTR("_kMDItemUserTags");
  getMDItemFileProviderDomainIdentifier();
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v88[7] = v83;
  v88[8] = CFSTR("FPTagColors");
  v88[9] = CFSTR("FPFilename");
  getMDItemLastUsedDate();
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v88[10] = v82;
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v17 = (id *)getMDItemFavoriteRankSymbolLoc_ptr;
  v87 = getMDItemFavoriteRankSymbolLoc_ptr;
  if (!getMDItemFavoriteRankSymbolLoc_ptr)
  {
    v18 = (void *)CoreSpotlightLibrary_1();
    v17 = (id *)dlsym(v18, "MDItemFavoriteRank");
    v85[3] = (uint64_t)v17;
    getMDItemFavoriteRankSymbolLoc_ptr = (uint64_t)v17;
  }
  _Block_object_dispose(&v84, 8);
  if (!v17)
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.7();
  v19 = *v17;
  v88[11] = v19;
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v20 = (id *)getMDItemIsUploadedSymbolLoc_ptr;
  v87 = getMDItemIsUploadedSymbolLoc_ptr;
  if (!getMDItemIsUploadedSymbolLoc_ptr)
  {
    v21 = (void *)CoreSpotlightLibrary_1();
    v20 = (id *)dlsym(v21, "MDItemIsUploaded");
    v85[3] = (uint64_t)v20;
    getMDItemIsUploadedSymbolLoc_ptr = (uint64_t)v20;
  }
  _Block_object_dispose(&v84, 8);
  if (!v20)
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.8();
  v22 = *v20;
  v88[12] = v22;
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v23 = (id *)getMDItemIsUploadingSymbolLoc_ptr;
  v87 = getMDItemIsUploadingSymbolLoc_ptr;
  if (!getMDItemIsUploadingSymbolLoc_ptr)
  {
    v24 = (void *)CoreSpotlightLibrary_1();
    v23 = (id *)dlsym(v24, "MDItemIsUploading");
    v85[3] = (uint64_t)v23;
    getMDItemIsUploadingSymbolLoc_ptr = (uint64_t)v23;
  }
  _Block_object_dispose(&v84, 8);
  if (!v23)
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.9();
  v25 = *v23;
  v88[13] = v25;
  v88[14] = CFSTR("FPUploadingError");
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v26 = (id *)getMDItemDownloadingStatusSymbolLoc_ptr;
  v87 = getMDItemDownloadingStatusSymbolLoc_ptr;
  if (!getMDItemDownloadingStatusSymbolLoc_ptr)
  {
    v27 = (void *)CoreSpotlightLibrary_1();
    v26 = (id *)dlsym(v27, "MDItemDownloadingStatus");
    v85[3] = (uint64_t)v26;
    getMDItemDownloadingStatusSymbolLoc_ptr = (uint64_t)v26;
  }
  _Block_object_dispose(&v84, 8);
  if (!v26)
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.10();
  v74 = *v26;
  v88[15] = v74;
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v28 = (id *)getMDItemVersionIdentifierSymbolLoc_ptr;
  v87 = getMDItemVersionIdentifierSymbolLoc_ptr;
  if (!getMDItemVersionIdentifierSymbolLoc_ptr)
  {
    v29 = (void *)CoreSpotlightLibrary_1();
    v28 = (id *)dlsym(v29, "MDItemVersionIdentifier");
    v85[3] = (uint64_t)v28;
    getMDItemVersionIdentifierSymbolLoc_ptr = (uint64_t)v28;
  }
  _Block_object_dispose(&v84, 8);
  if (!v28)
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.11();
  v73 = *v28;
  v88[16] = v73;
  v88[17] = CFSTR("FPDownloaded");
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v30 = (id *)getMDItemIsDownloadingSymbolLoc_ptr;
  v87 = getMDItemIsDownloadingSymbolLoc_ptr;
  if (!getMDItemIsDownloadingSymbolLoc_ptr)
  {
    v31 = (void *)CoreSpotlightLibrary_1();
    v30 = (id *)dlsym(v31, "MDItemIsDownloading");
    v85[3] = (uint64_t)v30;
    getMDItemIsDownloadingSymbolLoc_ptr = (uint64_t)v30;
  }
  _Block_object_dispose(&v84, 8);
  if (!v30)
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.12();
  v72 = *v30;
  v88[18] = v72;
  v88[19] = CFSTR("FPMostRecentVersionDownloaded");
  v88[20] = CFSTR("FPDownloadingError");
  v88[21] = CFSTR("FPUserInfoValues");
  v88[22] = CFSTR("FPUserInfoKeys");
  v88[23] = CFSTR("FPCapabilities");
  v88[24] = CFSTR("FPSharingCurrentUserPermissions");
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v32 = (id *)getMDItemUserOwnedSymbolLoc_ptr;
  v87 = getMDItemUserOwnedSymbolLoc_ptr;
  if (!getMDItemUserOwnedSymbolLoc_ptr)
  {
    v33 = (void *)CoreSpotlightLibrary_1();
    v32 = (id *)dlsym(v33, "MDItemUserOwned");
    v85[3] = (uint64_t)v32;
    getMDItemUserOwnedSymbolLoc_ptr = (uint64_t)v32;
  }
  _Block_object_dispose(&v84, 8);
  if (!v32)
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.13();
  v69 = v22;
  v70 = v25;
  v68 = v19;
  v71 = *v32;
  v88[25] = v71;
  getMDItemFileSize();
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v88[26] = v81;
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v34 = (id *)getMDItemSubItemCountSymbolLoc_ptr;
  v87 = getMDItemSubItemCountSymbolLoc_ptr;
  if (!getMDItemSubItemCountSymbolLoc_ptr)
  {
    v35 = (void *)CoreSpotlightLibrary_1();
    v34 = (id *)dlsym(v35, "MDItemSubItemCount");
    v85[3] = (uint64_t)v34;
    getMDItemSubItemCountSymbolLoc_ptr = (uint64_t)v34;
  }
  _Block_object_dispose(&v84, 8);
  if (!v34)
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.14();
  v36 = *v34;
  v88[27] = v36;
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v37 = (id *)getMDItemIsSharedSymbolLoc_ptr_0;
  v87 = getMDItemIsSharedSymbolLoc_ptr_0;
  if (!getMDItemIsSharedSymbolLoc_ptr_0)
  {
    v38 = (void *)CoreSpotlightLibrary_1();
    v37 = (id *)dlsym(v38, "MDItemIsShared");
    v85[3] = (uint64_t)v37;
    getMDItemIsSharedSymbolLoc_ptr_0 = (uint64_t)v37;
  }
  _Block_object_dispose(&v84, 8);
  if (!v37)
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.15();
  v39 = *v37;
  v88[28] = v39;
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v40 = (id *)getMDItemOwnerNameSymbolLoc_ptr_0;
  v87 = getMDItemOwnerNameSymbolLoc_ptr_0;
  if (!getMDItemOwnerNameSymbolLoc_ptr_0)
  {
    v41 = (void *)CoreSpotlightLibrary_1();
    v40 = (id *)dlsym(v41, "MDItemOwnerName");
    v85[3] = (uint64_t)v40;
    getMDItemOwnerNameSymbolLoc_ptr_0 = (uint64_t)v40;
  }
  _Block_object_dispose(&v84, 8);
  if (!v40)
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.16();
  v42 = *v40;
  v88[29] = v42;
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v43 = (id *)getMDItemLastEditorNameSymbolLoc_ptr;
  v87 = getMDItemLastEditorNameSymbolLoc_ptr;
  if (!getMDItemLastEditorNameSymbolLoc_ptr)
  {
    v44 = (void *)CoreSpotlightLibrary_1();
    v43 = (id *)dlsym(v44, "MDItemLastEditorName");
    v85[3] = (uint64_t)v43;
    getMDItemLastEditorNameSymbolLoc_ptr = (uint64_t)v43;
  }
  _Block_object_dispose(&v84, 8);
  if (!v43)
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.17();
  v45 = *v43;
  v88[30] = v45;
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v46 = (id *)getMDItemIsTrashedSymbolLoc_ptr;
  v87 = getMDItemIsTrashedSymbolLoc_ptr;
  if (!getMDItemIsTrashedSymbolLoc_ptr)
  {
    v47 = (void *)CoreSpotlightLibrary_1();
    v46 = (id *)dlsym(v47, "MDItemIsTrashed");
    v85[3] = (uint64_t)v46;
    getMDItemIsTrashedSymbolLoc_ptr = (uint64_t)v46;
  }
  _Block_object_dispose(&v84, 8);
  if (!v46)
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.18();
  v48 = *v46;
  v88[31] = v48;
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v49 = (id *)getMDItemContentURLSymbolLoc_ptr;
  v87 = getMDItemContentURLSymbolLoc_ptr;
  if (!getMDItemContentURLSymbolLoc_ptr)
  {
    v50 = (void *)CoreSpotlightLibrary_1();
    v49 = (id *)dlsym(v50, "MDItemContentURL");
    v85[3] = (uint64_t)v49;
    getMDItemContentURLSymbolLoc_ptr = (uint64_t)v49;
  }
  _Block_object_dispose(&v84, 8);
  if (!v49)
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.19();
  v66 = v36;
  v67 = v39;
  v51 = *v49;
  v88[32] = v51;
  getMDItemFileItemID();
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v88[33] = v52;
  getMDItemFileProviderID();
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v88[34] = v53;
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v54 = (id *)getMDItemParentFileItemIDSymbolLoc_ptr;
  v87 = getMDItemParentFileItemIDSymbolLoc_ptr;
  if (!getMDItemParentFileItemIDSymbolLoc_ptr)
  {
    v55 = (void *)CoreSpotlightLibrary_1();
    v54 = (id *)dlsym(v55, "MDItemParentFileItemID");
    v85[3] = (uint64_t)v54;
    getMDItemParentFileItemIDSymbolLoc_ptr = (uint64_t)v54;
  }
  _Block_object_dispose(&v84, 8);
  if (!v54)
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.20();
  v56 = *v54;
  v88[35] = v56;
  v88[36] = CFSTR("FPAppContainerBundleID");
  v88[37] = CFSTR("FPCloudContainerID");
  v88[38] = CFSTR("FPIsContainer");
  v88[39] = CFSTR("FPIsContainerPristine");
  v88[40] = CFSTR("FPIsUbiquitous");
  v88[41] = CFSTR("FPParentFileItemID");
  v88[42] = CFSTR("FPLastModifiedByCurrentUser");
  v88[43] = CFSTR("FPEvictable");
  v88[44] = CFSTR("FPItemIsPinned");
  v88[45] = CFSTR("FPItemIsInPinnedFolder");
  v88[46] = CFSTR("FPIsTopLevelSharedItem");
  v88[47] = CFSTR("FPCollaborationIdentifier");
  v88[48] = CFSTR("FPParentDomainID");
  v88[49] = CFSTR("FPItemVersion");
  v88[50] = CFSTR("FPItemIsRecursivelyDownloaded");
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v57 = (id *)getMDItemDocumentIdentifierSymbolLoc_ptr;
  v87 = getMDItemDocumentIdentifierSymbolLoc_ptr;
  if (!getMDItemDocumentIdentifierSymbolLoc_ptr)
  {
    v58 = (void *)CoreSpotlightLibrary_1();
    v57 = (id *)dlsym(v58, "MDItemDocumentIdentifier");
    v85[3] = (uint64_t)v57;
    getMDItemDocumentIdentifierSymbolLoc_ptr = (uint64_t)v57;
  }
  _Block_object_dispose(&v84, 8);
  if (!v57)
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.21();
  v59 = *v57;
  v88[51] = v59;
  v88[52] = CFSTR("com_apple_mobilesms_syndicationContentType");
  v88[53] = CFSTR("FPOnDiskIdentifier");
  v88[54] = CFSTR("com.apple.synapse:DocumentAttributes");
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v60 = (id *)getMDItemAttributeChangeDateSymbolLoc_ptr;
  v87 = getMDItemAttributeChangeDateSymbolLoc_ptr;
  if (!getMDItemAttributeChangeDateSymbolLoc_ptr)
  {
    v61 = (void *)CoreSpotlightLibrary_1();
    v60 = (id *)dlsym(v61, "MDItemAttributeChangeDate");
    v85[3] = (uint64_t)v60;
    getMDItemAttributeChangeDateSymbolLoc_ptr = (uint64_t)v60;
  }
  _Block_object_dispose(&v84, 8);
  if (!v60)
    +[FPItem(CSSearchableItem) fp_queryFetchAttributes].cold.22();
  v89 = *v60;
  v62 = (void *)MEMORY[0x1E0C99D20];
  v63 = v89;
  objc_msgSend(v62, "arrayWithObjects:count:", v88, 56);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  return v64;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_providerID, "hash");
  v4 = -[NSString hash](self->_domainIdentifier, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_itemIdentifier, "hash");
}

- (FPItem)initWithVendorItem:(id)a3 provider:(id)a4 domain:(id)a5 spotlightDomainIdentifier:(id)a6 extensionCapabilities:(unint64_t)a7 useFPFS:(BOOL)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  char isKindOfClass;
  int v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  NSFileProviderItemVersion *v27;
  NSFileProviderItemVersion *itemVersion;
  NSFileProviderItemVersion **p_itemVersion;
  FPItem *v30;
  NSFileProviderItemVersion *v31;
  void *v32;
  NSFileProviderItemVersion *v33;
  void *v34;
  uint64_t v35;
  NSFileProviderItemVersion *v36;
  __CFString *v37;
  void *v38;
  char v39;
  id v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  FPItem *v45;
  int v46;
  int v47;
  _BOOL4 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t v58;
  uint64_t v59;
  NSNumber *v60;
  uint64_t v61;
  NSNumber *childItemCount;
  NSNumber *documentSize;
  uint64_t v64;
  NSNumber *v65;
  uint64_t v66;
  NSDate *v67;
  uint64_t v68;
  NSDate *creationDate;
  uint64_t v70;
  NSDate *v71;
  uint64_t v72;
  NSDate *contentModificationDate;
  uint64_t v74;
  NSString *formerIdentifier;
  uint64_t v76;
  NSDate *lastUsedDate;
  NSDate *v78;
  uint64_t v79;
  NSArray *tags;
  void *v81;
  void *v82;
  uint64_t v83;
  NSArray *v84;
  uint64_t v85;
  NSNumber *favoriteRank;
  uint64_t v87;
  NSNumber *v88;
  NSNumber *v89;
  char v90;
  char v91;
  char v92;
  char v93;
  void *v94;
  uint64_t v95;
  NSError *uploadingError;
  char v97;
  char v98;
  char downloaded;
  void *v100;
  uint64_t v101;
  NSError *downloadingError;
  char v103;
  uint64_t v104;
  NSString *collaborationIdentifier;
  uint64_t v106;
  NSPersonNameComponents *ownerNameComponents;
  uint64_t v108;
  NSPersonNameComponents *v109;
  uint64_t v110;
  NSPersonNameComponents *v111;
  NSPersonNameComponents *mostRecentEditorNameComponents;
  uint64_t v113;
  NSData *originatorInfo;
  uint64_t v115;
  NSDictionary *userInfo;
  NSDictionary *v117;
  char v118;
  uint64_t v119;
  char v120;
  uint64_t v121;
  NSString *symlinkTargetPath;
  uint64_t v123;
  NSURL *fileURL;
  uint64_t v125;
  NSString *fp_spotlightSubDomainIdentifier;
  uint64_t v127;
  NSString *spotlightDomainIdentifier;
  uint64_t v129;
  NSString *v130;
  uint64_t v131;
  NSString *displayName;
  NSString *v133;
  NSString *v134;
  NSNumber *v135;
  NSNumber *v136;
  NSString *v137;
  uint64_t v138;
  NSString *v139;
  uint64_t v140;
  NSString *v141;
  uint64_t v142;
  NSNumber *hasUnresolvedConflicts;
  NSString *v144;
  uint64_t v145;
  NSNumber *v146;
  uint64_t v147;
  NSNumber *isDownloadRequested;
  NSNumber *v149;
  uint64_t v150;
  NSNumber *v151;
  uint64_t v152;
  NSString *sharingPermissions;
  NSNumber *v154;
  uint64_t v155;
  NSString *v156;
  char v157;
  NSString *v158;
  char v159;
  char v160;
  uint64_t v161;
  NSString *fp_appContainerBundleIdentifier;
  NSString *v163;
  uint64_t v164;
  NSString *containerDisplayName;
  void *v166;
  uint64_t v167;
  NSString *v168;
  uint64_t v169;
  NSString *fp_parentDomainIdentifier;
  uint64_t v171;
  NSString *v172;
  NSString *v173;
  NSString *v174;
  char v175;
  uint64_t v176;
  NSString *v177;
  NSString *cloudContainerIdentifier;
  char shared;
  char v180;
  char v181;
  char v182;
  char v183;
  uint64_t v184;
  NSArray *conflictingVersions;
  void *v186;
  FPItem *v187;
  uint64_t v188;
  NSDictionary *extendedAttributes;
  uint64_t v190;
  unint64_t v191;
  uint64_t v192;
  _BOOL4 v193;
  uint64_t v194;
  NSString *preformattedOwnerName;
  NSString *v196;
  uint64_t v197;
  NSString *v198;
  uint64_t v199;
  NSString *preformattedMostRecentEditorName;
  uint64_t v201;
  NSArray *decorations;
  uint64_t v203;
  unsigned int v204;
  uint64_t v205;
  NSDictionary *inheritedUserInfo;
  uint64_t v207;
  void *v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  BOOL *p_isContainer;
  void *v213;
  SEL v214;
  int v215;
  char v216;
  id v217;
  void *v218;
  void *v219;
  _BOOL4 v220;
  _QWORD v221[4];
  id v222;
  FPItem *v223;
  SEL v224;
  uint8_t buf[4];
  void *v226;
  uint64_t v227;

  v220 = a8;
  v216 = a7;
  v227 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v18 = objc_msgSend(v13, "conformsToProtocol:", &unk_1EE5D3170);
  if (v18)
  {
    if ((isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v13, "providerIdentifier");
      v19 = (id)objc_claimAutoreleasedReturnValue();

      if ((isKindOfClass & 1) != 0)
        goto LABEL_9;
    }
    else
    {
      v19 = v14;

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
LABEL_9:
      objc_msgSend(v13, "fp_domainIdentifier");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
  else
  {
    v19 = v14;

  }
  v20 = v15;
LABEL_11:
  v21 = v20;

  if (v19)
  {
    v215 = v18;
    v219 = v21;
    objc_msgSend(v13, "parentItemIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "itemIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v220)
    {
      v25 = CFSTR("NSFileProviderRootContainerItemIdentifier");
      if ((objc_msgSend(v23, "isEqualToString:", CFSTR("NSFileProviderRootContainerItemIdentifier")) & 1) != 0
        || (v25 = CFSTR("NSFileProviderTrashContainerItemIdentifier"),
            objc_msgSend(v24, "isEqualToString:", CFSTR("NSFileProviderTrashContainerItemIdentifier"))))
      {
        v26 = v25;

        v22 = v26;
      }
    }
    v217 = v16;
    v218 = v22;
    v214 = a2;
    if ((isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v13, "itemVersion");
      v27 = (NSFileProviderItemVersion *)objc_claimAutoreleasedReturnValue();
      p_itemVersion = &self->_itemVersion;
      itemVersion = self->_itemVersion;
      self->_itemVersion = v27;

      if (self->_itemVersion)
        goto LABEL_25;
      if ((isKindOfClass & 1) != 0)
      {
LABEL_24:
        objc_msgSend(v13, "versionIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = [NSFileProviderItemVersion alloc];
        objc_msgSend(MEMORY[0x1E0C99D50], "data");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = -[NSFileProviderItemVersion initWithContentVersion:metadataVersion:](v33, "initWithContentVersion:metadataVersion:", v32, v34);
        v36 = *p_itemVersion;
        *p_itemVersion = (NSFileProviderItemVersion *)v35;

LABEL_25:
        objc_msgSend(v13, "filename");
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if ((isKindOfClass & 1) != 0)
        {
LABEL_29:
          objc_msgSend(v13, "contentType");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v39 = objc_opt_isKindOfClass();

          if ((v39 & 1) != 0)
          {
            objc_msgSend(v13, "contentType");
            v40 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_36;
          }
          if ((isKindOfClass & 1) != 0)
          {
LABEL_33:
            objc_msgSend(v13, "typeIdentifier");
            v40 = (id)objc_claimAutoreleasedReturnValue();

            if (v40)
            {
              v41 = (void *)MEMORY[0x1E0CEC3F8];
              objc_msgSend(v13, "typeIdentifier");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "fp_cachedTypeWithIdentifier:", v42);
              v40 = (id)objc_claimAutoreleasedReturnValue();

            }
LABEL_36:
            if (!-[__CFString length](v37, "length")
              && (dyld_program_sdk_at_least() & 1) == 0
              && objc_msgSend(v24, "isEqualToString:", CFSTR("NSFileProviderRootContainerItemIdentifier")))
            {
              fp_current_or_default_log();
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A0A34000, v43, OS_LOG_TYPE_DEFAULT, "[WARNING] Working around missing file name for root item of legacy provider", buf, 2u);
              }

              v37 = CFSTR("Root");
            }
            if (!v40)
            {
              if ((dyld_program_sdk_at_least() & 1) != 0)
              {
                v40 = 0;
              }
              else
              {
                fp_current_or_default_log();
                v44 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v226 = v24;
                  _os_log_impl(&dword_1A0A34000, v44, OS_LOG_TYPE_DEFAULT, "[WARNING] Working around missing type identifier of legacy provider for item %@", buf, 0xCu);
                }

                v40 = (id)*MEMORY[0x1E0CEC528];
              }
            }
            if (objc_msgSend(v19, "length")
              && objc_msgSend(v24, "length")
              && -[__CFString length](v37, "length")
              && v40)
            {
              if (!v220 || *p_itemVersion)
              {
                v45 = -[FPItem initWithProviderID:domainIdentifier:itemIdentifier:parentItemIdentifier:filename:contentType:](self, "initWithProviderID:domainIdentifier:itemIdentifier:parentItemIdentifier:filename:contentType:", v19, v219, v24, v218, v37, v40);

                if (!v45)
                {
LABEL_367:
                  self = v45;
                  v30 = self;
                  v16 = v217;
LABEL_63:

                  v21 = v219;
                  goto LABEL_64;
                }
                if ((isKindOfClass & 1) != 0)
                {
                  v45->_capabilities = objc_msgSend(v13, "capabilities");
                  v46 = v215;
                }
                else
                {
                  if (v220)
                    v58 = 67;
                  else
                    v58 = 3;
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                    v58 = objc_msgSend(v13, "capabilities");
                  v45->_capabilities = v58;
                  v46 = v215;
                  if ((objc_opt_respondsToSelector() & 1) == 0)
                  {
                    documentSize = v45->_documentSize;
                    v45->_documentSize = 0;

                    goto LABEL_75;
                  }
                }
                objc_msgSend(v13, "documentSize");
                v59 = objc_claimAutoreleasedReturnValue();
                v60 = v45->_documentSize;
                v45->_documentSize = (NSNumber *)v59;

                if ((isKindOfClass & 1) != 0)
                {
                  objc_msgSend(v13, "childItemCount");
                  v61 = objc_claimAutoreleasedReturnValue();
                  childItemCount = v45->_childItemCount;
                  v45->_childItemCount = (NSNumber *)v61;

                  goto LABEL_79;
                }
LABEL_75:
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  objc_msgSend(v13, "childItemCount");
                  v64 = objc_claimAutoreleasedReturnValue();
                  v65 = v45->_childItemCount;
                  v45->_childItemCount = (NSNumber *)v64;
                }
                else
                {
                  v65 = v45->_childItemCount;
                  v45->_childItemCount = 0;
                }

                if ((objc_opt_respondsToSelector() & 1) == 0)
                {
                  objc_msgSend(MEMORY[0x1E0C99D68], "date");
                  v68 = objc_claimAutoreleasedReturnValue();
                  creationDate = v45->_creationDate;
                  v45->_creationDate = (NSDate *)v68;

                  v45->_unsupportedFields |= 0x40uLL;
LABEL_82:
                  if ((objc_opt_respondsToSelector() & 1) == 0)
                  {
                    objc_msgSend(MEMORY[0x1E0C99D68], "date");
                    v72 = objc_claimAutoreleasedReturnValue();
                    contentModificationDate = v45->_contentModificationDate;
                    v45->_contentModificationDate = (NSDate *)v72;

                    v45->_unsupportedFields |= 0x80uLL;
                    if ((v46 & 1) == 0)
                      goto LABEL_89;
                    goto LABEL_87;
                  }
LABEL_83:
                  objc_msgSend(v13, "contentModificationDate");
                  v70 = objc_claimAutoreleasedReturnValue();
                  v71 = v45->_contentModificationDate;
                  v45->_contentModificationDate = (NSDate *)v70;

                  if ((v46 & 1) == 0)
                    goto LABEL_89;
                  if ((isKindOfClass & 1) != 0)
                    goto LABEL_88;
LABEL_87:
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                  {
LABEL_88:
                    objc_msgSend(v13, "formerIdentifier");
                    v74 = objc_claimAutoreleasedReturnValue();
                    formerIdentifier = v45->_formerIdentifier;
                    v45->_formerIdentifier = (NSString *)v74;
LABEL_90:

                    if ((isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
                    {
                      objc_msgSend(v13, "lastUsedDate");
                      v76 = objc_claimAutoreleasedReturnValue();
                      lastUsedDate = v45->_lastUsedDate;
                      v45->_lastUsedDate = (NSDate *)v76;

                      if ((v46 & 1) == 0)
                        goto LABEL_98;
                      if ((isKindOfClass & 1) != 0)
                        goto LABEL_97;
                    }
                    else
                    {
                      v78 = v45->_lastUsedDate;
                      v45->_lastUsedDate = 0;

                      v45->_unsupportedFields |= 8uLL;
                      if ((v46 & 1) == 0)
                        goto LABEL_98;
                    }
                    if ((objc_opt_respondsToSelector() & 1) != 0)
                    {
LABEL_97:
                      objc_msgSend(v13, "tags");
                      v79 = objc_claimAutoreleasedReturnValue();
                      tags = v45->_tags;
                      v45->_tags = (NSArray *)v79;
                      goto LABEL_99;
                    }
LABEL_98:
                    tags = v45->_tags;
                    v45->_tags = 0;
LABEL_99:

                    if (!v45->_tags)
                    {
                      if ((isKindOfClass & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0)
                      {
                        v45->_unsupportedFields |= 0x10uLL;
                        goto LABEL_108;
                      }
                      objc_msgSend(v13, "tagData");
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      v82 = v81;
                      if (v81)
                      {
                        FPGetTagsFromTagsData(v81);
                        v83 = objc_claimAutoreleasedReturnValue();
                        v84 = v45->_tags;
                        v45->_tags = (NSArray *)v83;

                      }
                      v46 = v215;
                    }
                    if ((isKindOfClass & 1) != 0)
                    {
                      objc_msgSend(v13, "favoriteRank");
                      v85 = objc_claimAutoreleasedReturnValue();
                      favoriteRank = v45->_favoriteRank;
                      v45->_favoriteRank = (NSNumber *)v85;

                      v45->_trashed = objc_msgSend(v13, "isTrashed");
                      v45->_uploaded = objc_msgSend(v13, "isUploaded");
                      v45->_uploading = objc_msgSend(v13, "isUploading");
                      goto LABEL_120;
                    }
LABEL_108:
                    if ((objc_opt_respondsToSelector() & 1) != 0)
                    {
                      objc_msgSend(v13, "favoriteRank");
                      v87 = objc_claimAutoreleasedReturnValue();
                      v88 = v45->_favoriteRank;
                      v45->_favoriteRank = (NSNumber *)v87;

                    }
                    else
                    {
                      v89 = v45->_favoriteRank;
                      v45->_favoriteRank = 0;

                      v45->_unsupportedFields |= 0x20uLL;
                    }
                    if ((objc_opt_respondsToSelector() & 1) != 0)
                      v90 = objc_msgSend(v13, "isTrashed");
                    else
                      v90 = 0;
                    v45->_trashed = v90;
                    v91 = objc_opt_respondsToSelector();
                    v92 = v220;
                    if ((v91 & 1) != 0)
                      v92 = objc_msgSend(v13, "isUploaded");
                    v45->_uploaded = v92;
                    if ((objc_opt_respondsToSelector() & 1) != 0)
                      v93 = objc_msgSend(v13, "isUploading");
                    else
                      v93 = 0;
                    v45->_uploading = v93;
                    if ((objc_opt_respondsToSelector() & 1) == 0)
                    {
                      v94 = 0;
LABEL_122:
                      objc_msgSend(v94, "fp_internalErrorForVendorErrorWithCallerDescription:itemCreationBlock:", CFSTR("item.uploadingError"), 0);
                      v95 = objc_claimAutoreleasedReturnValue();
                      uploadingError = v45->_uploadingError;
                      v45->_uploadingError = (NSError *)v95;

                      if ((isKindOfClass & 1) != 0)
                      {
                        v45->_downloading = objc_msgSend(v13, "isDownloading");
                        v45->_downloaded = objc_msgSend(v13, "isDownloaded");
                        v45->_mostRecentVersionDownloaded = objc_msgSend(v13, "isMostRecentVersionDownloaded");
                        v45->_supportsMostRecentVersionDownloaded = 1;
                      }
                      else
                      {
                        if ((objc_opt_respondsToSelector() & 1) != 0)
                          v97 = objc_msgSend(v13, "isDownloading");
                        else
                          v97 = 0;
                        v45->_downloading = v97;
                        if ((objc_opt_respondsToSelector() & 1) != 0)
                          v98 = objc_msgSend(v13, "isDownloaded");
                        else
                          v98 = 0;
                        v45->_downloaded = v98;
                        if ((objc_opt_respondsToSelector() & 1) != 0)
                          downloaded = objc_msgSend(v13, "isMostRecentVersionDownloaded");
                        else
                          downloaded = v45->_downloaded;
                        v45->_mostRecentVersionDownloaded = downloaded;
                        if ((objc_opt_respondsToSelector() & 1) != 0)
                          v45->_supportsMostRecentVersionDownloaded = 1;
                        v46 = v215;
                        if ((objc_opt_respondsToSelector() & 1) == 0)
                        {
                          v100 = 0;
LABEL_138:
                          v213 = v100;
                          objc_msgSend(v100, "fp_internalErrorForVendorErrorWithCallerDescription:itemCreationBlock:", CFSTR("item.downloadingError"), 0);
                          v101 = objc_claimAutoreleasedReturnValue();
                          downloadingError = v45->_downloadingError;
                          v45->_downloadingError = (NSError *)v101;

                          if ((isKindOfClass & 1) != 0)
                          {
                            v45->_shared = objc_msgSend(v13, "isShared");
                            v45->_sharedByCurrentUser = objc_msgSend(v13, "isSharedByCurrentUser");
                            if ((v46 & 1) == 0)
                              goto LABEL_151;
                          }
                          else
                          {
                            if ((objc_opt_respondsToSelector() & 1) != 0)
                              v103 = objc_msgSend(v13, "isShared");
                            else
                              v103 = 0;
                            v45->_shared = v103;
                            if ((objc_opt_respondsToSelector() & 1) != 0)
                            {
                              v45->_sharedByCurrentUser = objc_msgSend(v13, "isSharedByCurrentUser");
                              if ((v46 & 1) == 0)
                              {
LABEL_151:
                                v45->_fp_lastModifiedByCurrentUser = 0;
                                if ((isKindOfClass & 1) != 0)
                                  goto LABEL_153;
                                goto LABEL_152;
                              }
                            }
                            else
                            {
                              v45->_sharedByCurrentUser = 0;
                              if (!v46)
                                goto LABEL_151;
                            }
                            if ((objc_opt_respondsToSelector() & 1) == 0)
                              goto LABEL_151;
                          }
                          v45->_fp_lastModifiedByCurrentUser = objc_msgSend(v13, "fp_isLastModifiedByCurrentUser");
                          if ((isKindOfClass & 1) != 0)
                            goto LABEL_153;
LABEL_152:
                          if ((objc_opt_respondsToSelector() & 1) == 0)
                          {
                            if ((v46 & 1) == 0)
                              goto LABEL_161;
                            goto LABEL_157;
                          }
LABEL_153:
                          objc_msgSend(v13, "collaborationIdentifier");
                          v104 = objc_claimAutoreleasedReturnValue();
                          collaborationIdentifier = v45->_collaborationIdentifier;
                          v45->_collaborationIdentifier = (NSString *)v104;

                          if ((v46 & 1) == 0)
                            goto LABEL_161;
                          if ((isKindOfClass & 1) != 0)
                          {
LABEL_158:
                            v45->_isCollaborationInvitation = objc_msgSend(v13, "isCollaborationInvitation");
                            if ((isKindOfClass & 1) == 0)
                              goto LABEL_159;
                            goto LABEL_162;
                          }
LABEL_157:
                          if ((objc_opt_respondsToSelector() & 1) != 0)
                            goto LABEL_158;
LABEL_161:
                          v45->_isCollaborationInvitation = 0;
                          if ((isKindOfClass & 1) == 0)
                          {
LABEL_159:
                            if ((objc_opt_respondsToSelector() & 1) != 0)
                            {
                              objc_msgSend(v13, "ownerNameComponents");
                              v106 = objc_claimAutoreleasedReturnValue();
                              ownerNameComponents = v45->_ownerNameComponents;
                              v45->_ownerNameComponents = (NSPersonNameComponents *)v106;
                            }
                            else
                            {
                              ownerNameComponents = v45->_ownerNameComponents;
                              v45->_ownerNameComponents = 0;
                            }

                            if ((objc_opt_respondsToSelector() & 1) == 0)
                            {
                              mostRecentEditorNameComponents = v45->_mostRecentEditorNameComponents;
                              v45->_mostRecentEditorNameComponents = 0;

                              if ((v46 & 1) == 0)
                                goto LABEL_171;
                              goto LABEL_169;
                            }
LABEL_165:
                            objc_msgSend(v13, "mostRecentEditorNameComponents");
                            v110 = objc_claimAutoreleasedReturnValue();
                            v111 = v45->_mostRecentEditorNameComponents;
                            v45->_mostRecentEditorNameComponents = (NSPersonNameComponents *)v110;

                            if ((v46 & 1) == 0)
                              goto LABEL_171;
                            if ((isKindOfClass & 1) != 0)
                              goto LABEL_170;
LABEL_169:
                            if ((objc_opt_respondsToSelector() & 1) != 0)
                            {
LABEL_170:
                              objc_msgSend(v13, "originatorInfo");
                              v113 = objc_claimAutoreleasedReturnValue();
                              originatorInfo = v45->_originatorInfo;
                              v45->_originatorInfo = (NSData *)v113;
LABEL_172:

                              if ((isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
                              {
                                objc_msgSend(v13, "userInfo");
                                v115 = objc_claimAutoreleasedReturnValue();
                                userInfo = v45->_userInfo;
                                v45->_userInfo = (NSDictionary *)v115;

                                if ((v46 & 1) != 0)
                                {
                                  if ((isKindOfClass & 1) != 0)
                                  {
                                    v45->_excludedFromSync = objc_msgSend(v13, "isExcludedFromSync");
                                    v45->_ignoreRoot = objc_msgSend(v13, "isIgnoreRoot");
LABEL_186:
                                    v119 = objc_msgSend(v13, "exclusionType");
                                    goto LABEL_188;
                                  }
LABEL_178:
                                  if ((objc_opt_respondsToSelector() & 1) != 0)
                                    v118 = objc_msgSend(v13, "isExcludedFromSync");
                                  else
                                    v118 = 0;
                                  v45->_excludedFromSync = v118;
                                  if ((objc_opt_respondsToSelector() & 1) != 0)
                                    v120 = objc_msgSend(v13, "isIgnoreRoot");
                                  else
                                    v120 = 0;
                                  v45->_ignoreRoot = v120;
                                  if ((objc_opt_respondsToSelector() & 1) == 0)
                                  {
                                    v119 = 0;
                                    goto LABEL_188;
                                  }
                                  goto LABEL_186;
                                }
                              }
                              else
                              {
                                v117 = v45->_userInfo;
                                v45->_userInfo = 0;

                                if ((v46 & 1) != 0)
                                  goto LABEL_178;
                              }
                              v119 = 0;
                              *(_WORD *)&v45->_excludedFromSync = 0;
LABEL_188:
                              v45->_exclusionType = v119;
                              if ((isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
                              {
                                objc_msgSend(v13, "symlinkTargetPath");
                                v121 = objc_claimAutoreleasedReturnValue();
                                symlinkTargetPath = v45->_symlinkTargetPath;
                                v45->_symlinkTargetPath = (NSString *)v121;
                              }
                              else
                              {
                                symlinkTargetPath = v45->_symlinkTargetPath;
                                v45->_symlinkTargetPath = 0;
                              }

                              if (!v220)
                              {
                                if (v46 && ((isKindOfClass & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0))
                                {
                                  objc_msgSend(v13, "fileURL");
                                  v123 = objc_claimAutoreleasedReturnValue();
                                  fileURL = v45->_fileURL;
                                  v45->_fileURL = (NSURL *)v123;
                                }
                                else
                                {
                                  fileURL = v45->_fileURL;
                                  v45->_fileURL = 0;
                                }

                              }
                              if (v217)
                              {
                                objc_storeStrong((id *)&v45->_spotlightDomainIdentifier, a6);
                                if ((v46 & 1) != 0)
                                {
                                  if ((isKindOfClass & 1) != 0)
                                  {
                                    objc_msgSend(v13, "fp_spotlightSubDomainIdentifier");
                                    v125 = objc_claimAutoreleasedReturnValue();
                                    fp_spotlightSubDomainIdentifier = v45->_fp_spotlightSubDomainIdentifier;
                                    v45->_fp_spotlightSubDomainIdentifier = (NSString *)v125;

                                    goto LABEL_217;
                                  }
LABEL_207:
                                  if ((objc_opt_respondsToSelector() & 1) != 0)
                                  {
                                    if ((objc_opt_respondsToSelector() & 1) != 0)
                                    {
LABEL_209:
                                      objc_msgSend(v13, "fp_spotlightSubDomainIdentifier");
                                      v129 = objc_claimAutoreleasedReturnValue();
                                      v130 = v45->_fp_spotlightSubDomainIdentifier;
                                      v45->_fp_spotlightSubDomainIdentifier = (NSString *)v129;

                                      if ((isKindOfClass & 1) != 0)
                                      {
                                        objc_msgSend(v13, "displayName");
                                        v131 = objc_claimAutoreleasedReturnValue();
                                        displayName = v45->_displayName;
                                        v45->_displayName = (NSString *)v131;

                                        goto LABEL_221;
                                      }
LABEL_216:
                                      if ((objc_opt_respondsToSelector() & 1) == 0)
                                      {
                                        v144 = v45->_displayName;
                                        v45->_displayName = 0;

                                        goto LABEL_220;
                                      }
LABEL_217:
                                      objc_msgSend(v13, "displayName");
                                      v140 = objc_claimAutoreleasedReturnValue();
                                      v141 = v45->_displayName;
                                      v45->_displayName = (NSString *)v140;

                                      if ((isKindOfClass & 1) != 0)
                                      {
                                        objc_msgSend(v13, "hasUnresolvedConflicts");
                                        v142 = objc_claimAutoreleasedReturnValue();
                                        hasUnresolvedConflicts = v45->_hasUnresolvedConflicts;
                                        v45->_hasUnresolvedConflicts = (NSNumber *)v142;

                                        goto LABEL_225;
                                      }
LABEL_220:
                                      if ((objc_opt_respondsToSelector() & 1) == 0)
                                      {
                                        v149 = v45->_hasUnresolvedConflicts;
                                        v45->_hasUnresolvedConflicts = 0;

                                        goto LABEL_224;
                                      }
LABEL_221:
                                      objc_msgSend(v13, "hasUnresolvedConflicts");
                                      v145 = objc_claimAutoreleasedReturnValue();
                                      v146 = v45->_hasUnresolvedConflicts;
                                      v45->_hasUnresolvedConflicts = (NSNumber *)v145;

                                      if ((isKindOfClass & 1) != 0)
                                      {
                                        objc_msgSend(v13, "isDownloadRequested");
                                        v147 = objc_claimAutoreleasedReturnValue();
                                        isDownloadRequested = v45->_isDownloadRequested;
                                        v45->_isDownloadRequested = (NSNumber *)v147;

                                        goto LABEL_229;
                                      }
LABEL_224:
                                      if ((objc_opt_respondsToSelector() & 1) == 0)
                                      {
                                        v154 = v45->_isDownloadRequested;
                                        v45->_isDownloadRequested = 0;

                                        goto LABEL_228;
                                      }
LABEL_225:
                                      objc_msgSend(v13, "isDownloadRequested");
                                      v150 = objc_claimAutoreleasedReturnValue();
                                      v151 = v45->_isDownloadRequested;
                                      v45->_isDownloadRequested = (NSNumber *)v150;

                                      if ((isKindOfClass & 1) != 0)
                                      {
                                        objc_msgSend(v13, "sharingPermissions");
                                        v152 = objc_claimAutoreleasedReturnValue();
                                        sharingPermissions = v45->_sharingPermissions;
                                        v45->_sharingPermissions = (NSString *)v152;

                                        goto LABEL_230;
                                      }
LABEL_228:
                                      if ((objc_opt_respondsToSelector() & 1) == 0)
                                      {
                                        v158 = v45->_sharingPermissions;
                                        v45->_sharingPermissions = 0;

                                        goto LABEL_234;
                                      }
LABEL_229:
                                      objc_msgSend(v13, "sharingPermissions");
                                      v155 = objc_claimAutoreleasedReturnValue();
                                      v156 = v45->_sharingPermissions;
                                      v45->_sharingPermissions = (NSString *)v155;

                                      if ((isKindOfClass & 1) != 0)
                                      {
LABEL_230:
                                        v157 = objc_msgSend(v13, "fp_isContainer");
                                        v45->_isContainer = v157;
                                        p_isContainer = &v45->_isContainer;
                                        if ((v157 & 1) == 0)
                                          goto LABEL_242;
                                        if ((isKindOfClass & 1) != 0)
                                        {
                                          v45->_isContainerPristine = objc_msgSend(v13, "fp_isContainerPristine");
LABEL_241:
                                          objc_msgSend(v13, "fp_appContainerBundleIdentifier");
                                          v161 = objc_claimAutoreleasedReturnValue();
                                          fp_appContainerBundleIdentifier = v45->_fp_appContainerBundleIdentifier;
                                          v45->_fp_appContainerBundleIdentifier = (NSString *)v161;

LABEL_242:
                                          if ((isKindOfClass & 1) != 0)
                                            goto LABEL_246;
LABEL_245:
                                          if ((objc_opt_respondsToSelector() & 1) != 0)
                                          {
LABEL_246:
                                            objc_msgSend(v13, "containerDisplayName");
                                            v164 = objc_claimAutoreleasedReturnValue();
                                            containerDisplayName = v45->_containerDisplayName;
                                            v45->_containerDisplayName = (NSString *)v164;
                                            goto LABEL_248;
                                          }
LABEL_247:
                                          containerDisplayName = v45->_containerDisplayName;
                                          v45->_containerDisplayName = 0;
LABEL_248:

                                          if (!v45->_fp_appContainerBundleIdentifier)
                                          {
                                            if ((isKindOfClass & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0)
                                            {
                                              if ((v46 & 1) != 0)
                                                goto LABEL_256;
                                              goto LABEL_258;
                                            }
                                            objc_msgSend(v13, "performSelector:", sel_fp_cloudContainerClientBundleIdentifiers);
                                            v166 = (void *)objc_claimAutoreleasedReturnValue();
                                            +[FPAppMetadata findBundleIDForCurrentPlatformInSet:](FPAppMetadata, "findBundleIDForCurrentPlatformInSet:", v166);
                                            v167 = objc_claimAutoreleasedReturnValue();
                                            v168 = v45->_fp_appContainerBundleIdentifier;
                                            v45->_fp_appContainerBundleIdentifier = (NSString *)v167;

                                          }
                                          if ((v46 & 1) != 0)
                                          {
                                            if ((isKindOfClass & 1) != 0)
                                            {
                                              objc_msgSend(v13, "fp_parentDomainIdentifier");
                                              v169 = objc_claimAutoreleasedReturnValue();
                                              fp_parentDomainIdentifier = v45->_fp_parentDomainIdentifier;
                                              v45->_fp_parentDomainIdentifier = (NSString *)v169;

                                              goto LABEL_263;
                                            }
LABEL_256:
                                            if ((objc_opt_respondsToSelector() & 1) != 0)
                                            {
                                              objc_msgSend(v13, "fp_parentDomainIdentifier");
                                              v171 = objc_claimAutoreleasedReturnValue();
                                              v172 = v45->_fp_parentDomainIdentifier;
                                              v45->_fp_parentDomainIdentifier = (NSString *)v171;
                                            }
                                            else
                                            {
                                              v172 = v45->_fp_parentDomainIdentifier;
                                              v45->_fp_parentDomainIdentifier = 0;
                                            }

                                            if ((objc_opt_respondsToSelector() & 1) == 0)
                                            {
                                              cloudContainerIdentifier = v45->_cloudContainerIdentifier;
                                              v45->_cloudContainerIdentifier = 0;

                                              if (!v45->_excludedFromSync)
                                                goto LABEL_269;
                                              goto LABEL_267;
                                            }
LABEL_263:
                                            objc_msgSend(v13, "fp_cloudContainerIdentifier");
                                            v176 = objc_claimAutoreleasedReturnValue();
                                            v177 = v45->_cloudContainerIdentifier;
                                            v45->_cloudContainerIdentifier = (NSString *)v176;

                                            if (!v45->_excludedFromSync)
                                            {
                                              if ((isKindOfClass & 1) != 0)
                                                goto LABEL_270;
LABEL_269:
                                              if ((objc_opt_respondsToSelector() & 1) != 0)
                                              {
LABEL_270:
                                                v45->_isUbiquitous = objc_msgSend(v13, "fp_isUbiquitous");
                                                goto LABEL_273;
                                              }
                                              goto LABEL_271;
                                            }
LABEL_267:
                                            v45->_isUbiquitous = 0;
                                            if (v46)
                                            {
LABEL_273:
                                              if ((isKindOfClass & 1) != 0)
                                              {
                                                v45->_topLevelSharedItem = objc_msgSend(v13, "isTopLevelSharedItem");
                                                v45->_contentZoneRoot = objc_msgSend(v13, "isContentZoneRoot");
                                                v45->_inPinnedFolder = objc_msgSend(v13, "isInPinnedFolder");
                                                v45->_pinned = objc_msgSend(v13, "isPinned");
                                                v45->_recursivelyDownloaded = objc_msgSend(v13, "isRecursivelyDownloaded");
LABEL_292:
                                                objc_msgSend(v13, "conflictingVersions");
                                                v184 = objc_claimAutoreleasedReturnValue();
                                                conflictingVersions = v45->_conflictingVersions;
                                                v45->_conflictingVersions = (NSArray *)v184;
LABEL_294:

                                                if ((isKindOfClass & 1) != 0
                                                  || (objc_opt_respondsToSelector() & 1) != 0)
                                                {
                                                  objc_msgSend(v13, "extendedAttributes");
                                                  v186 = (void *)objc_claimAutoreleasedReturnValue();
                                                  if (v186)
                                                  {
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                                    {
                                                      objc_opt_class();
                                                      if ((objc_opt_isKindOfClass() & 1) == 0)
                                                      {
                                                        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                                                        v211 = (void *)objc_claimAutoreleasedReturnValue();
                                                        v210 = objc_opt_class();
                                                        objc_msgSend(v211, "handleFailureInMethod:object:file:lineNumber:description:", v214, v45, CFSTR("FPItem.m"), 831, CFSTR("extendedAttributes on %@ has class %@ instead of %@"), v13, v210, objc_opt_class());

                                                      }
                                                    }
                                                    v221[0] = MEMORY[0x1E0C809B0];
                                                    v221[1] = 3221225472;
                                                    v221[2] = __101__FPItem_initWithVendorItem_provider_domain_spotlightDomainIdentifier_extensionCapabilities_useFPFS___block_invoke;
                                                    v221[3] = &unk_1E444AA70;
                                                    v222 = v13;
                                                    v224 = v214;
                                                    v187 = v45;
                                                    v223 = v187;
                                                    objc_msgSend(v186, "fp_filter:", v221);
                                                    v188 = objc_claimAutoreleasedReturnValue();
                                                    extendedAttributes = v187->_extendedAttributes;
                                                    v187->_extendedAttributes = (NSDictionary *)v188;

                                                    v46 = v215;
                                                  }

                                                  if ((isKindOfClass & 1) != 0)
                                                  {
                                                    v45->_fileSystemFlags = objc_msgSend(v13, "fileSystemFlags");
                                                    v45->_enumerationOrigin = 0;
                                                    goto LABEL_317;
                                                  }
                                                }
                                                else
                                                {
                                                  v45->_unsupportedFields |= 0x200uLL;
                                                }
                                                if ((objc_opt_respondsToSelector() & 1) != 0)
                                                {
                                                  v45->_fileSystemFlags = objc_msgSend(v13, "fileSystemFlags");
                                                }
                                                else
                                                {
                                                  if ((v45->_capabilities & 2) != 0)
                                                    v190 = 20;
                                                  else
                                                    v190 = 16;
                                                  v191 = v190 & 0xFFFFFFFFFFFFFFFDLL | (2 * (v45->_capabilities & 1));
                                                  if (v46
                                                    && (objc_opt_respondsToSelector() & 1) != 0
                                                    && objc_msgSend(v13, "isHidden"))
                                                  {
                                                    v192 = v191 | 8;
                                                  }
                                                  else
                                                  {
                                                    v193 = -[NSString hasPrefix:](v45->_filename, "hasPrefix:", CFSTR("."));
                                                    v192 = v191 | 8;
                                                    if (!v193)
                                                      v192 = v191;
                                                  }
                                                  v45->_fileSystemFlags = v192;
                                                  v45->_unsupportedFields |= 0x100uLL;
                                                }
                                                v45->_enumerationOrigin = 0;
                                                if ((objc_opt_respondsToSelector() & 1) == 0)
                                                {
                                                  v45->_contentPolicy = 0;
                                                  if (v220)
                                                    goto LABEL_326;
LABEL_320:
                                                  if (!v45->_downloaded
                                                    || !v45->_uploaded
                                                    || *p_isContainer
                                                    || -[FPItem isFolder](v45, "isFolder")
                                                    || (v207 = -[NSNumber integerValue](v45->_documentSize, "integerValue"), (v216 & 2) == 0)|| v207 <= 2048)
                                                  {
                                                    if (!v45->_inPinnedFolder)
                                                      v45->_capabilities &= ~0x40uLL;
                                                  }
LABEL_326:
                                                  if ((v216 & 4) != 0)
                                                    v45->_capabilities |= 0x20000000uLL;
                                                  if (v46)
                                                  {
                                                    if ((isKindOfClass & 1) != 0)
                                                    {
                                                      objc_msgSend(v13, "preformattedOwnerName");
                                                      v194 = objc_claimAutoreleasedReturnValue();
                                                      preformattedOwnerName = v45->_preformattedOwnerName;
                                                      v45->_preformattedOwnerName = (NSString *)v194;

LABEL_336:
                                                      objc_msgSend(v13, "preformattedMostRecentEditorName");
                                                      v199 = objc_claimAutoreleasedReturnValue();
                                                      preformattedMostRecentEditorName = v45->_preformattedMostRecentEditorName;
                                                      v45->_preformattedMostRecentEditorName = (NSString *)v199;
                                                      goto LABEL_338;
                                                    }
                                                    if ((objc_opt_respondsToSelector() & 1) != 0)
                                                    {
                                                      objc_msgSend(v13, "preformattedOwnerName");
                                                      v197 = objc_claimAutoreleasedReturnValue();
                                                      v198 = v45->_preformattedOwnerName;
                                                      v45->_preformattedOwnerName = (NSString *)v197;
                                                    }
                                                    else
                                                    {
                                                      v198 = v45->_preformattedOwnerName;
                                                      v45->_preformattedOwnerName = 0;
                                                    }

                                                    if ((objc_opt_respondsToSelector() & 1) != 0)
                                                      goto LABEL_336;
                                                  }
                                                  else
                                                  {
                                                    v196 = v45->_preformattedOwnerName;
                                                    v45->_preformattedOwnerName = 0;

                                                  }
                                                  preformattedMostRecentEditorName = v45->_preformattedMostRecentEditorName;
                                                  v45->_preformattedMostRecentEditorName = 0;
LABEL_338:

                                                  if (-[NSData length](v45->_versionIdentifier, "length") >= 0x3E9)
                                                  {
                                                    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                                                    v208 = (void *)objc_claimAutoreleasedReturnValue();
                                                    objc_msgSend(v208, "handleFailureInMethod:object:file:lineNumber:description:", v214, v45, CFSTR("FPItem.m"), 899, CFSTR("version identifiers are limited to %lu bytes"), 1000);

                                                  }
                                                  if (objc_msgSend(v13, "conformsToProtocol:", &unk_1EE5D2488))
                                                  {
                                                    if ((isKindOfClass & 1) == 0
                                                      && (objc_opt_respondsToSelector() & 1) == 0)
                                                    {
                                                      if ((v46 & 1) != 0)
                                                      {
LABEL_348:
                                                        if ((objc_opt_respondsToSelector() & 1) != 0)
                                                          v203 = objc_msgSend(v13, "fileID");
                                                        else
                                                          v203 = 0;
                                                        v45->_fileID = v203;
                                                        if ((objc_opt_respondsToSelector() & 1) != 0)
                                                          v204 = objc_msgSend(v13, "documentID");
                                                        else
                                                          v204 = 0;
                                                        v45->_documentID = v204;
                                                        if ((objc_opt_respondsToSelector() & 1) != 0)
                                                          goto LABEL_356;
LABEL_357:
                                                        inheritedUserInfo = v45->_inheritedUserInfo;
                                                        v45->_inheritedUserInfo = 0;
                                                        goto LABEL_358;
                                                      }
LABEL_350:
                                                      v45->_fileID = 0;
                                                      v45->_documentID = 0;
                                                      goto LABEL_357;
                                                    }
                                                    objc_msgSend(v13, "decorations");
                                                    v201 = objc_claimAutoreleasedReturnValue();
                                                    decorations = v45->_decorations;
                                                    v45->_decorations = (NSArray *)v201;

                                                  }
                                                  if ((v46 & 1) != 0)
                                                  {
                                                    if ((isKindOfClass & 1) != 0)
                                                    {
                                                      v45->_fileID = objc_msgSend(v13, "fileID");
                                                      v45->_documentID = objc_msgSend(v13, "documentID");
LABEL_356:
                                                      objc_msgSend(v13, "inheritedUserInfo");
                                                      v205 = objc_claimAutoreleasedReturnValue();
                                                      inheritedUserInfo = v45->_inheritedUserInfo;
                                                      v45->_inheritedUserInfo = (NSDictionary *)v205;
LABEL_358:

                                                      if ((isKindOfClass & 1) != 0
                                                        || (objc_opt_respondsToSelector() & 1) != 0)
                                                      {
                                                        v45->_typeAndCreator.type = objc_msgSend(v13, "typeAndCreator");
                                                        v45->_typeAndCreator.creator = (unint64_t)objc_msgSend(v13, "typeAndCreator") >> 32;
                                                        if ((v46 & 1) == 0)
                                                          goto LABEL_366;
                                                        if ((isKindOfClass & 1) != 0)
                                                          goto LABEL_365;
                                                      }
                                                      else
                                                      {
                                                        v45->_typeAndCreator = 0;
                                                        v45->_unsupportedFields |= 0x400uLL;
                                                        if ((v46 & 1) == 0)
                                                          goto LABEL_366;
                                                      }
                                                      if ((objc_opt_respondsToSelector() & 1) != 0)
LABEL_365:
                                                        v45->_unsupportedFields = objc_msgSend(v13, "unsupportedFields");
LABEL_366:

                                                      goto LABEL_367;
                                                    }
                                                    goto LABEL_348;
                                                  }
                                                  goto LABEL_350;
                                                }
LABEL_317:
                                                __FILEPROVIDER_BAD_CONTENT_POLICY__(objc_msgSend(v13, "contentPolicy"), v220);
                                                v45->_contentPolicy = objc_msgSend(v13, "contentPolicy");
                                                v45->_capabilities |= 0x40uLL;
                                                if (v220)
                                                  goto LABEL_326;
                                                goto LABEL_320;
                                              }
                                              if ((objc_opt_respondsToSelector() & 1) != 0)
                                                shared = objc_msgSend(v13, "isTopLevelSharedItem");
                                              else
                                                shared = v45->_shared;
                                              v45->_topLevelSharedItem = shared;
                                              if ((objc_opt_respondsToSelector() & 1) != 0)
                                                v180 = objc_msgSend(v13, "isContentZoneRoot");
                                              else
                                                v180 = 0;
                                              v45->_contentZoneRoot = v180;
                                              if ((objc_opt_respondsToSelector() & 1) != 0)
                                                v181 = objc_msgSend(v13, "isInPinnedFolder");
                                              else
                                                v181 = 0;
                                              v45->_inPinnedFolder = v181;
                                              if ((objc_opt_respondsToSelector() & 1) != 0)
                                                v182 = objc_msgSend(v13, "isPinned");
                                              else
                                                v182 = 0;
                                              v45->_pinned = v182;
                                              if ((objc_opt_respondsToSelector() & 1) != 0)
                                                v183 = objc_msgSend(v13, "isRecursivelyDownloaded");
                                              else
                                                v183 = 0;
                                              v45->_recursivelyDownloaded = v183;
                                              if ((objc_opt_respondsToSelector() & 1) != 0)
                                                goto LABEL_292;
LABEL_293:
                                              conflictingVersions = v45->_conflictingVersions;
                                              v45->_conflictingVersions = 0;
                                              goto LABEL_294;
                                            }
LABEL_275:
                                            v45->_topLevelSharedItem = v45->_shared;
                                            v45->_contentZoneRoot = 0;
                                            *(_WORD *)&v45->_inPinnedFolder = 0;
                                            v45->_recursivelyDownloaded = 0;
                                            goto LABEL_293;
                                          }
LABEL_258:
                                          v173 = v45->_fp_parentDomainIdentifier;
                                          v45->_fp_parentDomainIdentifier = 0;

                                          v174 = v45->_cloudContainerIdentifier;
                                          v45->_cloudContainerIdentifier = 0;

                                          if (!v45->_excludedFromSync)
                                          {
                                            if ((isKindOfClass & 1) != 0)
                                            {
                                              v175 = 1;
                                              goto LABEL_272;
                                            }
LABEL_271:
                                            v175 = objc_opt_respondsToSelector();
LABEL_272:
                                            v45->_isUbiquitous = v175 & 1;
                                            if (v46)
                                              goto LABEL_273;
                                            goto LABEL_275;
                                          }
                                          goto LABEL_267;
                                        }
LABEL_236:
                                        if ((objc_opt_respondsToSelector() & 1) != 0)
                                          v160 = objc_msgSend(v13, "fp_isContainerPristine");
                                        else
                                          v160 = 0;
                                        v45->_isContainerPristine = v160;
                                        if ((objc_opt_respondsToSelector() & 1) == 0)
                                        {
                                          v163 = v45->_fp_appContainerBundleIdentifier;
                                          v45->_fp_appContainerBundleIdentifier = 0;

                                          goto LABEL_245;
                                        }
                                        goto LABEL_241;
                                      }
LABEL_234:
                                      if ((objc_opt_respondsToSelector() & 1) == 0)
                                      {
                                        v45->_isContainer = 0;
                                        p_isContainer = &v45->_isContainer;
                                        goto LABEL_245;
                                      }
                                      v159 = objc_msgSend(v13, "fp_isContainer");
                                      v45->_isContainer = v159;
                                      p_isContainer = &v45->_isContainer;
                                      if ((v159 & 1) == 0)
                                        goto LABEL_245;
                                      goto LABEL_236;
                                    }
                                  }
                                  else if ((objc_opt_respondsToSelector() & 1) != 0)
                                  {
                                    objc_msgSend(v13, "fp_spotlightDomainIdentifier");
                                    v138 = objc_claimAutoreleasedReturnValue();
                                    v139 = v45->_fp_spotlightSubDomainIdentifier;
                                    v45->_fp_spotlightSubDomainIdentifier = (NSString *)v138;
LABEL_215:

                                    goto LABEL_216;
                                  }
                                  v139 = v45->_fp_spotlightSubDomainIdentifier;
                                  v45->_fp_spotlightSubDomainIdentifier = 0;
                                  goto LABEL_215;
                                }
                              }
                              else if ((isKindOfClass & 1) != 0)
                              {
                                objc_msgSend(v13, "spotlightDomainIdentifier");
                                v127 = objc_claimAutoreleasedReturnValue();
                                spotlightDomainIdentifier = v45->_spotlightDomainIdentifier;
                                v45->_spotlightDomainIdentifier = (NSString *)v127;

                                if ((v46 & 1) != 0)
                                  goto LABEL_209;
                              }
                              else if ((v46 & 1) != 0)
                              {
                                goto LABEL_207;
                              }
                              v133 = v45->_fp_spotlightSubDomainIdentifier;
                              v45->_fp_spotlightSubDomainIdentifier = 0;

                              v134 = v45->_displayName;
                              v45->_displayName = 0;

                              v135 = v45->_hasUnresolvedConflicts;
                              v45->_hasUnresolvedConflicts = 0;

                              v136 = v45->_isDownloadRequested;
                              v45->_isDownloadRequested = 0;

                              v137 = v45->_sharingPermissions;
                              v45->_sharingPermissions = 0;

                              v45->_isContainer = 0;
                              p_isContainer = &v45->_isContainer;
                              goto LABEL_247;
                            }
LABEL_171:
                            originatorInfo = v45->_originatorInfo;
                            v45->_originatorInfo = 0;
                            goto LABEL_172;
                          }
LABEL_162:
                          objc_msgSend(v13, "ownerNameComponents");
                          v108 = objc_claimAutoreleasedReturnValue();
                          v109 = v45->_ownerNameComponents;
                          v45->_ownerNameComponents = (NSPersonNameComponents *)v108;

                          goto LABEL_165;
                        }
                      }
                      objc_msgSend(v13, "downloadingError");
                      v100 = (void *)objc_claimAutoreleasedReturnValue();
                      goto LABEL_138;
                    }
LABEL_120:
                    objc_msgSend(v13, "uploadingError");
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    goto LABEL_122;
                  }
LABEL_89:
                  formerIdentifier = v45->_formerIdentifier;
                  v45->_formerIdentifier = 0;
                  goto LABEL_90;
                }
LABEL_79:
                objc_msgSend(v13, "creationDate");
                v66 = objc_claimAutoreleasedReturnValue();
                v67 = v45->_creationDate;
                v45->_creationDate = (NSDate *)v66;

                if ((isKindOfClass & 1) != 0)
                  goto LABEL_83;
                goto LABEL_82;
              }
              v48 = 1;
              v47 = v220;
            }
            else
            {
              v47 = v220;
              v48 = v220 && *p_itemVersion == 0;
            }
            __FILEPROVIDER_BAD_ITEM__(v13, v19, v24, v37, (uint64_t)v40, v48, v47);
            fp_simulate_crash(CFSTR("can't create item because at least one of the required properties is missing. See the log for more details."), v49, v50, v51, v52, v53, v54, v55, v209);
            fp_current_or_default_log();
            v56 = objc_claimAutoreleasedReturnValue();
            v16 = v217;
            if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
              -[FPItem initWithVendorItem:provider:domain:spotlightDomainIdentifier:extensionCapabilities:useFPFS:].cold.1();

            v30 = 0;
            goto LABEL_63;
          }
LABEL_32:
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            v40 = 0;
            goto LABEL_36;
          }
          goto LABEL_33;
        }
LABEL_28:
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_32;
        goto LABEL_29;
      }
    }
    else
    {
      p_itemVersion = &self->_itemVersion;
      v31 = self->_itemVersion;
      self->_itemVersion = 0;

      if (self->_itemVersion)
        goto LABEL_27;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      goto LABEL_24;
LABEL_27:
    objc_msgSend(v13, "filename");
    v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  v30 = 0;
LABEL_64:

  return v30;
}

- (NSURL)fileURL
{
  FPItem *v2;
  NSURL *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_fileURL;
  objc_sync_exit(v2);

  return v3;
}

- (NSArray)itemDecorations
{
  void *v3;
  NSArray *decorations;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t, uint64_t);
  void *v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[3];
  char v21;

  -[FPItem providerID](self, "providerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  decorations = self->_decorations;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __25__FPItem_itemDecorations__block_invoke;
  v17 = &unk_1E444AAE0;
  v5 = v3;
  v18 = v5;
  v19 = v20;
  -[NSArray fp_map:](decorations, "fp_map:", &v14);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E0C9AA60];
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  v10 = (void *)objc_msgSend(v9, "mutableCopy", v14, v15, v16, v17);
  if (-[FPItem isShared](self, "isShared"))
  {
    -[FPItem _sharedByDecorationType](self, "_sharedByDecorationType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPItemDecoration decorationWithIdentifier:bundleIdentifier:](FPItemDecoration, "decorationWithIdentifier:bundleIdentifier:", v11, CFSTR("com.apple.FileProvider"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addObject:", v12);
  }

  _Block_object_dispose(v20, 8);
  return (NSArray *)v10;
}

- (NSString)providerID
{
  return self->_providerID;
}

- (BOOL)isShared
{
  return self->_shared;
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (BOOL)isInPinnedFolder
{
  return self->_inPinnedFolder;
}

- (BOOL)isTrashed
{
  return self->_trashed;
}

- (NSPersonNameComponents)mostRecentEditorNameComponents
{
  void *v3;
  NSPersonNameComponents *v4;
  NSPersonNameComponents *mostRecentEditorNameComponents;

  if (!self->_mostRecentEditorNameComponents && -[NSString length](self->_preformattedMostRecentEditorName, "length"))
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "personNameComponentsFromString:", self->_preformattedMostRecentEditorName);
    v4 = (NSPersonNameComponents *)objc_claimAutoreleasedReturnValue();
    mostRecentEditorNameComponents = self->_mostRecentEditorNameComponents;
    self->_mostRecentEditorNameComponents = v4;

  }
  return self->_mostRecentEditorNameComponents;
}

- (NSString)providerIDForDeduplication
{
  void *v2;
  __CFString *v3;

  -[FPItem providerID](self, "providerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!FPIsCloudDocsWithFPFSEnabled())
    goto LABEL_6;
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider")) & 1) == 0)
  {
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged")) & 1) != 0)
    {
      v3 = CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged");
      goto LABEL_7;
    }
LABEL_6:
    v3 = v2;
    goto LABEL_7;
  }
  v3 = CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider");
LABEL_7:

  return (NSString *)v3;
}

- (void)setCapabilities:(unint64_t)a3
{
  self->_capabilities = a3;
}

- (void)setIsContainer:(BOOL)a3
{
  self->_isContainer = a3;
}

- (void)setFp_appContainerBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (NSString)fp_appContainerBundleIdentifier
{
  return self->_fp_appContainerBundleIdentifier;
}

- (BOOL)isContainerPristine
{
  return self->_isContainerPristine;
}

- (id)descriptionForFPCTL:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  NSString *p_isa;
  const __CFString *v8;
  unint64_t state;
  NSString *displayName;
  void *v11;
  __CFString *v12;
  NSString *v13;
  const __CFString *v14;
  NSNumber *documentSize;
  void *v16;
  void *v17;
  double v18;
  double v19;
  _BOOL4 v20;
  uint64_t v21;
  NSDate *lastUsedDate;
  double v23;
  void *v24;
  void *v25;
  NSPersonNameComponents *ownerNameComponents;
  void *v27;
  void *v28;
  void *v29;
  NSPersonNameComponents *mostRecentEditorNameComponents;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSNumber *favoriteRank;
  FPItem *v41;
  NSURL *v42;
  void *v43;
  NSDictionary *extendedAttributes;
  const char *v45;
  unint64_t fileSystemFlags;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  NSString *symlinkTargetPath;
  void *v54;
  FPItem *v55;
  NSProgress *v56;
  NSProgress *v57;
  NSProgress *v58;
  uint64_t v59;
  NSArray *conflictingVersions;
  void *v61;
  FPItem *v62;
  NSProgress *v63;
  NSProgress *v64;
  NSProgress *v65;
  uint64_t v66;
  const __CFString *v67;
  NSUInteger v68;
  uint64_t v69;
  NSDictionary *userInfo;
  id v71;
  NSDictionary *inheritedUserInfo;
  id v73;
  id v74;
  const __CFString *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD v81[4];
  id v82;
  _QWORD v83[4];
  id v84;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 256);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v3)
    objc_msgSend(v5, "appendFormat:", CFSTR("<"));
  p_isa = self->_itemIdentifier;
  if (-[NSString isEqualToString:](p_isa, "isEqualToString:", CFSTR("NSFileProviderRootContainerItemIdentifier")))
  {
    v8 = CFSTR("root");
  }
  else
  {
    if (!-[NSString isEqualToString:](p_isa, "isEqualToString:", CFSTR("NSFileProviderTrashContainerItemIdentifier")))
      goto LABEL_8;
    v8 = CFSTR("trash");
  }

  p_isa = &v8->isa;
LABEL_8:
  if (v3)
    objc_msgSend(v6, "appendFormat:", CFSTR("i:%@"), p_isa, v77, v78);
  else
    objc_msgSend(v6, "appendFormat:", CFSTR("%@ %p:%@"), objc_opt_class(), self, p_isa);
  if (self->_formerIdentifier)
    objc_msgSend(v6, "appendFormat:", CFSTR(" (replacing:%@)"), self->_formerIdentifier);
  state = self->_state;
  if (state)
  {
    if ((state & 4) != 0)
    {
      objc_msgSend(v6, "appendString:", CFSTR(" pending"));
      state = self->_state;
      if ((state & 2) == 0)
      {
LABEL_16:
        if ((state & 1) == 0)
          goto LABEL_18;
        goto LABEL_17;
      }
    }
    else if ((state & 2) == 0)
    {
      goto LABEL_16;
    }
    objc_msgSend(v6, "appendString:", CFSTR(" has-update"));
    if ((self->_state & 1) != 0)
LABEL_17:
      objc_msgSend(v6, "appendString:", CFSTR(" is-placeholder"));
  }
LABEL_18:
  displayName = self->_displayName;
  if (v3)
  {
    if (displayName)
      objc_msgSend(v6, "appendFormat:", CFSTR(" l:\"%@\"), self->_displayName);
    else
      objc_msgSend(v6, "appendFormat:", CFSTR(" f:\"%@\"), self->_filename);
  }
  else
  {
    if (displayName)
    {
      -[NSString fp_obfuscatedFilename](displayName, "fp_obfuscatedFilename");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR(" l:\"%@\"), v11);
    }
    else
    {
      -[NSString fp_obfuscatedFilename](self->_filename, "fp_obfuscatedFilename");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR(" f:\"%@\"), v11);
    }

  }
  if (self->_trashed)
    objc_msgSend(v6, "appendFormat:", CFSTR(" trashed"));
  if (self->_isContainer)
  {
    v12 = self->_isContainerPristine ? CFSTR(" container-pristine") : CFSTR(" container");
    objc_msgSend(v6, "appendFormat:", v12);
    if (self->_fp_appContainerBundleIdentifier)
      objc_msgSend(v6, "appendFormat:", CFSTR(" bid:%@"), self->_fp_appContainerBundleIdentifier);
  }
  v13 = self->_parentItemIdentifier;
  if (-[NSString isEqualToString:](v13, "isEqualToString:", CFSTR("NSFileProviderRootContainerItemIdentifier")))
  {
    v14 = CFSTR("root");
  }
  else
  {
    if (!-[NSString isEqualToString:](v13, "isEqualToString:", CFSTR("NSFileProviderTrashContainerItemIdentifier")))
      goto LABEL_42;
    v14 = CFSTR("trash");
  }

  v13 = &v14->isa;
LABEL_42:
  objc_msgSend(v6, "appendFormat:", CFSTR(" p:%@"), v13);
  documentSize = self->_documentSize;
  if (documentSize)
  {
    if (-[NSNumber unsignedLongLongValue](documentSize, "unsignedLongLongValue"))
    {
      -[NSNumber unsignedLongLongValue](self->_documentSize, "unsignedLongLongValue");
      NSLocalizedFileSizeDescription();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR(" sz:%@"), v16);

    }
    else
    {
      objc_msgSend(v6, "appendFormat:", CFSTR(" sz:%@"), CFSTR("0"));
    }
  }
  if (self->_childItemCount)
    objc_msgSend(v6, "appendFormat:", CFSTR(" c:%@"), self->_childItemCount);
  -[FPItem humanReadableCapabilities](self, "humanReadableCapabilities");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" cap:%@"), v17);

  -[NSDate timeIntervalSince1970](self->_creationDate, "timeIntervalSince1970");
  objc_msgSend(v6, "appendFormat:", CFSTR(" bt:%lld"), (uint64_t)v18);
  -[NSDate timeIntervalSince1970](self->_contentModificationDate, "timeIntervalSince1970");
  objc_msgSend(v6, "appendFormat:", CFSTR(" mt:%lld"), (uint64_t)v19);
  if (-[FPItem isItemPinned](self, "isItemPinned") || -[FPItem isPinnedSubitem](self, "isPinnedSubitem"))
  {
    v20 = -[FPItem isPinnedSubitem](self, "isPinnedSubitem");
    v21 = 114;
    if (v20)
      v21 = 115;
    objc_msgSend(v6, "appendFormat:", CFSTR(" pin:%c"), v21);
  }
  lastUsedDate = self->_lastUsedDate;
  if (lastUsedDate)
  {
    -[NSDate timeIntervalSince1970](lastUsedDate, "timeIntervalSince1970");
    objc_msgSend(v6, "appendFormat:", CFSTR(" lu:%lld"), (uint64_t)v23);
  }
  if (self->_shared)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (self->_sharedByCurrentUser)
    {
      objc_msgSend(v24, "addObject:", CFSTR("shared-by-me"));
    }
    else
    {
      ownerNameComponents = self->_ownerNameComponents;
      if (ownerNameComponents)
      {
        v27 = (void *)MEMORY[0x1E0CB3940];
        -[NSPersonNameComponents givenName](ownerNameComponents, "givenName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("shared-by:%@"), v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "addObject:", v29);
      }
    }
    if (self->_fp_lastModifiedByCurrentUser)
    {
      objc_msgSend(v25, "addObject:", CFSTR("mod-by-me"));
    }
    else
    {
      mostRecentEditorNameComponents = self->_mostRecentEditorNameComponents;
      if (mostRecentEditorNameComponents)
      {
        v31 = (void *)MEMORY[0x1E0CB3940];
        -[NSPersonNameComponents givenName](mostRecentEditorNameComponents, "givenName");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringWithFormat:", CFSTR("mod-by:%@"), v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "addObject:", v33);
      }
    }
    if (self->_topLevelSharedItem)
      objc_msgSend(v25, "addObject:", CFSTR("top-lvl"));
    if (objc_msgSend(v25, "count"))
    {
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("|"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR(" shared{%@}"), v34);

    }
    else
    {
      objc_msgSend(v6, "appendString:", CFSTR(" shared"));
    }

  }
  -[FPItem tags](self, "tags");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "count");

  if (v36)
  {
    -[FPItem tags](self, "tags");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "fp_map:", &__block_literal_global_2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "componentsJoinedByString:", CFSTR(","));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" tags:[%@]"), v39);

  }
  favoriteRank = self->_favoriteRank;
  if (favoriteRank)
    objc_msgSend(v6, "appendFormat:", CFSTR(" fr:%llu"), -[NSNumber unsignedLongLongValue](favoriteRank, "unsignedLongLongValue"));
  if (!v3)
  {
    v41 = self;
    objc_sync_enter(v41);
    v42 = v41->_fileURL;
    objc_sync_exit(v41);

    if (v42)
    {
      -[NSURL fp_shortDescription](v42, "fp_shortDescription");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR(" url:\"%@\"), v43);

    }
  }
  extendedAttributes = self->_extendedAttributes;
  v45 = "";
  if (extendedAttributes && -[NSDictionary count](extendedAttributes, "count"))
    v45 = "@";
  fileSystemFlags = self->_fileSystemFlags;
  v47 = 101;
  if ((fileSystemFlags & 0x10) == 0)
    v47 = 45;
  v48 = 104;
  if ((fileSystemFlags & 8) == 0)
    v48 = 45;
  v79 = v48;
  v80 = v47;
  v49 = 120;
  if ((fileSystemFlags & 1) == 0)
    v49 = 45;
  v50 = 119;
  if ((fileSystemFlags & 4) == 0)
    v50 = 45;
  v51 = 114;
  if ((self->_fileSystemFlags & 2) == 0)
    v51 = 45;
  objc_msgSend(v6, "appendFormat:", CFSTR(" mode:%s%c%c%c%c%c"), v45, v51, v50, v49, v79, v80);
  if (self->_contentZoneRoot)
    objc_msgSend(v6, "appendString:", CFSTR(" czr"));
  if (self->_fileID)
    objc_msgSend(v6, "appendFormat:", CFSTR(" fid:%llu"), self->_fileID);
  if (self->_documentID)
    objc_msgSend(v6, "appendFormat:", CFSTR(" did:%u"), self->_documentID);
  if (self->_typeAndCreator.type)
    objc_msgSend(v6, "appendFormat:", CFSTR(" ostype:%x"), self->_typeAndCreator.type);
  if (self->_typeAndCreator.creator)
    objc_msgSend(v6, "appendFormat:", CFSTR(" creatorcode:%x"), self->_typeAndCreator.creator);
  -[FPItem typeIdentifier](self, "typeIdentifier");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" uti:%@"), v52);

  symlinkTargetPath = self->_symlinkTargetPath;
  if (symlinkTargetPath)
  {
    -[NSString fp_obfuscatedPath](symlinkTargetPath, "fp_obfuscatedPath");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" tg:\"%@\"), v54);

  }
  if (self->_uploading)
  {
    v55 = self;
    objc_sync_enter(v55);
    v56 = v55->_progress;
    objc_sync_exit(v55);

    if (-[NSProgress fp_isOfFileOperationKind:](v56, "fp_isOfFileOperationKind:", *MEMORY[0x1E0CB30E0]))
      v57 = v56;
    else
      v57 = 0;
    v58 = v57;
    objc_msgSend(v6, "appendFormat:", CFSTR(" ul:uploading"));
    if (v58)
    {
      if (-[NSProgress isIndeterminate](v58, "isIndeterminate"))
      {
        objc_msgSend(v6, "appendString:", CFSTR("(?%)"));
      }
      else
      {
        -[NSProgress fractionCompleted](v58, "fractionCompleted");
        objc_msgSend(v6, "appendFormat:", CFSTR("(%.2f)"), v59);
      }
    }

  }
  else if (self->_uploaded)
  {
    objc_msgSend(v6, "appendString:", CFSTR(" ul:uploaded"));
  }
  if (self->_uploadingError)
    objc_msgSend(v6, "appendFormat:", CFSTR(" ul-error:%@"), self->_uploadingError);
  conflictingVersions = self->_conflictingVersions;
  if (conflictingVersions)
  {
    -[NSArray componentsJoinedByString:](conflictingVersions, "componentsJoinedByString:", CFSTR(","));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" conflicts:[%@]"), v61);

  }
  if (self->_downloading || -[FPItem isExternalDownloadPlaceholder](self, "isExternalDownloadPlaceholder"))
  {
    v62 = self;
    objc_sync_enter(v62);
    v63 = v62->_progress;
    objc_sync_exit(v62);

    if (-[NSProgress fp_isOfFileOperationKind:](v63, "fp_isOfFileOperationKind:", *MEMORY[0x1E0CB30B8]))
      v64 = v63;
    else
      v64 = 0;
    v65 = v64;
    objc_msgSend(v6, "appendFormat:", CFSTR(" dl:downloading"));
    if (v65)
    {
      if (-[NSProgress isIndeterminate](v65, "isIndeterminate"))
      {
        objc_msgSend(v6, "appendString:", CFSTR("(?%)"));
      }
      else
      {
        -[NSProgress fractionCompleted](v65, "fractionCompleted");
        objc_msgSend(v6, "appendFormat:", CFSTR("(%.2f)"), v66);
      }
    }

  }
  else
  {
    if (self->_mostRecentVersionDownloaded)
    {
      v76 = CFSTR(" dl:current");
    }
    else if (self->_downloaded)
    {
      v76 = CFSTR(" dl:downloaded");
    }
    else
    {
      if (!-[FPItem isCloudItem](self, "isCloudItem"))
        goto LABEL_128;
      v76 = CFSTR(" dl:fault");
    }
    objc_msgSend(v6, "appendString:", v76);
  }
LABEL_128:
  if (self->_downloadingError)
    objc_msgSend(v6, "appendFormat:", CFSTR(" dl-error:%@"), self->_downloadingError);
  if (-[FPItem isFolder](self, "isFolder"))
  {
    if (self->_recursivelyDownloaded)
    {
      v67 = CFSTR(" rec-dl:yes");
LABEL_136:
      objc_msgSend(v6, "appendString:", v67);
      goto LABEL_137;
    }
LABEL_135:
    v67 = CFSTR(" rec-dl:no");
    goto LABEL_136;
  }
  if (-[FPItem isPackage](self, "isPackage") && !self->_recursivelyDownloaded)
    goto LABEL_135;
LABEL_137:
  if (self->_fp_spotlightSubDomainIdentifier)
    objc_msgSend(v6, "appendFormat:", CFSTR(" spd:%@"), self->_fp_spotlightSubDomainIdentifier);
  if (self->_excludedFromSync)
  {
    if (self->_ignoreRoot)
      objc_msgSend(v6, "appendString:", CFSTR(" excluded:root"));
    else
      objc_msgSend(v6, "appendFormat:", CFSTR(" excluded:yes"));
  }
  if (self->_contentPolicy)
    objc_msgSend(v6, "appendFormat:", CFSTR(" contentPolicy:%lu"), self->_contentPolicy);
  if (v3)
  {
    v68 = -[NSDictionary count](self->_userInfo, "count");
    v69 = MEMORY[0x1E0C809B0];
    if (v68)
    {
      objc_msgSend(v6, "appendString:", CFSTR(" ui:{"));
      userInfo = self->_userInfo;
      v83[0] = v69;
      v83[1] = 3221225472;
      v83[2] = __30__FPItem_descriptionForFPCTL___block_invoke_2;
      v83[3] = &unk_1E444AAB8;
      v71 = v6;
      v84 = v71;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](userInfo, "enumerateKeysAndObjectsUsingBlock:", v83);
      if (objc_msgSend(v71, "hasSuffix:", CFSTR(", ")))
        objc_msgSend(v71, "replaceCharactersInRange:withString:", objc_msgSend(v71, "length") - 2, 2, CFSTR("} "));

    }
    if (-[NSDictionary count](self->_inheritedUserInfo, "count"))
    {
      objc_msgSend(v6, "appendString:", CFSTR(" iui:{"));
      inheritedUserInfo = self->_inheritedUserInfo;
      v81[0] = v69;
      v81[1] = 3221225472;
      v81[2] = __30__FPItem_descriptionForFPCTL___block_invoke_3;
      v81[3] = &unk_1E444AAB8;
      v73 = v6;
      v82 = v73;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](inheritedUserInfo, "enumerateKeysAndObjectsUsingBlock:", v81);
      if (objc_msgSend(v73, "hasSuffix:", CFSTR(", ")))
        objc_msgSend(v73, "replaceCharactersInRange:withString:", objc_msgSend(v73, "length") - 2, 2, CFSTR("} "));

    }
  }
  else
  {
    objc_msgSend(v6, "appendString:", CFSTR(">"));
  }
  v74 = v6;

  return v74;
}

- (void)setTypeIdentifier:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "fp_cachedTypeWithIdentifier:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FPItem setContentType:](self, "setContentType:", v4);

}

- (BOOL)fp_isCloudDocsContainer
{
  void *v3;
  void *v4;
  char v5;

  if (!-[FPItem isContainer](self, "isContainer"))
    return 0;
  -[FPItem providerItemIdentifier](self, "providerItemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("a1")))
  {
    -[FPItem providerID](self, "providerID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "fp_isiCloudDriveOrCloudDocsIdentifier");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setFilename:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSString *displayName;
  NSObject *v14;
  uint64_t v15;

  v12 = a3;
  if (v12)
  {
    objc_storeStrong((id *)&self->_filename, a3);
    displayName = self->_displayName;
    self->_displayName = 0;

  }
  else
  {
    fp_simulate_crash(CFSTR("can't set a nil filename"), v5, v6, v7, v8, v9, v10, v11, v15);
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[FPItem setFilename:].cold.1();

  }
}

- (BOOL)isValidContainerForAppLibrary
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (-[FPItem fp_isCloudDocsContainer](self, "fp_isCloudDocsContainer") || !-[FPItem isContainer](self, "isContainer"))
    return 0;
  -[FPItem fp_appContainerBundleIdentifier](self, "fp_appContainerBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[FPItem displayName](self, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      -[FPItem fileURL](self, "fileURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5 != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isValidAppLibrary
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[FPItem isValidContainerForAppLibrary](self, "isValidContainerForAppLibrary");
  if (v3)
  {
    -[FPItem fileURL](self, "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Documents"));

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (unint64_t)unsupportedFields
{
  return self->_unsupportedFields;
}

- (NSData)tagData
{
  void *tags;

  tags = self->_tags;
  if (tags)
  {
    FPGetTagsDataForTags(tags);
    tags = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSData *)tags;
}

- (NSString)symlinkTargetPath
{
  return self->_symlinkTargetPath;
}

- (void)setItemIdentifier:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  uint64_t v14;

  v12 = a3;
  if (v12)
  {
    objc_storeStrong((id *)&self->_itemIdentifier, a3);
  }
  else
  {
    fp_simulate_crash(CFSTR("can't set a nil item identifier"), v5, v6, v7, v8, v9, v10, v11, v14);
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[FPItem setItemIdentifier:].cold.1();

  }
}

- (NSString)providerItemIdentifier
{
  void *v2;
  void *v3;

  -[FPItem providerItemID](self, "providerItemID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (FPItemID)providerItemID
{
  void *v3;
  int v4;

  -[FPItem itemID](self, "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDiskIdentifier");

  if (v4)
    -[FPItem formerItemID](self, "formerItemID");
  else
    -[FPItem itemID](self, "itemID");
  return (FPItemID *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)providerIdentifier
{
  return self->_providerID;
}

- (BOOL)isWritable
{
  return (LOBYTE(self->_capabilities) >> 1) & 1;
}

- (NSDictionary)inheritedUserInfo
{
  return self->_inheritedUserInfo;
}

- (NSString)fp_spotlightSubDomainIdentifier
{
  return self->_fp_spotlightSubDomainIdentifier;
}

- (NSString)fp_parentDomainIdentifier
{
  return self->_fp_parentDomainIdentifier;
}

- (NSString)formerIdentifier
{
  return self->_formerIdentifier;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (unsigned)documentID
{
  return self->_documentID;
}

- (NSString)description
{
  return (NSString *)-[FPItem descriptionForFPCTL:](self, "descriptionForFPCTL:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  FPItem *v4;
  id *p_isa;
  id *v6;

  v4 = -[FPItem initWithVendorItem:provider:domain:spotlightDomainIdentifier:extensionCapabilities:useFPFS:]([FPItem alloc], "initWithVendorItem:provider:domain:spotlightDomainIdentifier:extensionCapabilities:useFPFS:", self, self->_providerID, self->_domainIdentifier, self->_spotlightDomainIdentifier, -1, 0);
  p_isa = (id *)&v4->super.isa;
  if (v4)
  {
    v4->_state = self->_state;
    objc_storeStrong((id *)&v4->_uploadingError, self->_uploadingError);
    objc_storeStrong(p_isa + 14, self->_downloadingError);
    v6 = p_isa;
  }

  return p_isa;
}

- (BOOL)allowsContextualMenuDownloadEntry
{
  return self->_allowsContextualMenuDownloadEntry;
}

+ (id)appLibraryFromContainerItem:(id)a3 documentsItem:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FPItem+FPAppLibraryCollection.m"), 20, CFSTR("containerItem must not be nil"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FPItem+FPAppLibraryCollection.m"), 21, CFSTR("documentsItem must not be nil"));

LABEL_3:
  if ((objc_msgSend(v7, "fp_isCloudDocsContainer") & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v9, "fileURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFileURL:", v12);

    objc_msgSend(v9, "itemIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setItemIdentifier:", v13);

    objc_msgSend(v11, "setFileID:", objc_msgSend(v9, "fileID"));
    objc_msgSend(v9, "formerIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFormerIdentifier:", v14);

    objc_msgSend(v9, "creationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCreationDate:", v15);

    objc_msgSend(v9, "lastUsedDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLastUsedDate:", v16);

    objc_msgSend(v9, "contentModificationDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentModificationDate:", v17);

    objc_msgSend(v11, "setRecursivelyDownloaded:", objc_msgSend(v9, "isRecursivelyDownloaded"));
    objc_msgSend(v11, "setDownloaded:", objc_msgSend(v9, "isDownloaded"));
    objc_msgSend(v11, "setDownloading:", objc_msgSend(v9, "isDownloading"));
    objc_msgSend(v11, "setCapabilities:", objc_msgSend(v9, "capabilities"));
    objc_msgSend(v9, "favoriteRank");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFavoriteRank:", v18);

    objc_msgSend(v9, "childItemCount");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setChildItemCount:", v19);

    objc_msgSend(v11, "setPinned:", objc_msgSend(v9, "isPinned"));
    objc_msgSend(v11, "setInPinnedFolder:", objc_msgSend(v9, "isInPinnedFolder"));
    if (objc_msgSend(v11, "isValidAppLibrary"))
    {
      v10 = v11;
    }
    else
    {
      fp_current_or_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        +[FPItem(FPAppLibraryCollection) appLibraryFromContainerItem:documentsItem:].cold.1((uint64_t)v11, v22);

      v10 = 0;
    }

  }
  return v10;
}

- (FPItem)initWithProviderID:(id)a3 domainIdentifier:(id)a4 itemIdentifier:(id)a5 parentItemIdentifier:(id)a6 filename:(id)a7 isDirectory:(BOOL)a8
{
  _QWORD *v8;

  v8 = (_QWORD *)MEMORY[0x1E0CEC4F0];
  if (!a8)
    v8 = (_QWORD *)MEMORY[0x1E0CEC528];
  return -[FPItem initWithProviderID:domainIdentifier:itemIdentifier:parentItemIdentifier:filename:contentType:](self, "initWithProviderID:domainIdentifier:itemIdentifier:parentItemIdentifier:filename:contentType:", a3, a4, a5, a6, a7, *v8);
}

- (FPItem)initWithProviderDomainID:(id)a3 itemIdentifier:(id)a4 parentItemIdentifier:(id)a5 filename:(id)a6 typeIdentifier:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  FPItem *v18;

  v12 = (void *)MEMORY[0x1E0CEC3F8];
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v12, "fp_cachedTypeWithIdentifier:", a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[FPItem initWithProviderDomainID:itemIdentifier:parentItemIdentifier:filename:contentType:](self, "initWithProviderDomainID:itemIdentifier:parentItemIdentifier:filename:contentType:", v16, v15, v14, v13, v17);

  return v18;
}

- (FPItem)initWithProviderDomainID:(id)a3 itemIdentifier:(id)a4 parentItemIdentifier:(id)a5 filename:(id)a6 isDirectory:(BOOL)a7
{
  _QWORD *v7;

  v7 = (_QWORD *)MEMORY[0x1E0CEC4F0];
  if (!a7)
    v7 = (_QWORD *)MEMORY[0x1E0CEC528];
  return -[FPItem initWithProviderDomainID:itemIdentifier:parentItemIdentifier:filename:contentType:](self, "initWithProviderDomainID:itemIdentifier:parentItemIdentifier:filename:contentType:", a3, a4, a5, a6, *v7);
}

uint64_t __101__FPItem_initWithVendorItem_provider_domain_spotlightDomainIdentifier_extensionCapabilities_useFPFS___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unsigned __int8 isKindOfClass;
  unsigned __int8 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v8 = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = a1[5];
    v10 = a1[6];
    v12 = a1[4];
    v13 = objc_opt_class();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", v10, v11, CFSTR("FPItem.m"), 835, CFSTR("Key %@ in extendedAttributes of item %@ has class %@ instead of %@"), v5, v12, v13, objc_opt_class());

  }
  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = a1[5];
    v15 = a1[6];
    v17 = a1[4];
    v18 = objc_opt_class();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", v15, v16, CFSTR("FPItem.m"), 836, CFSTR("Value %@ in extendedAttributes of item %@ has class %@ instead of %@"), v6, v17, v18, objc_opt_class());

  }
  return isKindOfClass & v8 & 1;
}

- (id)fieldDifferencesWithItem:(id)a3
{
  return -[FPItem fieldDifferencesWithItem:onlyMetadata:](self, "fieldDifferencesWithItem:onlyMetadata:", a3, 0);
}

- (id)fieldDifferencesWithItem:(id)a3 onlyMetadata:(BOOL)a4
{
  void *v4;
  void *v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  int v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  int v69;
  int v70;
  int v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  unint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  int v103;
  int v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  int v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  int v127;
  int v128;
  int v129;
  int v130;
  int v131;
  void *v132;
  void *v133;
  void *v134;
  unint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  int v142;
  unint64_t v143;
  int64_t v144;
  int64_t v145;
  int64_t v146;
  NSObject *v147;
  id v148;

  v8 = a3;
  v9 = (void *)objc_opt_new();
  if (a4)
    goto LABEL_52;
  objc_msgSend(v8, "itemIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[FPItem itemIdentifier](self, "itemIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

LABEL_9:
      objc_msgSend(v9, "addObject:", CFSTR("itemIdentifier"));
      goto LABEL_12;
    }
  }
  -[FPItem itemIdentifier](self, "itemIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v8, "itemIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {

    }
    if (!v12)
      goto LABEL_9;
  }
  else
  {

    if (v10)
    {

    }
  }
LABEL_12:
  objc_msgSend(v8, "formerIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[FPItem formerIdentifier](self, "formerIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "formerIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

LABEL_19:
      objc_msgSend(v9, "addObject:", CFSTR("formerIdentifier"));
      goto LABEL_22;
    }
  }
  -[FPItem formerIdentifier](self, "formerIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v8, "formerIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {

    }
    if (!v15)
      goto LABEL_19;
  }
  else
  {

    if (v13)
    {

    }
  }
LABEL_22:
  objc_msgSend(v8, "parentItemIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[FPItem parentItemIdentifier](self, "parentItemIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "parentItemIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

LABEL_29:
      objc_msgSend(v9, "addObject:", CFSTR("parentItemIdentifier"));
      goto LABEL_32;
    }
  }
  -[FPItem parentItemIdentifier](self, "parentItemIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v8, "parentItemIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {

    }
    if (!v18)
      goto LABEL_29;
  }
  else
  {

    if (v16)
    {

    }
  }
LABEL_32:
  objc_msgSend(v8, "providerID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[FPItem providerID](self, "providerID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "providerID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

LABEL_39:
      objc_msgSend(v9, "addObject:", CFSTR("providerID"));
      goto LABEL_42;
    }
  }
  -[FPItem providerID](self, "providerID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {

    if (v19)
    {

    }
    goto LABEL_42;
  }
  objc_msgSend(v8, "providerID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {

  }
  if (!v21)
    goto LABEL_39;
LABEL_42:
  objc_msgSend(v8, "domainIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[FPItem domainIdentifier](self, "domainIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "domainIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

LABEL_49:
      objc_msgSend(v9, "addObject:", CFSTR("domainIdentifier"));
      goto LABEL_52;
    }
  }
  -[FPItem domainIdentifier](self, "domainIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v8, "domainIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {

    }
    if (!v24)
      goto LABEL_49;
  }
  else
  {

    if (v22)
    {

    }
  }
LABEL_52:
  objc_msgSend(v8, "filename");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    -[FPItem filename](self, "filename");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filename");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

LABEL_59:
      objc_msgSend(v9, "addObject:", CFSTR("filename"));
      goto LABEL_62;
    }
  }
  -[FPItem filename](self, "filename");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(v8, "filename");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {

    }
    if (!v27)
      goto LABEL_59;
  }
  else
  {

    if (v25)
    {

    }
  }
LABEL_62:
  objc_msgSend(v8, "displayName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    -[FPItem displayName](self, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

LABEL_69:
      objc_msgSend(v9, "addObject:", CFSTR("displayName"));
      goto LABEL_72;
    }
  }
  -[FPItem displayName](self, "displayName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    objc_msgSend(v8, "displayName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {

    }
    if (!v30)
      goto LABEL_69;
  }
  else
  {

    if (v28)
    {

    }
  }
LABEL_72:
  objc_msgSend(v8, "contentType");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    -[FPItem contentType](self, "contentType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

LABEL_79:
      objc_msgSend(v9, "addObject:", CFSTR("contentType"));
      goto LABEL_82;
    }
  }
  -[FPItem contentType](self, "contentType");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    objc_msgSend(v8, "contentType");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {

    }
    if (!v33)
      goto LABEL_79;
  }
  else
  {

    if (v31)
    {

    }
  }
LABEL_82:
  objc_msgSend(v8, "documentSize");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    -[FPItem documentSize](self, "documentSize");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "documentSize");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

LABEL_89:
      objc_msgSend(v9, "addObject:", CFSTR("documentSize"));
      goto LABEL_92;
    }
  }
  -[FPItem documentSize](self, "documentSize");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    objc_msgSend(v8, "documentSize");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {

    }
    if (!v36)
      goto LABEL_89;
  }
  else
  {

    if (v34)
    {

    }
  }
LABEL_92:
  objc_msgSend(v8, "fileURL");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    -[FPItem fileURL](self, "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

LABEL_99:
      objc_msgSend(v9, "addObject:", CFSTR("fileURL"));
      goto LABEL_102;
    }
  }
  -[FPItem fileURL](self, "fileURL");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    objc_msgSend(v8, "fileURL");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {

    }
    if (!v39)
      goto LABEL_99;
  }
  else
  {

    if (v37)
    {

    }
  }
LABEL_102:
  v40 = -[FPItem capabilities](self, "capabilities");
  if (v40 != objc_msgSend(v8, "capabilities"))
    objc_msgSend(v9, "addObject:", CFSTR("capabilities"));
  v41 = -[FPItem enumerationOrigin](self, "enumerationOrigin");
  if (v41 != objc_msgSend(v8, "enumerationOrigin"))
    objc_msgSend(v9, "addObject:", CFSTR("enumerationOrigin"));
  objc_msgSend(v8, "creationDate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    -[FPItem creationDate](self, "creationDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "creationDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

LABEL_113:
      objc_msgSend(v9, "addObject:", CFSTR("creationDate"));
      goto LABEL_116;
    }
  }
  -[FPItem creationDate](self, "creationDate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    objc_msgSend(v8, "creationDate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {

    }
    if (!v44)
      goto LABEL_113;
  }
  else
  {

    if (v42)
    {

    }
  }
LABEL_116:
  objc_msgSend(v8, "contentModificationDate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    -[FPItem contentModificationDate](self, "contentModificationDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentModificationDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

LABEL_123:
      objc_msgSend(v9, "addObject:", CFSTR("contentModificationDate"));
      goto LABEL_126;
    }
  }
  -[FPItem contentModificationDate](self, "contentModificationDate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    objc_msgSend(v8, "contentModificationDate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {

    }
    if (!v47)
      goto LABEL_123;
  }
  else
  {

    if (v45)
    {

    }
  }
LABEL_126:
  v48 = -[FPItem isTrashed](self, "isTrashed");
  if (v48 != objc_msgSend(v8, "isTrashed"))
    objc_msgSend(v9, "addObject:", CFSTR("isTrashed"));
  objc_msgSend(v8, "lastUsedDate");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    -[FPItem lastUsedDate](self, "lastUsedDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastUsedDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

LABEL_135:
      objc_msgSend(v9, "addObject:", CFSTR("lastUsedDate"));
      goto LABEL_138;
    }
  }
  -[FPItem lastUsedDate](self, "lastUsedDate");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    objc_msgSend(v8, "lastUsedDate");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {

    }
    if (!v51)
      goto LABEL_135;
  }
  else
  {

    if (v49)
    {

    }
  }
LABEL_138:
  objc_msgSend(v8, "tags");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    -[FPItem tags](self, "tags");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tags");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

LABEL_145:
      objc_msgSend(v9, "addObject:", CFSTR("tags"));
      goto LABEL_148;
    }
  }
  -[FPItem tags](self, "tags");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    objc_msgSend(v8, "tags");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {

    }
    if (!v54)
      goto LABEL_145;
  }
  else
  {

    if (v52)
    {

    }
  }
LABEL_148:
  objc_msgSend(v8, "favoriteRank");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    -[FPItem favoriteRank](self, "favoriteRank");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "favoriteRank");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

LABEL_155:
      objc_msgSend(v9, "addObject:", CFSTR("favoriteRank"));
      goto LABEL_158;
    }
  }
  -[FPItem favoriteRank](self, "favoriteRank");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    objc_msgSend(v8, "favoriteRank");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55)
    {

    }
    if (!v57)
      goto LABEL_155;
  }
  else
  {

    if (v55)
    {

    }
  }
LABEL_158:
  if (a4)
    goto LABEL_225;
  v58 = -[FPItem isUploaded](self, "isUploaded");
  if (v58 != objc_msgSend(v8, "isUploaded"))
    objc_msgSend(v9, "addObject:", CFSTR("isUploaded"));
  v59 = -[FPItem isUploading](self, "isUploading");
  if (v59 != objc_msgSend(v8, "isUploading"))
    objc_msgSend(v9, "addObject:", CFSTR("isUploading"));
  objc_msgSend(v8, "uploadingError");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    -[FPItem uploadingError](self, "uploadingError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uploadingError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

LABEL_170:
      objc_msgSend(v9, "addObject:", CFSTR("uploadingError"));
      goto LABEL_173;
    }
  }
  -[FPItem uploadingError](self, "uploadingError");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    objc_msgSend(v8, "uploadingError");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {

    }
    if (!v62)
      goto LABEL_170;
  }
  else
  {

    if (v60)
    {

    }
  }
LABEL_173:
  v63 = -[FPItem isDownloaded](self, "isDownloaded");
  if (v63 != objc_msgSend(v8, "isDownloaded"))
    objc_msgSend(v9, "addObject:", CFSTR("isDownloaded"));
  v64 = -[FPItem isDownloading](self, "isDownloading");
  if (v64 != objc_msgSend(v8, "isDownloading"))
    objc_msgSend(v9, "addObject:", CFSTR("isDownloading"));
  objc_msgSend(v8, "downloadingError");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65)
  {
    -[FPItem downloadingError](self, "downloadingError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "downloadingError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

LABEL_184:
      objc_msgSend(v9, "addObject:", CFSTR("downloadingError"));
      goto LABEL_187;
    }
  }
  -[FPItem downloadingError](self, "downloadingError");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (v66)
  {
    objc_msgSend(v8, "downloadingError");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (v65)
    {

    }
    if (!v67)
      goto LABEL_184;
  }
  else
  {

    if (v65)
    {

    }
  }
LABEL_187:
  v68 = -[FPItem isMostRecentVersionDownloaded](self, "isMostRecentVersionDownloaded");
  if (v68 != objc_msgSend(v8, "isMostRecentVersionDownloaded"))
    objc_msgSend(v9, "addObject:", CFSTR("isMostRecentVersionDownloaded"));
  v69 = -[FPItem isShared](self, "isShared");
  if (v69 != objc_msgSend(v8, "isShared"))
    objc_msgSend(v9, "addObject:", CFSTR("isShared"));
  v70 = -[FPItem isSharedByCurrentUser](self, "isSharedByCurrentUser");
  if (v70 != objc_msgSend(v8, "isSharedByCurrentUser"))
    objc_msgSend(v9, "addObject:", CFSTR("isSharedByCurrentUser"));
  v71 = -[FPItem fp_isLastModifiedByCurrentUser](self, "fp_isLastModifiedByCurrentUser");
  if (v71 != objc_msgSend(v8, "fp_isLastModifiedByCurrentUser"))
    objc_msgSend(v9, "addObject:", CFSTR("fp_isLastModifiedByCurrentUser"));
  objc_msgSend(v8, "ownerNameComponents");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (v72)
  {
    -[FPItem ownerNameComponents](self, "ownerNameComponents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ownerNameComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

LABEL_202:
      objc_msgSend(v9, "addObject:", CFSTR("ownerNameComponents"));
      goto LABEL_205;
    }
  }
  -[FPItem ownerNameComponents](self, "ownerNameComponents");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    objc_msgSend(v8, "ownerNameComponents");
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (v72)
    {

    }
    if (!v74)
      goto LABEL_202;
  }
  else
  {

    if (v72)
    {

    }
  }
LABEL_205:
  objc_msgSend(v8, "mostRecentEditorNameComponents");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (v75)
  {
    -[FPItem mostRecentEditorNameComponents](self, "mostRecentEditorNameComponents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mostRecentEditorNameComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

LABEL_212:
      objc_msgSend(v9, "addObject:", CFSTR("mostRecentEditorNameComponents"));
      goto LABEL_215;
    }
  }
  -[FPItem mostRecentEditorNameComponents](self, "mostRecentEditorNameComponents");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v76)
  {

    if (v75)
    {

    }
    goto LABEL_215;
  }
  objc_msgSend(v8, "mostRecentEditorNameComponents");
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  if (v75)
  {

  }
  if (!v77)
    goto LABEL_212;
LABEL_215:
  objc_msgSend(v8, "collaborationIdentifier");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    -[FPItem collaborationIdentifier](self, "collaborationIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collaborationIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

LABEL_222:
      objc_msgSend(v9, "addObject:", CFSTR("collaborationIdentifier"));
      goto LABEL_225;
    }
  }
  -[FPItem collaborationIdentifier](self, "collaborationIdentifier");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (v79)
  {
    objc_msgSend(v8, "collaborationIdentifier");
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (v78)
    {

    }
    if (!v80)
      goto LABEL_222;
  }
  else
  {

    if (v78)
    {

    }
  }
LABEL_225:
  objc_msgSend(v8, "childItemCount");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (v81)
  {
    -[FPItem childItemCount](self, "childItemCount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "childItemCount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

LABEL_232:
      objc_msgSend(v9, "addObject:", CFSTR("childItemCount"));
      goto LABEL_235;
    }
  }
  -[FPItem childItemCount](self, "childItemCount");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (v82)
  {
    objc_msgSend(v8, "childItemCount");
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    if (v81)
    {

    }
    if (!v83)
      goto LABEL_232;
  }
  else
  {

    if (v81)
    {

    }
  }
LABEL_235:
  objc_msgSend(v8, "userInfo");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  if (v84)
  {
    -[FPItem userInfo](self, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {

LABEL_242:
      objc_msgSend(v9, "addObject:", CFSTR("userInfo"));
      goto LABEL_245;
    }
  }
  -[FPItem userInfo](self, "userInfo");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  if (v85)
  {
    objc_msgSend(v8, "userInfo");
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    if (v84)
    {

    }
    if (!v86)
      goto LABEL_242;
  }
  else
  {

    if (v84)
    {

    }
  }
LABEL_245:
  if (a4)
    goto LABEL_394;
  v87 = -[FPItem state](self, "state");
  if (v87 != objc_msgSend(v8, "state"))
    objc_msgSend(v9, "addObject:", CFSTR("state"));
  objc_msgSend(v8, "placeholderIdentifier");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    -[FPItem placeholderIdentifier](self, "placeholderIdentifier");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "placeholderIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v84, "isEqual:", v4) & 1) == 0)
    {

LABEL_255:
      objc_msgSend(v9, "addObject:", CFSTR("placeholderIdentifier"));
      goto LABEL_258;
    }
  }
  -[FPItem placeholderIdentifier](self, "placeholderIdentifier");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (v89)
  {
    objc_msgSend(v8, "placeholderIdentifier");
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    if (v88)
    {

    }
    if (!v90)
      goto LABEL_255;
  }
  else
  {

    if (v88)
    {

    }
  }
LABEL_258:
  objc_msgSend(v8, "versionIdentifier");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (v91)
  {
    -[FPItem versionIdentifier](self, "versionIdentifier");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "versionIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v84, "isEqual:", v4) & 1) == 0)
    {

LABEL_265:
      objc_msgSend(v9, "addObject:", CFSTR("versionIdentifier"));
      goto LABEL_268;
    }
  }
  -[FPItem versionIdentifier](self, "versionIdentifier");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  if (v92)
  {
    objc_msgSend(v8, "versionIdentifier");
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    if (v91)
    {

    }
    if (!v93)
      goto LABEL_265;
  }
  else
  {

    if (v91)
    {

    }
  }
LABEL_268:
  objc_msgSend(v8, "itemVersion");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  if (v94)
  {
    -[FPItem itemVersion](self, "itemVersion");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v84, "isEqual:", v4) & 1) == 0)
    {

LABEL_275:
      objc_msgSend(v9, "addObject:", CFSTR("itemVersion"));
      goto LABEL_278;
    }
  }
  -[FPItem itemVersion](self, "itemVersion");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (v95)
  {
    objc_msgSend(v8, "itemVersion");
    v96 = (void *)objc_claimAutoreleasedReturnValue();

    if (v94)
    {

    }
    if (!v96)
      goto LABEL_275;
  }
  else
  {

    if (v94)
    {

    }
  }
LABEL_278:
  objc_msgSend(v8, "spotlightDomainIdentifier");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  if (v97)
  {
    -[FPItem spotlightDomainIdentifier](self, "spotlightDomainIdentifier");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "spotlightDomainIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v84, "isEqual:", v4) & 1) == 0)
    {

LABEL_285:
      objc_msgSend(v9, "addObject:", CFSTR("spotlightDomainIdentifier"));
      goto LABEL_288;
    }
  }
  -[FPItem spotlightDomainIdentifier](self, "spotlightDomainIdentifier");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  if (v98)
  {
    objc_msgSend(v8, "spotlightDomainIdentifier");
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    if (v97)
    {

    }
    if (!v99)
      goto LABEL_285;
  }
  else
  {

    if (v97)
    {

    }
  }
LABEL_288:
  objc_msgSend(v8, "fp_spotlightSubDomainIdentifier");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  if (v100)
  {
    -[FPItem fp_spotlightSubDomainIdentifier](self, "fp_spotlightSubDomainIdentifier");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fp_spotlightSubDomainIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v84, "isEqual:", v4) & 1) == 0)
    {

LABEL_295:
      objc_msgSend(v9, "addObject:", CFSTR("fp_spotlightSubDomainIdentifier"));
      goto LABEL_298;
    }
  }
  -[FPItem fp_spotlightSubDomainIdentifier](self, "fp_spotlightSubDomainIdentifier");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  if (v101)
  {
    objc_msgSend(v8, "fp_spotlightSubDomainIdentifier");
    v102 = (void *)objc_claimAutoreleasedReturnValue();

    if (v100)
    {

    }
    if (!v102)
      goto LABEL_295;
  }
  else
  {

    if (v100)
    {

    }
  }
LABEL_298:
  v103 = -[FPItem isInPinnedFolder](self, "isInPinnedFolder");
  if (v103 != objc_msgSend(v8, "isInPinnedFolder"))
    objc_msgSend(v9, "addObject:", CFSTR("isInPinnedFolder"));
  v104 = -[FPItem isPinned](self, "isPinned");
  if (v104 != objc_msgSend(v8, "isPinned"))
    objc_msgSend(v9, "addObject:", CFSTR("isPinned"));
  objc_msgSend(v8, "hasUnresolvedConflicts");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  if (v105)
  {
    -[FPItem hasUnresolvedConflicts](self, "hasUnresolvedConflicts");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hasUnresolvedConflicts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v84, "isEqual:", v4) & 1) == 0)
    {

LABEL_309:
      objc_msgSend(v9, "addObject:", CFSTR("hasUnresolvedConflicts"));
      goto LABEL_312;
    }
  }
  -[FPItem hasUnresolvedConflicts](self, "hasUnresolvedConflicts");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  if (v106)
  {
    objc_msgSend(v8, "hasUnresolvedConflicts");
    v107 = (void *)objc_claimAutoreleasedReturnValue();

    if (v105)
    {

    }
    if (!v107)
      goto LABEL_309;
  }
  else
  {

    if (v105)
    {

    }
  }
LABEL_312:
  objc_msgSend(v8, "isDownloadRequested");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  if (v108)
  {
    -[FPItem isDownloadRequested](self, "isDownloadRequested");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "isDownloadRequested");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v84, "isEqual:", v4) & 1) == 0)
    {

LABEL_319:
      objc_msgSend(v9, "addObject:", CFSTR("isDownloadRequested"));
      goto LABEL_322;
    }
  }
  -[FPItem isDownloadRequested](self, "isDownloadRequested");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  if (v109)
  {
    objc_msgSend(v8, "isDownloadRequested");
    v110 = (void *)objc_claimAutoreleasedReturnValue();

    if (v108)
    {

    }
    if (!v110)
      goto LABEL_319;
  }
  else
  {

    if (v108)
    {

    }
  }
LABEL_322:
  objc_msgSend(v8, "sharingPermissions");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  if (v111)
  {
    -[FPItem sharingPermissions](self, "sharingPermissions");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sharingPermissions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v84, "isEqual:", v4) & 1) == 0)
    {

LABEL_329:
      objc_msgSend(v9, "addObject:", CFSTR("sharingPermissions"));
      goto LABEL_332;
    }
  }
  -[FPItem sharingPermissions](self, "sharingPermissions");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  if (v112)
  {
    objc_msgSend(v8, "sharingPermissions");
    v113 = (void *)objc_claimAutoreleasedReturnValue();

    if (v111)
    {

    }
    if (!v113)
      goto LABEL_329;
  }
  else
  {

    if (v111)
    {

    }
  }
LABEL_332:
  objc_msgSend(v8, "containerDisplayName");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  if (v114)
  {
    -[FPItem containerDisplayName](self, "containerDisplayName");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "containerDisplayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v84, "isEqual:", v4) & 1) == 0)
    {

LABEL_339:
      objc_msgSend(v9, "addObject:", CFSTR("containerDisplayName"));
      goto LABEL_342;
    }
  }
  -[FPItem containerDisplayName](self, "containerDisplayName");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  if (v115)
  {
    objc_msgSend(v8, "containerDisplayName");
    v116 = (void *)objc_claimAutoreleasedReturnValue();

    if (v114)
    {

    }
    if (!v116)
      goto LABEL_339;
  }
  else
  {

    if (v114)
    {

    }
  }
LABEL_342:
  v117 = -[FPItem supportsMostRecentVersionDownloaded](self, "supportsMostRecentVersionDownloaded");
  if (v117 != objc_msgSend(v8, "supportsMostRecentVersionDownloaded"))
    objc_msgSend(v9, "addObject:", CFSTR("supportsMostRecentVersionDownloaded"));
  objc_msgSend(v8, "fp_appContainerBundleIdentifier");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  if (v118)
  {
    -[FPItem fp_appContainerBundleIdentifier](self, "fp_appContainerBundleIdentifier");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fp_appContainerBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v84, "isEqual:", v4) & 1) == 0)
    {

LABEL_351:
      objc_msgSend(v9, "addObject:", CFSTR("fp_appContainerBundleIdentifier"));
      goto LABEL_354;
    }
  }
  -[FPItem fp_appContainerBundleIdentifier](self, "fp_appContainerBundleIdentifier");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  if (v119)
  {
    objc_msgSend(v8, "fp_appContainerBundleIdentifier");
    v120 = (void *)objc_claimAutoreleasedReturnValue();

    if (v118)
    {

    }
    if (!v120)
      goto LABEL_351;
  }
  else
  {

    if (v118)
    {

    }
  }
LABEL_354:
  objc_msgSend(v8, "fp_parentDomainIdentifier");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  if (v121)
  {
    -[FPItem fp_parentDomainIdentifier](self, "fp_parentDomainIdentifier");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fp_parentDomainIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v84, "isEqual:", v4) & 1) == 0)
    {

LABEL_361:
      objc_msgSend(v9, "addObject:", CFSTR("fp_parentDomainIdentifier"));
      goto LABEL_364;
    }
  }
  -[FPItem fp_parentDomainIdentifier](self, "fp_parentDomainIdentifier");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  if (v122)
  {
    objc_msgSend(v8, "fp_parentDomainIdentifier");
    v123 = (void *)objc_claimAutoreleasedReturnValue();

    if (v121)
    {

    }
    if (!v123)
      goto LABEL_361;
  }
  else
  {

    if (v121)
    {

    }
  }
LABEL_364:
  objc_msgSend(v8, "cloudContainerIdentifier");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  if (v124)
  {
    -[FPItem cloudContainerIdentifier](self, "cloudContainerIdentifier");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cloudContainerIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v84, "isEqual:", v4) & 1) == 0)
    {

LABEL_371:
      objc_msgSend(v9, "addObject:", CFSTR("cloudContainerIdentifier"));
      goto LABEL_374;
    }
  }
  -[FPItem cloudContainerIdentifier](self, "cloudContainerIdentifier");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  if (v125)
  {
    objc_msgSend(v8, "cloudContainerIdentifier");
    v126 = (void *)objc_claimAutoreleasedReturnValue();

    if (v124)
    {

    }
    if (!v126)
      goto LABEL_371;
  }
  else
  {

    if (v124)
    {

    }
  }
LABEL_374:
  v127 = -[FPItem isUbiquitous](self, "isUbiquitous");
  if (v127 != objc_msgSend(v8, "isUbiquitous"))
    objc_msgSend(v9, "addObject:", CFSTR("isUbiquitous"));
  v128 = -[FPItem isContainer](self, "isContainer");
  if (v128 != objc_msgSend(v8, "isContainer"))
    objc_msgSend(v9, "addObject:", CFSTR("isContainer"));
  v129 = -[FPItem isContainerPristine](self, "isContainerPristine");
  if (v129 != objc_msgSend(v8, "isContainerPristine"))
    objc_msgSend(v9, "addObject:", CFSTR("isContainerPristine"));
  v130 = -[FPItem isTopLevelSharedItem](self, "isTopLevelSharedItem");
  if (v130 != objc_msgSend(v8, "isTopLevelSharedItem"))
    objc_msgSend(v9, "addObject:", CFSTR("isTopLevelSharedItem"));
  v131 = -[FPItem isRecursivelyDownloaded](self, "isRecursivelyDownloaded");
  if (v131 != objc_msgSend(v8, "isRecursivelyDownloaded"))
    objc_msgSend(v9, "addObject:", CFSTR("isRecursivelyDownloaded"));
  objc_msgSend(v8, "conflictingVersions");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  if (v132)
  {
    -[FPItem conflictingVersions](self, "conflictingVersions");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "conflictingVersions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v84, "isEqual:", v4) & 1) == 0)
    {

LABEL_391:
      objc_msgSend(v9, "addObject:", CFSTR("conflictingVersions"));
      goto LABEL_394;
    }
  }
  -[FPItem conflictingVersions](self, "conflictingVersions");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  if (v133)
  {
    objc_msgSend(v8, "conflictingVersions");
    v134 = (void *)objc_claimAutoreleasedReturnValue();

    if (v132)
    {

    }
    if (!v134)
      goto LABEL_391;
  }
  else
  {

    if (v132)
    {

    }
  }
LABEL_394:
  v135 = -[FPItem fileSystemFlags](self, "fileSystemFlags");
  if (v135 != objc_msgSend(v8, "fileSystemFlags"))
    objc_msgSend(v9, "addObject:", CFSTR("fileSystemFlags"));
  objc_msgSend(v8, "extendedAttributes");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  if (v136)
  {
    -[FPItem extendedAttributes](self, "extendedAttributes");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extendedAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v84, "isEqual:", v4) & 1) == 0)
    {

LABEL_403:
      objc_msgSend(v9, "addObject:", CFSTR("extendedAttributes"));
      goto LABEL_406;
    }
  }
  -[FPItem extendedAttributes](self, "extendedAttributes");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  if (v137)
  {
    objc_msgSend(v8, "extendedAttributes");
    v138 = (void *)objc_claimAutoreleasedReturnValue();

    if (v136)
    {

    }
    if (!v138)
      goto LABEL_403;
  }
  else
  {

    if (v136)
    {

    }
  }
LABEL_406:
  objc_msgSend(v8, "decorations");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  if (v139)
  {
    -[FPItem decorations](self, "decorations");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "decorations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v84, "isEqual:", v4) & 1) == 0)
    {

LABEL_413:
      objc_msgSend(v9, "addObject:", CFSTR("decorations"));
      goto LABEL_416;
    }
  }
  -[FPItem decorations](self, "decorations");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  if (v140)
  {
    objc_msgSend(v8, "decorations");
    v141 = (void *)objc_claimAutoreleasedReturnValue();

    if (v139)
    {

    }
    if (!v141)
      goto LABEL_413;
  }
  else
  {

    if (v139)
    {

    }
  }
LABEL_416:
  v142 = (int)-[FPItem typeAndCreator](self, "typeAndCreator");
  if (v142 != objc_msgSend(v8, "typeAndCreator")
    || (v143 = (unint64_t)-[FPItem typeAndCreator](self, "typeAndCreator") >> 32,
        (_DWORD)v143 != (unint64_t)objc_msgSend(v8, "typeAndCreator") >> 32))
  {
    objc_msgSend(v9, "addObject:", CFSTR("typeAndCreator"));
  }
  v144 = -[FPItem contentPolicy](self, "contentPolicy");
  if (v144 != objc_msgSend(v8, "contentPolicy"))
    objc_msgSend(v9, "addObject:", CFSTR("contentPolicy"));
  v145 = -[FPItem inheritedContentPolicy](self, "inheritedContentPolicy");
  if (v145 != objc_msgSend(v8, "inheritedContentPolicy"))
    objc_msgSend(v9, "addObject:", CFSTR("inheritedContentPolicy"));
  v146 = -[FPItem effectiveContentPolicy](self, "effectiveContentPolicy");
  if (v146 != objc_msgSend(v8, "effectiveContentPolicy"))
    objc_msgSend(v9, "addObject:", CFSTR("effectiveContentPolicy"));
  fp_current_or_default_log();
  v147 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG))
    -[FPItem fieldDifferencesWithItem:onlyMetadata:].cold.1((uint64_t)v9, v8);

  v148 = v9;
  return v148;
}

- (id)copyAsPending
{
  id result;

  result = (id)-[FPItem copy](self, "copy");
  *((_QWORD *)result + 56) = 6;
  return result;
}

- (id)strippedCopy
{
  FPItem *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  FPItem *v9;
  void *v10;

  v3 = [FPItem alloc];
  -[FPItem providerDomainID](self, "providerDomainID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPItem itemIdentifier](self, "itemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPItem parentItemIdentifier](self, "parentItemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPItem filename](self, "filename");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPItem typeIdentifier](self, "typeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FPItem initWithProviderDomainID:itemIdentifier:parentItemIdentifier:filename:typeIdentifier:](v3, "initWithProviderDomainID:itemIdentifier:parentItemIdentifier:filename:typeIdentifier:", v4, v5, v6, v7, v8);

  -[FPItem itemVersion](self, "itemVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPItem setItemVersion:](v9, "setItemVersion:", v10);

  return v9;
}

- (NSSet)fp_cloudContainerClientBundleIdentifiers
{
  return 0;
}

- (NSDictionary)resolvedUserInfo
{
  NSDictionary *resolvedUserInfoCache;
  FPUserInfo *v4;
  FPUserInfo *v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *v8;

  resolvedUserInfoCache = self->_resolvedUserInfoCache;
  if (!resolvedUserInfoCache)
  {
    if (-[NSDictionary count](self->_userInfo, "count") || -[NSDictionary count](self->_inheritedUserInfo, "count"))
    {
      v4 = -[FPUserInfo initWithUserInfo:]([FPUserInfo alloc], "initWithUserInfo:", self->_userInfo);
      v5 = -[FPUserInfo initWithUserInfo:]([FPUserInfo alloc], "initWithUserInfo:", self->_inheritedUserInfo);
      +[FPUserInfo mergeWithUserInfo:intoParentUserInfo:](FPUserInfo, "mergeWithUserInfo:intoParentUserInfo:", v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userInfo");
      v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v8 = self->_resolvedUserInfoCache;
      self->_resolvedUserInfoCache = v7;

    }
    resolvedUserInfoCache = self->_resolvedUserInfoCache;
  }
  return resolvedUserInfoCache;
}

- (BOOL)isPending
{
  return (LOBYTE(self->_state) >> 2) & 1;
}

- (BOOL)isPlaceholder
{
  return self->_state & 1;
}

- (void)setProviderID:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  uint64_t v14;

  v12 = a3;
  if (v12)
  {
    objc_storeStrong((id *)&self->_providerID, a3);
  }
  else
  {
    fp_simulate_crash(CFSTR("can't set a nil provider identifier"), v5, v6, v7, v8, v9, v10, v11, v14);
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[FPItem setProviderID:].cold.1();

  }
}

- (void)setParentItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_parentItemIdentifier, a3);
}

- (FPItemID)parentItemID
{
  FPItemID *v3;
  NSString *fp_parentDomainIdentifier;

  v3 = [FPItemID alloc];
  fp_parentDomainIdentifier = self->_fp_parentDomainIdentifier;
  if (!fp_parentDomainIdentifier)
    fp_parentDomainIdentifier = self->_domainIdentifier;
  return -[FPItemID initWithProviderID:domainIdentifier:itemIdentifier:](v3, "initWithProviderID:domainIdentifier:itemIdentifier:", self->_providerID, fp_parentDomainIdentifier, self->_parentItemIdentifier);
}

- (FPItemID)parentFormerItemID
{
  FPItemID *v2;

  if (self->_parentFormerIdentifier)
    v2 = -[FPItemID initWithProviderID:domainIdentifier:itemIdentifier:]([FPItemID alloc], "initWithProviderID:domainIdentifier:itemIdentifier:", self->_providerID, self->_domainIdentifier, self->_parentFormerIdentifier);
  else
    v2 = 0;
  return v2;
}

- (void)setProviderDomainID:(id)a3
{
  id v4;
  NSString *v5;
  NSString *providerID;
  NSString *v7;
  NSString *domainIdentifier;

  v4 = a3;
  objc_msgSend(v4, "fp_toProviderID");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  providerID = self->_providerID;
  self->_providerID = v5;

  objc_msgSend(v4, "fp_toDomainIdentifier");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  domainIdentifier = self->_domainIdentifier;
  self->_domainIdentifier = v7;

}

- (id)humanReadableCapabilities
{
  unint64_t capabilities;
  void *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  capabilities = self->_capabilities;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = -[FPItem isReadable](self, "isReadable");
  v6 = -[FPItem isWritable](self, "isWritable");
  v7 = 83;
  v8 = 45;
  if ((capabilities & 0x2000000) == 0)
    v7 = 45;
  v9 = 120;
  if ((capabilities & 0x80) == 0)
    v9 = 45;
  v27 = v9;
  v28 = v7;
  v10 = 85;
  if ((capabilities & 0x8000000) == 0)
    v10 = 45;
  v11 = 80;
  if ((capabilities & 0x10000000) == 0)
    v11 = 45;
  v25 = v11;
  v26 = v10;
  v12 = 84;
  if ((capabilities & 0x10) == 0)
    v12 = 45;
  v13 = 116;
  if ((capabilities & 0x20000000) == 0)
    v13 = 45;
  v23 = v13;
  v24 = v12;
  v14 = 101;
  if ((capabilities & 0x40) == 0)
    v14 = 45;
  v15 = 102;
  if ((capabilities & 8) == 0)
    v15 = 45;
  v21 = v15;
  v22 = v14;
  v16 = 112;
  if ((capabilities & 4) == 0)
    v16 = 45;
  v17 = 100;
  if ((capabilities & 0x20) == 0)
    v17 = 45;
  v20 = v16;
  v18 = 119;
  if (!v6)
    v18 = 45;
  if (v5)
    v8 = 114;
  return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("%c%c%c%c%c%c%c%c%c%c%c%c"), v8, v18, v17, v20, v21, v22, v23, v24, v25, v26, v27, v28);
}

uint64_t __30__FPItem_descriptionForFPCTL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "description");
}

uint64_t __30__FPItem_descriptionForFPCTL___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@: %@, "), a2, a3);
}

uint64_t __30__FPItem_descriptionForFPCTL___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@: %@, "), a2, a3);
}

- (void)setTagData:(id)a3
{
  id v4;
  NSArray *tags;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (!v4)
  {
    tags = self->_tags;
    self->_tags = 0;

    v4 = 0;
  }
  FPGetTagsFromTagsData(v4);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v7 = self->_tags;
  self->_tags = v6;

}

- (int64_t)localizedStandardTagsCompare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;

  v4 = a3;
  -[FPItem tags](self, "tags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "count");
  if (v7 >= objc_msgSend(v6, "count"))
    v8 = v6;
  else
    v8 = v5;
  v9 = objc_msgSend(v8, "count");
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    while (1)
    {
      v12 = (void *)MEMORY[0x1A1B00664]();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "localizedStandardCompare:", v14);

      objc_autoreleasePoolPop(v12);
      if (v15)
        break;
      if (v10 == ++v11)
        goto LABEL_8;
    }
  }
  else
  {
LABEL_8:
    if (objc_msgSend(v5, "count") && objc_msgSend(v6, "count"))
    {
      v16 = objc_msgSend(v5, "count");
      if (v16 >= objc_msgSend(v6, "count"))
      {
        v17 = objc_msgSend(v5, "count");
        v15 = v17 != objc_msgSend(v6, "count");
      }
      else
      {
        v15 = -1;
      }
    }
    else if (objc_msgSend(v5, "count") || objc_msgSend(v6, "count"))
    {
      if (objc_msgSend(v5, "count"))
        v15 = -1;
      else
        v15 = 1;
    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (NSData)versionIdentifier
{
  NSData *versionIdentifier;

  versionIdentifier = self->_versionIdentifier;
  if (versionIdentifier)
    return versionIdentifier;
  -[NSFileProviderItemVersion contentVersion](self->_itemVersion, "contentVersion");
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_sharedByDecorationType
{
  void *v4;
  void *v5;

  if (-[FPItem isFolder](self, "isFolder"))
    goto LABEL_2;
  if (-[FPItem fp_isLastModifiedByCurrentUser](self, "fp_isLastModifiedByCurrentUser"))
    return CFSTR("com.apple.FileProvider.ModifiedByMe");
  -[FPItem mostRecentEditorNameComponents](self, "mostRecentEditorNameComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    return CFSTR("com.apple.FileProvider.ModifiedByOther");
LABEL_2:
  if (-[FPItem isSharedByCurrentUser](self, "isSharedByCurrentUser"))
    return CFSTR("com.apple.FileProvider.SharedByMe");
  -[FPItem ownerNameComponents](self, "ownerNameComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return CFSTR("com.apple.FileProvider.SharedByOther");
  else
    return CFSTR("com.apple.FileProvider.GenericShared");
}

id __25__FPItem_itemDecorations__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  int v5;

  +[FPItemDecoration decorationWithIdentifier:bundleIdentifier:](FPItemDecoration, "decorationWithIdentifier:bundleIdentifier:", a2, *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Sharing"));

  if (v5)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return v3;
}

+ (id)allUbiquitousResourceKeys
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[16];

  v13[15] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = *MEMORY[0x1E0C99B38];
  v13[0] = *MEMORY[0x1E0C99A38];
  v13[1] = v3;
  v4 = *MEMORY[0x1E0C99B20];
  v13[2] = *MEMORY[0x1E0C99B40];
  v13[3] = v4;
  v5 = *MEMORY[0x1E0C99B48];
  v13[4] = *MEMORY[0x1E0C99B00];
  v13[5] = v5;
  v6 = *MEMORY[0x1E0C99B68];
  v13[6] = *MEMORY[0x1E0C99AE8];
  v13[7] = v6;
  v7 = *MEMORY[0x1E0C99B10];
  v13[8] = *MEMORY[0x1E0C99B60];
  v13[9] = v7;
  v8 = *MEMORY[0x1E0C99AE0];
  v13[10] = *MEMORY[0x1E0C99AD8];
  v13[11] = v8;
  v9 = *MEMORY[0x1E0C99B58];
  v13[12] = *MEMORY[0x1E0C99B30];
  v13[13] = v9;
  v13[14] = *MEMORY[0x1E0C99B50];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)ubiquitousResourceKeysDiffAgainstItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  char v57;
  int v58;
  int v59;
  int v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  char v66;
  void *v67;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FPItem isCloudItem](self, "isCloudItem");
  if (v6 != objc_msgSend(v4, "isCloudItem"))
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C99A38]);
  v7 = -[FPItem isUploaded](self, "isUploaded");
  if (v7 != objc_msgSend(v4, "isUploaded"))
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C99B38]);
  v8 = -[FPItem isUploading](self, "isUploading");
  if (v8 != objc_msgSend(v4, "isUploading"))
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C99B40]);
  v9 = -[FPItem isDownloading](self, "isDownloading");
  if (v9 != objc_msgSend(v4, "isDownloading"))
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C99B20]);
  -[FPItem _downloadingStatus](self, "_downloadingStatus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_downloadingStatus");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v13 = v11;
  if (v12 == v13)
  {

    goto LABEL_16;
  }
  v14 = v13;
  if (!v13)
  {

    goto LABEL_15;
  }
  v15 = objc_msgSend(v12, "isEqual:", v13);

  if ((v15 & 1) == 0)
LABEL_15:
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C99B00]);
LABEL_16:
  -[FPItem uploadingError](self, "uploadingError");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uploadingError");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16;
  v19 = v17;
  if (v18 == v19)
  {

    goto LABEL_23;
  }
  v20 = v19;
  if (!v19)
  {

    goto LABEL_22;
  }
  v21 = objc_msgSend(v18, "isEqual:", v19);

  if ((v21 & 1) == 0)
LABEL_22:
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C99B48]);
LABEL_23:
  -[FPItem downloadingError](self, "downloadingError");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "downloadingError");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22;
  v25 = v23;
  if (v24 == v25)
  {

    goto LABEL_30;
  }
  v26 = v25;
  if (!v25)
  {

    goto LABEL_29;
  }
  v27 = objc_msgSend(v24, "isEqual:", v25);

  if ((v27 & 1) == 0)
LABEL_29:
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C99AE8]);
LABEL_30:
  -[FPItem ownerNameComponents](self, "ownerNameComponents");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ownerNameComponents");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v28;
  v31 = v29;
  if (v30 == v31)
  {

    goto LABEL_37;
  }
  v32 = v31;
  if (!v31)
  {

    goto LABEL_36;
  }
  v33 = objc_msgSend(v30, "isEqual:", v31);

  if ((v33 & 1) == 0)
LABEL_36:
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C99B68]);
LABEL_37:
  -[FPItem mostRecentEditorNameComponents](self, "mostRecentEditorNameComponents");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mostRecentEditorNameComponents");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v34;
  v37 = v35;
  if (v36 == v37)
  {

    goto LABEL_44;
  }
  v38 = v37;
  if (!v37)
  {

    goto LABEL_43;
  }
  v39 = objc_msgSend(v36, "isEqual:", v37);

  if ((v39 & 1) == 0)
LABEL_43:
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C99B60]);
LABEL_44:
  -[FPItem hasUnresolvedConflicts](self, "hasUnresolvedConflicts");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hasUnresolvedConflicts");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v40;
  v43 = v41;
  if (v42 == v43)
  {

    goto LABEL_51;
  }
  v44 = v43;
  if (!v43)
  {

    goto LABEL_50;
  }
  v45 = objc_msgSend(v42, "isEqual:", v43);

  if ((v45 & 1) == 0)
LABEL_50:
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C99B10]);
LABEL_51:
  -[FPItem containerDisplayName](self, "containerDisplayName");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerDisplayName");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v46;
  v49 = v47;
  if (v48 == v49)
  {

    goto LABEL_58;
  }
  v50 = v49;
  if (!v49)
  {

    goto LABEL_57;
  }
  v51 = objc_msgSend(v48, "isEqual:", v49);

  if ((v51 & 1) == 0)
LABEL_57:
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C99AD8]);
LABEL_58:
  -[FPItem isDownloadRequested](self, "isDownloadRequested");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isDownloadRequested");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v52;
  v55 = v53;
  if (v54 == v55)
  {

    goto LABEL_65;
  }
  v56 = v55;
  if (!v55)
  {

    goto LABEL_64;
  }
  v57 = objc_msgSend(v54, "isEqual:", v55);

  if ((v57 & 1) == 0)
LABEL_64:
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C99AE0]);
LABEL_65:
  v58 = -[FPItem isShared](self, "isShared");
  if (v58 != objc_msgSend(v4, "isShared"))
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C99B30]);
  if (-[FPItem isShared](self, "isShared"))
  {
    if (objc_msgSend(v4, "isShared"))
    {
      v59 = -[FPItem isSharedByCurrentUser](self, "isSharedByCurrentUser");
      if (v59 != objc_msgSend(v4, "isSharedByCurrentUser"))
        objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C99B58]);
    }
  }
  if (-[FPItem isShared](self, "isShared"))
  {
    if (objc_msgSend(v4, "isShared"))
    {
      v60 = -[FPItem isWritable](self, "isWritable");
      if (v60 != objc_msgSend(v4, "isWritable"))
        objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C99B50]);
    }
  }
  -[FPItem sharingPermissions](self, "sharingPermissions");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharingPermissions");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v61;
  v64 = v62;
  if (v63 == v64)
  {

  }
  else
  {
    v65 = v64;
    if (v64)
    {
      v66 = objc_msgSend(v63, "isEqual:", v64);

      if ((v66 & 1) != 0)
        goto LABEL_82;
    }
    else
    {

    }
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C99B78]);
  }
LABEL_82:
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  return v67;
}

- (id)_downloadingStatus
{
  _BOOL4 v3;
  id *v4;
  id v5;

  if (-[FPItem isCloudItem](self, "isCloudItem"))
  {
    if (-[FPItem isDownloaded](self, "isDownloaded"))
    {
      if (-[FPItem supportsMostRecentVersionDownloaded](self, "supportsMostRecentVersionDownloaded"))
      {
        v3 = -[FPItem isMostRecentVersionDownloaded](self, "isMostRecentVersionDownloaded");
        v4 = (id *)MEMORY[0x1E0C99AF0];
        if (!v3)
          v4 = (id *)MEMORY[0x1E0C99AF8];
      }
      else
      {
        v4 = (id *)MEMORY[0x1E0C99AF0];
      }
    }
    else
    {
      v4 = (id *)MEMORY[0x1E0C99B08];
    }
    v5 = *v4;
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)isKnownByTheProvider
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[FPItem itemIdentifier](self, "itemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("__fp/")))
  {
    -[FPItem formerIdentifier](self, "formerIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[FPItem formerIdentifier](self, "formerIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "hasPrefix:", CFSTR("__fp/")) ^ 1;

    }
    else
    {
      LOBYTE(v6) = 0;
    }

  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (void)itemIsSupportedSearchScope:(id)a3
{
  -[FPItem itemIsSupportedSearchScopeWithCachePolicy:completionHandler:](self, "itemIsSupportedSearchScopeWithCachePolicy:completionHandler:", 1, a3);
}

- (void)itemIsSupportedSearchScopeWithCachePolicy:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a4;
  if (!-[FPItem isFolder](self, "isFolder")
    || -[FPItem exclusionType](self, "exclusionType")
    || -[FPItem isIgnoreRoot](self, "isIgnoreRoot"))
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__FPItem_itemIsSupportedSearchScopeWithCachePolicy_completionHandler___block_invoke;
    v7[3] = &unk_1E444AB08;
    v8 = v6;
    +[FPProviderDomain fetchProviderDomainForItem:cachePolicy:completionHandler:](FPProviderDomain, "fetchProviderDomainForItem:cachePolicy:completionHandler:", self, a3, v7);

  }
}

uint64_t __70__FPItem_itemIsSupportedSearchScopeWithCachePolicy_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 0;
  }
  else
  {
    v6 = objc_msgSend(a2, "supportsSearch");
    v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    v5 = v3;
    a3 = 0;
  }
  return v4(v5, v6, a3);
}

- (id)fp_valueForKeyPath:(id)a3
{
  int v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v13;
  id v14;

  v13 = 0;
  v14 = 0;
  v4 = objc_msgSend(a3, "fp_splitKeyPathInProperty:remainder:", &v14, &v13);
  v5 = v14;
  v6 = v13;
  v7 = 0;
  if (v4)
  {
    FPExtensionMatchingDictionaryForItem(self, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if (!v6)
      {
        v11 = v9;
        goto LABEL_8;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v10, "fp_valueForKeyPath:", v6);
        v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
        v7 = v11;
        goto LABEL_9;
      }
    }
    v7 = 0;
LABEL_9:

  }
  return v7;
}

- (id)scopedSearchQueryUnderItem
{
  NSFileProviderSearchQuery *v3;
  void *v4;
  void *v5;
  NSFileProviderSearchQuery *v6;

  if (-[FPItem isFolder](self, "isFolder"))
  {
    v3 = [NSFileProviderSearchQuery alloc];
    -[FPItem itemID](self, "itemID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPItem providerItemID](self, "providerItemID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NSFileProviderSearchQuery initWithSearchScopedToItemID:alternateItemID:](v3, "initWithSearchScopedToItemID:alternateItemID:", v4, v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)coreSpotlightIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  -[FPItem formerIdentifier](self, "formerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[FPItem formerItemID](self, "formerItemID");
  else
    -[FPItem itemID](self, "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coreSpotlightIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isPinnedSubitem
{
  _BOOL4 v3;

  v3 = -[FPItem isInPinnedFolder](self, "isInPinnedFolder");
  if (v3)
    LOBYTE(v3) = !-[FPItem isPinned](self, "isPinned");
  return v3;
}

- (unint64_t)enumerationOrigin
{
  return self->_enumerationOrigin;
}

- (void)setVersionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_versionIdentifier, a3);
}

- (void)setTrashed:(BOOL)a3
{
  self->_trashed = a3;
}

- (void)setOwnerNameComponents:(id)a3
{
  objc_storeStrong((id *)&self->_ownerNameComponents, a3);
}

- (void)setMostRecentEditorNameComponents:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentEditorNameComponents, a3);
}

- (BOOL)supportsMostRecentVersionDownloaded
{
  return self->_supportsMostRecentVersionDownloaded;
}

- (BOOL)isOffline
{
  return self->_offline;
}

- (void)setFp_parentDomainIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_fp_parentDomainIdentifier, a3);
}

- (void)setDetachedRootLogicalURL:(id)a3
{
  objc_storeStrong((id *)&self->_detachedRootLogicalURL, a3);
}

- (void)setInPinnedFolder:(BOOL)a3
{
  self->_inPinnedFolder = a3;
}

- (void)setPinned:(BOOL)a3
{
  self->_pinned = a3;
}

- (BOOL)isContentZoneRoot
{
  return self->_contentZoneRoot;
}

- (void)setContentZoneRoot:(BOOL)a3
{
  self->_contentZoneRoot = a3;
}

- (void)setSymlinkTargetPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (int64_t)inheritedContentPolicy
{
  return self->_inheritedContentPolicy;
}

- (int64_t)effectiveContentPolicy
{
  return self->_effectiveContentPolicy;
}

- (void)setConflictingVersions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (void)setFp_spotlightSubDomainIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSString)spotlightDomainIdentifier
{
  return self->_spotlightDomainIdentifier;
}

- (void)setFolderType:(unint64_t)a3
{
  self->_folderType = a3;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (void)setPending:(BOOL)a3
{
  self->_pending = a3;
}

- (void)setExclusionType:(unint64_t)a3
{
  self->_exclusionType = a3;
}

- (void)setPreformattedOwnerName:(id)a3
{
  objc_storeStrong((id *)&self->_preformattedOwnerName, a3);
}

- (void)setPreformattedMostRecentEditorName:(id)a3
{
  objc_storeStrong((id *)&self->_preformattedMostRecentEditorName, a3);
}

- (NSString)parentFormerIdentifier
{
  return self->_parentFormerIdentifier;
}

- (void)setParentFormerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_parentFormerIdentifier, a3);
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSString)placeholderIdentifier
{
  return self->_placeholderIdentifier;
}

- (void)setPlaceholderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSData)quarantineBlob
{
  return self->_quarantineBlob;
}

- (void)setOriginatorInfo:(id)a3
{
  objc_storeStrong((id *)&self->_originatorInfo, a3);
}

- (NSString)fileSystemFilename
{
  return self->_fileSystemFilename;
}

- (void)setFileSystemFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (BOOL)fp_isDownloadRequested
{
  return -[NSNumber BOOLValue](self->_isDownloadRequested, "BOOLValue");
}

- (id)toSearchableItem
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _QWORD *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  unint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  objc_class *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  NSObject *v109;
  NSObject *v110;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  id v117;
  _QWORD v118[4];
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  uint64_t v128;

  v125 = 0;
  v126 = &v125;
  v127 = 0x2050000000;
  v3 = (void *)getCSSearchableItemAttributeSetClass_softClass;
  v128 = getCSSearchableItemAttributeSetClass_softClass;
  if (!getCSSearchableItemAttributeSetClass_softClass)
  {
    v120 = MEMORY[0x1E0C809B0];
    v121 = 3221225472;
    v122 = (uint64_t)__getCSSearchableItemAttributeSetClass_block_invoke;
    v123 = &unk_1E444B188;
    v124 = &v125;
    __getCSSearchableItemAttributeSetClass_block_invoke((uint64_t)&v120);
    v3 = (void *)v126[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v125, 8);
  v5 = objc_alloc_init(v4);
  -[FPItem coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFileItemID:", v6);

  -[FPItem providerID](self, "providerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFileProviderID:", v7);

  -[FPItem domainIdentifier](self, "domainIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFileProviderDomainIdentifier:", v8);

  -[FPItem filename](self, "filename");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilename:", v9);

  -[FPItem filename](self, "filename");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:", v10, CFSTR("FPFilename"));

  -[FPItem displayName](self, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisplayName:", v11);

  -[FPItem typeIdentifier](self, "typeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentType:", v12);

  -[FPItem formerIdentifier](self, "formerIdentifier");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[FPItem formerIdentifier](self, "formerIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPItem itemID](self, "itemID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "isEqualToString:", v17);

    if ((v18 & 1) == 0)
    {
      v120 = 0;
      -[FPItem itemIdentifier](self, "itemIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "fp_getParsedDiskIdentifier:", &v120);

      if (v20)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v120);
        v21 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setAttribute:forKey:", v21, CFSTR("FPOnDiskIdentifier"));
      }
      else
      {
        fp_current_or_default_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[FPItem(CSSearchableItem) toSearchableItem].cold.3((uint64_t)self, v21);
      }

    }
  }
  -[FPItem contentType](self, "contentType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22
    && (!-[FPItem isCloudItem](self, "isCloudItem") || -[FPItem isDownloaded](self, "isDownloaded"))
    && ((objc_msgSend(v22, "conformsToType:", *MEMORY[0x1E0CEC520]) & 1) != 0
     || objc_msgSend(v22, "conformsToType:", *MEMORY[0x1E0CEC568])))
  {
    objc_msgSend(v5, "setEligibleForPhotosProcessing:", MEMORY[0x1E0C9AAB0]);
  }
  -[FPItem contentType](self, "contentType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_localizedDescriptionDictionary");
  v24 = objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v125 = 0;
    v126 = &v125;
    v127 = 0x2050000000;
    v25 = (void *)getCSLocalizedStringClass_softClass;
    v128 = getCSLocalizedStringClass_softClass;
    if (!getCSLocalizedStringClass_softClass)
    {
      v120 = MEMORY[0x1E0C809B0];
      v121 = 3221225472;
      v122 = (uint64_t)__getCSLocalizedStringClass_block_invoke;
      v123 = &unk_1E444B188;
      v124 = &v125;
      __getCSLocalizedStringClass_block_invoke((uint64_t)&v120);
      v25 = (void *)v126[3];
    }
    v26 = objc_retainAutorelease(v25);
    _Block_object_dispose(&v125, 8);
    v27 = (void *)objc_msgSend([v26 alloc], "initWithLocalizedStrings:", v24);
    objc_msgSend(v5, "setKind:", v27);

  }
  -[FPItem creationDate](self, "creationDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentCreationDate:", v28);

  -[FPItem contentModificationDate](self, "contentModificationDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentModificationDate:", v29);

  -[FPItem tags](self, "tags");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "count"))
  {
    objc_msgSend(v30, "fp_map:", &__block_literal_global_36);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserTags:", v31);

    v32 = objc_msgSend(v30, "count");
    v118[0] = MEMORY[0x1E0C809B0];
    v118[1] = 3221225472;
    v118[2] = __44__FPItem_CSSearchableItem__toSearchableItem__block_invoke_2;
    v118[3] = &unk_1E444DCC8;
    v119 = v30;
    v33 = v118;
    v120 = 0;
    v121 = (uint64_t)&v120;
    v122 = 0x2020000000;
    v34 = getMDPropertyCreateUserTagStringsSymbolLoc_ptr;
    v123 = getMDPropertyCreateUserTagStringsSymbolLoc_ptr;
    if (!getMDPropertyCreateUserTagStringsSymbolLoc_ptr)
    {
      v35 = (void *)MetadataUtilitiesLibrary_0();
      v34 = dlsym(v35, "MDPropertyCreateUserTagStrings");
      *(_QWORD *)(v121 + 24) = v34;
      getMDPropertyCreateUserTagStringsSymbolLoc_ptr = v34;
    }
    _Block_object_dispose(&v120, 8);
    if (!v34)
      -[FPItem(CSSearchableItem) toSearchableItem].cold.2();
    v36 = (void *)((uint64_t (*)(uint64_t, _QWORD *))v34)(v32, v33);

    objc_msgSend(v5, "setAttribute:forKey:", v36, CFSTR("_kMDItemUserTags"));
    v37 = v119;
  }
  else
  {
    objc_msgSend(v5, "setUserTags:", 0);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttribute:forKey:", v37, CFSTR("_kMDItemUserTags"));
  }

  -[FPItem lastUsedDate](self, "lastUsedDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLastUsedDate:", v38);

  -[FPItem favoriteRank](self, "favoriteRank");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFavoriteRank:", v39);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FPItem isUploaded](self, "isUploaded"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUploaded:", v40);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FPItem isUploaded](self, "isUploaded"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUploaded:", v41);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FPItem isUploading](self, "isUploading"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUploading:", v42);

  -[FPItem uploadingError](self, "uploadingError");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPSearchableItemError stringFromError:](FPSearchableItemError, "stringFromError:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:", v44, CFSTR("FPUploadingError"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FPItem isDownloaded](self, "isDownloaded"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:", v45, CFSTR("FPDownloaded"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FPItem isDownloading](self, "isDownloading"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDownloading:", v46);

  -[FPItem downloadingError](self, "downloadingError");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPSearchableItemError stringFromError:](FPSearchableItemError, "stringFromError:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:", v48, CFSTR("FPDownloadingError"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FPItem isRecursivelyDownloaded](self, "isRecursivelyDownloaded"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:", v49, CFSTR("FPItemIsRecursivelyDownloaded"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FPItem capabilities](self, "capabilities"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:", v50, CFSTR("FPCapabilities"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FPItem isPinned](self, "isPinned"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:", v51, CFSTR("FPItemIsPinned"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FPItem isInPinnedFolder](self, "isInPinnedFolder"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:", v52, CFSTR("FPItemIsInPinnedFolder"));

  -[FPItem itemVersion](self, "itemVersion");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v53;
  if (v53 && (objc_msgSend(v53, "isEmpty") & 1) == 0)
  {
    +[FPSearchableItemVersion stringFromVersion:](FPSearchableItemVersion, "stringFromVersion:", v54);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttribute:forKey:", v59, CFSTR("FPItemVersion"));
  }
  else
  {
    -[FPItem versionIdentifier](self, "versionIdentifier");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v55)
      goto LABEL_32;
    v56 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[FPItem versionIdentifier](self, "versionIdentifier");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "base64EncodedDataWithOptions:", 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)objc_msgSend(v56, "initWithData:encoding:", v58, 4);

    objc_msgSend(v5, "setVersionIdentifier:", v59);
  }

LABEL_32:
  -[FPItem providerID](self, "providerID");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBundleID:", v60);

  -[FPItem fp_appContainerBundleIdentifier](self, "fp_appContainerBundleIdentifier");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:", v61, CFSTR("FPAppContainerBundleID"));

  -[FPItem cloudContainerIdentifier](self, "cloudContainerIdentifier");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:", v62, CFSTR("FPCloudContainerID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FPItem isContainer](self, "isContainer"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:", v63, CFSTR("FPIsContainer"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FPItem isContainerPristine](self, "isContainerPristine"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:", v64, CFSTR("FPIsContainerPristine"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FPItem isUbiquitous](self, "isUbiquitous"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:", v65, CFSTR("FPIsUbiquitous"));

  -[FPItem fp_parentDomainIdentifier](self, "fp_parentDomainIdentifier");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    -[FPItem fp_parentDomainIdentifier](self, "fp_parentDomainIdentifier");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttribute:forKey:", v67, CFSTR("FPParentDomainID"));

  }
  -[FPItem userInfo](self, "userInfo");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v115, "count"))
  {
    v116 = 0;
    v117 = 0;
    v68 = FPEncodeUserInfo(v115, &v117, &v116);
    v69 = v117;
    v70 = v116;
    if (v68)
    {
      objc_msgSend(v5, "setAttribute:forKey:", v69, CFSTR("FPUserInfoKeys"));
      objc_msgSend(v5, "setAttribute:forKey:", v70, CFSTR("FPUserInfoValues"));
    }

  }
  v112 = v30;
  -[FPItem documentSize](self, "documentSize");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v71;
  if (v71)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(unint64_t)objc_msgSend(v71, "unsignedIntegerValue") / 1000000.0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFileSize:", v73);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FPItem isShared](self, "isShared"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShared:", v74);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FPItem isSharedByCurrentUser](self, "isSharedByCurrentUser"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserOwned:", v75);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FPItem fp_isLastModifiedByCurrentUser](self, "fp_isLastModifiedByCurrentUser"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:", v76, CFSTR("FPLastModifiedByCurrentUser"));

  -[FPItem preformattedOwnerName](self, "preformattedOwnerName");
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  v114 = v22;
  if (v77)
  {
    -[FPItem preformattedOwnerName](self, "preformattedOwnerName");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOwnerName:", v78);
    v79 = 0;
LABEL_44:

    goto LABEL_45;
  }
  -[FPItem ownerNameComponents](self, "ownerNameComponents");
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  if (v80)
  {
    v79 = (void *)objc_opt_new();
    -[FPItem ownerNameComponents](self, "ownerNameComponents");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "stringFromPersonNameComponents:", v78);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOwnerName:", v81);

    goto LABEL_44;
  }
  v79 = 0;
LABEL_45:
  -[FPItem preformattedMostRecentEditorName](self, "preformattedMostRecentEditorName");
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  v113 = (void *)v24;
  if (v82)
  {
    -[FPItem preformattedMostRecentEditorName](self, "preformattedMostRecentEditorName");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLastEditorName:", v83);
  }
  else
  {
    -[FPItem mostRecentEditorNameComponents](self, "mostRecentEditorNameComponents");
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v84)
      goto LABEL_52;
    if (!v79)
      v79 = (void *)objc_opt_new();
    -[FPItem mostRecentEditorNameComponents](self, "mostRecentEditorNameComponents");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "stringFromPersonNameComponents:", v83);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLastEditorName:", v85);

  }
LABEL_52:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FPItem isMostRecentVersionDownloaded](self, "isMostRecentVersionDownloaded"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:", v86, CFSTR("FPMostRecentVersionDownloaded"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FPItem isTrashed](self, "isTrashed"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTrashed:", v87);

  -[FPItem fileURL](self, "fileURL");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPItem fileURL](self, "fileURL");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = (void *)_CFURLPromiseCopyPhysicalURL();

  if (v90)
  {
    v91 = v90;

    v88 = v91;
  }
  objc_msgSend(v5, "setContentURL:", v88);
  -[FPItem parentFormerIdentifier](self, "parentFormerIdentifier");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  if (v92)
  {
    objc_msgSend(v5, "setAttribute:forKey:", v92, CFSTR("FPParentFileItemID"));
  }
  else
  {
    -[FPItem parentItemIdentifier](self, "parentItemIdentifier");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttribute:forKey:", v93, CFSTR("FPParentFileItemID"));

  }
  v94 = -[FPItem capabilities](self, "capabilities");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v94 >> 6) & 1);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:", v95, CFSTR("FPEvictable"));

  if (-[FPItem isTopLevelSharedItem](self, "isTopLevelSharedItem"))
    objc_msgSend(v5, "setAttribute:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("FPIsTopLevelSharedItem"));
  -[FPItem collaborationIdentifier](self, "collaborationIdentifier");
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  if (v96)
  {
    -[FPItem collaborationIdentifier](self, "collaborationIdentifier");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttribute:forKey:", v97, CFSTR("FPCollaborationIdentifier"));

  }
  -[FPItem spotlightDomainIdentifier](self, "spotlightDomainIdentifier");
  v98 = objc_claimAutoreleasedReturnValue();
  if (v98)
  {
    v99 = (void *)v98;
    v100 = v54;
    -[FPItem fp_spotlightSubDomainIdentifier](self, "fp_spotlightSubDomainIdentifier");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (v101)
    {
      objc_msgSend(v99, "stringByAppendingPathExtension:", v101);
      v102 = objc_claimAutoreleasedReturnValue();

      v99 = (void *)v102;
    }
    v125 = 0;
    v126 = &v125;
    v127 = 0x2050000000;
    v103 = (void *)getCSSearchableItemClass_softClass;
    v128 = getCSSearchableItemClass_softClass;
    if (!getCSSearchableItemClass_softClass)
    {
      v120 = MEMORY[0x1E0C809B0];
      v121 = 3221225472;
      v122 = (uint64_t)__getCSSearchableItemClass_block_invoke;
      v123 = &unk_1E444B188;
      v124 = &v125;
      __getCSSearchableItemClass_block_invoke((uint64_t)&v120);
      v103 = (void *)v126[3];
    }
    v104 = objc_retainAutorelease(v103);
    _Block_object_dispose(&v125, 8);
    v105 = [v104 alloc];
    -[FPItem coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = (void *)objc_msgSend(v105, "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v106, v99, v5);

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "setExpirationDate:", v108);

    v109 = v107;
    v110 = v109;
    v54 = v100;
  }
  else
  {
    fp_current_or_default_log();
    v109 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_FAULT))
      -[FPItem(CSSearchableItem) toSearchableItem].cold.1(v109);
    v110 = 0;
  }

  return v110;
}

uint64_t __44__FPItem_CSSearchableItem__toSearchableItem__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "label");
}

void __44__FPItem_CSSearchableItem__toSearchableItem__block_invoke_2(uint64_t a1, uint64_t a2, _QWORD *a3, _BYTE *a4)
{
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *a3 = v6;

  *a4 = objc_msgSend(v7, "color");
}

+ (id)fp_minimalAttributesForEvictionPriority
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  getMDItemLastUsedDate();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  getMDItemFileSize();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  getMDItemFileProviderID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  getMDItemFileProviderDomainIdentifier();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)fp_minimalAttributesForEviction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  getMDItemLastUsedDate();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  getMDItemFileSize();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  getMDItemFileItemID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  getMDItemFileProviderID();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  getMDItemFileProviderDomainIdentifier();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)generatePlaceholderIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("-"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@/%@"), CFSTR("__fp"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)generatePlaceholderIdentifierWithOriginalID:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("-"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@/%@"), CFSTR("__fp"), v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)temporaryPlaceholderFromItem:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "copyAsPending");
  objc_msgSend(v3, "setFavoriteRank:", 0);
  objc_msgSend(v3, "setUploading:", 0);
  objc_msgSend(v3, "setDownloading:", 0);
  objc_msgSend(v3, "setFp_lastModifiedByCurrentUser:", 0);
  objc_msgSend(v3, "setOwnerNameComponents:", 0);
  objc_msgSend(v3, "setMostRecentEditorNameComponents:", 0);
  objc_msgSend(v3, "setEnumerationOrigin:", 0);
  objc_msgSend(v3, "setFp_spotlightSubDomainIdentifier:", 0);
  objc_msgSend(v3, "setContainerDisplayName:", 0);
  objc_msgSend(v3, "setFp_appContainerBundleIdentifier:", 0);
  objc_msgSend(v3, "setFp_parentDomainIdentifier:", 0);
  objc_msgSend(v3, "setCloudContainerIdentifier:", 0);
  objc_msgSend(v3, "setFileURL:", 0);
  objc_msgSend(v3, "setShared:", 0);
  objc_msgSend(v3, "setSharedByCurrentUser:", 0);
  objc_msgSend(v3, "setState:", 5);
  return v3;
}

+ (id)placeholderWithCopyOfExistingItem:(id)a3 lastUsageUpdatePolicy:(unint64_t)a4 underParent:(id)a5 inProviderDomainID:(id)a6
{
  id v10;
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a6;
  v11 = (__CFString *)a5;
  v12 = a3;
  objc_msgSend(a1, "temporaryPlaceholderFromItem:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "generatePlaceholderIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setItemIdentifier:", v14);

  objc_msgSend(v12, "itemIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setPlaceholderIdentifier:", v15);
  objc_msgSend(v13, "setParentItemIdentifier:", v11);

  if (CFSTR("NSFileProviderTrashContainerItemIdentifier") == v11)
    objc_msgSend(v13, "setTrashed:", 1);
  objc_msgSend(v13, "setProviderDomainID:", v10);
  if (a4)
  {
    if (a4 == 2)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setLastUsedDate:", v16);

    }
  }
  else
  {
    objc_msgSend(v13, "setLastUsedDate:", 0);
  }

  return v13;
}

+ (id)genericArchivePlaceholderUnderParent:(id)a3 inProviderDomainID:(id)a4 withArchiveFormat:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  id v23;

  v23 = 0;
  v7 = a4;
  v8 = a3;
  +[FPArchiveOperation extensionForArchiveFormat:utType:](FPArchiveOperation, "extensionForArchiveFormat:utType:", a5, &v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v23;
  FPLoc(CFSTR("ARCHIVE_FILENAME"), v11, v12, v13, v14, v15, v16, v17, v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByAppendingPathExtension:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPItem placeholderWithName:contentType:contentAccessDate:underParent:inProviderDomainID:](FPItem, "placeholderWithName:contentType:contentAccessDate:underParent:inProviderDomainID:", v19, v10, 0, v8, v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)archivePlaceholderForItem:(id)a3 underParent:(id)a4 inProviderDomainID:(id)a5 withArchiveFormat:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v22;

  v22 = 0;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  +[FPArchiveOperation extensionForArchiveFormat:utType:](FPArchiveOperation, "extensionForArchiveFormat:utType:", a6, &v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v22;
  objc_msgSend(v11, "filename");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fp_displayNameFromFilenameWithHiddenPathExtension:isFolder:", 1, objc_msgSend(v11, "isFolder"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fp_filenameFromDisplayNameWithExtension:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[FPItem placeholderWithName:contentType:contentAccessDate:underParent:inProviderDomainID:](FPItem, "placeholderWithName:contentType:contentAccessDate:underParent:inProviderDomainID:", v16, v13, 0, v10, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "displayName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDisplayName:", v18);

  objc_msgSend(v11, "itemIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPlaceholderIdentifier:", v19);

  objc_msgSend(v17, "setCapabilities:", objc_msgSend(v11, "capabilities"));
  objc_msgSend(v17, "setEnumerationOrigin:", objc_msgSend(v11, "enumerationOrigin"));
  v20 = objc_msgSend(v11, "fileSystemFlags");

  objc_msgSend(v17, "setFileSystemFlags:", v20);
  return v17;
}

+ (id)placeholderWithName:(id)a3 contentType:(id)a4 contentAccessDate:(id)a5 underParent:(id)a6 inProviderDomainID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  FPItem *v17;
  void *v18;
  FPItem *v19;
  void *v20;
  void *v21;

  v12 = a5;
  v13 = a7;
  v14 = a6;
  v15 = a4;
  v16 = a3;
  v17 = [FPItem alloc];
  objc_msgSend(a1, "generatePlaceholderIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[FPItem initWithProviderDomainID:itemIdentifier:parentItemIdentifier:filename:contentType:](v17, "initWithProviderDomainID:itemIdentifier:parentItemIdentifier:filename:contentType:", v13, v18, v14, v16, v15);

  if (v12)
    -[FPItem setLastUsedDate:](v19, "setLastUsedDate:", v12);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPItem setCreationDate:](v19, "setCreationDate:", v20);

  -[FPItem creationDate](v19, "creationDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPItem setContentModificationDate:](v19, "setContentModificationDate:", v21);

  -[FPItem setState:](v19, "setState:", 5);
  return v19;
}

+ (id)placeholderWithName:(id)a3 typeIdentifier:(id)a4 contentAccessDate:(id)a5 underParent:(id)a6 inProviderDomainID:(id)a7
{
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v11 = (void *)MEMORY[0x1E0CEC3F8];
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  objc_msgSend(v11, "fp_cachedTypeWithIdentifier:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPItem placeholderWithName:contentType:contentAccessDate:underParent:inProviderDomainID:](FPItem, "placeholderWithName:contentType:contentAccessDate:underParent:inProviderDomainID:", v15, v16, v14, v13, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)placeholderWithName:(id)a3 isFolder:(BOOL)a4 contentAccessDate:(id)a5 underParent:(id)a6 inProviderDomainID:(id)a7
{
  _QWORD *v7;

  v7 = (_QWORD *)MEMORY[0x1E0CEC4F0];
  if (!a4)
    v7 = (_QWORD *)MEMORY[0x1E0CEC528];
  return (id)objc_msgSend(a1, "placeholderWithName:contentType:contentAccessDate:underParent:inProviderDomainID:", a3, *v7, a5, a6, a7);
}

- (void)_coreSpotlightAttributeForKey:(id)a3
{
  id v4;
  const __CFString *v5;
  void *v6;
  NSObject *v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("kMDItemIsTrashed")))
  {
    v5 = CFSTR("isTrashed");
LABEL_8:
    v6 = (void *)-[FPItem valueForKey:](self, "valueForKey:", v5);
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("kMDItemDisplayName")))
  {
    v5 = CFSTR("displayName");
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("FPDomainIdentifier"))
    || objc_msgSend(v4, "isEqualToString:", CFSTR("kMDItemFileProviderID")))
  {
    v5 = CFSTR("providerDomainID");
    goto LABEL_8;
  }
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[FPItem(MDSimpleQueryEvaluator) _coreSpotlightAttributeForKey:].cold.1((uint64_t)v4, v8);

  v6 = 0;
LABEL_9:

  return v6;
}

- (unint64_t)depthInHierarchy
{
  return 0;
}

- (BOOL)fp_isAddedByCurrentUser
{
  return 0;
}

- (NSPersonNameComponents)fp_addedByNameComponents
{
  return 0;
}

- (NSString)localizedSharingStatusString
{
  return 0;
}

- (void)initWithVendorItem:provider:domain:spotlightDomainIdentifier:extensionCapabilities:useFPFS:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_15_0(&dword_1A0A34000, v0, v1, "[SIMCRASH] can't create item because at least one of the required properties is missing. See the log for more details.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "fp_obfuscatedFilename");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v3, v4, "[DEBUG] attempting to unarchive item without type (%@, %@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

- (void)encodeWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_15_0(&dword_1A0A34000, v0, v1, "[SIMCRASH] item does not have all the required properties; encoding will be invalid",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_30();
}

- (void)encodeWithCoder:(os_log_t)log .cold.2(_QWORD *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  _QWORD *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = a1[10];
  v5 = a1[45];
  v6 = a1[22];
  v7 = 138413314;
  v8 = a1;
  v9 = 2112;
  v10 = v3;
  v11 = 2112;
  v12 = v4;
  v13 = 2112;
  v14 = v5;
  v15 = 2112;
  v16 = v6;
  _os_log_error_impl(&dword_1A0A34000, log, OS_LOG_TYPE_ERROR, "[ERROR] item %@ does not have all the required properties; encoding will be invalid (%@, %@, %@, %@)",
    (uint8_t *)&v7,
    0x34u);
}

- (void)fieldDifferencesWithItem:(uint64_t)a1 onlyMetadata:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "itemID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v3, v4, "[DEBUG] Found different fields %@ for itemID %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

- (void)overrideFields:(uint64_t)a3 ofItem:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_13_0();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_9_0();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v29, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "effectiveContentPolicy");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "effectiveContentPolicy");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithInteger:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  a9 = 138413058;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1A0A34000, v25, v31, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_5_0();
}

- (void)overrideFields:(uint64_t)a3 ofItem:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_13_0();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_9_0();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v29, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "inheritedContentPolicy");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "inheritedContentPolicy");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithInteger:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  a9 = 138413058;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1A0A34000, v25, v31, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_5_0();
}

- (void)overrideFields:(uint64_t)a3 ofItem:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_13_0();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_9_0();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v29, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "contentPolicy");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "contentPolicy");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithInteger:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  a9 = 138413058;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1A0A34000, v25, v31, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_5_0();
}

- (void)overrideFields:(void *)a1 ofItem:(NSObject *)a2 .cold.4(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Overriding field typeAndCreator for itemID %@", (uint8_t *)&v4, 0xCu);

}

- (void)overrideFields:ofItem:.cold.5()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "decorations");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "decorations");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.6()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "extendedAttributes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "extendedAttributes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:(uint64_t)a3 ofItem:(uint64_t)a4 .cold.7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_13_0();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_9_0();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v29, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "fileSystemFlags");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithUnsignedInteger:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "fileSystemFlags");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithUnsignedInteger:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  a9 = 138413058;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1A0A34000, v25, v31, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_5_0();
}

- (void)overrideFields:ofItem:.cold.8()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "conflictingVersions");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "conflictingVersions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:(uint64_t)a3 ofItem:(uint64_t)a4 .cold.9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_13_0();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_9_0();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v29, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "isRecursivelyDownloaded");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "isRecursivelyDownloaded");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  a9 = 138413058;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1A0A34000, v25, v31, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_5_0();
}

- (void)overrideFields:(uint64_t)a3 ofItem:(uint64_t)a4 .cold.10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_13_0();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_9_0();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v29, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "isTopLevelSharedItem");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "isTopLevelSharedItem");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  a9 = 138413058;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1A0A34000, v25, v31, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_5_0();
}

- (void)overrideFields:(uint64_t)a3 ofItem:(uint64_t)a4 .cold.11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_13_0();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_9_0();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v29, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "isContainerPristine");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "isContainerPristine");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  a9 = 138413058;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1A0A34000, v25, v31, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_5_0();
}

- (void)overrideFields:(uint64_t)a3 ofItem:(uint64_t)a4 .cold.12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_13_0();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_9_0();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v29, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "isContainer");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "isContainer");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  a9 = 138413058;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1A0A34000, v25, v31, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_5_0();
}

- (void)overrideFields:(uint64_t)a3 ofItem:(uint64_t)a4 .cold.13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_13_0();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_9_0();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v29, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "isUbiquitous");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "isUbiquitous");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  a9 = 138413058;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1A0A34000, v25, v31, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_5_0();
}

- (void)overrideFields:ofItem:.cold.14()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "cloudContainerIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "cloudContainerIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.15()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "fp_parentDomainIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "fp_parentDomainIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.16()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "fp_appContainerBundleIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "fp_appContainerBundleIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:(uint64_t)a3 ofItem:(uint64_t)a4 .cold.17(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_13_0();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_9_0();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v29, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "supportsMostRecentVersionDownloaded");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "supportsMostRecentVersionDownloaded");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  a9 = 138413058;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1A0A34000, v25, v31, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_5_0();
}

- (void)overrideFields:ofItem:.cold.18()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "containerDisplayName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "containerDisplayName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.19()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "sharingPermissions");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "sharingPermissions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.20()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "isDownloadRequested");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "isDownloadRequested");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.21()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "hasUnresolvedConflicts");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "hasUnresolvedConflicts");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:(uint64_t)a3 ofItem:(uint64_t)a4 .cold.22(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_13_0();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_9_0();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v29, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "isPinned");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "isPinned");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  a9 = 138413058;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1A0A34000, v25, v31, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_5_0();
}

- (void)overrideFields:(uint64_t)a3 ofItem:(uint64_t)a4 .cold.23(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_13_0();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_9_0();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v29, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "isInPinnedFolder");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "isInPinnedFolder");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  a9 = 138413058;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1A0A34000, v25, v31, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_5_0();
}

- (void)overrideFields:ofItem:.cold.24()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "fp_spotlightSubDomainIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "fp_spotlightSubDomainIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.25()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "spotlightDomainIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "spotlightDomainIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.26()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "itemVersion");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "itemVersion");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.27()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "versionIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "versionIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.28()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "placeholderIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "placeholderIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:(uint64_t)a3 ofItem:(uint64_t)a4 .cold.29(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_13_0();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_9_0();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v29, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "state");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithUnsignedInteger:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "state");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithUnsignedInteger:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  a9 = 138413058;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1A0A34000, v25, v31, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_5_0();
}

- (void)overrideFields:ofItem:.cold.30()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "userInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "userInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.31()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "childItemCount");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "childItemCount");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.32()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "collaborationIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "collaborationIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.33()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "mostRecentEditorNameComponents");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "mostRecentEditorNameComponents");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.34()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "ownerNameComponents");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "ownerNameComponents");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:(uint64_t)a3 ofItem:(uint64_t)a4 .cold.35(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_13_0();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_9_0();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v29, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "fp_isLastModifiedByCurrentUser");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "fp_isLastModifiedByCurrentUser");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  a9 = 138413058;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1A0A34000, v25, v31, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_5_0();
}

- (void)overrideFields:(uint64_t)a3 ofItem:(uint64_t)a4 .cold.36(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_13_0();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_9_0();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v29, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "isSharedByCurrentUser");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "isSharedByCurrentUser");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  a9 = 138413058;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1A0A34000, v25, v31, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_5_0();
}

- (void)overrideFields:(uint64_t)a3 ofItem:(uint64_t)a4 .cold.37(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_13_0();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_9_0();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v29, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "isShared");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "isShared");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  a9 = 138413058;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1A0A34000, v25, v31, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_5_0();
}

- (void)overrideFields:(uint64_t)a3 ofItem:(uint64_t)a4 .cold.38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_13_0();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_9_0();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v29, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "isMostRecentVersionDownloaded");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "isMostRecentVersionDownloaded");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  a9 = 138413058;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1A0A34000, v25, v31, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_5_0();
}

- (void)overrideFields:ofItem:.cold.39()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "downloadingError");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "downloadingError");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:(uint64_t)a3 ofItem:(uint64_t)a4 .cold.40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_13_0();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_9_0();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v29, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "isDownloading");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "isDownloading");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  a9 = 138413058;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1A0A34000, v25, v31, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_5_0();
}

- (void)overrideFields:(uint64_t)a3 ofItem:(uint64_t)a4 .cold.41(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_13_0();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_9_0();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v29, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "isDownloaded");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "isDownloaded");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  a9 = 138413058;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1A0A34000, v25, v31, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_5_0();
}

- (void)overrideFields:ofItem:.cold.42()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "uploadingError");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "uploadingError");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:(uint64_t)a3 ofItem:(uint64_t)a4 .cold.43(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_13_0();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_9_0();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v29, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "isUploading");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "isUploading");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  a9 = 138413058;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1A0A34000, v25, v31, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_5_0();
}

- (void)overrideFields:(uint64_t)a3 ofItem:(uint64_t)a4 .cold.44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_13_0();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_9_0();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v29, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "isUploaded");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "isUploaded");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  a9 = 138413058;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1A0A34000, v25, v31, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_5_0();
}

- (void)overrideFields:ofItem:.cold.45()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "favoriteRank");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "favoriteRank");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.46()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "tags");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "tags");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.47()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "lastUsedDate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "lastUsedDate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:(uint64_t)a3 ofItem:(uint64_t)a4 .cold.48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_13_0();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_9_0();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v29, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "isTrashed");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "isTrashed");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithBool:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  a9 = 138413058;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1A0A34000, v25, v31, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_5_0();
}

- (void)overrideFields:ofItem:.cold.49()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "contentModificationDate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "contentModificationDate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.50()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "creationDate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "creationDate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:(uint64_t)a3 ofItem:(uint64_t)a4 .cold.51(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_13_0();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_9_0();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v29, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "enumerationOrigin");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithUnsignedInteger:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "enumerationOrigin");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithUnsignedInteger:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  a9 = 138413058;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1A0A34000, v25, v31, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_5_0();
}

- (void)overrideFields:(uint64_t)a3 ofItem:(uint64_t)a4 .cold.52(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_13_0();
  a23 = v27;
  a24 = v28;
  OUTLINED_FUNCTION_9_0();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v29, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "capabilities");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithUnsignedInteger:");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "capabilities");
  objc_msgSend((id)OUTLINED_FUNCTION_12_0(), "numberWithUnsignedInteger:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  a9 = 138413058;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1A0A34000, v25, v31, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", (uint8_t *)&a9);

  OUTLINED_FUNCTION_5_0();
}

- (void)overrideFields:ofItem:.cold.53()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "fileURL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "fileURL");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.54()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "documentSize");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "documentSize");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.55()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "contentType");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "contentType");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.56()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "displayName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "displayName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.57()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "filename");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "filename");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.58()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "domainIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "domainIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.59()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "providerID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "providerID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.60()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "parentItemIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "parentItemIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.61()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "formerIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "formerIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)overrideFields:ofItem:.cold.62()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v2, "itemID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "itemIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10_0(), "itemIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A0A34000, v5, v6, "[DEBUG] Overriding field %@ for itemID %@ - old %@ new %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)setFilename:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_15_0(&dword_1A0A34000, v0, v1, "[SIMCRASH] can't set a nil filename", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

- (void)setProviderID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_15_0(&dword_1A0A34000, v0, v1, "[SIMCRASH] can't set a nil provider identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

- (void)setItemIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_15_0(&dword_1A0A34000, v0, v1, "[SIMCRASH] can't set a nil item identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

@end
