@implementation NSMutableDictionary(AXSDKShotRecordingManager)

- (void)axSDKSetSafeObject:()AXSDKShotRecordingManager forKey:
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = (uint64_t)v8;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (id)v7;
    objc_msgSend(a1, "setObject:forKey:", v7, v6);
  }

}

@end
