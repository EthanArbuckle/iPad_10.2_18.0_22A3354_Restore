@implementation APBrokerHTTPSendRequestToURL

void ___APBrokerHTTPSendRequestToURL_block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t *v5;
  uint64_t v7;
  unint64_t IntWithDefault;
  uint64_t v9;
  uint64_t v10;

  v5 = *(uint64_t **)(a1 + 32);
  if (a4)
  {
    NSErrorToOSStatus();
    if (gLogCategory_APBrokerHTTPUtils <= 30
      && (gLogCategory_APBrokerHTTPUtils != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = objc_msgSend(a3, "statusCode");
    else
      v7 = 0;
    if (gLogCategory_APBrokerHTTPUtils <= 30
      && (gLogCategory_APBrokerHTTPUtils != -1 || _LogCategory_Initialize()))
    {
      v9 = *v5;
      v10 = v7;
      LogPrintF();
    }
    if (a2 && v7 == 200 && objc_msgSend(a2, "length"))
    {
      if (IsAppleInternalBuild())
        IntWithDefault = (int)APSSettingsGetIntWithDefault();
      else
        IntWithDefault = 0x100000;
      if (objc_msgSend(a2, "length", v9, v10) <= IntWithDefault)
      {
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a2, 0, 0);
        objc_opt_class();
        objc_opt_isKindOfClass();
      }
      else if (gLogCategory_APBrokerHTTPUtils <= 90
             && (gLogCategory_APBrokerHTTPUtils != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(a2, "length");
        LogPrintF();
      }
    }
  }
  (*(void (**)(void))(v5[7] + 16))();
  _APBrokerHTTPReleaseRequestData((uint64_t)v5);
}

@end
