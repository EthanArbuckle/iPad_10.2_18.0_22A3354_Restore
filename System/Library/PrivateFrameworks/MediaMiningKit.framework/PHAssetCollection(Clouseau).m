@implementation PHAssetCollection(Clouseau)

- (id)cls_localStartDateComponents
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_msgSend(a1, "assetCollectionType");
  if (v2 == 6 || v2 == 3)
  {
    objc_msgSend(a1, "cls_universalStartDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "cls_localStartDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CLSCalendar dateComponentsWithUTCDate:localDate:](CLSCalendar, "dateComponentsWithUTCDate:localDate:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_legacyLocalStartDateComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)cls_localEndDateComponents
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_msgSend(a1, "assetCollectionType");
  if (v2 == 6 || v2 == 3)
  {
    objc_msgSend(a1, "cls_universalEndDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "cls_localEndDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CLSCalendar dateComponentsWithUTCDate:localDate:](CLSCalendar, "dateComponentsWithUTCDate:localDate:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_legacyLocalEndDateComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)cls_universalStartDate
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(a1, "assetCollectionType");
  if (v2 == 6 || v2 == 3)
  {
    objc_msgSend(a1, "startDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_legacyUniversalStartDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)cls_universalEndDate
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(a1, "assetCollectionType");
  if (v2 == 6 || v2 == 3)
  {
    objc_msgSend(a1, "endDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_legacyUniversalEndDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)cls_localStartDate
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(a1, "assetCollectionType");
  if (v2 == 6 || v2 == 3)
  {
    objc_msgSend(a1, "localStartDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_legacyLocalStartDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)cls_localEndDate
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(a1, "assetCollectionType");
  if (v2 == 6 || v2 == 3)
  {
    objc_msgSend(a1, "localEndDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_legacyLocalEndDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_legacyLocalStartDateComponents
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1D1796094]();
  objc_msgSend(a1, "_fetchFirstAssetSortedByCreationDateAscending:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cls_localDateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v4;
}

- (id)_legacyLocalEndDateComponents
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1D1796094]();
  objc_msgSend(a1, "_fetchFirstAssetSortedByCreationDateAscending:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cls_localDateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v4;
}

- (id)_legacyUniversalStartDate
{
  void *v4;
  void *v5;
  void *v6;

  objc_getAssociatedObject(a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(a1, "startDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v5 = (void *)MEMORY[0x1D1796094]();
      objc_msgSend(a1, "_fetchFirstAssetSortedByCreationDateAscending:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cls_universalDate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v5);
    }
    objc_setAssociatedObject(a1, a2, v4, (void *)0x301);
  }
  return v4;
}

- (id)_legacyUniversalEndDate
{
  void *v4;
  void *v5;
  void *v6;

  objc_getAssociatedObject(a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(a1, "endDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v5 = (void *)MEMORY[0x1D1796094]();
      objc_msgSend(a1, "_fetchFirstAssetSortedByCreationDateAscending:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cls_universalDate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v5);
    }
    objc_setAssociatedObject(a1, a2, v4, (void *)0x301);
  }
  return v4;
}

- (id)_legacyLocalStartDate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1D1796094]();
  objc_msgSend(a1, "_fetchFirstAssetSortedByCreationDateAscending:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cls_localDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v4;
}

- (id)_legacyLocalEndDate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1D1796094]();
  objc_msgSend(a1, "_fetchFirstAssetSortedByCreationDateAscending:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cls_localDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v4;
}

- (id)_fetchFirstAssetSortedByCreationDateAscending:()Clouseau
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v8);

  objc_msgSend(v6, "setFetchLimit:", 1);
  objc_msgSend(v6, "setIncludeGuestAssets:", 1);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", a1, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
