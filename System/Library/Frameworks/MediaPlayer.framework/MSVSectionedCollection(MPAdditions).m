@implementation MSVSectionedCollection(MPAdditions)

- (uint64_t)changeDetailsToSectionedCollection:()MPAdditions isEqualBlock:isUpdatedBlock:
{
  return objc_msgSend(a1, "changeDetailsToSectionedCollection:applyingUIKitWorkarounds:isEqualBlock:isUpdatedBlock:", a3, 1, a4, a5);
}

- (MPChangeDetails)changeDetailsToSectionedCollection:()MPAdditions applyingUIKitWorkarounds:isEqualBlock:isUpdatedBlock:
{
  id v10;
  id v11;
  id v12;
  MPChangeDetails *v13;
  id v14;
  id v15;
  id v16;
  MPChangeDetails *v17;
  MPChangeDetails *v18;
  MPChangeDetails *v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  char v25;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = [MPChangeDetails alloc];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke;
  v21[3] = &unk_1E3154250;
  v21[4] = a1;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v25 = a4;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  v17 = -[MPChangeDetails initWithBlock:](v13, "initWithBlock:", v21);
  if (-[MPChangeDetails hasChanges](v17, "hasChanges"))
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  return v19;
}

- (void)enumerateItemIdentifiersUsingBlock:()MPAdditions
{
  void (**v4)(id, void *, void *, _BYTE *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;

  v4 = a3;
  v14 = 0;
  v5 = objc_msgSend(a1, "numberOfSections");
  if (v5 >= 1)
  {
    v6 = v5;
    v7 = 0;
    do
    {
      v8 = objc_msgSend(a1, "numberOfItemsInSection:", v7);
      v9 = v14;
      if (v8 >= 1 && !v14)
      {
        v10 = v8;
        v11 = 1;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v11 - 1, v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "identifiersForItemAtIndexPath:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            v4[2](v4, v12, v13, &v14);

          v9 = v14;
          if (v11 >= v10)
            break;
          ++v11;
        }
        while (!v14);
      }
      ++v7;
    }
    while (v7 < v6 && !v9);
  }

}

- (void)enumerateSectionIdentifiersUsingBlock:()MPAdditions
{
  void (**v4)(id, uint64_t, void *, _BYTE *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;

  v4 = a3;
  v9 = 0;
  v5 = objc_msgSend(a1, "numberOfSections");
  if (v5 >= 1)
  {
    v6 = v5;
    v7 = 1;
    do
    {
      objc_msgSend(a1, "identifiersForSectionAtIndex:", v7 - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v7 - 1, v8, &v9);

      if (v7 >= v6)
        break;
      ++v7;
    }
    while (!v9);
  }

}

- (void)enumerateItemIdentifiersInSectionAtIndex:()MPAdditions usingBlock:
{
  void (**v6)(id, uint64_t, void *, _BYTE *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;

  v6 = a4;
  v12 = 0;
  v7 = objc_msgSend(a1, "numberOfItemsInSection:", a3);
  if (v7 >= 1)
  {
    v8 = v7;
    v9 = 1;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9 - 1, a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "identifiersForItemAtIndexPath:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        v6[2](v6, v9 - 1, v11, &v12);

      if (v9 >= v8)
        break;
      ++v9;
    }
    while (!v12);
  }

}

- (id)identifiersForItemAtIndexPath:()MPAdditions
{
  void *v1;
  id v2;
  void *v3;

  objc_msgSend(a1, "itemAtIndexPath:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v1, "identifiers");
    else
      +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;

  return v3;
}

- (id)identifiersForSectionAtIndex:()MPAdditions
{
  void *v1;
  id v2;
  void *v3;

  objc_msgSend(a1, "sectionAtIndex:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v1, "identifiers");
    else
      +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;

  return v3;
}

- (id)indexPathForItemWithIdentifiersIntersectingSet:()MPAdditions
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = objc_msgSend(a1, "numberOfSections");
  if (v5 < 1)
  {
    v13 = 0;
  }
  else
  {
    v6 = v5;
    v7 = 0;
    do
    {
      v8 = objc_msgSend(a1, "numberOfItemsInSection:", v7);
      if (v8 < 1)
      {
        v13 = 0;
      }
      else
      {
        v9 = v8;
        v10 = 1;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v10 - 1, v7);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "identifiersForItemAtIndexPath:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "intersectsSet:", v4))
            v13 = v11;
          else
            v13 = 0;

          if (v10 >= v9)
            break;
          ++v10;
        }
        while (!v13);
      }
      ++v7;
    }
    while (v7 < v6 && !v13);
  }

  return v13;
}

@end
