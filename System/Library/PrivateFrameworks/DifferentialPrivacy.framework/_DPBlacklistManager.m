@implementation _DPBlacklistManager

+ (void)processRuntimeBlacklist:(id)a3 systemDirectory:(id)a4 runtimeDirectory:(id)a5 blacklistLengthLimit:(unint64_t)a6
{
  NSObject *v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  const char *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  NSObject *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!objc_msgSend((id)objc_opt_class(), "createRuntimeBlacklistDirectory:", v13)
    || !-[NSObject length](v11, "length"))
  {
    goto LABEL_23;
  }
  if (!-[NSObject isEqualToString:](v11, "isEqualToString:", CFSTR("DifferentialPrivacyDARemoveAllBlacklistCommand")))
  {
    if (-[NSObject lengthOfBytesUsingEncoding:](v11, "lengthOfBytesUsingEncoding:", 4) > a6)
    {
      +[_DPLog daemon](_DPLog, "daemon");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[_DPBlacklistManager processRuntimeBlacklist:systemDirectory:runtimeDirectory:blacklistLengthLimit:].cold.2((uint64_t)a1, a2, v15);
      goto LABEL_22;
    }
    v16 = v11;
    v15 = v16;
    if ((unint64_t)-[NSObject length](v16, "length") >= 0x65)
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      -[NSObject substringToIndex:](v16, "substringToIndex:", 100);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ ..."), v18);
      v15 = objc_claimAutoreleasedReturnValue();

    }
    if (+[_DPBlacklistManager validateBlacklist:](_DPBlacklistManager, "validateBlacklist:", v16))
    {
      v19 = objc_msgSend((id)objc_opt_class(), "saveBlacklist:systemDirectory:runtimeDirectory:memoryLimit:", v16, v12, v13, 512000);
      +[_DPLog daemon](_DPLog, "daemon");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v19)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v32 = v23;
          v33 = 2112;
          v34 = v24;
          v35 = 2112;
          v36 = v15;
          _os_log_debug_impl(&dword_1D3FAA000, v21, OS_LOG_TYPE_DEBUG, "%@, %@: Successfully loaded blacklist string to runtime blacklist directory : %@", buf, 0x20u);
LABEL_26:

        }
LABEL_21:

LABEL_22:
        goto LABEL_23;
      }
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v32 = v23;
      v33 = 2112;
      v34 = v24;
      v35 = 2112;
      v36 = v15;
      v26 = "%@, %@: Failed loading blacklist string to runtime blacklist directory : %@";
    }
    else
    {
      +[_DPLog daemon](_DPLog, "daemon");
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v32 = v23;
      v33 = 2112;
      v34 = v24;
      v35 = 2112;
      v36 = v15;
      v26 = "%@, %@: ill-formatted blacklist string : %@";
    }
    _os_log_error_impl(&dword_1D3FAA000, v21, OS_LOG_TYPE_ERROR, v26, buf, 0x20u);
    goto LABEL_26;
  }
  +[_DPBlacklist resetAllBlacklists](_DPBlacklist, "resetAllBlacklists");
  +[_DPLog daemon](_DPLog, "daemon");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v32 = v28;
    v33 = 2112;
    v34 = v29;
    v35 = 2112;
    v36 = v11;
    _os_log_debug_impl(&dword_1D3FAA000, v14, OS_LOG_TYPE_DEBUG, "%@, %@: Received removing all runtime blacklist files command: %@", buf, 0x20u);

  }
  if (!+[_DPBlacklistManager removeAllFilesFromDirectory:](_DPBlacklistManager, "removeAllFilesFromDirectory:", v13))
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[_DPBlacklistManager processRuntimeBlacklist:systemDirectory:runtimeDirectory:blacklistLengthLimit:].cold.1((uint64_t)a1, a2, v15);
    goto LABEL_22;
  }
LABEL_23:

}

+ (id)keepLatestRuntimeBlacklistInDirectory:(id)a3 compareToSystemBlacklistInDirectory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v24;
  id v25;
  id obj;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v25 = (id)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v27 = v5;
  objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v5, &v32);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v32;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(obj);
        +[_DPBlacklist extractKeyFromFileName:](_DPBlacklist, "extractKeyFromFileName:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
        {
          v14 = (void *)MEMORY[0x1D8256B78]();
          +[_DPBlacklist blacklistForKey:fromConfigurationsFile:](_DPBlacklist, "blacklistForKey:fromConfigurationsFile:", v13, v27);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (+[_DPBlacklist blacklistExistsWithKey:inDirectory:](_DPBlacklist, "blacklistExistsWithKey:inDirectory:", v13, v6))
          {
            goto LABEL_10;
          }
          +[_DPKeyNames keyPropertiesForKey:](_DPKeyNames, "keyPropertiesForKey:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {

LABEL_10:
            +[_DPBlacklist blacklistForKey:fromConfigurationsFile:](_DPBlacklist, "blacklistForKey:fromConfigurationsFile:", v13, v6);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v15, "version");
            v19 = objc_msgSend(v17, "version");
            v20 = v15;
            if (v18 <= v19)
            {
              objc_msgSend((id)objc_opt_class(), "removeBlacklistFileWithKey:fromDirectory:", v13, v27);
              v20 = v17;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v20, "version"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setObject:forKeyedSubscript:", v21, v13);

          }
          else
          {
            objc_msgSend((id)objc_opt_class(), "removeBlacklistFileWithKey:fromDirectory:", v13, v27);
          }

          objc_autoreleasePoolPop(v14);
        }

        ++v12;
      }
      while (v10 != v12);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      v10 = v22;
    }
    while (v22);
  }

  return v25;
}

+ (BOOL)removeAllFilesFromDirectory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *context;
  char v23;
  void *v24;
  id obj;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  context = (void *)MEMORY[0x1D8256B78]();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v27 = 0;
  objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v3, &v27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v27;
  obj = v5;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    v23 = 1;
    do
    {
      v10 = 0;
      v11 = v6;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v3, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v11;
        v14 = objc_msgSend(v4, "removeItemAtPath:error:", v13, &v26);
        v6 = v26;

        if ((v14 & 1) == 0)
        {
          +[_DPLog daemon](_DPLog, "daemon");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = (objc_class *)objc_opt_class();
            NSStringFromClass(v16);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "description");
            v18 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v33 = v24;
            v34 = 2112;
            v35 = v17;
            v36 = 2112;
            v37 = v12;
            v38 = 2112;
            v39 = v18;
            v19 = (void *)v18;
            _os_log_error_impl(&dword_1D3FAA000, v15, OS_LOG_TYPE_ERROR, "%@, %@: Failed to delete a file named as %@ from runtime blacklist directory: %@", buf, 0x2Au);

          }
          v23 = 0;
        }

        ++v10;
        v11 = v6;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v8);
  }
  else
  {
    v23 = 1;
  }

  objc_autoreleasePoolPop(context);
  return v23 & 1;
}

+ (BOOL)validateBlacklist:(id)a3
{
  id v3;
  void *v4;
  id v5;
  BOOL v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v16;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^[\\._a-zA-Z0-9]+:[0-9]+,[[^,:;]+,]*[^,:;]+$"),
      0,
      &v16);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v16;
    if (v5)
    {
      v6 = 0;
LABEL_24:

      goto LABEL_25;
    }
    v7 = 0;
    if (objc_msgSend(v3, "length"))
    {
      v8 = 0;
      while (2)
      {
        v9 = (void *)MEMORY[0x1D8256B78]();
        if (!v7)
          v7 = (void *)objc_msgSend(&stru_1E95DA470, "mutableCopy");
        while (1)
        {
          if (v8 >= objc_msgSend(v3, "length"))
            goto LABEL_19;
          v10 = objc_msgSend(v3, "characterAtIndex:", v8);
          v11 = v10 <= 0x7F ? v10 : 97;
          if ((_DWORD)v11 == 59)
            break;
          objc_msgSend(v7, "appendFormat:", CFSTR("%c"), v11);
          ++v8;
        }
        if (objc_msgSend(v7, "length"))
        {
          objc_msgSend(v4, "firstMatchInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v12, "range"))
          {
            v13 = objc_msgSend(v7, "length");
            objc_msgSend(v12, "range");
            if (v13 == v14)
            {

              ++v8;
              v7 = 0;
LABEL_19:
              objc_autoreleasePoolPop(v9);
              if (v8 < objc_msgSend(v3, "length"))
                continue;
              goto LABEL_20;
            }
          }

        }
        break;
      }
      objc_autoreleasePoolPop(v9);
      v6 = 0;
      goto LABEL_23;
    }
LABEL_20:
    v6 = objc_msgSend(v7, "length") == 0;
LABEL_23:

    goto LABEL_24;
  }
  v6 = 0;
LABEL_25:

  return v6;
}

+ (BOOL)saveBlacklist:(id)a3 systemDirectory:(id)a4 runtimeDirectory:(id)a5 memoryLimit:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  NSObject *v16;
  char v17;
  objc_class *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  +[_DPBlacklist resetAllBlacklists](_DPBlacklist, "resetAllBlacklists");
  objc_msgSend((id)objc_opt_class(), "keepLatestRuntimeBlacklistInDirectory:compareToSystemBlacklistInDirectory:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend((id)objc_opt_class(), "memoryRequiredBySystemBlacklistInDirectory:runtimeBlacklistInDirectory:blacklist:", v11, v12, v10);
  if (v14 <= a6)
  {
    v17 = objc_msgSend((id)objc_opt_class(), "saveBlacklist:knownVersionByKey:systemDirectory:runtimeDirectory:", v10, v13, v11, v12);
  }
  else
  {
    v15 = v14;
    +[_DPLog daemon](_DPLog, "daemon");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138413058;
      v23 = v20;
      v24 = 2112;
      v25 = v21;
      v26 = 2048;
      v27 = v15;
      v28 = 2048;
      v29 = a6;
      _os_log_error_impl(&dword_1D3FAA000, v16, OS_LOG_TYPE_ERROR, "%@, %@: total required memory(%llu) exceeds limit : %llu", (uint8_t *)&v22, 0x2Au);

    }
    v17 = 0;
  }

  return v17;
}

+ (unint64_t)memoryRequiredBySystemBlacklistInDirectory:(id)a3 runtimeBlacklistInDirectory:(id)a4 blacklist:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend((id)objc_opt_class(), "memorySizeWithDirectory:", v9);

  v11 = objc_msgSend((id)objc_opt_class(), "memorySizeWithDirectory:", v8);
  v12 = objc_msgSend(v7, "lengthOfBytesUsingEncoding:", 4);

  return v11 + v10 + v12;
}

+ (unint64_t)memorySizeWithDirectory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(obj);
        +[_DPBlacklist extractKeyFromFileName:](_DPBlacklist, "extractKeyFromFileName:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {
          +[_DPBlacklist filePathWithKey:inDirectory:](_DPBlacklist, "filePathWithKey:inDirectory:", v11, v3);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "attributesOfItemAtPath:error:", v12, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "fileSize");

          v8 += v15;
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)saveBlacklist:(id)a3 knownVersionByKey:(id)a4 systemDirectory:(id)a5 runtimeDirectory:(id)a6
{
  id v9;
  id v10;
  unint64_t v11;
  _BOOL4 v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  int v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *context;
  id v39;
  id v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  uint64_t v45;

  v9 = a3;
  v10 = a4;
  v39 = a5;
  v40 = a6;
  context = (void *)MEMORY[0x1D8256B78]();
  if (objc_msgSend(v9, "length"))
  {
    v11 = 0;
    v12 = 1;
    v13 = -1;
    v14 = -1;
    v41 = v10;
    while (1)
    {
      if (v13 == -1)
      {
        v14 = v11;
        v13 = v11;
      }
      if (objc_msgSend(v9, "characterAtIndex:", v11) == 59)
      {
        if (v14 - v13 < 3)
          goto LABEL_38;
        v15 = (void *)MEMORY[0x1D8256B78]();
        v16 = v13;
        if (v14 >= v13)
        {
          v16 = v13;
          if (objc_msgSend(v9, "characterAtIndex:", v13) != 58)
          {
            v17 = v13;
            do
              v16 = v17++;
            while (v17 <= v14 && objc_msgSend(v9, "characterAtIndex:", v17) != 58);
          }
        }
        objc_msgSend(v9, "substringWithRange:", v13, v16 - v13 + 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[_DPKeyNames keyPropertiesForKey:](_DPKeyNames, "keyPropertiesForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v43 = v19;
          v44 = v15;
          v42 = v12;
          v20 = v16 + 2;
          v21 = v16 + 2;
          if (v16 + 2 <= v14)
          {
            v21 = v16 + 2;
            if (objc_msgSend(v9, "characterAtIndex:", v16 + 2) != 44)
            {
              v22 = v16 + 2;
              do
                v21 = v22++;
              while (v22 <= v14 && objc_msgSend(v9, "characterAtIndex:", v22) != 44);
            }
          }
          v23 = ~v16;
          objc_msgSend(v9, "substringWithRange:", v16 + 2, v21 + ~v16);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = -1;
          objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v25, "scanInteger:", &v45) & 1) != 0 || (objc_msgSend(v25, "isAtEnd") & 1) == 0)
          {
            objc_msgSend(v9, "substringWithRange:", v20, v14 + v23);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = v41;
            objc_msgSend(v41, "objectForKeyedSubscript:", v18);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28)
            {
              objc_msgSend(v41, "objectForKeyedSubscript:", v18);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "intValue");
              v31 = v45;

              v32 = v31 > v30
                 && v42 & objc_msgSend((id)objc_opt_class(), "saveBlacklist:forKey:runtimeDirectory:", v27, v18, v40);
            }
            else
            {
              v33 = +[_DPBlacklist blacklistExistsWithKey:inDirectory:](_DPBlacklist, "blacklistExistsWithKey:inDirectory:", v18, v39);
              +[_DPBlacklist blacklistForKey:fromConfigurationsFile:](_DPBlacklist, "blacklistForKey:fromConfigurationsFile:", v18, v39);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = v34;
              if (v33 && (v36 = objc_msgSend(v34, "version"), v36 >= v45))
                v32 = 0;
              else
                v32 = v42 & objc_msgSend((id)objc_opt_class(), "saveBlacklist:forKey:runtimeDirectory:", v27, v18, v40);

            }
            v26 = 0;
            v12 = v32 != 0;
            v14 = -1;
            v13 = -1;
          }
          else
          {
            v26 = 1;
            v10 = v41;
            v12 = v42;
          }

          v19 = v43;
          v15 = v44;
        }
        else
        {
          v26 = 1;
        }

        objc_autoreleasePoolPop(v15);
        if (v26)
        {
LABEL_38:
          LOBYTE(v12) = 0;
          goto LABEL_39;
        }
      }
      else
      {
        v14 = v11;
      }
      if (++v11 >= objc_msgSend(v9, "length"))
        goto LABEL_39;
    }
  }
  LOBYTE(v12) = 1;
LABEL_39:
  objc_autoreleasePoolPop(context);

  return v12;
}

+ (BOOL)saveBlacklist:(id)a3 forKey:(id)a4 runtimeDirectory:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  char *aSelectora;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[_DPBlacklist filePathWithKey:inDirectory:](_DPBlacklist, "filePathWithKey:inDirectory:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1D8256B78]();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(","), CFSTR("\n"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v12, CFSTR("\n"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  v14 = objc_msgSend(v13, "writeToFile:atomically:encoding:error:", v10, 1, 4, &v24);
  v15 = v24;
  if ((v14 & 1) == 0)
  {
    +[_DPLog framework](_DPLog, "framework");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_opt_class();
      v21 = v20;
      NSStringFromSelector(a2);
      aSelectora = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "description");
      v18 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v26 = v20;
      v27 = 2112;
      v28 = aSelectora;
      v29 = 2112;
      v30 = v10;
      v31 = 2112;
      v32 = v18;
      v19 = (void *)v18;
      _os_log_error_impl(&dword_1D3FAA000, v16, OS_LOG_TYPE_ERROR, "%@ : %@ : Saving runtime blacklists failed! '%@' : %@", buf, 0x2Au);

    }
  }

  objc_autoreleasePoolPop(v11);
  return v14;
}

+ (BOOL)removeBlacklistFileWithKey:(id)a3 fromDirectory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D8256B78]();
  +[_DPBlacklist filePathWithKey:inDirectory:](_DPBlacklist, "filePathWithKey:inDirectory:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v11 = objc_msgSend(v10, "removeItemAtPath:error:", v9, &v19);
  v12 = v19;

  if ((v11 & 1) == 0)
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "description");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      v24 = 2112;
      v25 = v6;
      v26 = 2112;
      v27 = v18;
      _os_log_error_impl(&dword_1D3FAA000, v13, OS_LOG_TYPE_ERROR, "%@, %@: Failed to delete a runtime blacklist with the key of %@ : %@", buf, 0x2Au);

    }
  }

  objc_autoreleasePoolPop(v8);
  return v11;
}

+ (BOOL)createRuntimeBlacklistDirectory:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  char v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55___DPBlacklistManager_createRuntimeBlacklistDirectory___block_invoke;
  block[3] = &unk_1E95D8F98;
  v9 = v3;
  v4 = createRuntimeBlacklistDirectory__onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&createRuntimeBlacklistDirectory__onceToken, block);
  v6 = createRuntimeBlacklistDirectory__created;

  return v6;
}

+ (void)processRuntimeBlacklist
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_0(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, v7, v5, "%@, %@: DA String is not successfully removed.", v6);

}

- (void)scheduleMaintenanceWithName:(id)a3 database:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60___DPBlacklistManager_scheduleMaintenanceWithName_database___block_invoke;
  v7[3] = &unk_1E95D8FC0;
  v7[4] = self;
  v4 = a3;
  v5 = (void *)MEMORY[0x1D8256D34](v7);
  +[_DPPeriodicTask taskWithName:period:handler:](_DPPeriodicTask, "taskWithName:period:handler:", v4, kSecondsIn24Hours, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DPPeriodicTaskManager registerTask:](_DPPeriodicTaskManager, "registerTask:", v6);
}

+ (void)processRuntimeBlacklist:(NSObject *)a3 systemDirectory:runtimeDirectory:blacklistLengthLimit:.cold.1(uint64_t a1, const char *a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, a3, v8, "%@, %@: Failed cleaning runtime blacklist directory", v9);

  OUTLINED_FUNCTION_1_0();
}

+ (void)processRuntimeBlacklist:(NSObject *)a3 systemDirectory:runtimeDirectory:blacklistLengthLimit:.cold.2(uint64_t a1, const char *a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, a3, v8, "%@, %@: blacklist string is too long, unable to process.", v9);

  OUTLINED_FUNCTION_1_0();
}

@end
