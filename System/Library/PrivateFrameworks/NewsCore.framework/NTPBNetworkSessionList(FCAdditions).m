@implementation NTPBNetworkSessionList(FCAdditions)

+ (uint64_t)readValueFromKeyValuePair:()FCAdditions
{
  return objc_msgSend(a3, "networkSessionList");
}

+ (uint64_t)keyValuePairType
{
  return 8;
}

- (void)writeToKeyValuePair:()FCAdditions
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setValueType:", 8);
  objc_msgSend(v4, "setNetworkSessionList:", a1);

}

@end
