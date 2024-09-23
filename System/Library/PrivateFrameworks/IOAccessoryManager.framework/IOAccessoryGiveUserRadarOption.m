@implementation IOAccessoryGiveUserRadarOption

void __IOAccessoryGiveUserRadarOption_block_invoke(uint64_t a1)
{
  const __CFString *v2;
  SInt32 v3;
  BOOL v4;
  CFOptionFlags v5;

  if (objc_msgSend((id)gUserLdcmParams, "enableHalogenMitigationsAndUI") == 1)
  {
    IOAccessoryFileRadarHalogen(*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 48));
  }
  else
  {
    v5 = 0xAAAAAAAAAAAAAAAALL;
    if (*(_DWORD *)(a1 + 48))
      v2 = CFSTR("SNR failure while doing Liquid Detection.\n File a Radar?");
    else
      v2 = CFSTR("Liquid detected in Lightning port.\n File a Radar?");
    v3 = CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, v2, 0, CFSTR("Not Now"), CFSTR("Yes"), 0, &v5);
    objc_msgSend(*(id *)(a1 + 40), "setIsTapToRadarPending:", 0);
    if (v3)
      v4 = 0;
    else
      v4 = v5 == 1;
    if (v4)
      IOAccessoryFileRadarHalogen(*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 48));
  }
}

@end
