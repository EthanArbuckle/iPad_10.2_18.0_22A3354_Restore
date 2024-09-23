@implementation _CSEmbedding

- (_CSEmbedding)initWithFormat:(int)a3 dimension:(int)a4 version:(unsigned __int16)a5 vectors:(id)a6
{
  id v10;
  _CSEmbedding *v11;
  _CSEmbedding *v12;
  NSDictionary *properties;
  NSArray *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *vectors;
  _CSEmbedding *v27;
  _CSEmbedding *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v35.receiver = self;
  v35.super_class = (Class)_CSEmbedding;
  v11 = -[_CSEmbedding init](&v35, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_format = a3;
    v11->_dimension = a4;
    v11->_version = a5;
    properties = v11->_properties;
    v29 = v11;
    v11->_properties = (NSDictionary *)MEMORY[0x1E0C9AA70];

    v14 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v30 = v10;
    v15 = v10;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v16)
    {
      v17 = v16;
      v19 = a3 < 3 && a4 < 3;
      v20 = *(_QWORD *)v32;
      v21 = a4;
      while (2)
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(v15);
          v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v22), "copy", v29);
          v24 = v23;
          if (v19)
            v25 = (vector_size_vec_sizes[v21] * vector_size_elem_sizes[a3]);
          else
            v25 = -1;
          if (v25 != objc_msgSend(v23, "length"))
          {

            v27 = 0;
            v12 = v29;
            v10 = v30;
            goto LABEL_22;
          }
          -[NSArray addObject:](v14, "addObject:", v24);

          ++v22;
        }
        while (v17 != v22);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        if (v17)
          continue;
        break;
      }
    }

    v12 = v29;
    vectors = v29->_vectors;
    v29->_vectors = v14;

    v10 = v30;
  }
  v27 = v12;
LABEL_22:

  return v27;
}

- (_CSEmbedding)initWithFormat:(int)a3 dimension:(int)a4 vectors:(id)a5
{
  return -[_CSEmbedding initWithFormat:dimension:version:vectors:](self, "initWithFormat:dimension:version:vectors:", *(_QWORD *)&a3, *(_QWORD *)&a4, 0, a5);
}

- (_CSEmbedding)initWithDictionaries:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  int v23;
  void *v24;
  unsigned __int16 v25;
  BOOL v26;
  _CSEmbedding *v27;
  void *v28;
  void *v29;
  id v30;
  _CSEmbedding *v31;
  _CSEmbedding *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned __int16 v38;
  uint64_t v39;
  uint64_t v40;
  id obj;
  id obja;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vec_format"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v7, "integerValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vec_dim"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v8, "integerValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vec_version"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v9, "integerValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vec_scale"));
    v36 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vec_bias"));
    v35 = objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v4;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 1;
      v13 = *(_QWORD *)v44;
      v14 = CFSTR("vec_data");
      v33 = self;
      v34 = v4;
      while (2)
      {
        v15 = 0;
        v37 = v11;
        do
        {
          if (*(_QWORD *)v44 != v13)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v15), "objectForKey:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
            goto LABEL_18;
          if ((v12 & 1) == 0)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vec_format"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "integerValue");

            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vec_dim"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v13;
            v21 = v14;
            v22 = v6;
            v23 = objc_msgSend(v19, "integerValue");

            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vec_version"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "integerValue");

            v26 = v23 == (_DWORD)v40;
            v6 = v22;
            v14 = v21;
            v13 = v20;
            v11 = v37;
            if (!v26 || v18 != (_DWORD)v39 || v25 != v38)
            {
LABEL_18:

              v31 = 0;
              self = v33;
              v4 = v34;
              v29 = (void *)v35;
              v28 = (void *)v36;

              goto LABEL_20;
            }
          }
          objc_msgSend(v6, "addObject:", v16);

          v12 = 0;
          ++v15;
        }
        while (v11 != v15);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        v12 = 0;
        self = v33;
        v4 = v34;
        if (v11)
          continue;
        break;
      }
    }

    v27 = -[_CSEmbedding initWithFormat:dimension:version:vectors:](self, "initWithFormat:dimension:version:vectors:", v39, v40, v38, v6);
    self = v27;
    v28 = (void *)v36;
    if (v36)
    {
      v29 = (void *)v35;
      if (v35)
      {
        v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v30, "setObject:forKey:", v36, CFSTR("vec_scale"));
        objc_msgSend(v30, "setObject:forKey:", v35, CFSTR("vec_bias"));
        obja = v30;
        -[_CSEmbedding setProperties:](self, "setProperties:", v30);
        v31 = self;

      }
      else
      {
        v31 = v27;
      }
    }
    else
    {
      v31 = v27;
      v29 = (void *)v35;
    }
LABEL_20:

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (_CSEmbedding)initWithEncodedData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  char isKindOfClass;
  _CSEmbedding *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v17;

  if (a3)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, &v17);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v17;
    if (v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (objc_msgSend(v4, "firstObject"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v6,
          (isKindOfClass & 1) != 0))
    {
      self = -[_CSEmbedding initWithDictionaries:](self, "initWithDictionaries:", v4);
      v8 = self;
    }
    else
    {
      if (v5)
      {
        logForCSLogCategoryDefault();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[_CSEmbedding initWithEncodedData:].cold.1((uint64_t)v5, v9, v10, v11, v12, v13, v14, v15);

      }
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSData)encodedData
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;

  v2 = (void *)MEMORY[0x1E0CB38B0];
  -[_CSEmbedding _asDictionaries](self, "_asDictionaries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v2, "dataWithPropertyList:format:options:error:", v3, 200, 0, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;

  if (v5)
  {
    logForCSLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_CSEmbedding initWithEncodedData:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return (NSData *)v4;
}

- (id)_asDictionaries
{
  void *v3;
  uint64_t v4;
  NSDictionary *properties;
  uint64_t v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _OWORD v22[3];
  const __CFString *v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_vectors, "count"));
  v25 = 0u;
  v24 = 0u;
  memset(v22, 0, sizeof(v22));
  v26 = 0;
  v23 = CFSTR("vec_data");
  if (self->_version)
  {
    *((_QWORD *)&v22[0] + 1) = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:");
    *(_QWORD *)&v24 = CFSTR("vec_version");
    v4 = 2;
  }
  else
  {
    v4 = 1;
  }
  if (self->_format)
  {
    *((_QWORD *)v22 + v4) = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    *(&v23 + v4++) = CFSTR("vec_format");
  }
  if (self->_dimension)
  {
    *((_QWORD *)v22 + v4) = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    *(&v23 + v4++) = CFSTR("vec_dim");
  }
  properties = self->_properties;
  if (properties)
  {
    -[NSDictionary objectForKeyedSubscript:](properties, "objectForKeyedSubscript:", CFSTR("vec_scale"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
    {
      *((_QWORD *)v22 + v4) = v6;
      *(&v23 + v4++) = CFSTR("vec_scale");
    }
    -[NSDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", CFSTR("vec_bias"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      *((_QWORD *)v22 + v4) = v8;
      *(&v23 + v4++) = CFSTR("vec_bias");
    }

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = self->_vectors;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        *(_QWORD *)&v22[0] = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v14 = objc_alloc(MEMORY[0x1E0C99D80]);
        v15 = (void *)objc_msgSend(v14, "initWithObjects:forKeys:count:", v22, &v23, v4, (_QWORD)v17);
        objc_msgSend(v3, "addObject:", v15);

      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  return v3;
}

- (int)format
{
  return self->_format;
}

- (int)dimension
{
  return self->_dimension;
}

- (unsigned)version
{
  return self->_version;
}

- (NSArray)vectors
{
  return self->_vectors;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_vectors, 0);
}

- (void)initWithEncodedData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18C42F000, a2, a3, "could not decode embedding data <%@>", a5, a6, a7, a8, 2u);
}

@end
