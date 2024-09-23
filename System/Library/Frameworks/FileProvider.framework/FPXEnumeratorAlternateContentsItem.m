@implementation FPXEnumeratorAlternateContentsItem

- (FPXEnumeratorAlternateContentsItem)initWithOriginalDocumentItem:(id)a3 alternateContentsURL:(id)a4
{
  id v7;
  id v8;
  FPXEnumeratorAlternateContentsItem *v9;
  FPXEnumeratorAlternateContentsItem *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  NSDictionary *v16;
  NSObject *p_super;
  id v19;
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)FPXEnumeratorAlternateContentsItem;
  v9 = -[FPXEnumeratorAlternateContentsItem init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_documentItem, a3);
    v11 = *MEMORY[0x1E0C998D8];
    v21[0] = *MEMORY[0x1E0C99998];
    v21[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "startAccessingSecurityScopedResource");
    v19 = 0;
    objc_msgSend(v8, "resourceValuesForKeys:error:", v12, &v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v19;
    if (v13)
      objc_msgSend(v8, "stopAccessingSecurityScopedResource");
    if (v14)
    {
      v16 = v14;
      p_super = &v10->_resourceValues->super;
      v10->_resourceValues = v16;
    }
    else
    {
      fp_current_or_default_log();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        -[FPXEnumeratorAlternateContentsItem initWithOriginalDocumentItem:alternateContentsURL:].cold.1((uint64_t)v8, v15, p_super);
    }

  }
  return v10;
}

- (NSString)itemIdentifier
{
  return -[FPItem itemIdentifier](self->_documentItem, "itemIdentifier");
}

- (NSString)parentItemIdentifier
{
  return -[FPItem parentItemIdentifier](self->_documentItem, "parentItemIdentifier");
}

- (NSString)filename
{
  return -[FPItem filename](self->_documentItem, "filename");
}

- (NSString)typeIdentifier
{
  return -[FPItem typeIdentifier](self->_documentItem, "typeIdentifier");
}

- (UTType)contentType
{
  return -[FPItem contentType](self->_documentItem, "contentType");
}

- (unint64_t)capabilities
{
  return -[FPItem capabilities](self->_documentItem, "capabilities");
}

- (NSString)displayName
{
  return -[FPItem displayName](self->_documentItem, "displayName");
}

- (NSNumber)childItemCount
{
  return -[FPItem childItemCount](self->_documentItem, "childItemCount");
}

- (NSDate)creationDate
{
  return -[FPItem creationDate](self->_documentItem, "creationDate");
}

- (NSDate)lastUsedDate
{
  return -[FPItem lastUsedDate](self->_documentItem, "lastUsedDate");
}

- (NSData)tagData
{
  return -[FPItem tagData](self->_documentItem, "tagData");
}

- (NSNumber)favoriteRank
{
  return -[FPItem favoriteRank](self->_documentItem, "favoriteRank");
}

- (BOOL)isTrashed
{
  return -[FPItem isTrashed](self->_documentItem, "isTrashed");
}

- (BOOL)isUploaded
{
  return -[FPItem isUploaded](self->_documentItem, "isUploaded");
}

- (BOOL)isUploading
{
  return -[FPItem isUploading](self->_documentItem, "isUploading");
}

- (NSError)uploadingError
{
  return -[FPItem uploadingError](self->_documentItem, "uploadingError");
}

- (BOOL)isDownloaded
{
  return -[FPItem isDownloaded](self->_documentItem, "isDownloaded");
}

- (BOOL)isDownloading
{
  return -[FPItem isDownloading](self->_documentItem, "isDownloading");
}

- (NSError)downloadingError
{
  return -[FPItem downloadingError](self->_documentItem, "downloadingError");
}

- (BOOL)isMostRecentVersionDownloaded
{
  return -[FPItem isMostRecentVersionDownloaded](self->_documentItem, "isMostRecentVersionDownloaded");
}

- (BOOL)isShared
{
  return -[FPItem isShared](self->_documentItem, "isShared");
}

- (BOOL)isSharedByCurrentUser
{
  return -[FPItem isSharedByCurrentUser](self->_documentItem, "isSharedByCurrentUser");
}

- (id)collaborationIdentifier
{
  return -[FPItem collaborationIdentifier](self->_documentItem, "collaborationIdentifier");
}

- (BOOL)isCollaborationInvitation
{
  return -[FPItem isCollaborationInvitation](self->_documentItem, "isCollaborationInvitation");
}

- (BOOL)fp_isLastModifiedByCurrentUser
{
  return -[FPItem fp_isLastModifiedByCurrentUser](self->_documentItem, "fp_isLastModifiedByCurrentUser");
}

- (NSPersonNameComponents)ownerNameComponents
{
  return -[FPItem ownerNameComponents](self->_documentItem, "ownerNameComponents");
}

- (NSPersonNameComponents)mostRecentEditorNameComponents
{
  return -[FPItem mostRecentEditorNameComponents](self->_documentItem, "mostRecentEditorNameComponents");
}

- (NSDictionary)userInfo
{
  return -[FPItem userInfo](self->_documentItem, "userInfo");
}

- (NSArray)decorations
{
  return -[FPItem decorations](self->_documentItem, "decorations");
}

- (BOOL)isTopLevelSharedItem
{
  return -[FPItem isTopLevelSharedItem](self->_documentItem, "isTopLevelSharedItem");
}

- (NSData)versionIdentifier
{
  return -[FPItem versionIdentifier](self->_documentItem, "versionIdentifier");
}

- (NSFileProviderItemVersion)itemVersion
{
  return -[FPItem itemVersion](self->_documentItem, "itemVersion");
}

- (NSNumber)hasUnresolvedConflicts
{
  return -[FPItem hasUnresolvedConflicts](self->_documentItem, "hasUnresolvedConflicts");
}

- (NSString)containerDisplayName
{
  return -[FPItem containerDisplayName](self->_documentItem, "containerDisplayName");
}

- (NSNumber)isDownloadRequested
{
  return -[FPItem isDownloadRequested](self->_documentItem, "isDownloadRequested");
}

- (id)providerID
{
  return -[FPItem providerID](self->_documentItem, "providerID");
}

- (NSString)sharingPermissions
{
  return -[FPItem sharingPermissions](self->_documentItem, "sharingPermissions");
}

- (NSString)fp_spotlightDomainIdentifier
{
  return (NSString *)-[FPItem fp_spotlightDomainIdentifier](self->_documentItem, "fp_spotlightDomainIdentifier");
}

- (NSString)fp_spotlightSubDomainIdentifier
{
  return -[FPItem fp_spotlightSubDomainIdentifier](self->_documentItem, "fp_spotlightSubDomainIdentifier");
}

- (NSString)fp_domainIdentifier
{
  return -[FPItem fp_domainIdentifier](self->_documentItem, "fp_domainIdentifier");
}

- (BOOL)isContainer
{
  return -[FPItem isContainer](self->_documentItem, "isContainer");
}

- (BOOL)isContainerPristine
{
  return -[FPItem isContainerPristine](self->_documentItem, "isContainerPristine");
}

- (id)cloudContainerIdentifier
{
  return -[FPItem cloudContainerIdentifier](self->_documentItem, "cloudContainerIdentifier");
}

- (BOOL)isContentZoneRoot
{
  return -[FPItem isContentZoneRoot](self->_documentItem, "isContentZoneRoot");
}

- (NSNumber)documentSize
{
  NSDictionary *resourceValues;

  resourceValues = self->_resourceValues;
  if (resourceValues)
    -[NSDictionary objectForKeyedSubscript:](resourceValues, "objectForKeyedSubscript:", *MEMORY[0x1E0C99998]);
  else
    -[FPItem documentSize](self->_documentItem, "documentSize");
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)contentModificationDate
{
  NSDictionary *resourceValues;

  resourceValues = self->_resourceValues;
  if (resourceValues)
    -[NSDictionary objectForKeyedSubscript:](resourceValues, "objectForKeyedSubscript:", *MEMORY[0x1E0C998D8]);
  else
    -[FPItem contentModificationDate](self->_documentItem, "contentModificationDate");
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceValues, 0);
  objc_storeStrong((id *)&self->_documentItem, 0);
}

- (void)initWithOriginalDocumentItem:(NSObject *)a3 alternateContentsURL:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_ERROR, "[ERROR] failed to get resource values for alternate contents URL %@: %@", (uint8_t *)&v6, 0x16u);

}

@end
