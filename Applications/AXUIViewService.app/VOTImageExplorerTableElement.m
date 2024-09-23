@implementation VOTImageExplorerTableElement

- (unint64_t)accessibilityRowCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerTableElement filteredSubfeaturesWithFeatureType:](self, "filteredSubfeaturesWithFeatureType:", 9));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (unint64_t)accessibilityColumnCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerTableElement filteredSubfeaturesWithFeatureType:](self, "filteredSubfeaturesWithFeatureType:", 10));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (id)accessibilityHeaderElementsForColumn:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerTableElement filteredColumnHeaders](self, "filteredColumnHeaders", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "columnIndex") == (id)a3)
          objc_msgSend(v5, "axSafelyAddObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)accessibilityDataTableCellElementForRow:(unint64_t)a3 column:(unint64_t)a4
{
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerTableElement accessibilityElements](self, "accessibilityElements", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "rowIndex") == (id)a3 && objc_msgSend(v11, "columnIndex") == (id)a4)
        {
          v12 = v11;
          goto LABEL_12;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (id)filteredSubfeaturesWithFeatureType:(int64_t)a3
{
  void *v5;
  int *v6;
  id *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerElement feature](self, "feature"));

  if (v5)
  {
    v6 = &OBJC_IVAR___VOTImageExplorerTableElement__filteredColumnFeatures;
    if (a3 == 9)
      v6 = &OBJC_IVAR___VOTImageExplorerTableElement__filteredRowFeatures;
    v7 = (id *)((char *)&self->super.super.super.super.super.isa + *v6);
    v8 = *v7;
    if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerElement feature](self, "feature"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subfeatures"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000096F8;
      v14[3] = &unk_100024948;
      v14[4] = a3;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v14));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "filteredArrayUsingPredicate:", v11));

      objc_storeStrong(v7, v12);
      return v12;
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (int64_t)accessibilityContainerType
{
  return 1;
}

- (id)accessibilityIdentifier
{
  return CFSTR("VOTImageExplorerTableElement");
}

- (NSArray)filteredColumnHeaders
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *filteredColumnHeaders;

  if (!self->_filteredColumnHeaders)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerTableElement accessibilityElements](self, "accessibilityElements"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_100024988));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerTableElement accessibilityElements](self, "accessibilityElements"));
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filteredArrayUsingPredicate:", v4));
      filteredColumnHeaders = self->_filteredColumnHeaders;
      self->_filteredColumnHeaders = v6;

    }
  }
  return self->_filteredColumnHeaders;
}

- (void)setFilteredColumnHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_filteredColumnHeaders, a3);
}

- (NSArray)filteredRowFeatures
{
  return self->_filteredRowFeatures;
}

- (void)setFilteredRowFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_filteredRowFeatures, a3);
}

- (NSArray)filteredColumnFeatures
{
  return self->_filteredColumnFeatures;
}

- (void)setFilteredColumnFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_filteredColumnFeatures, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredColumnFeatures, 0);
  objc_storeStrong((id *)&self->_filteredRowFeatures, 0);
  objc_storeStrong((id *)&self->_filteredColumnHeaders, 0);
}

@end
