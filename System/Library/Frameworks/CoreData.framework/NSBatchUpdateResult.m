@implementation NSBatchUpdateResult

- (id)result
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)dealloc
{
  objc_super v3;

  self->_aggregatedResult = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSBatchUpdateResult;
  -[NSBatchUpdateResult dealloc](&v3, sel_dealloc);
}

- (NSBatchUpdateResult)initWithResultType:(unint64_t)a3 andObject:(id)a4
{
  NSBatchUpdateResult *v6;
  NSBatchUpdateResult *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSBatchUpdateResult;
  v6 = -[NSBatchUpdateResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_resultType = a3;
    v6->_aggregatedResult = (id)objc_msgSend(a4, "copy");
  }
  return v7;
}

- (NSBatchUpdateResult)initWithSubresults:(id)a3
{
  NSBatchUpdateResult *v4;
  uint64_t resultType;
  uint64_t v6;
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v31;
  uint64_t v32;
  void *v33;
  id *v34;
  const __CFString **v35;
  int v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  const __CFString *v50;
  id v51;
  _BYTE v52[128];
  const __CFString *v53;
  id v54;
  _BYTE v55[128];
  const __CFString *v56;
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v49.receiver = self;
  v49.super_class = (Class)NSBatchUpdateResult;
  v4 = -[NSBatchUpdateResult init](&v49, sel_init);
  if (!v4)
    return v4;
  if (objc_msgSend(a3, "count"))
  {
    resultType = objc_msgSend((id)objc_msgSend(a3, "lastObject"), "resultType");
    v4->_resultType = resultType;
  }
  else
  {
    resultType = v4->_resultType;
  }
  if (resultType == 2)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v16 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v42 != v19)
            objc_enumerationMutation(a3);
          v21 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          v22 = v4->_resultType;
          if (v22 != objc_msgSend(v21, "resultType"))
          {
            v31 = (void *)MEMORY[0x1E0C99DA0];
            v32 = *MEMORY[0x1E0C99768];
            v53 = CFSTR("Results");
            v54 = a3;
            v33 = (void *)MEMORY[0x1E0C99D80];
            v34 = &v54;
            v35 = &v53;
            goto LABEL_49;
          }
          v18 += objc_msgSend((id)objc_msgSend(v21, "result"), "integerValue");
        }
        v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
      }
      while (v17);
    }
    else
    {
      v18 = 0;
    }
    v7 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
    goto LABEL_44;
  }
  if (resultType == 1)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v23 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
    if (!v23)
      goto LABEL_44;
    v24 = v23;
    v25 = *(_QWORD *)v38;
    while (1)
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v38 != v25)
          objc_enumerationMutation(a3);
        v27 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
        v28 = v4->_resultType;
        if (v28 != objc_msgSend(v27, "resultType"))
        {
          v31 = (void *)MEMORY[0x1E0C99DA0];
          v32 = *MEMORY[0x1E0C99768];
          v50 = CFSTR("Results");
          v51 = a3;
          v33 = (void *)MEMORY[0x1E0C99D80];
          v34 = &v51;
          v35 = &v50;
LABEL_49:
          objc_exception_throw((id)objc_msgSend(v31, "exceptionWithName:reason:userInfo:", v32, CFSTR("Mismatched result types during aggregation of batch update results"), objc_msgSend(v33, "dictionaryWithObjects:forKeys:count:", v34, v35, 1)));
        }
        v29 = (void *)objc_msgSend(v27, "result");
        if (objc_msgSend(v29, "count"))
          objc_msgSend(v7, "addObjectsFromArray:", v29);
      }
      v24 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
      if (!v24)
        goto LABEL_44;
    }
  }
  if (resultType)
    return v4;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  v7 = (id)MEMORY[0x1E0C9AAA0];
  if (!v6)
    goto LABEL_44;
  v8 = v6;
  v9 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v46;
  do
  {
    v12 = 0;
    v13 = -v9;
    v36 = v9 + v8;
    do
    {
      if (*(_QWORD *)v46 != v11)
        objc_enumerationMutation(a3);
      v14 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v12);
      v15 = v4->_resultType;
      if (v15 != objc_msgSend(v14, "resultType"))
      {
        v31 = (void *)MEMORY[0x1E0C99DA0];
        v32 = *MEMORY[0x1E0C99768];
        v56 = CFSTR("Results");
        v57 = a3;
        v33 = (void *)MEMORY[0x1E0C99D80];
        v34 = &v57;
        v35 = &v56;
        goto LABEL_49;
      }
      if (((v13 != (_DWORD)v12) & (v10 ^ 1)) != 0)
        v10 = 0;
      else
        v10 = objc_msgSend((id)objc_msgSend(v14, "result"), "BOOLValue");
      ++v12;
    }
    while (v8 != v12);
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    v9 = v36;
  }
  while (v8);
  v7 = (id)MEMORY[0x1E0C9AAA0];
  if (v10)
    v7 = (id)MEMORY[0x1E0C9AAB0];
LABEL_44:
  v4->_aggregatedResult = v7;
  return v4;
}

- (NSBatchUpdateRequestResultType)resultType
{
  return self->_resultType;
}

@end
