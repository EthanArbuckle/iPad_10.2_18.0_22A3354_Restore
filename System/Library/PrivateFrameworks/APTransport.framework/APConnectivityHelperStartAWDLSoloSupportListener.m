@implementation APConnectivityHelperStartAWDLSoloSupportListener

void ___APConnectivityHelperStartAWDLSoloSupportListener_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = ___APConnectivityHelperStartAWDLSoloSupportListener_block_invoke_2;
  v4[3] = &unk_1E8256F90;
  v4[4] = a2;
  v4[5] = v2;
  dispatch_sync(v3, v4);
}

_QWORD *___APConnectivityHelperStartAWDLSoloSupportListener_block_invoke_2(_QWORD *result)
{
  _BYTE *v1;

  v1 = (_BYTE *)result[5];
  if (!v1[200])
  {
    result = (_QWORD *)result[4];
    if (result)
    {
      v1[136] = objc_msgSend(result, "supportsSoloMode");
      v1[137] = 1;
      if (gLogCategory_APConnectivityHelper <= 40
        && (gLogCategory_APConnectivityHelper != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (_APConnectivityHelperSendAWDLSoloSupportEvent((uint64_t)v1))
        APSLogErrorAt();
      return (_QWORD *)_APConnectivityHelperEnsureAWDLSoloSupportListenerStopped((uint64_t)v1);
    }
  }
  return result;
}

@end
