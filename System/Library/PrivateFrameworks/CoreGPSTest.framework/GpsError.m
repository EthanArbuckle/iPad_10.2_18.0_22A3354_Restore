@implementation GpsError

+ (BOOL)setError:(id *)a3 withCode:(int)a4
{
  return objc_msgSend(a1, "setError:withCode:format:", a3, *(_QWORD *)&a4, 0);
}

+ (BOOL)setError:(id *)a3 withCode:(int)a4 format:(id)a5
{
  id v5;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _BOOL4 v12;
  NSObject *v13;
  const char *v14;
  _QWORD v16[4];
  uint64_t v17;

  v5 = a5;
  v16[3] = *MEMORY[0x24BDAC8D0];
  if (a5)
  {
    v16[0] = &v17;
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", a5, &v17);
    v8 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (uint64_t)v8;
    if (v5)
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDD0FC8]);
  }
  else
  {
    v9 = objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  }
  v10 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GpsFactoryTest"), a4, v9, v16[0]);

  if (a3)
  {
    v11 = *a3;
    *a3 = v10;
    if (!v11)
    {
      LOBYTE(v12) = 1;
      return v12;
    }
    v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v12)
    {
      LODWORD(v16[0]) = 138412290;
      *(_QWORD *)((char *)v16 + 4) = v10;
      v13 = MEMORY[0x24BDACB70];
      v14 = "NSError variable was previously assigned.  New unsaved error: %@";
LABEL_11:
      _os_log_error_impl(&dword_2293C9000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)v16, 0xCu);
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v12)
    {
      LODWORD(v16[0]) = 138412290;
      *(_QWORD *)((char *)v16 + 4) = v10;
      v13 = MEMORY[0x24BDACB70];
      v14 = "NSError variable was nil.  New unsaved error: %@";
      goto LABEL_11;
    }
  }
  return v12;
}

+ (BOOL)setErrorTestUnavailable:(id *)a3
{
  return objc_msgSend(a1, "setError:withCode:format:", a3, 7, CFSTR("Requested test not available on this platform"));
}

@end
