@implementation ACUIPluginLoader

+ (id)pluginBundleWithName:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id obj;
  uint64_t v16;
  os_log_t v17;
  os_log_type_t v18;
  os_log_t v19;
  char v20;
  os_log_type_t v21;
  os_log_t oslog;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD __b[8];
  id v29;
  id v30;
  id v31;
  int v32;
  os_log_type_t type;
  id v34;
  id v35;
  id v36;
  id location[3];
  id v38;
  uint8_t v39[32];
  uint8_t v40[32];
  uint8_t v41[48];
  _BYTE v42[128];
  uint8_t v43[24];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v36 = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v35 = (id)objc_msgSend(v36, "URLsForDirectory:inDomains:", 5, 8);
  if (v35 && objc_msgSend(v35, "count"))
  {
    v31 = 0;
    v30 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PreferenceBundles/AccountSettings/%@"), location[0]);
    memset(__b, 0, sizeof(__b));
    obj = v35;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v42, 16);
    if (v16)
    {
      v12 = *(_QWORD *)__b[2];
      v13 = 0;
      v14 = v16;
      while (1)
      {
        v11 = v13;
        if (*(_QWORD *)__b[2] != v12)
          objc_enumerationMutation(obj);
        v29 = *(id *)(__b[1] + 8 * v13);
        v27 = (id)objc_msgSend(v29, "URLByAppendingPathComponent:", v30);
        v26 = 0;
        v25 = 0;
        v24 = 0;
        v3 = *MEMORY[0x1E0C999D0];
        v23 = 0;
        v10 = objc_msgSend(v27, "getResourceValue:forKey:error:", &v24, v3, &v23);
        objc_storeStrong(&v26, v24);
        objc_storeStrong(&v25, v23);
        if ((v10 & 1) != 0)
        {
          v20 = 0;
          v20 = objc_msgSend(v26, "BOOLValue") & 1;
          if (v20)
          {
            v4 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v27);
            v5 = v31;
            v31 = v4;

            v32 = v31 ? 2 : 0;
          }
          else
          {
            v19 = (os_log_t)_ACUILogSystem();
            v18 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              v7 = v19;
              __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v40, (uint64_t)"+[ACUIPluginLoader pluginBundleWithName:]", 56, (uint64_t)v27);
              _os_log_debug_impl(&dword_1D573D000, v7, v18, "%s (%d) \"Skipping file at %@ because it isn't a directory\", v40, 0x1Cu);
            }
            objc_storeStrong((id *)&v19, 0);
            v32 = 3;
          }
        }
        else
        {
          oslog = (os_log_t)_ACUILogSystem();
          v21 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            v8 = oslog;
            v9 = v21;
            __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v41, (uint64_t)"+[ACUIPluginLoader pluginBundleWithName:]", 39, (uint64_t)v27, (uint64_t)v25);
            _os_log_error_impl(&dword_1D573D000, v8, v9, "%s (%d) \"Couldn't get value for the directory at %@: %@\", v41, 0x26u);
          }
          objc_storeStrong((id *)&oslog, 0);
          v32 = 3;
        }
        objc_storeStrong(&v25, 0);
        objc_storeStrong(&v26, 0);
        objc_storeStrong(&v27, 0);
        if (v32)
        {
          if (v32 != 3)
            break;
        }
        ++v13;
        if (v11 + 1 >= v14)
        {
          v13 = 0;
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v42, 16);
          if (!v14)
            goto LABEL_25;
        }
      }
    }
    else
    {
LABEL_25:
      v32 = 0;
    }

    if (!v31)
    {
      v17 = (os_log_t)_ACUILogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v39, (uint64_t)"+[ACUIPluginLoader pluginBundleWithName:]", 67, (uint64_t)location[0]);
        _os_log_impl(&dword_1D573D000, v17, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Couldn't find plugin for %@\", v39, 0x1Cu);
      }
      objc_storeStrong((id *)&v17, 0);
    }
    v38 = v31;
    v32 = 1;
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v31, 0);
  }
  else
  {
    v34 = _ACUILogSystem();
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v43, (uint64_t)"+[ACUIPluginLoader pluginBundleWithName:]", 27);
      _os_log_error_impl(&dword_1D573D000, (os_log_t)v34, type, "%s (%d) \"Couldn't find the system library directory to search for plugins.\", v43, 0x12u);
    }
    objc_storeStrong(&v34, 0);
    v38 = 0;
    v32 = 1;
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
  return v38;
}

@end
