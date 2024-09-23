@implementation IDSDestinationStrings

- (IDSDestinationStrings)initWithCoder:(id)a3
{
  double v3;
  void *v5;
  const char *v6;
  double v7;
  IDSDestinationStrings *v8;

  objc_msgSend_decodeObjectForKey_(a3, a2, (uint64_t)CFSTR("kIDSDestinationStringSetKey"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_destinationWithStrings_(IDSDestination, v6, (uint64_t)v5, v7);
  v8 = (IDSDestinationStrings *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
