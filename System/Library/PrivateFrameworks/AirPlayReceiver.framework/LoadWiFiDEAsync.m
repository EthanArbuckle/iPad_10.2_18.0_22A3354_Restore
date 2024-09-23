@implementation LoadWiFiDEAsync

void ___LoadWiFiDEAsync_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[6];

  v2 = (void *)MEMORY[0x2207ABB4C]();
  v3 = (void *)objc_msgSend(MEMORY[0x24BE2C990], "sharedInstance");
  objc_msgSend(v3, "loadExtensions");
  v4 = objc_msgSend(v3, "extensionForIdentifier:", CFSTR("com.apple.DiagnosticExtensions.WiFi"));
  if (gLogCategory_AirPlayReceiverPlatform <= 50
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(*(_QWORD *)(v5 + 8) + 88);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = ___LoadWiFiDEAsync_block_invoke_2;
  v7[3] = &unk_24E21FD40;
  v7[4] = v5;
  v7[5] = v4;
  dispatch_sync(v6, v7);
  objc_autoreleasePoolPop(v2);
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 8));
}

void ___LoadWiFiDEAsync_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(v1 + 56);
  v3 = v2;
  *(_QWORD *)(v1 + 56) = v2;

}

@end
