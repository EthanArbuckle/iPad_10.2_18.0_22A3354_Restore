@implementation NTPBPrivateDataControllerSyncState(FCKeyValueStoreValue)

+ (uint64_t)keyValuePairType
{
  return 13;
}

+ (uint64_t)readValueFromKeyValuePair:()FCKeyValueStoreValue
{
  return objc_msgSend(a3, "privateDataControllerSyncState");
}

- (void)writeToKeyValuePair:()FCKeyValueStoreValue
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setValueType:", 13);
  objc_msgSend(v4, "setPrivateDataControllerSyncState:", a1);

}

@end
