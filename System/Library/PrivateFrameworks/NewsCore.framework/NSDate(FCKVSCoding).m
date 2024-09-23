@implementation NSDate(FCKVSCoding)

+ (id)readValueFromKeyValuePair:()FCKVSCoding
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a3, "dateValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  objc_msgSend(v3, "dateWithTimeIntervalSince1970:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)writeToKeyValuePair:()FCKVSCoding
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "setValueType:", objc_msgSend((id)objc_opt_class(), "keyValuePairType"));
  objc_msgSend(a1, "pbDate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDateValue:", v5);

}

+ (uint64_t)keyValuePairType
{
  return 3;
}

@end
