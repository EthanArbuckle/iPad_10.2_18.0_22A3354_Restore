@implementation CSSiriBTDeviceGetDeviceInfo

void ___CSSiriBTDeviceGetDeviceInfo_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setAddress:", v3);
  objc_msgSend(v4, "setVendorID:", *(unsigned int *)(a1 + 40));
  objc_msgSend(v4, "setProductID:", *(unsigned int *)(a1 + 44));
  objc_msgSend(v4, "setIsAdvancedAppleAudioDevice:", *(_DWORD *)(a1 + 48) == -1);
  objc_msgSend(v4, "setSupportsInEarDetection:", *(_DWORD *)(a1 + 52) == -1);
  objc_msgSend(v4, "setSupportsVoiceTrigger:", *(_DWORD *)(a1 + 56) == -1);
  objc_msgSend(v4, "setSupportsSpokenNotification:", *(_DWORD *)(a1 + 60) == -1);
  objc_msgSend(v4, "setSupportsListeningModeANC:", *(_DWORD *)(a1 + 64) == -1);
  objc_msgSend(v4, "setSupportsListeningModeTransparency:", *(_DWORD *)(a1 + 68) == -1);
  objc_msgSend(v4, "setSupportsAnnounceCall:", *(_DWORD *)(a1 + 72) == -1);

}

@end
