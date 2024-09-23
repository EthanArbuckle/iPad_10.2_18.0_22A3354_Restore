@implementation LogForCategory

void __LogForCategory_block_invoke(id a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id obj;
  id v8;
  os_log_t v9;
  _QWORD __b[8];
  id v11;
  id v12[3];
  _BYTE v13[128];
  _QWORD v14[10];

  v12[2] = a1;
  v12[1] = a1;
  v1 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:");
  v2 = (void *)gLogsDict;
  gLogsDict = (uint64_t)v1;

  v14[0] = CFSTR("FontServices");
  v14[1] = CFSTR("UserFontManager");
  v14[2] = CFSTR("FSUserFontManager");
  v14[3] = CFSTR("FontProvider");
  v14[4] = CFSTR("FontProviderManager");
  v14[5] = CFSTR("FontProviderLoader");
  v14[6] = CFSTR("fontservicesd");
  v14[7] = CFSTR("ServicesDaemonManager");
  v14[8] = CFSTR("FontPickerSupport");
  v14[9] = CFSTR("FontInstallViewService");
  v12[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 10);
  memset(__b, 0, sizeof(__b));
  obj = v12[0];
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v13, 16);
  if (v8)
  {
    v4 = *(_QWORD *)__b[2];
    v5 = 0;
    v6 = v8;
    while (1)
    {
      v3 = v5;
      if (*(_QWORD *)__b[2] != v4)
        objc_enumerationMutation(obj);
      v11 = *(id *)(__b[1] + 8 * v5);
      v9 = os_log_create("com.apple.FontServices", (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"));
      objc_msgSend((id)gLogsDict, "setObject:forKey:", v9, v11);
      objc_storeStrong((id *)&v9, 0);
      ++v5;
      if (v3 + 1 >= (unint64_t)v6)
      {
        v5 = 0;
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v13, 16);
        if (!v6)
          break;
      }
    }
  }

  objc_storeStrong(v12, 0);
}

@end
