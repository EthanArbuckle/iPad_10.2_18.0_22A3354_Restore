@implementation GEOResourceFetchRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOResourceFetchRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("resources.fetch"), a3, a4, a5);
}

- (GEOResourceFetchRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOResourceFetchRequest *v7;
  void *v8;
  size_t count;
  void *v10;
  size_t i;
  const void *data;
  void *v13;
  GEOResource *v14;
  GEOResource *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const void *v19;
  void *v20;
  uint64_t v21;
  GEOResourceManifestConfiguration *manifestConfiguration;
  GEOResourceFetchRequest *v23;
  id *v25;
  uint64_t v26;
  size_t length;
  objc_super v28;

  v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)GEOResourceFetchRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v28, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    v25 = a4;
    xpc_dictionary_get_array(v6, "resources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    count = xpc_array_get_count(v8);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", count);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (count)
    {
      for (i = 0; count != i; ++i)
      {
        length = 0;
        data = xpc_array_get_data(v8, i, &length);
        if (data)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[GEOResource initWithData:]([GEOResource alloc], "initWithData:", v13);
        }
        else
        {
          xpc_array_get_value(v8, i);
          v16 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)v16;
          if (!v16 || MEMORY[0x18D765A14](v16) != MEMORY[0x1E0C812E8])
            goto LABEL_7;
          v14 = objc_alloc_init(GEOResource);
        }
        v15 = v14;
        objc_msgSend(v10, "addObject:", v14, v25);

LABEL_7:
      }
    }
    v17 = objc_msgSend(v10, "count", v25);
    if (v17)
      v18 = (void *)objc_msgSend(v10, "copy");
    else
      v18 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v7->_resources, v18);
    if (v17)

    length = 0;
    v19 = xpc_dictionary_get_data(v6, "manifestConfiguration", &length);
    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v19, length, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v20, v26);
      v21 = objc_claimAutoreleasedReturnValue();
      manifestConfiguration = v7->_manifestConfiguration;
      v7->_manifestConfiguration = (GEOResourceManifestConfiguration *)v21;

    }
    v7->_force = xpc_dictionary_get_BOOL(v6, "force");
    v7->_unpack = xpc_dictionary_get_BOOL(v6, "unpack");
    v23 = v7;
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
  GEOResourceManifestConfiguration *manifestConfiguration;
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
  v18.super_class = (Class)GEOResourceFetchRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v18, sel_encodeToXPCDictionary_, v4);
  if (-[NSArray count](self->_resources, "count"))
  {
    v5 = xpc_array_create(0, 0);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = self->_resources;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "data", (_QWORD)v14);
          v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          xpc_array_set_data(v5, 0xFFFFFFFFFFFFFFFFLL, (const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v8);
    }

    if (xpc_array_get_count(v5))
      xpc_dictionary_set_value(v4, "resources", v5);

  }
  manifestConfiguration = self->_manifestConfiguration;
  if (manifestConfiguration)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", manifestConfiguration, 1, 0);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "manifestConfiguration", (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));

  }
  xpc_dictionary_set_BOOL(v4, "force", self->_force);
  xpc_dictionary_set_BOOL(v4, "unpack", self->_unpack);

}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

- (NSArray)resources
{
  return self->_resources;
}

- (void)setResources:(id)a3
{
  objc_storeStrong((id *)&self->_resources, a3);
}

- (GEOResourceManifestConfiguration)manifestConfiguration
{
  return self->_manifestConfiguration;
}

- (void)setManifestConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_manifestConfiguration, a3);
}

- (BOOL)force
{
  return self->_force;
}

- (void)setForce:(BOOL)a3
{
  self->_force = a3;
}

- (BOOL)unpack
{
  return self->_unpack;
}

- (void)setUnpack:(BOOL)a3
{
  self->_unpack = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifestConfiguration, 0);
  objc_storeStrong((id *)&self->_resources, 0);
}

@end
