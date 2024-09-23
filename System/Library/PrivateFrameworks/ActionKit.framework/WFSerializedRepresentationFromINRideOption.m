@implementation WFSerializedRepresentationFromINRideOption

id __WFSerializedRepresentationFromINRideOption_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  NSRange v7;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  v7.location = objc_msgSend(v2, "partySizeRange");
  NSStringFromRange(v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("PartySizeRangeString"));

  objc_msgSend(v2, "sizeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("SizeDescription"));
  return v3;
}

@end
