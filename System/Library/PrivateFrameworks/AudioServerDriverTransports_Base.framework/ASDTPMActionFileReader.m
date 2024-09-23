@implementation ASDTPMActionFileReader

- (ASDTPMActionFileReader)initWithConfig:(id)a3 forSequencer:(id)a4
{
  id v6;
  ASDTPMActionFileReader *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ASDTPMActionFileReader *v12;
  objc_class *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ASDTPMActionFileReader;
  v7 = -[ASDTPMAction initWithConfig:forSequencer:](&v27, sel_initWithConfig_forSequencer_, v6, a4);
  if (!v7)
    goto LABEL_5;
  objc_msgSend(v6, "asdtFilePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTPMActionFileReader setFilePath:](v7, "setFilePath:", v8);

  -[ASDTPMActionFileReader filePath](v7, "filePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_3;
  v13 = (objc_class *)objc_msgSend(v6, "asdtBundleClass");
  objc_msgSend(v6, "asdtBundlePath");
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asdtBundleResource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asdtBundleExtension");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asdtBundleSubdir");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && (unint64_t)v13 | v14)
  {
    if (v13)
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", v13);
    else
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v18;
    if (v18)
    {
      if (v17)
        objc_msgSend(v18, "pathForResource:ofType:inDirectory:", v15, v16, v17);
      else
        objc_msgSend(v18, "pathForResource:ofType:", v15, v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDTPMActionFileReader setFilePath:](v7, "setFilePath:", v23);

      -[ASDTPMActionFileReader filePath](v7, "filePath");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v19 = 0;
LABEL_29:

        goto LABEL_30;
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
LABEL_28:
        v19 = 1;
        goto LABEL_29;
      }
      -[ASDTPMDevice name](v7, "name");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bundlePath");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v29 = v26;
      v30 = 2112;
      v31 = v15;
      v32 = 2112;
      v33 = v16;
      v34 = 2112;
      v35 = v17;
      v36 = 2112;
      v37 = v21;
      _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Could not generate path for bundle resource '%@', type '%@', subdir '%@'. Bundle path: %@", buf, 0x34u);

    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      -[ASDTPMDevice name](v7, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)v14;
      if (v13)
      {
        NSStringFromClass(v13);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412546;
      v29 = v21;
      v30 = 2112;
      v31 = v22;
      _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Bundle not found for %@", buf, 0x16u);
      if (v13)

    }
    goto LABEL_28;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[ASDTPMActionFileReader initWithConfig:forSequencer:].cold.2(v7);
  v19 = 1;
LABEL_30:

  if (v19)
  {
LABEL_31:
    v12 = 0;
    goto LABEL_32;
  }
LABEL_3:
  objc_msgSend(v6, "asdtPropertyAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTPMActionFileReader setPropertyAddress:](v7, "setPropertyAddress:", v10);

  -[ASDTPMActionFileReader propertyAddress](v7, "propertyAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTPMActionFileReader initWithConfig:forSequencer:].cold.1(v7);
    goto LABEL_31;
  }
  -[ASDTPMActionFileReader setPropertyDataType:](v7, "setPropertyDataType:", objc_msgSend(v6, "asdtPropertyIsPList"));
LABEL_5:
  v12 = v7;
LABEL_32:

  return v12;
}

- (id)convert:(id)a3
{
  return a3;
}

- (int)action
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void **v9;
  int v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;

  v3 = (void *)MEMORY[0x24BDBCE50];
  -[ASDTPMActionFileReader filePath](self, "filePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v3, "dataWithContentsOfFile:options:error:", v4, 2, &v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v21;

  if (v5)
  {
    -[ASDTPMActionFileReader convert:](self, "convert:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    if (-[ASDTPMActionFileReader propertyDataType](self, "propertyDataType") == 1886155636)
    {
      v20 = v7;
      v8 = 8;
      v9 = &v20;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = objc_retainAutorelease(v7);
        v9 = (void **)objc_msgSend(v11, "bytes");
        v8 = objc_msgSend(v11, "length");

      }
      else
      {
        v9 = 0;
        v8 = 0;
      }
    }
    -[ASDTPMActionFileReader propertyAddress](self, "propertyAddress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v12, "audioObjectPropertyAddress");
    LODWORD(v19) = v13;

    -[ASDTPMDevice parentSequencer](self, "parentSequencer", v18, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "parentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "setProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:", &v18, 0, 0, v8, v9, 0);

    if (v16)
      v10 = 0;
    else
      v10 = 2003329396;

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTPMActionFileReader action].cold.1(self, v6);
    v10 = objc_msgSend(v6, "code");
  }

  return v10;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_filePath, a3);
}

- (ASDPropertyAddress)propertyAddress
{
  return self->_propertyAddress;
}

- (void)setPropertyAddress:(id)a3
{
  objc_storeStrong((id *)&self->_propertyAddress, a3);
}

- (unsigned)propertyDataType
{
  return self->_propertyDataType;
}

- (void)setPropertyDataType:(unsigned int)a3
{
  self->_propertyDataType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyAddress, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

- (void)initWithConfig:(void *)a1 forSequencer:.cold.1(void *a1)
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138412290;
  v3 = v1;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Property address missing or invalid.", (uint8_t *)&v2, 0xCu);

}

- (void)initWithConfig:(void *)a1 forSequencer:.cold.2(void *a1)
{
  void *v1;
  int v2;
  void *v3;
  __int16 v4;
  const __CFString *v5;
  __int16 v6;
  const __CFString *v7;
  __int16 v8;
  const __CFString *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138413314;
  v3 = v1;
  v4 = 2112;
  v5 = CFSTR("FilePath");
  v6 = 2112;
  v7 = CFSTR("BundleClass");
  v8 = 2112;
  v9 = CFSTR("BundlePath");
  v10 = 2112;
  v11 = CFSTR("BundleRes");
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Missing or invalid keys: %@ or %@ or %@ or %@", (uint8_t *)&v2, 0x34u);

}

- (void)action
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Failed reading file with path '%@': %@", (uint8_t *)&v7, 0x20u);

}

@end
