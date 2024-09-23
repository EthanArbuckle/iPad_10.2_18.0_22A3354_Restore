@implementation NSData(HMFTimeZoneCreation)

- (uint64_t)decodeTimeZone
{
  return objc_msgSend(MEMORY[0x1E0C99E80], "hmf_unarchiveFromData:error:", a1, 0);
}

@end
