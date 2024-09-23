@implementation GEOResourceFetchReply

- (GEOResourceFetchReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOResourceFetchReply *v7;
  void *v8;
  size_t count;
  void *v10;
  size_t i;
  const char *string;
  void *v13;
  uint64_t v14;
  void *v15;
  const void *data;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSArray *paths;
  GEOResourceFetchReply *v24;
  size_t length;
  objc_super v27;

  v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)GEOResourceFetchReply;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v27, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    xpc_dictionary_get_array(v6, "names");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    count = xpc_array_get_count(v8);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", count);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (count)
    {
      for (i = 0; i != count; ++i)
      {
        string = xpc_array_get_string(v8, i);
        if (string)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v13);

        }
      }
    }
    v14 = objc_msgSend(v10, "count");
    if (v14)
      v15 = (void *)objc_msgSend(v10, "copy");
    else
      v15 = 0;
    objc_storeStrong((id *)&v7->_names, v15);
    if (v14)

    length = 0;
    data = xpc_dictionary_get_data(v6, "paths", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0CB3710];
      v19 = (void *)MEMORY[0x1E0C99E60];
      v20 = objc_opt_class();
      objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "unarchivedObjectOfClasses:fromData:error:", v21, v17, a4);
      v22 = objc_claimAutoreleasedReturnValue();
      paths = v7->_paths;
      v7->_paths = (NSArray *)v22;

    }
    v24 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  xpc_object_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOResourceFetchReply;
  -[GEOXPCReply encodeToXPCDictionary:](&v18, sel_encodeToXPCDictionary_, v4);
  if (-[NSArray count](self->_names, "count"))
  {
    v5 = xpc_array_create(0, 0);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = self->_names;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10));
          v12 = (const char *)objc_msgSend(v11, "UTF8String", (_QWORD)v14);
          if (v12)
            xpc_array_set_string(v5, 0xFFFFFFFFFFFFFFFFLL, v12);
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v8);
    }

    if (xpc_array_get_count(v5))
      xpc_dictionary_set_value(v4, "names", v5);

  }
  if (-[NSArray count](self->_paths, "count", (_QWORD)v14))
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_paths, 1, 0);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "paths", (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));

  }
}

- (BOOL)isValid
{
  return 1;
}

- (NSArray)names
{
  return self->_names;
}

- (void)setNames:(id)a3
{
  objc_storeStrong((id *)&self->_names, a3);
}

- (NSArray)paths
{
  return self->_paths;
}

- (void)setPaths:(id)a3
{
  objc_storeStrong((id *)&self->_paths, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_names, 0);
}

@end
