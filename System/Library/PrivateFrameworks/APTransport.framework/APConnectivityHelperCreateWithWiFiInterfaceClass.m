@implementation APConnectivityHelperCreateWithWiFiInterfaceClass

void __APConnectivityHelperCreateWithWiFiInterfaceClass_block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  id v5;
  NSObject *v6;
  _QWORD v7[6];

  if (_APConnectivityHelper_getActiveHelpers_once != -1)
    dispatch_once(&_APConnectivityHelper_getActiveHelpers_once, &__block_literal_global_66);
  v3 = (_QWORD *)FigCFWeakReferenceTableCopyValue();
  if (v3)
  {
    v4 = v3;
    CFRetain(v3);
    v5 = a2;
    v6 = v4[2];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = ___APConnectivityHelperHandleCWFEventExternal_block_invoke;
    v7[3] = &unk_1E8256F90;
    v7[4] = a2;
    v7[5] = v4;
    dispatch_async(v6, v7);
    CFRelease(v4);
  }
}

@end
