@implementation MCMXPCMessageDeleteUserManagedAsset

- (MCMXPCMessageDeleteUserManagedAsset)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  MCMXPCMessageDeleteUserManagedAsset *v10;
  uint64_t v11;
  NSString *sourceRelativePath;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  xpc_dictionary_set_uint64(v8, "ContainerClass", 2uLL);
  v14.receiver = self;
  v14.super_class = (Class)MCMXPCMessageDeleteUserManagedAsset;
  v10 = -[MCMXPCMessageWithContainerBase initWithXPCObject:context:error:](&v14, sel_initWithXPCObject_context_error_, v8, v9, a5);

  if (v10)
  {
    -[MCMXPCMessageBase nsStringValueFromXPCObject:key:](v10, "nsStringValueFromXPCObject:key:", v8, "SourcePath");
    v11 = objc_claimAutoreleasedReturnValue();
    sourceRelativePath = v10->_sourceRelativePath;
    v10->_sourceRelativePath = (NSString *)v11;

    if (!v10->_sourceRelativePath)
    {
      if (a5)
        *a5 = 11;

      v10 = 0;
    }
  }

  return v10;
}

- (NSString)sourceRelativePath
{
  return self->_sourceRelativePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceRelativePath, 0);
}

@end
