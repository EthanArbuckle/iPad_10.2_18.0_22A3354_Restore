@implementation FPItem(DOCNode)

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

- (id)thumbnailIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "itemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNodeIdentifier:", v3);

  objc_msgSend(a1, "modificationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setModificationDate:", v4);

  objc_msgSend(a1, "contentVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContentVersion:", v5);

  objc_msgSend(v2, "setFolderType:", objc_msgSend(a1, "folderType"));
  objc_msgSend(v2, "setIsTopLevelSharedItem:", objc_msgSend(a1, "isTopLevelSharedItem"));
  objc_msgSend(v2, "setIsDownloaded:", objc_msgSend(a1, "isDownloaded"));
  objc_msgSend(a1, "filename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFileExtension:", v7);

  objc_msgSend(v2, "setIsActionable:", objc_msgSend(a1, "isActionable"));
  return v2;
}

- (id)contentVersion
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "itemVersion");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contentVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)fetchFPItem:()DOCNode
{
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a3 + 16))(a3, a1, 0);
}

- (id)cachedDomain
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDC82F8];
  objc_msgSend(a1, "providerDomainID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "providerDomainWithID:cachePolicy:error:", v2, 3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)nodeURL
{
  return 0;
}

- (uint64_t)isRootItem
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "itemIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDC8228]) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(a1, "fp_isCloudDocsContainer");

  return v3;
}

- (uint64_t)doc_folderIconType
{
  uint64_t result;

  result = objc_msgSend(a1, "folderType");
  switch(result)
  {
    case 1:
      if ((objc_msgSend(a1, "isTopLevelSharedItem") & 1) != 0)
      {
        result = 5;
      }
      else if (objc_msgSend(a1, "doc_isSMBSharepoint"))
      {
        result = 6;
      }
      else
      {
        result = 1;
      }
      break;
    case 2:
    case 3:
    case 4:
      return result;
    default:
      result = 0;
      break;
  }
  return result;
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
    objc_msgSend(a1, "parentItemIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC8228]);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)isAnyParentTrashed
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "fileURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR(".Trash"));

  return v3;
}

- (id)deepItemCount
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "childItemCount");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v1, "intValue") + 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (uint64_t)isFullyFormed
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(a1, "creationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", -534528000.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "isEqual:", v3);

  }
  else
  {
    v4 = objc_msgSend(a1, "isCopying");
  }

  return v4 ^ 1u;
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
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "fpfs_fpItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "localizedStandardTagsCompare:", v4);

  return v5;
}

- (void)encodeNodeWithCoder:()DOCNode
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", 0, CFSTR("DOCNodeEncodedTypeKey"));
  objc_msgSend(v4, "encodeObject:forKey:", a1, CFSTR("DOCNodeEncodedObjectKey"));

}

- (void)fetchParent:()DOCNode
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __31__FPItem_DOCNode__fetchParent___block_invoke;
  v8[3] = &unk_24C0FE778;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "fetchParentsForItemID:recursively:completionHandler:", v6, 0, v8);

}

- (void)fetchParents:()DOCNode
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __32__FPItem_DOCNode__fetchParents___block_invoke;
  v8[3] = &unk_24C0FE778;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "fetchParentsForItemID:recursively:completionHandler:", v6, 1, v8);

}

- (void)fetchURL:()DOCNode
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __28__FPItem_DOCNode__fetchURL___block_invoke;
  v7[3] = &unk_24C0FE7A0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchURLForItem:completionHandler:", a1, v7);

}

- (uint64_t)canPerform:()DOCNode
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((id)*MEMORY[0x24BDC7D80] == v4)
  {
    v9 = objc_msgSend(a1, "capabilities");
    v8 = (*MEMORY[0x24BDC8210] & ~v9) == 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = a1;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eligibleActionsForItems:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "containsObject:", v4);
  }

  return v8;
}

- (id)doc_fallbackSortIdentity
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "providerItemIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "domainIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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

@end
