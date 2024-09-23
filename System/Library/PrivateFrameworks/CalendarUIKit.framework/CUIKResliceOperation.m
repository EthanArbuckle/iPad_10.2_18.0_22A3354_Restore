@implementation CUIKResliceOperation

- (Class)_inverseOperationClass
{
  return 0;
}

- (id)_objectsForInverse
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  EKUndoSliceOutcome *v10;
  void *v11;
  EKUndoSliceOutcome *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CUIKUserOperation objects](self, "objects", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v10 = [EKUndoSliceOutcome alloc];
        objc_msgSend(v9, "originalPostSliceDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[EKUndoSliceOutcome initWithOriginalPostSliceDescription:](v10, "initWithOriginalPostSliceDescription:", v11);

        objc_msgSend(v3, "addObject:", v12);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)_executeWithUndoDelegate:(id)a3 error:(id *)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
