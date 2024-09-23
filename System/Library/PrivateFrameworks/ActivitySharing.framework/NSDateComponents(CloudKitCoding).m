@implementation NSDateComponents(CloudKitCoding)

- (ASCodableCloudKitDateComponents)as_codableDateComponents
{
  ASCodableCloudKitDateComponents *v2;

  v2 = objc_alloc_init(ASCodableCloudKitDateComponents);
  -[ASCodableCloudKitDateComponents setYear:](v2, "setYear:", objc_msgSend(a1, "year"));
  -[ASCodableCloudKitDateComponents setMonth:](v2, "setMonth:", objc_msgSend(a1, "month"));
  -[ASCodableCloudKitDateComponents setDay:](v2, "setDay:", objc_msgSend(a1, "day"));
  -[ASCodableCloudKitDateComponents setEra:](v2, "setEra:", objc_msgSend(a1, "era"));
  return v2;
}

+ (id)as_dateComponentsWithCodable:()CloudKitCoding
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;

  v3 = (objc_class *)MEMORY[0x24BDBCE68];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setYear:", objc_msgSend(v4, "year"));
  objc_msgSend(v5, "setMonth:", objc_msgSend(v4, "month"));
  objc_msgSend(v5, "setDay:", objc_msgSend(v4, "day"));
  v6 = objc_msgSend(v4, "era");

  objc_msgSend(v5, "setEra:", v6);
  return v5;
}

@end
