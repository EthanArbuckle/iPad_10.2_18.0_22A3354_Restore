@implementation NTPBCacheCoordinatorHints(FCKVSCoding)

+ (uint64_t)readValueFromKeyValuePair:()FCKVSCoding
{
  return objc_msgSend(a3, "cacheCoordinatorHintsValue");
}

+ (uint64_t)keyValuePairType
{
  return 4;
}

- (void)writeToKeyValuePair:()FCKVSCoding
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setValueType:", objc_msgSend((id)objc_opt_class(), "keyValuePairType"));
  objc_msgSend(v4, "setCacheCoordinatorHintsValue:", a1);

}

@end
