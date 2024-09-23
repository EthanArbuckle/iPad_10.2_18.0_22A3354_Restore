@implementation SSUXPCUtils

+ (BOOL)isPlaceholder:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "extractUserInfo:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = xpc_dictionary_get_BOOL(v3, "isPlaceholder");
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "+[SSUXPCUtils isPlaceholder:]";
      _os_log_error_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: Received XPC event missing user info", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

+ (id)extractSingleBundleId:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  size_t count;
  NSObject *v8;
  __int128 v9;
  size_t v10;
  const char *string;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  __int128 v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "extractUserInfo:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    xpc_dictionary_get_array(v3, "bundleIDs");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      count = xpc_array_get_count(v5);
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", count);
      v8 = objc_claimAutoreleasedReturnValue();
      if (count)
      {
        v10 = 0;
        *(_QWORD *)&v9 = 136315138;
        v17 = v9;
        do
        {
          string = xpc_array_get_string(v6, v10);
          if (string)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
            v12 = objc_claimAutoreleasedReturnValue();
            -[NSObject addObject:](v8, "addObject:", v12);
          }
          else
          {
            CDMOSLoggerForCategory(0);
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v17;
              v19 = "+[SSUXPCUtils extractSingleBundleId:]";
              _os_log_error_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: Encountered non-string bundle ID. Skipping.", buf, 0xCu);
            }
          }

          ++v10;
        }
        while (count != v10);
      }
      if (-[NSObject count](v8, "count", v17))
      {
        if ((unint64_t)-[NSObject count](v8, "count") >= 2)
        {
          CDMOSLoggerForCategory(0);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v19 = "+[SSUXPCUtils extractSingleBundleId:]";
            _os_log_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_INFO, "%s [WARN]: Received list of bundle IDs of size greater than 1. Continuing using the first one.", buf, 0xCu);
          }

        }
        -[NSObject firstObject](v8, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      }
      CDMOSLoggerForCategory(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "+[SSUXPCUtils extractSingleBundleId:]";
        _os_log_error_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_ERROR, "%s [ERR]: Received empty list of bundle IDs. Aborting app registration handling.", buf, 0xCu);
      }

    }
    else
    {
      CDMOSLoggerForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "+[SSUXPCUtils extractSingleBundleId:]";
        _os_log_error_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_ERROR, "%s [ERR]: Received XPC event missing bundle IDs", buf, 0xCu);
      }
    }
    v14 = 0;
LABEL_25:

    goto LABEL_26;
  }
  CDMOSLoggerForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "+[SSUXPCUtils extractSingleBundleId:]";
    _os_log_error_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: Received XPC event missing user info", buf, 0xCu);
  }
  v14 = 0;
LABEL_26:

  return v14;
}

+ (void)dispatchAsyncWithTransaction:(id)a3 block:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a4;
  v6 = a3;
  v7 = (void *)os_transaction_create();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__SSUXPCUtils_dispatchAsyncWithTransaction_block___block_invoke;
  v10[3] = &unk_24DCAC4A0;
  v11 = v7;
  v12 = v5;
  v8 = v7;
  v9 = v5;
  dispatch_async(v6, v10);

}

+ (id)extractUserInfo:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (MEMORY[0x220744C98]() == MEMORY[0x24BDACFA0])
  {
    xpc_dictionary_get_dictionary(v3, "UserInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315138;
      v8 = "+[SSUXPCUtils extractUserInfo:]";
      _os_log_error_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_ERROR, "%s [ERR]: Received XPC event of non-dictionary type", (uint8_t *)&v7, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

uint64_t __50__SSUXPCUtils_dispatchAsyncWithTransaction_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
