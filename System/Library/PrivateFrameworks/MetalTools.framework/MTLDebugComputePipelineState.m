@implementation MTLDebugComputePipelineState

- (MTLDebugComputePipelineState)initWithComputePipelineState:(id)a3 reflection:(id)a4 parent:(id)a5 descriptor:(id)a6
{
  MTLDebugComputePipelineState *v8;
  MTLComputePipelineDescriptor *v9;
  MTLComputePipelineReflection *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v28.receiver = self;
  v28.super_class = (Class)MTLDebugComputePipelineState;
  v8 = -[MTLToolsObject initWithBaseObject:parent:](&v28, sel_initWithBaseObject_parent_, a3, a5);
  if (v8)
  {
    v9 = (MTLComputePipelineDescriptor *)objc_msgSend(a6, "copy");
    v8->_descriptor = v9;
    -[MTLComputePipelineDescriptor setBinaryArchives:](v9, "setBinaryArchives:", 0);
    -[MTLComputePipelineDescriptor setPreloadedLibraries:](v8->_descriptor, "setPreloadedLibraries:", MEMORY[0x24BDBD1A8]);
    v8->_function = (MTLFunction *)objc_msgSend(a6, "computeFunction");
    v10 = (MTLComputePipelineReflection *)a4;
    v8->_reflection = v10;
    v11 = (void *)-[MTLComputePipelineReflection builtInArguments](v10, "builtInArguments");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v15);
          v17 = 1;
          v18 = 1;
          v19 = 1;
          switch(objc_msgSend(v16, "builtInDataType"))
          {
            case '!':
              goto LABEL_10;
            case '"':
              goto LABEL_9;
            case '#':
              v17 = 0xFFFFFFFFLL;
LABEL_9:
              v18 = 0xFFFFFFFFLL;
LABEL_10:
              v19 = 0xFFFFFFFFLL;
              break;
            case '$':
            case '%':
            case '&':
            case '\'':
            case '(':
              break;
            case ')':
              goto LABEL_13;
            case '*':
              goto LABEL_12;
            case '+':
              v17 = 0xFFFFLL;
LABEL_12:
              v18 = 0xFFFFLL;
LABEL_13:
              v19 = 0xFFFFLL;
              break;
            default:
              v18 = 1;
              v19 = 1;
              break;
          }
          switch(objc_msgSend(v16, "builtInType"))
          {
            case 5:
              v20 = 48;
              goto LABEL_22;
            case 6:
              v20 = 72;
              goto LABEL_22;
            case 7:
              v20 = 96;
              goto LABEL_22;
            case 8:
              v8->_maxThreadIndexInThreadgroup[0] = v19;
              break;
            case 9:
              v20 = 144;
              goto LABEL_22;
            case 10:
              v20 = 168;
              goto LABEL_22;
            case 11:
              v20 = 192;
LABEL_22:
              v21 = (uint64_t *)((char *)v8 + v20);
              *v21 = v19;
              v21[1] = v18;
              v21[2] = v17;
              break;
            default:
              break;
          }
          ++v15;
        }
        while (v13 != v15);
        v22 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        v13 = v22;
      }
      while (v22);
    }
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLDebugComputePipelineState;
  -[MTLToolsComputePipelineState dealloc](&v3, sel_dealloc);
}

- (id)formattedDescription:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTLDebugComputePipelineState;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), -[MTLToolsObject description](&v4, sel_description), -[MTLComputePipelineDescriptor formattedDescription:](self->_descriptor, "formattedDescription:", a3 + 4));
}

- (id)description
{
  return -[MTLDebugComputePipelineState formattedDescription:](self, "formattedDescription:", 0);
}

- (id)getParameter:(id)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getParameter:", a3);
}

- (id)functionHandleToDebugFunctionHandle:(id)a3 parentFunction:(id)a4
{
  void *v7;
  _QWORD v9[7];

  v7 = *(void **)(objc_msgSend(a4, "device") + 48);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __83__MTLDebugComputePipelineState_functionHandleToDebugFunctionHandle_parentFunction___block_invoke;
  v9[3] = &unk_24F795418;
  v9[4] = a3;
  v9[5] = self;
  v9[6] = a4;
  return (id)objc_msgSend(v7, "getCachedObjectForKey:onMiss:", a3, v9);
}

MTLDebugFunctionHandle *__83__MTLDebugComputePipelineState_functionHandleToDebugFunctionHandle_parentFunction___block_invoke(_QWORD *a1)
{
  return -[MTLDebugFunctionHandle initWithBaseObject:parent:function:stage:]([MTLDebugFunctionHandle alloc], "initWithBaseObject:parent:function:stage:", a1[4], a1[5], a1[6], 1);
}

- (id)functionHandleWithFunction:(id)a3
{
  if (!a3 || (objc_msgSend(a3, "conformsToProtocol:", &unk_255C6A2E8) & 1) == 0)
    MTLReportFailure();
  return -[MTLDebugComputePipelineState functionHandleToDebugFunctionHandle:parentFunction:](self, "functionHandleToDebugFunctionHandle:parentFunction:", objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "functionHandleWithFunction:", objc_msgSend(a3, "baseObject")), a3);
}

- (id)newComputePipelineStateWithAdditionalBinaryFunctions:(id)a3
{
  return -[MTLDebugComputePipelineState newComputePipelineStateWithAdditionalBinaryFunctions:error:](self, "newComputePipelineStateWithAdditionalBinaryFunctions:error:", a3, 0);
}

- (id)newComputePipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  MTLDevice *v7;
  MTLDevice *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  MTLDebugComputePipelineState *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (!-[MTLComputePipelineDescriptor supportAddingBinaryFunctions](-[MTLDebugComputePipelineState descriptor](self, "descriptor"), "supportAddingBinaryFunctions"))MTLReportFailure();
  v7 = -[MTLToolsComputePipelineState device](self, "device");
  if (a3 && (v8 = v7, objc_msgSend(a3, "count")))
  {
    if ((objc_msgSend((id)-[MTLDevice baseObject](v8, "baseObject"), "supportsFunctionPointers") & 1) == 0)
      MTLReportFailure();
    v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(a3);
          v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "baseObject", v21);
          objc_msgSend(v9, "addObject:", v14);
          if (!objc_msgSend(v14, "precompiledOutput"))
          {
            v21 = objc_msgSend((id)objc_msgSend(v14, "name"), "UTF8String");
            MTLReportFailure();
          }
        }
        v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v11);
    }
  }
  else
  {
    v9 = 0;
  }
  v23 = 0;
  if (!a4)
    a4 = (id *)&v23;
  v15 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v21), "newComputePipelineStateWithAdditionalBinaryFunctions:error:", v9, a4);
  v16 = (void *)v15;
  if (v23)
  {
    v22 = v23;
    MTLReportFailure();
    if (v16)
      goto LABEL_22;
    return 0;
  }
  if (!v15)
    return 0;
LABEL_22:
  v17 = (void *)-[MTLComputePipelineDescriptor copy](self->_descriptor, "copy", v22);
  v18 = objc_alloc_init(MEMORY[0x24BDDD638]);
  objc_msgSend(v18, "setBinaryFunctions:", a3);
  objc_msgSend(v17, "setLinkedFunctions:", v18);

  v19 = -[MTLDebugComputePipelineState initWithComputePipelineState:reflection:parent:descriptor:]([MTLDebugComputePipelineState alloc], "initWithComputePipelineState:reflection:parent:descriptor:", v16, self->_reflection, self, v17);
  return v19;
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3
{
  id result;
  id v6;
  MTLDebugVisibleFunctionTable *v7;

  if ((objc_msgSend((id)-[MTLDevice baseObject](-[MTLToolsComputePipelineState device](self, "device"), "baseObject"), "supportsFunctionPointers") & 1) != 0)
  {
    if (a3)
      goto LABEL_3;
  }
  else
  {
    MTLReportFailure();
    if (a3)
    {
LABEL_3:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_4;
    }
  }
  MTLReportFailure();
LABEL_4:
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newVisibleFunctionTableWithDescriptor:", a3);
  if (result)
  {
    v6 = result;
    v7 = -[MTLDebugVisibleFunctionTable initWithVisibleFunctionTable:parent:descriptor:pipelineState:stage:]([MTLDebugVisibleFunctionTable alloc], "initWithVisibleFunctionTable:parent:descriptor:pipelineState:stage:", result, self, a3, self, 1);

    return v7;
  }
  return result;
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3
{
  id result;
  id v6;
  MTLDebugIntersectionFunctionTable *v7;

  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    MTLReportFailure();
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIntersectionFunctionTableWithDescriptor:", a3);
  if (result)
  {
    v6 = result;
    v7 = -[MTLDebugIntersectionFunctionTable initWithIntersectionFunctionTable:parent:descriptor:pipelineState:stage:]([MTLDebugIntersectionFunctionTable alloc], "initWithIntersectionFunctionTable:parent:descriptor:pipelineState:stage:", result, self, a3, self, 1);

    return v7;
  }
  return result;
}

- (BOOL)isAncestorOf:(id)a3
{
  void *v3;
  id v5;
  MTLDebugComputePipelineState *v6;
  BOOL v7;

  if (self == a3)
    return 1;
  v3 = a3;
  v5 = a3;
  while (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    v6 = (MTLDebugComputePipelineState *)objc_msgSend(v3, "parent");

    v3 = v6;
    if (v6 == self)
    {
      v7 = 1;
      v3 = self;
      goto LABEL_8;
    }
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (void)validateHandleForSetFunction:(id)a3
{
  id v5;

  objc_msgSend(a3, "function");
  v5 = (id)objc_msgSend(a3, "parent");
  if ((objc_msgSend(v5, "isAncestorOf:", self) & 1) == 0
    && !-[MTLDebugComputePipelineState isAncestorOf:](self, "isAncestorOf:", v5))
  {
    objc_msgSend((id)objc_msgSend(a3, "name"), "UTF8String");
    MTLReportFailure();
  }

}

- (int64_t)shaderValidation
{
  id v2;

  v2 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 2;
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    v2 = (id)objc_msgSend(v2, "baseObject");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 2;
  }
  return objc_msgSend(v2, "shaderValidation");
}

- (int64_t)shaderValidationState
{
  id v2;

  v2 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 2;
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    v2 = (id)objc_msgSend(v2, "baseObject");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 2;
  }
  return objc_msgSend(v2, "shaderValidationState");
}

- (MTLFunction)function
{
  return self->_function;
}

- (MTLComputePipelineDescriptor)descriptor
{
  return self->_descriptor;
}

- (MTLComputePipelineReflection)reflection
{
  return self->_reflection;
}

@end
