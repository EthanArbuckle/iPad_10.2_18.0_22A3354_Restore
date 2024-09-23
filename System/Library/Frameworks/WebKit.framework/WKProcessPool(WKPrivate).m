@implementation WKProcessPool(WKPrivate)

- (uint64_t)_isJITDisabledInAllRemoteWorkerProcesses:()WKPrivate
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_getActivePagesOriginsInWebProcessForTesting:()WKPrivate completionHandler:
{
  void *v2;

  *a1 = off_1E34BCE30;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_getActivePagesOriginsInWebProcessForTesting:()WKPrivate completionHandler:
{
  CFTypeRef v3;
  CFTypeRef cf;

  WTF::createNSArray<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> &>(a2, (uint64_t *)&cf);
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  v3 = cf;
  cf = 0;
  if (v3)
    CFRelease(v3);
}

- (uint64_t)_seedResourceLoadStatisticsForTestingWithFirstParty:()WKPrivate thirdParty:shouldScheduleNotification:completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

@end
