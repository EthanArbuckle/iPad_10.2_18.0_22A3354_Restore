@implementation GSAddition(BRCAdditions)

+ (id)additionURLForName:()BRCAdditions storagePrefix:inConflictNamespace:
{
  void **v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = (void **)MEMORY[0x1E0D25D30];
  if (!a5)
    v7 = (void **)MEMORY[0x1E0D25D00];
  v8 = *v7;
  v9 = (void *)MEMORY[0x1E0C99E98];
  v17 = a4;
  v18 = v8;
  v19 = a3;
  v10 = (void *)MEMORY[0x1E0C99D20];
  v11 = v8;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "arrayWithObjects:count:", &v17, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileURLWithPathComponents:", v14, v17, v18, v19, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (BOOL)brc_parseAdditionFilename:()BRCAdditions mangledID:itemID:etag:session:
{
  id v11;
  void *v12;
  void *v13;

  v11 = a7;
  objc_msgSend(a3, "brc_stringByDeletingPathExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCItemID parseMangledItemIDString:mangledID:etag:session:](BRCItemID, "parseMangledItemIDString:mangledID:etag:session:", v12, a4, a6, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    objc_storeStrong(a5, v13);

  return v13 != 0;
}

- (uint64_t)brc_parseMangledID:()BRCAdditions itemID:etag:session:
{
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;

  v10 = (void *)MEMORY[0x1E0D25D38];
  v11 = a6;
  objc_msgSend(a1, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "brc_parseAdditionFilename:mangledID:itemID:etag:session:", v12, a3, a4, a5, v11);

  return v13;
}

@end
