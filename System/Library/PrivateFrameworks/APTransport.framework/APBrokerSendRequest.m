@implementation APBrokerSendRequest

void __APBrokerSendRequest_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  unsigned int v12;
  uint64_t v13;

  if (gLogCategory_APBroker <= 30 && (gLogCategory_APBroker != -1 || _LogCategory_Initialize()))
  {
    APBrokerHTTPProtocolString(*(unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 32));
    if (gLogCategory_APBroker == -1)
      _LogCategory_Initialize();
    LogPrintF();
  }
  if (a5 == 401)
    v12 = -6754;
  else
    v12 = -6712;
  if (a5 == 200)
    v12 = 0;
  if (a6)
    v13 = a6;
  else
    v13 = v12;
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, a3, a4, a5, v13);
  _Block_release(*(const void **)(a1 + 32));
}

@end
