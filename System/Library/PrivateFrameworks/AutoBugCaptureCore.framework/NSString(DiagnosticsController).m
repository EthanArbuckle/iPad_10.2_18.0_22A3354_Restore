@implementation NSString(DiagnosticsController)

- (id)maximumLogLevelString:()DiagnosticsController
{
  id v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  NSObject *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a1;
  v6 = v5;
  v7 = v5;
  if (v4)
  {
    v7 = v5;
    if ((objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
    {
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("debug")) & 1) != 0)
      {
        v8 = 4;
      }
      else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("info")) & 1) != 0)
      {
        v8 = 3;
      }
      else if (objc_msgSend(v6, "isEqualToString:", CFSTR("default")))
      {
        v8 = 2;
      }
      else
      {
        v8 = 0;
      }
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("debug")) & 1) != 0)
      {
        v9 = 4;
      }
      else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("info")) & 1) != 0)
      {
        v9 = 3;
      }
      else
      {
        v10 = objc_msgSend(v4, "isEqualToString:", CFSTR("default"));
        v9 = 2;
        if (!v10)
          v9 = 0;
      }
      v7 = v6;
      if (v9 > v8)
      {
        v7 = v4;

      }
    }
  }
  diagcollectLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412290;
    v14 = v7;
    _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_DEBUG, "> Choosing log level: %@", (uint8_t *)&v13, 0xCu);
  }

  return v7;
}

@end
