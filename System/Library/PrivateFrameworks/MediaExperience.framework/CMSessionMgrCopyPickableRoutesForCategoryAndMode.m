@implementation CMSessionMgrCopyPickableRoutesForCategoryAndMode

void __CMSessionMgrCopyPickableRoutesForCategoryAndMode_block_invoke(uint64_t a1)
{
  __CFString *v2;
  __CFString *v3;
  __CFArray *v4;

  v2 = CMSMUtility_CopyMappedMXSessionAudioCategory(*(__CFString **)(a1 + 32));
  v3 = CMSMUtility_CopyMappedMXSessionAudioMode(*(__CFString **)(a1 + 40));
  v4 = cmsmCopyPickableRoutesForRouteConfiguration((uint64_t)-[MXSessionManager getBluetoothCustomizedAlternateCategory:enableBluetooth:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "getBluetoothCustomizedAlternateCategory:enableBluetooth:", v2, 1), (uint64_t)v3, 0, 0);
  **(_QWORD **)(a1 + 48) = CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, 0);
  if (v4)
    CFRelease(v4);
  if (v2)
    CFRelease(v2);
  if (v3)
    CFRelease(v3);
}

@end
