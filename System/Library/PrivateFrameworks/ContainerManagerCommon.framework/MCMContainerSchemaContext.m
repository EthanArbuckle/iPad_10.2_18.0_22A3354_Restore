@implementation MCMContainerSchemaContext

- (MCMContainerSchemaContext)initWithHomeDirectoryURL:(id)a3 containerPath:(id)a4 finalContainerPath:(id)a5 POSIXMode:(unsigned __int16)a6 POSIXOwner:(id)a7 containerClass:(unint64_t)a8 dataProtectionClass:(int)a9 libraryRepair:(id)a10 identifier:(id)a11
{
  id v16;
  id v17;
  id v18;
  MCMContainerSchemaContext *v19;
  MCMContainerSchemaContext *v20;
  id v24;
  id v25;
  id v26;
  objc_super v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v26 = a5;
  v25 = a7;
  v24 = a10;
  v18 = a11;
  v27.receiver = self;
  v27.super_class = (Class)MCMContainerSchemaContext;
  v19 = -[MCMContainerSchemaContext init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_homeDirectoryURL, a3);
    objc_storeStrong((id *)&v20->_containerPath, a4);
    objc_storeStrong((id *)&v20->_finalContainerPath, a5);
    v20->_posixMode = a6;
    objc_storeStrong((id *)&v20->_posixOwner, a7);
    v20->_containerClass = a8;
    v20->_dataProtectionClass = a9;
    objc_storeStrong((id *)&v20->_libraryRepair, a10);
    objc_storeStrong((id *)&v20->_identifier, a11);
  }

  return v20;
}

- (NSURL)homeDirectoryURL
{
  return self->_homeDirectoryURL;
}

- (MCMContainerPath)containerPath
{
  return self->_containerPath;
}

- (MCMContainerPath)finalContainerPath
{
  return self->_finalContainerPath;
}

- (unsigned)posixMode
{
  return self->_posixMode;
}

- (MCMPOSIXUser)posixOwner
{
  return self->_posixOwner;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (int)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (MCMLibraryRepairForUser)libraryRepair
{
  return self->_libraryRepair;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_libraryRepair, 0);
  objc_storeStrong((id *)&self->_posixOwner, 0);
  objc_storeStrong((id *)&self->_finalContainerPath, 0);
  objc_storeStrong((id *)&self->_containerPath, 0);
  objc_storeStrong((id *)&self->_homeDirectoryURL, 0);
}

+ (MCMContainerSchemaContext)contextWithHomeDirectoryURL:(id)a3 containerPath:(id)a4 finalContainerPath:(id)a5 POSIXMode:(unsigned __int16)a6 POSIXOwner:(id)a7 containerClass:(unint64_t)a8 dataProtectionClass:(int)a9 libraryRepair:(id)a10 identifier:(id)a11
{
  uint64_t v13;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v26;

  v13 = a6;
  v18 = a11;
  v19 = a10;
  v20 = a7;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  LODWORD(v26) = a9;
  v24 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHomeDirectoryURL:containerPath:finalContainerPath:POSIXMode:POSIXOwner:containerClass:dataProtectionClass:libraryRepair:identifier:", v23, v22, v21, v13, v20, a8, v26, v19, v18);

  return (MCMContainerSchemaContext *)v24;
}

@end
