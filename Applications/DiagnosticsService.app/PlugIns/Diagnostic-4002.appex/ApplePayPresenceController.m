@implementation ApplePayPresenceController

- (void)start
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _DWORD v9[2];

  v3 = (void *)MGCopyAnswer(CFSTR("DeviceName"), 0);
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("iPhone")))
    v4 = MGGetBoolAnswer(CFSTR("iyfxmLogGVIaH7aEgqwcIA"));
  else
    v4 = 0;
  -[ApplePayPresenceController setShouldOverrideUserNFC:](self, "setShouldOverrideUserNFC:", v4);
  v5 = DiagnosticLogHandleForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = -[ApplePayPresenceController shouldOverrideUserNFC](self, "shouldOverrideUserNFC");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Apple Pay presence test will override user NFC enablement: %d", (uint8_t *)v9, 8u);
  }

  if ((-[ApplePayPresenceController isCancelled](self, "isCancelled") & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ApplePayPresenceController checkPresence](self, "checkPresence"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ApplePayPresenceController result](self, "result"));
    objc_msgSend(v8, "setStatusCode:", v7);

  }
  -[ApplePayPresenceController setFinished:](self, "setFinished:", 1);

}

- (void)teardown
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  if (-[ApplePayPresenceController shouldOverrideUserNFC](self, "shouldOverrideUserNFC"))
  {
    v3 = DiagnosticLogHandleForCategory(3);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "End of Apple Pay presence test with overridden user NFC enablement. Ensuring original NFC enabled state is restored", v6, 2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ApplePayPresenceController nearField](self, "nearField"));
    objc_msgSend(v5, "restoreNfcEnabledState");

  }
}

- (OSDStockholm)nearField
{
  OSDStockholm *nearField;
  OSDStockholm *v4;
  OSDStockholm *v5;

  nearField = self->_nearField;
  if (!nearField)
  {
    v4 = objc_alloc_init(OSDStockholm);
    v5 = self->_nearField;
    self->_nearField = v4;

    nearField = self->_nearField;
  }
  return nearField;
}

- (BOOL)pingNearField:(id *)a3
{
  void *v4;
  unsigned int v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApplePayPresenceController nearField](self, "nearField", a3));
  v5 = objc_msgSend(v4, "startCardEmulationWithTimeout:", 5.0);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ApplePayPresenceController nearField](self, "nearField"));
    objc_msgSend(v6, "stopCardEmulation:", 5.0);

  }
  return v5;
}

- (BOOL)pingiPadNearField:(id *)a3
{
  void *v4;
  void *v5;
  BOOL valid;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApplePayPresenceController nearField](self, "nearField"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serialNumber"));

  valid = isValidSerialNumber(v5);
  if (!valid)
    +[DAError setError:withCode:format:](DAError, "setError:withCode:format:", a3, 1, CFSTR("Server registration info missing seId"));

  return valid;
}

- (BOOL)isInIORegistry
{
  const __CFDictionary *v2;
  io_service_t MatchingService;
  io_service_t v4;

  v2 = IOServiceMatching("AppleStockholmControl");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  v4 = MatchingService;
  if (MatchingService)
    IOObjectRelease(MatchingService);
  return v4 != 0;
}

- (id)checkPresence
{
  int v3;
  void *v4;
  unsigned int v5;
  unsigned __int8 v6;
  id v7;
  _UNKNOWN **v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  id v13;
  id v14;

  if (-[ApplePayPresenceController isInIORegistry](self, "isInIORegistry"))
  {
    v3 = MGGetBoolAnswer(CFSTR("ipad"));
    if (-[ApplePayPresenceController shouldOverrideUserNFC](self, "shouldOverrideUserNFC"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApplePayPresenceController nearField](self, "nearField"));
      v5 = objc_msgSend(v4, "overrideNfcEnabledState");

      if (!v5)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ApplePayPresenceController nearField](self, "nearField"));
        v11 = objc_msgSend(v10, "isNfcDisabledByProfile");

        v7 = 0;
        if (v11)
          v8 = &off_1000085D0;
        else
          v8 = &off_1000085E8;
        goto LABEL_13;
      }
    }
    if (v3)
    {
      v14 = 0;
      v6 = -[ApplePayPresenceController pingiPadNearField:](self, "pingiPadNearField:", &v14);
      v7 = v14;
      if ((v6 & 1) != 0)
      {
LABEL_6:
        v8 = &off_1000085B8;
LABEL_13:

        return v8;
      }
    }
    else
    {
      v13 = 0;
      v9 = -[ApplePayPresenceController pingNearField:](self, "pingNearField:", &v13);
      v7 = v13;
      if (v9)
        goto LABEL_6;
    }
    v8 = &off_1000085A0;
    goto LABEL_13;
  }
  return &off_100008588;
}

- (void)setNearField:(id)a3
{
  objc_storeStrong((id *)&self->_nearField, a3);
}

- (BOOL)shouldOverrideUserNFC
{
  return self->_shouldOverrideUserNFC;
}

- (void)setShouldOverrideUserNFC:(BOOL)a3
{
  self->_shouldOverrideUserNFC = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearField, 0);
}

@end
