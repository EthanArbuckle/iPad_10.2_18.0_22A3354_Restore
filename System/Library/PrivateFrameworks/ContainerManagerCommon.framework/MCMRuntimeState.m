@implementation MCMRuntimeState

- (MCMRuntimeState)init
{
  MCMRuntimeState *v2;
  MCMRuntimeState *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSURL *url;
  uint64_t v8;
  MCMTestLocks *testLocks;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)MCMRuntimeState;
  v2 = -[MCMRuntimeState init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MCMRuntimeState _urlForDirectory](v2, "_urlForDirectory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("runtime_state"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathExtension:", CFSTR("plist"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v3->_url;
    v3->_url = (NSURL *)v6;

    +[MCMTestLocks sharedInstance](MCMTestLocks, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    testLocks = v3->_testLocks;
    v3->_testLocks = (MCMTestLocks *)v8;

  }
  return v3;
}

- (void)reset
{
  void *v3;
  id v4;

  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MCMRuntimeState url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtURL:error:", v3, 0);

}

- (void)persist
{
  if (os_variant_has_internal_content())
    -[MCMRuntimeState _accumulateAndPersist](self, "_accumulateAndPersist");
}

- (void)restore
{
  if (os_variant_has_internal_content())
    -[MCMRuntimeState _loadAndRestore](self, "_loadAndRestore");
}

- (id)_urlForDirectory
{
  const __CFString *v2;
  void *v3;
  void *v4;
  void *v5;

  if (xpc_is_system_session())
    v2 = CFSTR("root");
  else
    v2 = CFSTR("mobile");
  +[MCMPOSIXUser posixUserWithName:](MCMPOSIXUser, "posixUserWithName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/MobileContainerManager"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_accumulateAndPersist
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMRuntimeState _accumulateAsPlist](self, "_accumulateAsPlist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMRuntimeState url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v7 = objc_msgSend(v5, "MCM_writeToURL:withOptions:fileManager:error:", v6, 0x10000000, v4, &v10);
  v8 = v10;

  if ((v7 & 1) == 0)
  {
    container_log_handle_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "Failed to write runtime state data; error = %@",
        buf,
        0xCu);
    }

  }
  objc_autoreleasePoolPop(v3);
}

- (id)_accumulateAsPlist
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("MCMRuntimeStateTestLocksEnabled");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[MCMRuntimeState testLocks](self, "testLocks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "enabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("MCMRuntimeStateTestLocks");
  v10[0] = v5;
  -[MCMRuntimeState _accumulateTestLocksAsPlistArray](self, "_accumulateTestLocksAsPlistArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_accumulateTestLocksAsPlistArray
{
  void *v3;
  uint64_t i;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 15; ++i)
  {
    -[MCMRuntimeState testLocks](self, "testLocks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countOfLock:", i);

    if (v6 >= 1)
    {
      v12[0] = CFSTR("MCMRuntimeStateTestLocksNum");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[1] = CFSTR("MCMRuntimeStateTestLocksCount");
      v13[0] = v7;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v9);

    }
  }
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (void)_loadAndRestore
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99D80];
  -[MCMRuntimeState url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v5, "MCM_dictionaryWithContentsOfURL:options:fileManager:fsNode:error:", v6, 0, v4, 0, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;

  if (!v7)
  {
    objc_msgSend(v8, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v10 = objc_msgSend(v8, "code");

      if (v10 == 2)
      {
        container_log_handle_for_category();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1CF807000, v11, OS_LOG_TYPE_DEBUG, "Did not find runtime state to restore, so skipping", buf, 2u);
        }
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {

    }
    container_log_handle_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, "Could not load runtime state to restore; error = %@",
        buf,
        0xCu);
    }
    goto LABEL_10;
  }
  -[MCMRuntimeState _restoreFromPlist:](self, "_restoreFromPlist:", v7);
LABEL_11:

  objc_autoreleasePoolPop(v3);
}

- (void)_restoreFromPlist:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MCMRuntimeStateTestLocksEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  if (v6)
  {
    v7 = objc_msgSend(v6, "BOOLValue");
    -[MCMRuntimeState testLocks](self, "testLocks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", v7);

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MCMRuntimeStateTestLocks"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  if (v11)
    -[MCMRuntimeState _restoreTestLocksWithPlistArray:](self, "_restoreTestLocksWithPlistArray:", v11);

}

- (void)_restoreTestLocksWithPlistArray:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  id v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v7);
        objc_opt_class();
        v9 = v8;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

LABEL_11:
          v12 = 0;
          v13 = 0;
          v14 = 0;
          goto LABEL_12;
        }
        if (!v9)
          goto LABEL_11;
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MCMRuntimeStateTestLocksNum"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v11 = v10;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v11;
        else
          v12 = 0;

        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MCMRuntimeStateTestLocksCount"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v17 = v16;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = v17;
        else
          v13 = 0;

        if (v12 && v13)
        {
          -[MCMRuntimeState _restoreTestLock:count:](self, "_restoreTestLock:count:", objc_msgSend(v12, "unsignedLongLongValue"), objc_msgSend(v13, "unsignedLongValue"));
          v14 = v9;
          goto LABEL_15;
        }
        v14 = v9;
LABEL_12:
        container_log_handle_for_category();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v9;
          _os_log_error_impl(&dword_1CF807000, v15, OS_LOG_TYPE_ERROR, "Malformed test locks dict when restoring state; testLockValue = %@",
            buf,
            0xCu);
        }

LABEL_15:
        ++v7;
      }
      while (v5 != v7);
      v18 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
      v5 = v18;
    }
    while (v18);
  }

}

- (void)_restoreTestLock:(unint64_t)a3 count:(unint64_t)a4
{
  unint64_t v4;
  void *v7;

  if (a4)
  {
    v4 = a4;
    do
    {
      -[MCMRuntimeState testLocks](self, "testLocks");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "acquireLock:", a3);

      --v4;
    }
    while (v4);
  }
}

- (MCMTestLocks)testLocks
{
  return self->_testLocks;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_testLocks, 0);
}

@end
