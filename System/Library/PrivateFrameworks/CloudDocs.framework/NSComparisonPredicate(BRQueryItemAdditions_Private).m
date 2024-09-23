@implementation NSComparisonPredicate(BRQueryItemAdditions_Private)

- (id)br_watchedURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  if (objc_msgSend(a1, "predicateOperatorType") != 4)
  {
    v5 = 0;
    v2 = 0;
    v3 = 0;
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  objc_msgSend(a1, "leftExpression");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rightExpression");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "expressionType") != 3)
    goto LABEL_8;
  objc_msgSend(v2, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("kMDItemURL.path")))
  {

    goto LABEL_7;
  }
  objc_msgSend(v2, "keyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("NSMetadataUbiquitousItemURLInLocalContainerKey.path"));

  if (!v7)
  {
LABEL_8:
    v5 = 0;
    goto LABEL_9;
  }
LABEL_7:
  if (objc_msgSend(v3, "expressionType"))
    goto LABEL_8;
  objc_msgSend(v3, "constantValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
LABEL_10:

  return v5;
}

- (id)br_urlWithWatchedChildren
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  if (objc_msgSend(a1, "predicateOperatorType") != 4)
  {
    v5 = 0;
    v2 = 0;
    v3 = 0;
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  objc_msgSend(a1, "leftExpression");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rightExpression");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "expressionType") != 3)
    goto LABEL_8;
  objc_msgSend(v2, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("kMDItemURL.URLByDeletingLastPathComponent.path")))
  {

    goto LABEL_7;
  }
  objc_msgSend(v2, "keyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("NSMetadataUbiquitousItemURLInLocalContainerKey.URLByDeletingLastPathComponent.path"));

  if (!v7)
  {
LABEL_8:
    v5 = 0;
    goto LABEL_9;
  }
LABEL_7:
  if (objc_msgSend(v3, "expressionType"))
    goto LABEL_8;
  objc_msgSend(v3, "constantValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
LABEL_10:

  return v5;
}

- (BRInodeObjectID)br_fileObjectIDWithWatchedChildren
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  BRInodeObjectID *v7;
  uint64_t v8;
  BRInodeObjectID *v9;

  if (objc_msgSend(a1, "predicateOperatorType") != 4)
  {
    v2 = 0;
    v3 = 0;
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  objc_msgSend(a1, "leftExpression");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rightExpression");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "expressionType") != 3)
    goto LABEL_7;
  objc_msgSend(v2, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("BRMetadataItemParentFileIDKey"));

  if (!v5)
    goto LABEL_7;
  objc_msgSend(v3, "constantValue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  v6 = v6;
  v7 = [BRInodeObjectID alloc];
  v8 = objc_msgSend(v6, "unsignedLongLongValue");

  v9 = -[BRInodeObjectID initWithFileID:](v7, "initWithFileID:", v8);
LABEL_9:

  return v9;
}

- (id)br_watchedFileObjectID
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  if (objc_msgSend(a1, "predicateOperatorType") != 4)
  {
    v7 = 0;
    v2 = 0;
    v3 = 0;
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  objc_msgSend(a1, "leftExpression");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rightExpression");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "expressionType") != 3
    || (objc_msgSend(v2, "keyPath"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("BRMetadataItemFileObjectIdentifierKey")),
        v4,
        !v5))
  {
    v7 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v3, "constantValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    v6 = v7;
  }
  else
  {
    v7 = 0;
  }
LABEL_9:

  return v7;
}

@end
