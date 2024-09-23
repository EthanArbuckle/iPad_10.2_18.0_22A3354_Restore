@implementation PHImportExceptionRecorder

- (PHImportExceptionRecorder)init
{
  PHImportExceptionRecorder *v2;
  uint64_t v3;
  NSMutableArray *exceptions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHImportExceptionRecorder;
  v2 = -[PHImportExceptionRecorder init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    exceptions = v2->_exceptions;
    v2->_exceptions = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)addException:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](self->_exceptions, "addObject:");
}

- (void)addExceptions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[PHImportExceptionRecorder addException:](self, "addException:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)addExceptionWithType:(int64_t)a3 path:(id)a4 underlyingError:(id)a5 file:(char *)a6 line:(unint64_t)a7
{
  id v12;
  id v13;
  PHImportException *v14;

  v12 = a5;
  v13 = a4;
  v14 = -[PHImportException initWithType:path:underlyingError:file:line:]([PHImportException alloc], "initWithType:path:underlyingError:file:line:", a3, v13, v12, a6, a7);

  -[PHImportExceptionRecorder addException:](self, "addException:", v14);
  return v14;
}

- (id)logForExceptions
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PHImportExceptionRecorder exceptions](self, "exceptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = &stru_1E35DFFF8;
    do
    {
      v7 = 0;
      v8 = v6;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v8, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v7;
        v8 = v6;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = &stru_1E35DFFF8;
  }

  return v6;
}

- (void)logErrors
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_exceptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("\n\n\t========= Import Errors ========="));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n\t%lu files had issues"), -[NSMutableArray count](self->_exceptions, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v4);

    objc_msgSend(v3, "appendString:", CFSTR("\n\t--------- Error Detail ----------"));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_exceptions;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n\t%@"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendString:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "appendString:", CFSTR("\n\t=================================\n"));
    PLImportGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v3;
      _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

  }
}

- (NSMutableArray)exceptions
{
  return self->_exceptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exceptions, 0);
}

@end
