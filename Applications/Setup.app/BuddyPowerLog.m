@implementation BuddyPowerLog

+ (BOOL)removeLog
{
  uint64_t v2;
  NSFileManager *v3;
  NSArray *v4;
  uint64_t v5;
  NSString *v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t i;
  NSFileManager *v11;
  unsigned __int8 v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  NSString *v16;
  char v18;
  NSString *v19;
  char v20;
  id v21;
  os_log_t oslog;
  id obj;
  id v24;
  _QWORD __b[8];
  uint64_t v26;
  int v27;
  char v28;
  NSString *v29;
  char v30;
  id v31;
  os_log_type_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  os_log_type_t v38;
  id location;
  uint64_t v40;
  uint64_t v41[3];
  char v42;
  uint8_t v43[32];
  uint8_t v44[128];
  uint8_t v45[16];
  uint8_t buf[24];

  v41[2] = (uint64_t)a1;
  v41[1] = (uint64_t)a2;
  v41[0] = 1;
  v2 = container_system_group_path_for_identifier(0, "systemgroup.com.apple.powerlog", v41);
  v40 = v2;
  if (v41[0] == 1)
  {
    v37 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v40);
    v36 = 0;
    v3 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
    v34 = 0;
    v4 = -[NSFileManager contentsOfDirectoryAtPath:error:](v3, "contentsOfDirectoryAtPath:error:", v37, &v34);
    objc_storeStrong(&v36, v34);
    v35 = v4;

    if (v36)
    {
      v33 = (id)_BYLoggingFacility(v5);
      v32 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
      {
        v30 = 0;
        v28 = 0;
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v6 = (NSString *)v36;
        }
        else if (v36)
        {
          v31 = objc_msgSend(v36, "domain");
          v30 = 1;
          v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v31, objc_msgSend(v36, "code"));
          v29 = v6;
          v28 = 1;
        }
        else
        {
          v6 = 0;
        }
        sub_100039500((uint64_t)v45, (uint64_t)v6);
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v33, v32, "Failed to find contents of power log path: %{public}@", v45, 0xCu);
        if ((v28 & 1) != 0)

        if ((v30 & 1) != 0)
      }
      objc_storeStrong(&v33, 0);
      v42 = 0;
      v27 = 1;
    }
    else
    {
      memset(__b, 0, sizeof(__b));
      v7 = v35;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", __b, v44, 16);
      if (v8)
      {
        v9 = *(_QWORD *)__b[2];
        do
        {
          for (i = 0; i < (unint64_t)v8; ++i)
          {
            if (*(_QWORD *)__b[2] != v9)
              objc_enumerationMutation(v7);
            v26 = *(_QWORD *)(__b[1] + 8 * i);
            v24 = objc_msgSend(v37, "stringByAppendingPathComponent:", v26);
            v11 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
            obj = v36;
            v12 = -[NSFileManager removeItemAtPath:error:](v11, "removeItemAtPath:error:", v24, &obj);
            objc_storeStrong(&v36, obj);

            if (((v12 ^ 1) & 1) != 0)
            {
              oslog = (os_log_t)(id)_BYLoggingFacility(v13);
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
              {
                v14 = oslog;
                v15 = v24;
                v20 = 0;
                v18 = 0;
                if ((_BYIsInternalInstall() & 1) != 0)
                {
                  v16 = (NSString *)v36;
                }
                else if (v36)
                {
                  v21 = objc_msgSend(v36, "domain");
                  v20 = 1;
                  v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v21, objc_msgSend(v36, "code"));
                  v19 = v16;
                  v18 = 1;
                }
                else
                {
                  v16 = 0;
                }
                sub_1000C3528((uint64_t)v43, (uint64_t)v15, (uint64_t)v16);
                _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to remove power log item at path %@: %{public}@", v43, 0x16u);
                if ((v18 & 1) != 0)

                if ((v20 & 1) != 0)
              }
              objc_storeStrong((id *)&oslog, 0);
            }
            objc_storeStrong(&v24, 0);
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", __b, v44, 16);
        }
        while (v8);
      }

      v42 = 1;
      v27 = 1;
    }
    objc_storeStrong(&v35, 0);
    objc_storeStrong(&v36, 0);
    objc_storeStrong(&v37, 0);
  }
  else
  {
    location = (id)_BYLoggingFacility(v2);
    v38 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      sub_1000342B4((uint64_t)buf, v41[0]);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)location, v38, "Failed to determine container path for power log: %llu", buf, 0xCu);
    }
    objc_storeStrong(&location, 0);
    v42 = 0;
  }
  return v42 & 1;
}

@end
