@implementation FigCaptureProcessHandle

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

+ (id)handleForAuditToken:(id *)a3 error:(id *)a4
{
  id v6;
  __int128 v7;
  _OWORD v9[2];

  v6 = objc_alloc((Class)a1);
  v7 = *(_OWORD *)&a3->var0[4];
  v9[0] = *(_OWORD *)a3->var0;
  v9[1] = v7;
  return (id)objc_msgSend(v6, "_initWithAuditToken:error:", v9, a4);
}

- (id)_initWithAuditToken:(id *)a3 error:(id *)a4
{
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  __int128 v11;
  __int128 v12;
  void *v13;

  v13 = 0;
  v7 = *(_OWORD *)&a3->var0[4];
  v11 = *(_OWORD *)a3->var0;
  v12 = v7;
  v8 = objc_msgSend(MEMORY[0x1E0D87D68], "handleForIdentifier:error:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", FigCaptureGetPIDFromAuditToken(&v11)), &v13);
  if (v8)
  {
    v9 = *(_OWORD *)&a3->var0[4];
    v11 = *(_OWORD *)a3->var0;
    v12 = v9;
    return -[FigCaptureProcessHandle _initWithRBSProcessHandle:bundleRecord:](self, "_initWithRBSProcessHandle:bundleRecord:", v8, objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForAuditToken:error:", &v11, 0));
  }
  else
  {
    FigDebugAssert3();
    if (a4)
    {
      if (v13)
        *a4 = v13;
    }

    return 0;
  }
}

+ (id)handleForPID:(int)a3 error:(id *)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithPID:error:", *(_QWORD *)&a3, a4);
}

- (id)_initWithPID:(int)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  _BYTE v10[32];
  void *v11;

  v11 = 0;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0D87D68], "handleForIdentifier:error:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3), &v11);
  if (v6)
  {
    v7 = v6;
    v8 = (void *)MEMORY[0x1E0CA5898];
    objc_msgSend(v6, "auditToken");
    return -[FigCaptureProcessHandle _initWithRBSProcessHandle:bundleRecord:](self, "_initWithRBSProcessHandle:bundleRecord:", v7, objc_msgSend(v8, "bundleRecordForAuditToken:error:", v10, 0));
  }
  else
  {
    FigDebugAssert3();
    if (a4)
    {
      if (v11)
        *a4 = v11;
    }

    return 0;
  }
}

- (id)_initWithRBSProcessHandle:(id)a3 bundleRecord:(id)a4
{
  FigCaptureProcessHandle *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FigCaptureProcessHandle;
  v6 = -[FigCaptureProcessHandle init](&v8, sel_init);
  if (v6)
  {
    v6->_rbsProcessHandle = (RBSProcessHandle *)a3;
    v6->_bundleRecord = (LSBundleRecord *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureProcessHandle;
  -[FigCaptureProcessHandle dealloc](&v3, sel_dealloc);
}

- (id)debugDescription
{
  void *v3;
  NSString *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("pid: %d"), -[FigCaptureProcessHandle pid](self, "pid"));
  v4 = -[FigCaptureProcessHandle bundleIdentifier](self, "bundleIdentifier");
  if (v4)
    objc_msgSend(v3, "appendFormat:", CFSTR(", bundleID: %@"), v4);
  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[FigCaptureProcessHandle debugDescription](self, "debugDescription"));
}

- (int)pid
{
  return -[RBSProcessHandle pid](self->_rbsProcessHandle, "pid");
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_rbsProcessHandle;
  if (result)
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)-[$115C4C562B26FF47E01F9F4EA65B5887 auditToken](result, "auditToken");
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_msgSend((id)-[RBSProcessHandle bundle](self->_rbsProcessHandle, "bundle"), "identifier");
}

- (NSString)extensionPointIdentifier
{
  return (NSString *)objc_msgSend((id)-[RBSProcessHandle bundle](self->_rbsProcessHandle, "bundle"), "extensionPointIdentifier");
}

- (NSString)extensionContainingAppBundleIdentifier
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)objc_msgSend((id)-[LSBundleRecord containingBundleRecord](self->_bundleRecord, "containingBundleRecord"), "bundleIdentifier");
  else
    return 0;
}

- (RBSProcessHandle)rbsProcessHandle
{
  return self->_rbsProcessHandle;
}

- (id)rbsProcessMonitorForEndowmentNamespace:(id)a3 serviceClass:(unsigned int)a4 updateHandler:(id)a5
{
  _QWORD v6[7];
  unsigned int v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __107__FigCaptureProcessHandle_RunningBoard__rbsProcessMonitorForEndowmentNamespace_serviceClass_updateHandler___block_invoke;
  v6[3] = &unk_1E4927CE0;
  v6[4] = a3;
  v6[5] = self;
  v7 = a4;
  v6[6] = a5;
  return (id)objc_msgSend(MEMORY[0x1E0D87D90], "monitorWithConfiguration:", v6);
}

uint64_t __107__FigCaptureProcessHandle_RunningBoard__rbsProcessMonitorForEndowmentNamespace_serviceClass_updateHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
  v7[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "setEndowmentNamespaces:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1));
  objc_msgSend(v4, "setValues:", 32);
  objc_msgSend(a2, "setStateDescriptor:", v4);
  v6 = objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingIdentifier:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "pid")));
  objc_msgSend(a2, "setPredicates:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1));
  objc_msgSend(a2, "setServiceClass:", *(unsigned int *)(a1 + 56));
  return objc_msgSend(a2, "setUpdateHandler:", *(_QWORD *)(a1 + 48));
}

- (FigCaptureProcessHandle)nonRootSourceProcessHandleForVisibilityEndowment
{
  uint64_t v3;

  v3 = -[FigCaptureProcessHandle _nonRootSourcePIDForVisibilityEndowmentWithTree:](self, "_nonRootSourcePIDForVisibilityEndowmentWithTree:", objc_msgSend(MEMORY[0x1E0D87CF0], "endowmentTreeForNamespace:", *MEMORY[0x1E0D22E58]));
  if ((_DWORD)v3 == -[FigCaptureProcessHandle pid](self, "pid"))
    return self;
  if ((_DWORD)v3 == -1)
    return 0;
  return (FigCaptureProcessHandle *)+[FigCaptureProcessHandle handleForPID:error:](FigCaptureProcessHandle, "handleForPID:error:", v3, 0);
}

- (int)_nonRootSourcePIDForVisibilityEndowmentWithTree:(id)a3
{
  id v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  int v21;
  uint64_t v22;
  FigCaptureProcessHandle *v23;
  id v24;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v3 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = (id)objc_msgSend(a3, "rootLinks");
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (!v5)
    return -1;
  v6 = v5;
  v7 = *(_QWORD *)v32;
  v21 = -1;
  v8 = 0x1E0C99000uLL;
  v23 = self;
  v24 = v3;
  v22 = *(_QWORD *)v32;
  do
  {
    v9 = 0;
    v25 = v6;
    do
    {
      if (*(_QWORD *)v32 != v7)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
      v11 = -[FigCaptureProcessHandle _ancestorPathWithinEndowmentTree:root:visitedLinks:](self, "_ancestorPathWithinEndowmentTree:root:visitedLinks:", v3, v10, objc_msgSend(*(id *)(v8 + 3680), "set"));
      if (v11)
      {
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v12 = (void *)objc_msgSend(v11, "reverseObjectEnumerator");
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v28;
          while (2)
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v28 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
              objc_msgSend(v17, "sourcePid");
              v18 = (void *)BSBundleIDForPID();
              v19 = objc_msgSend(v17, "sourcePid");
              if (v19 == objc_msgSend(v10, "sourcePid")
                || objc_msgSend(v18, "isEqualToString:", 0x1E493D878))
              {
                v21 = objc_msgSend(v17, "targetPid");
                goto LABEL_18;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            if (v14)
              continue;
            break;
          }
LABEL_18:
          self = v23;
          v3 = v24;
          v7 = v22;
          v6 = v25;
          v8 = 0x1E0C99000;
        }
      }
      ++v9;
    }
    while (v9 != v6);
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  }
  while (v6);
  return v21;
}

- (id)_ancestorPathWithinEndowmentTree:(id)a3 root:(id)a4 visitedLinks:(id)a5
{
  int v9;
  id result;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(a4, "targetPid");
  if (v9 == -[FigCaptureProcessHandle pid](self, "pid"))
  {
    v24[0] = a4;
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  }
  else
  {
    v11 = (void *)objc_msgSend(a5, "setByAddingObject:", a4);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = (void *)objc_msgSend(a3, "childrenLinks:", a4, 0);
    result = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (result)
    {
      v13 = result;
      v14 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v12);
          v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v11, "containsObject:", v16) & 1) == 0)
          {
            v17 = -[FigCaptureProcessHandle _ancestorPathWithinEndowmentTree:root:visitedLinks:](self, "_ancestorPathWithinEndowmentTree:root:visitedLinks:", a3, v16, v11);
            if (v17)
            {
              v22 = a4;
              return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1), "arrayByAddingObjectsFromArray:", v17);
            }
          }
        }
        v13 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        result = 0;
        if (v13)
          continue;
        break;
      }
    }
  }
  return result;
}

@end
