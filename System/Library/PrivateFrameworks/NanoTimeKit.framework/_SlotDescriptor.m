@implementation _SlotDescriptor

+ (id)descriptorWithComplicationFamilies:(id)a3 complicationTypesRankedList:(id)a4 allowedComplicationTypes:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        v26 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v17), "integerValue");
        do
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v26);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

        }
        while ((NTKFallbackComplicationFamilyForFamily(v26, &v26) & 1) != 0);
        ++v17;
      }
      while (v17 != v15);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v15);
  }

  v19 = objc_msgSend(v12, "copy");
  v20 = (void *)v11[1];
  v11[1] = v19;

  v21 = objc_msgSend(v9, "copy");
  v22 = (void *)v11[2];
  v11[2] = v21;

  v23 = objc_msgSend(v10, "copy");
  v24 = (void *)v11[3];
  v11[3] = v23;

  return v11;
}

- (BOOL)allowsType:(unint64_t)a3 inFace:(id)a4
{
  NSIndexSet *possibleTypes;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  possibleTypes = self->_possibleTypes;
  v6 = a4;
  v7 = (void *)-[NSIndexSet mutableCopy](possibleTypes, "mutableCopy");
  objc_msgSend(v6, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[NTKComplicationProvider providerForDevice:](NTKComplicationProvider, "providerForDevice:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "disabledComplicationTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeIndexes:", v10);
  v11 = 1;
  if (a3 && a3 != 55)
    v11 = objc_msgSend(v7, "containsIndex:", a3);

  return v11;
}

- (NSArray)typesRankedList
{
  return self->_typesRankedList;
}

- (NSIndexSet)possibleTypes
{
  return self->_possibleTypes;
}

- (NSArray)familiesRankedList
{
  return self->_familiesRankedList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleTypes, 0);
  objc_storeStrong((id *)&self->_typesRankedList, 0);
  objc_storeStrong((id *)&self->_familiesRankedList, 0);
}

- (void)enumerateAllowedFamiliesForFace:(id)a3 withBlock:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _BYTE *);
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _BYTE *))a4;
  v18 = 0;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_familiesRankedList;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v11)
        objc_enumerationMutation(v8);
      v13 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "integerValue", (_QWORD)v14);
      if (-[_SlotDescriptor allowsFamily:inFace:](self, "allowsFamily:inFace:", v13, v6))
      {
        v7[2](v7, v13, &v18);
        if (v18)
          break;
      }
      if (v10 == ++v12)
      {
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (BOOL)allowsFamily:(int64_t)a3 inFace:(id)a4
{
  void *v6;
  uint64_t v7;
  NSArray *familiesRankedList;
  void *v9;
  BOOL v10;

  objc_msgSend(a4, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "deviceCategory");

  familiesRankedList = self->_familiesRankedList;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NSArray containsObject:](familiesRankedList, "containsObject:", v9);

  if ((unint64_t)a3 > 0xC)
    goto LABEL_7;
  if (((1 << a3) & 0xDF) != 0)
    return v10;
  if (((1 << a3) & 0x1F00) != 0)
  {
    if (v7 == 1)
      return 0;
  }
  else
  {
LABEL_7:
    if (a3 != 100 && a3 != 101 && a3 != 102 && a3 != 103 && *MEMORY[0x1E0C93E90] != a3 && *MEMORY[0x1E0C93EA8] != a3)
      return 0;
  }
  return v10;
}

- (BOOL)supportsFamiliesOfComplications:(id)a3 inFace:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "complicationType"))
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58___SlotDescriptor_supportsFamiliesOfComplications_inFace___block_invoke;
    v10[3] = &unk_1E6BD4FA8;
    v11 = v6;
    v12 = v7;
    v13 = &v14;
    -[_SlotDescriptor enumerateAllowedFamiliesForFace:withBlock:](self, "enumerateAllowedFamiliesForFace:withBlock:", v12, v10);
    v8 = *((_BYTE *)v15 + 24) != 0;

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)supportsType:(unint64_t)a3
{
  return -[NSIndexSet containsIndex:](self->_possibleTypes, "containsIndex:", a3);
}

@end
