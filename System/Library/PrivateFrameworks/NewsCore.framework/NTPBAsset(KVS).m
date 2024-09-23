@implementation NTPBAsset(KVS)

+ (uint64_t)readValueFromKeyValuePair:()KVS
{
  return objc_msgSend(a3, "asset");
}

+ (uint64_t)keyValuePairType
{
  return 15;
}

- (void)writeToKeyValuePair:()KVS
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setValueType:", objc_msgSend((id)objc_opt_class(), "keyValuePairType"));
  objc_msgSend(v4, "setAsset:", a1);

}

@end
