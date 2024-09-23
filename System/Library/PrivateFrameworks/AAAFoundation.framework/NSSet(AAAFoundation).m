@implementation NSSet(AAAFoundation)

+ (id)aaf_empty
{
  if (aaf_empty__aaf_onceToken != -1)
    dispatch_once(&aaf_empty__aaf_onceToken, &__block_literal_global_1);
  return (id)aaf_empty__aaf_empty;
}

- (BOOL)aaf_hasObjects
{
  return objc_msgSend(a1, "count") != 0;
}

- (id)aaf_filter:()AAAFoundation
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  if (objc_msgSend(a1, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(a1, "count"));
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __35__NSSet_AAAFoundation__aaf_filter___block_invoke;
    v12 = &unk_1E99464B0;
    v13 = v5;
    v14 = v4;
    v6 = v5;
    objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v9);
    v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "aaf_empty");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)aaf_map:()AAAFoundation
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__NSSet_AAAFoundation__aaf_map___block_invoke;
  v8[3] = &unk_1E99464D8;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "aaf_mapStoppable:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)aaf_mapStoppable:()AAAFoundation
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  if (objc_msgSend(a1, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(a1, "count"));
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __41__NSSet_AAAFoundation__aaf_mapStoppable___block_invoke;
    v12 = &unk_1E99464B0;
    v13 = v5;
    v14 = v4;
    v6 = v5;
    objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v9);
    v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "aaf_empty");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)aaf_setByRemovingObject:()AAAFoundation
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  if (!objc_msgSend(a1, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "aaf_empty");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!v4 || (objc_msgSend(a1, "containsObject:", v4) & 1) == 0)
  {
    v7 = objc_msgSend(a1, "copy");
LABEL_7:
    v6 = (void *)v7;
    goto LABEL_8;
  }
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "removeObject:", v4);
  v6 = (void *)objc_msgSend(v5, "copy");

LABEL_8:
  return v6;
}

- (id)aaf_setByRemovingObjectsFromSet:()AAAFoundation
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  if (!objc_msgSend(a1, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "aaf_empty");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v6 = (void *)v7;
    goto LABEL_7;
  }
  if (!objc_msgSend(v4, "count"))
  {
    v7 = objc_msgSend(a1, "copy");
    goto LABEL_6;
  }
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "minusSet:", v4);
  v6 = (void *)objc_msgSend(v5, "copy");

LABEL_7:
  return v6;
}

@end
