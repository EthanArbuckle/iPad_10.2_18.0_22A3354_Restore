@implementation NSString(AddressBookLabels)

- (uint64_t)isAddressBookLabel
{
  if ((objc_msgSend(a1, "_appearsToBePhoneNumber") & 1) != 0)
    return 0;
  else
    return objc_msgSend(a1, "_appearsToBeEmail") ^ 1;
}

@end
