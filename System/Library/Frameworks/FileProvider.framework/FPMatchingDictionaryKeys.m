@implementation FPMatchingDictionaryKeys

void __FPMatchingDictionaryKeys_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  FPURLResourceKeysByItemPropertyNames();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "keysOfEntriesPassingTest:", &__block_literal_global_252);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "addObject:", CFSTR("userInfo"));
  objc_msgSend(v2, "addObject:", CFSTR("itemIdentifier"));
  objc_msgSend(v2, "addObject:", CFSTR("parentItemIdentifier"));
  objc_msgSend(v2, "addObject:", CFSTR("contentType"));
  objc_msgSend(v2, "addObject:", CFSTR("typeIdentifier"));
  objc_msgSend(v2, "addObject:", CFSTR("isTrashed"));
  objc_msgSend(v2, "addObject:", CFSTR("filename"));
  objc_msgSend(v2, "addObject:", CFSTR("capabilities"));
  objc_msgSend(v2, "addObject:", CFSTR("documentSize"));
  objc_msgSend(v2, "addObject:", CFSTR("childItemCount"));
  objc_msgSend(v2, "addObject:", CFSTR("creationDate"));
  objc_msgSend(v2, "addObject:", CFSTR("contentModificationDate"));
  objc_msgSend(v2, "addObject:", CFSTR("lastUsedDate"));
  objc_msgSend(v2, "addObject:", CFSTR("tagData"));
  objc_msgSend(v2, "addObject:", CFSTR("favoriteRank"));
  objc_msgSend(v2, "addObject:", CFSTR("isUploaded"));
  objc_msgSend(v2, "addObject:", CFSTR("isUploading"));
  objc_msgSend(v2, "addObject:", CFSTR("uploadingError"));
  objc_msgSend(v2, "addObject:", CFSTR("isDownloaded"));
  objc_msgSend(v2, "addObject:", CFSTR("isDownloading"));
  objc_msgSend(v2, "addObject:", CFSTR("downloadingError"));
  objc_msgSend(v2, "addObject:", CFSTR("isMostRecentVersionDownloaded"));
  objc_msgSend(v2, "addObject:", CFSTR("isShared"));
  objc_msgSend(v2, "addObject:", CFSTR("isSharedByCurrentUser"));
  objc_msgSend(v2, "addObject:", CFSTR("ownerNameComponents"));
  objc_msgSend(v2, "addObject:", CFSTR("mostRecentEditorNameComponents"));
  objc_msgSend(v2, "addObject:", CFSTR("versionIdentifier"));
  objc_msgSend(v2, "addObject:", CFSTR("inheritedUserInfo"));
  objc_msgSend(v2, "addObject:", CFSTR("resolvedUserInfo"));
  objc_msgSend(v2, "addObject:", CFSTR("collaborationIdentifier"));
  objc_msgSend(v2, "addObject:", CFSTR("isRecursivelyDownloaded"));
  objc_msgSend(v2, "addObject:", CFSTR("isKeepDownloaded"));
  objc_msgSend(v2, "addObject:", CFSTR("isFolder"));
  objc_msgSend(v2, "removeObject:", CFSTR("containerDisplayName"));
  objc_msgSend(v2, "removeObject:", CFSTR("providerDomainID"));
  v3 = (void *)FPMatchingDictionaryKeys_fpMatchingDictionary;
  FPMatchingDictionaryKeys_fpMatchingDictionary = (uint64_t)v2;

}

uint64_t __FPMatchingDictionaryKeys_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:", CFSTR("fp_")) ^ 1;
}

@end
