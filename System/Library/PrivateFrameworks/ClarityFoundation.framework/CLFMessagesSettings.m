@implementation CLFMessagesSettings

void __51__CLFMessagesSettings_GeneratedCode_sharedInstance__block_invoke()
{
  CLFMessagesSettings *v0;
  void *v1;

  v0 = objc_alloc_init(CLFMessagesSettings);
  v1 = (void *)sharedInstance_SharedSettings_2;
  sharedInstance_SharedSettings_2 = (uint64_t)v0;

}

- (BOOL)requiresMoreRestrictiveOutgoingCommunicationLimit
{
  return 1;
}

- (id)legacyOutgoingCommunicationLimit
{
  return CFSTR("selectedContacts");
}

@end
