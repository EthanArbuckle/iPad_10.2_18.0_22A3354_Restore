@implementation AMDJSAppStoreEventHandler

+ (id)handleAggregatedAppStoreEvent:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id obj;
  uint64_t v24;
  os_log_t oslog;
  id v27;
  _QWORD v28[8];
  uint64_t v29;
  id v30;
  id v31;
  _QWORD __b[8];
  id v33;
  id v34;
  id v35;
  id v36;
  int v37;
  id v38;
  id v39;
  unsigned int v40;
  id *v41;
  id location[3];
  id v43;
  uint8_t v44[24];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v41 = a4;
  v40 = 0;
  v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v38 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("events"));
  if (v38)
  {
    v36 = (id)objc_msgSend(location[0], "objectForKey:", 0x1EA4BB448);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = v38;
      v34 = 0;
      memset(__b, 0, sizeof(__b));
      obj = v35;
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v46, 16);
      if (v24)
      {
        v20 = *(_QWORD *)__b[2];
        v21 = 0;
        v22 = v24;
        while (1)
        {
          v19 = v21;
          if (*(_QWORD *)__b[2] != v20)
            objc_enumerationMutation(obj);
          v33 = *(id *)(__b[1] + 8 * v21);
          v31 = (id)objc_msgSend(v33, "mutableCopy");
          v30 = (id)objc_msgSend(v31, "objectForKey:", 0x1EA4BB4A8);
          if (v30)
          {
            objc_msgSend(v31, "removeObjectForKey:", 0x1EA4BB4A8);
            memset(v28, 0, sizeof(v28));
            v17 = v30;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", v28, v45, 16);
            if (v18)
            {
              v14 = *(_QWORD *)v28[2];
              v15 = 0;
              v16 = v18;
              while (1)
              {
                v13 = v15;
                if (*(_QWORD *)v28[2] != v14)
                  objc_enumerationMutation(v17);
                v29 = *(_QWORD *)(v28[1] + 8 * v15);
                v27 = (id)objc_msgSend(v31, "mutableCopy");
                objc_msgSend(v27, "setObject:forKey:", v29, 0x1EA4BB4A8);
                v40 += +[AMDAppStoreEvent saveEvent:forUser:error:](AMDAppStoreEvent, "saveEvent:forUser:error:", v27, v36, v41);
                if (*v41 && !v34)
                {
                  v11 = (void *)MEMORY[0x1E0CB3940];
                  v12 = (id)objc_msgSend(*v41, "localizedDescription");
                  v6 = (id)objc_msgSend(v11, "stringWithFormat:", CFSTR("Error saving an event: %@"), v12);
                  v7 = v34;
                  v34 = v6;

                }
                *v41 = 0;
                objc_storeStrong(&v27, 0);
                ++v15;
                if (v13 + 1 >= v16)
                {
                  v15 = 0;
                  v16 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", v28, v45, 16);
                  if (!v16)
                    break;
                }
              }
            }

            v37 = 0;
          }
          else
          {
            if (!v34)
            {
              v4 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Incomplete AppStore event. Timestamps are unavailable"));
              v5 = v34;
              v34 = v4;

            }
            v37 = 3;
          }
          objc_storeStrong(&v30, 0);
          objc_storeStrong(&v31, 0);
          ++v21;
          if (v19 + 1 >= v22)
          {
            v21 = 0;
            v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v46, 16);
            if (!v22)
              break;
          }
        }
      }

      if (v34)
      {
        oslog = (os_log_t)MEMORY[0x1E0C81028];
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v44, (uint64_t)v34);
          _os_log_error_impl(&dword_1DC678000, oslog, OS_LOG_TYPE_ERROR, "%@", v44, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        *v41 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v34);
        v43 = 0;
        v37 = 1;
      }
      else
      {
        v9 = v39;
        v10 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v40);
        objc_msgSend(v9, "setObject:forKey:");

        v43 = v39;
        v37 = 1;
      }
      objc_storeStrong(&v34, 0);
      objc_storeStrong(&v35, 0);
    }
    else
    {
      *v41 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 0, CFSTR("Not a list of AppStore events"));
      v43 = 0;
      v37 = 1;
    }
    objc_storeStrong(&v36, 0);
  }
  else
  {
    *v41 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 0, CFSTR("Array of appstore events is not present."));
    v43 = 0;
    v37 = 1;
  }
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);
  return v43;
}

@end
