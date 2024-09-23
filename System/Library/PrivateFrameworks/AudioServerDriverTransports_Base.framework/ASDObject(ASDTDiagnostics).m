@implementation ASDObject(ASDTDiagnostics)

+ (void)asdtLogComponents:()ASDTDiagnostics withSeparator:
{
  id v5;
  __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v14 = objc_msgSend(v7, "length");
        if ((unint64_t)(objc_msgSend(v13, "length") + v14) > 0x1DF)
        {
          if (v14 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v21 = v7;
            _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
          }
          objc_msgSend(v7, "setString:", v13);
        }
        else
        {
          if (v14)
            v15 = v6;
          else
            v15 = &stru_250842438;
          objc_msgSend(v7, "appendFormat:", CFSTR("%@%@"), v15, v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "length") && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v7;
    _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

}

- (void)logDiagnostics:()ASDTDiagnostics
{
  __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "diagnosticDescriptionWithIndent:walkTree:", &stru_250842438, 1);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "driverClassName");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("(empty)");
  if (v5)
    v9 = v5;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ Diags\n%@"), v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((a3 & 1) != 0)
  {
    v11 = (void *)MEMORY[0x24BE0A250];
    objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("\n"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "asdtLogComponents:withSeparator:", v12, CFSTR("\n"));

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v10;
    _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

}

- (id)asdtName
{
  void *v2;
  void *v3;
  void *v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "deviceUID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "driverClassName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%p)"), v4, a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

@end
