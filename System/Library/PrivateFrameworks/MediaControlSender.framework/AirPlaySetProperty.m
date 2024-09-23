@implementation AirPlaySetProperty

void __AirPlaySetProperty_block_invoke(uint64_t a1)
{
  _QWORD *v1;
  float v2;
  int v3;
  int v4;
  void **v5;
  char __str[128];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = (_QWORD *)gMediaControlAudioClient;
  if (gMediaControlAudioClient)
  {
    v2 = *(float *)(a1 + 32);
    if (gLogCategory_MediaControlClientCore <= 50
      && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = MediaControlClient_EnsureConnected((uint64_t)v1);
    if (v3)
    {
      v4 = v3;
      APSLogErrorAt();
    }
    else
    {
      snprintf(__str, 0x80uLL, "/volume?volume=%f", v2);
      HTTPHeader_InitRequest();
      v4 = _MediaControlClient_DoTransaction(0x32u, v1, (uint64_t)(v1 + 52), 0, 0);
    }
    v5 = (void **)(v1 + 34950);
    if (*v5)
    {
      free(*v5);
      *v5 = 0;
    }
    if (v4
      && gLogCategory_MediaControlClientCore <= 60
      && (gLogCategory_MediaControlClientCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

@end
