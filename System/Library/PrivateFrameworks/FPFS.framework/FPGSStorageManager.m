@implementation FPGSStorageManager

- (FPGSStorageManager)init
{
  FPGSStorageManager *v2;
  uint64_t v3;
  GSStorageManager *gs;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FPGSStorageManager;
  v2 = -[FPGSStorageManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    gs = v2->_gs;
    v2->_gs = (GSStorageManager *)v3;

  }
  return v2;
}

- (id)permanentStorageForItemAtURL:(id)a3 allocateIfNone:(BOOL)a4 error:(id *)a5
{
  GSStorageManager *gs;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v12;
  id v13;

  gs = self->_gs;
  v13 = 0;
  -[GSStorageManager permanentStorageForItemAtURL:allocateIfNone:error:](gs, "permanentStorageForItemAtURL:allocateIfNone:error:", a3, a4, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  v9 = v8;
  if (v7)
  {
    v10 = v7;
  }
  else if (a5)
  {
    if (v8)
    {
      *a5 = objc_retainAutorelease(v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "fp_errorWithPOSIXCode:", 22);
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a5 = v12;

    }
  }

  return v7;
}

- (id)permanentStorageForItemWithDocID:(unsigned int)a3 deviceID:(int)a4 allocateIfNone:(BOOL)a5 error:(id *)a6
{
  GSStorageManager *gs;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v13;
  id v14;

  gs = self->_gs;
  v14 = 0;
  -[GSStorageManager permanentStorageForItemWithDocID:deviceID:allocateIfNone:error:](gs, "permanentStorageForItemWithDocID:deviceID:allocateIfNone:error:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;
  v10 = v9;
  if (v8)
  {
    v11 = v8;
  }
  else if (a6)
  {
    if (v9)
    {
      *a6 = objc_retainAutorelease(v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "fp_errorWithPOSIXCode:", 22);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a6 = v13;

    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gs, 0);
}

@end
