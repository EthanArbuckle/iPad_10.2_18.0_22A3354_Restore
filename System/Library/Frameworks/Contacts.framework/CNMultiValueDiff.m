@implementation CNMultiValueDiff

+ (id)emptyDiff
{
  if (emptyDiff_cn_once_token_0 != -1)
    dispatch_once(&emptyDiff_cn_once_token_0, &__block_literal_global_3);
  return (id)emptyDiff_cn_once_object_0;
}

void __29__CNMultiValueDiff_emptyDiff__block_invoke()
{
  CNMultiValueDiff *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [CNMultiValueDiff alloc];
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[CNMultiValueDiff initWithUpdates:](v0, "initWithUpdates:", v3);
  v2 = (void *)emptyDiff_cn_once_object_0;
  emptyDiff_cn_once_object_0 = v1;

}

+ (id)diffMultiValue:(id)a3 toMultiValue:(id)a4
{
  void *v4;
  CNMultiValueDiff *v5;
  CNMultiValueDiff *v6;

  +[CNCalculatesMultiValueDiff diffMultiValue:toMultiValue:](CNCalculatesMultiValueDiff, "diffMultiValue:toMultiValue:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = -[CNMultiValueDiff initWithUpdates:]([CNMultiValueDiff alloc], "initWithUpdates:", v4);
  }
  else
  {
    +[CNMultiValueDiff emptyDiff](CNMultiValueDiff, "emptyDiff");
    v5 = (CNMultiValueDiff *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (CNMultiValueDiff)initWithUpdates:(id)a3
{
  id v4;
  CNMultiValueDiff *v5;
  uint64_t v6;
  NSArray *updates;
  CNMultiValueDiff *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNMultiValueDiff;
  v5 = -[CNMultiValueDiff init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    updates = v5->_updates;
    v5->_updates = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)multiValueByApplyToMultiValue:(id)a3 withIdentifierMap:(id)a4
{
  id v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_updates;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12++), "applyToMutableMultiValue:withIdentifierMap:", v7, v6, (_QWORD)v15);
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  v13 = (void *)objc_msgSend(v7, "copy");
  return v13;
}

- (BOOL)isEmpty
{
  return -[NSArray count](self->_updates, "count") == 0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0D13A08], "descriptionForObject:withNamesAndObjects:", self->_updates, 0);
}

- (NSArray)updates
{
  return self->_updates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updates, 0);
}

- (BOOL)applyToABPerson:(void *)a3 propertyDescription:(id)a4 isUnified:(BOOL)a5 logger:(id)a6 error:(id *)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  char v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CFTypeRef cf;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v9 = a5;
  v36 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a6;
  v14 = objc_msgSend(v12, "ABMutableMultiValueForABPerson:", a3);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[CNMultiValueDiff updates](self, "updates");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(v15);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "applyToABPerson:abmultivalue:propertyDescription:isUnified:logger:error:", a3, v14, v12, v9, v13, a7))
        {

          v21 = 0;
          goto LABEL_14;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      if (v17)
        continue;
      break;
    }
  }

  cf = 0;
  v20 = objc_msgSend(v12, "setABValue:onABPerson:error:", v14, a3, &cf);
  v21 = v20;
  if (a7)
  {
    if ((v20 & 1) == 0)
    {
      v33 = CFSTR("CNKeyPaths");
      objc_msgSend(v12, "key");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNErrorFactory errorForiOSABError:](CNErrorFactory, "errorForiOSABError:", cf);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNErrorFactory errorByAddingUserInfoEntries:toError:](CNErrorFactory, "errorByAddingUserInfoEntries:toError:", v24, v25);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

      if (cf)
        CFRelease(cf);
    }
  }
LABEL_14:

  return v21;
}

@end
