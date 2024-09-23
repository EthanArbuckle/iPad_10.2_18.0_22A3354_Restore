@implementation SPHubbedDevicesProviderStartAsync

void __SPHubbedDevicesProviderStartAsync_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(uint64_t);

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (v3)
    v3(v2);
  if (gLogCategory_SPHubbedDevicesProvider <= 50
    && (gLogCategory_SPHubbedDevicesProvider != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
