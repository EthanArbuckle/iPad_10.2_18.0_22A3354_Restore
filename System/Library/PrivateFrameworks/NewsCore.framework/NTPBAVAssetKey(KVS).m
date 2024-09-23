@implementation NTPBAVAssetKey(KVS)

+ (uint64_t)keyValuePairType
{
  return 18;
}

+ (uint64_t)readValueFromKeyValuePair:()KVS
{
  return objc_msgSend(a3, "avAssetKey");
}

- (void)writeToKeyValuePair:()KVS
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setValueType:", objc_msgSend((id)objc_opt_class(), "keyValuePairType"));
  objc_msgSend(v4, "setAvAssetKey:", a1);

}

@end
