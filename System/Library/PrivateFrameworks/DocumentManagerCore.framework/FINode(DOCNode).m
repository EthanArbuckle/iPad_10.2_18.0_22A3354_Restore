@implementation FINode(DOCNode)

- (uint64_t)isRootItem
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "fpItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  objc_msgSend(a1, "fpItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRootItem");

  return v4;
}

- (uint64_t)isRecursivelyDownloaded
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "fpItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 1;
  objc_msgSend(a1, "fpItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRecursivelyDownloaded");

  return v4;
}

- (id)fileSize
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "documentSize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "fpItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "documentSize");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)uploadingProgress
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "fpItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "fpItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uploadingProgress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)downloadingProgress
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "fpItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "fpItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "downloadingProgress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "downloadProgress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (uint64_t)isUploaded
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "fpItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 1;
  objc_msgSend(a1, "fpItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUploaded");

  return v4;
}

- (id)uploadingError
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "fpItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "fpItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uploadingError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)downloadingError
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "fpItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "fpItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "downloadingError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (uint64_t)isCloudItem
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "fpItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  objc_msgSend(a1, "fpItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCloudItem");

  return v4;
}

- (uint64_t)isExcludedFromSync
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "fpItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  objc_msgSend(a1, "fpItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isExcludedFromSync");

  return v4;
}

- (id)copyingProgress
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "fpItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "fpItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "copyingProgress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "copyProgress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (uint64_t)isUploading
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "fpItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  objc_msgSend(a1, "fpItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUploading");

  return v4;
}

- (id)thumbnailIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNodeIdentifier:", v3);

  objc_msgSend(a1, "modificationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setModificationDate:", v4);

  objc_msgSend(v2, "setContentVersion:", 0);
  objc_msgSend(v2, "setFolderType:", objc_msgSend(a1, "folderType"));
  objc_msgSend(v2, "setIsTopLevelSharedItem:", objc_msgSend(a1, "isTopLevelSharedItem"));
  objc_msgSend(v2, "setIsDownloaded:", objc_msgSend(a1, "isDownloaded"));
  objc_msgSend(a1, "filename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFileExtension:", v6);

  objc_msgSend(v2, "setIsActionable:", objc_msgSend(a1, "isActionable"));
  return v2;
}

- (__CFString)identifier
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "description");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "fpItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "identifier");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = CFSTR("UNKNOWN");
    }

  }
  return v4;
}

- (uint64_t)isActionable
{
  return 1;
}

- (uint64_t)folderType
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "fpItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "folderType");
  else
    v3 = 0;

  return v3;
}

- (uint64_t)isDownloading
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a1, "fpItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "fpItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isDownloading");
  }
  else
  {
    objc_msgSend(a1, "downloadProgress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v5;
    if (v5)
      v4 = objc_msgSend(v5, "isFinished") ^ 1;
    else
      v4 = 0;
  }

  return v4;
}

- (uint64_t)isDownloaded
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "fpItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return objc_msgSend(a1, "propertyAsBool:", 1685548132);
  objc_msgSend(a1, "fpItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDownloaded");

  return v4;
}

- (uint64_t)isExternalDownloadPlaceholder
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "typeIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.safari.download"));

  return v2;
}

- (BOOL)isReadable
{
  return objc_msgSend(a1, "nodePermissions:", 0x10000) != 0;
}

- (id)domainDisplayName
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "cachedDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "cachedDomain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    DOCLocalizedDisplayName(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)cachedDomain
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  objc_msgSend(a1, "providerDomainID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDC82F8];
    objc_msgSend(a1, "providerDomainID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    objc_msgSend(v3, "providerDomainWithID:cachePolicy:error:", v4, 3, &v8);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;

    if (v5)
    {
      v6 = docEnumerationLogHandle;
      if (!docEnumerationLogHandle)
      {
        DOCInitLogging();
        v6 = docEnumerationLogHandle;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[FINode(DOCNode) cachedDomain].cold.1(v6, a1, v5);
    }

  }
  return v2;
}

- (id)providerDomainID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "fpDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(a1, "fpItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "providerDomainID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(a1, "domainFromFileURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        objc_msgSend(v5, "identifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = 0;
      }

    }
  }
  return v3;
}

- (uint64_t)doc_isCollaborationInvitation
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "fpItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  objc_msgSend(a1, "fpItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCollaborationInvitation");

  return v4;
}

- (BOOL)isWritable
{
  uint64_t v2;

  if (objc_msgSend(a1, "isContainer"))
    v2 = 53252;
  else
    v2 = 0x8000;
  return objc_msgSend(a1, "nodePermissions:", v2) != 0;
}

- (uint64_t)deepItemCount
{
  return objc_msgSend(a1, "propertyAsNumber:async:options:error:", 1684237940, objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"), 4, 0);
}

- (uint64_t)doc_isSMBSharepoint
{
  void *v2;
  const char *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "providerDomainID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (DOCProviderDomainIDIsSharedServerDomainID(v2, v3) && objc_msgSend(a1, "isRootItem"))
  {
    objc_msgSend(a1, "parent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isRootItem");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)doc_folderIconType
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;

  objc_msgSend(a1, "fpItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    +[DOCFeature dsEnumerationLocal](DOCFeature, "dsEnumerationLocal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEnabled");

    if (v6)
    {
      objc_msgSend(a1, "filename");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqual:", CFSTR("Downloads")) & 1) != 0)
      {
        objc_msgSend(a1, "parent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isRootItem");

        if ((v9 & 1) != 0)
        {
          v4 = 4;
          goto LABEL_9;
        }
      }
      else
      {

      }
    }
    v4 = 0;
    goto LABEL_9;
  }
  v4 = objc_msgSend(v2, "doc_folderIconType");
LABEL_9:

  return v4;
}

- (id)domainFromFileURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByStandardizingPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[DOCFeature dsEnumerationLocal](DOCFeature, "dsEnumerationLocal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEnabled");

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE2BEA8], "containerNodePathPrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "hasPrefix:", v7);

    if ((v8 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDC82F8], "providerDomainWithID:cachePolicy:error:", CFSTR("com.apple.FileProvider.LocalStorage"), 3, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    if ((objc_msgSend(v4, "hasSuffix:", CFSTR("/")) & 1) == 0 && objc_msgSend(a1, "isContainer"))
    {
      objc_msgSend(v4, "stringByAppendingString:", CFSTR("/"));
      v10 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v10;
    }
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(MEMORY[0x24BDC82F8], "domainPathCache", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v13 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v12);
        v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        objc_msgSend(MEMORY[0x24BDC82F8], "domainPathCache");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v4, "hasPrefix:", v17))
        {
          objc_msgSend(MEMORY[0x24BDC82F8], "providerDomainWithID:cachePolicy:error:", v15, 3, 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_17;
        }

      }
      v9 = (void *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_17:

LABEL_18:
  return v9;
}

- (id)providerID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "fpDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "providerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(a1, "fpItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "providerID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(a1, "domainFromFileURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        objc_msgSend(v5, "providerID");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = 0;
      }

    }
  }
  return v3;
}

- (id)doc_lastUsedDate
{
  void *v2;
  void *v3;
  char v4;
  void *v5;

  objc_msgSend(a1, "lastUsedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToDate:", v3);

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "lastUsedDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)dateForSortingByRecents
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "doc_lastUsedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(a1, "doc_lastUsedDate");
  else
    objc_msgSend(a1, "modificationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)isAnyParentTrashed
{
  return objc_msgSend(a1, "nodeIsAll:", 0x800000);
}

- (uint64_t)isPending
{
  return 0;
}

- (BOOL)isFullyFormed
{
  return objc_msgSend(a1, "nodeIs:", 4096) != 0;
}

- (uint64_t)isAppContainer
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "fpItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  objc_msgSend(a1, "fpItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isContainer");

  return v4;
}

- (uint64_t)contentVersion
{
  return 0;
}

- (uint64_t)isCopying
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "copyingProgress");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "isFinished") ^ 1;
  else
    v3 = 0;

  return v3;
}

- (uint64_t)isItemPinned
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "fpItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  objc_msgSend(a1, "fpItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isItemPinned");

  return v4;
}

- (uint64_t)isPinnedSubitem
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "fpItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  objc_msgSend(a1, "fpItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPinnedSubitem");

  return v4;
}

- (uint64_t)_doc_fileTypeCompare:()DOCNode
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "contentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "_doc_fileTypeCompare:", v6);
  return v7;
}

- (uint64_t)localizedStandardTagsCompareNode:()DOCNode
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "fpItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fpfs_fpItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardTagsCompare:", v6);
  return v7;
}

- (void)encodeNodeWithCoder:()DOCNode
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", 1, CFSTR("DOCNodeEncodedTypeKey"));
  objc_msgSend(v4, "encodeObject:forKey:", a1, CFSTR("DOCNodeEncodedObjectKey"));

}

- (void)fetchParent:()DOCNode
{
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;

  v5 = a3;
  objc_msgSend(a1, "parent");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, _QWORD))a3)[2](v5, v6, 0);

}

- (void)fetchParents:()DOCNode
{
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void (**v8)(id, id, _QWORD);

  v8 = a3;
  objc_msgSend(a1, "parent");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    do
    {
      if ((objc_msgSend(v5, "isRootItem") & 1) != 0)
        break;
      objc_msgSend(v6, "addObject:", v5);
      objc_msgSend(v5, "parent");
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    while (v7);
    if (objc_msgSend(v5, "isRootItem"))
      objc_msgSend(v6, "addObject:", v5);
    v8[2](v8, v6, 0);

  }
  else
  {
    v8[2](v8, 0, 0);
  }

}

- (void)fetchURL:()DOCNode
{
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;

  v5 = a3;
  objc_msgSend(a1, "nodeURL");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, _QWORD))a3)[2](v5, v6, 0);

}

- (void)fetchFPItem:()DOCNode
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v19[4];
  void (**v20)(id, void *, _QWORD);
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "fpItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fileURL");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    v4[2](v4, v5, 0);
  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __31__FINode_DOCNode__fetchFPItem___block_invoke;
    v19[3] = &unk_24C0FE2F0;
    v20 = v4;
    objc_msgSend(v8, "fetchItemForURL:completionHandler:", v7, v19);

  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    _DocumentManagerBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("FINode (%@) has no fpItem nor fileURL, impossible to fetch a corresponding FPItem"), CFSTR("FINode (%@) has no fpItem nor fileURL, impossible to fetch a corresponding FPItem"), CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "displayName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BDD0FC8];
    v22[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.DocumentManager.Node"), 2, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = docEnumerationLogHandle;
    if (!docEnumerationLogHandle)
    {
      DOCInitLogging();
      v17 = docEnumerationLogHandle;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[FINode(DOCNode) fetchFPItem:].cold.2(v17, v16);
    v18 = docEnumerationLogHandle;
    if (!docEnumerationLogHandle)
    {
      DOCInitLogging();
      v18 = docEnumerationLogHandle;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[FINode(DOCNode) fetchFPItem:].cold.1(v18);
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v16);

  }
}

- (id)eligibleActions
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  int v6;
  int v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "fpItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    if (objc_msgSend(a1, "isContainer"))
      v6 = 53252;
    else
      v6 = 20484;
    v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v7 = objc_msgSend(a1, "nodePermissions:", 0x7FFFFFFFLL);
    if ((v7 & v6) != 0)
      objc_msgSend(v5, "addObject:", *MEMORY[0x24BDC7D60]);
    if ((v7 & 2) != 0)
    {
      objc_msgSend(v5, "addObject:", *MEMORY[0x24BDC7D78]);
      if ((v7 & 0x10000) == 0)
      {
LABEL_10:
        if ((v7 & 1) == 0)
          goto LABEL_11;
        goto LABEL_20;
      }
    }
    else if ((v7 & 0x10000) == 0)
    {
      goto LABEL_10;
    }
    objc_msgSend(v5, "addObject:", *MEMORY[0x24BDC7D18]);
    if ((v7 & 1) == 0)
    {
LABEL_11:
      if ((v7 & 0x400000) == 0)
        goto LABEL_12;
      goto LABEL_21;
    }
LABEL_20:
    objc_msgSend(v5, "addObject:", *MEMORY[0x24BDC7D70]);
    if ((v7 & 0x400000) == 0)
    {
LABEL_12:
      if ((v7 & 0x200000) == 0)
        goto LABEL_13;
      goto LABEL_22;
    }
LABEL_21:
    objc_msgSend(v5, "addObject:", *MEMORY[0x24BDC7D20]);
    if ((v7 & 0x200000) == 0)
    {
LABEL_13:
      if ((v7 & 0x800000) == 0)
        goto LABEL_14;
      goto LABEL_23;
    }
LABEL_22:
    objc_msgSend(v5, "addObject:", *MEMORY[0x24BDC7D88]);
    if ((v7 & 0x800000) == 0)
    {
LABEL_14:
      if ((v7 & 0x100000) == 0)
        goto LABEL_15;
      goto LABEL_24;
    }
LABEL_23:
    objc_msgSend(v5, "addObject:", *MEMORY[0x24BDC7DA8]);
    if ((v7 & 0x100000) == 0)
    {
LABEL_15:
      if ((v7 & 0x2000) == 0)
        goto LABEL_17;
LABEL_16:
      objc_msgSend(v5, "addObject:", *MEMORY[0x24BDC7D68]);
      goto LABEL_17;
    }
LABEL_24:
    objc_msgSend(v5, "addObject:", *MEMORY[0x24BDC7D80]);
    if ((v7 & 0x2000) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eligibleActionsForItems:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v5;
}

- (uint64_t)canPerform:()DOCNode
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  NSObject *v9;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC7D60]))
  {
    if (objc_msgSend(a1, "isContainer"))
      v5 = 53252;
    else
      v5 = 20484;
    goto LABEL_21;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC7D78]) & 1) != 0)
  {
    v5 = 2;
LABEL_21:
    v6 = objc_msgSend(a1, "nodePermissions:", v5) != 0;
    goto LABEL_22;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC7D18]) & 1) != 0)
  {
    v5 = 0x10000;
    goto LABEL_21;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC7D70]) & 1) != 0)
  {
    v5 = 1;
    goto LABEL_21;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC7D20]) & 1) != 0)
  {
    v5 = 0x400000;
    goto LABEL_21;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC7D88]) & 1) != 0)
  {
    v5 = 0x200000;
    goto LABEL_21;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC7DA8]) & 1) != 0)
  {
    v5 = 0x800000;
    goto LABEL_21;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC7D80]) & 1) != 0)
  {
    v5 = 0x100000;
    goto LABEL_21;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC7D68]) & 1) != 0)
  {
    v5 = 0x2000;
    goto LABEL_21;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC7D48]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC7D50]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC7D10]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC7D90]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC7D58]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC7D98]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC7D28]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC7D38]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC7D30]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC7D40]) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC7DA0]))
  {
    objc_msgSend(a1, "fpItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    DOCEnumerationLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[FINode(DOCNode) canPerform:].cold.1();
  }
  else
  {
    objc_msgSend(a1, "fpItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    DOCEnumerationLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[FINode(DOCNode) canPerform:].cold.2();
  }

  if (v8)
  {
    v6 = objc_msgSend(v8, "canPerform:", v4);

  }
  else
  {
    v6 = 0;
  }
LABEL_22:

  return v6;
}

- (uint64_t)doc_fallbackSortIdentity
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a1);
}

- (void)cachedDomain
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "providerDomainID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  OUTLINED_FUNCTION_1_1(&dword_2090A2000, v5, v8, "Error getting domain from domainID: %@, domain error: %@", (uint8_t *)&v9);

}

- (void)fetchFPItem:()DOCNode .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2090A2000, log, OS_LOG_TYPE_FAULT, "FPItem bridging error: FINode has no fpItem nor fileURL, impossible to fetch a corresponding FPItem", v1, 2u);
}

- (void)fetchFPItem:()DOCNode .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_0_1(&dword_2090A2000, v3, v5, "FPItem bridging error: %@", (uint8_t *)&v6);

}

- (void)canPerform:()DOCNode .cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_2090A2000, v0, (uint64_t)v0, "Unsupported action: %{public}@. Falling back to FPItem: %@", v1);
  OUTLINED_FUNCTION_1();
}

- (void)canPerform:()DOCNode .cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_2090A2000, v0, (uint64_t)v0, "Unknown/Unexpected action: %{public}@. Falling back to FPItem: %@", v1);
  OUTLINED_FUNCTION_1();
}

@end
