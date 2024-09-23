@implementation APUIAirPlayURLParser

+ (id)setupPayloadFromAirPlayURL:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  APUIAirPlaySetupPayload *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v3 = (__CFString *)a3;
  v4 = v3;
  if (dword_10001ED78 <= 50)
  {
    if (dword_10001ED78 != -1 || (v3 = (__CFString *)_LogCategory_Initialize(&dword_10001ED78, 33554482), (_DWORD)v3))
    {
      if (v4 && !IsAppleInternalBuild(v3))
        v5 = CFSTR("#Redacted#");
      else
        v5 = v4;
      LogPrintF(&dword_10001ED78, "+[APUIAirPlayURLParser setupPayloadFromAirPlayURL:]", 33554482, "Parsing AirPlay URL: %@", v5);
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithString:](NSURLComponents, "componentsWithString:", v4));
  if (!v6)
  {
    v26 = 30;
LABEL_61:
    APSLogErrorAt(0, "+[APUIAirPlayURLParser setupPayloadFromAirPlayURL:]", v26, 0);
    v13 = 0;
    goto LABEL_54;
  }
  if (dword_10001ED78 <= 50
    && (dword_10001ED78 != -1 || _LogCategory_Initialize(&dword_10001ED78, 33554482)))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scheme"));
    LogPrintF(&dword_10001ED78, "+[APUIAirPlayURLParser setupPayloadFromAirPlayURL:]", 33554482, "AirPlay URL scheme: %@", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scheme"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("airplay"));

  if ((v9 & 1) == 0)
  {
    v26 = 33;
    goto LABEL_61;
  }
  if (dword_10001ED78 <= 50
    && (dword_10001ED78 != -1 || _LogCategory_Initialize(&dword_10001ED78, 33554482)))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "host"));
    LogPrintF(&dword_10001ED78, "+[APUIAirPlayURLParser setupPayloadFromAirPlayURL:]", 33554482, "AirPlay URL host: %@", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "host"));
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("setup"));

  if ((v12 & 1) == 0)
  {
    v26 = 36;
    goto LABEL_61;
  }
  v13 = objc_opt_new(APUIAirPlaySetupPayload);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "queryItems"));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v15)
    goto LABEL_53;
  v16 = v15;
  v17 = *(_QWORD *)v28;
  while (2)
  {
    for (i = 0; i != v16; i = (char *)i + 1)
    {
      if (*(_QWORD *)v28 != v17)
        objc_enumerationMutation(v14);
      v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "value"));
      v22 = objc_msgSend(v21, "lengthOfBytesUsingEncoding:", 4);
      if (!v22)
      {
        v24 = 46;
        goto LABEL_52;
      }
      v23 = (unint64_t)v22;
      if (objc_msgSend(v20, "isEqualToString:", CFSTR("bt")))
      {
        if (v23 <= 0x80)
        {
          -[APUIAirPlaySetupPayload setBrokerToken:](v13, "setBrokerToken:", v21);
          goto LABEL_46;
        }
        v24 = 49;
LABEL_52:
        APSLogErrorAt(0, "+[APUIAirPlayURLParser setupPayloadFromAirPlayURL:]", v24, 0);

        v13 = 0;
        goto LABEL_53;
      }
      if (objc_msgSend(v20, "isEqualToString:", CFSTR("rp")))
      {
        if (v23 > 0x80)
        {
          v24 = 53;
          goto LABEL_52;
        }
        -[APUIAirPlaySetupPayload setReceiverToken:](v13, "setReceiverToken:", v21);
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("rr")))
      {
        -[APUIAirPlaySetupPayload setRouteToReceiver:](v13, "setRouteToReceiver:", objc_msgSend(v21, "isEqualToString:", CFSTR("1")));
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("wid")))
      {
        if (v23 > 0x20)
        {
          v24 = 60;
          goto LABEL_52;
        }
        -[APUIAirPlaySetupPayload setWifiSSID:](v13, "setWifiSSID:", v21);
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("wp")))
      {
        if (v23 > 0x80)
        {
          v24 = 64;
          goto LABEL_52;
        }
        -[APUIAirPlaySetupPayload setWifiPassphrase:](v13, "setWifiPassphrase:", v21);
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("ca")))
      {
        if (v23 > 0x400)
        {
          v24 = 68;
          goto LABEL_52;
        }
        -[APUIAirPlaySetupPayload setCaptivePortalAuthToken:](v13, "setCaptivePortalAuthToken:", v21);
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("h")))
      {
        -[APUIAirPlaySetupPayload setIsNetworkHidden:](v13, "setIsNetworkHidden:", objc_msgSend(v21, "isEqualToString:", CFSTR("1")));
      }
LABEL_46:

    }
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v16)
      continue;
    break;
  }
LABEL_53:

LABEL_54:
  return v13;
}

@end
