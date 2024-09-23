@implementation APCarPlayInitiateJarvisProcessing

uint64_t __APCarPlayInitiateJarvisProcessing_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (gLogCategory_APCarPlaySiriInterface <= 50
    && (gLogCategory_APCarPlaySiriInterface != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(a3, "domain");
    objc_msgSend(a3, "code");
    LogPrintF();
  }
  kdebug_trace();
  return (*(uint64_t (**)(_QWORD, uint64_t))(a1 + 40))(*(_QWORD *)(a1 + 48), a2);
}

@end
