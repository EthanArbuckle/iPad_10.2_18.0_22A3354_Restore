@implementation IMUnitTestFrameworkLoader

- (IMUnitTestFrameworkLoader)initWithLogger:(id)a3 bundleLoader:(id)a4
{
  id v7;
  id v8;
  IMUnitTestFrameworkLoader *v9;
  IMUnitTestFrameworkLoader *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMUnitTestFrameworkLoader;
  v9 = -[IMUnitTestFrameworkLoader init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_logger, a3);
    objc_storeStrong((id *)&v10->_bundleLoader, a4);
  }

  return v10;
}

- (BOOL)loadFrameworkNamesFromTextFile:(id)a3 outNames:(id *)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  id v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;

  v8 = (void *)MEMORY[0x1E0CB3940];
  v20 = 0;
  v9 = a3;
  objc_msgSend(v8, "stringWithContentsOfFile:encoding:error:", v9, 4, &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v20;
  v12 = v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 0;
  if (v13)
  {
    -[IMUnitTestFrameworkLoader logger](self, "logger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "log:", CFSTR("Loaded dependencies from file at path: '%@'\n%@"), v9, v10);

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "componentsSeparatedByString:", CFSTR("\n"));
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v15 = v14 != 0;
    if (a4 && v14)
    {
      v14 = objc_retainAutorelease(v14);
      *a4 = v14;
      v15 = 1;
    }
  }
  else
  {
    if (a5)
      *a5 = objc_retainAutorelease(v11);
    -[IMUnitTestFrameworkLoader logger](self, "logger");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "log:", CFSTR("Unable to load framework dependencies from file at path: '%@', error = %@"), v9, v12);

    v15 = 0;
  }

  return v15;
}

- (BOOL)readXCTestFrameworkDependencies:(id *)a3 error:(id *)a4
{
  void *v7;

  objc_msgSend(CFSTR("/AppleInternal/XCTests/com.apple.imcore/Frameworks"), "stringByAppendingPathComponent:", CFSTR("XCTest-framework-list.txt"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[IMUnitTestFrameworkLoader loadFrameworkNamesFromTextFile:outNames:error:](self, "loadFrameworkNamesFromTextFile:outNames:error:", v7, a3, a4);

  return (char)a4;
}

- (BOOL)frameworkExistsAtPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  return v6;
}

- (id)frameworkSearchPaths
{
  return &unk_1E3FFF008;
}

- (BOOL)findFrameworkPathsWithFrameworkNames:(id)a3 searchPaths:(id)a4 outFrameworkPaths:(id *)a5 error:(id *)a6
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id *v26;
  id obj;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  void *v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v32 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v9 = v8;
  v30 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v30)
  {
    obj = v9;
    v29 = *(_QWORD *)v38;
    v26 = a5;
    while (1)
    {
      v10 = 0;
LABEL_4:
      if (*(_QWORD *)v38 != v29)
        objc_enumerationMutation(obj);
      v11 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v10);
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v12 = v32;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      if (!v13)
        break;
      v14 = v13;
      v15 = *(_QWORD *)v34;
LABEL_8:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v16), "stringByAppendingPathComponent:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "fileExistsAtPath:", v17);

        if (v19)
          break;

        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
          if (v14)
            goto LABEL_8;
          goto LABEL_20;
        }
      }
      objc_msgSend(v31, "addObject:", v17);

      if (++v10 != v30)
        goto LABEL_4;
      v9 = obj;
      a5 = v26;
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
      if (!v30)
        goto LABEL_17;
    }
LABEL_20:

    if (a6)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB28A8];
      v41 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Framework not found: '%@'"), v11);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 4, v24);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    v9 = obj;

    v20 = 0;
  }
  else
  {
LABEL_17:

    if (a5)
      *a5 = objc_retainAutorelease(v31);
    v20 = 1;
  }

  return v20;
}

- (BOOL)loadFrameworks:(id)a3 outError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  BOOL v17;
  id *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v19 = a4;
    v9 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[IMUnitTestFrameworkLoader bundleLoader](self, "bundleLoader");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        v13 = objc_msgSend(v12, "loadTestBundle:bundle:error:", v11, 0, &v20);
        v14 = v20;

        -[IMUnitTestFrameworkLoader logger](self, "logger");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if ((v13 & 1) == 0)
        {
          objc_msgSend(v15, "log:", CFSTR("Unable to load XCTest.framework dependency: %@ (%@)"), v11, v14);

          if (v19)
            *v19 = objc_retainAutorelease(v14);

          v17 = 0;
          goto LABEL_13;
        }
        objc_msgSend(v15, "log:", CFSTR("Loaded XCTest.framework dependency ok: %@"), v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v8)
        continue;
      break;
    }
  }
  v17 = 1;
LABEL_13:

  return v17;
}

- (BOOL)loadXCTestFrameworkFromSDK:(id *)a3
{
  void *v5;
  BOOL v6;
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  id v11;
  BOOL v12;
  id v13;
  BOOL v14;
  int v15;
  void *v16;
  void *v17;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  objc_msgSend(CFSTR("/AppleInternal/XCTests/com.apple.imcore/Frameworks"), "stringByAppendingPathComponent:", CFSTR("XCTest-framework-list.txt"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = 0;
  v6 = -[IMUnitTestFrameworkLoader loadFrameworkNamesFromTextFile:outNames:error:](self, "loadFrameworkNamesFromTextFile:outNames:error:", v5, &v24, &v23);
  v7 = v24;
  v8 = v23;
  if (v8)
    v6 = 0;

  if (v6)
  {
    -[IMUnitTestFrameworkLoader frameworkSearchPaths](self, "frameworkSearchPaths");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = 0;
    v10 = -[IMUnitTestFrameworkLoader findFrameworkPathsWithFrameworkNames:searchPaths:outFrameworkPaths:error:](self, "findFrameworkPathsWithFrameworkNames:searchPaths:outFrameworkPaths:error:", v7, v9, &v22, &v21);
    v11 = v22;
    v8 = v21;
    if (v8)
      v10 = 0;

    if (v10)
    {
      v20 = 0;
      v12 = -[IMUnitTestFrameworkLoader loadFrameworks:outError:](self, "loadFrameworks:outError:", v11, &v20);
      v13 = v20;
      if (v13)
        v14 = 0;
      else
        v14 = v12;
      if (v14)
      {
        v8 = 0;
        v15 = 0;
        goto LABEL_18;
      }
      v8 = v13;
      -[IMUnitTestFrameworkLoader logger](self, "logger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "log:", CFSTR("Unable to load XCTest.frameworks %@ with error: (%@)"), v11, v8);
    }
    else
    {
      -[IMUnitTestFrameworkLoader logger](self, "logger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "log:", CFSTR("Unable to find XCTest.framework dependencies: (%@)"), v8);
    }

    v15 = 1;
LABEL_18:

    if (!a3)
      goto LABEL_14;
    goto LABEL_13;
  }
  -[IMUnitTestFrameworkLoader logger](self, "logger");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/AppleInternal/XCTests/com.apple.imcore/Frameworks"), "stringByAppendingPathComponent:", CFSTR("XCTest-framework-list.txt"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "log:", CFSTR("Unable to find XCTest.framework dependencies in file: (%@): %@"), v17, v8);

  v15 = 1;
  if (a3)
LABEL_13:
    *a3 = objc_retainAutorelease(v8);
LABEL_14:

  return v15 == 0;
}

- (BOOL)loadXCTestFramework:(id *)a3
{
  BOOL v5;
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  BOOL v10;
  id v11;
  id v12;
  BOOL v13;
  id v14;
  BOOL v15;
  int v16;
  void *v17;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v23 = 0;
  v24 = 0;
  v5 = -[IMUnitTestFrameworkLoader readXCTestFrameworkDependencies:error:](self, "readXCTestFrameworkDependencies:error:", &v24, &v23);
  v6 = v24;
  v7 = v23;
  if (v7)
    v8 = 0;
  else
    v8 = v5;
  if (v8)
  {
    -[IMUnitTestFrameworkLoader frameworkSearchPaths](self, "frameworkSearchPaths");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = 0;
    v10 = -[IMUnitTestFrameworkLoader findFrameworkPathsWithFrameworkNames:searchPaths:outFrameworkPaths:error:](self, "findFrameworkPathsWithFrameworkNames:searchPaths:outFrameworkPaths:error:", v6, v9, &v22, &v21);
    v11 = v22;
    v12 = v21;
    if (v12)
      v10 = 0;

    if (v10)
    {
      v20 = 0;
      v13 = -[IMUnitTestFrameworkLoader loadFrameworks:outError:](self, "loadFrameworks:outError:", v11, &v20);
      v14 = v20;
      if (v14)
        v15 = 0;
      else
        v15 = v13;
      if (v15)
      {
        v12 = 0;
        v16 = 0;
        goto LABEL_19;
      }
      v12 = v14;
      -[IMUnitTestFrameworkLoader logger](self, "logger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "log:", CFSTR("Unable to load XCTest.frameworks %@ with error: (%@)"), v11, v12);
    }
    else
    {
      -[IMUnitTestFrameworkLoader logger](self, "logger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "log:", CFSTR("Unable to find XCTest.framework dependencies: (%@)"), v12);
    }

    v16 = 1;
LABEL_19:

    if (!a3)
      goto LABEL_15;
    goto LABEL_14;
  }
  v12 = v7;
  -[IMUnitTestFrameworkLoader logger](self, "logger");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "log:", CFSTR("Unable to find XCTest.framework dependencies: %@"), v12);

  v16 = 1;
  if (a3)
LABEL_14:
    *a3 = objc_retainAutorelease(v12);
LABEL_15:

  return v16 == 0;
}

- (BOOL)loadTestFrameworks:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  IMUnitTestFrameworkLoader *v9;
  id *v10;

  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = sub_19E2EEA6C;
  v8 = &unk_1E3FB8528;
  v9 = self;
  v10 = a3;
  if (qword_1EE5041D8 != -1)
    dispatch_once(&qword_1EE5041D8, &v5);
  return -[IMUnitTestFrameworkLoader xctestFrameworkLoaded](self, "xctestFrameworkLoaded", v5, v6, v7, v8, v9, v10);
}

- (BOOL)xctestFrameworkLoaded
{
  return self->_xctestFrameworkLoaded;
}

- (void)setXctestFrameworkLoaded:(BOOL)a3
{
  self->_xctestFrameworkLoaded = a3;
}

- (IMUnitTestBundleLoader)bundleLoader
{
  return self->_bundleLoader;
}

- (IMUnitTestLogger)logger
{
  return (IMUnitTestLogger *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_bundleLoader, 0);
}

@end
