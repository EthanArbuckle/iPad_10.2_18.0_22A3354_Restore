@implementation IMUnitTestBundleLoader

- (IMUnitTestBundleLoader)initWithLogger:(id)a3
{
  id v5;
  IMUnitTestBundleLoader *v6;
  IMUnitTestBundleLoader *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMUnitTestBundleLoader;
  v6 = -[IMUnitTestBundleLoader init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_logger, a3);

  return v7;
}

- (BOOL)loadTestBundle:(id)a3 bundle:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[IMUnitTestBundleLoader logger](self, "logger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "log:", CFSTR("Attempting to load bundle at path: '%@'"), v8);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fileExistsAtPath:", v8);

  if ((v11 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v13 = objc_msgSend(v12, "loadAndReturnError:", &v22);
    v14 = v22;
    if ((v13 & 1) != 0)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v12);
      -[IMUnitTestBundleLoader logger](self, "logger");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "log:", CFSTR("Loaded bundle at path: '%@' ok"), v8);
    }
    else
    {
      -[IMUnitTestBundleLoader logger](self, "logger");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "log:", CFSTR("Unable to load bundle at path: '%@' with error: '%@'"), v8, v20);

    }
  }
  else
  {
    -[IMUnitTestBundleLoader logger](self, "logger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "log:", CFSTR("Bundle not found at path: '%@'"), v8);

    v17 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bundle not found at path: '%@'"), v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, v19);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v13 = 0;
  }
  if (a5)
    *a5 = objc_retainAutorelease(v14);

  return v13 & 1;
}

- (IMUnitTestLogger)logger
{
  return (IMUnitTestLogger *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
