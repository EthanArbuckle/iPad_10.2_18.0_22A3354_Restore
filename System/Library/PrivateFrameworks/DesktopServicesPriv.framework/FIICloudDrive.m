@implementation FIICloudDrive

- (FIICloudDrive)init
{
  void *v3;
  void *v4;
  void *v5;
  FIICloudDrive *v6;
  objc_super v8;
  id v9;
  id v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  if (v3)
  {
    objc_msgSend(v3, "findUnderlyingNodes");
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  -[FIICloudDrive _libraries](self, "_libraries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[FIICloudDrive _documents](self, "_documents");

  }
  v11[0] = v9;
  v11[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)FIICloudDrive;
  v6 = -[FICompoundNode initWithFINodes:](&v8, sel_initWithFINodes_, v5);

  -[FIICloudDrive set_libraries:](v6, "set_libraries:", v9);
  -[FIICloudDrive set_documents:](v6, "set_documents:", v10);

  return v6;
}

+ (pair<FINode)findUnderlyingNodes
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  pair<FINode *, FINode *> result;

  v3 = v2;
  +[FINode iCloudLibrariesContainer](FINode, "iCloudLibrariesContainer");
  v4 = objc_claimAutoreleasedReturnValue();
  +[FINode iCloudDefaultContainer](FINode, "iCloudDefaultContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = v4;
  v3[1] = (uint64_t)v5;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (id)fileURL
{
  void *v2;
  void *v3;

  -[FIICloudDrive _documents](self, "_documents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)propertyAsNumber:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v9;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v7 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = *(_QWORD *)&a3;
  if (a3 == 1885895027 || a3 == 1819240307)
  {
    -[FIICloudDrive _documents](self, "_documents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fileParent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "propertyAsNumber:async:options:error:", v9, v8, v7, a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    return v14;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)FIICloudDrive;
    -[FICustomNode propertyAsNumber:async:options:error:](&v15, sel_propertyAsNumber_async_options_error_, *(_QWORD *)&a3, a4, *(_QWORD *)&a5, a6);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)propertyAsString:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  __CFString *v6;
  unsigned __int16 v7;
  void *v9;
  void *v10;
  objc_super v11;

  v6 = CFSTR("🆕 iCloud Drive");
  if ((int)a3 <= 1802072171)
  {
    if (a3 != 1684955501)
    {
      v7 = 28260;
      goto LABEL_7;
    }
  }
  else
  {
    if (a3 == 1970563428)
    {
      -[FINode contentType](self, "contentType", *(_QWORD *)&a3, a4, *(_QWORD *)&a5, a6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      return v10;
    }
    if (a3 != 1886282093)
    {
      v7 = 28780;
LABEL_7:
      if (a3 == (v7 | 0x6B690000))
        return CFSTR("Folder");
      v11.receiver = self;
      v11.super_class = (Class)FIICloudDrive;
      -[FIDSNode propertyAsString:async:options:error:](&v11, sel_propertyAsString_async_options_error_, *(_QWORD *)&a3, a4, *(_QWORD *)&a5, a6);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v6;
}

- (id)propertyAsNSObject:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  objc_super v7;

  if (a3 == 1970566256)
    return (id)*MEMORY[0x1E0CEC4F0];
  v7.receiver = self;
  v7.super_class = (Class)FIICloudDrive;
  -[FIDSNode propertyAsNSObject:async:options:error:](&v7, sel_propertyAsNSObject_async_options_error_, *(_QWORD *)&a3, a4, *(_QWORD *)&a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (FINode)_libraries
{
  return (FINode *)objc_getProperty(self, a2, 152, 1);
}

- (void)set_libraries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (FINode)_documents
{
  return (FINode *)objc_getProperty(self, a2, 160, 1);
}

- (void)set_documents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__documents, 0);
  objc_storeStrong((id *)&self->__libraries, 0);
}

@end
