@implementation FPUserInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

- (FPUserInfo)initWithUserInfo:(id)a3
{
  char v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *keys;
  NSArray *v13;
  NSArray *values;
  id v16;
  id v17;

  v16 = 0;
  v17 = 0;
  v5 = FPEncodeUserInfo(a3, &v17, &v16);
  v6 = v17;
  v7 = v16;
  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPUserInfo.m"), 37, CFSTR("cannot pack user info"));

  }
  +[FPUserInfo zipWithArray1:array2:](FPUserInfo, "zipWithArray1:array2:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_50);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPUserInfo unzipKeysWithZippedArray:](FPUserInfo, "unzipKeysWithZippedArray:", v10);
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  keys = self->_keys;
  self->_keys = v11;

  +[FPUserInfo unzipValuesWithZippedArray:](FPUserInfo, "unzipValuesWithZippedArray:", v10);
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  values = self->_values;
  self->_values = v13;

  return self;
}

+ (id)unzipValuesWithZippedArray:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
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
        objc_msgSend(v12, "b", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          objc_msgSend(v12, "b");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FPUserInfo.m"), 85, CFSTR("Expected non-nil pair.b"));

          }
        }
        objc_msgSend(v12, "b");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v15);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  return v6;
}

uint64_t __51__FPUserInfo_mergeWithUserInfo_intoParentUserInfo___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "a");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FPDecodeUserInfoItem((uint64_t)v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = objc_msgSend(v3, "hasSuffix:", CFSTR(".inherited"));
  else
    v4 = 0;

  return v4;
}

+ (id)unzipKeysWithZippedArray:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
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
        objc_msgSend(v12, "a", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          objc_msgSend(v12, "a");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FPUserInfo.m"), 75, CFSTR("Expected non-nil pair.a"));

          }
        }
        objc_msgSend(v12, "a");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v15);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  return v6;
}

uint64_t __31__FPUserInfo_initWithUserInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "a");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "a");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (id)mergeWithUserInfo:(id)a3 intoParentUserInfo:(id)a4
{
  id v7;
  id v8;
  void *v9;
  FPUserInfo *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  BOOL v26;
  FPUserInfo *v27;
  FPUserInfo *v28;
  id v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  SEL v71;
  void *v72;
  void *v73;
  void *v74;
  FPUserInfo *v75;
  void *v76;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    v10 = (FPUserInfo *)v8;
    if (v7)
      goto LABEL_3;
LABEL_6:
    v27 = v10;
    goto LABEL_7;
  }
  v28 = [FPUserInfo alloc];
  v29 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  v10 = -[FPUserInfo initWithUserInfo:](v28, "initWithUserInfo:", v29);

  if (!v7)
    goto LABEL_6;
LABEL_3:
  v70 = a1;
  v71 = a2;
  v76 = v9;
  objc_msgSend(v7, "keys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "values");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPUserInfo zipWithArray1:array2:](FPUserInfo, "zipWithArray1:array2:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_33_1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v13;
  objc_msgSend(v13, "filteredArrayUsingPredicate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v73 = v15;
  objc_msgSend(v15, "objectEnumerator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPUserInfo keys](v10, "keys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v10;
  -[FPUserInfo values](v10, "values");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPUserInfo zipWithArray1:array2:](FPUserInfo, "zipWithArray1:array2:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v72 = v19;
  objc_msgSend(v19, "objectEnumerator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v16, "nextObject");
  v23 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "nextObject");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v23 == 0;
  v26 = v24 == 0;
  if (v23 | v24)
  {
    v31 = (void *)v24;
    do
    {
      if (v23 && v26)
      {
        objc_msgSend((id)v23, "a");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v32)
        {
          objc_msgSend((id)v23, "a");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v33)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", v71, v70, CFSTR("FPUserInfo.m"), 133, CFSTR("Expected non-nil nonUserInfoKey"));

          }
        }
        objc_msgSend((id)v23, "b");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v34)
        {
          objc_msgSend((id)v23, "b");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v35)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", v71, v70, CFSTR("FPUserInfo.m"), 134, CFSTR("Expected non-nil value"));

          }
        }
        objc_msgSend((id)v23, "a");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v36);

        objc_msgSend((id)v23, "b");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v37);

        objc_msgSend(v16, "nextObject");
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = 0;
      }
      else
      {
        if (v25 && v31 != 0)
        {
          objc_msgSend(v31, "a");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v40)
          {
            objc_msgSend(v31, "a");
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v41)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", v71, v70, CFSTR("FPUserInfo.m"), 139, CFSTR("Expected non-nil nextParentUserInfo.a"));

            }
          }
          objc_msgSend(v31, "b");
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v42)
          {
            objc_msgSend(v31, "b");
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v43)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", v71, v70, CFSTR("FPUserInfo.m"), 140, CFSTR("Expected non-nil nextParentUserInfo.b"));

            }
          }
          objc_msgSend(v31, "a");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v44);

          objc_msgSend(v31, "b");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v45);

          objc_msgSend(v20, "nextObject");
          v39 = objc_claimAutoreleasedReturnValue();
          v23 = 0;
          goto LABEL_37;
        }
        objc_msgSend((id)v23, "a");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "a");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v46, "compare:", v47);

        if ((unint64_t)(v48 + 1) > 1)
        {
          objc_msgSend(v31, "a");
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v56)
          {
            objc_msgSend(v31, "a");
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v57)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", v71, v70, CFSTR("FPUserInfo.m"), 157, CFSTR("Expected non-nil nextParentUserInfo.a"));

            }
          }
          objc_msgSend(v31, "b");
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v58)
          {
            objc_msgSend(v31, "b");
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v59)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", v71, v70, CFSTR("FPUserInfo.m"), 158, CFSTR("Expected non-nil nextParentUserInfo.b"));

            }
          }
          objc_msgSend(v31, "a");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v60);

          objc_msgSend(v31, "b");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v61);

          objc_msgSend(v20, "nextObject");
          v39 = objc_claimAutoreleasedReturnValue();
          goto LABEL_37;
        }
        objc_msgSend((id)v23, "a");
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v49)
        {
          objc_msgSend((id)v23, "a");
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v50)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", v71, v70, CFSTR("FPUserInfo.m"), 147, CFSTR("Expected non-nil nonUserInfo.a"));

          }
        }
        objc_msgSend((id)v23, "b");
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v51)
        {
          objc_msgSend((id)v23, "b");
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v52)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", v71, v70, CFSTR("FPUserInfo.m"), 148, CFSTR("Expected non-nil nonUserInfo.b"));

          }
        }
        objc_msgSend((id)v23, "a");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v53);

        objc_msgSend((id)v23, "b");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v54);

        if (!v48)
        {
          objc_msgSend(v20, "nextObject");
          v55 = objc_claimAutoreleasedReturnValue();

          v31 = (void *)v55;
        }
        v39 = (uint64_t)v31;
        objc_msgSend(v16, "nextObject");
        v38 = objc_claimAutoreleasedReturnValue();
      }
      v31 = (void *)v23;
      v23 = v38;
LABEL_37:

      v25 = v23 == 0;
      v26 = v39 == 0;
      v31 = (void *)v39;
    }
    while (v23 | v39);
  }
  v27 = -[FPUserInfo initWithKeys:values:]([FPUserInfo alloc], "initWithKeys:values:", v21, v22);

  v10 = v75;
  v9 = v76;
LABEL_7:

  return v27;
}

- (FPUserInfo)initWithKeys:(id)a3 values:(id)a4
{
  NSArray *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *keys;
  NSArray *v12;
  NSArray *values;
  void *v15;

  v7 = (NSArray *)a3;
  v8 = (NSArray *)a4;
  v9 = -[NSArray count](v7, "count");
  if (v9 != -[NSArray count](v8, "count"))
  {
    v10 = -[NSArray count](v7, "count");
    if (v10 != -[NSArray count](v8, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPUserInfo.m"), 53, CFSTR("Expected balancing keys and values when initing UserInfo"));

    }
  }
  keys = self->_keys;
  self->_keys = v7;
  v12 = v7;

  values = self->_values;
  self->_values = v8;

  return self;
}

+ (id)zipWithArray1:(id)a3 array2:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  FPUserInfoPair *v13;
  void *v14;
  void *v15;
  FPUserInfoPair *v16;
  void *v18;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "count");
  if (v9 != objc_msgSend(v8, "count"))
  {
    v10 = objc_msgSend(v7, "count");
    if (v10 != objc_msgSend(v8, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FPUserInfo.m"), 62, CFSTR("Expected balancing arrays when zipping arrays"));

    }
  }
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v7, "count"))
  {
    v12 = 0;
    do
    {
      v13 = [FPUserInfoPair alloc];
      objc_msgSend(v7, "objectAtIndex:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[FPUserInfoPair initWithA:b:](v13, "initWithA:b:", v14, v15);

      objc_msgSend(v11, "addObject:", v16);
      ++v12;
    }
    while (v12 < objc_msgSend(v7, "count"));
  }

  return v11;
}

- (NSDictionary)userInfo
{
  void *v3;
  void *v4;
  void *v5;

  -[FPUserInfo keys](self, "keys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPUserInfo values](self, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FPDecodeUserInfo(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (NSArray)values
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)keys
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

@end
