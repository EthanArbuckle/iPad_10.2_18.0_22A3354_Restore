@implementation __NSCFURLSessionTaskDependencyTreeNode

- (__NSCFURLSessionTaskDependencyTreeNode)init
{
  __NSCFURLSessionTaskDependencyTreeNode *v2;
  void *v3;
  SEL v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)__NSCFURLSessionTaskDependencyTreeNode;
  v2 = -[__NSCFURLSessionTaskDependencyTreeNode init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    objc_setProperty_nonatomic(v2, v4, v3, 16);
  }
  return v2;
}

- (void)dealloc
{
  SEL v3;
  SEL v4;
  SEL v5;
  SEL v6;
  SEL v7;
  objc_super v8;

  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 8);
    objc_setProperty_nonatomic(self, v3, 0, 16);
    objc_setProperty_nonatomic(self, v4, 0, 24);
    objc_setProperty_nonatomic(self, v5, 0, 32);
    objc_setProperty_nonatomic(self, v6, 0, 40);
    objc_setProperty_nonatomic(self, v7, 0, 48);
  }
  v8.receiver = self;
  v8.super_class = (Class)__NSCFURLSessionTaskDependencyTreeNode;
  -[__NSCFURLSessionTaskDependencyTreeNode dealloc](&v8, sel_dealloc);
}

- (uint64_t)buildTree:(void *)a3 parentsToDependencies:(void *)a4 parentsToChildren:
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __NSCFURLSessionTaskDependencyTreeNode *v12;
  void *v13;
  const char *v14;
  void *v15;
  SEL v16;
  SEL v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v7 = result;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = *(id *)(result + 24);
    result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (result)
    {
      v8 = result;
      v9 = *(_QWORD *)v20;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
          v12 = objc_alloc_init(__NSCFURLSessionTaskDependencyTreeNode);
          v13 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", v11);
          if (v12)
          {
            objc_setProperty_nonatomic(v12, v14, v13, 8);
            v15 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", v11);
            objc_setProperty_nonatomic(v12, v16, v15, 24);
            objc_msgSend(a3, "removeObjectForKey:", v11);
            -[__NSCFURLSessionTaskDependencyTreeNode buildTree:parentsToDependencies:parentsToChildren:](v12, a2, a3, a4);
            objc_setProperty_nonatomic(v12, v17, 0, 24);
          }
          else
          {
            objc_msgSend(a4, "objectForKeyedSubscript:", v11);
            objc_msgSend(a3, "removeObjectForKey:", v11);
          }
          objc_msgSend(*(id *)(v7 + 16), "addObject:", v12);
          ++v10;
        }
        while (v8 != v10);
        result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v8 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)makePriorityInfoStartingFromStreamID:(uint64_t)a3 parentStream:(void *)a4 priorityInfo:(void *)a5 dependentToParentStreamIDs:(void *)a6 parentToParentStreamIDs:
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __NSURLSessionTaskDependencyResourceIdentifier *v19;
  void *v20;
  __NSURLSessionTaskDependencyResourceIdentifier *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[6];

  v37[5] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v11 = result;
    v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *a2);
    if (objc_msgSend(a4, "count"))
    {
      v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
      v34[0] = CFSTR("parentStreamID");
      v34[1] = CFSTR("weight");
      v35[0] = v13;
      v35[1] = &unk_1E152A6E8;
      v34[2] = CFSTR("exclusive");
      v35[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(v11 + 8), "exclusive"));
      v35[3] = v12;
      v34[3] = CFSTR("streamID");
      v34[4] = CFSTR("path");
      v14 = *(_QWORD *)(v11 + 8);
      if (v14)
      {
        v15 = *(_QWORD *)(v14 + 16);
        if (v15)
        {
          v14 = *(_QWORD *)(v15 + 8);
          if (!v14)
            v14 = *(_QWORD *)(v15 + 16);
        }
        else
        {
          v14 = 0;
        }
      }
      v35[4] = v14;
      objc_msgSend(a4, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 5));
      v16 = *(_QWORD *)(v11 + 8);
      if (v16)
        v17 = *(_QWORD *)(v16 + 16);
      else
        v17 = 0;
      objc_msgSend(a5, "setObject:forKeyedSubscript:", v13, v17);
      v18 = *(_QWORD *)(v11 + 8);
      if (v18)
        v19 = *(__NSURLSessionTaskDependencyResourceIdentifier **)(v18 + 16);
      else
        v19 = 0;
    }
    else
    {
      v20 = *(void **)(v11 + 32);
      if (!v20)
        v20 = &unk_1E152A6B8;
      v36[0] = CFSTR("parentStreamID");
      v36[1] = CFSTR("weight");
      v37[0] = v20;
      v37[1] = &unk_1E152A6D0;
      v36[2] = CFSTR("exclusive");
      v36[3] = CFSTR("streamID");
      v37[2] = MEMORY[0x1E0C9AAA0];
      v37[3] = v12;
      v36[4] = CFSTR("path");
      v37[4] = CFSTR("/");
      objc_msgSend(a4, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 5));
      v21 = objc_alloc_init(__NSURLSessionTaskDependencyResourceIdentifier);
      v19 = v21;
      if (v21)
        objc_setProperty_nonatomic(v21, v22, CFSTR("/"), 8);
    }
    objc_msgSend(a6, "setObject:forKeyedSubscript:", v12, v19);
    v23 = *a2;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v24 = *(void **)(v11 + 16);
    result = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (result)
    {
      v25 = result;
      v26 = *(_QWORD *)v30;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v30 != v26)
            objc_enumerationMutation(v24);
          v28 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v27);
          *a2 += 2;
          -[__NSCFURLSessionTaskDependencyTreeNode makePriorityInfoStartingFromStreamID:parentStream:priorityInfo:dependentToParentStreamIDs:parentToParentStreamIDs:](v28, a2, v23, a4, a5, a6);
          ++v27;
        }
        while (v25 != v27);
        result = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        v25 = result;
      }
      while (result);
    }
  }
  return result;
}

@end
