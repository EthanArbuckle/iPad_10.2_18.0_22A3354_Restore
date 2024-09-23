@implementation MFAttachment(NSItemProvider)

+ (id)writableTypeIdentifiersForItemProvider
{
  void *v0;
  void *v1;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)*MEMORY[0x1E0CEC498], "identifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)writableTypeIdentifiersForItemProvider
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fileUTType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC4A0], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (!v5)
  {
    v6 = v3;
    if (!v3)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(v2, "addObject:", v6);
    goto LABEL_6;
  }
  objc_msgSend((id)*MEMORY[0x1E0CEC498], "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_5;
LABEL_3:
  objc_msgSend((id)objc_opt_class(), "writableTypeIdentifiersForItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v7);

LABEL_6:
  return v2;
}

- (uint64_t)loadDataWithTypeIdentifier:()NSItemProvider forItemProviderCompletionHandler:
{
  void (**v5)(id, void *, id);
  void *v6;
  id v7;
  id v9;

  v5 = a4;
  v9 = 0;
  objc_msgSend(a1, "fetchDataSynchronously:stripPrivateMetadata:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  v5[2](v5, v6, v7);

  return 0;
}

@end
