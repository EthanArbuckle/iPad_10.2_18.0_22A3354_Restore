@implementation CCSQLiteDatabase

- (id)executeCommand:(id)a3 options:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  NSString *path;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  id v28;
  _QWORD v29[4];
  _QWORD v30[5];

  v30[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = mach_absolute_time();
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v28 = 0;
  -[CCSQLiteDatabase _cachedOrPreparedStatementFromCommand:options:error:](self, "_cachedOrPreparedStatementFromCommand:options:error:", v6, a4, &v28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v28;
  if (v9)
  {
    v27 = v7;
    v11 = sqlite3_column_count((sqlite3_stmt *)objc_msgSend(v9, "stmt"));
    while (1)
    {
      v12 = sqlite3_step((sqlite3_stmt *)objc_msgSend(v9, "stmt"));
      if (v12 != 100)
        break;
      if ((int)v11 < 1)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v11);
        v14 = 0;
        do
        {
          _columnValueFromSQLiteStatement((sqlite3_stmt *)objc_msgSend(v9, "stmt"), v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v15);

          v14 = (v14 + 1);
        }
        while ((_DWORD)v11 != (_DWORD)v14);
      }
      objc_msgSend(v8, "addObject:", v13);

    }
    v16 = v12;
    if (v12 != 101)
    {

      v20 = sqlite3_extended_errcode(self->_handle);
      _errorDescriptionForCommand();
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v21 = objc_alloc(MEMORY[0x24BDD1540]);
      path = self->_path;
      v29[0] = *MEMORY[0x24BDD0CB8];
      v29[1] = CFSTR("command");
      v30[0] = path;
      v30[1] = v6;
      v29[2] = *MEMORY[0x24BDD1398];
      _createSQLiteAPIErrorFromResultCode(v16, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v29[3] = *MEMORY[0x24BDD0FC8];
      v30[2] = v23;
      v30[3] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.CCDatabase"), 2, v24);

      _createExecutionResult(v6, v27, 0, v25);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v25;
      goto LABEL_15;
    }
    sqlite3_reset((sqlite3_stmt *)objc_msgSend(v9, "stmt"));
    sqlite3_clear_bindings((sqlite3_stmt *)objc_msgSend(v9, "stmt"));
    v17 = v6;
    v18 = v27;
  }
  else
  {
    v17 = v6;
    v18 = v7;
  }
  _createExecutionResult(v17, v18, v8, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v19;
}

- (BOOL)_validateAndBindSqliteStatementParameters:(sqlite3_stmt *)a3 usingCommand:(id)a4 outError:(id *)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  int v11;
  id v12;
  id v13;
  NSString *v14;
  void *v15;
  BOOL v16;
  unint64_t v17;
  id v18;
  int v19;
  NSObject *v20;
  const void *v21;
  int v22;
  double v23;
  uint64_t v24;
  NSString *path;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  id v31;
  CCSQLiteDatabase *v32;
  _QWORD v33[4];
  _QWORD v34[4];
  _QWORD v35[3];
  _QWORD v36[3];
  _BYTE buf[12];
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  objc_msgSend(v8, "parameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  v11 = sqlite3_bind_parameter_count(a3);
  if (v11 < 0 || v11 == (_DWORD)v10)
  {
    if (!v10)
    {
LABEL_22:
      v16 = 1;
      goto LABEL_28;
    }
    v32 = self;
    v16 = 0;
    v17 = 0;
    while (2)
    {
      objc_msgSend(v9, "objectAtIndex:", v17++, v29);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      switch(objc_msgSend(v12, "databaseValue_type"))
      {
        case 0:
          objc_msgSend(v12, "description");
          v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v19 = sqlite3_bind_text(a3, v17, (const char *)objc_msgSend(v18, "UTF8String"), -1, 0);

          __biome_log_for_category();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v17);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v12;
            v38 = 2112;
            v39 = v30;
            v40 = 2112;
            v41 = v29;
            _os_log_error_impl(&dword_237B25000, v20, OS_LOG_TYPE_ERROR, "Bind parameter: %@ with unspecified type (sqlite_parameter_index: %@, valueType: %@)", buf, 0x20u);

          }
          goto LABEL_20;
        case 1:
          *(_QWORD *)buf = 0;
          v21 = (const void *)objc_msgSend(v12, "databaseValue_blobRepresentationWithLength:", buf);
          if (*(_QWORD *)buf)
            v22 = sqlite3_bind_blob64(a3, v17, v21, *(sqlite3_uint64 *)buf, 0);
          else
            v22 = sqlite3_bind_zeroblob(a3, v17, 0);
          goto LABEL_19;
        case 2:
          objc_msgSend(v12, "databaseValue_doubleRepresentation");
          v22 = sqlite3_bind_double(a3, v17, v23);
          goto LABEL_19;
        case 3:
          v22 = sqlite3_bind_int64(a3, v17, objc_msgSend(v12, "databaseValue_integerRepresentation"));
          goto LABEL_19;
        case 4:
          v22 = sqlite3_bind_null(a3, v17);
          goto LABEL_19;
        case 5:
          v22 = sqlite3_bind_text(a3, v17, (const char *)objc_msgSend(v12, "databaseValue_textRepresentation"), -1, 0);
LABEL_19:
          v19 = v22;
LABEL_20:

          if (!v19)
            goto LABEL_21;
          if (!a5)
            goto LABEL_27;
          v24 = sqlite3_extended_errcode(v32->_handle);
          _errorDescriptionForCommand();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_alloc(MEMORY[0x24BDD1540]);
          path = v32->_path;
          v33[0] = *MEMORY[0x24BDD0CB8];
          v33[1] = CFSTR("command");
          v34[0] = path;
          v34[1] = v8;
          v33[2] = *MEMORY[0x24BDD1398];
          _createSQLiteAPIErrorFromResultCode(v19, v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v33[3] = *MEMORY[0x24BDD0FC8];
          v34[2] = v26;
          v34[3] = v15;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *a5 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.CCDatabase"), 2, v27);

          break;
        default:

LABEL_21:
          v16 = v17 >= v10;
          if (v10 == v17)
            goto LABEL_22;
          continue;
      }
      break;
    }
  }
  else
  {
    if (!a5)
    {
      v16 = 0;
      goto LABEL_28;
    }
    _errorDescriptionForCommand();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc(MEMORY[0x24BDD1540]);
    v14 = self->_path;
    v35[0] = *MEMORY[0x24BDD0CB8];
    v35[1] = CFSTR("command");
    v36[0] = v14;
    v36[1] = v8;
    v35[2] = *MEMORY[0x24BDD0FC8];
    v36[2] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    *a5 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.CCDatabase"), 9, v15);
  }

LABEL_27:
LABEL_28:

  return v16;
}

- (BOOL)_prepareSqliteStatement:(sqlite3_stmt *)a3 usingCommand:(id)a4 outError:(id *)a5
{
  id v8;
  sqlite3 *handle;
  id v10;
  int v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSString *path;
  void *v16;
  void *v17;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  handle = self->_handle;
  objc_msgSend(v8, "commandString");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = sqlite3_prepare_v2(handle, (const char *)objc_msgSend(v10, "UTF8String"), 0x80000000, a3, 0);

  if (v11)
  {
    v12 = sqlite3_extended_errcode(self->_handle);
    if (a3)
      sqlite3_finalize(*a3);
    if (a5)
    {
      _errorDescriptionForCommand();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc(MEMORY[0x24BDD1540]);
      path = self->_path;
      v19[0] = *MEMORY[0x24BDD0CB8];
      v19[1] = CFSTR("command");
      v20[0] = path;
      v20[1] = v8;
      v19[2] = *MEMORY[0x24BDD1398];
      _createSQLiteAPIErrorFromResultCode(v11, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[3] = *MEMORY[0x24BDD0FC8];
      v20[2] = v16;
      v20[3] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *a5 = (id)objc_msgSend(v14, "initWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.CCDatabase"), 2, v17);

    }
  }

  return v11 == 0;
}

- (BOOL)_validateCommand:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSString *path;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSString *v19;
  uint64_t v20;
  id v21;
  NSString *v22;
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (!self->_handle)
  {
    if (!a4)
      goto LABEL_12;
    v9 = (void *)MEMORY[0x24BDD17C8];
    _errorDescriptionForCommand();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Database is not open. %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc(MEMORY[0x24BDD1540]);
    path = self->_path;
    v14 = *MEMORY[0x24BDD0FC8];
    v28[0] = *MEMORY[0x24BDD0CB8];
    v28[1] = v14;
    v29[0] = path;
    v29[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v12;
    v17 = 6;
LABEL_11:
    *a4 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.CCDatabase"), v17, v15);

    LOBYTE(a4) = 0;
    goto LABEL_12;
  }
  if (!v6)
  {
    if (!a4)
      goto LABEL_12;
    _errorDescriptionForCommand();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x24BDD1540]);
    v19 = self->_path;
    v20 = *MEMORY[0x24BDD0FC8];
    v26[0] = *MEMORY[0x24BDD0CB8];
    v26[1] = v20;
    v27[0] = v19;
    v27[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v18;
    v17 = 7;
    goto LABEL_11;
  }
  objc_msgSend(v6, "commandString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (!a4)
      goto LABEL_12;
    _errorDescriptionForCommand();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc(MEMORY[0x24BDD1540]);
    v22 = self->_path;
    v24[0] = *MEMORY[0x24BDD0CB8];
    v24[1] = CFSTR("command");
    v25[0] = v22;
    v25[1] = v7;
    v24[2] = *MEMORY[0x24BDD0FC8];
    v25[2] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v21;
    v17 = 8;
    goto LABEL_11;
  }
  LOBYTE(a4) = 1;
LABEL_12:

  return (char)a4;
}

- (BOOL)beginTransactionWithError:(id *)a3
{
  return -[CCSQLiteDatabase executeCommandString:error:](self, "executeCommandString:error:", CFSTR("BEGIN TRANSACTION"), a3);
}

- (BOOL)executeCommandString:(id)a3 error:(id *)a4
{
  id v6;
  CCDatabaseCommand *v7;

  v6 = a3;
  v7 = -[CCDatabaseCommand initWithCommandString:parameters:]([CCDatabaseCommand alloc], "initWithCommandString:parameters:", v6, 0);

  LOBYTE(a4) = -[CCSQLiteDatabase executeCommand:options:error:](self, "executeCommand:options:error:", v7, 0, a4);
  return (char)a4;
}

- (BOOL)executeCommand:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  void *v6;
  void *v7;

  -[CCSQLiteDatabase executeCommand:options:](self, "executeCommand:options:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CCSetAndReportError(a5, v7);

  return v7 == 0;
}

- (BOOL)openWithError:(id *)a3
{
  sqlite3 **p_handle;
  NSObject *v4;
  BOOL v5;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  NSString *path;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  char v26;
  unint64_t v27;
  int v28;
  int64_t threadingMode;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  char v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  char v66;
  _QWORD v67[3];
  _QWORD v68[3];
  _QWORD v69[3];
  _QWORD v70[3];
  _QWORD v71[3];
  _QWORD v72[3];
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[2];
  uint64_t v77;
  _QWORD v78[2];

  v78[1] = *MEMORY[0x24BDAC8D0];
  p_handle = &self->_handle;
  if (self->_handle)
  {
    __biome_log_for_category();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[CCSQLiteDatabase openWithError:].cold.2(v4);
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to open database at path: %@"), self->_path);
  v8 = objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (!self->_path)
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v77 = *MEMORY[0x24BDD0FC8];
    v78[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v78, &v77, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.CCDatabase"), 3, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetAndReportError(a3, v18);

LABEL_39:
    goto LABEL_40;
  }
  v66 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", self->_path, &v66);

  if (!v10)
  {
    -[NSString stringByDeletingLastPathComponent](self->_path, "stringByDeletingLastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "fileExistsAtPath:isDirectory:", v17, &v66);

    if (v20)
    {
      if (!v66)
      {
        v21 = (void *)MEMORY[0x24BDD1540];
        v22 = *MEMORY[0x24BDD0FC8];
        v73[0] = *MEMORY[0x24BDD0CB8];
        v73[1] = v22;
        v74[0] = v17;
        v74[1] = v4;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v74, v73, 2);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.CCDatabase"), 5, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        CCSetAndReportError(a3, v24);
LABEL_38:

        goto LABEL_39;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = 0;
      v26 = objc_msgSend(v25, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v17, 1, 0, &v65);
      v23 = v65;

      if ((v26 & 1) == 0)
      {
        v52 = (void *)MEMORY[0x24BDD1540];
        v53 = *MEMORY[0x24BDD0CB8];
        v72[0] = self->_path;
        v54 = *MEMORY[0x24BDD1398];
        v71[0] = v53;
        v71[1] = v54;
        _NSNullIfNilObject(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v71[2] = *MEMORY[0x24BDD0FC8];
        v72[1] = v24;
        v72[2] = v4;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v72, v71, 3);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.CCDatabase"), 1, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        CCSetAndReportError(a3, v56);

        goto LABEL_38;
      }

    }
    goto LABEL_16;
  }
  if (v66)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    path = self->_path;
    v13 = *MEMORY[0x24BDD0FC8];
    v75[0] = *MEMORY[0x24BDD0CB8];
    v75[1] = v13;
    v76[0] = path;
    v76[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.CCDatabase"), 4, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetAndReportError(a3, v15);

LABEL_40:
    v5 = 0;
    goto LABEL_41;
  }
LABEL_16:
  v27 = self->_accessPermission - 1;
  if (v27 > 2)
    v28 = 0;
  else
    v28 = dword_237B6D9BC[v27];
  threadingMode = self->_threadingMode;
  if (threadingMode == 3)
    v30 = 0x10000;
  else
    v30 = (threadingMode == 2) << 15;
  v31 = v30 | v28;
  v32 = self->_dataProtectionClass - 1;
  if (v32 > 5)
    v33 = 0;
  else
    v33 = dword_237B6D9C8[v32];
  v34 = sqlite3_open_v2(-[NSString fileSystemRepresentation](self->_path, "fileSystemRepresentation"), p_handle, v31 | v33, 0);
  if (v34)
  {
    v35 = v34;
    v36 = sqlite3_extended_errcode(self->_handle);
    v37 = (void *)MEMORY[0x24BDD1540];
    v38 = *MEMORY[0x24BDD0CB8];
    v70[0] = self->_path;
    v39 = *MEMORY[0x24BDD1398];
    v69[0] = v38;
    v69[1] = v39;
    _createSQLiteAPIErrorFromResultCode(v35, v36);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v69[2] = *MEMORY[0x24BDD0FC8];
    v70[1] = v40;
    v70[2] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v70, v69, 3);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.CCDatabase"), 2, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetAndReportError(a3, v42);

    v5 = 0;
    self->_handle = 0;
    goto LABEL_41;
  }
  if ((v10 & 1) == 0)
  {
    if ((self->_databaseOptions & 2) != 0)
    {
      v43 = sqlite3_exec(*p_handle, "PRAGMA journal_mode=WAL", 0, 0, 0);
      if ((_DWORD)v43)
      {
        v44 = v43;
        v45 = sqlite3_extended_errcode(*p_handle);
        __biome_log_for_category();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          -[CCSQLiteDatabase openWithError:].cold.1(v44, v45, v46);

      }
    }
    if ((self->_accessPermission & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", self->_path);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_databaseOptions & 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = *MEMORY[0x24BDBCC68];
      v64 = 0;
      v50 = objc_msgSend(v47, "setResourceValue:forKey:error:", v48, v49, &v64);
      v51 = v64;

      if ((v50 & 1) == 0)
      {
        v58 = (void *)MEMORY[0x24BDD1540];
        v59 = *MEMORY[0x24BDD0CB8];
        v68[0] = self->_path;
        v60 = *MEMORY[0x24BDD1398];
        v67[0] = v59;
        v67[1] = v60;
        _NSNullIfNilObject(v51);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v67[2] = *MEMORY[0x24BDD0FC8];
        v68[1] = v61;
        v68[2] = v4;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v68, v67, 3);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.CCDatabase"), 1, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        CCSetAndReportError(a3, v63);

        sqlite3_close_v2(self->_handle);
        self->_handle = 0;

        goto LABEL_40;
      }

    }
  }
  -[NSMutableDictionary removeAllObjects](self->_cachedSQLiteStatements, "removeAllObjects");
LABEL_4:
  v5 = 1;
LABEL_41:

  return v5;
}

- (BOOL)closeWithError:(id *)a3
{
  int v5;
  BOOL v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  if (!self->_handle)
    return 1;
  -[NSMutableDictionary removeAllObjects](self->_cachedSQLiteStatements, "removeAllObjects");
  v5 = sqlite3_close_v2(self->_handle);
  v6 = v5 == 0;
  if (v5)
  {
    v7 = v5;
    v8 = sqlite3_extended_errcode(self->_handle);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to close database at path: %@"), self->_path);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BDD0CB8];
    v18[0] = self->_path;
    v12 = *MEMORY[0x24BDD1398];
    v17[0] = v11;
    v17[1] = v12;
    _createSQLiteAPIErrorFromResultCode(v7, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = *MEMORY[0x24BDD0FC8];
    v18[1] = v13;
    v18[2] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.CCDatabase"), 2, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetAndReportError(a3, v15);

  }
  self->_handle = 0;
  return v6;
}

- (CCSQLiteDatabase)initWithPath:(id)a3 accessPermission:(int64_t)a4 threadingMode:(int64_t)a5 dataProtectionClass:(int)a6 databaseOptions:(int64_t)a7
{
  id v12;
  CCSQLiteDatabase *v13;
  void *v14;
  uint64_t v15;
  NSString *path;
  NSMutableDictionary *v17;
  NSMutableDictionary *cachedSQLiteStatements;
  CCSQLiteDatabase *v19;
  NSObject *v20;
  objc_super v22;

  v12 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CCSQLiteDatabase;
  v13 = -[CCSQLiteDatabase init](&v22, sel_init);
  if (!v13)
    goto LABEL_4;
  objc_msgSend(v12, "stringByStandardizingPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "copy");
  path = v13->_path;
  v13->_path = (NSString *)v15;

  if (-[NSString length](v13->_path, "length"))
  {
    v13->_accessPermission = a4;
    v13->_threadingMode = a5;
    v13->_dataProtectionClass = a6;
    v13->_databaseOptions = a7;
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cachedSQLiteStatements = v13->_cachedSQLiteStatements;
    v13->_cachedSQLiteStatements = v17;

LABEL_4:
    v19 = v13;
    goto LABEL_8;
  }
  __biome_log_for_category();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[CCSQLiteDatabase initWithPath:accessPermission:threadingMode:dataProtectionClass:databaseOptions:].cold.1(v20);

  v19 = 0;
LABEL_8:

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_cachedSQLiteStatements, 0);
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  return -[CCSQLiteDatabase executeCommandString:error:](self, "executeCommandString:error:", CFSTR("COMMIT TRANSACTION"), a3);
}

- (CCSQLiteDatabase)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)_cachedOrPreparedStatementFromCommand:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  char v6;
  id v8;
  CCSQLitePreparedStatement *v9;
  NSMutableDictionary *cachedSQLiteStatements;
  void *v11;
  void *v12;
  sqlite3_stmt *v13;
  sqlite3_stmt *v14;
  int v15;
  void *v16;
  CCSQLitePreparedStatement *v17;
  CCSQLitePreparedStatement *v18;
  CCSQLitePreparedStatement *v19;
  NSMutableDictionary *v20;
  void *v21;
  CCSQLitePreparedStatement *v22;
  sqlite3_stmt *v24;

  v6 = a4;
  v8 = a3;
  v24 = 0;
  v9 = 0;
  if (-[CCSQLiteDatabase _validateCommand:outError:](self, "_validateCommand:outError:", v8, a5))
  {
    if ((v6 & 2) != 0)
    {
      cachedSQLiteStatements = self->_cachedSQLiteStatements;
      objc_msgSend(v8, "commandString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](cachedSQLiteStatements, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = (sqlite3_stmt *)objc_msgSend(v12, "stmt");
        if (!v13 || (v14 = v13, sqlite3_reset(v13)) || (v15 = sqlite3_clear_bindings(v14), v16 = v12, v15))
        {
          v16 = 0;
          v14 = 0;
        }
        v24 = v14;
      }
      else
      {
        v14 = 0;
        v16 = 0;
      }
      v17 = v16;

      if (v14)
      {
        v18 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      v17 = 0;
    }
    if (!-[CCSQLiteDatabase _prepareSqliteStatement:usingCommand:outError:](self, "_prepareSqliteStatement:usingCommand:outError:", &v24, v8, a5))
    {
      v9 = 0;
      v18 = 0;
LABEL_25:

      goto LABEL_26;
    }
    v19 = [CCSQLitePreparedStatement alloc];
    v18 = -[CCSQLitePreparedStatement initWithStmt:](v19, "initWithStmt:", v24);
    v14 = v24;
LABEL_15:
    if (-[CCSQLiteDatabase _validateAndBindSqliteStatementParameters:usingCommand:outError:](self, "_validateAndBindSqliteStatementParameters:usingCommand:outError:", v14, v8, a5))
    {
      if ((v6 & 2) != 0 && v18)
      {
        v20 = self->_cachedSQLiteStatements;
        objc_msgSend(v8, "commandString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v18, v21);

      }
      if (v18)
        v22 = v18;
      else
        v22 = v17;
      v9 = v22;
    }
    else
    {
      v9 = 0;
    }
    goto LABEL_25;
  }
LABEL_26:

  return v9;
}

- (id)enumerateCommand:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  CCDatabaseEnumerationResult *v9;
  id v11;

  v11 = 0;
  v6 = a3;
  -[CCSQLiteDatabase _cachedOrPreparedStatementFromCommand:options:error:](self, "_cachedOrPreparedStatementFromCommand:options:error:", v6, a4, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  v9 = -[CCDatabaseEnumerationResult initWithStatement:database:command:error:]([CCDatabaseEnumerationResult alloc], "initWithStatement:database:command:error:", v7, self, v6, v8);

  return v9;
}

- (BOOL)cleanup:(id *)a3
{
  return -[CCSQLiteDatabase executeCommandString:error:](self, "executeCommandString:error:", CFSTR("VACUUM"), a3);
}

- (int)rowsModified:(id *)a3
{
  sqlite3 *handle;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  handle = self->_handle;
  if (handle)
    return sqlite3_changes(handle);
  v6 = objc_alloc(MEMORY[0x24BDD1540]);
  v9 = *MEMORY[0x24BDD0FC8];
  v10[0] = CFSTR("Invalid sqlite handle.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.CCDatabase"), 6, v7);

  CCSetError(a3, v8);
  return -1;
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  return -[CCSQLiteDatabase executeCommandString:error:](self, "executeCommandString:error:", CFSTR("ROLLBACK TRANSACTION"), a3);
}

- (NSString)path
{
  return self->_path;
}

- (int64_t)accessPermission
{
  return self->_accessPermission;
}

- (int64_t)threadingMode
{
  return self->_threadingMode;
}

- (int)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (int64_t)databaseOptions
{
  return self->_databaseOptions;
}

- (void)initWithPath:(os_log_t)log accessPermission:threadingMode:dataProtectionClass:databaseOptions:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_237B25000, log, OS_LOG_TYPE_ERROR, "Cannot create CCSQLiteDatabase with nil path", v1, 2u);
}

- (void)openWithError:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_237B25000, a3, OS_LOG_TYPE_ERROR, "Failed to enable WAL journal_mode with errorCode: %@, extendedCode: %@", (uint8_t *)&v7, 0x16u);

}

- (void)openWithError:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_237B25000, log, OS_LOG_TYPE_DEBUG, "Try to open a valid SQLite database handle, skipping open.", v1, 2u);
}

@end
