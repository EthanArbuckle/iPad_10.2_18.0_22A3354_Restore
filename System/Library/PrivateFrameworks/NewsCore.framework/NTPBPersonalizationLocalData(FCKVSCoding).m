@implementation NTPBPersonalizationLocalData(FCKVSCoding)

+ (uint64_t)keyValuePairType
{
  return 11;
}

+ (uint64_t)readValueFromKeyValuePair:()FCKVSCoding
{
  return objc_msgSend(a3, "personalizationLocalData");
}

- (void)writeToKeyValuePair:()FCKVSCoding
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setValueType:", 11);
  objc_msgSend(v4, "setPersonalizationLocalData:", a1);

}

@end
