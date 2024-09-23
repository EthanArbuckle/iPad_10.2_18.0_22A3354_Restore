@implementation HMMTRFileManager

- (id)dictionaryWithContentsOfURL:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:error:", a3, a4);
}

- (BOOL)writeDictionary:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  char v10;

  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a3, 200, 0, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = objc_msgSend(v8, "writeToURL:options:error:", v7, 0, a5);
  else
    v10 = 0;

  return v10;
}

@end
