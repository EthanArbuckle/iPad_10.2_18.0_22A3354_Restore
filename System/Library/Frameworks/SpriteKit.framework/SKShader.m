@implementation SKShader

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKShader)init
{
  return -[SKShader initWithSource:uniforms:](self, "initWithSource:uniforms:", &stru_1EA5021F8, MEMORY[0x1E0C9AA60]);
}

- (SKShader)initWithSource:(NSString *)source
{
  return -[SKShader initWithSource:uniforms:](self, "initWithSource:uniforms:", source, MEMORY[0x1E0C9AA60]);
}

- (SKShader)initWithSource:(NSString *)source uniforms:(NSArray *)uniforms
{
  NSString *v6;
  NSArray *v7;
  SKShader *v8;
  uint64_t v9;
  NSPointerArray *targetNodes;
  uint64_t v11;
  NSMutableDictionary *uniformData;
  objc_super v14;

  v6 = source;
  v7 = uniforms;
  v14.receiver = self;
  v14.super_class = (Class)SKShader;
  v8 = -[SKShader init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v9 = objc_claimAutoreleasedReturnValue();
    targetNodes = v8->_targetNodes;
    v8->_targetNodes = (NSPointerArray *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    uniformData = v8->_uniformData;
    v8->_uniformData = (NSMutableDictionary *)v11;

    *(_WORD *)&v8->_usesTimeUniform = 0;
    v8->_isPrecompiledMetal = 0;
    -[SKShader setUniforms:](v8, "setUniforms:", v7);
    -[SKShader setSource:](v8, "setSource:", v6);
  }

  return v8;
}

+ (SKShader)shader
{
  return (SKShader *)objc_alloc_init((Class)objc_opt_class());
}

+ (SKShader)shaderWithSource:(NSString *)source
{
  NSString *v3;
  void *v4;

  v3 = source;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSource:", v3);

  return (SKShader *)v4;
}

+ (SKShader)shaderWithSource:(NSString *)source uniforms:(NSArray *)uniforms
{
  NSString *v5;
  NSArray *v6;
  void *v7;

  v5 = source;
  v6 = uniforms;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSource:uniforms:", v5, v6);

  return (SKShader *)v7;
}

+ (SKShader)shaderWithFileNamed:(NSString *)name
{
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id *v11;

  v4 = name;
  if (-[NSString hasSuffix:](v4, "hasSuffix:", CFSTR(".fsh")))
  {
    SKGetResourceBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathForResource:ofType:", v4, 0);
  }
  else
  {
    SKGetResourceBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathForResource:ofType:", v4, CFSTR("fsh"));
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v6, 1, 0);
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    v9 = objc_retainAutorelease(v7);
    v10 = (void *)objc_msgSend(v8, "initWithBytesNoCopy:length:encoding:freeWhenDone:", objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), 4, 0);
    v11 = (id *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSource:", v10);
    objc_storeStrong(v11 + 5, name);

  }
  else
  {
    NSLog(CFSTR("SKShader: failed to load file named: '%@'."), v4);
    v11 = 0;
  }

  return (SKShader *)v11;
}

+ (id)precompiledMetalShaderWithFile:(id)a3 uniforms:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)objc_opt_class());
  v8 = (void *)v7[5];
  v7[5] = v5;
  v9 = v5;

  *((_BYTE *)v7 + 48) = 1;
  v10 = (void *)v7[1];
  v7[1] = v6;

  return v7;
}

- (NSArray)attributes
{
  NSArray *attributes;

  attributes = self->_attributes;
  if (!attributes)
  {
    self->_attributes = (NSArray *)MEMORY[0x1E0C9AA60];

    attributes = self->_attributes;
  }
  return attributes;
}

- (void)setAttributes:(NSArray *)attributes
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  uint64_t v8;
  _QWORD v9[5];

  v4 = attributes;
  v5 = v4;
  if (v4)
  {
    v6 = (NSArray *)-[NSArray copy](v4, "copy");
    v7 = self->_attributes;
    self->_attributes = v6;
  }
  else
  {
    v7 = self->_attributes;
    self->_attributes = (NSArray *)MEMORY[0x1E0C9AA60];
  }

  *(_WORD *)&self->_programDirty = 257;
  std::shared_ptr<jet_buffer_pool>::reset[abi:ne180100](&self->_backingProgram.__ptr_);
  std::shared_ptr<jet_buffer_pool>::reset[abi:ne180100](&self->_backingProgramWithTransform.__ptr_);
  std::__tree<std::__value_type<std::string,std::shared_ptr<jet_buffer_pool>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<jet_buffer_pool>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<jet_buffer_pool>>>>::destroy((uint64_t)&self->_attributeBuffers, (_QWORD *)self->_attributeBuffers.__tree_.__pair1_.__value_.__left_);
  self->_attributeBuffers.__tree_.__begin_node_ = &self->_attributeBuffers.__tree_.__pair1_;
  self->_attributeBuffers.__tree_.__pair3_.__value_ = 0;
  v8 = MEMORY[0x1E0C809B0];
  self->_attributeBuffers.__tree_.__pair1_.__value_.__left_ = 0;
  v9[0] = v8;
  v9[1] = 3221225472;
  v9[2] = __26__SKShader_setAttributes___block_invoke;
  v9[3] = &unk_1EA500CF0;
  v9[4] = self;
  SKCPerformResourceOperation(v9);

}

void __26__SKShader_setAttributes___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  id obj;
  void *__p[2];
  char v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v30 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v7, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("a_%@"), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = objc_msgSend(v7, "type") - 1;
        if (v11 < 8)
        {
          v12 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)*a2 + 16))(*a2, dword_1DC923378[v11], dword_1DC923358[v11], 40);
          std::shared_ptr<jet_buffer_pool>::shared_ptr[abi:ne180100]<jet_buffer_pool,void>(&v27, v12);
          v13 = *(_QWORD *)(a1 + 32);
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
          v25 = v27;
          v26 = v28;
          if (v28)
          {
            p_shared_owners = (unint64_t *)&v28->__shared_owners_;
            do
              v15 = __ldxr(p_shared_owners);
            while (__stxr(v15 + 1, p_shared_owners));
          }
          std::__tree<std::__value_type<std::string,std::shared_ptr<jet_buffer_pool>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<jet_buffer_pool>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<jet_buffer_pool>>>>::__emplace_unique_key_args<std::string,std::pair<std::string,std::shared_ptr<jet_buffer_pool>>>((uint64_t **)(v13 + 120), (const void **)__p, (uint64_t)__p);
          v16 = v26;
          if (v26)
          {
            v17 = (unint64_t *)&v26->__shared_owners_;
            do
              v18 = __ldaxr(v17);
            while (__stlxr(v18 - 1, v17));
            if (!v18)
            {
              ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
              std::__shared_weak_count::__release_weak(v16);
            }
          }
          if (v24 < 0)
            operator delete(__p[0]);
          v19 = v28;
          if (v28)
          {
            v20 = (unint64_t *)&v28->__shared_owners_;
            do
              v21 = __ldaxr(v20);
            while (__stlxr(v21 - 1, v20));
            if (!v21)
            {
              ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
              std::__shared_weak_count::__release_weak(v19);
            }
          }
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v4);
  }

}

- (void)_attributeBuffers
{
  return &self->_attributeBuffers;
}

- (void)setSource:(NSString *)source
{
  NSString *v4;
  NSString *v5;
  NSString *fileName;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;

  v11 = source;
  v4 = (NSString *)-[NSString copy](v11, "copy");
  v5 = self->_source;
  self->_source = v4;

  fileName = self->_fileName;
  self->_fileName = 0;

  *(_WORD *)&self->_programDirty = 257;
  std::shared_ptr<jet_buffer_pool>::reset[abi:ne180100](&self->_backingProgram.__ptr_);
  std::shared_ptr<jet_buffer_pool>::reset[abi:ne180100](&self->_backingProgramWithTransform.__ptr_);
  *(_WORD *)&self->_usesTimeUniform = 0;
  if (self->_source)
  {
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("[^a-zA-Z0-9_](u_time)[^a-zA-Z0-9_]"), 1024, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstMatchInString:options:range:", self->_source, 0, 0, -[NSString length](self->_source, "length"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      self->_usesTimeUniform = 1;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("[^a-zA-Z0-9_](u_path_length)[^a-zA-Z0-9_]"), 1024, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "firstMatchInString:options:range:", self->_source, 0, 0, -[NSString length](self->_source, "length"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      self->_usesPathLengthUniform = 1;

  }
}

- (NSString)source
{
  return (NSString *)(id)-[NSString copy](self->_source, "copy");
}

- (NSArray)uniforms
{
  NSMutableArray *uniforms;

  uniforms = self->_uniforms;
  if (uniforms)
    return (NSArray *)(id)-[NSMutableArray copy](uniforms, "copy");
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)fragmentPrelude
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v26;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend((id)SKShader_preamble_fsh, "copy");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", self->_uniformData);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKShader _getLegacyUniformData](self, "_getLegacyUniformData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v4;
  if (v4)
  {
    objc_msgSend(v4, "uniform");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKey:", v26, v6);

    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  self->_usesSpriteSizeUniform = v7;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v27, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v30;
LABEL_6:
    v10 = 0;
    while (2)
    {
      if (*(_QWORD *)v30 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
      objc_msgSend(v11, "uniform");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      switch(objc_msgSend(v12, "uniformType"))
      {
        case 1:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("uniform mediump float %@; "), v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "stringByAppendingString:", v14);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        case 2:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("uniform mediump vec2 %@; "), v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "stringByAppendingString:", v14);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        case 3:
        case 4:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("uniform mediump vec4 %@; "), v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "stringByAppendingString:", v14);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        case 5:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("uniform mediump mat2 %@; "), v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "stringByAppendingString:", v14);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        case 6:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("uniform mediump mat3 %@; "), v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "stringByAppendingString:", v14);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        case 7:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("uniform mediump mat4 %@; "), v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "stringByAppendingString:", v14);
          v15 = objc_claimAutoreleasedReturnValue();
LABEL_16:
          v16 = (void *)v15;

          goto LABEL_17;
        case 8:
          objc_msgSend(v12, "textureValue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17 == 0;

          if (v18)
            goto LABEL_18;
          objc_msgSend(v12, "textureValue");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "textureTarget");

          if (v20 == 3553)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("uniform lowp sampler2D %@; "), v13);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "stringByAppendingString:", v21);
            v22 = objc_claimAutoreleasedReturnValue();

            v3 = (void *)v22;
          }
          objc_msgSend(v12, "textureValue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setTextureTarget:", objc_msgSend(v14, "textureTarget"));
          v16 = v3;
LABEL_17:

          v3 = v16;
LABEL_18:

          if (v8 != ++v10)
            continue;
          v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          v8 = v23;
          if (!v23)
            goto LABEL_25;
          goto LABEL_6;
        default:
          goto LABEL_18;
      }
    }
  }
LABEL_25:

  v24 = v3;
  return v24;
}

- (id)fragmentPreludeMetal
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend((id)SKShader_Metal_preamble_fsh, "copy");
  -[SKShader _getMetalVertexOutDefinition](self, "_getMetalVertexOutDefinition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)generateVertexAttributeDeclares:(id *)a3 statements:(id *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  __CFString *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  *a3 = CFSTR("\n\n/* Vertex Attribute Declares */\n");
  *a4 = CFSTR("\n\n/* Vertex Attribute Statements */\n");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SKShader attributes](self, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "type") - 1;
        if (v11 < 8)
        {
          v12 = off_1EA500DB0[v11];
          objc_msgSend(v10, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@attribute %@ a_%@;\n"), *a3, v12, v13);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          *a3 = v14;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@varying mediump %@ %@;\n"), v14, v12, v13);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@ = a_%@;\n"), *a4, v13, v13);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(*a3, "stringByAppendingString:", CFSTR("\n\n"));
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a4, "stringByAppendingString:", CFSTR("\n\n"));
  *a4 = (id)objc_claimAutoreleasedReturnValue();
}

- (void)generateFragmentAttributeDeclares:(id *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  *a3 = CFSTR("\n\n/* Fragment Attribute Declares */\n");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SKShader attributes](self, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "type") - 1;
        if (v9 < 8)
        {
          v10 = off_1EA500DB0[v9];
          objc_msgSend(v8, "name");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@varying mediump %@ %@;\n"), *a3, v10, v11);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  objc_msgSend(*a3, "stringByAppendingString:", CFSTR("\n\n"));
  *a3 = (id)objc_claimAutoreleasedReturnValue();
}

- (id)fullVertexSource
{
  return -[SKShader _fullVertexSourceWithImplementation:](self, "_fullVertexSourceWithImplementation:", 0);
}

- (id)fullVertexWithTransformSource
{
  return -[SKShader _fullVertexSourceWithImplementation:](self, "_fullVertexSourceWithImplementation:", 1);
}

- (id)_fullVertexSourceWithImplementation:(int64_t)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  id v19;

  v18 = 0;
  v19 = 0;
  -[SKShader generateVertexAttributeDeclares:statements:](self, "generateVertexAttributeDeclares:statements:", &v19, &v18);
  v4 = v19;
  v5 = v18;
  if (a3)
  {
    v6 = (void *)objc_msgSend((id)SKShader_declares_with_transform_vsh, "copy");
    objc_msgSend(v6, "stringByAppendingString:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend((id)SKShader_begin_main_with_transform_vsh, "copy");
    objc_msgSend(v7, "stringByAppendingString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "stringByAppendingString:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend((id)SKShader_end_main_with_transform_vsh, "copy");
  }
  else
  {
    v12 = (void *)objc_msgSend((id)SKShader_declares_vsh, "copy");
    objc_msgSend(v12, "stringByAppendingString:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend((id)SKShader_begin_main_vsh, "copy");
    objc_msgSend(v13, "stringByAppendingString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "stringByAppendingString:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend((id)SKShader_end_main_vsh, "copy");
  }
  objc_msgSend(v10, "stringByAppendingString:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)fullFragmentSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v16;
  NSMutableArray *obj;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  -[SKShader generateFragmentAttributeDeclares:](self, "generateFragmentAttributeDeclares:", &v23);
  v16 = v23;
  -[SKShader fragmentPrelude](self, "fragmentPrelude");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAppendingString:", v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(&stru_1EA5021F8, "stringByAppendingString:", v18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKShader source](self, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_uniforms;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v10, "uniformType") == 3)
        {
          objc_msgSend(v10, "name");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\\b%@(?=\\b)"), v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@.xyz)"), v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:options:range:", v12, v13, 1024, objc_msgSend(v18, "length"), objc_msgSend(v6, "length") - objc_msgSend(v18, "length"));
          v14 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v14;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  return v6;
}

- (id)fullMetalVertexSource
{
  return -[SKShader _fullMetalVertexSourceWithImplementation:](self, "_fullMetalVertexSourceWithImplementation:", 0);
}

- (id)fullMetalVertexWithTransformSource
{
  return -[SKShader _fullMetalVertexSourceWithImplementation:](self, "_fullMetalVertexSourceWithImplementation:", 1);
}

- (id)_fullMetalVertexSourceWithImplementation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t i;
  void *v13;
  unint64_t v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v27;
  _BOOL4 v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v28 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend((id)SKShader_Metal_declares_vsh, "copy");
  -[SKShader _getMetalVertexOutDefinition](self, "_getMetalVertexOutDefinition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("               vertex SKShader_VertexOut SKShader_VertexFunc (const device float4 *a_position  [[buffer(0)]],\n               const device float2 *a_tex_coord [[buffer(1)]],\n               constant float4 &u_color         [[buffer(2)]],\n               constant float4x4 &u_transform   [[buffer(3)]],\n               \n"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 4;
  }
  else
  {
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("               vertex SKShader_VertexOut SKShader_VertexFunc (const device uchar4 *a_color      [[buffer(0)]],\n               const device float4 *a_position   [[buffer(1)]],\n               const device float2 *a_tex_coord  [[buffer(2)]],\n               \n"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 3;
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[SKShader attributes](self, "attributes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v8)
  {
    v9 = &stru_1EA5021F8;
    v10 = *(_QWORD *)v31;
    v11 = &stru_1EA5021F8;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "type") - 1;
        if (v14 < 8)
        {
          v15 = off_1EA500DF0[v14];
          objc_msgSend(v13, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@const device %@ *a_%@   [[buffer(%d)]], "), v9, v15, v16, v7);
          v17 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@vOut.%@ = a_%@[vid];\n"), v11, v16, v16);
          v18 = objc_claimAutoreleasedReturnValue();

          v7 = (v7 + 1);
          v9 = (__CFString *)v17;
          v11 = (__CFString *)v18;
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v8);
  }
  else
  {
    v9 = &stru_1EA5021F8;
    v11 = &stru_1EA5021F8;
  }

  objc_msgSend(v27, "stringByAppendingString:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
    v20 = CFSTR("               unsigned int vid                  [[vertex_id]])\n               {\n               SKShader_VertexOut vOut;\n               vOut.position = a_position[vid] * u_transform;\n               vOut.v_tex_coord = a_tex_coord[vid];\n               vOut.v_color_mix = u_color;\n               return vOut;\n               \n");
  else
    v20 = CFSTR("               unsigned int vid                  [[vertex_id]])\n               {\n               SKShader_VertexOut vOut;\n               vOut.position = float4(a_position[vid].xyz, 1.0f);\n               vOut.v_path_distance = a_position[vid].w;\n               vOut.v_tex_coord = a_tex_coord[vid];\n               vOut.v_color_mix = float4(a_color[vid].r / 255.0f,\n               a_color[vid].g / 255.0f,\n               a_color[vid].b / 255.0f,\n               a_color[vid].a / 255.0f);\n               \n");
  objc_msgSend(v19, "stringByAppendingString:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "stringByAppendingString:", v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)objc_msgSend((id)SKShader_Metal_end_main_vsh, "copy");
  objc_msgSend(v22, "stringByAppendingString:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v24;
  return v25;
}

- (id)fullMetalFragmentSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_msgSend((id)SKShader_Metal_declares_vsh, "copy");
  -[SKShader fragmentPreludeMetal](self, "fragmentPreludeMetal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKShader _generateMetalSource](self, "_generateMetalSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setUniforms:(NSArray *)uniforms
{
  void *v3;
  NSArray *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unsigned int v18;
  NSArray *v19;
  NSMutableArray *obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = uniforms;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  v19 = v5;
  v6 = (NSMutableArray *)-[NSArray mutableCopy](v5, "mutableCopy");
  v7 = self->_uniforms;
  self->_uniforms = v6;

  -[NSMutableDictionary removeAllObjects](self->_uniformData, "removeAllObjects");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = self->_uniforms;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](self->_uniformData, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          NSLog(CFSTR("Error: Duplicate uniform: %@"), v12);
          v14 = self->_uniforms;
          objc_msgSend(v13, "uniform");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray removeExactObject:](v14, "removeExactObject:", v15);

        }
        v16 = (void *)objc_opt_new();
        objc_msgSend(v16, "setUniform:", v11);
        v17 = objc_msgSend(v11, "uniformType");
        if (v17 == 8)
        {
          objc_msgSend(v11, "textureValue");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v3, "textureTarget");
        }
        else
        {
          v18 = 0;
        }
        objc_msgSend(v16, "setTextureTarget:", v18);
        if (v17 == 8)

        -[NSMutableDictionary setObject:forKey:](self->_uniformData, "setObject:forKey:", v16, v12);
        objc_msgSend(v11, "_addTargetShader:", self);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  *(_WORD *)&self->_programDirty = 257;
  std::shared_ptr<jet_buffer_pool>::reset[abi:ne180100](&self->_backingProgram.__ptr_);
  std::shared_ptr<jet_buffer_pool>::reset[abi:ne180100](&self->_backingProgramWithTransform.__ptr_);

}

- (void)addUniform:(SKUniform *)uniform
{
  void *uniforms;
  SKUniform *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  SKUniform *v12;

  v5 = uniform;
  if (v5)
  {
    v12 = v5;
    -[SKUniform name](v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_uniformData, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      NSLog(CFSTR("Error: Duplicate uniform: %@"), v6);
      uniforms = self->_uniforms;
      objc_msgSend(v7, "uniform");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(uniforms, "removeObject:", v8);

    }
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setUniform:", v12);
    v10 = -[SKUniform uniformType](v12, "uniformType");
    if (v10 == 8)
    {
      -[SKUniform textureValue](v12, "textureValue");
      uniforms = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(uniforms, "textureTarget");
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v9, "setTextureTarget:", v11);
    if (v10 == 8)

    -[NSMutableDictionary setObject:forKey:](self->_uniformData, "setObject:forKey:", v9, v6);
    -[NSMutableArray addObject:](self->_uniforms, "addObject:", v12);
    -[SKUniform _addTargetShader:](v12, "_addTargetShader:", self);
    *(_WORD *)&self->_programDirty = 257;
    std::shared_ptr<jet_buffer_pool>::reset[abi:ne180100](&self->_backingProgram.__ptr_);
    std::shared_ptr<jet_buffer_pool>::reset[abi:ne180100](&self->_backingProgramWithTransform.__ptr_);

    v5 = v12;
  }

}

- (SKUniform)uniformNamed:(NSString *)name
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_uniformData, "objectForKey:", name);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniform");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SKUniform *)v4;
}

- (void)removeUniformNamed:(NSString *)name
{
  void *v4;
  NSMutableArray *uniforms;
  void *v6;
  void *v7;
  NSString *v8;

  v8 = name;
  -[NSMutableDictionary objectForKey:](self->_uniformData, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_uniformData, "removeObjectForKey:", v8);
    uniforms = self->_uniforms;
    objc_msgSend(v4, "uniform");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeExactObject:](uniforms, "removeExactObject:", v6);

    objc_msgSend(v4, "uniform");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_removeTargetShader:", self);

    *(_WORD *)&self->_programDirty = 257;
    std::shared_ptr<jet_buffer_pool>::reset[abi:ne180100](&self->_backingProgram.__ptr_);
    std::shared_ptr<jet_buffer_pool>::reset[abi:ne180100](&self->_backingProgramWithTransform.__ptr_);
  }

}

- (NSArray)_textureUniforms
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_uniforms;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "uniformType", (_QWORD)v10) == 8)
          objc_msgSend(v3, "addObject:", v8);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return (NSArray *)v3;
}

- (BOOL)isValid
{
  unint64_t *p_shared_owners;
  unint64_t v3;
  uint64_t v5;
  std::__shared_weak_count *v6;

  -[SKShader _backingProgram](self, "_backingProgram");
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v3 = __ldaxr(p_shared_owners);
    while (__stlxr(v3 - 1, p_shared_owners));
    if (!v3)
    {
      ((void (*)())v6->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return v5 != 0;
}

- (BOOL)_backingProgramIsDirty
{
  return self->_programDirty;
}

- (shared_ptr<jet_program>)_backingProgram
{
  jet_program **v2;
  SKShader *v3;
  jet_program **v4;
  jet_program *ptr;
  jet_program *v6;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v9;
  __shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  shared_ptr<jet_program> v13;
  shared_ptr<jet_program> result;

  v3 = self;
  v4 = v2;
  ptr = self->_backingProgram.__ptr_;
  if (!ptr)
  {
    if (self->_programDirty)
    {
      self = (SKShader *)-[SKShader _makeBackingProgramWithImplementation:](self, "_makeBackingProgramWithImplementation:", 0);
      v6 = v3->_backingProgram.__ptr_;
      cntrl = (std::__shared_weak_count *)v3->_backingProgram.__cntrl_;
      v3->_backingProgram = v13;
      v3->_programDirty = 0;
      if (!v13.__ptr_)
      {
        if (v3->_fileName)
          NSLog(CFSTR("SKShader '%@' failed to compile:\n%@"), v3->_fileName, v3->_compileLog, v6);
        else
          NSLog(CFSTR("SKShader failed to compile:\n%@"), v3->_compileLog);
        self = (SKShader *)kdebug_trace();
      }
      if (cntrl)
      {
        p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
        do
          v9 = __ldaxr(p_shared_owners);
        while (__stlxr(v9 - 1, p_shared_owners));
        if (!v9)
        {
          ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
          std::__shared_weak_count::__release_weak(cntrl);
        }
      }
      ptr = v3->_backingProgram.__ptr_;
    }
    else
    {
      ptr = 0;
    }
  }
  v10 = v3->_backingProgram.__cntrl_;
  *v4 = ptr;
  v4[1] = (jet_program *)v10;
  if (v10)
  {
    v11 = (unint64_t *)((char *)v10 + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (jet_program *)self;
  return result;
}

- (shared_ptr<jet_program>)_backingProgramWithTransform
{
  jet_program **v2;
  SKShader *v3;
  jet_program **v4;
  jet_program *ptr;
  jet_program *v6;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v9;
  __shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  shared_ptr<jet_program> v13;
  shared_ptr<jet_program> result;

  v3 = self;
  v4 = v2;
  ptr = self->_backingProgramWithTransform.__ptr_;
  if (!ptr)
  {
    if (self->_programWithTransformDirty)
    {
      self = (SKShader *)-[SKShader _makeBackingProgramWithImplementation:](self, "_makeBackingProgramWithImplementation:", 1);
      v6 = v3->_backingProgramWithTransform.__ptr_;
      cntrl = (std::__shared_weak_count *)v3->_backingProgramWithTransform.__cntrl_;
      v3->_backingProgramWithTransform = v13;
      v3->_programWithTransformDirty = 0;
      if (!v13.__ptr_)
      {
        if (v3->_fileName)
          NSLog(CFSTR("SKShader '%@' failed to compile:\n%@"), v3->_fileName, v3->_compileLog, v6);
        else
          NSLog(CFSTR("SKShader failed to compile:\n%@"), v3->_compileLog);
        self = (SKShader *)kdebug_trace();
      }
      if (cntrl)
      {
        p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
        do
          v9 = __ldaxr(p_shared_owners);
        while (__stlxr(v9 - 1, p_shared_owners));
        if (!v9)
        {
          ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
          std::__shared_weak_count::__release_weak(cntrl);
        }
      }
      ptr = v3->_backingProgramWithTransform.__ptr_;
    }
    else
    {
      ptr = 0;
    }
  }
  v10 = v3->_backingProgramWithTransform.__cntrl_;
  *v4 = ptr;
  v4[1] = (jet_program *)v10;
  if (v10)
  {
    v11 = (unint64_t *)((char *)v10 + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (jet_program *)self;
  return result;
}

- (shared_ptr<jet_program>)_makeBackingProgramWithImplementation:(int64_t)a3
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  jet_program *v8;
  __shared_weak_count *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  __n128 (*v17)(__n128 *, __n128 *);
  uint64_t (*v18)(uint64_t);
  const char *v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  shared_ptr<jet_program> result;

  v4 = v3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x4012000000;
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  v20 = 0;
  v21 = 0;
  v19 = "";
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__SKShader__makeBackingProgramWithImplementation___block_invoke;
  v13[3] = &unk_1EA500D18;
  v13[5] = &v14;
  v13[6] = a3;
  v13[4] = self;
  SKCPerformResourceOperation(v13);
  v5 = v15[7];
  *v4 = v15[6];
  v4[1] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  _Block_object_dispose(&v14, 8);
  v10 = v21;
  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  result.__cntrl_ = v9;
  result.__ptr_ = v8;
  return result;
}

void __50__SKShader__makeBackingProgramWithImplementation___block_invoke(uint64_t a1, _QWORD *a2)
{
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;

  if (!*a2)
    return;
  kdebug_trace();
  v39 = 0;
  v40 = 0;
  if ((*(unsigned int (**)(_QWORD))(*(_QWORD *)*a2 + 136))(*a2) != 1)
  {
    v17 = *(void **)(a1 + 32);
    if (*(_QWORD *)(a1 + 48))
      objc_msgSend(v17, "fullVertexWithTransformSource");
    else
      objc_msgSend(v17, "fullVertexSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "fullFragmentSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *a2;
    v15 = objc_retainAutorelease(v18);
    v11 = (*(uint64_t (**)(uint64_t, uint64_t, const char *, uint64_t, uint64_t *))(*(_QWORD *)v20 + 72))(v20, objc_msgSend(v15, "UTF8String"), "main", 1, &v40);
    v21 = *a2;
    v16 = objc_retainAutorelease(v19);
    v22 = (*(uint64_t (**)(uint64_t, uint64_t, const char *, uint64_t, uint64_t *))(*(_QWORD *)v21 + 72))(v21, objc_msgSend(v16, "UTF8String"), "main", 2, &v39);
    goto LABEL_16;
  }
  v4 = *(_BYTE **)(a1 + 32);
  if (!v4[48])
  {
    if (*(_QWORD *)(a1 + 48))
      objc_msgSend(v4, "fullMetalVertexWithTransformSource");
    else
      objc_msgSend(v4, "fullMetalVertexSource");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "fullMetalFragmentSource");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *a2;
    v15 = objc_retainAutorelease(v23);
    v11 = (*(uint64_t (**)(uint64_t, uint64_t, const char *, uint64_t, uint64_t *))(*(_QWORD *)v25 + 72))(v25, objc_msgSend(v15, "UTF8String"), "SKShader_VertexFunc", 1, &v40);
    v26 = *a2;
    v16 = objc_retainAutorelease(v24);
    v22 = (*(uint64_t (**)(uint64_t, uint64_t, const char *, uint64_t, uint64_t *))(*(_QWORD *)v26 + 72))(v26, objc_msgSend(v16, "UTF8String"), "SKShader_FragFunc", 2, &v39);
LABEL_16:
    v14 = v22;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), CFSTR("metallib"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *a2;
  v8 = objc_retainAutorelease(v6);
  v9 = objc_msgSend(v8, "UTF8String");
  if (*(_QWORD *)(a1 + 48))
    v10 = "SKShader_VertexTransformFunc";
  else
    v10 = "SKShader_VertexFunc";
  v11 = (*(uint64_t (**)(uint64_t, uint64_t, const char *, uint64_t, uint64_t *))(*(_QWORD *)v7 + 64))(v7, v9, v10, 1, &v40);
  v12 = *a2;
  v13 = objc_retainAutorelease(v8);
  v14 = (*(uint64_t (**)(uint64_t, uint64_t, const char *, uint64_t, uint64_t *))(*(_QWORD *)v12 + 64))(v12, objc_msgSend(v13, "UTF8String"), "SKShader_FragFunc", 2, &v39);

  v15 = 0;
  v16 = 0;
LABEL_17:
  v27 = v40;
  if (v40)
  {
    if (*(char *)(v40 + 23) < 0)
      operator delete(*(void **)v40);
    MEMORY[0x1DF0CF560](v27, 0x1012C40EC159624);
  }
  if (v39)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = *(_QWORD *)(a1 + 32);
    v30 = *(void **)(v29 + 56);
    *(_QWORD *)(v29 + 56) = v28;

    v31 = v39;
    if (v39)
    {
      if (*(char *)(v39 + 23) < 0)
        operator delete(*(void **)v39);
      MEMORY[0x1DF0CF560](v31, 0x1012C40EC159624);
    }
    if (!v11)
      goto LABEL_35;
  }
  else
  {
    v32 = *(_QWORD *)(a1 + 32);
    v33 = *(void **)(v32 + 56);
    *(_QWORD *)(v32 + 56) = &stru_1EA5021F8;

    if (!v11)
      goto LABEL_35;
  }
  if (v14)
  {
    v34 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)*a2 + 80))(*a2, v11, v14);
    std::shared_ptr<jet_program>::shared_ptr[abi:ne180100]<jet_program,void>(&v38, v34);
    std::shared_ptr<jet_buffer_pool>::operator=[abi:ne180100](*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48, &v38);
    v35 = (std::__shared_weak_count *)*((_QWORD *)&v38 + 1);
    if (*((_QWORD *)&v38 + 1))
    {
      v36 = (unint64_t *)(*((_QWORD *)&v38 + 1) + 8);
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }
    goto LABEL_36;
  }
LABEL_35:
  if (v11)
LABEL_36:
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);

}

- (shared_ptr<jet_command_buffer>)_commandsForBatchOffset:(int)a3 count:(int)a4
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t *v7;
  jet_command_buffer *v8;
  SKShader *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  int v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  __int128 *v50;
  uint64_t v51;
  uint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *p_shared_owners;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t **p_attributeBuffers;
  uint64_t j;
  __int128 *v62;
  uint64_t *v63;
  std::string::size_type v64;
  unint64_t *v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t current_buffer;
  uint64_t v69;
  std::__shared_weak_count *size;
  unint64_t *v71;
  unint64_t v72;
  jet_command_buffer *v73;
  __shared_weak_count *v74;
  int v76;
  int v77;
  int v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  id v84[2];
  id v85[2];
  id v86[2];
  NSArray *v87;
  id obj;
  uint64_t *v89;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 *v95;
  std::__shared_weak_count *v96;
  std::string __str;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  int v102;
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;
  shared_ptr<jet_command_buffer> result;

  v7 = v4;
  v105 = *MEMORY[0x1E0C80C00];
  v8 = (jet_command_buffer *)operator new();
  jet_command_buffer::jet_command_buffer(v8, 0x64uLL);
  std::shared_ptr<jet_command_buffer>::shared_ptr[abi:ne180100]<jet_command_buffer,void>(v7, (uint64_t)v8);
  v9 = self;
  v89 = v7;
  -[NSMutableDictionary allValues](self->_uniformData, "allValues");
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v104, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v99;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v99 != v11)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * i), "uniform");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        switch(objc_msgSend(v13, "uniformType"))
        {
          case 1:
            v15 = *v89;
            std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
            objc_msgSend(v13, "floatValue");
            v17 = v16;
            LODWORD(v95) = 22;
            std::vector<jet_render_op>::emplace_back<jet_render_opcode>((uint64_t *)(v15 + 8), (int *)&v95);
            v18 = *(_QWORD *)(v15 + 16);
            std::string::operator=((std::string *)(v18 - 176), &__str);
            *(_DWORD *)(v18 - 64) = v17;
            goto LABEL_24;
          case 2:
            v28 = *v89;
            std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
            objc_msgSend(v13, "vectorFloat2Value");
            v30 = v29;
            LODWORD(v95) = 23;
            std::vector<jet_render_op>::emplace_back<jet_render_opcode>((uint64_t *)(v28 + 8), (int *)&v95);
            v31 = *(_QWORD *)(v28 + 16);
            std::string::operator=((std::string *)(v31 - 176), &__str);
            *(_QWORD *)(v31 - 64) = v30;
            goto LABEL_24;
          case 3:
          case 4:
            v25 = *v89;
            std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
            objc_msgSend(v13, "vectorFloat4Value");
            *(_OWORD *)v84 = v26;
            LODWORD(v95) = 25;
            std::vector<jet_render_op>::emplace_back<jet_render_opcode>((uint64_t *)(v25 + 8), (int *)&v95);
            v27 = *(_QWORD *)(v25 + 16);
            std::string::operator=((std::string *)(v27 - 176), &__str);
            *(_OWORD *)(v27 - 64) = *(_OWORD *)v84;
            goto LABEL_24;
          case 5:
            v19 = *v89;
            std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
            objc_msgSend(v13, "matrixFloat2x2Value");
            v21 = v20;
            v23 = v22;
            LODWORD(v95) = 26;
            std::vector<jet_render_op>::emplace_back<jet_render_opcode>((uint64_t *)(v19 + 8), (int *)&v95);
            v24 = *(_QWORD *)(v19 + 16);
            std::string::operator=((std::string *)(v24 - 176), &__str);
            *(_QWORD *)(v24 - 64) = v21;
            *(_QWORD *)(v24 - 56) = v23;
            goto LABEL_24;
          case 6:
            v32 = *v89;
            std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
            objc_msgSend(v13, "matrixFloat3x3Value");
            v82 = v34;
            *(_OWORD *)v85 = v33;
            v80 = v35;
            LODWORD(v95) = 27;
            std::vector<jet_render_op>::emplace_back<jet_render_opcode>((uint64_t *)(v32 + 8), (int *)&v95);
            v36 = *(_QWORD *)(v32 + 16);
            std::string::operator=((std::string *)(v36 - 176), &__str);
            v38 = v82;
            v37 = *(_OWORD *)v85;
            HIDWORD(v37) = v78;
            HIDWORD(v38) = v77;
            v39 = v80;
            HIDWORD(v39) = v76;
            v40 = v76;
            *(_OWORD *)(v36 - 64) = v37;
            *(_OWORD *)(v36 - 48) = v38;
            *(_OWORD *)(v36 - 32) = v39;
            if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
            {
              operator delete(__str.__r_.__value_.__l.__data_);
              v40 = v76;
              HIDWORD(v38) = v77;
              HIDWORD(v37) = v78;
            }
            v77 = HIDWORD(v38);
            v78 = HIDWORD(v37);
            v76 = v40;
            break;
          case 7:
            v41 = *v89;
            std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
            objc_msgSend(v13, "matrixFloat4x4Value");
            v83 = v43;
            *(_OWORD *)v86 = v42;
            v79 = v45;
            v81 = v44;
            LODWORD(v95) = 28;
            std::vector<jet_render_op>::emplace_back<jet_render_opcode>((uint64_t *)(v41 + 8), (int *)&v95);
            v46 = *(_QWORD *)(v41 + 16);
            std::string::operator=((std::string *)(v46 - 176), &__str);
            *(_OWORD *)(v46 - 64) = *(_OWORD *)v86;
            *(_OWORD *)(v46 - 48) = v83;
            *(_OWORD *)(v46 - 32) = v81;
            *(_OWORD *)(v46 - 16) = v79;
            goto LABEL_24;
          case 8:
            v47 = *v89;
            std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
            objc_msgSend(v13, "textureValue");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v48;
            if (v48)
            {
              objc_msgSend(v48, "_backingTexture");
              v50 = v95;
            }
            else
            {
              v50 = 0;
              v95 = 0;
              v96 = 0;
            }
            v102 = 8;
            std::vector<jet_render_op>::emplace_back<jet_render_opcode>((uint64_t *)(v47 + 8), &v102);
            v51 = *(_QWORD *)(v47 + 16);
            *(_QWORD *)(v51 - 80) = v50;
            std::string::operator=((std::string *)(v51 - 176), &__str);
            v52 = v5;
            v53 = v96;
            if (v96)
            {
              p_shared_owners = (unint64_t *)&v96->__shared_owners_;
              do
                v55 = __ldaxr(p_shared_owners);
              while (__stlxr(v55 - 1, p_shared_owners));
              if (!v55)
              {
                ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
                std::__shared_weak_count::__release_weak(v53);
              }
            }

            v5 = v52;
LABEL_24:
            if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__str.__r_.__value_.__l.__data_);
            break;
          default:
            break;
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v104, 16);
    }
    while (v10);
  }

  if (v9->_usesSpriteSizeUniform)
  {
    v56 = *v89;
    std::string::basic_string[abi:ne180100]<0>(&__str, "u_sprite_size");
    LODWORD(v95) = 23;
    std::vector<jet_render_op>::emplace_back<jet_render_opcode>((uint64_t *)(v56 + 8), (int *)&v95);
    v57 = *(_QWORD *)(v56 + 16);
    std::string::operator=((std::string *)(v57 - 176), &__str);
    *(_QWORD *)(v57 - 64) = 0;
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__str.__r_.__value_.__l.__data_);
  }
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v87 = v9->_attributes;
  v58 = -[NSArray countByEnumeratingWithState:objects:count:](v87, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
  if (v58)
  {
    v59 = *(_QWORD *)v92;
    p_attributeBuffers = (uint64_t **)&v9->_attributeBuffers;
    do
    {
      for (j = 0; j != v58; ++j)
      {
        if (*(_QWORD *)v92 != v59)
          objc_enumerationMutation(v87);
        v62 = (__int128 *)objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * j), "getNameString");
        v95 = v62;
        v63 = std::__tree<std::__value_type<std::string,std::shared_ptr<jet_buffer_pool>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<jet_buffer_pool>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<jet_buffer_pool>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(p_attributeBuffers, (const void **)v62, (uint64_t)&std::piecewise_construct, &v95);
        v64 = v63[8];
        __str.__r_.__value_.__r.__words[0] = v63[7];
        __str.__r_.__value_.__l.__size_ = v64;
        if (v64)
        {
          v65 = (unint64_t *)(v64 + 8);
          do
            v66 = __ldxr(v65);
          while (__stxr(v66 + 1, v65));
        }
        SKCRendererEnsureBufferPoolCapacity(&__str, a3, a4);
        jet_buffer_pool::commit_data((jet_buffer_pool *)__str.__r_.__value_.__l.__data_);
        v67 = *v89;
        current_buffer = jet_buffer_pool::get_current_buffer((jet_buffer_pool *)__str.__r_.__value_.__l.__data_);
        LODWORD(v95) = 5;
        std::vector<jet_render_op>::emplace_back<jet_render_opcode>((uint64_t *)(v67 + 8), (int *)&v95);
        v69 = *(_QWORD *)(v67 + 16);
        *(_QWORD *)(v69 - 80) = current_buffer;
        std::string::operator=((std::string *)(v69 - 176), (const std::string *)v62);
        size = (std::__shared_weak_count *)__str.__r_.__value_.__l.__size_;
        if (__str.__r_.__value_.__l.__size_)
        {
          v71 = (unint64_t *)(__str.__r_.__value_.__l.__size_ + 8);
          do
            v72 = __ldaxr(v71);
          while (__stlxr(v72 - 1, v71));
          if (!v72)
          {
            ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
            std::__shared_weak_count::__release_weak(size);
          }
        }
      }
      v58 = -[NSArray countByEnumeratingWithState:objects:count:](v87, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
    }
    while (v58);
  }

  result.var1 = v74;
  result.var0 = v73;
  return result;
}

- (shared_ptr<jet_command_buffer>)_commands
{
  jet_command_buffer *v2;
  __shared_weak_count *v3;
  shared_ptr<jet_command_buffer> result;

  v2 = (jet_command_buffer *)-[SKShader _commandsForBatchOffset:count:](self, "_commandsForBatchOffset:count:", 0, 0);
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (id)_generateMetalSource
{
  void *v2;
  uint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v38;
  id v39;
  id obj;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  -[SKShader source](self, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");

  if (v3)
    v4 = (__CFString *)v3;
  else
    v4 = &stru_1EA5021F8;
  -[__CFString stringByReplacingOccurrencesOfString:withString:options:range:](v4, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("gl_FragColor\\s*=\\s*"), CFSTR("return "), 1024, 0, -[__CFString length](v4, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = (void *)objc_msgSend(&unk_1EA51B870, "mutableCopy");
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  -[SKShader attributes](self, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v55 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addObject:", v10);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
    }
    while (v7);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v41;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v51;
    do
    {
      v13 = 0;
      v14 = v5;
      do
      {
        if (*(_QWORD *)v51 != v12)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v13);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\\b%@(?=\\b)"), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("interpolated.%@"), v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:options:range:", v16, v17, 1024, 0, objc_msgSend(v14, "length"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        ++v13;
        v14 = v5;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    }
    while (v11);
  }

  v38 = (void *)objc_msgSend(&unk_1EA51B888, "mutableCopy");
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v18 = self->_uniforms;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v47 != v20)
          objc_enumerationMutation(v18);
        v22 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
        if (objc_msgSend(v22, "uniformType") != 8)
        {
          objc_msgSend(v22, "name");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v23);

        }
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
    }
    while (v19);
  }

  if ((objc_msgSend(v38, "containsObject:", CFSTR("u_sprite_size")) & 1) == 0
    && (objc_msgSend(obj, "containsObject:", CFSTR("u_sprite_size")) & 1) == 0)
  {
    objc_msgSend(v38, "addObject:", CFSTR("u_sprite_size"));
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v39 = v38;
  v24 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v43;
    do
    {
      v26 = 0;
      v27 = v5;
      do
      {
        if (*(_QWORD *)v43 != v25)
          objc_enumerationMutation(v39);
        v28 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v26);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\\b%@(?=\\b)"), v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@[0]"), v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringByReplacingOccurrencesOfString:withString:options:range:", v29, v30, 1024, 0, objc_msgSend(v27, "length"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        ++v26;
        v27 = v5;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
    }
    while (v24);
  }

  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("mat2\\s*\\("), CFSTR("_make_mat2("), 1024, 0, objc_msgSend(v5, "length"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKShader _getMetalFragmentFunctionName](self, "_getMetalFragmentFunctionName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("void\\s+main\\s*\\(\\s*(void)?\\s*\\)"), v32, 1024, 0, objc_msgSend(v31, "length"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("\\bdiscard(?=\\b)"), CFSTR(" discard_fragment()"), 1024, 0, objc_msgSend(v33, "length"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("\\bgl_FragCoord(?=\\b)"), CFSTR(" interpolated.position"), 1024, 0, objc_msgSend(v34, "length"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (id)_getMetalVertexOutDefinition
{
  void *v2;
  uint64_t v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SKShader attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = CFSTR("    struct SKShader_VertexOut {\n    float4 position [[position]];\n    float2 v_tex_coord;\n    float4 v_color_mix;\n    float v_path_distance;\n    ");
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "type") - 1;
        if (v8 < 8)
        {
          v9 = off_1EA500DF0[v8];
          objc_msgSend(v7, "name");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@ %@;\n"), v4, v9, v10);
          v11 = objc_claimAutoreleasedReturnValue();

          v4 = (__CFString *)v11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v3);
  }
  else
  {
    v4 = CFSTR("    struct SKShader_VertexOut {\n    float4 position [[position]];\n    float2 v_tex_coord;\n    float4 v_color_mix;\n    float v_path_distance;\n    ");
  }

  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("};\n"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_getMetalFragmentFunctionName
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  BOOL v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v27;
  void *v28;
  uint64_t v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", self->_uniformData);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKShader _getLegacyUniformData](self, "_getLegacyUniformData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v3;
  if (v3)
  {
    objc_msgSend(v3, "uniform");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKey:", v27, v5);

    v6 = 1;
  }
  else
  {
    v6 = 0;
  }
  self->_usesSpriteSizeUniform = v6;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v28, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v7)
  {
    v8 = 2;
    v29 = 1;
    v9 = &stru_1EA5021F8;
    v10 = *(_QWORD *)v32;
LABEL_6:
    v11 = 0;
    while (2)
    {
      if (*(_QWORD *)v32 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v11);
      objc_msgSend(v12, "uniform");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      switch(objc_msgSend(v13, "uniformType"))
      {
        case 1:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("const device float * %@ [[buffer(%d)]],"), v14, v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v15);
          v16 = objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        case 2:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("const device float2 * %@ [[buffer(%d)]],"), v14, v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v15);
          v16 = objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        case 3:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("const device float3 * %@ [[buffer(%d)]],"), v14, v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v15);
          v16 = objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        case 4:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("const device float4 * %@ [[buffer(%d)]],"), v14, v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v15);
          v16 = objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        case 5:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("const device float2x2 * %@ [[buffer(%d)]],"), v14, v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v15);
          v16 = objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        case 6:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("const device float3x3 * %@ [[buffer(%d)]],"), v14, v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v15);
          v16 = objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        case 7:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("const device float4x4 * %@ [[buffer(%d)]],"), v14, v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v15);
          v16 = objc_claimAutoreleasedReturnValue();
LABEL_17:
          v17 = (__CFString *)v16;

          v8 = (v8 + 1);
          goto LABEL_18;
        case 8:
          objc_msgSend(v13, "textureValue");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18 == 0;

          if (v19)
            goto LABEL_19;
          objc_msgSend(v13, "textureValue");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "textureTarget");

          if (v21 == 3553)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("texture2d<float> %@ [[texture(%d)]],"), v14, v29);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v22);
            v23 = objc_claimAutoreleasedReturnValue();

            v29 = (v29 + 1);
            v9 = (__CFString *)v23;
          }
          objc_msgSend(v13, "textureValue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setTextureTarget:", objc_msgSend(v15, "textureTarget"));
          v17 = v9;
LABEL_18:

          v9 = v17;
LABEL_19:

          if (v7 != ++v11)
            continue;
          v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          v7 = v24;
          if (!v24)
            goto LABEL_28;
          goto LABEL_6;
        default:
          goto LABEL_19;
      }
    }
  }
  v9 = &stru_1EA5021F8;
LABEL_28:

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@ SKShader_VertexOut interpolated     [[stage_in]])"), CFSTR("    fragment float4 SKShader_FragFunc(    texture2d<float>  u_texture         [[texture(0)]],     const device float *u_time           [[buffer(0)]],     const device float *u_path_length    [[buffer(1)]], "), v9);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)_getShaderCompilationLog
{
  return self->_compileLog;
}

- (id)_getMetalVertexShaderSource:(BOOL)a3
{
  if (self->_isPrecompiledMetal)
    return 0;
  if (a3)
    -[SKShader fullMetalVertexWithTransformSource](self, "fullMetalVertexWithTransformSource");
  else
    -[SKShader fullMetalVertexSource](self, "fullMetalVertexSource");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_getMetalFragmentShaderSource
{
  if (self->_isPrecompiledMetal)
    return 0;
  -[SKShader fullMetalFragmentSource](self, "fullMetalFragmentSource");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_usesTimeUniform
{
  return self->_usesTimeUniform;
}

- (BOOL)_usesPathLengthUniform
{
  return self->_usesPathLengthUniform;
}

- (void)_setUniformsDirty
{
  NSPointerArray *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_targetNodes;
  v4 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (v8)
          SKCNode::setFlags((SKCNode *)objc_msgSend(v8, "_backingNode", (_QWORD)v9), 2, 1);
        else
          v5 = 1;
      }
      v4 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);

    if ((v5 & 1) != 0)
      -[NSPointerArray compact](self->_targetNodes, "compact");
  }
  else
  {

  }
}

- (void)_addTargetNode:(id)a3
{
  -[NSPointerArray addPointer:](self->_targetNodes, "addPointer:", a3);
}

- (void)_removeTargetNode:(id)a3
{
  unint64_t i;
  id v5;

  v5 = a3;
  for (i = 0; -[NSPointerArray count](self->_targetNodes, "count") > i; ++i)
  {
    if (-[NSPointerArray pointerAtIndex:](self->_targetNodes, "pointerAtIndex:", i) == v5)
      -[NSPointerArray replacePointerAtIndex:withPointer:](self->_targetNodes, "replacePointerAtIndex:withPointer:", i, 0);
  }

}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeBool:forKey:", -[SKShader performFullCapture](self, "performFullCapture"), CFSTR("_isCapture"));
  -[SKShader uniforms](self, "uniforms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("_uniforms"));

  -[SKShader source](self, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("_source"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_fileName, CFSTR("_fileName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_attributes, CFSTR("_attributes"));

}

- (SKShader)initWithCoder:(id)a3
{
  id v4;
  NSPointerArray *v5;
  NSPointerArray *targetNodes;
  NSMutableDictionary *v7;
  NSMutableDictionary *uniformData;
  NSString *v9;
  NSString *fileName;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  NSString *v23;
  NSString *source;
  _QWORD v25[4];
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
  v5 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
  targetNodes = self->_targetNodes;
  self->_targetNodes = v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  uniformData = self->_uniformData;
  self->_uniformData = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fileName"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  fileName = self->_fileName;
  self->_fileName = v9;

  v11 = self->_fileName;
  if (v11 && -[NSString length](v11, "length") && (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isCapture")) & 1) == 0)
  {
    +[SKShader shaderWithFileNamed:](SKShader, "shaderWithFileNamed:", self->_fileName);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "source");
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    source = self->_source;
    self->_source = v23;

    *(_WORD *)&self->_programDirty = 257;
    std::shared_ptr<jet_buffer_pool>::reset[abi:ne180100](&self->_backingProgram.__ptr_);
    std::shared_ptr<jet_buffer_pool>::reset[abi:ne180100](&self->_backingProgramWithTransform.__ptr_);
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_source"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKShader setSource:](self, "setSource:", v12);

  }
  v13 = (void *)MEMORY[0x1E0C99E60];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  v26[2] = objc_opt_class();
  v26[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("_attributes"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKShader setAttributes:](self, "setAttributes:", v16);

  v17 = (void *)MEMORY[0x1E0C99E60];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v25[2] = objc_opt_class();
  v25[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("_uniforms"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKShader setUniforms:](self, "setUniforms:", v20);

  return self;
}

- (BOOL)isEqualToShader:(id)a3
{
  SKShader *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  unint64_t v10;
  void *v11;
  void *v12;
  char v13;
  NSString *fileName;

  v4 = (SKShader *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    v5 = 0;
    while (-[NSMutableArray count](self->_uniforms, "count") > v5)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_uniforms, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](v4->_uniforms, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToUniform:", v7);

      ++v5;
      if ((v8 & 1) == 0)
        goto LABEL_16;
    }
    v10 = 0;
    while (-[NSArray count](self->_attributes, "count") > v10)
    {
      -[NSArray objectAtIndexedSubscript:](self->_attributes, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](v4->_attributes, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToAttribute:", v12);

      ++v10;
      if ((v13 & 1) == 0)
        goto LABEL_16;
    }
    fileName = self->_fileName;
    if ((!fileName || !v4->_fileName || (-[NSString isEqual:](fileName, "isEqual:") & 1) != 0)
      && -[NSString isEqual:](self->_source, "isEqual:", v4->_source))
    {
      v9 = self->_performFullCapture == v4->_performFullCapture;
      goto LABEL_17;
    }
LABEL_16:
    v9 = 0;
  }
LABEL_17:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SKShader source](self, "source", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  -[SKShader uniforms](self, "uniforms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  +[SKShader shaderWithSource:uniforms:](SKShader, "shaderWithSource:uniforms:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKShader attributes](self, "attributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttributes:", v9);

  return v8;
}

- (id)_getLegacyUniformData
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[NSMutableDictionary allValues](self->_uniformData, "allValues");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v22;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v5)
        objc_enumerationMutation(v3);
      objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v6), "uniform");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqual:", CFSTR("u_sprite_size"));

      if ((v9 & 1) != 0)
        goto LABEL_18;
      if (v4 == ++v6)
      {
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = self->_attributes;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
LABEL_11:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v11)
        objc_enumerationMutation(v3);
      objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "name", (_QWORD)v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqual:", CFSTR("u_sprite_size"));

      if ((v14 & 1) != 0)
        break;
      if (v10 == ++v12)
      {
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v10)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
LABEL_18:
    v15 = 0;
    goto LABEL_19;
  }
LABEL_17:

  +[SKUniform uniformWithName:vectorFloat2:](SKUniform, "uniformWithName:vectorFloat2:", CFSTR("u_sprite_size"), 0.0);
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setUniform:", v3);
LABEL_19:

  return v15;
}

- (BOOL)performFullCapture
{
  return self->_performFullCapture;
}

- (void)setPerformFullCapture:(BOOL)a3
{
  self->_performFullCapture = a3;
}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<std::string,std::shared_ptr<jet_buffer_pool>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<jet_buffer_pool>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<jet_buffer_pool>>>>::destroy((uint64_t)&self->_attributeBuffers, (_QWORD *)self->_attributeBuffers.__tree_.__pair1_.__value_.__left_);
  std::shared_ptr<jet_buffer_pool>::~shared_ptr[abi:ne180100]((uint64_t)&self->_backingProgramWithTransform);
  std::shared_ptr<jet_buffer_pool>::~shared_ptr[abi:ne180100]((uint64_t)&self->_backingProgram);
  objc_storeStrong((id *)&self->_targetNodes, 0);
  objc_storeStrong((id *)&self->_compileLog, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_uniformData, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_uniforms, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 17) = 0;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_QWORD *)self + 15) = (char *)self + 128;
  return self;
}

@end
