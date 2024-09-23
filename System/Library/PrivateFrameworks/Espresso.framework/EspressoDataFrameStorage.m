@implementation EspressoDataFrameStorage

- (unint64_t)numberOfDataFrames
{
  return -[NSMutableArray count](self->_dataFrames, "count");
}

- (id)dataFrameAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_dataFrames, "objectAtIndexedSubscript:", a3);
}

- (NSMutableArray)dataFrames
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDataFrames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)mappedFiles
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMappedFiles:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)baseFilename
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBaseFilename:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseFilename, 0);
  objc_storeStrong((id *)&self->_mappedFiles, 0);
  objc_storeStrong((id *)&self->_dataFrames, 0);
}

+ (id)dataFrameStorageFromPath:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  Espresso *v8;
  const char *v9;
  NSObject *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v26;
  int v27;
  std::runtime_error *exception;
  std::runtime_error *v29;
  std::runtime_error *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v5 = (void *)objc_opt_new();
  if (a4)
    *a4 = 0;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "setDataFrames:", v6);

  v7 = (void *)objc_opt_new();
  objc_msgSend(v5, "setMappedFiles:", v7);

  v8 = (Espresso *)objc_msgSend(v5, "setBaseFilename:", v32);
  Espresso::espresso_os_log_subsystem(v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v32;
    _os_log_impl(&dword_190DAF000, v10, OS_LOG_TYPE_INFO, "EspressoDataFrameStorage: load %@", buf, 0xCu);
  }

  objc_msgSend(v32, "pathExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("json"));

  if (!v12)
  {
    objc_msgSend(v32, "pathExtension");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("db"));

    if (v27)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x58uLL);
      Espresso::not_implemented_error::not_implemented_error(exception);
    }
    Espresso::throw_exception_selector<Espresso::invalid_argument_error>("format not supported");
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v32);
  v13 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v13;
  if (!v13)
  {
    v29 = (std::runtime_error *)__cxa_allocate_exception(0x58uLL);
    Espresso::io_error::io_error(v29);
  }
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v13, 0, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    v30 = (std::runtime_error *)__cxa_allocate_exception(0x58uLL);
    Espresso::io_error::io_error(v30);
  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("frames"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
    Espresso::throw_exception_selector<Espresso::io_error>("Missing frames key");
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v34 != v19)
          objc_enumerationMutation(v17);
        v21 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        v22 = (void *)objc_opt_new();
        objc_msgSend(v22, "loadFromDict:frameStorage:", v21, v5);
        objc_msgSend(v5, "dataFrames");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v22);

      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v18);
  }

  v24 = v5;
  return v24;
}

@end
