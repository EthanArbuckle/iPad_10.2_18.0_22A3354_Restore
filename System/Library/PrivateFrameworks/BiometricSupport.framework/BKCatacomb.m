@implementation BKCatacomb

- (BKCatacomb)init
{
  BKCatacomb *v2;
  BKCatacomb *v3;
  NSString *catacombDir;
  uint64_t v5;
  NSDictionary *writeAttributes;
  objc_super v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)BKCatacomb;
  v2 = -[BKCatacomb init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    catacombDir = v2->_catacombDir;
    v2->_catacombDir = (NSString *)CFSTR("/Library/Catacomb/");

    v9 = *MEMORY[0x24BDD0CF0];
    v10[0] = *MEMORY[0x24BDD0CE0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v5 = objc_claimAutoreleasedReturnValue();
    writeAttributes = v3->_writeAttributes;
    v3->_writeAttributes = (NSDictionary *)v5;

  }
  return v3;
}

+ (id)catacombWithDir:(id)a3
{
  id v3;
  BKCatacomb *v4;
  uint64_t v5;
  NSString *catacombDir;

  v3 = a3;
  v4 = objc_alloc_init(BKCatacomb);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v3);
    catacombDir = v4->_catacombDir;
    v4->_catacombDir = (NSString *)v5;

  }
  return v4;
}

- (id)catacombPrepareDir
{
  return -[NSString stringByAppendingPathComponent:](self->_catacombDir, "stringByAppendingPathComponent:", CFSTR("prepare/"));
}

- (id)catacombCommitDir
{
  return -[NSString stringByAppendingPathComponent:](self->_catacombDir, "stringByAppendingPathComponent:", CFSTR("commit/"));
}

- (int)syncDir:(id)a3
{
  id v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = open((const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"), 0x100000);
    if (v5 == -1)
    {
      if (__osLog)
        v10 = __osLog;
      else
        v10 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = 136316162;
        v13 = "dirfd != -1";
        v14 = 2048;
        v15 = 0;
        v16 = 2080;
        v17 = &unk_21491C593;
        v18 = 2080;
        v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
        v20 = 1024;
        v21 = 75;
        _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
      }
      v7 = 5;
    }
    else
    {
      v6 = v5;
      v7 = fcntl(v5, 51);
      if (v7)
      {
        if (__osLog)
          v11 = __osLog;
        else
          v11 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = 136316162;
          v13 = "err == 0 ";
          v14 = 2048;
          v15 = v7;
          v16 = 2080;
          v17 = &unk_21491C593;
          v18 = 2080;
          v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
          v20 = 1024;
          v21 = 78;
          _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
        }
      }
      close(v6);
    }
  }
  else
  {
    if (__osLog)
      v9 = __osLog;
    else
      v9 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 136316162;
      v13 = "dir";
      v14 = 2048;
      v15 = 0;
      v16 = 2080;
      v17 = &unk_21491C593;
      v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
      v20 = 1024;
      v21 = 72;
      _os_log_impl(&dword_2148C7000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
    }
    v7 = 22;
  }

  return v7;
}

- (int)writeData:(id)a3 toFile:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  NSDictionary *writeAttributes;
  id v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  int v33;
  int v34;
  NSObject *v35;
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    if (__osLog)
      v25 = __osLog;
    else
      v25 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    *(_DWORD *)buf = 136316162;
    v38 = "data";
    v39 = 2048;
    v40 = 0;
    v41 = 2080;
    v42 = &unk_21491C593;
    v43 = 2080;
    v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    v45 = 1024;
    v46 = 97;
    goto LABEL_24;
  }
  if (!v7)
  {
    if (__osLog)
      v25 = __osLog;
    else
      v25 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    *(_DWORD *)buf = 136316162;
    v38 = "fileName";
    v39 = 2048;
    v40 = 0;
    v41 = 2080;
    v42 = &unk_21491C593;
    v43 = 2080;
    v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    v45 = 1024;
    v46 = 98;
LABEL_24:
    _os_log_impl(&dword_2148C7000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_25:
    v22 = 0;
    v18 = 0;
    v12 = 0;
    v17 = 0;
    v23 = 22;
    goto LABEL_77;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKCatacomb catacombCommitDir](self, "catacombCommitDir");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

  if (v11)
  {
    if (__osLog)
      v26 = __osLog;
    else
      v26 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v38 = "![[NSFileManager defaultManager] fileExistsAtPath:[self catacombCommitDir]]";
      v39 = 2048;
      v40 = 0;
      v41 = 2080;
      v42 = &unk_21491C593;
      v43 = 2080;
      v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
      v45 = 1024;
      v46 = 100;
      _os_log_impl(&dword_2148C7000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v22 = 0;
    v18 = 0;
    v12 = 0;
    v17 = 0;
    v23 = 1;
    goto LABEL_77;
  }
  -[BKCatacomb catacombPrepareDir](self, "catacombPrepareDir");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if (__osLog)
      v27 = __osLog;
    else
      v27 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v38 = "prepareDir";
      v39 = 2048;
      v40 = 0;
      v41 = 2080;
      v42 = &unk_21491C593;
      v43 = 2080;
      v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
      v45 = 1024;
      v46 = 103;
      _os_log_impl(&dword_2148C7000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v22 = 0;
    v18 = 0;
    v12 = 0;
    goto LABEL_44;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fileExistsAtPath:", v12);

  if ((v14 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    writeAttributes = self->_writeAttributes;
    v36 = 0;
    objc_msgSend(v15, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, writeAttributes, &v36);
    v17 = v36;

    if (v17)
    {
      if (__osLog)
        v32 = __osLog;
      else
        v32 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v38 = "!nserr";
        v39 = 2048;
        v40 = 0;
        v41 = 2080;
        v42 = &unk_21491C593;
        v43 = 2080;
        v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
        v45 = 1024;
        v46 = 109;
        _os_log_impl(&dword_2148C7000, v32, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v22 = 0;
      v18 = 0;
      goto LABEL_76;
    }
  }
  objc_msgSend(v12, "stringByAppendingPathComponent:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    if (__osLog)
      v28 = __osLog;
    else
      v28 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v38 = "fullPath";
      v39 = 2048;
      v40 = 0;
      v41 = 2080;
      v42 = &unk_21491C593;
      v43 = 2080;
      v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
      v45 = 1024;
      v46 = 113;
      _os_log_impl(&dword_2148C7000, v28, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v22 = 0;
    v18 = 0;
LABEL_44:
    v17 = 0;
    v23 = 12;
    goto LABEL_77;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "createFileAtPath:contents:attributes:", v18, 0, self->_writeAttributes);

  if ((v20 & 1) == 0)
  {
    if (__osLog)
      v29 = __osLog;
    else
      v29 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_56;
    *(_DWORD *)buf = 136316162;
    v38 = "[[NSFileManager defaultManager] createFileAtPath:fullPath contents:((void *)0) attributes:_writeAttributes]";
    v39 = 2048;
    v40 = 0;
    v41 = 2080;
    v42 = &unk_21491C593;
    v43 = 2080;
    v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    v45 = 1024;
    v46 = 116;
    goto LABEL_55;
  }
  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingAtPath:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21)
  {
    if (__osLog)
      v29 = __osLog;
    else
      v29 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_56;
    *(_DWORD *)buf = 136316162;
    v38 = "file";
    v39 = 2048;
    v40 = 0;
    v41 = 2080;
    v42 = &unk_21491C593;
    v43 = 2080;
    v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    v45 = 1024;
    v46 = 119;
LABEL_55:
    _os_log_impl(&dword_2148C7000, v29, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_56:
    v22 = 0;
    v17 = 0;
LABEL_76:
    v23 = 5;
    goto LABEL_77;
  }
  objc_msgSend(v21, "writeData:", v6);
  v23 = fcntl(objc_msgSend(v22, "fileDescriptor"), 51);
  if (v23)
  {
    if (__osLog)
      v30 = __osLog;
    else
      v30 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v38 = "err == 0 ";
      v39 = 2048;
      v40 = v23;
      v41 = 2080;
      v42 = &unk_21491C593;
      v43 = 2080;
      v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
      v45 = 1024;
      v46 = 136;
      _os_log_impl(&dword_2148C7000, v30, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    objc_msgSend(v22, "closeFile");
  }
  else
  {
    objc_msgSend(v22, "closeFile");

    v23 = -[BKCatacomb syncDir:](self, "syncDir:", v12);
    if (!v23)
    {
      v22 = 0;
      v17 = 0;
      goto LABEL_13;
    }
    if (__osLog)
      v31 = __osLog;
    else
      v31 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v38 = "err == 0 ";
      v39 = 2048;
      v40 = v23;
      v41 = 2080;
      v42 = &unk_21491C593;
      v43 = 2080;
      v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
      v45 = 1024;
      v46 = 143;
      _os_log_impl(&dword_2148C7000, v31, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v22 = 0;
  }
  v17 = 0;
LABEL_77:
  v33 = -[BKCatacomb recover](self, "recover");
  if (v33)
  {
    v34 = v33;
    if (__osLog)
      v35 = __osLog;
    else
      v35 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v38 = "[self recover] == 0 ";
      v39 = 2048;
      v40 = v34;
      v41 = 2080;
      v42 = &unk_21491C593;
      v43 = 2080;
      v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
      v45 = 1024;
      v46 = 152;
      _os_log_impl(&dword_2148C7000, v35, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
LABEL_13:

  return v23;
}

- (int)commitWrite
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  id obj;
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  id v46;
  uint8_t v47[128];
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  int v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  -[BKCatacomb catacombPrepareDir](self, "catacombPrepareDir");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (__osLog)
      v32 = __osLog;
    else
      v32 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      goto LABEL_44;
    *(_DWORD *)buf = 136316162;
    v49 = "prepareDir";
    v50 = 2048;
    v51 = 0;
    v52 = 2080;
    v53 = &unk_21491C593;
    v54 = 2080;
    v55 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    v56 = 1024;
    v57 = 167;
    goto LABEL_43;
  }
  -[BKCatacomb catacombCommitDir](self, "catacombCommitDir");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (__osLog)
      v32 = __osLog;
    else
      v32 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      goto LABEL_44;
    *(_DWORD *)buf = 136316162;
    v49 = "commitDir";
    v50 = 2048;
    v51 = 0;
    v52 = 2080;
    v53 = &unk_21491C593;
    v54 = 2080;
    v55 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    v56 = 1024;
    v57 = 170;
LABEL_43:
    _os_log_impl(&dword_2148C7000, v32, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_44:
    v29 = 12;
    goto LABEL_32;
  }
  v5 = (void *)v4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

  if (v7)
  {
    if (__osLog)
      v33 = __osLog;
    else
      v33 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_56;
    *(_DWORD *)buf = 136316162;
    v49 = "![[NSFileManager defaultManager] fileExistsAtPath:commitDir]";
    v50 = 2048;
    v51 = 0;
    v52 = 2080;
    v53 = &unk_21491C593;
    v54 = 2080;
    v55 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    v56 = 1024;
    v57 = 172;
    goto LABEL_55;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:", v3);

  if ((v9 & 1) == 0)
  {
    if (__osLog)
      v33 = __osLog;
    else
      v33 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_56;
    *(_DWORD *)buf = 136316162;
    v49 = "[[NSFileManager defaultManager] fileExistsAtPath:prepareDir]";
    v50 = 2048;
    v51 = 0;
    v52 = 2080;
    v53 = &unk_21491C593;
    v54 = 2080;
    v55 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    v56 = 1024;
    v57 = 173;
LABEL_55:
    _os_log_impl(&dword_2148C7000, v33, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_56:

    v29 = 1;
    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  objc_msgSend(v10, "moveItemAtPath:toPath:error:", v3, v5, &v46);
  v11 = v46;

  if (v11)
  {
    if (__osLog)
      v34 = __osLog;
    else
      v34 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v49 = "!nserr";
      v50 = 2048;
      v51 = 0;
      v52 = 2080;
      v53 = &unk_21491C593;
      v54 = 2080;
      v55 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
      v56 = 1024;
      v57 = 177;
      _os_log_impl(&dword_2148C7000, v34, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }

    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  objc_msgSend(v12, "contentsOfDirectoryAtPath:error:", v5, &v45);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v45;

  if (v14)
  {
    if (__osLog)
      v35 = __osLog;
    else
      v35 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_74;
    *(_DWORD *)buf = 136316162;
    v49 = "!nserr";
    v50 = 2048;
    v51 = 0;
    v52 = 2080;
    v53 = &unk_21491C593;
    v54 = 2080;
    v55 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    v56 = 1024;
    v57 = 181;
    goto LABEL_73;
  }
  v36 = v3;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v13 = v13;
  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (!v15)
    goto LABEL_17;
  v16 = v15;
  v17 = *(_QWORD *)v42;
  obj = v13;
  while (2)
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v42 != v17)
        objc_enumerationMutation(obj);
      v19 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
      v20 = v5;
      objc_msgSend(v5, "stringByAppendingPathComponent:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString stringByAppendingPathComponent:](self->_catacombDir, "stringByAppendingPathComponent:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "fileExistsAtPath:", v22);

      if (v24)
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0;
        objc_msgSend(v25, "removeItemAtPath:error:", v22, &v40);
        v26 = v40;

        if (v26)
        {
          if (__osLog)
            v30 = __osLog;
          else
            v30 = MEMORY[0x24BDACB70];
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            goto LABEL_30;
          *(_DWORD *)buf = 136316162;
          v49 = "!nserr";
          v50 = 2048;
          v51 = 0;
          v52 = 2080;
          v53 = &unk_21491C593;
          v54 = 2080;
          v55 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
          v56 = 1024;
          v57 = 193;
          goto LABEL_29;
        }
      }
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      objc_msgSend(v27, "moveItemAtPath:toPath:error:", v21, v22, &v39);
      v26 = v39;

      if (v26)
      {
        if (__osLog)
          v30 = __osLog;
        else
          v30 = MEMORY[0x24BDACB70];
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          goto LABEL_30;
        *(_DWORD *)buf = 136316162;
        v49 = "!nserr";
        v50 = 2048;
        v51 = 0;
        v52 = 2080;
        v53 = &unk_21491C593;
        v54 = 2080;
        v55 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
        v56 = 1024;
        v57 = 197;
LABEL_29:
        _os_log_impl(&dword_2148C7000, v30, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_30:
        v3 = v36;

        goto LABEL_31;
      }

      v5 = v20;
    }
    v13 = obj;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v16)
      continue;
    break;
  }
LABEL_17:

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(v28, "removeItemAtPath:error:", v5, &v38);
  v14 = v38;

  if (v14)
  {
    if (__osLog)
      v35 = __osLog;
    else
      v35 = MEMORY[0x24BDACB70];
    v3 = v36;
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_74;
    *(_DWORD *)buf = 136316162;
    v49 = "!nserr";
    v50 = 2048;
    v51 = 0;
    v52 = 2080;
    v53 = &unk_21491C593;
    v54 = 2080;
    v55 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    v56 = 1024;
    v57 = 202;
LABEL_73:
    _os_log_impl(&dword_2148C7000, v35, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_74:

LABEL_31:
    v29 = 5;
    goto LABEL_32;
  }
  -[BKCatacomb syncDir:](self, "syncDir:", self->_catacombDir);

  v29 = 0;
  v3 = v36;
LABEL_32:

  return v29;
}

- (int)readData:(id *)a3 fromFile:(id)a4 logString:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  __CFString *v26;
  id v27;
  int v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = v8;
  if (!a3)
  {
    if (__osLog)
      v36 = __osLog;
    else
      v36 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      goto LABEL_48;
    *(_DWORD *)buf = 136316162;
    v42 = "data";
    v43 = 2048;
    v44 = 0;
    v45 = 2080;
    v46 = &unk_21491C593;
    v47 = 2080;
    v48 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    v49 = 1024;
    v50 = 218;
    goto LABEL_47;
  }
  if (!v8)
  {
    if (__osLog)
      v36 = __osLog;
    else
      v36 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      goto LABEL_48;
    *(_DWORD *)buf = 136316162;
    v42 = "fileName";
    v43 = 2048;
    v44 = 0;
    v45 = 2080;
    v46 = &unk_21491C593;
    v47 = 2080;
    v48 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    v49 = 1024;
    v50 = 219;
LABEL_47:
    _os_log_impl(&dword_2148C7000, v36, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_48:
    v26 = 0;
    v27 = 0;
    v22 = 0;
    v17 = 0;
    v28 = 22;
    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKCatacomb catacombCommitDir](self, "catacombCommitDir");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "fileExistsAtPath:", v11);

  if (v12)
  {
    if (__osLog)
      v37 = __osLog;
    else
      v37 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_60;
    *(_DWORD *)buf = 136316162;
    v42 = "![[NSFileManager defaultManager] fileExistsAtPath:[self catacombCommitDir]]";
    v43 = 2048;
    v44 = 0;
    v45 = 2080;
    v46 = &unk_21491C593;
    v47 = 2080;
    v48 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    v49 = 1024;
    v50 = 221;
    goto LABEL_59;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKCatacomb catacombPrepareDir](self, "catacombPrepareDir");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "fileExistsAtPath:", v14);

  if (v15)
  {
    if (__osLog)
      v37 = __osLog;
    else
      v37 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_60;
    *(_DWORD *)buf = 136316162;
    v42 = "![[NSFileManager defaultManager] fileExistsAtPath:[self catacombPrepareDir]]";
    v43 = 2048;
    v44 = 0;
    v45 = 2080;
    v46 = &unk_21491C593;
    v47 = 2080;
    v48 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    v49 = 1024;
    v50 = 222;
LABEL_59:
    _os_log_impl(&dword_2148C7000, v37, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_60:
    v26 = 0;
    v27 = 0;
    v22 = 0;
    v17 = 0;
    v28 = 1;
    goto LABEL_34;
  }
  -[NSString stringByAppendingPathComponent:](self->_catacombDir, "stringByAppendingPathComponent:", v9);
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "fileExistsAtPath:", v17);

    if (!v19)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("File '%@' doesn't exist"), v17);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      goto LABEL_11;
    }
    v20 = (void *)MEMORY[0x24BDD1578];
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    objc_msgSend(v20, "fileHandleForReadingFromURL:error:", v21, &v40);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v40;

    if (v22)
    {
      v39 = 0;
      objc_msgSend(v22, "readDataToEndOfFileAndReturnError:", &v39);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v39;

      if (v24)
      {

        v26 = CFSTR("Succeeded");
LABEL_11:
        v27 = objc_retainAutorelease(v24);
        v28 = 0;
        *a3 = v27;
        goto LABEL_34;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("readDataToEndOfFileAndReturnError(file:'%@'): -> %@"), v17, v25);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v32 = MEMORY[0x24BDACB70];
      if (__osLog)
        v33 = __osLog;
      else
        v33 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v42 = (const char *)v26;
        _os_log_impl(&dword_2148C7000, v33, OS_LOG_TYPE_ERROR, "%{public}@\n", buf, 0xCu);
      }
      if (__osLog)
        v34 = __osLog;
      else
        v34 = v32;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v42 = "0";
        v43 = 2048;
        v44 = 0;
        v45 = 2080;
        v46 = &unk_21491C593;
        v47 = 2080;
        v48 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
        v49 = 1024;
        v50 = 243;
        _os_log_impl(&dword_2148C7000, v34, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v23 = v25;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("fileHandleForReadingFromURL(file:'%@'): -> %@"), v17, v23);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v29 = MEMORY[0x24BDACB70];
      if (__osLog)
        v30 = __osLog;
      else
        v30 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v42 = (const char *)v26;
        _os_log_impl(&dword_2148C7000, v30, OS_LOG_TYPE_ERROR, "%{public}@\n", buf, 0xCu);
      }
      if (__osLog)
        v31 = __osLog;
      else
        v31 = v29;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v42 = "0";
        v43 = 2048;
        v44 = 0;
        v45 = 2080;
        v46 = &unk_21491C593;
        v47 = 2080;
        v48 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
        v49 = 1024;
        v50 = 235;
        _os_log_impl(&dword_2148C7000, v31, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }

    v27 = 0;
    v28 = 5;
  }
  else
  {
    if (__osLog)
      v38 = __osLog;
    else
      v38 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v42 = "fullPath";
      v43 = 2048;
      v44 = 0;
      v45 = 2080;
      v46 = &unk_21491C593;
      v47 = 2080;
      v48 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
      v49 = 1024;
      v50 = 225;
      _os_log_impl(&dword_2148C7000, v38, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v26 = 0;
    v27 = 0;
    v22 = 0;
    v17 = 0;
    v28 = 12;
  }
LABEL_34:
  if (a5)
    *a5 = objc_retainAutorelease(v26);

  return v28;
}

- (int)readData:(id *)a3 fromFile:(id)a4
{
  return -[BKCatacomb readData:fromFile:logString:](self, "readData:fromFile:logString:", a3, a4, 0);
}

- (int)deleteFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKCatacomb catacombCommitDir](self, "catacombCommitDir");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

    if (v7)
    {
      if (__osLog)
        v18 = __osLog;
      else
        v18 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_25;
      *(_DWORD *)buf = 136316162;
      v23 = "![[NSFileManager defaultManager] fileExistsAtPath:[self catacombCommitDir]]";
      v24 = 2048;
      v25 = 0;
      v26 = 2080;
      v27 = &unk_21491C593;
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
      v30 = 1024;
      v31 = 277;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKCatacomb catacombPrepareDir](self, "catacombPrepareDir");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

      if (!v10)
      {
        -[NSString stringByAppendingPathComponent:](self->_catacombDir, "stringByAppendingPathComponent:", v4);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 0;
          objc_msgSend(v13, "removeItemAtPath:error:", v12, &v21);
          v14 = v21;

          if (v14)
          {
            if (__osLog)
              v20 = __osLog;
            else
              v20 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v23 = "!nserr";
              v24 = 2048;
              v25 = 0;
              v26 = 2080;
              v27 = &unk_21491C593;
              v28 = 2080;
              v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
              v30 = 1024;
              v31 = 284;
              _os_log_impl(&dword_2148C7000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
            }

            v15 = 5;
          }
          else
          {
            -[BKCatacomb syncDir:](self, "syncDir:", self->_catacombDir);

            v15 = 0;
          }
        }
        else
        {
          if (__osLog)
            v19 = __osLog;
          else
            v19 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v23 = "fullPath";
            v24 = 2048;
            v25 = 0;
            v26 = 2080;
            v27 = &unk_21491C593;
            v28 = 2080;
            v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
            v30 = 1024;
            v31 = 281;
            _os_log_impl(&dword_2148C7000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
          v15 = 12;
        }
        goto LABEL_7;
      }
      if (__osLog)
        v18 = __osLog;
      else
        v18 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
LABEL_25:
        v15 = 1;
        goto LABEL_7;
      }
      *(_DWORD *)buf = 136316162;
      v23 = "![[NSFileManager defaultManager] fileExistsAtPath:[self catacombPrepareDir]]";
      v24 = 2048;
      v25 = 0;
      v26 = 2080;
      v27 = &unk_21491C593;
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
      v30 = 1024;
      v31 = 278;
    }
    _os_log_impl(&dword_2148C7000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_25;
  }
  if (__osLog)
    v17 = __osLog;
  else
    v17 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v23 = "fileName";
    v24 = 2048;
    v25 = 0;
    v26 = 2080;
    v27 = &unk_21491C593;
    v28 = 2080;
    v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    v30 = 1024;
    v31 = 275;
    _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  v15 = 22;
LABEL_7:

  return v15;
}

- (int)recover
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  int v28;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  id obj;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  id v47;
  uint8_t v48[128];
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  -[BKCatacomb catacombPrepareDir](self, "catacombPrepareDir");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (__osLog)
      v33 = __osLog;
    else
      v33 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_48;
    *(_DWORD *)buf = 136316162;
    v50 = "prepareDir";
    v51 = 2048;
    v52 = 0;
    v53 = 2080;
    v54 = &unk_21491C593;
    v55 = 2080;
    v56 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    v57 = 1024;
    v58 = 302;
    goto LABEL_47;
  }
  -[BKCatacomb catacombCommitDir](self, "catacombCommitDir");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (__osLog)
      v33 = __osLog;
    else
      v33 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_48;
    *(_DWORD *)buf = 136316162;
    v50 = "commitDir";
    v51 = 2048;
    v52 = 0;
    v53 = 2080;
    v54 = &unk_21491C593;
    v55 = 2080;
    v56 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    v57 = 1024;
    v58 = 305;
LABEL_47:
    _os_log_impl(&dword_2148C7000, v33, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_48:
    v5 = 0;
    v9 = 0;
    v28 = 12;
    goto LABEL_22;
  }
  v5 = (void *)v4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v3);

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    objc_msgSend(v8, "removeItemAtPath:error:", v3, &v47);
    v9 = v47;

    if (v9)
    {
      if (__osLog)
        v34 = __osLog;
      else
        v34 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v50 = "!nserr";
        v51 = 2048;
        v52 = 0;
        v53 = 2080;
        v54 = &unk_21491C593;
        v55 = 2080;
        v56 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
        v57 = 1024;
        v58 = 311;
        _os_log_impl(&dword_2148C7000, v34, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      goto LABEL_36;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fileExistsAtPath:", v5);

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    objc_msgSend(v12, "contentsOfDirectoryAtPath:error:", v5, &v46);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v46;

    if (!v9)
    {
      v37 = v3;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v9 = v13;
      v14 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      if (!v14)
        goto LABEL_17;
      v15 = v14;
      v16 = *(_QWORD *)v43;
      obj = v9;
LABEL_9:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v43 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v17);
        v19 = v5;
        objc_msgSend(v5, "stringByAppendingPathComponent:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSString stringByAppendingPathComponent:](self->_catacombDir, "stringByAppendingPathComponent:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "fileExistsAtPath:", v21);

        if (v23)
        {
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = 0;
          objc_msgSend(v24, "removeItemAtPath:error:", v21, &v41);
          v9 = v41;

          if (v9)
            break;
        }
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0;
        objc_msgSend(v25, "moveItemAtPath:toPath:error:", v20, v21, &v40);
        v9 = v40;

        if (v9)
        {
          if (__osLog)
            v30 = __osLog;
          else
            v30 = MEMORY[0x24BDACB70];
          v5 = v19;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v50 = "!nserr";
            v51 = 2048;
            v52 = 0;
            v53 = 2080;
            v54 = &unk_21491C593;
            v55 = 2080;
            v56 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
            v57 = 1024;
            v58 = 336;
            _os_log_impl(&dword_2148C7000, v30, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
          v3 = v37;
          v31 = obj;
LABEL_35:

          goto LABEL_36;
        }

        ++v17;
        v5 = v19;
        if (v15 == v17)
        {
          v9 = obj;
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
          if (v15)
            goto LABEL_9;
LABEL_17:

          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 0;
          objc_msgSend(v26, "removeItemAtPath:error:", v5, &v39);
          v27 = v39;

          if (!v27)
          {
            v3 = v37;
            goto LABEL_20;
          }
          if (__osLog)
            v36 = __osLog;
          else
            v36 = MEMORY[0x24BDACB70];
          v3 = v37;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v50 = "!nserr";
            v51 = 2048;
            v52 = 0;
            v53 = 2080;
            v54 = &unk_21491C593;
            v55 = 2080;
            v56 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
            v57 = 1024;
            v58 = 341;
            _os_log_impl(&dword_2148C7000, v36, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }

          v28 = 5;
          v9 = v27;
          goto LABEL_22;
        }
      }
      if (__osLog)
        v32 = __osLog;
      else
        v32 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v50 = "!nserr";
        v51 = 2048;
        v52 = 0;
        v53 = 2080;
        v54 = &unk_21491C593;
        v55 = 2080;
        v56 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
        v57 = 1024;
        v58 = 332;
        _os_log_impl(&dword_2148C7000, v32, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v3 = v37;
      v31 = obj;
      v5 = v19;
      goto LABEL_35;
    }
    if (__osLog)
      v35 = __osLog;
    else
      v35 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v50 = "!nserr";
      v51 = 2048;
      v52 = 0;
      v53 = 2080;
      v54 = &unk_21491C593;
      v55 = 2080;
      v56 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
      v57 = 1024;
      v58 = 320;
      _os_log_impl(&dword_2148C7000, v35, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }

LABEL_36:
    v28 = 5;
    goto LABEL_22;
  }
  v9 = 0;
  if (v7)
  {
LABEL_20:
    -[BKCatacomb syncDir:](self, "syncDir:", self->_catacombDir);

    v9 = 0;
  }
  v28 = 0;
LABEL_22:

  return v28;
}

- (int)deleteAll
{
  void *v3;
  int v4;
  void *v5;
  NSString *catacombDir;
  id v7;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", self->_catacombDir);

  if (!v4)
    return 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  catacombDir = self->_catacombDir;
  v10 = 0;
  objc_msgSend(v5, "removeItemAtPath:error:", catacombDir, &v10);
  v7 = v10;

  if (!v7)
    return 0;
  if (__osLog)
    v9 = __osLog;
  else
    v9 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v12 = "!nserr";
    v13 = 2048;
    v14 = 0;
    v15 = 2080;
    v16 = &unk_21491C593;
    v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BKCatacomb.m";
    v19 = 1024;
    v20 = 363;
    _os_log_impl(&dword_2148C7000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }

  return 5;
}

- (id)content
{
  void *v3;
  NSString *catacombDir;
  void *v5;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  catacombDir = self->_catacombDir;
  v7 = 0;
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", catacombDir, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)catacombDir
{
  return self->_catacombDir;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeAttributes, 0);
  objc_storeStrong((id *)&self->_catacombDir, 0);
}

@end
