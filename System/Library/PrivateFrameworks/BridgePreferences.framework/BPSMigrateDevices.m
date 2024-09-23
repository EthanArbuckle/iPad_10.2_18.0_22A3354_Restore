@implementation BPSMigrateDevices

void __BPSMigrateDevices_block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("Granted Migration Consent %@? (error: %@)"), *(_QWORD *)(a1 + 32), a2);
}

@end
