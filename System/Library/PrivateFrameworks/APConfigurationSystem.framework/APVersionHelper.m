@implementation APVersionHelper

+ (id)versionNumberFromJSONFileAtPath:(id)a3
{
  const char *v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];

  objc_msgSend_dataWithContentsOfFile_(MEMORY[0x24BDBCE50], a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x24BDD1608], v3, (uint64_t)v4, 0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v7 = v5;
    if (v5)
    {
      objc_msgSend_objectForKey_(v5, v6, (uint64_t)CFSTR("version"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v9 = v8;
        v10 = v9;
      }
      else
      {
        APLogForCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_235C39000, v11, OS_LOG_TYPE_ERROR, "Error Unable to get version from bundle.", v13, 2u);
        }

        v10 = 0;
      }
    }
    else
    {
      APLogForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_235C39000, v9, OS_LOG_TYPE_ERROR, "Error Unable to get dictionary from JSON.", v14, 2u);
      }
      v10 = 0;
    }

  }
  else
  {
    APLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235C39000, v7, OS_LOG_TYPE_ERROR, "Error getting data for JSON", buf, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (APVersionHelper)initWithDatasource:(id)a3
{
  id v5;
  APVersionHelper *v6;
  APVersionHelper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APVersionHelper;
  v6 = -[APVersionHelper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_datasource, a3);

  return v7;
}

- (int64_t)systemVersion
{
  uint64_t v2;
  void *v4;
  const char *v5;
  int64_t VersionForNodesAtDirectoryPath;

  objc_msgSend_configSystemDirectoryPath(APConfigurationMediator, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  VersionForNodesAtDirectoryPath = objc_msgSend__getVersionForNodesAtDirectoryPath_(self, v5, (uint64_t)v4);

  return VersionForNodesAtDirectoryPath;
}

- (int64_t)_getVersionForNodesAtDirectoryPath:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  int64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 buf;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21[3];

  v21[2] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v18 = 0x3042000000;
    v19 = sub_235C3FA1C;
    v20 = sub_235C3FA28;
    v21[0] = 0;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = sub_235C3FA30;
    v12[3] = &unk_2506FE5B8;
    v12[4] = self;
    v12[5] = &v13;
    v12[6] = &buf;
    v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x23B7DC0EC](v12);
    objc_storeWeak((id *)(*((_QWORD *)&buf + 1) + 40), v7);
    ((void (**)(_QWORD, void *))v7)[2](v7, v6);
    v8 = v14[3];

    _Block_object_dispose(&buf, 8);
    objc_destroyWeak(v21);
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    APLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138477827;
      *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
      v10 = *(id *)((char *)&buf + 4);
      _os_log_impl(&dword_235C39000, v9, OS_LOG_TYPE_ERROR, "[%{private}@] Error: Unable to create URL from directory path.", (uint8_t *)&buf, 0xCu);

    }
    v8 = 0;
  }

  return v8;
}

- (id)_versionInDirectoryWithURLs:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const char *v13;
  char isEqualToString;
  void *v15;
  void *v16;
  const char *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = a3;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v19, v23, 16);
  if (v5)
  {
    v8 = v5;
    v9 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend_pathExtension(v11, v6, v7, (_QWORD)v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v12, v13, (uint64_t)CFSTR("json"));

        if ((isEqualToString & 1) != 0)
        {
          objc_msgSend_path(v11, v6, v7);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_versionNumberFromJSONFileAtPath_(APVersionHelper, v17, (uint64_t)v16);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v19, v23, 16);
      if (v8)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (APVersionDatasource)datasource
{
  return self->_datasource;
}

- (void)setDatasource:(id)a3
{
  objc_storeStrong((id *)&self->_datasource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datasource, 0);
}

@end
