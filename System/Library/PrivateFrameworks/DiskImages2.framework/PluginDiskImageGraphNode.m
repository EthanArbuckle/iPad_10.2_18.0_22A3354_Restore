@implementation PluginDiskImageGraphNode

+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4
{
  void *v6;
  BOOL v7;
  void *v8;
  objc_super v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___PluginDiskImageGraphNode;
  if (objc_msgSendSuper2(&v10, sel_validateWithDictionary_error_, v6, a4))
  {
    v7 = 0;
    if (objc_msgSend(v6, "validateAndPopObjectForKey:className:isOptional:error:", CFSTR("PluginName"), objc_opt_class(), 0, a4))
    {
      v7 = 0;
      if (objc_msgSend(v6, "validateAndPopObjectForKey:className:isOptional:error:", CFSTR("PluginParams"), objc_opt_class(), 0, a4))
      {
        if (objc_msgSend(v6, "count"))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Validation failed, input contains unexpected data."));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, v8, a4);

        }
        else
        {
          v7 = 1;
        }
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PluginDiskImageGraphNode)initWithPluginName:(id)a3 pluginParams:(id)a4 tag:(id)a5 UUID:(id)a6 parentNode:(id)a7 metadata:(id)a8 isCache:(BOOL)a9
{
  id v16;
  id v17;
  PluginDiskImageGraphNode *v18;
  PluginDiskImageGraphNode *v19;
  uint64_t v20;
  NSDictionary *pluginParams;
  objc_super v23;

  v16 = a3;
  v17 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PluginDiskImageGraphNode;
  v18 = -[DiskImageGraphNode initWithTag:UUID:parentNode:metadata:isCache:](&v23, sel_initWithTag_UUID_parentNode_metadata_isCache_, a5, a6, a7, a8, a9);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_pluginName, a3);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:copyItems:", v17, 1);
    pluginParams = v19->_pluginParams;
    v19->_pluginParams = (NSDictionary *)v20;

  }
  return v19;
}

- (PluginDiskImageGraphNode)initWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  PluginDiskImageGraphNode *v12;
  uint64_t v13;
  NSString *pluginName;
  uint64_t v15;
  NSDictionary *pluginParams;
  PluginDiskImageGraphNode *v17;
  objc_super v19;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  if (+[PluginDiskImageGraphNode validateWithDictionary:error:](PluginDiskImageGraphNode, "validateWithDictionary:error:", v10, a6))
  {
    v19.receiver = self;
    v19.super_class = (Class)PluginDiskImageGraphNode;
    v12 = -[DiskImageGraphNode initWithDictionary:updateChangesToDict:workDir:error:](&v19, sel_initWithDictionary_updateChangesToDict_workDir_error_, v10, v8, v11, a6);
    if (v12)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PluginName"));
      v13 = objc_claimAutoreleasedReturnValue();
      pluginName = v12->_pluginName;
      v12->_pluginName = (NSString *)v13;

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PluginParams"));
      v15 = objc_claimAutoreleasedReturnValue();
      pluginParams = v12->_pluginParams;
      v12->_pluginParams = (NSDictionary *)v15;

    }
    self = v12;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)deleteImage
{
  return 1;
}

- (id)toDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PluginDiskImageGraphNode;
  -[DiskImageGraphNode toDictionary](&v8, sel_toDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[PluginDiskImageGraphNode pluginName](self, "pluginName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("PluginName"));

  -[PluginDiskImageGraphNode pluginParams](self, "pluginParams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("PluginParams"));

  return v4;
}

- (id)URL
{
  void *v3;
  void *v4;
  id v5;

  -[PluginDiskImageGraphNode pluginName](self, "pluginName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PluginDiskImageGraphNode pluginParams](self, "pluginParams");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[DIURL newDIURLWithPluginName:params:](DIURL, "newDIURLWithPluginName:params:", v3, v4);

  return v5;
}

- (NSString)pluginName
{
  return self->_pluginName;
}

- (void)setPluginName:(id)a3
{
  objc_storeStrong((id *)&self->_pluginName, a3);
}

- (NSDictionary)pluginParams
{
  return self->_pluginParams;
}

- (void)setPluginParams:(id)a3
{
  objc_storeStrong((id *)&self->_pluginParams, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginParams, 0);
  objc_storeStrong((id *)&self->_pluginName, 0);
}

- (BOOL)validateAppendedImageWithInfo:(id)a3 error:(id *)a4
{
  int v4;
  NSObject *v5;
  char *v6;
  NSObject *v7;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v5 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    v10 = 72;
    v11 = 2080;
    v12 = "-[PluginDiskImageGraphNode(Append) validateAppendedImageWithInfo:error:]";
    v6 = (char *)_os_log_send_and_compose_impl();

    if (v6)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v6);
      free(v6);
    }
  }
  else
  {
    getDIOSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      v10 = 72;
      v11 = 2080;
      v12 = "-[PluginDiskImageGraphNode(Append) validateAppendedImageWithInfo:error:]";
      _os_log_impl(&dword_212EB0000, v7, OS_LOG_TYPE_DEFAULT, "%.*s: Appending to plugin node, skipping validation.", buf, 0x12u);
    }

  }
  *__error() = v4;
  return 1;
}

@end
