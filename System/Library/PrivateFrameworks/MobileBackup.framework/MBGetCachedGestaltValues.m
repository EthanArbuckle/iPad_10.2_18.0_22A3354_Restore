@implementation MBGetCachedGestaltValues

uint64_t ___MBGetCachedGestaltValues_block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[8];
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v0 = MBGetDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5213000, v0, OS_LOG_TYPE_DEBUG, "Loading cached MobileGestalt values", buf, 2u);
    _MBLog(CFSTR("DEBUG"), (uint64_t)"Loading cached MobileGestalt values", v1, v2, v3, v4, v5, v6, v14);
  }
  _MBCachedGestaltValues = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  *(_QWORD *)buf = CFSTR("DeviceClass");
  v21 = CFSTR("UniqueDeviceID");
  v22 = CFSTR("SerialNumber");
  v23 = CFSTR("ProductType");
  v24 = CFSTR("BuildVersion");
  v25 = CFSTR("ProductVersion");
  v26 = CFSTR("DeviceColor");
  v27 = CFSTR("DeviceEnclosureColor");
  v28 = CFSTR("9N7qIucqhr0Cy2/Tk27/hw");
  v29 = CFSTR("NJsxTSI2WuD+13rxShXX9w");
  v30 = CFSTR("CJcvxERO5v/3IWjDFKZKRw");
  v31 = CFSTR("HWModelStr");
  v32 = CFSTR("marketing-name");
  v33 = CFSTR("ReleaseType");
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 14);
  result = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (result)
  {
    v9 = result;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
        v13 = MBGetGestaltValueForKey();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = (void *)objc_msgSend(v13, "stringValue");
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_13;
        }
        if (v13)
        {
          objc_msgSend((id)_MBCachedGestaltValues, "setObject:forKeyedSubscript:", v13, v12);
          goto LABEL_14;
        }
LABEL_13:
        *(_QWORD *)buf = CFSTR("DeviceColor");
        v21 = CFSTR("DeviceEnclosureColor");
        v22 = CFSTR("marketing-name");
        v23 = CFSTR("ReleaseType");
        if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 4), "containsObject:", v12) & 1) == 0)objc_exception_throw(-[MBException initWithCode:format:]([MBException alloc], "initWithCode:format:", 1, CFSTR("Error getting %@ from MobileGestalt"), v12));
LABEL_14:
        ++v11;
      }
      while (v9 != v11);
      result = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v9 = result;
    }
    while (result);
  }
  return result;
}

@end
