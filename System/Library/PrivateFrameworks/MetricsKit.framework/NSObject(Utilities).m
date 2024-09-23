@implementation NSObject(Utilities)

- (id)mt_nullableValueForKeyPath:()Utilities
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "valueForKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)mt_nullableValueForKeyPathArray:()Utilities index:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t i;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a1;
  if (v7)
  {
    do
    {
      if (a4 >= objc_msgSend(v6, "count"))
        break;
      objc_msgSend(v6, "objectAtIndexedSubscript:", a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "hasSuffix:", CFSTR("]")))
      {
        v9 = objc_msgSend(v8, "rangeOfString:", CFSTR("["));
        if (v9 == 0x7FFFFFFFFFFFFFFFLL)
        {
          MTMetricsKitOSLog();
          v15 = objc_claimAutoreleasedReturnValue();
          v23 = v15;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v31 = v8;
            _os_log_impl(&dword_20D758000, v15, OS_LOG_TYPE_ERROR, "MetricsKit: Invalid keypath %@", buf, 0xCu);
          }
          v14 = 0;
          goto LABEL_29;
        }
        objc_msgSend(v8, "substringToIndex:", v9);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "substringWithRange:", v9 + 1, objc_msgSend(v8, "length") - v9 - 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "valueForKeyPath:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v14 = 0;
          goto LABEL_28;
        }
        if (!objc_msgSend(v24, "length"))
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          v16 = v25;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
          if (v17)
          {
            v18 = *(_QWORD *)v27;
            v19 = a4 + 1;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v27 != v18)
                  objc_enumerationMutation(v16);
                objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "mt_nullableValueForKeyPathArray:index:", v6, v19);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (v21)
                  objc_msgSend(v14, "addObject:", v21);

              }
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
            }
            while (v17);
          }

LABEL_28:
LABEL_29:

          v13 = v7;
          goto LABEL_30;
        }
        v10 = objc_msgSend(v24, "integerValue");
        if ((v10 & 0x8000000000000000) == 0 && v10 < objc_msgSend(v25, "count"))
        {
          objc_msgSend(v25, "objectAtIndexedSubscript:", v10);
          v11 = objc_claimAutoreleasedReturnValue();

          v7 = (id)v11;
        }

        v12 = (uint64_t)v7;
        v7 = v23;
      }
      else
      {
        objc_msgSend(v7, "valueForKeyPath:", v8);
        v12 = objc_claimAutoreleasedReturnValue();
      }

      ++a4;
      v7 = (id)v12;
    }
    while (v12);
  }
  v13 = v7;
  v14 = v13;
LABEL_30:

  return v14;
}

- (id)mt_nullableValueForKeyPathExt:()Utilities
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mt_nullableValueForKeyPathArray:index:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)mt_nullableValueForKey:()Utilities
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
