@implementation _KSControlFileController

- (_KSControlFileController)initWithName:(id)a3 inDirectory:(id)a4
{
  id v6;
  id v7;
  _KSControlFileController *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSURL *url;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_KSControlFileController;
  v8 = -[_KSControlFileController init](&v15, sel_init);
  if (v8)
  {
    v9 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(".ctrl"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileURLWithPath:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    url = v8->_url;
    v8->_url = (NSURL *)v12;

  }
  return v8;
}

- (BOOL)checkIfExists
{
  NSURL *url;
  _BOOL4 v4;
  id v5;
  BOOL v6;
  id v8;

  if (!-[NSURL checkResourceIsReachableAndReturnError:](self->_url, "checkResourceIsReachableAndReturnError:", 0))
    return 0;
  url = self->_url;
  v8 = 0;
  v4 = -[NSURL getResourceValue:forKey:error:](url, "getResourceValue:forKey:error:", &v8, *MEMORY[0x24BDBCC68], 0);
  v5 = v8;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (objc_msgSend(v5, "BOOLValue") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[_KSControlFileController reset](self, "reset");
    v6 = 0;
  }

  return v6;
}

- (void)reset
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21DFEB000, v0, v1, "%s  Failed to delete %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

- (id)contents
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", self->_url);
}

- (void)setContents:(id)a3
{
  id v4;
  int v5;
  int v6;
  id v7;
  NSURL *url;
  uint64_t v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  id v13;

  v4 = a3;
  v5 = open(-[NSURL fileSystemRepresentation](self->_url, "fileSystemRepresentation"), 1573, 384);
  if (v5 < 0)
  {
    KSCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[_KSControlFileController setContents:].cold.1();
  }
  else
  {
    v6 = v5;
    if (v4)
    {
      v7 = objc_retainAutorelease(v4);
      write(v6, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
    }
    close(v6);
    url = self->_url;
    v9 = *MEMORY[0x24BDBCC68];
    v13 = 0;
    v10 = -[NSURL setResourceValue:forKey:error:](url, "setResourceValue:forKey:error:", MEMORY[0x24BDBD1C8], v9, &v13);
    v11 = v13;
    if (!v10)
    {
      KSCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[_KSControlFileController setContents:].cold.2();

      -[_KSControlFileController reset](self, "reset");
    }
  }

}

- (id)description
{
  NSURL *url;
  uint64_t v4;
  BOOL v5;
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  id v14;
  id v15;

  if (-[NSURL checkResourceIsReachableAndReturnError:](self->_url, "checkResourceIsReachableAndReturnError:", 0))
  {
    url = self->_url;
    v15 = 0;
    v4 = *MEMORY[0x24BDBCC68];
    v14 = 0;
    v5 = -[NSURL getResourceValue:forKey:error:](url, "getResourceValue:forKey:error:", &v15, v4, &v14);
    v6 = v15;
    v7 = v14;
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v6, "BOOLValue"))
          v8 = CFSTR("Present");
        else
          v8 = CFSTR("Error: wrong tag value");
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error: bad tag '%@'"), v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error: not tagged (%@)"), v7);
    }
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_11:

    goto LABEL_12;
  }
  v8 = CFSTR("Absent");
LABEL_12:
  v9 = (void *)MEMORY[0x24BDD17C8];
  v13.receiver = self;
  v13.super_class = (Class)_KSControlFileController;
  -[_KSControlFileController description](&v13, sel_description);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@; %@: %@>"), v10, self->_url, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)setContents:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21DFEB000, v0, v1, "%s  Failed to create %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)setContents:.cold.2()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_1_0();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl(&dword_21DFEB000, v2, OS_LOG_TYPE_ERROR, "%s  Failed to mark %@ as non-backup: %@", (uint8_t *)v3, 0x20u);
}

@end
