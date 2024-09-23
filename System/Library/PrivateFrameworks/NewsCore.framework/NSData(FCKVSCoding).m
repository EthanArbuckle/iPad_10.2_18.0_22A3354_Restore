@implementation NSData(FCKVSCoding)

+ (uint64_t)readValueFromKeyValuePair:()FCKVSCoding
{
  return objc_msgSend(a3, "dataValue");
}

- (void)writeToKeyValuePair:()FCKVSCoding
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setValueType:", objc_msgSend((id)objc_opt_class(), "keyValuePairType"));
  objc_msgSend(v4, "setDataValue:", a1);

}

+ (uint64_t)keyValuePairType
{
  return 1;
}

@end
