@implementation MCMXPCMessageStageSharedContent

- (MCMXPCMessageStageSharedContent)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8;
  MCMXPCMessageStageSharedContent *v9;
  MCMXPCMessageStageSharedContent *v10;
  uint64_t v11;
  NSString *sourceRelativePath;
  uint64_t v13;
  NSString *destinationRelativePath;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MCMXPCMessageStageSharedContent;
  v9 = -[MCMXPCMessageWithIdentifierBase initWithXPCObject:context:error:](&v16, sel_initWithXPCObject_context_error_, v8, a4, a5);
  v10 = v9;
  if (v9)
  {
    -[MCMXPCMessageBase nsStringValueFromXPCObject:key:](v9, "nsStringValueFromXPCObject:key:", v8, "SourcePath");
    v11 = objc_claimAutoreleasedReturnValue();
    sourceRelativePath = v10->_sourceRelativePath;
    v10->_sourceRelativePath = (NSString *)v11;

    -[MCMXPCMessageBase nsStringValueFromXPCObject:key:](v10, "nsStringValueFromXPCObject:key:", v8, "DestPath");
    v13 = objc_claimAutoreleasedReturnValue();
    destinationRelativePath = v10->_destinationRelativePath;
    v10->_destinationRelativePath = (NSString *)v13;

  }
  return v10;
}

- (unsigned)disposition
{
  unsigned int v2;
  id v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)MCMXPCMessageStageSharedContent;
  v2 = -[MCMXPCMessageBase disposition](&v5, sel_disposition);
  if (v2 == 1)
  {
    v3 = containermanager_copy_global_configuration();
    v2 = objc_msgSend(v3, "dispositionForContainerClass:", 13);

  }
  return v2;
}

- (NSString)sourceRelativePath
{
  return self->_sourceRelativePath;
}

- (NSString)destinationRelativePath
{
  return self->_destinationRelativePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationRelativePath, 0);
  objc_storeStrong((id *)&self->_sourceRelativePath, 0);
}

@end
