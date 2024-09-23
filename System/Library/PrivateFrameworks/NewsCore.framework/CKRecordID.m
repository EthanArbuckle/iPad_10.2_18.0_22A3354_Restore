@implementation CKRecordID

+ (id)fc_staticSecureSentinelRecordID
{
  objc_opt_self();
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:", CFSTR("static_sentinel_secure"));
}

+ (id)fc_staticSentinelRecordID
{
  objc_opt_self();
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:", CFSTR("static_sentinel"));
}

@end
