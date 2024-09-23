@implementation FPNonEvictableItemsQueryDescriptor

- (id)name
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NEVC");
}

- (id)queryStringForMountPoint:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[FPSpotlightQueryDescriptor settings](self, "settings", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowedFileTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FPSpotlightQueryDescriptor settings](self, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "excludedFileTypes");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v7)
    v10 = (void *)v7;
  else
    v10 = (void *)MEMORY[0x1E0C9AA60];
  v11 = v10;

  v12 = (void *)MEMORY[0x1E0CB3940];
  FPContentTypeQueryStringForFileTypes(v5, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)*MEMORY[0x1E0CEC4F0], "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  FPContentTypeQueryStringForFileTypes(v9, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("(%@) && ((%@) || ((%@) && (%@)))"), v13, CFSTR("FPItemIsPinned == \"1\"), v16, CFSTR("FPItemIsInPinnedFolder == \"0\" && FPEvictable == \"0\" && FPDownloaded == \"1\"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (unint64_t)desiredCount
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;

  -[FPSpotlightQueryDescriptor settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "desiredNumberOfItems");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &unk_1E448E938;
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  return v7;
}

- (void)augmentQueryContext:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)FPNonEvictableItemsQueryDescriptor;
  v13 = a3;
  -[FPSpotlightQueryDescriptor augmentQueryContext:](&v19, sel_augmentQueryContext_);
  FPFileSizeAttributes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_new();
  v5 = 10000000000;
  do
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v14;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("InRange(%@, %lu, %lu)"), *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), v5, 10 * v5 - 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v8);
    }

    v12 = v5 > 0x13;
    v5 /= 0xAuLL;
  }
  while (v12);
  objc_msgSend(v13, "setRankingQueries:", v4);

}

@end
