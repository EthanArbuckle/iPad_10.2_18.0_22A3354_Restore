@implementation APReceiverUIControllerGetShared

void __APReceiverUIControllerGetShared_block_invoke()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  char *v3;

  if (AirPlayReceiverUI_GetShared_once != -1)
    dispatch_once(&AirPlayReceiverUI_GetShared_once, &__block_literal_global_2473);
  v0 = AirPlayReceiverUI_GetShared_ui;
  if (!AirPlayReceiverUI_GetShared_ui)
  {
    if (gLogCategory_AirPlayReceiverUIXPCServerCore > 50
      || gLogCategory_AirPlayReceiverUIXPCServerCore == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_14;
    }
LABEL_12:
    LogPrintF();
    goto LABEL_14;
  }
  if (APReceiverUIControllerGetClassID_once != -1)
    dispatch_once(&APReceiverUIControllerGetClassID_once, &__block_literal_global_3134);
  if (CMDerivedObjectCreate())
  {
    APSLogErrorAt();
    goto LABEL_14;
  }
  *(_QWORD *)CMBaseObjectGetDerivedStorage() = v0;
  v1 = malloc_type_calloc(1uLL, 0x20uLL, 0xB004060A01B80uLL);
  if (v1)
  {
    v2 = v1;
    v3 = strdup("APReceiverUIControllerShared");
    v2[1] = v3;
    if (v3)
    {
      v2[2] = sharedUI_HandleUIEvent;
      v2[3] = 0;
      *v2 = *(_QWORD *)(v0 + 48);
      *(_QWORD *)(v0 + 48) = v2;
    }
    else
    {
      APSLogErrorAt();
      free(v2);
    }
  }
  else
  {
    APSLogErrorAt();
  }
  if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 50
    && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_12;
  }
LABEL_14:
  APReceiverUIControllerGetShared_ui = 0;
}

@end
