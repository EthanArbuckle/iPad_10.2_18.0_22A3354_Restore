@implementation APReceiverSystemInfoCreate

void __APReceiverSystemInfoCreate_block_invoke(uint64_t a1)
{
  uint64_t v2;

  sysInfo_updateAPGroupInfo(*(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_DWORD *)(v2 + 568))
  {
    sysInfo_handleCloudConnectivityChange(v2, *(_DWORD *)(v2 + 24), 1);
    sysInfo_handleConferenceRoomModeChange(*(_QWORD *)(a1 + 32), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 28), 1);
    sysInfo_updatePrefs(*(_QWORD *)(a1 + 32), 1, 1);
    v2 = *(_QWORD *)(a1 + 32);
  }
  sysInfo_updateAdvertiserInfoAndNotify(v2, 0);
  sysInfo_updatePowerAssertionState(*(_QWORD *)(a1 + 32));
  sysInfo_handleDeviceNameChanged(*(_QWORD *)(a1 + 32));
}

@end
