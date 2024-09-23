@implementation ModelUtils

+ (void)loadAnchorFile:(id)a3 detection_anchor_size:(int *)a4 file_name:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t i;
  void *v15;
  id v16;

  v16 = a3;
  v7 = a5;
  objc_msgSend(v16, "pathForResource:ofType:", v7, CFSTR("txt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v8, 4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("\n"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(","));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "valueForKey:", CFSTR("intValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 12; ++i)
  {
    objc_msgSend(v13, "objectAtIndex:", dword_23D9A59D4[i]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    a4[i] = objc_msgSend(v15, "intValue");

  }
}

+ (BOOL)isAbsolutePath:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("/")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("file:/"));

  return v4;
}

+ (id)loadConfig:(id)a3 modelPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("passthrough"));

  if ((v8 & 1) == 0)
  {
    if (+[ModelUtils isAbsolutePath:](ModelUtils, "isAbsolutePath:", v6))
      objc_msgSend(v6, "stringByAppendingPathExtension:", CFSTR("json"));
    else
      objc_msgSend(v5, "pathForResource:ofType:", v6, CFSTR("json"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "fileExistsAtPath:", v10);

    if ((v12 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v13, 0, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("error reading json data"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[HandyLoggerNeo logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:](_TtC5Hands14HandyLoggerNeo, "logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:", 4, 1, CFSTR("HandsKitUtils"), CFSTR("/Library/Caches/com.apple.xbs/Sources/Hands/HandsKit/Utils/ModelUtils.mm"), 46, v14);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("json file doesn't exist at %@"), v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[HandyLoggerNeo logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:](_TtC5Hands14HandyLoggerNeo, "logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:", 4, 1, CFSTR("HandsKitUtils"), CFSTR("/Library/Caches/com.apple.xbs/Sources/Hands/HandsKit/Utils/ModelUtils.mm"), 39, v13);
    }
    v9 = 0;
    goto LABEL_12;
  }
  v9 = 0;
LABEL_13:

  return v9;
}

+ (unint64_t)EspressoStorageTypeToByteWidth:(int)a3
{
  unint64_t result;

  result = 4;
  if (a3 <= 131079)
  {
    if (a3 == 65552)
      return 2;
    if (a3 != 65568)
      return 0;
  }
  else
  {
    if (a3 == 131080)
      return 1;
    if (a3 != 131104)
      return a3 == 262152;
  }
  return result;
}

+ (unint64_t)getCurrentChipID
{
  if (+[ModelUtils getCurrentChipID]::onceToken != -1)
    dispatch_once(&+[ModelUtils getCurrentChipID]::onceToken, &__block_literal_global);
  return +[ModelUtils getCurrentChipID]::chipID;
}

uint64_t __30__ModelUtils_getCurrentChipID__block_invoke()
{
  uint64_t result;

  result = MGGetSInt64Answer();
  +[ModelUtils getCurrentChipID]::chipID = result;
  return result;
}

+ (id)getArchitectureSuffix
{
  unint64_t v2;

  v2 = +[ModelUtils getCurrentChipID](ModelUtils, "getCurrentChipID");
  if ((v2 & 0xFFFFFFFFFFFFFFFDLL) == 0x8110)
    return CFSTR(".H14");
  if ((v2 & 0xFFFFFFFFFFFFFFFDLL) == 0x8101)
    return CFSTR(".H13");
  switch(v2)
  {
    case 0x8020uLL:
      return CFSTR(".H11");
    case 0x8030uLL:
      return CFSTR(".H12");
    case 0x8027uLL:
      return CFSTR(".H11");
  }
  return &stru_250E46D48;
}

@end
