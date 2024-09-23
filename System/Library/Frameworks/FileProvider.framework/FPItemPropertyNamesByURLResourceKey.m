@implementation FPItemPropertyNamesByURLResourceKey

void __FPItemPropertyNamesByURLResourceKey_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[26];
  _QWORD v15[27];

  v15[26] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C99A70];
  v14[0] = *MEMORY[0x1E0C99A90];
  v14[1] = v0;
  v15[0] = CFSTR("filename");
  v15[1] = CFSTR("displayName");
  v1 = *MEMORY[0x1E0C998E8];
  v14[2] = *MEMORY[0x1E0C99998];
  v14[3] = v1;
  v15[2] = CFSTR("documentSize");
  v15[3] = CFSTR("creationDate");
  v2 = *MEMORY[0x1E0C998D0];
  v14[4] = *MEMORY[0x1E0C998D8];
  v14[5] = v2;
  v15[4] = CFSTR("contentModificationDate");
  v15[5] = CFSTR("lastUsedDate");
  v3 = *MEMORY[0x1E0C99A50];
  v14[6] = *MEMORY[0x1E0C99A10];
  v14[7] = v3;
  v15[6] = CFSTR("fp_isReadable");
  v15[7] = CFSTR("fp_isWritable");
  v4 = *MEMORY[0x1E0C99B40];
  v14[8] = *MEMORY[0x1E0C99B38];
  v14[9] = v4;
  v15[8] = CFSTR("isUploaded");
  v15[9] = CFSTR("isUploading");
  v5 = *MEMORY[0x1E0C99B00];
  v14[10] = *MEMORY[0x1E0C99B48];
  v14[11] = v5;
  v15[10] = CFSTR("uploadingError");
  v15[11] = CFSTR("fp_downloadingStatus");
  v6 = *MEMORY[0x1E0C99AE8];
  v14[12] = *MEMORY[0x1E0C99B20];
  v14[13] = v6;
  v15[12] = CFSTR("isDownloading");
  v15[13] = CFSTR("downloadingError");
  v7 = *MEMORY[0x1E0C99B58];
  v14[14] = *MEMORY[0x1E0C99B30];
  v14[15] = v7;
  v15[14] = CFSTR("isShared");
  v15[15] = CFSTR("fp_sharingCurrentUserRole");
  v8 = *MEMORY[0x1E0C99B78];
  v14[16] = *MEMORY[0x1E0C99B50];
  v14[17] = v8;
  v15[16] = CFSTR("fp_sharingCurrentUserPermissions");
  v15[17] = CFSTR("sharingPermissions");
  v9 = *MEMORY[0x1E0C99B60];
  v14[18] = *MEMORY[0x1E0C99B68];
  v14[19] = v9;
  v15[18] = CFSTR("ownerNameComponents");
  v15[19] = CFSTR("mostRecentEditorNameComponents");
  v10 = *MEMORY[0x1E0C99B10];
  v14[20] = *MEMORY[0x1E0C99A38];
  v14[21] = v10;
  v15[20] = CFSTR("fp_isUbiquitous");
  v15[21] = CFSTR("hasUnresolvedConflicts");
  v11 = *MEMORY[0x1E0C99AE0];
  v14[22] = *MEMORY[0x1E0C99AD8];
  v14[23] = v11;
  v15[22] = CFSTR("containerDisplayName");
  v15[23] = CFSTR("isDownloadRequested");
  v14[24] = *MEMORY[0x1E0C99B28];
  v14[25] = CFSTR("NSFileProviderDomainIdentifierKey");
  v15[24] = CFSTR("isExcludedFromSync");
  v15[25] = CFSTR("providerDomainID");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 26);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)FPItemPropertyNamesByURLResourceKey_itemPropertyNamesByURLKey;
  FPItemPropertyNamesByURLResourceKey_itemPropertyNamesByURLKey = v12;

}

@end
