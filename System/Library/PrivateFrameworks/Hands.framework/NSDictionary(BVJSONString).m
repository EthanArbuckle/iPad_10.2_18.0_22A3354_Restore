@implementation NSDictionary(BVJSONString)

- (id)handsKit_jsonDataWithPrettyPrint:()BVJSONString
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v11[21];

  v11[19] = *(id *)MEMORY[0x24BDAC8D0];
  v11[0] = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", a1, a3, v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11[0];
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Error in jsonDataWithPrettyPrint, %@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HandyLoggerNeo logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:](_TtC5Hands14HandyLoggerNeo, "logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:", 4, 1, CFSTR("Default"), CFSTR("/Library/Caches/com.apple.xbs/Sources/Hands/HandsKit/Utils/FoundationExtensions.mm"), 35, v8);

  }
  v9 = v3;

  return v9;
}

- (__CFString)handsKit_jsonStringWithPrettyPrint:()BVJSONString
{
  void *v1;
  __CFString *v2;

  objc_msgSend(a1, "handsKit_jsonDataWithPrettyPrint:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v1, 4);
  else
    v2 = CFSTR("{}");

  return v2;
}

@end
