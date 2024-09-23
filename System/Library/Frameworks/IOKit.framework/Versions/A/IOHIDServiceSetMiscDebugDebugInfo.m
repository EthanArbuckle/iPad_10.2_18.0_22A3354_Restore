@implementation IOHIDServiceSetMiscDebugDebugInfo

void ___IOHIDServiceSetMiscDebugDebugInfo_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t UUID;
  const __CFString *v4;

  UUID = IOHIDEventSystemConnectionGetUUID(a2);
  if (UUID)
    v4 = (const __CFString *)UUID;
  else
    v4 = CFSTR("unknown");
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), v4);
}

void ___IOHIDServiceSetMiscDebugDebugInfo_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t UUID;
  const __CFString *v4;

  UUID = IOHIDEventSystemConnectionGetUUID(a2);
  if (UUID)
    v4 = (const __CFString *)UUID;
  else
    v4 = CFSTR("unknown");
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), v4);
}

@end
