@implementation _KSUtilities

+ (void)createFileIfDoesNotExist:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  char v7;

  v3 = a3;
  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v7);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "createFileAtPath:contents:attributes:", v3, 0, 0);

  }
}

+ (id)userDefaultsSuiteName
{
  return CFSTR("com.apple.textInput.keyboardServices.textReplacement");
}

+ (id)machServiceNameTextReplacement
{
  return CFSTR("com.apple.TextInput.shortcuts");
}

+ (id)keyboardDirectory
{
  if (keyboardDirectory_onceToken != -1)
    dispatch_once(&keyboardDirectory_onceToken, &__block_literal_global_18);
  return (id)keyboardDirectory_dir;
}

+ (id)userDictionaryWordKeyPairsFilePathLegacy
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "keyboardDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("UserDictionaryWordKeyPairs.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)keyboardServicesDirectory
{
  if (keyboardServicesDirectory_onceToken != -1)
    dispatch_once(&keyboardServicesDirectory_onceToken, &__block_literal_global_23);
  return (id)keyboardServicesDirectory_dir;
}

+ (id)findAllDbsInDirectory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x2207A8B6C]();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enumeratorAtPath:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "nextObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    do
    {
      if ((objc_msgSend(v9, "hasSuffix:", CFSTR("UserDictionary.db")) & 1) != 0
        || objc_msgSend(v9, "hasSuffix:", CFSTR("CloudUserDictionary.sqlite")))
      {
        objc_msgSend(v3, "stringByAppendingPathComponent:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

      }
      objc_msgSend(v7, "nextObject");
      v11 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v11;
    }
    while (v11);
  }

  objc_autoreleasePoolPop(v5);
  return v4;
}

@end
