@implementation SCNShadableHelper

void __48__SCNShadableHelper__parseAndSetShaderModifier___block_invoke_2(uint64_t a1)
{
  C3DEntitySetShaderModifiers(*(CFTypeRef **)(a1 + 40), *(const __CFDictionary **)(a1 + 32));
}

- (void)__CFObject
{
  return (void *)objc_msgSend(self->_owner, "__CFObject");
}

uint64_t __48__SCNShadableHelper__parseAndSetShaderModifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", a2);
}

- (SCNShadableHelper)initWithOwner:(id)a3
{
  SCNShadableHelper *v4;
  SCNShadableHelper *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNShadableHelper;
  v4 = -[SCNShadableHelper init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[SCNShadableHelper _commonInit](v4, "_commonInit");
    v5->_owner = a3;
  }
  return v5;
}

- (void)_commonInit
{
  self->_symbolToBinder = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  self->_symbolToUnbinder = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  self->_argumentsNames = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
}

- (void)setShaderModifiers:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSDictionary *shaderModifiers;
  NSDictionary *v14;
  id v15;
  NSDictionary *v16;
  void *v17;
  NSArray *v18;
  _QWORD v19[6];

  if (self->_program && objc_msgSend(a3, "count"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNShadableHelper setShaderModifiers:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  else
  {
    shaderModifiers = self->_shaderModifiers;
    if (shaderModifiers != a3)
    {

      if (objc_msgSend(a3, "count"))
      {
        v14 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", a3, 1);
      }
      else if (a3)
      {
        v14 = (NSDictionary *)MEMORY[0x1E0C9AA70];
      }
      else
      {
        v14 = 0;
      }
      self->_shaderModifiers = v14;
      v15 = -[SCNShadableHelper owner](self, "owner");
      v16 = self->_shaderModifiers;
      v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSDictionary count](v16, "count"));
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = ____arrayOfC3DModifiersFromDictionary_block_invoke;
      v19[3] = &unk_1EA5A0130;
      v19[4] = v17;
      v19[5] = v15;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v16, "enumerateKeysAndObjectsUsingBlock:", v19);

      v18 = v17;
      self->_c3dShaderModifierCache = v18;
      -[SCNShadableHelper _parseAndSetShaderModifier:](self, "_parseAndSetShaderModifier:", v18);
    }
  }
}

- (id)owner
{
  return self->_owner;
}

- (void)_parseAndSetShaderModifier:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *Arguments;
  id *p_owner;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[6];
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray removeAllObjects](self->_argumentsNames, "removeAllObjects");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(a3);
        Arguments = (void *)C3DShaderModifierGetArguments(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
        v22[0] = v6;
        v22[1] = 3221225472;
        v22[2] = __48__SCNShadableHelper__parseAndSetShaderModifier___block_invoke;
        v22[3] = &unk_1EA59F6F0;
        v22[4] = self;
        objc_msgSend(Arguments, "enumerateKeysAndObjectsUsingBlock:", v22);
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }
  p_owner = &self->_owner;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v12 = objc_msgSend(self->_owner, "__CFObject");
    v13 = objc_msgSend(self->_owner, "sceneRef");
    v21[0] = v6;
    v21[1] = 3221225472;
    v21[2] = __48__SCNShadableHelper__parseAndSetShaderModifier___block_invoke_2;
    v21[3] = &unk_1EA59E450;
    v21[4] = a3;
    v21[5] = v12;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v13, self, v21);
  }
  else
  {
    v14 = scn_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SCNShadableHelper _parseAndSetShaderModifier:].cold.1((uint64_t)p_owner, v14, v15, v16, v17, v18, v19, v20);
  }
}

- (void)ownerWillDie
{
  -[SCNShadableHelper _stopObservingProgram](self, "_stopObservingProgram");
  self->_owner = 0;
}

- (NSArray)shaderModifiersArgumentsNames
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_argumentsNames, "copy");
}

- (void)dealloc
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Must call -[SCNShadableHelper ownerWillDie] before releasing it !", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_startObservingProgram
{
  if (self->_program)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel__programDidChange_, CFSTR("SCNProgramDidChangeNotification"), self->_program);
}

- (void)_stopObservingProgram
{
  if (self->_program)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("SCNProgramDidChangeNotification"), self->_program);
}

- (void)setProgram:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];

  if (a3 && -[NSDictionary count](self->_shaderModifiers, "count"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNShadableHelper setProgram:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  else if (self->_program != a3)
  {
    -[SCNShadableHelper _stopObservingProgram](self, "_stopObservingProgram");

    self->_program = (SCNProgram *)a3;
    v13 = objc_msgSend(self->_owner, "sceneRef");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __32__SCNShadableHelper_setProgram___block_invoke;
    v14[3] = &unk_1EA59E4A0;
    v14[4] = self;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v13, self, v14);
  }
}

uint64_t __32__SCNShadableHelper_setProgram___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setC3DProgram");
  return objc_msgSend(*(id *)(a1 + 32), "_startObservingProgram");
}

- (SCNProgram)program
{
  return self->_program;
}

- (BOOL)isOpaque
{
  return -[SCNProgram isOpaque](self->_program, "isOpaque");
}

- (BOOL)_bindValueForSymbol:(id)a3 atLocation:(unsigned int)a4 programID:(unsigned int)a5 node:(id)a6 renderer:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;

  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v11 = -[NSDictionary objectForKey:](self->_symbolToBinder, "objectForKey:", a3);
  v12 = v11;
  if (v11)
    (*((void (**)(id, uint64_t, uint64_t, id, id))v11 + 2))(v11, v9, v10, a6, a7);
  return v12 != 0;
}

- (void)_unbindValueForSymbol:(id)a3 atLocation:(unsigned int)a4 programID:(unsigned int)a5 node:(id)a6 renderer:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  void (**v13)(id, uint64_t, uint64_t, id, id);

  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  if (-[NSDictionary objectForKey:](self->_symbolToBinder, "objectForKey:"))
  {
    v13 = -[NSDictionary objectForKey:](self->_symbolToUnbinder, "objectForKey:", a3);
    if (v13)
      v13[2](v13, v9, v10, a6, a7);
  }
}

- (NSDictionary)shaderModifiers
{
  return self->_shaderModifiers;
}

- (void)copyModifiersFrom:(id)a3
{
  void *v4;
  NSDictionary *v5;
  NSDictionary *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSDictionary *shaderModifiers;
  NSDictionary *v16;

  v4 = (void *)*((_QWORD *)a3 + 4);
  v5 = (NSDictionary *)objc_msgSend(a3, "shaderModifiers");
  v6 = v5;
  if (v4)
  {
    if (self->_program && -[NSDictionary count](v5, "count"))
    {
      v7 = scn_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[SCNShadableHelper setShaderModifiers:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    else
    {
      shaderModifiers = self->_shaderModifiers;
      if (shaderModifiers != v6)
      {

        if (-[NSDictionary count](v6, "count"))
        {
          v16 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", v6, 1);
        }
        else if (v6)
        {
          v16 = (NSDictionary *)MEMORY[0x1E0C9AA70];
        }
        else
        {
          v16 = 0;
        }
        self->_shaderModifiers = v16;

        self->_c3dShaderModifierCache = (NSArray *)v4;
        -[SCNShadableHelper _parseAndSetShaderModifier:](self, "_parseAndSetShaderModifier:", v4);
      }
    }
  }
  else
  {
    -[SCNShadableHelper setShaderModifiers:](self, "setShaderModifiers:", v5);
  }
}

- (void)setMinimumLanguageVersion:(id)a3
{
  NSNumber *minimumLanguageVersion;
  uint64_t v6;
  _QWORD v7[6];

  minimumLanguageVersion = self->_minimumLanguageVersion;
  if (minimumLanguageVersion != a3)
  {

    self->_minimumLanguageVersion = (NSNumber *)a3;
    v6 = objc_msgSend(self->_owner, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__SCNShadableHelper_setMinimumLanguageVersion___block_invoke;
    v7[3] = &unk_1EA59F740;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __47__SCNShadableHelper_setMinimumLanguageVersion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "owner");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    C3DEntitySetShadableMinimumMTLLanguageVersion((CFTypeRef *)objc_msgSend(v2, "__CFObject"), *(const __CFDictionary **)(a1 + 40));
  }
  else
  {
    v3 = scn_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __47__SCNShadableHelper_setMinimumLanguageVersion___block_invoke_cold_1();
  }
}

- (NSNumber)minimumLanguageVersion
{
  return self->_minimumLanguageVersion;
}

- (void)handleBindingOfSymbol:(id)a3 usingBlock:(id)a4
{
  id v6;

  v6 = (id)objc_msgSend(a4, "copy");
  if (v6)
    -[NSDictionary setValue:forKey:](self->_symbolToBinder, "setValue:forKey:", v6, a3);
}

- (void)handleUnbindingOfSymbol:(id)a3 usingBlock:(id)a4
{
  id v6;

  v6 = (id)objc_msgSend(a4, "copy");
  if (v6)
    -[NSDictionary setValue:forKey:](self->_symbolToUnbinder, "setValue:forKey:", v6, a3);
}

- (void)_programDidChange:(id)a3
{
  uint64_t v5;
  _QWORD v6[6];

  v5 = objc_msgSend(self->_owner, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__SCNShadableHelper__programDidChange___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = a3;
  v6[5] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __39__SCNShadableHelper__programDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "userInfo");
  if (v2)
  {
    v3 = objc_msgSend(v2, "valueForKey:", CFSTR("parameter"));
    if (v3)
      objc_msgSend(*(id *)(a1 + 40), "_updateC3DProgramInputForSymbol:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_setC3DProgram");
  }
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("kC3DSceneDidUpdateNotification"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "owner"), "sceneRef"));
}

- (__C3DFXTechnique)_technique
{
  __C3DFXTechnique *result;

  result = (__C3DFXTechnique *)objc_msgSend(self->_owner, "materialRef");
  if (result)
    return (__C3DFXTechnique *)C3DMaterialGetTechnique((uint64_t)result);
  return result;
}

- (__C3DFXGLSLProgram)_programFromPassAtIndex:(int64_t)a3
{
  __C3DFXGLSLProgram *result;

  result = -[SCNShadableHelper _technique](self, "_technique", a3);
  if (result)
    return (__C3DFXGLSLProgram *)C3DFXTechniqueGetSingleProgram((uint64_t)result);
  return result;
}

- (void)_updateC3DProgramInput:(__C3DFXGLSLProgram *)a3 forSymbol:(id)a4
{
  uint64_t PassAtIndex;
  _QWORD *InputWithName;
  _QWORD *v9;
  int v10;
  int v11;
  unsigned int v12;
  int v13;
  char *NextUniformIndex;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  PassAtIndex = C3DFXTechniqueGetPassAtIndex((uint64_t)-[SCNShadableHelper _technique](self, "_technique"), 0);
  InputWithName = C3DFXPassGetInputWithName(PassAtIndex, a4);
  v9 = InputWithName;
  if (InputWithName
    || (v9 = C3DFXPassAddInputWithName(PassAtIndex, a4), C3DFXPassInputSetSymbolName((uint64_t)v9, a4), v9))
  {
    v10 = _fxSemanticFromSemanticString(-[SCNProgram semanticForSymbol:](self->_program, "semanticForSymbol:", a4));
    C3DFXPassInputSetSemantic((uint64_t)v9, v10);
    v11 = objc_msgSend((id)objc_msgSend(-[SCNProgram _optionsForSymbol:](self->_program, "_optionsForSymbol:", a4), "valueForKey:", CFSTR("mappingChannel")), "intValue");
    if (v11 >= 7)
      v12 = 7;
    else
      v12 = v11;
    C3DFXPassInputSetChannelIndex((uint64_t)v9, v12);
    v13 = C3DVertexAttribFromParameterSemantic(v10, v12);
    if (v13 == 14)
    {
      if (!InputWithName)
      {
        NextUniformIndex = (char *)C3DFXGLSLProgramGetNextUniformIndex(a3);
        C3DFXPassInputSetUniformIndex((uint64_t)v9, (uint64_t)NextUniformIndex);
        C3DFXGLSLProgramSetUniformIndex((CFMutableDictionaryRef *)a3, a4, NextUniformIndex);
      }
    }
    else
    {
      C3DFXGLSLProgramSetAttributeIndex((CFMutableDictionaryRef *)a3, a4, v13);
    }
  }
  else
  {
    v15 = scn_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = a4;
      _os_log_impl(&dword_1DCCB8000, v15, OS_LOG_TYPE_DEFAULT, "Warning: _updateC3DProgramInput can't find input named %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)_updateC3DProgramInputForSymbol:(id)a3
{
  __C3DFXGLSLProgram *v5;

  v5 = -[SCNShadableHelper _programFromPassAtIndex:](self, "_programFromPassAtIndex:", 0);
  if (v5)
    -[SCNShadableHelper _updateC3DProgramInput:forSymbol:](self, "_updateC3DProgramInput:forSymbol:", v5, a3);
}

- (void)_updateAllC3DProgramInputs
{
  __C3DFXGLSLProgram *v3;
  __C3DFXGLSLProgram *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = -[SCNShadableHelper _programFromPassAtIndex:](self, "_programFromPassAtIndex:", 0);
  if (v3)
  {
    v4 = v3;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = -[SCNProgram _allSymbolsWithSceneKitSemantic](self->_program, "_allSymbolsWithSceneKitSemantic", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          -[SCNShadableHelper _updateC3DProgramInput:forSymbol:](self, "_updateC3DProgramInput:forSymbol:", v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
  }
}

- (void)_setC3DProgramDelegate
{
  __C3DFXGLSLProgram *v3;
  uint64_t v4;
  const void *v5;
  __int128 v6;
  void (*v7)(uint64_t, __CFError *, void *);
  uint64_t (*v8)();

  v3 = -[SCNShadableHelper _programFromPassAtIndex:](self, "_programFromPassAtIndex:", 0);
  if (v3)
  {
    v4 = (uint64_t)v3;
    *(_QWORD *)&v6 = _programBindValueForSymbolCallback;
    *((_QWORD *)&v6 + 1) = _programDelegateUnbindValueForSymbolCallback;
    v7 = _programDelegateHandleErrorCallback;
    v8 = _programDelegateIsOpaqueCallback;
    v5 = (const void *)C3DFXProgramDelegateCreate(&v6, self);
    C3DFXProgramSetDelegate(v4, v5);
    CFRelease(v5);
  }
}

- (void)_setC3DProgram
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

CFHashCode __35__SCNShadableHelper__setC3DProgram__block_invoke(uint64_t a1)
{
  void *v1;

  v1 = (void *)objc_msgSend(*(id *)(a1 + 32), "libraryProvider");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(v1, "_libraryHash");
  if (v1)
    return CFHash(v1);
  return 0;
}

uint64_t __35__SCNShadableHelper__setC3DProgram__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "libraryProvider"), "libraryForDevice:", a2);
}

void __35__SCNShadableHelper__setC3DProgram__block_invoke_3(uint64_t a1, const void *a2, const void *a3)
{
  C3DFXMetalProgramSetBufferBinding(*(_QWORD **)(a1 + 32), a2, a3);
}

void __35__SCNShadableHelper__setC3DProgram__block_invoke_4(uint64_t a1, int a2, const void *a3, int a4)
{
  const void *v8;
  const void *Shader;
  uint64_t v10;
  const void *v11;

  v8 = *(const void **)(a1 + 32);
  if (v8 && (Shader = (const void *)C3DFXGLSLProgramGetShader(v8, a2)) != 0)
  {
    v10 = (uint64_t)Shader;
    C3DFXGLSLProgramSetShader(*(char **)(a1 + 48), Shader);
    C3DFXShaderSetSource(v10, a3);
  }
  else if (a3 || a4)
  {
    v11 = (const void *)C3DFXShaderCreate(a2);
    C3DFXGLSLProgramSetShader(*(char **)(a1 + 40), v11);
    C3DFXShaderSetSource((uint64_t)v11, a3);
    CFRelease(v11);
  }
}

- (void)_customEncodingOfSCNShadableHelper:(id)a3
{
  id owner;

  owner = self->_owner;
  if (owner)
    objc_msgSend(a3, "encodeObject:forKey:", owner, CFSTR("owner"));
}

- (void)_customDecodingOfSCNShadableHelper:(id)a3
{
  self->_owner = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", SCNUserInfoClasses(), CFSTR("owner"));
}

- (void)encodeWithCoder:(id)a3
{
  SCNProgram *program;
  NSDictionary *shaderModifiers;
  NSNumber *minimumLanguageVersion;

  -[SCNShadableHelper _customEncodingOfSCNShadableHelper:](self, "_customEncodingOfSCNShadableHelper:");
  program = self->_program;
  if (program)
    objc_msgSend(a3, "encodeObject:forKey:", program, CFSTR("program"));
  shaderModifiers = self->_shaderModifiers;
  if (shaderModifiers)
    objc_msgSend(a3, "encodeObject:forKey:", shaderModifiers, CFSTR("shaderModifiers"));
  minimumLanguageVersion = self->_minimumLanguageVersion;
  if (minimumLanguageVersion)
    objc_msgSend(a3, "encodeObject:forKey:", minimumLanguageVersion, CFSTR("minimumLanguageVersion"));
}

- (SCNShadableHelper)initWithCoder:(id)a3
{
  SCNShadableHelper *v4;
  SCNShadableHelper *v5;
  _BOOL8 v6;
  void *v7;
  objc_super v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)SCNShadableHelper;
  v4 = -[SCNShadableHelper init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    -[SCNShadableHelper _commonInit](v4, "_commonInit");
    v6 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    -[SCNShadableHelper _customDecodingOfSCNShadableHelper:](v5, "_customDecodingOfSCNShadableHelper:", a3);
    if (v5->_owner)
    {
      -[SCNShadableHelper setProgram:](v5, "setProgram:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("program")));
      v7 = (void *)MEMORY[0x1E0C99E60];
      v10[0] = objc_opt_class();
      v10[1] = objc_opt_class();
      -[SCNShadableHelper setShaderModifiers:](v5, "setShaderModifiers:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2)), CFSTR("shaderModifiers")));
      -[SCNShadableHelper setMinimumLanguageVersion:](v5, "setMinimumLanguageVersion:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minimumLanguageVersion")));
    }
    -[SCNShadableHelper _didDecodeSCNShadableHelper:](v5, "_didDecodeSCNShadableHelper:", a3);
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v6);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setProgram:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: Cannot use a program because shader modifiers are set", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)_parseAndSetShaderModifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: ShaderModifiers - unkwnown supporting class '%@'", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setShaderModifiers:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: Cannot use shader modifiers because a program is set", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __47__SCNShadableHelper_setMinimumLanguageVersion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: ShaderModifiers - unkwnown supporting class '%@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
