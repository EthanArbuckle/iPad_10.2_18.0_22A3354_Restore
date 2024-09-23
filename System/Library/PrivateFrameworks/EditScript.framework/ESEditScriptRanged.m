@implementation ESEditScriptRanged

- (ESEditScriptRanged)initWithOperationPrecedence:(int64_t)a3 dataClass:(Class)a4 chunkSize:(int64_t)a5 stringA:(id)a6 stringB:(id)a7 orderAtomsAscending:(BOOL)a8 options:(int64_t)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  ESEditScriptRanged *v17;
  uint64_t v18;
  ESEditScriptData *itemAData;
  uint64_t v20;
  ESEditScriptData *itemBData;
  objc_super v23;

  v9 = a8;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)ESEditScriptRanged;
  v17 = -[ESEditScript initWithOperationPrecedence:orderAtomsAscending:](&v23, sel_initWithOperationPrecedence_orderAtomsAscending_, a3, v9);
  if (v17)
  {
    -[objc_class EditScriptDataWithString:chunkSize:](a4, "EditScriptDataWithString:chunkSize:", v15, a5);
    v18 = objc_claimAutoreleasedReturnValue();
    itemAData = v17->super._itemAData;
    v17->super._itemAData = (ESEditScriptData *)v18;

    -[objc_class EditScriptDataWithString:chunkSize:](a4, "EditScriptDataWithString:chunkSize:", v16, a5);
    v20 = objc_claimAutoreleasedReturnValue();
    itemBData = v17->super._itemBData;
    v17->super._itemBData = (ESEditScriptData *)v20;

    v17->_options = a9;
  }

  return v17;
}

- (NSString)stringA
{
  return (NSString *)-[ESEditScriptData stringValue](self->super._itemAData, "stringValue");
}

- (NSString)stringB
{
  return (NSString *)-[ESEditScriptData stringValue](self->super._itemBData, "stringValue");
}

+ (id)editScriptFromString:(id)a3 toString:(id)a4
{
  return (id)objc_msgSend(a1, "editScriptFromString:toString:chunkSize:orderAtomsAscending:operationPrecedence:options:", a3, a4, 0, 0, -1, 1);
}

+ (id)editScriptFromString:(id)a3 toString:(id)a4 chunkSize:(int64_t)a5 orderAtomsAscending:(BOOL)a6 operationPrecedence:(int64_t)a7 options:(int64_t)a8
{
  _BOOL8 v10;
  __CFString *v13;
  __CFString *v14;
  ESEditScriptRanged *v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v10 = a6;
  v13 = (__CFString *)a3;
  v14 = (__CFString *)a4;
  v15 = -[ESEditScriptRanged initWithOperationPrecedence:dataClass:chunkSize:stringA:stringB:orderAtomsAscending:options:]([ESEditScriptRanged alloc], "initWithOperationPrecedence:dataClass:chunkSize:stringA:stringB:orderAtomsAscending:options:", a7, objc_opt_class(), a5, v13, v14, v10, a8);
  if (v13)
    v16 = v13;
  else
    v16 = &stru_24F475E38;
  if (v14)
    v17 = v14;
  else
    v17 = &stru_24F475E38;
  if (-[__CFString length](v16, "length"))
  {
    v18 = -[__CFString length](v17, "length");
    if ((a8 & 1) != 0 && !v18)
      goto LABEL_10;
LABEL_12:
    -[ESEditScript computeDistanceMatrix](v15, "computeDistanceMatrix");
    -[ESEditScript computeEditsFromMatrix](v15, "computeEditsFromMatrix");
    goto LABEL_13;
  }
  if ((a8 & 1) == 0)
    goto LABEL_12;
LABEL_10:
  -[ESEditScript script](v15, "script");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ESAtomRanged atomWithEditRange:replacementText:](ESAtomRanged, "atomWithEditRange:replacementText:", 0, -[__CFString length](v16, "length"), v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v20);

LABEL_13:
  return v15;
}

- (id)applyToString:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  if (v4)
    v5 = v4;
  else
    v5 = &stru_24F475E38;
  v6 = (void *)-[__CFString mutableCopy](v5, "mutableCopy");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[ESEditScript script](self, "script", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "editRange");
        v15 = v14;
        objc_msgSend(v12, "replacementText");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "replaceCharactersInRange:withString:", v13, v15, v16);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)initializeCurrentScriptAtom
{
  ESAtomRanged *currentScriptAtom;

  currentScriptAtom = self->_currentScriptAtom;
  self->_currentScriptAtom = 0;

}

- (void)addToCurrentScriptAtomEditOperation:(int64_t)a3 editIndex:(unint64_t)a4 newText:(id)a5 indexInArrayB:(unint64_t)a6
{
  ESAtomRanged *currentScriptAtom;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  ESAtomRanged *v16;
  id v17;

  v17 = a5;
  if (self->super._currentOperation != a3 || (self->_options & 1) == 0)
  {
    -[ESEditScriptRanged finalizeCurrentScriptAtom](self, "finalizeCurrentScriptAtom");
    self->super._currentOperation = a3;
  }
  if (a3)
  {
    currentScriptAtom = self->_currentScriptAtom;
    if (a3 == 2)
    {
      v10 = 0;
      if (currentScriptAtom)
      {
LABEL_7:
        v11 = -[ESAtomRanged editRange](self->_currentScriptAtom, "editRange");
        -[ESAtomRanged editRange](self->_currentScriptAtom, "editRange");
        -[ESAtomRanged setEditRange:](self->_currentScriptAtom, "setEditRange:", v11 - v10, v12 + v10);
        v13 = (void *)MEMORY[0x24BDD17C8];
        -[ESAtomRanged replacementText](self->_currentScriptAtom, "replacementText");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@%@"), v17, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[ESAtomRanged setReplacementText:](self->_currentScriptAtom, "setReplacementText:", v15);

LABEL_10:
        goto LABEL_11;
      }
    }
    else
    {
      v10 = -[ESEditScriptData lengthOfItem:](self->super._itemAData, "lengthOfItem:", a4 - 1);
      if (currentScriptAtom)
        goto LABEL_7;
    }
    +[ESAtomRanged atomWithEditRange:replacementText:](ESAtomRanged, "atomWithEditRange:replacementText:", -[ESEditScriptData characterIndexForItem:](self->super._itemAData, "characterIndexForItem:", a4) - v10, v10, v17);
    v16 = (ESAtomRanged *)objc_claimAutoreleasedReturnValue();
    v14 = self->_currentScriptAtom;
    self->_currentScriptAtom = v16;
    goto LABEL_10;
  }
LABEL_11:

}

- (void)finalizeCurrentScriptAtom
{
  ESAtomRanged *currentScriptAtom;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  ESAtomRanged *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  currentScriptAtom = self->_currentScriptAtom;
  if (currentScriptAtom)
  {
    if (self->super._orderAtomsAscending)
    {
      -[ESAtomRanged replacementText](currentScriptAtom, "replacementText");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "length");
      -[ESAtomRanged editRange](self->_currentScriptAtom, "editRange");
      v7 = v6;

      v8 = v5 - v7;
      if (v5 != v7)
      {
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        -[ESEditScript script](self, "script", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v20;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v20 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
              v15 = objc_msgSend(v14, "editRange");
              objc_msgSend(v14, "setEditRange:", v8 + v15, v16);
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          }
          while (v11);
        }

      }
      -[ESEditScript script](self, "script");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "insertObject:atIndex:", self->_currentScriptAtom, 0);
    }
    else
    {
      -[ESEditScript script](self, "script");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", self->_currentScriptAtom);
    }

    v18 = self->_currentScriptAtom;
    self->_currentScriptAtom = 0;

  }
}

- (void)removeAnyOverlapBetweenIndexOfFirstDifference:(int64_t *)a3 andReverseIndexOfLastDifference:(int64_t *)a4 shouldShortenFirstDifference:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  int64_t v13;
  int64_t *v14;

  v5 = a5;
  v9 = -[ESEditScriptData length](self->super._itemAData, "length");
  v10 = -[ESEditScriptData length](self->super._itemBData, "length");
  if (v9 >= v10)
    v11 = v10;
  else
    v11 = v9;
  v12 = *a3;
  v13 = *a3 - v11 + *a4;
  if (v13 >= 1)
  {
    if (v5)
    {
      v14 = a3;
    }
    else
    {
      v12 = *a4;
      v14 = a4;
    }
    *v14 = (v12 - v13) & ~((v12 - v13) >> 63);
  }
}

- (void)computeSmallestSingleEdit
{
  ESEditScriptData *itemAData;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  itemAData = self->super._itemAData;
  v17 = 0;
  v16 = -[ESEditScriptData indexOfFirstDifferenceWithOtherData:shouldReverseIterate:fallsOnWordBoundary:](itemAData, "indexOfFirstDifferenceWithOtherData:shouldReverseIterate:fallsOnWordBoundary:", self->super._itemBData, 0, &v17);
  if (v16 != -1)
  {
    v15 = -[ESEditScriptData indexOfFirstDifferenceWithOtherData:shouldReverseIterate:fallsOnWordBoundary:](self->super._itemAData, "indexOfFirstDifferenceWithOtherData:shouldReverseIterate:fallsOnWordBoundary:", self->super._itemBData, 1, 0);
    -[ESEditScriptRanged removeAnyOverlapBetweenIndexOfFirstDifference:andReverseIndexOfLastDifference:shouldShortenFirstDifference:](self, "removeAnyOverlapBetweenIndexOfFirstDifference:andReverseIndexOfLastDifference:shouldShortenFirstDifference:", &v16, &v15, v17 == 0);
    v4 = -[ESEditScriptData length](self->super._itemAData, "length");
    v5 = v4 - v15;
    v6 = -[ESEditScriptData length](self->super._itemBData, "length");
    v7 = v6 - v15;
    v8 = -[ESEditScriptData characterIndexForItem:](self->super._itemAData, "characterIndexForItem:", v16);
    v9 = -[ESEditScriptData characterIndexForItem:](self->super._itemAData, "characterIndexForItem:", v5);
    v10 = -[ESEditScriptData characterIndexForItem:](self->super._itemBData, "characterIndexForItem:", v7) - v8;
    -[ESEditScriptData stringValue](self->super._itemBData, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "substringWithRange:", v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[ESAtomRanged atomWithEditRange:replacementText:](ESAtomRanged, "atomWithEditRange:replacementText:", v8, v9 - v8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ESEditScript script](self, "script");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v13);

  }
}

+ (id)editScriptForSmallestSingleEditFromString:(id)a3 toString:(id)a4
{
  return (id)objc_msgSend(a1, "editScriptForSmallestSingleEditFromString:toString:chunkSize:", a3, a4, 0);
}

+ (id)editScriptForSmallestSingleEditFromString:(id)a3 toString:(id)a4 chunkSize:(int64_t)a5
{
  id v7;
  id v8;
  ESEditScriptRanged *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[ESEditScriptRanged initWithOperationPrecedence:dataClass:chunkSize:stringA:stringB:orderAtomsAscending:options:]([ESEditScriptRanged alloc], "initWithOperationPrecedence:dataClass:chunkSize:stringA:stringB:orderAtomsAscending:options:", -1, objc_opt_class(), a5, v8, v7, 1, 1);

  -[ESEditScriptRanged computeSmallestSingleEdit](v9, "computeSmallestSingleEdit");
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentScriptAtom, 0);
}

@end
