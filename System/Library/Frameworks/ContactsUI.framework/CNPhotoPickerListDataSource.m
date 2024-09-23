@implementation CNPhotoPickerListDataSource

+ (id)symbolImageNameForAddItemType:(unint64_t)a3
{
  if (a3 < 3)
    return off_1E204B0E8[a3];
  NSLog(CFSTR("CNPhotoPickerListDataSource: addItemType can not be found"), a2);
  return 0;
}

+ (double)getAddItemsSectionHeight
{
  return 180.0;
}

+ (CGSize)getSuggestionItemSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 86.0;
  v3 = 86.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (unint64_t)itemsPerRowForSection:(int64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[CNPhotoPickerDataSource providerGroups](self, "providerGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "itemsPerRow");
  return v6;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  int v13;
  unint64_t v14;
  unint64_t v15;

  if (a3 < 0)
    return 0;
  -[CNPhotoPickerDataSource providerGroups](self, "providerGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
    return 0;
  -[CNPhotoPickerDataSource providerGroups](self, "providerGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "groupType") || objc_msgSend(v8, "numberOfItems") <= 0)
  {
    -[CNPhotoPickerDataSource groupIsCollapsedState](self, "groupIsCollapsedState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 <= a3)
    {
      v14 = 0;
    }
    else
    {
      -[CNPhotoPickerDataSource groupIsCollapsedState](self, "groupIsCollapsedState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "BOOLValue");

      if (v13)
      {
        v14 = 2 * -[CNPhotoPickerListDataSource itemsPerRowForSection:](self, "itemsPerRowForSection:", a3);
        v15 = objc_msgSend(v8, "numberOfItems");
        if (v14 >= v15)
          v14 = v15;
      }
      else
      {
        v14 = objc_msgSend(v8, "numberOfItems");
      }
    }
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

@end
