@implementation APAdvertiserUpdateNIRangingSessionWithDeviceIdentifier

intptr_t ___APAdvertiserUpdateNIRangingSessionWithDeviceIdentifier_block_invoke(uint64_t a1, int a2, void *a3)
{
  if (a2)
  {
    if (gLogCategory_APAdvertiser <= 50 && (gLogCategory_APAdvertiser != -1 || _LogCategory_Initialize()))
      goto LABEL_8;
  }
  else if (gLogCategory_APAdvertiser <= 90
         && (gLogCategory_APAdvertiser != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(a3, "localizedFailureReason");
LABEL_8:
    LogPrintF();
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
