@implementation FSFStreamRegistry

+ (id)registryFilePath
{
  void *v2;
  void *v3;

  +[FSFUtils getBaseLocalPath](FSFUtils, "getBaseLocalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("/schema_registry.json"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)registerForStream:(id)a3 withSchema:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  +[FSFStreamRegistry readFileInToDict](FSFStreamRegistry, "readFileInToDict");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v8, "addEntriesFromDictionary:", v9);
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v12);

  }
  objc_msgSend(v7, "schemaData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v13);

  objc_msgSend(v8, "setObject:forKey:", v10, v6);
  LOBYTE(v13) = +[FSFStreamRegistry writeDict:](FSFStreamRegistry, "writeDict:", v8);

  return (char)v13;
}

- (id)getRegisteredStreams
{
  return +[FSFStreamRegistry readFileInToDict](FSFStreamRegistry, "readFileInToDict");
}

+ (id)readFileInToDict
{
  void *v2;
  void *v3;
  void *v4;

  +[FSFStreamRegistry registryFilePath](FSFStreamRegistry, "registryFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v3, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)writeDict:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  BOOL v8;
  id v10;
  id v11;

  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", a3, 3, &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  +[FSFStreamRegistry registryFilePath](FSFStreamRegistry, "registryFilePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  v6 = objc_msgSend(v3, "writeToFile:options:error:", v5, 0x10000000, &v10);
  v7 = v10;

  if (v7)
    v8 = 0;
  else
    v8 = v6;
  if (!v8)
    NSLog(CFSTR("write status:%d, error:%@"), v6, v7);

  return v8;
}

@end
