@implementation IKJSDataSource

- (id)asPrivateIKJSDataSource
{
  IKJSDataSource *v3;

  if (-[IKJSDataSource conformsToProtocol:](self, "conformsToProtocol:", &unk_1F01EDAC0))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (IKJSDataSource)initWithItems:(id)a3
{
  return -[IKJSDataSource initWithItems:indexTitles:](self, "initWithItems:indexTitles:", a3, 0);
}

- (IKJSDataSource)initWithItems:(id)a3 indexTitles:(id)a4
{
  return -[IKJSDataSource initWithItems:indexTitles:segmentSize:](self, "initWithItems:indexTitles:segmentSize:", a3, a4, 0);
}

- (IKJSDataSource)initWithItems:(id)a3 indexTitles:(id)a4 segmentSize:(int64_t)a5
{
  id v8;
  IKJSDataSource *v9;
  void *v10;
  void *v11;
  int64_t v12;
  uint64_t v13;
  NSMutableArray *dataSourceViewPointers;
  uint64_t v15;
  NSMutableIndexSet *loadedSegmentIndexes;
  uint64_t v17;
  NSMutableDictionary *loadIndexesRequestsBySegmentIndex;
  objc_super v20;

  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)IKJSDataSource;
  v9 = -[IKJSDataObservable initWithTargetValue:](&v20, sel_initWithTargetValue_, a3);
  if (v9)
  {
    v10 = (void *)objc_msgSend(v8, "copy");
    v11 = v10;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v9->_indexTitles, v11);
    if (!v10)

    v12 = 20;
    if (a5 > 0)
      v12 = a5;
    v9->_segmentSize = v12;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    dataSourceViewPointers = v9->_dataSourceViewPointers;
    v9->_dataSourceViewPointers = (NSMutableArray *)v13;

    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v15 = objc_claimAutoreleasedReturnValue();
    loadedSegmentIndexes = v9->_loadedSegmentIndexes;
    v9->_loadedSegmentIndexes = (NSMutableIndexSet *)v15;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    loadIndexesRequestsBySegmentIndex = v9->_loadIndexesRequestsBySegmentIndex;
    v9->_loadIndexesRequestsBySegmentIndex = (NSMutableDictionary *)v17;

    -[IKJSDataSource _resetLoadedSegments](v9, "_resetLoadedSegments");
  }

  return v9;
}

- (id)valuesForSubscripts:(_NSRange)a3 boxed:(BOOL)a4
{
  _BOOL4 v6;
  NSUInteger length;
  NSUInteger location;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *i;
  void *v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  IKDataSubscript *v21;
  void *v22;
  void *v23;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL || a3.length == 0)
    return 0;
  v6 = a4;
  length = a3.length;
  location = a3.location;
  -[IKJSDataObservable targetValue](self, "targetValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (length == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v9, "valueForProperty:", CFSTR("length"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isNumber"))
    {
      objc_msgSend(v11, "toNumber");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      length = objc_msgSend(v12, "integerValue");

    }
    else
    {
      length = 0;
    }

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", length);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); length; --length)
  {
    objc_msgSend(v10, "valueAtIndex:", location);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKJSDataObservable toDataObservable:](IKJSDataObservable, "toDataObservable:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
      v16 = 1;
    else
      v16 = !v6;
    if (v16)
    {
      v17 = (void *)v15;
      if (!v15)
        goto LABEL_24;
    }
    else
    {
      v25 = 0;
      +[IKJSDataObservable toDataObservable:proxy:](IKJSDataObservable, "toDataObservable:proxy:", v14, &v25);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v25;
      v19 = v18;
      if (v17)
      {
        objc_msgSend(v10, "setValue:atIndex:", v18, location);
        v20 = v19;

        v14 = v20;
      }

      if (!v17)
        goto LABEL_24;
    }
    v21 = -[IKDataSubscript initWithSubscriptIndex:]([IKDataSubscript alloc], "initWithSubscriptIndex:", location);
    v26[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setParent:accessorSequence:", self, v22);

LABEL_24:
    objc_msgSend(i, "addObject:", v14);

    ++location;
  }
  if (objc_msgSend(i, "count"))
    v23 = (void *)objc_msgSend(i, "copy");
  else
    v23 = 0;

  return v23;
}

+ (id)makeDataSource:(id)a3 :(id)a4 :(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "ikdt_isArray") & 1) != 0)
  {
    v10 = objc_alloc((Class)a1);
    objc_msgSend(a1, "_titlesByIndexFromValue:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithItems:indexTitles:segmentSize:", v8, v11, a5);

    objc_msgSend(v12, "exportValue");
  }
  else
  {
    +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setException:withErrorMessage:", 0, CFSTR("DataSource: Invalid args; construct with an array"));

    v14 = (void *)MEMORY[0x1E0CBE108];
    objc_msgSend(MEMORY[0x1E0CBE0F0], "currentContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "valueWithNullInContext:", v12);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (int64_t)length
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[IKJSDataObservable targetValue](self, "targetValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForProperty:", CFSTR("length"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isNumber"))
  {
    objc_msgSend(v3, "toNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)item:(int64_t)a3
{
  void *v4;
  void *v5;

  -[IKJSDataObservable targetValue](self, "targetValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)update:(id)a3 :(id)a4 :(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  id v13;

  v13 = a3;
  v8 = a4;
  if ((objc_msgSend(v13, "ikdt_isArray") & 1) != 0)
  {
    -[IKJSDataObservable targetValue](self, "targetValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSDataObservable setTargetValue:](self, "setTargetValue:", v13);
    objc_msgSend((id)objc_opt_class(), "_titlesByIndexFromValue:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&self->_indexTitles, v11);
    if (!v10)

    v12 = 20;
    if (a5 > 0)
      v12 = a5;
    self->_segmentSize = v12;
    -[IKJSDataSource _resetLoadedSegments](self, "_resetLoadedSegments");
    -[IKJSDataSource _resetUsedIndexesAndMigrateItems:](self, "_resetUsedIndexesAndMigrateItems:", v9);
    -[IKJSDataObservable touchPathWithAccessorSequence:extraInfo:](self, "touchPathWithAccessorSequence:extraInfo:", MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setException:withErrorMessage:", 0, CFSTR("DataSource: Invalid args; update with an array"));
  }

}

- (void)insert:(int64_t)a3 :(id)a4 :(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  IKChangeSet *v17;
  void *v18;
  IKChangeSet *v19;
  id v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (a3 < 0 || -[IKJSDataSource length](self, "length") < a3)
  {
    -[IKJSObject appContext](self, "appContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("insert: index out of bounds");
LABEL_4:
    objc_msgSend(v10, "setException:withErrorMessage:", 0, v12);

    goto LABEL_5;
  }
  if ((objc_msgSend(v8, "ikdt_isArray") & 1) == 0)
  {
    -[IKJSObject appContext](self, "appContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("insert: items must be an array");
    goto LABEL_4;
  }
  objc_msgSend(v8, "valueForProperty:", CFSTR("length"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "toNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "integerValue");

  if (v15 < 1)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", a3, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = [IKChangeSet alloc];
  v18 = (void *)objc_msgSend(v16, "copy");
  v19 = -[IKChangeSet initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:](v17, "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", v18, 0, 0, 0);

  v20 = -[IKJSDataSource _spliceAtIndex:deleteCount:insertions:](self, "_spliceAtIndex:deleteCount:insertions:", a3, 0, v8);
  if ((objc_msgSend(v9, "isString") & 1) != 0)
  {
    objc_msgSend(v9, "toString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSDataSource _updateTitlesFromIndex:deleteCount:insertionCount:title:](self, "_updateTitlesFromIndex:deleteCount:insertionCount:title:", a3, 0, v15, v21);

  }
  else
  {
    -[IKJSDataSource _updateTitlesFromIndex:deleteCount:insertionCount:title:](self, "_updateTitlesFromIndex:deleteCount:insertionCount:title:", a3, 0, v15, 0);
  }
  -[IKJSDataSource _didAdjustSegmentIndexesFromIndex:](self, "_didAdjustSegmentIndexesFromIndex:", -[IKJSDataSource _segmentIndexForItemIndex:](self, "_segmentIndexForItemIndex:", a3));
  v23 = CFSTR("changeSet");
  v24[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSDataObservable touchPathWithAccessorSequence:extraInfo:](self, "touchPathWithAccessorSequence:extraInfo:", MEMORY[0x1E0C9AA60], v22);

LABEL_5:
}

- (id)delete:(int64_t)a3 :(int64_t)a4
{
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  IKChangeSet *v16;
  void *v17;
  IKChangeSet *v18;
  void *v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (a3 < 0 || -[IKJSDataSource length](self, "length") <= a3)
  {
    -[IKJSObject appContext](self, "appContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("insert: index out of bounds");
    goto LABEL_6;
  }
  if (a4 + a3 > -[IKJSDataSource length](self, "length"))
  {
    -[IKJSObject appContext](self, "appContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("insert: deleteCount out of bounds");
LABEL_6:
    objc_msgSend(v7, "setException:withErrorMessage:", 0, v9);

    v10 = (void *)MEMORY[0x1E0CBE108];
    -[IKJSObject appContext](self, "appContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "jsContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueWithUndefinedInContext:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return v13;
  }
  if (a4 < 1)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", a3, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = [IKChangeSet alloc];
  v17 = (void *)objc_msgSend(v15, "copy");
  v18 = -[IKChangeSet initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:](v16, "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", 0, v17, 0, 0);

  -[IKJSDataSource _spliceAtIndex:deleteCount:insertions:](self, "_spliceAtIndex:deleteCount:insertions:", a3, a4, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSDataSource _updateTitlesFromIndex:deleteCount:insertionCount:title:](self, "_updateTitlesFromIndex:deleteCount:insertionCount:title:", a3, a4, 0, 0);
  -[IKJSDataSource _didAdjustSegmentIndexesFromIndex:](self, "_didAdjustSegmentIndexesFromIndex:", -[IKJSDataSource _segmentIndexForItemIndex:](self, "_segmentIndexForItemIndex:", a3));
  v20 = CFSTR("changeSet");
  v21[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSDataObservable touchPathWithAccessorSequence:extraInfo:](self, "touchPathWithAccessorSequence:extraInfo:", MEMORY[0x1E0C9AA60], v19);

  return v13;
}

- (id)replace:(int64_t)a3 :(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  int64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  IKChangeSet *v23;
  void *v24;
  IKChangeSet *v25;
  void *v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3 < 0 || -[IKJSDataSource length](self, "length") <= a3)
  {
    -[IKJSObject appContext](self, "appContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("replace: index out of bounds");
    goto LABEL_7;
  }
  if ((objc_msgSend(v6, "ikdt_isArray") & 1) == 0)
  {
    -[IKJSObject appContext](self, "appContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("replace: items must be an array");
    goto LABEL_7;
  }
  objc_msgSend(v6, "valueForProperty:", CFSTR("length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "toNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if (v9 + a3 > -[IKJSDataSource length](self, "length"))
  {
    -[IKJSObject appContext](self, "appContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("replace: items length out of bounds");
LABEL_7:
    objc_msgSend(v10, "setException:withErrorMessage:", 0, v12);

    v13 = (void *)MEMORY[0x1E0CBE108];
    -[IKJSObject appContext](self, "appContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "jsContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueWithUndefinedInContext:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  if (v9 < 1)
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = a3;
    v20 = v9;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, v22);

      ++v19;
      --v20;
    }
    while (v20);
  }
  v23 = [IKChangeSet alloc];
  v24 = (void *)objc_msgSend(v18, "copy");
  v25 = -[IKChangeSet initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:](v23, "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", 0, 0, 0, v24);

  -[IKJSDataSource _spliceAtIndex:deleteCount:insertions:](self, "_spliceAtIndex:deleteCount:insertions:", a3, v9, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = CFSTR("changeSet");
  v28[0] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSDataObservable touchPathWithAccessorSequence:extraInfo:](self, "touchPathWithAccessorSequence:extraInfo:", MEMORY[0x1E0C9AA60], v26);

LABEL_8:
  return v16;
}

- (void)move:(int64_t)a3 :(int64_t)a4 :(int64_t)a5 :(id)a6
{
  id v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  int64_t v14;
  uint64_t v15;
  void *v16;
  int64_t v17;
  int64_t v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  IKChangeSet *v23;
  void *v24;
  IKChangeSet *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  int64_t v30;
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  if (a3 < 0 || -[IKJSDataSource length](self, "length") <= a3)
  {
    -[IKJSObject appContext](self, "appContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("move: oldIndex out of bounds");
    goto LABEL_6;
  }
  if (a5 + a3 > -[IKJSDataSource length](self, "length"))
  {
    -[IKJSObject appContext](self, "appContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("move: count out of bounds");
LABEL_6:
    objc_msgSend(v11, "setException:withErrorMessage:", 0, v13);

    goto LABEL_7;
  }
  if (a4 < 0 || -[IKJSDataSource length](self, "length") - a5 < a4)
  {
    -[IKJSObject appContext](self, "appContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("move: newIndex out of bounds");
    goto LABEL_6;
  }
  if (a3 >= a4)
    v14 = a4;
  else
    v14 = a3;
  -[IKJSDataSource _didAdjustSegmentIndexesFromIndex:](self, "_didAdjustSegmentIndexesFromIndex:", -[IKJSDataSource _segmentIndexForItemIndex:](self, "_segmentIndexForItemIndex:", v14));
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", a5);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (a5 >= 1)
    {
      v30 = a4;
      v17 = a3;
      v18 = a4;
      v19 = a5;
      v20 = (void *)v15;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, v22);

        ++v18;
        ++v17;
        --v19;
      }
      while (v19);
      v16 = v20;
      a4 = v30;
    }
  }
  else
  {
    v16 = 0;
  }
  v23 = [IKChangeSet alloc];
  v24 = (void *)objc_msgSend(v16, "copy");
  v25 = -[IKChangeSet initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:](v23, "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", 0, 0, v24, 0);

  -[IKJSDataSource _spliceAtIndex:deleteCount:insertions:](self, "_spliceAtIndex:deleteCount:insertions:", a3, a5, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[IKJSDataSource _spliceAtIndex:deleteCount:insertions:](self, "_spliceAtIndex:deleteCount:insertions:", a4, 0, v26);
  -[IKJSDataSource _updateTitlesFromIndex:deleteCount:insertionCount:title:](self, "_updateTitlesFromIndex:deleteCount:insertionCount:title:", a3, a5, 0, 0);
  if ((objc_msgSend(v10, "isString") & 1) != 0)
  {
    objc_msgSend(v10, "toString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSDataSource _updateTitlesFromIndex:deleteCount:insertionCount:title:](self, "_updateTitlesFromIndex:deleteCount:insertionCount:title:", a4, 0, a5, v28);

  }
  else
  {
    -[IKJSDataSource _updateTitlesFromIndex:deleteCount:insertionCount:title:](self, "_updateTitlesFromIndex:deleteCount:insertionCount:title:", a4, 0, a5, 0);
  }
  v31 = CFSTR("changeSet");
  v32[0] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSDataObservable touchPathWithAccessorSequence:extraInfo:](self, "touchPathWithAccessorSequence:extraInfo:", MEMORY[0x1E0C9AA60], v29);

LABEL_7:
}

- (id)boxedItem:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;

  -[IKJSDataObservable targetValue](self, "targetValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKJSDataObservable toDataObservable:](IKJSDataObservable, "toDataObservable:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v14 = 0;
    +[IKJSDataObservable toDataObservable:proxy:](IKJSDataObservable, "toDataObservable:proxy:", v6, &v14);
    v8 = objc_claimAutoreleasedReturnValue();
    v7 = v14;
    if (!v8)
    {
      v12 = 0;
      goto LABEL_5;
    }
    objc_msgSend(v5, "setValue:atIndex:", v7, a3);

    v7 = (id)v8;
  }
  v9 = (void *)MEMORY[0x1E0CBE108];
  -[IKJSObject appContext](self, "appContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "jsContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueWithObject:inContext:", v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
  return v12;
}

+ (id)jsExportedProperties
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPrivileged");

  if (v4)
  {
    objc_msgSend(&unk_1E9F8C398, "arrayByAddingObject:", CFSTR("boxedItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &unk_1E9F8C398;
  }
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___IKJSDataSource;
  objc_msgSendSuper2(&v9, sel_jsExportedProperties);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)extraInfoForChangeInPathWithAccessorSequence:(id)a3 extraInfo:(id)a4
{
  void *v4;
  uint64_t v5;
  IKChangeSet *v6;
  void *v7;
  void *v8;
  void *v9;
  IKChangeSet *v10;
  void *v11;
  const __CFString *v13;
  IKChangeSet *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "subscriptIndex");
    v6 = [IKChangeSet alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[IKChangeSet initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:](v6, "initWithAddedIndexes:removedIndexes:movedIndexesByNewIndex:updatedIndexesByNewIndex:", 0, 0, 0, v9);

    v13 = CFSTR("changeSet");
    v14 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)addDataSourceView:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[IKJSDataSource dataSourceViewPointers](self, "dataSourceViewPointers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  -[IKJSDataSource markDataSourceViewsUpdated](self, "markDataSourceViewsUpdated");
}

- (void)removeDataSourceView:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[IKJSDataSource dataSourceViewPointers](self, "dataSourceViewPointers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v5);

  -[IKJSDataSource markDataSourceViewsUpdated](self, "markDataSourceViewsUpdated");
}

- (void)markDataSourceViewsUpdated
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (!self->_dataSourceViewsDirty)
  {
    self->_dataSourceViewsDirty = 1;
    objc_initWeak(&location, self);
    -[IKJSObject appContext](self, "appContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __44__IKJSDataSource_markDataSourceViewsUpdated__block_invoke;
    v4[3] = &unk_1E9F4BE58;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v3, "addPostEvaluateBlock:", v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __44__IKJSDataSource_markDataSourceViewsUpdated__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[80])
  {
    WeakRetained[80] = 0;
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_loadUsedIndexes");
    WeakRetained = v2;
  }

}

+ (id)_titlesByIndexFromValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  if (objc_msgSend(v3, "ikdt_isArray"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    if (v7 >= 1)
    {
      for (i = 0; i != v7; ++i)
      {
        objc_msgSend(v3, "valueAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isString"))
        {
          objc_msgSend(v9, "toString");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);

        }
      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_spliceAtIndex:(int64_t)a3 deleteCount:(int64_t)a4 insertions:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[IKJSDataObservable targetValue](self, "targetValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invokeMethod:withArguments:", CFSTR("splice"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invokeMethod:withArguments:", CFSTR("slice"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("length"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "toObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "integerValue");

    if (v19 >= 1)
    {
      for (i = 0; i != v19; ++i)
      {
        objc_msgSend(v8, "valueAtIndex:", i);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setValue:atIndex:", v21, a3 + i);

      }
    }
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("length"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "toObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "integerValue");

    if (v24 >= 1)
    {
      v25 = 0;
      v26 = v19 + a3;
      do
      {
        objc_msgSend(v16, "valueAtIndex:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setValue:atIndex:", v27, v26 + v25);

        ++v25;
      }
      while (v24 != v25);
    }

  }
  return v13;
}

- (void)_updateTitlesFromIndex:(int64_t)a3 deleteCount:(int64_t)a4 insertionCount:(int64_t)a5 title:(id)a6
{
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  int64_t v19;
  int64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSDictionary *indexTitles;
  IKJSDataSource *v27;
  id v28;
  id obj;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v28 = a6;
  -[IKJSDataSource indexTitles](self, "indexTitles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = self;
  v10 = -[IKJSDataSource length](self, "length");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v9, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingSelector:", sel_compare_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v12;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v33;
LABEL_3:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v15)
        objc_enumerationMutation(obj);
      v17 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v16), "integerValue");
      v18 = v17 - a3;
      if (v17 - a3 >= a4)
        v18 = a4;
      v19 = a5;
      if (v17 < a3)
      {
        v19 = 0;
        v18 = 0;
      }
      v20 = v17 - v18 + v19;
      if (v20 >= v10)
        break;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v22, v23);

      if (v14 == ++v16)
      {
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v14)
          goto LABEL_3;
        break;
      }
    }
  }

  if (v28)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v28, v24);

  }
  v25 = objc_msgSend(v31, "copy");
  indexTitles = v27->_indexTitles;
  v27->_indexTitles = (NSDictionary *)v25;

}

- (void)_loadUsedIndexes
{
  unint64_t v3;
  double v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t i;
  unint64_t v12;
  uint64_t v13;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  IKJSDataSource *v39;
  void *v40;
  int64_t obj;
  id obja;
  _QWORD v43[4];
  id v44;
  id v45;
  IKJSDataSource *v46;
  double v47;
  unint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = -[IKJSDataSource length](self, "length");
  v4 = (double)-[IKJSDataSource segmentSize](self, "segmentSize");
  -[IKJSDataSource loadIndexesRequestsBySegmentIndex](self, "loadIndexesRequestsBySegmentIndex");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSDataSource loadedSegmentIndexes](self, "loadedSegmentIndexes");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = self;
  -[IKJSDataSource _dataSourceViews](self, "_dataSourceViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  v37 = v6;
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v54;
    v10 = (uint64_t)(v4 * 0.5);
    obj = ~v3;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v54 != v9)
          objc_enumerationMutation(v6);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "usedIndexRange");
        if (v12 != 0x7FFFFFFFFFFFFFFFLL && v13 != 0)
        {
          v15 = v12;
          v16 = v13;
          v17 = v12 + v13;
          v18 = v3 - (v12 + v13);
          if (v3 >= v12 + v13)
          {
            if (v12 >= v10)
              v24 = (uint64_t)(v4 * 0.5);
            else
              v24 = v12;
            if (v18 >= v10)
              v18 = (uint64_t)(v4 * 0.5);
            v21 = (unint64_t)((double)(v12 - v24) / v4);
            v23 = (double)(v12 - v24) - (double)v21 * v4 + (double)(v24 + v13 + v18) + v4;
          }
          else
          {
            v19 = v17 + obj;
            if (v17 + obj >= v10)
              v19 = (uint64_t)(v4 * 0.5);
            if (v3 - v13 - v19 >= v10)
              v20 = (uint64_t)(v4 * 0.5);
            else
              v20 = v3 - v13 - v19;
            objc_msgSend(v5, "addIndexesInRange:", (unint64_t)((double)(v12 - v19) / v4), (unint64_t)(((double)(v12 - v19)- (double)(unint64_t)((double)(v12 - v19) / v4) * v4+ (double)(v3 - (v12 - v19))+ v4+ -1.0)/ v4));
            v21 = 0;
            v22 = v16 - v3 + v15 + v20;
            v6 = v37;
            v23 = v4 + (double)v22;
          }
          objc_msgSend(v5, "addIndexesInRange:", v21, (unint64_t)((v23 + -1.0) / v4));
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v8);
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v40, "allKeys");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v50;
    v38 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v50 != v27)
          objc_enumerationMutation(obja);
        v29 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
        if ((objc_msgSend(v5, "containsIndex:", objc_msgSend(v29, "integerValue")) & 1) == 0)
        {
          objc_msgSend(v40, "objectForKeyedSubscript:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "cancel");
          -[IKJSObject appContext](v39, "appContext");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "jsContext");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v32, "virtualMachine");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "removeManagedReference:withOwner:", v30, v39);

          v27 = v38;
          objc_msgSend(v40, "removeObjectForKey:", v29);

        }
      }
      v26 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v26);
  }

  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __34__IKJSDataSource__loadUsedIndexes__block_invoke;
  v43[3] = &unk_1E9F4D238;
  v47 = v4;
  v48 = v3;
  v44 = v36;
  v45 = v40;
  v46 = v39;
  v34 = v40;
  v35 = v36;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v43);

}

void __34__IKJSDataSource__loadUsedIndexes__block_invoke(uint64_t a1, void *a2)
{
  double v4;
  unint64_t v5;
  unint64_t v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  IKJSDataSourceLoadIndexesRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, int);
  void *v23;
  id v24[2];
  id location;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v4 = *(double *)(a1 + 56);
  v5 = (unint64_t)(v4 * (double)(unint64_t)a2);
  v6 = *(_QWORD *)(a1 + 64) - v5;
  if (v4 >= (double)v6)
    v7 = (double)v6;
  else
    v7 = *(double *)(a1 + 56);
  if ((objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2) & 1) == 0)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = -[IKJSDataSourceLoadIndexesRequest initWithDataSource:range:]([IKJSDataSourceLoadIndexesRequest alloc], "initWithDataSource:range:", *(_QWORD *)(a1 + 48), v5, (unint64_t)v7);
      objc_initWeak(&location, *(id *)(a1 + 48));
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __34__IKJSDataSource__loadUsedIndexes__block_invoke_2;
      v23 = &unk_1E9F4D210;
      objc_copyWeak(v24, &location);
      v24[1] = a2;
      -[IKJSDataSourceLoadIndexesRequest setCompletion:](v11, "setCompletion:", &v20);
      v12 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2, v20, v21, v22, v23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

      objc_msgSend(*(id *)(a1 + 48), "appContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "jsContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "virtualMachine");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addManagedReference:withOwner:", v11, *(_QWORD *)(a1 + 48));

      v17 = *(void **)(a1 + 48);
      v26[0] = CFSTR("request");
      v26[1] = CFSTR("target");
      v27[0] = v11;
      objc_msgSend(v17, "exportValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "invokeListeners:extraInfo:", CFSTR("loadindexes"), v19);

      objc_destroyWeak(v24);
      objc_destroyWeak(&location);

    }
  }
}

void __34__IKJSDataSource__loadUsedIndexes__block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v14 = WeakRetained;
    objc_msgSend(WeakRetained, "loadIndexesRequestsBySegmentIndex");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (a2)
    {
      objc_msgSend(v14, "loadedSegmentIndexes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addIndex:", *(_QWORD *)(a1 + 40));

      objc_msgSend(v14, "appContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "jsContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "virtualMachine");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeManagedReference:withOwner:", v7, v14);

      objc_msgSend(v14, "loadIndexesRequestsBySegmentIndex");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObjectForKey:", v13);

    }
    WeakRetained = v14;
  }

}

- (void)_didAdjustSegmentIndexesFromIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[IKJSDataSource loadIndexesRequestsBySegmentIndex](self, "loadIndexesRequestsBySegmentIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSDataSource loadedSegmentIndexes](self, "loadedSegmentIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v12, "integerValue") >= a3)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "cancel");

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v9);
  }
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __52__IKJSDataSource__didAdjustSegmentIndexesFromIndex___block_invoke;
  v27[3] = &__block_descriptor_40_e12_B24__0Q8_B16l;
  v27[4] = a3;
  objc_msgSend(v6, "indexesPassingTest:", v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v6;
  objc_msgSend(v6, "removeIndexes:", v14);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[IKJSDataSource _dataSourceViews](self, "_dataSourceViews");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
        v21 = objc_msgSend(v20, "usedIndexRange");
        if (v21 != 0x7FFFFFFFFFFFFFFFLL
          && -[IKJSDataSource _segmentIndexForItemIndex:](self, "_segmentIndexForItemIndex:", v21) >= a3)
        {
          objc_msgSend(v20, "reset");
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    }
    while (v17);
  }

}

BOOL __52__IKJSDataSource__didAdjustSegmentIndexesFromIndex___block_invoke(uint64_t a1, unint64_t a2)
{
  return *(_QWORD *)(a1 + 32) <= a2;
}

- (id)_dataSourceViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[IKJSDataSource dataSourceViewPointers](self, "dataSourceViewPointers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[IKJSDataSource dataSourceViewPointers](self, "dataSourceViewPointers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10++), "pointerValue"));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v11 = (void *)objc_msgSend(v5, "copy");
  return v11;
}

- (int64_t)_segmentIndexForItemIndex:(int64_t)a3
{
  return a3 / -[IKJSDataSource segmentSize](self, "segmentSize");
}

- (void)_resetLoadedSegments
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  unint64_t v14;
  void *v15;
  char v16;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = -[IKJSDataSource length](self, "length");
  v4 = -[IKJSDataSource segmentSize](self, "segmentSize");
  v5 = vcvtpd_s64_f64((double)v3 / (double)v4);
  -[IKJSDataSource loadedSegmentIndexes](self, "loadedSegmentIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllIndexes");

  if (v5 >= 1)
  {
    v7 = 0;
    v8 = 1;
    v29 = v5;
    do
    {
      v9 = v7 * v4;
      v10 = v3 - v7 * v4;
      if (v4 < v10)
        v10 = v4;
      v11 = v10 + v9;
      if (v9 < v10 + v9)
      {
        v12 = v3;
        v13 = 0;
        v14 = v8;
        do
        {
          -[IKJSDataSource item:](self, "item:", v14 - 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v15, "isNull") & 1) != 0)
          {
            v3 = v12;
            v5 = v29;
            goto LABEL_14;
          }
          v16 = objc_msgSend(v15, "isUndefined");
          v13 |= v16;

          if ((v16 & 1) != 0)
            break;
        }
        while (v14++ < v11);
        v3 = v12;
        v5 = v29;
        if ((v13 & 1) != 0)
          goto LABEL_15;
      }
      -[IKJSDataSource loadedSegmentIndexes](self, "loadedSegmentIndexes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addIndex:", v7);
LABEL_14:

LABEL_15:
      ++v7;
      v8 += v4;
    }
    while (v7 != v5);
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[IKJSDataSource loadIndexesRequestsBySegmentIndex](self, "loadIndexesRequestsBySegmentIndex");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v24, "cancel");
        -[IKJSObject appContext](self, "appContext");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "jsContext");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "virtualMachine");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "removeManagedReference:withOwner:", v24, self);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v21);
  }

  -[IKJSDataSource loadIndexesRequestsBySegmentIndex](self, "loadIndexesRequestsBySegmentIndex");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "removeAllObjects");

}

- (void)_resetUsedIndexesAndMigrateItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  void *v18;
  void *v19;
  IKJSDataSource *v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IKJSDataObservable targetValue](self, "targetValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForProperty:", CFSTR("length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "toInt32");

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v20 = self;
  -[IKJSDataSource _dataSourceViews](self, "_dataSourceViews");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v22 = *(_QWORD *)v25;
    v23 = v7;
    v10 = v7 - 1;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "usedIndexRange");
        if (v13 >= v10)
          v15 = v10;
        else
          v15 = v13;
        if (v14 >= v23 - v15)
          v16 = v23 - v15;
        else
          v16 = v14;
        if (v16)
          v17 = v15 >= v16;
        else
          v17 = 1;
        if (!v17)
        {
          do
          {
            objc_msgSend(v5, "valueAtIndex:", v15);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v18, "isNull") & 1) != 0 || objc_msgSend(v18, "isUndefined"))
            {
              objc_msgSend(v4, "valueAtIndex:", v15);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setValue:atIndex:", v19, v15);

            }
            ++v15;
          }
          while (v16 != v15);
        }
        objc_msgSend(v12, "reset");
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }

  v20->_dataSourceViewsDirty = 0;
}

- (int64_t)segmentSize
{
  return self->_segmentSize;
}

- (NSDictionary)indexTitles
{
  return self->_indexTitles;
}

- (NSMutableArray)dataSourceViewPointers
{
  return self->_dataSourceViewPointers;
}

- (NSMutableDictionary)loadIndexesRequestsBySegmentIndex
{
  return self->_loadIndexesRequestsBySegmentIndex;
}

- (NSMutableIndexSet)loadedSegmentIndexes
{
  return self->_loadedSegmentIndexes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedSegmentIndexes, 0);
  objc_storeStrong((id *)&self->_loadIndexesRequestsBySegmentIndex, 0);
  objc_storeStrong((id *)&self->_dataSourceViewPointers, 0);
  objc_storeStrong((id *)&self->_indexTitles, 0);
}

@end
