@implementation CNEnvironmentTestDouble(CNComposeRecipientNameOptions)

- (uint64_t)setComposeRecipientNameOptions:()CNComposeRecipientNameOptions
{
  return objc_msgSend(a1, "setValue:forKey:", a3, CFSTR("compose-recipient-name-options"));
}

@end
