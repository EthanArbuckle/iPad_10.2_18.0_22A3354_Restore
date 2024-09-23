@implementation CNEnvironment(CNComposeRecipientNameOptions)

- (uint64_t)composeRecipientNameOptions
{
  return objc_msgSend(a1, "valueForKey:onCacheMiss:", CFSTR("compose-recipient-name-options"), &__block_literal_global_4);
}

@end
