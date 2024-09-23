@implementation SCNMTLShaderBindingsGenerator

- (void)generateBindingsForPipeline:(id)a3 withReflection:(id)a4 program:(__C3DFXMetalProgram *)a5 material:(__C3DMaterial *)a6 geometry:(__C3DGeometry *)a7 pass:(__C3DFXPass *)a8
{
  os_unfair_lock_s *p_generateLock;

  p_generateLock = &self->_generateLock;
  os_unfair_lock_lock(&self->_generateLock);
  self->_current.customBlocks = (NSDictionary *)C3DFXMetalProgramGetBufferBindings(a5);
  self->_current.pass = a8;
  if (a6)
    C3DMaterialGetCommonProfileIfNoTechnique((uint64_t)a6);
  self->_sceneBuffer = ($E8FEF9D34A3DFDCB69CDC2374B44012F)-1;
  if (objc_msgSend(a3, "vertexFunction"))
    -[SCNMTLShaderBindingsGenerator _parseArguments:function:renderPipeline:](self, "_parseArguments:function:renderPipeline:", objc_msgSend(a4, "vertexArguments"), objc_msgSend(a3, "vertexFunction"), a3);
  if (objc_msgSend(a3, "fragmentFunction"))
    -[SCNMTLShaderBindingsGenerator _parseArguments:function:renderPipeline:](self, "_parseArguments:function:renderPipeline:", objc_msgSend(a4, "fragmentArguments"), objc_msgSend(a3, "fragmentFunction"), a3);
  if (self->_sceneBuffer.vertexIndex != 255
    || self->_sceneBuffer.fragmentIndex != 255)
  {
    *((_WORD *)a3 + 4) = self->_sceneBuffer;
  }
  if (-[NSMutableDictionary count](self->_frameBindings, "count"))
  {
    objc_msgSend(a3, "setFrameBufferBindings:", -[NSMutableDictionary allValues](self->_frameBindings, "allValues"));
    -[NSMutableDictionary removeAllObjects](self->_frameBindings, "removeAllObjects");
  }
  if (-[NSMutableDictionary count](self->_nodeBindings, "count"))
  {
    objc_msgSend(a3, "setNodeBufferBindings:", -[NSMutableDictionary allValues](self->_nodeBindings, "allValues"));
    -[NSMutableDictionary removeAllObjects](self->_nodeBindings, "removeAllObjects");
  }
  if (-[NSMutableDictionary count](self->_passBindings, "count"))
  {
    objc_msgSend(a3, "setPassBufferBindings:", -[NSMutableDictionary allValues](self->_passBindings, "allValues"));
    -[NSMutableDictionary removeAllObjects](self->_passBindings, "removeAllObjects");
  }
  if (-[NSMutableDictionary count](self->_shadableBindings, "count"))
  {
    objc_msgSend(a3, "setShadableBufferBindings:", -[NSMutableDictionary allValues](self->_shadableBindings, "allValues"));
    -[NSMutableDictionary removeAllObjects](self->_shadableBindings, "removeAllObjects");
  }
  if (-[NSMutableDictionary count](self->_lightBindings, "count"))
  {
    objc_msgSend(a3, "setLightBufferBindings:", -[NSMutableDictionary allValues](self->_lightBindings, "allValues"));
    -[NSMutableDictionary removeAllObjects](self->_lightBindings, "removeAllObjects");
  }
  objc_msgSend(a3, "_computeUsageForArguments:function:", objc_msgSend(a4, "vertexArguments"), objc_msgSend(a3, "vertexFunction"));
  objc_msgSend(a3, "_computeUsageForArguments:function:", objc_msgSend(a4, "fragmentArguments"), objc_msgSend(a3, "fragmentFunction"));
  os_unfair_lock_unlock(p_generateLock);
}

- (void)_parseArguments:(id)a3 function:(id)a4 renderPipeline:(id)a5
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  SCNMTLSemanticResourceBinding *v21;
  SCNMTLSemanticResourceBinding *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  $E8FEF9D34A3DFDCB69CDC2374B44012F *p_indices;
  char v27;
  id v28;
  uint64_t v29;
  NSMutableDictionary *lightBindings;
  void *v31;
  SCNMTLSemanticResourceBinding *v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  NSObject *log;
  MTLStructMember *v37;
  size_t __n;
  uint64_t __na;
  int v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  void *__src;
  _BYTE *v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 buf;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[SCNMTLShaderBindingsGenerator _parseArguments:function:renderPipeline:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  v40 = SCNMTLFunctionTypeToProgramStage(objc_msgSend(a4, "functionType"));
  self->_current.stage = v40;
  self->_current.arguments = (NSArray *)a3;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v50;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v50 != v16)
          objc_enumerationMutation(a3);
        v18 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v17);
        if (objc_msgSend(v18, "isActive")
          && objc_msgSend(v18, "type") != 3
          && (objc_msgSend(v18, "type")
           || (objc_msgSend((id)objc_msgSend(v18, "name"), "hasPrefix:", CFSTR("vertexBuffer.")) & 1) == 0)
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", CFSTR("osdIndicesBuffer")) & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", CFSTR("osdTessellationLevel")) & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", CFSTR("osdVertexBuffer")) & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", CFSTR("osdFaceVaryingData")) & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", CFSTR("osdFaceVaryingIndices")) & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", CFSTR("osdFaceVaryingPatchParams")) & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", CFSTR("osdFaceVaryingPatchArray")) & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", CFSTR("osdFaceVaryingChannelCount")) & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", CFSTR("osdFaceVaryingChannelDescriptors")) & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", CFSTR("osdFaceVaryingPatchArrayIndex")) & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", CFSTR("osdFaceVaryingChannelsPackedData")) & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", CFSTR("vertexBuffer")) & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", CFSTR("indexBuffer")) & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", CFSTR("patchParamBuffer")) & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", CFSTR("perPatchVertexBuffer")) & 1) == 0
          && (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", CFSTR("patchTessBuffer")) & 1) == 0)
        {
          v19 = objc_msgSend((id)__argumentRegistry, "objectForKeyedSubscript:", objc_msgSend(v18, "name"));
          if (v19)
          {
            -[SCNMTLShaderBindingsGenerator addResourceBindingsForArgument:frequency:needsRenderResource:block:](self, "addResourceBindingsForArgument:frequency:needsRenderResource:block:", v18, *(unsigned int *)(v19 + 16), *(unsigned __int8 *)(v19 + 20), *(_QWORD *)(v19 + 8));
            goto LABEL_62;
          }
          if (objc_msgSend(v18, "type"))
          {
            if (objc_msgSend(v18, "type") == 2 && self->_current.pass)
            {
LABEL_34:
              if (-[SCNMTLShaderBindingsGenerator addPassResourceBindingsForArgument:](self, "addPassResourceBindingsForArgument:", v18))
              {
                goto LABEL_62;
              }
            }
LABEL_35:
            -[SCNMTLShaderBindingsGenerator addResourceBindingsForArgument:frequency:needsRenderResource:block:](self, "addResourceBindingsForArgument:frequency:needsRenderResource:block:", v18, 2, 1, __shadableArgumentBindingBlocks[objc_msgSend(v18, "type")]);
            goto LABEL_62;
          }
          if ((objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", CFSTR("scn_node")) & 1) != 0
            || (objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", CFSTR("scn_nodes")) & 1) != 0
            || objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", CFSTR("scn_lights")))
          {
            if (objc_msgSend((id)objc_msgSend(v18, "name", self->_nodeBindings), "isEqualToString:", CFSTR("scn_lights")))lightBindings = self->_lightBindings;
            v20 = objc_msgSend(v18, "name", lightBindings);
            v21 = (SCNMTLSemanticResourceBinding *)objc_msgSend(v31, "objectForKeyedSubscript:", v20);
            v32 = v21;
            if (v21)
            {
              v22 = v21;
            }
            else
            {
              v32 = objc_alloc_init(SCNMTLSemanticResourceBinding);
              -[SCNMTLResourceBinding setArgument:](v32, "setArgument:", v18);
              if (objc_msgSend(v18, "bufferDataType") == 1)
              {
                __src = 0;
                v47 = 0;
                v48 = 0;
                v42 = 0u;
                v43 = 0u;
                v44 = 0u;
                v45 = 0u;
                obj = (id)objc_msgSend((id)objc_msgSend(v18, "bufferStructType"), "members");
                v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
                if (v35)
                {
                  v34 = *(_QWORD *)v43;
                  do
                  {
                    for (__n = 0; __n != v35; ++__n)
                    {
                      if (*(_QWORD *)v43 != v34)
                        objc_enumerationMutation(obj);
                      v37 = *(MTLStructMember **)(*((_QWORD *)&v42 + 1) + 8 * __n);
                      v23 = objc_msgSend((id)__semanticRegistry, "objectForKeyedSubscript:", -[MTLStructMember name](v37, "name"));
                      if (v23)
                      {
                        buf = (unint64_t)v23;
                        DWORD2(buf) = -[MTLStructMember offset](v37, "offset");
                        HIDWORD(buf) = __structMemberSize(v37);
                        std::vector<SCNSemanticBinding>::push_back[abi:nn180100](&__src, &buf);
                      }
                      else
                      {
                        log = scn_default_log();
                        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                        {
                          v24 = -[MTLStructMember name](v37, "name");
                          LODWORD(buf) = 138412290;
                          *(_QWORD *)((char *)&buf + 4) = v24;
                          _os_log_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_DEFAULT, "Warning: unknown member in scn automated buffer : %@", (uint8_t *)&buf, 0xCu);
                        }
                      }
                    }
                    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
                  }
                  while (v35);
                }
                -[SCNMTLSemanticResourceBinding setSemanticsCount:](v32, "setSemanticsCount:", (v47 - (_BYTE *)__src) >> 4);
                if (-[SCNMTLSemanticResourceBinding semanticsCount](v32, "semanticsCount"))
                {
                  __na = 16 * -[SCNMTLSemanticResourceBinding semanticsCount](v32, "semanticsCount");
                  v32->_semantics = ($CA5999E4A43FCC3CCFD73A03B2056697 *)malloc_type_malloc(__na, 0xCEE1E1A9uLL);
                  memcpy(v32->_semantics, __src, __na);
                  -[SCNMTLSemanticResourceBinding setBufferSize:](v32, "setBufferSize:", objc_msgSend(v18, "bufferDataSize"));
                }
                objc_msgSend(v31, "setObject:forKeyedSubscript:", v32, objc_msgSend(v18, "name"));
                if (__src)
                {
                  v47 = __src;
                  operator delete(__src);
                }
              }
            }
            v25 = objc_msgSend(v18, "index");
            p_indices = &v32->super._indices;
            if (v40)
              p_indices = ($E8FEF9D34A3DFDCB69CDC2374B44012F *)&v32->super._indices.fragmentIndex;
            p_indices->vertexIndex = v25;

          }
          else if (objc_msgSend(v18, "bufferDataType") == 1
                 && ((objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", CFSTR("scn_frame")) & 1) != 0
                  || objc_msgSend((id)objc_msgSend(v18, "name"), "isEqualToString:", CFSTR("scn_frame_multi"))))
          {
            v27 = objc_msgSend(v18, "index");
            if (v40)
              self->_sceneBuffer.fragmentIndex = v27;
            else
              self->_sceneBuffer.vertexIndex = v27;
          }
          else
          {
            v28 = -[NSDictionary objectForKey:](self->_current.customBlocks, "objectForKey:", objc_msgSend(v18, "name"));
            if (!v28)
            {
              if (self->_current.pass && objc_msgSend(v18, "bufferDataType") == 1)
                goto LABEL_34;
              goto LABEL_35;
            }
            (*(void (**)(uint64_t, id, void *, SCNMTLShaderBindingsGenerator *))(__trampolineUserBufferBlock
                                                                                         + 16))(__trampolineUserBufferBlock, v28, v18, self);
          }
        }
LABEL_62:
        ++v17;
      }
      while (v17 != v15);
      v29 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      v15 = v29;
    }
    while (v29);
  }
}

- (void)addResourceBindingsForArgument:(id)a3 frequency:(int)a4 needsRenderResource:(BOOL)a5 block:(id)a6
{
  _BOOL8 v7;
  id v10;
  SCNMTLResourceBinding *v11;
  SCNMTLResourceBinding *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int stage;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v7 = a5;
  v10 = -[SCNMTLShaderBindingsGenerator _dictionaryForFrequency:](self, "_dictionaryForFrequency:", *(_QWORD *)&a4);
  v11 = (SCNMTLResourceBinding *)objc_msgSend(v10, "objectForKeyedSubscript:", objc_msgSend(a3, "name"));
  if (v11)
  {
    v12 = v11;
    v13 = -[SCNMTLResourceBinding type](v11, "type");
    if (v13 != objc_msgSend(a3, "type"))
    {
      v14 = scn_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[SCNMTLShaderBindingsGenerator addResourceBindingsForArgument:frequency:needsRenderResource:block:].cold.3(a3, v12);
    }
    if (-[SCNMTLResourceBinding bindBlock](v12, "bindBlock") != a6)
    {
      v15 = scn_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[SCNMTLShaderBindingsGenerator addResourceBindingsForArgument:frequency:needsRenderResource:block:].cold.2(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  else
  {
    v12 = objc_alloc_init(SCNMTLResourceBinding);
    -[SCNMTLResourceBinding setBindBlock:](v12, "setBindBlock:", a6);
    -[SCNMTLResourceBinding setNeedsRenderResource:](v12, "setNeedsRenderResource:", v7);
    -[SCNMTLResourceBinding setArgument:](v12, "setArgument:", a3);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, objc_msgSend(a3, "name"));

  }
  stage = self->_current.stage;
  if (stage == 1)
  {
    v12->_indices.fragmentIndex = objc_msgSend(a3, "index");
  }
  else if (stage)
  {
    v24 = scn_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[SCNMTLShaderBindingsGenerator _checkForAssociatedSamplerOnBinding:argument:].cold.1((uint64_t)&self->_current, v24, v25, v26, v27, v28, v29, v30);
  }
  else
  {
    v12->_indices.vertexIndex = objc_msgSend(a3, "index");
  }
  if (objc_msgSend(a3, "type") == 2)
    -[SCNMTLShaderBindingsGenerator _checkForAssociatedSamplerOnBinding:argument:](self, "_checkForAssociatedSamplerOnBinding:argument:", v12, a3);
}

- (id)_dictionaryForFrequency:(int)a3
{
  void *v3;

  if (a3 <= 3)
    return *(Class *)((char *)&self->super.isa + qword_1DD02B000[a3]);
  return v3;
}

- (void)_checkForAssociatedSamplerOnBinding:(id)a3 argument:(id)a4
{
  int64_t v6;
  int v7;
  $D694E04D38E42199557158A8D970B568 *p_current;
  int stage;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = -[SCNMTLShaderBindingsGenerator _searchArguments:forArgumentNamed:type:](self, "_searchArguments:forArgumentNamed:type:", self->_current.arguments, objc_msgSend((id)objc_msgSend(a4, "name"), "stringByAppendingString:", CFSTR("Sampler")), 3);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    stage = self->_current.stage;
    p_current = &self->_current;
    v7 = stage;
    if (stage == 1)
    {
      *((_BYTE *)a3 + 12) = v6;
    }
    else if (v7)
    {
      v10 = scn_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[SCNMTLShaderBindingsGenerator _checkForAssociatedSamplerOnBinding:argument:].cold.1((uint64_t)p_current, v10, v11, v12, v13, v14, v15, v16);
    }
    else
    {
      *((_BYTE *)a3 + 11) = v6;
    }
  }
}

- (int64_t)_searchArguments:(id)a3 forArgumentNamed:(id)a4 type:(unint64_t)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  int v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v10)
        objc_enumerationMutation(a3);
      v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
      if (objc_msgSend((id)objc_msgSend(v12, "name"), "isEqualToString:", a4))
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v9)
          goto LABEL_3;
        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    if (objc_msgSend(v12, "type") == a5)
      return objc_msgSend(v12, "index");
    v14 = scn_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = a4;
      v21 = 1024;
      v22 = a5;
      _os_log_impl(&dword_1DCCB8000, v14, OS_LOG_TYPE_DEFAULT, "Warning: arguments named %@ is reserved for type %d", buf, 0x12u);
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

+ (void)allocateRegistry
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. You can't allocate a registry twice", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)registerArgument:(id)a3 frequency:(int)a4 block:(id)a5
{
  uint64_t v6;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SCNMTLArgumentBinder *v16;

  v6 = *(_QWORD *)&a4;
  if (objc_msgSend((id)__argumentRegistry, "objectForKey:"))
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      +[SCNMTLShaderBindingsGenerator registerArgument:frequency:block:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  v16 = -[SCNMTLArgumentBinder initWithBlock:frequency:needsRenderResource:]([SCNMTLArgumentBinder alloc], "initWithBlock:frequency:needsRenderResource:", a5, v6, 0);
  objc_msgSend((id)__argumentRegistry, "setObject:forKey:", v16, a3);

}

+ (void)registerSemantic:(id)a3 withBlock:(id)a4
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (objc_msgSend((id)__semanticRegistry, "objectForKey:"))
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      +[SCNMTLShaderBindingsGenerator registerSemantic:withBlock:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  objc_msgSend((id)__semanticRegistry, "setObject:forKey:", _Block_copy(a4), a3);
}

+ (void)registerArgument:(id)a3 frequency:(int)a4 needsRenderResource:(BOOL)a5 block:(id)a6
{
  _BOOL8 v7;
  uint64_t v8;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  SCNMTLArgumentBinder *v18;

  v7 = a5;
  v8 = *(_QWORD *)&a4;
  if (objc_msgSend((id)__argumentRegistry, "objectForKey:"))
  {
    v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      +[SCNMTLShaderBindingsGenerator registerArgument:frequency:block:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
  }
  v18 = -[SCNMTLArgumentBinder initWithBlock:frequency:needsRenderResource:]([SCNMTLArgumentBinder alloc], "initWithBlock:frequency:needsRenderResource:", a6, v8, v7);
  objc_msgSend((id)__argumentRegistry, "setObject:forKey:", v18, a3);

}

+ (void)registerUserBlockTrampoline:(id)a3
{
  __trampolineUserBufferBlock = (uint64_t)_Block_copy(a3);
}

+ (void)registerShadableArgumentBindingBlockForBuffers:(id)a3 textures:(id)a4 samplers:(id)a5
{
  __shadableArgumentBindingBlocks[0] = (uint64_t)_Block_copy(a3);
  qword_1F03C4E00 = (uint64_t)_Block_copy(a4);
  qword_1F03C4E08 = (uint64_t)_Block_copy(a5);
}

- (SCNMTLShaderBindingsGenerator)init
{
  SCNMTLShaderBindingsGenerator *v2;
  SCNMTLShaderBindingsGenerator *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNMTLShaderBindingsGenerator;
  v2 = -[SCNMTLShaderBindingsGenerator init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_generateLock._os_unfair_lock_opaque = 0;
    v2->_passBindings = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 16);
    v3->_nodeBindings = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 16);
    v3->_frameBindings = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 16);
    v3->_shadableBindings = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 16);
    v3->_lightBindings = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 16);
  }
  return v3;
}

+ (void)deallocateRegistry
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. You can't deallocate a registry that wasn't allocated", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNMTLShaderBindingsGenerator;
  -[SCNMTLShaderBindingsGenerator dealloc](&v3, sel_dealloc);
}

- (BOOL)addPassResourceBindingsForArgument:(id)a3
{
  id v5;
  SCNMTLPassResourceBinding *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  SCNMTLPassResourceBinding *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int stage;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __C3DFXPassInput *InputWithName;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  __int16 *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  int Size;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  uint64_t v66;
  int v67;
  _BYTE *v68;
  _BYTE *v69;
  int64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char *v74;
  char *v75;
  char *v76;
  char *v77;
  char *v78;
  size_t v79;
  id v81;
  id v82;
  void **p_isa;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  void *__src;
  _BYTE *v89;
  unint64_t v90;
  uint8_t buf[4];
  uint64_t v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v5 = -[SCNMTLShaderBindingsGenerator _dictionaryForFrequency:](self, "_dictionaryForFrequency:", 3);
  v6 = (SCNMTLPassResourceBinding *)objc_msgSend(v5, "objectForKeyedSubscript:", objc_msgSend(a3, "name"));
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = scn_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[SCNMTLShaderBindingsGenerator addPassResourceBindingsForArgument:].cold.6(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    v15 = -[SCNMTLResourceBinding type](v6, "type");
    if (v15 != objc_msgSend(a3, "type"))
    {
      v16 = scn_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[SCNMTLShaderBindingsGenerator addPassResourceBindingsForArgument:].cold.5(a3, v6);
    }
    v17 = v6;
    if (-[SCNMTLResourceBinding bindBlock](v6, "bindBlock"))
    {
      v18 = scn_default_log();
      v17 = v6;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        -[SCNMTLShaderBindingsGenerator addPassResourceBindingsForArgument:].cold.4(v18, v19, v20, v21, v22, v23, v24, v25);
        v17 = v6;
      }
    }
  }
  else
  {
    v17 = objc_alloc_init(SCNMTLPassResourceBinding);
    -[SCNMTLResourceBinding setBindBlock:](v17, "setBindBlock:", 0);
    -[SCNMTLResourceBinding setNeedsRenderResource:](v17, "setNeedsRenderResource:", 0);
    -[SCNMTLResourceBinding setArgument:](v17, "setArgument:", a3);
  }
  stage = self->_current.stage;
  if (stage == 1)
  {
    v17->super._indices.fragmentIndex = objc_msgSend(a3, "index");
  }
  else if (stage)
  {
    v27 = scn_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[SCNMTLShaderBindingsGenerator _checkForAssociatedSamplerOnBinding:argument:].cold.1((uint64_t)&self->_current, v27, v28, v29, v30, v31, v32, v33);
  }
  else
  {
    v17->super._indices.vertexIndex = objc_msgSend(a3, "index");
  }
  if (objc_msgSend(a3, "type") == 2)
  {
    if (v6)
    {
LABEL_22:
      -[SCNMTLShaderBindingsGenerator _checkForAssociatedSamplerOnBinding:argument:](self, "_checkForAssociatedSamplerOnBinding:argument:", v17, a3);
      goto LABEL_24;
    }
    InputWithName = (__C3DFXPassInput *)C3DFXPassGetInputWithName((uint64_t)self->_current.pass, (void *)objc_msgSend(a3, "name"));
    if (InputWithName)
    {
      v17->_samplerInput = InputWithName;
      goto LABEL_22;
    }
  }
  else
  {
    if (objc_msgSend(a3, "type"))
    {
LABEL_24:
      if (v6)
      {
LABEL_26:
        LOBYTE(InputWithName) = 1;
        return (char)InputWithName;
      }
LABEL_25:
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, objc_msgSend(a3, "name"));
      goto LABEL_26;
    }
    if (objc_msgSend(a3, "bufferDataType") != 1)
    {
      v35 = scn_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        -[SCNMTLShaderBindingsGenerator addPassResourceBindingsForArgument:].cold.2(v35, v36, v37, v38, v39, v40, v41, v42);
    }
    if (v6)
    {
      v43 = -[SCNMTLPassResourceBinding bufferSize](v17, "bufferSize");
      if (v43 != objc_msgSend(a3, "bufferDataSize"))
      {
        v44 = scn_default_log();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
          -[SCNMTLShaderBindingsGenerator addPassResourceBindingsForArgument:].cold.1(v44, v45, v46, v47, v48, v49, v50, v51);
      }
      goto LABEL_26;
    }
    v82 = a3;
    p_isa = (void **)&v17->super.super.isa;
    v81 = v5;
    __src = 0;
    v89 = 0;
    v90 = 0;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v52 = (void *)objc_msgSend((id)objc_msgSend(a3, "bufferStructType"), "members");
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
    if (v53)
    {
      v54 = *(_QWORD *)v85;
      do
      {
        for (i = 0; i != v53; ++i)
        {
          if (*(_QWORD *)v85 != v54)
            objc_enumerationMutation(v52);
          v56 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
          v57 = (__int16 *)C3DFXPassGetInputWithName((uint64_t)self->_current.pass, (void *)objc_msgSend(v56, "name"));
          if (v57)
          {
            v58 = (void *)objc_msgSend(v56, "arrayType");
            if (objc_msgSend(v56, "dataType") == 2
              && (v59 = objc_msgSend(v58, "elementType"), v59 == SCNMTLDataTypeFromC3DBaseType(v57[10]))
              || (v60 = objc_msgSend(v56, "dataType"), v60 == SCNMTLDataTypeFromC3DBaseType(v57[10]))
              && *((_QWORD *)v57 + 3) == 1)
            {
              v61 = objc_msgSend(v56, "offset");
              if (v58)
              {
                objc_msgSend(v58, "arrayLength");
                Size = SCNMTLDataTypeGetSize(objc_msgSend(v58, "elementType"));
                v63 = objc_msgSend(v58, "arrayLength");
                v64 = *((_QWORD *)v57 + 3);
                if (v63 < v64)
                  LODWORD(v64) = v63;
              }
              else
              {
                Size = SCNMTLDataTypeGetSize(objc_msgSend(v56, "dataType"));
                v64 = *((_QWORD *)v57 + 3);
              }
              v67 = Size * v64;
              v68 = v89;
              if ((unint64_t)v89 >= v90)
              {
                v70 = (v89 - (_BYTE *)__src) >> 4;
                v71 = v70 + 1;
                if ((unint64_t)(v70 + 1) >> 60)
                  abort();
                v72 = v90 - (_QWORD)__src;
                if ((uint64_t)(v90 - (_QWORD)__src) >> 3 > v71)
                  v71 = v72 >> 3;
                if ((unint64_t)v72 >= 0x7FFFFFFFFFFFFFF0)
                  v73 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v73 = v71;
                if (v73)
                  v74 = (char *)_ZNSt3__119__allocate_at_leastB8nn180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v90, v73);
                else
                  v74 = 0;
                v75 = &v74[16 * v70];
                *(_QWORD *)v75 = v57;
                *((_DWORD *)v75 + 2) = v61;
                *((_DWORD *)v75 + 3) = v67;
                v77 = (char *)__src;
                v76 = v89;
                v78 = v75;
                if (v89 != __src)
                {
                  do
                  {
                    *((_OWORD *)v78 - 1) = *((_OWORD *)v76 - 1);
                    v78 -= 16;
                    v76 -= 16;
                  }
                  while (v76 != v77);
                  v76 = (char *)__src;
                }
                v69 = v75 + 16;
                __src = v78;
                v89 = v75 + 16;
                v90 = (unint64_t)&v74[16 * v73];
                if (v76)
                  operator delete(v76);
              }
              else
              {
                *(_QWORD *)v89 = v57;
                v69 = v68 + 16;
                *((_DWORD *)v68 + 2) = v61;
                *((_DWORD *)v68 + 3) = v67;
              }
              v89 = v69;
            }
            else
            {
              v65 = scn_default_log();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
              {
                v66 = objc_msgSend(v56, "name");
                *(_DWORD *)buf = 138412290;
                v92 = v66;
                _os_log_impl(&dword_1DCCB8000, v65, OS_LOG_TYPE_DEFAULT, "Warning: struct member does not match pass description : %@", buf, 0xCu);
              }
            }
          }
        }
        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
      }
      while (v53);
    }
    if (v89 != __src)
    {
      v17 = (SCNMTLPassResourceBinding *)p_isa;
      objc_msgSend(p_isa, "setInputsCount:", (v89 - (_BYTE *)__src) >> 4);
      v5 = v81;
      a3 = v82;
      v79 = 16 * objc_msgSend(p_isa, "inputsCount");
      p_isa[6] = malloc_type_malloc(v79, 0x6038B743uLL);
      memcpy(p_isa[6], __src, v79);
      objc_msgSend(p_isa, "setBufferSize:", objc_msgSend(v82, "bufferDataSize"));
      if (__src)
      {
        v89 = __src;
        operator delete(__src);
      }
      goto LABEL_25;
    }
    if (v89)
      operator delete(v89);
    LOBYTE(InputWithName) = 0;
  }
  return (char)InputWithName;
}

+ (void)registerSemantic:(uint64_t)a3 withBlock:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. You can't register twice the same semantic", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)registerArgument:(uint64_t)a3 frequency:(uint64_t)a4 block:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. You can't register twice the same argument name", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_parseArguments:(uint64_t)a3 function:(uint64_t)a4 renderPipeline:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_checkForAssociatedSamplerOnBinding:(uint64_t)a3 argument:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1DCCB8000, a2, a3, "Unreachable code: invalid program stage %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)addResourceBindingsForArgument:(uint64_t)a3 frequency:(uint64_t)a4 needsRenderResource:(uint64_t)a5 block:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Argument with the same name cannot have different blocks", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)addResourceBindingsForArgument:(void *)a1 frequency:(void *)a2 needsRenderResource:block:.cold.3(void *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "type");
  objc_msgSend(a2, "type");
  OUTLINED_FUNCTION_3_6(&dword_1DCCB8000, v3, v4, "Assertion '%s' failed. Argument with the same name cannot have different types (%d != %d)", v5, v6, v7, v8, 2u);
  OUTLINED_FUNCTION_4_3();
}

- (void)addPassResourceBindingsForArgument:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. buffers of the same name in different stages need to have the same type", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)addPassResourceBindingsForArgument:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Only supports pass buffer arguments as struct", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)addPassResourceBindingsForArgument:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Argument with the same name cannot have different blocks", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)addPassResourceBindingsForArgument:(void *)a1 .cold.5(void *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "type");
  objc_msgSend(a2, "type");
  OUTLINED_FUNCTION_3_6(&dword_1DCCB8000, v3, v4, "Assertion '%s' failed. Argument with the same name cannot have different types (%d != %d)", v5, v6, v7, v8, 2u);
  OUTLINED_FUNCTION_4_3();
}

- (void)addPassResourceBindingsForArgument:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Argument with the same name cannot have different class type", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
