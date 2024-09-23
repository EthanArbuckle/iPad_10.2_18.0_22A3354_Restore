@implementation _ANEModel

- (unsigned)perfStatsMask
{
  return self->_perfStatsMask;
}

- (id)getCacheURLIdentifier
{
  return self->_cacheURLIdentifier;
}

- (NSDictionary)modelAttributes
{
  return self->_modelAttributes;
}

+ (id)modelAtURL:(id)a3 key:(id)a4
{
  return (id)objc_msgSend(a1, "modelAtURL:key:modelAttributes:", a3, a4, MEMORY[0x1E0C9AA70]);
}

- (unint64_t)intermediateBufferHandle
{
  return self->_intermediateBufferHandle;
}

+ (id)modelAtURL:(id)a3 key:(id)a4 modelAttributes:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  +[_ANEModel correctFileURLFormat:](_ANEModel, "correctFileURLFormat:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithModelAtURL:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:", v10, v9, 1, 0, v8, 1);

  return v11;
}

- (_ANEModel)initWithModelAtURL:(id)a3 key:(id)a4 identifierSource:(int64_t)a5 cacheURLIdentifier:(id)a6 modelAttributes:(id)a7 standardizeURL:(BOOL)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _ANEModel *v20;
  uint64_t v22;
  uint64_t v23;

  v14 = (void *)MEMORY[0x1E0CB3A28];
  v15 = a7;
  v16 = a6;
  v17 = a4;
  v18 = a3;
  objc_msgSend(v14, "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v23) = 1;
  LOBYTE(v22) = a8;
  v20 = -[_ANEModel initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:](self, "initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:", v18, 0, v19, v17, a5, v16, v15, v22, 0, v23);

  return v20;
}

+ (id)correctFileURLFormat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    +[_ANELog common](_ANELog, "common");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[_ANEModel correctFileURLFormat:].cold.1(v8, v9, v10);
    v7 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v4, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[_ANELog common](_ANELog, "common");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v12;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1D3352000, v11, OS_LOG_TYPE_INFO, "%@: modelURL=%@ doesn't have scheme", (uint8_t *)&v15, 0x16u);

    }
    v13 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v5, "path");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fileURLWithPath:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  v7 = v5;
  if ((objc_msgSend(v5, "isFileURL") & 1) == 0)
  {
    +[_ANELog common](_ANELog, "common");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[_ANEModel correctFileURLFormat:].cold.2();
    v7 = v5;
LABEL_13:

  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  _ANEModel *v4;
  _ANEModel *v5;
  BOOL v6;

  v4 = (_ANEModel *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[_ANEModel isEqualToModel:](self, "isEqualToModel:", v5);

  return v6;
}

- (void)dealloc
{
  unint64_t v4;
  NSObject *v5;
  objc_super v6;

  self->_state = 5;
  v4 = kdebug_trace_string();
  self->_string_id = v4;
  if (v4 == -1)
  {
    +[_ANELog common](_ANELog, "common");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[_ANEModel initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:].cold.4(a2);

  }
  v6.receiver = self;
  v6.super_class = (Class)_ANEModel;
  -[_ANEModel dealloc](&v6, sel_dealloc);
}

- (id)shallowCopy
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;

  v3 = objc_alloc((Class)objc_opt_class());
  -[_ANEModel modelURL](self, "modelURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANEModel sourceURL](self, "sourceURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANEModel UUID](self, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANEModel key](self, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_ANEModel identifierSource](self, "identifierSource");
  -[_ANEModel cacheURLIdentifier](self, "cacheURLIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_ANEModel string_id](self, "string_id");
  LOBYTE(v14) = 0;
  LOBYTE(v13) = 0;
  v11 = (void *)objc_msgSend(v3, "initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:", v4, v5, v6, v7, v8, v9, MEMORY[0x1E0C9AA70], v13, v10, v14);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v4 = a3;
  -[_ANEModel modelURL](self, "modelURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("url"));

  -[_ANEModel sourceURL](self, "sourceURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sourceurl"));

  -[_ANEModel UUID](self, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("uuid"));

  -[_ANEModel key](self, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("key"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_ANEModel identifierSource](self, "identifierSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("identifierSource"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_ANEModel string_id](self, "string_id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("string_id"));

  -[_ANEModel cacheURLIdentifier](self, "cacheURLIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("identifier"));

  +[_ANELog common](_ANELog, "common");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[_ANEModel encodeWithCoder:].cold.1();

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[_ANEModel modelURL](self, "modelURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_ANEModel sourceURL](self, "sourceURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[_ANEModel key](self, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[_ANEModel cacheURLIdentifier](self, "cacheURLIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqualToModel:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  BOOL v39;

  v4 = a3;
  if (!v4)
    goto LABEL_30;
  -[_ANEModel cacheURLIdentifier](self, "cacheURLIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "cacheURLIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 == 0;

  }
  -[_ANEModel modelURL](self, "modelURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v4, "modelURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10 == 0;

  }
  -[_ANEModel sourceURL](self, "sourceURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v4, "sourceURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13 == 0;

  }
  -[_ANEModel key](self, "key");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(v4, "key");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v16 == 0;

  }
  v17 = -[_ANEModel identifierSource](self, "identifierSource");
  v18 = objc_msgSend(v4, "identifierSource");
  -[_ANEModel modelURL](self, "modelURL");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    objc_msgSend(v4, "modelURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[_ANEModel modelURL](self, "modelURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "modelURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v22, "isEqual:", v23);

    }
  }
  -[_ANEModel sourceURL](self, "sourceURL");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    objc_msgSend(v4, "sourceURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[_ANEModel sourceURL](self, "sourceURL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sourceURL");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v27, "isEqual:", v28);

    }
  }
  -[_ANEModel cacheURLIdentifier](self, "cacheURLIdentifier");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    objc_msgSend(v4, "cacheURLIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      -[_ANEModel cacheURLIdentifier](self, "cacheURLIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "cacheURLIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v32, "isEqualToString:", v33);

    }
  }
  -[_ANEModel key](self, "key");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)v34;
    objc_msgSend(v4, "key");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      -[_ANEModel key](self, "key");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "key");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v37, "isEqualToString:", v38);

    }
  }
  if ((v9 & v12 & v6) == 1)
  {
    if (v17 == v18)
      v39 = v15;
    else
      v39 = 0;
  }
  else
  {
LABEL_30:
    v39 = 0;
  }

  return v39;
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (NSString)key
{
  return self->_key;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (NSString)cacheURLIdentifier
{
  return self->_cacheURLIdentifier;
}

- (int64_t)identifierSource
{
  return self->_identifierSource;
}

- (unint64_t)string_id
{
  return self->_string_id;
}

- (unint64_t)programHandle
{
  return self->_programHandle;
}

- (void)updateModelAttributes:(id)a3 state:(unint64_t)a4 programHandle:(unint64_t)a5 intermediateBufferHandle:(unint64_t)a6 queueDepth:(char)a7
{
  uint64_t v7;
  os_unfair_lock_s *p_l;
  id v13;

  v7 = a7;
  p_l = &self->_l;
  v13 = a3;
  os_unfair_lock_lock(p_l);
  -[_ANEModel setModelAttributes:](self, "setModelAttributes:", v13);

  -[_ANEModel setState:](self, "setState:", a4);
  -[_ANEModel setProgramHandle:](self, "setProgramHandle:", a5);
  -[_ANEModel setIntermediateBufferHandle:](self, "setIntermediateBufferHandle:", a6);
  -[_ANEModel setQueueDepth:](self, "setQueueDepth:", v7);
  os_unfair_lock_unlock(p_l);
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void)setQueueDepth:(char)a3
{
  self->_queueDepth = a3;
}

- (void)setProgramHandle:(unint64_t)a3
{
  self->_programHandle = a3;
}

- (void)setProgram:(id)a3
{
  objc_storeStrong((id *)&self->_program, a3);
}

- (void)setModelAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_modelAttributes, a3);
}

- (void)setMapper:(id)a3
{
  objc_storeStrong((id *)&self->_mapper, a3);
}

- (void)setIntermediateBufferHandle:(unint64_t)a3
{
  self->_intermediateBufferHandle = a3;
}

- (void)setCacheURLIdentifier:(id)a3
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *cacheURLIdentifier;
  NSString *v10;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "containsString:", CFSTR(".."));
    +[_ANELog common](_ANELog, "common");
    v8 = objc_claimAutoreleasedReturnValue();
    cacheURLIdentifier = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[_ANEModel initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:].cold.1();
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[_ANEModel setCacheURLIdentifier:].cold.3();

      if (-[NSString isEqualToString:](self->_cacheURLIdentifier, "isEqualToString:", v6))
      {
        +[_ANELog common](_ANELog, "common");
        cacheURLIdentifier = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(cacheURLIdentifier, OS_LOG_TYPE_DEBUG))
          -[_ANEModel setCacheURLIdentifier:].cold.2(a2, cacheURLIdentifier);
      }
      else
      {
        v10 = (NSString *)objc_msgSend(v6, "copy");
        cacheURLIdentifier = self->_cacheURLIdentifier;
        self->_cacheURLIdentifier = v10;
      }
    }

  }
}

- (_ANEModel)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _ANEModel *v15;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceurl"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifierSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("string_id"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedLongLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[_ANELog common](_ANELog, "common");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[_ANEModel initWithCoder:].cold.1();

  LOBYTE(v18) = 0;
  LOBYTE(v17) = 0;
  v15 = -[_ANEModel initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:](self, "initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:", v5, v6, v7, v8, v10, v13, MEMORY[0x1E0C9AA70], v17, v12, v18);

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheURLIdentifier, 0);
  objc_storeStrong((id *)&self->_mapper, 0);
  objc_storeStrong((id *)&self->_program, 0);
  objc_storeStrong((id *)&self->_modelAttributes, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
}

- (_ANEProgramForEvaluation)program
{
  return self->_program;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)new
{
  return 0;
}

- (_ANEModel)init
{

  return 0;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  void *v12;
  void *v13;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v20 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANEModel modelURL](self, "modelURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANEModel sourceURL](self, "sourceURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANEModel UUID](self, "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANEModel key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[_ANEModel identifierSource](self, "identifierSource");
  -[_ANEModel getCacheURLIdentifier](self, "getCacheURLIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_ANEModel string_id](self, "string_id");
  -[_ANEModel program](self, "program");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_ANEModel state](self, "state");
  v9 = -[_ANEModel programHandle](self, "programHandle");
  v10 = -[_ANEModel intermediateBufferHandle](self, "intermediateBufferHandle");
  v11 = -[_ANEModel queueDepth](self, "queueDepth");
  -[_ANEModel modelAttributes](self, "modelAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: { modelURL=%@ : sourceURL=%@ : UUID=%@ : key=%@ : identifierSource=%u : cacheURLIdentifier=%@ : string_id=0x%08llx : program=%@ : state=%lu : programHandle=%llu : intermediateBufferHandle=%llu : queueDepth=%d : attr=%@ : perfStatsMask=%u} "), v19, v18, v17, v16, v4, v15, v5, v6, v7, v8, v9, v10, v11, v12, -[_ANEModel perfStatsMask](self, "perfStatsMask"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (_ANEModel)initWithModelAtURL:(id)a3 sourceURL:(id)a4 UUID:(id)a5 key:(id)a6 identifierSource:(int64_t)a7 cacheURLIdentifier:(id)a8 modelAttributes:(id)a9 standardizeURL:(BOOL)a10 string_id:(unint64_t)a11 generateNewStringId:(BOOL)a12
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  _ANEModel *v25;
  _ANEModel *v27;
  _ANEModel *v28;
  uint64_t v29;
  NSURL *modelURL;
  NSURL *v31;
  NSURL *sourceURL;
  uint64_t v33;
  NSString *key;
  uint64_t v35;
  NSString *cacheURLIdentifier;
  id v37;
  NSObject *v38;
  id v40;
  objc_super v41;

  v40 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a8;
  v23 = a9;
  if (objc_msgSend(v22, "containsString:", CFSTR("..")))
  {
    +[_ANELog common](_ANELog, "common");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[_ANEModel initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:].cold.1();
LABEL_12:

    v25 = 0;
    goto LABEL_13;
  }
  if (a7 == 3 && !v22)
  {
    +[_ANELog common](_ANELog, "common");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[_ANEModel initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:].cold.2(a2);
    goto LABEL_12;
  }
  if (!v19 && a7 == 2)
  {
    +[_ANELog common](_ANELog, "common");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[_ANEModel initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:].cold.3(a2);
    goto LABEL_12;
  }
  v41.receiver = self;
  v41.super_class = (Class)_ANEModel;
  v27 = -[_ANEModel init](&v41, sel_init);
  v28 = v27;
  if (v27)
  {
    v27->_l._os_unfair_lock_opaque = 0;
    if (a10)
    {
      objc_msgSend(v40, "URLByStandardizingPath");
      v29 = objc_claimAutoreleasedReturnValue();
      modelURL = v28->_modelURL;
      v28->_modelURL = (NSURL *)v29;

      objc_msgSend(v19, "URLByStandardizingPath");
      v31 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_storeStrong((id *)&v27->_modelURL, a3);
      v31 = (NSURL *)v19;
    }
    sourceURL = v28->_sourceURL;
    v28->_sourceURL = v31;

    v33 = objc_msgSend(v21, "copy");
    key = v28->_key;
    v28->_key = (NSString *)v33;

    v28->_identifierSource = a7;
    v35 = objc_msgSend(v22, "copy");
    cacheURLIdentifier = v28->_cacheURLIdentifier;
    v28->_cacheURLIdentifier = (NSString *)v35;

    objc_storeStrong((id *)&v28->_modelAttributes, a9);
    v28->_state = 1;
    objc_storeStrong((id *)&v28->_UUID, a5);
    if (a12)
    {
      objc_msgSend(v40, "path");
      v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v37, "UTF8String");
      v28->_string_id = kdebug_trace_string();

      if (v28->_string_id == -1)
      {
        +[_ANELog common](_ANELog, "common");
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          -[_ANEModel initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:].cold.4(a2);

      }
    }
    else
    {
      v28->_string_id = a11;
    }
  }
  self = v28;
  v25 = self;
LABEL_13:

  return v25;
}

- (_ANEModel)initWithModelIdentifier:(id)a3
{
  return -[_ANEModel initWithModelAtURL:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:](self, "initWithModelAtURL:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:", 0, 0, 3, a3, MEMORY[0x1E0C9AA70], 0);
}

+ (id)modelWithCacheURLIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithModelIdentifier:", v4);

  return v5;
}

+ (id)modelAtURLWithCacheURLIdentifier:(id)a3 key:(id)a4 cacheURLIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  +[_ANEModel correctFileURLFormat:](_ANEModel, "correctFileURLFormat:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc((Class)a1);
  v12 = (void *)objc_msgSend(v11, "initWithModelAtURL:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:", v10, v9, 3, v8, MEMORY[0x1E0C9AA70], 1);

  return v12;
}

- (id)getUUID
{
  return self->_UUID;
}

+ (id)modelAtURLWithSourceURL:(id)a3 sourceURL:(id)a4 key:(id)a5 cacheURLIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  +[_ANEModel correctFileURLFormat:](_ANEModel, "correctFileURLFormat:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = 1;
  LOBYTE(v18) = 1;
  v16 = (void *)objc_msgSend(v14, "initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:", v13, v12, v15, v11, 1, v10, MEMORY[0x1E0C9AA70], v18, 0, v19);

  return v16;
}

+ (id)modelAtURLWithSourceURL:(id)a3 sourceURL:(id)a4 key:(id)a5 identifierSource:(int64_t)a6 cacheURLIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;

  v12 = a7;
  v13 = a5;
  v14 = a4;
  +[_ANEModel correctFileURLFormat:](_ANEModel, "correctFileURLFormat:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = 1;
  LOBYTE(v20) = 1;
  v18 = (void *)objc_msgSend(v16, "initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:", v15, v14, v17, v13, a6, v12, MEMORY[0x1E0C9AA70], v20, 0, v21);

  return v18;
}

- (void)updateModelAttributes:(id)a3 state:(unint64_t)a4
{
  os_unfair_lock_s *p_l;
  id v7;

  p_l = &self->_l;
  v7 = a3;
  os_unfair_lock_lock(p_l);
  -[_ANEModel setModelAttributes:](self, "setModelAttributes:", v7);

  -[_ANEModel setState:](self, "setState:", a4);
  os_unfair_lock_unlock(p_l);
}

- (void)resetOnUnload
{
  os_unfair_lock_s *p_l;

  p_l = &self->_l;
  os_unfair_lock_lock(&self->_l);
  -[_ANEModel setModelAttributes:](self, "setModelAttributes:", MEMORY[0x1E0C9AA70]);
  -[_ANEModel setState:](self, "setState:", 4);
  -[_ANEModel setProgramHandle:](self, "setProgramHandle:", 0);
  -[_ANEModel setIntermediateBufferHandle:](self, "setIntermediateBufferHandle:", 0);
  -[_ANEModel setQueueDepth:](self, "setQueueDepth:", 0);
  os_unfair_lock_unlock(p_l);
}

- (id)procedureInfoForProcedureIndex:(unsigned int)a3
{
  os_unfair_lock_s *p_l;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  unsigned int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  p_l = &self->_l;
  os_unfair_lock_lock(&self->_l);
  -[_ANEModel modelAttributes](self, "modelAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  os_unfair_lock_unlock(p_l);
  objc_msgSend(v7, "objectForKeyedSubscript:", kANEFModelDescriptionKey[0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v11, "objectForKeyedSubscript:", kANEFModelProceduresArrayKey[0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v13 = v12;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __44___ANEModel_procedureInfoForProcedureIndex___block_invoke;
  v18[3] = &unk_1E9516108;
  v19 = a3;
  v18[4] = &v20;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v18);
  v16 = (void *)objc_msgSend((id)v21[5], "copy");
  _Block_object_dispose(&v20, 8);

  return v16;
}

- (id)symbolIndicesForProcedureIndex:(unsigned int)a3 indexArrayKey:(id)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  _ANEModel *v30;
  __int16 v31;
  _ANEModel *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v4 = *(_QWORD *)&a3;
  v35 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[_ANEModel procedureInfoForProcedureIndex:](self, "procedureInfoForProcedureIndex:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = v13;
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(v9, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v18++), "unsignedIntegerValue", (_QWORD)v22));
        }
        while (v16 != v18);
        v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v16);
    }

  }
  else
  {
    +[_ANELog common](_ANELog, "common");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v28 = v21;
      v29 = 2048;
      v30 = self;
      v31 = 2112;
      v32 = self;
      v33 = 1024;
      v34 = v4;
      _os_log_debug_impl(&dword_1D3352000, v14, OS_LOG_TYPE_DEBUG, "%@: model[%p]=%@ missing procedure info for index=%d", buf, 0x26u);

    }
  }

  v19 = (void *)objc_msgSend(v9, "copy");
  return v19;
}

- (id)inputSymbolIndicesForProcedureIndex:(unsigned int)a3
{
  return -[_ANEModel symbolIndicesForProcedureIndex:indexArrayKey:](self, "symbolIndicesForProcedureIndex:indexArrayKey:", *(_QWORD *)&a3, kANEFModelInputSymbolIndexArrayKey[0]);
}

- (id)outputSymbolIndicesForProcedureIndex:(unsigned int)a3
{
  return -[_ANEModel symbolIndicesForProcedureIndex:indexArrayKey:](self, "symbolIndicesForProcedureIndex:indexArrayKey:", *(_QWORD *)&a3, kANEFModelOutputSymbolIndexArrayKey[0]);
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  +[_ANELog common](_ANELog, "common", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_ANEModel copyWithZone:].cold.1(a2, v5);

  -[_ANEModel cacheURLIdentifier](self, "cacheURLIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_class();
  if (v6)
  {
    -[_ANEModel cacheURLIdentifier](self, "cacheURLIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "modelWithCacheURLIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_ANEModel modelURL](self, "modelURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ANEModel key](self, "key");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ANEModel modelAttributes](self, "modelAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "modelAtURL:key:modelAttributes:", v8, v10, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setString_id:(unint64_t)a3
{
  self->_string_id = a3;
}

- (char)queueDepth
{
  return self->_queueDepth;
}

- (void)setPerfStatsMask:(unsigned int)a3
{
  self->_perfStatsMask = a3;
}

- (os_unfair_lock_s)l
{
  return self->_l;
}

- (void)setL:(os_unfair_lock_s)a3
{
  self->_l = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (_ANEProgramIOSurfacesMapper)mapper
{
  return self->_mapper;
}

- (void)initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1D3352000, v2, v3, "%@: cacheURLIdentifier(%@) contains .., hence invalid", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)initWithModelAtURL:(const char *)a1 sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:.cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_1D3352000, v2, v3, "%@: identifierSource is _ANEModelCacheURLIdentifierSource but cacheURLIdentifier is nil", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

- (void)initWithModelAtURL:(const char *)a1 sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:.cold.3(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_1D3352000, v2, v3, "%@: identifierSource is _ANEModelIdentifierSourceURLAndKey but sourceURL is nil", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

- (void)initWithModelAtURL:(const char *)a1 sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:.cold.4(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  __error();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_1_2(&dword_1D3352000, v2, v3, "%@: kdebug_trace_string() failed errno=%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

- (void)setCacheURLIdentifier:(const char *)a1 .cold.2(const char *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0(&dword_1D3352000, a2, v4, "%@: cacheURLIdentifier is set already!", v5);

  OUTLINED_FUNCTION_2_2();
}

- (void)setCacheURLIdentifier:.cold.3()
{
  NSObject *v0;
  SEL v1;
  void *v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_3();
  v4 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  _os_log_debug_impl(&dword_1D3352000, v0, OS_LOG_TYPE_DEBUG, "%@: cacheURLIdentifier=%@", v3, 0x16u);

  OUTLINED_FUNCTION_2();
}

+ (void)correctFileURLFormat:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "+[_ANEModel correctFileURLFormat:]";
  OUTLINED_FUNCTION_6_0(&dword_1D3352000, a1, a3, "%s modelURL is nil", (uint8_t *)&v3);
}

+ (void)correctFileURLFormat:.cold.2()
{
  void *v0;
  SEL v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1(&dword_1D3352000, v3, v4, "%@: modelURL.scheme: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)encodeWithCoder:.cold.1()
{
  void *v0;
  SEL v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "identifierSource");
  OUTLINED_FUNCTION_1_2(&dword_1D3352000, v3, v4, "%@: identifierSource=%u", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithCoder:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1_2(&dword_1D3352000, v2, v3, "%@: identifierSource=%u", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)copyWithZone:(const char *)a1 .cold.1(const char *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0(&dword_1D3352000, a2, v4, "%@", v5);

  OUTLINED_FUNCTION_2_2();
}

@end
