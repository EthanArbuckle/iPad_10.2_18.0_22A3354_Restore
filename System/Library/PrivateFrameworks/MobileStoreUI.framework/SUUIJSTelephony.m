@implementation SUUIJSTelephony

- (SUUIJSTelephony)initWithAppContext:(id)a3
{
  SUUIJSTelephony *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *telephonyQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIJSTelephony;
  v3 = -[IKJSObject initWithAppContext:](&v7, sel_initWithAppContext_, a3);
  if (v3)
  {
    v4 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUIJSTelephony", 0);
    telephonyQueue = v3->_telephonyQueue;
    v3->_telephonyQueue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void (*v5)(__CTServerConnection *, _QWORD);
  void (*v6)(__CTServerConnection *, _QWORD);
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  objc_super v11;

  v3 = (void *)SUUICoreTelephonyFramework();
  if (self->_telephonyServer)
  {
    v4 = v3;
    v5 = (void (*)(__CTServerConnection *, _QWORD))SUUIWeakLinkedSymbolForString("_CTServerConnectionUnregisterForNotification", v3);
    if (v5)
    {
      v6 = v5;
      v7 = SUUIWeakLinkedSymbolForString("kCTRegistrationDisplayStatusChangedNotification", v4);
      v6(self->_telephonyServer, *v7);
      v8 = SUUIWeakLinkedSymbolForString("kCTRegistrationOperatorNameChangedNotification", v4);
      v6(self->_telephonyServer, *v8);
      v9 = SUUIWeakLinkedSymbolForString("kCTRegistrationStatusChangedNotification", v4);
      v6(self->_telephonyServer, *v9);
      v10 = SUUIWeakLinkedSymbolForString("kCTSettingPhoneNumberChangedNotification", v4);
      v6(self->_telephonyServer, *v10);
    }
    CFRelease(self->_telephonyServer);
  }
  v11.receiver = self;
  v11.super_class = (Class)SUUIJSTelephony;
  -[SUUIJSTelephony dealloc](&v11, sel_dealloc);
}

- (void)beginObserving
{
  __CTServerConnection *v3;
  __CTServerConnection *v4;
  void *v5;
  void (*v6)(__CTServerConnection *, _QWORD);
  void (*v7)(__CTServerConnection *, _QWORD);
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;

  if (!self->_isObserving)
  {
    v3 = -[SUUIJSTelephony _telephonyServer](self, "_telephonyServer");
    if (v3)
    {
      v4 = v3;
      v5 = (void *)SUUICoreTelephonyFramework();
      v6 = (void (*)(__CTServerConnection *, _QWORD))SUUIWeakLinkedSymbolForString("_CTServerConnectionRegisterForNotification", v5);
      if (v6)
      {
        v7 = v6;
        v8 = SUUIWeakLinkedSymbolForString("kCTRegistrationDisplayStatusChangedNotification", v5);
        v7(v4, *v8);
        v9 = SUUIWeakLinkedSymbolForString("kCTRegistrationOperatorNameChangedNotification", v5);
        v7(v4, *v9);
        v10 = SUUIWeakLinkedSymbolForString("kCTRegistrationStatusChangedNotification", v5);
        v7(v4, *v10);
        v11 = SUUIWeakLinkedSymbolForString("kCTSettingPhoneNumberChangedNotification", v5);
        v7(v4, *v11);
      }
      self->_isObserving = 1;
    }
  }
}

- (NSString)countryCode
{
  return (NSString *)(id)CPPhoneNumberCopyActiveCountryCode();
}

- (id)formattedPhoneNumber:(id)a3
{
  return (id)CPPhoneNumberCopyFormattedStringForTextMessage();
}

- (BOOL)isCellularRoaming
{
  void *v2;
  uint64_t (*v3)(void);
  uint64_t v4;
  const __CFDictionary *v5;
  const void **v6;
  const void *Value;
  const void *v8;
  CFTypeRef *v9;
  BOOL v10;

  v2 = (void *)SUUICoreTelephonyFramework();
  v3 = (uint64_t (*)(void))SUUIWeakLinkedSymbolForString("CTRegistrationCopyDataStatus", v2);
  if (!v3)
    return 0;
  v4 = v3();
  if (!v4)
    return 0;
  v5 = (const __CFDictionary *)v4;
  v6 = (const void **)SUUIWeakLinkedSymbolForString("kCTRegistrationStatus", v2);
  Value = CFDictionaryGetValue(v5, *v6);
  if (Value)
  {
    v8 = Value;
    v9 = (CFTypeRef *)SUUIWeakLinkedSymbolForString("kCTRegistrationStatusRegisteredRoaming", v2);
    v10 = CFEqual(v8, *v9) != 0;
  }
  else
  {
    v10 = 0;
  }
  CFRelease(v5);
  return v10;
}

- (NSString)mobileCountryCode
{
  __CTServerConnection *v2;
  __CTServerConnection *v3;
  void *v4;
  id v6;

  v6 = 0;
  v2 = -[SUUIJSTelephony _telephonyServer](self, "_telephonyServer");
  if (v2)
  {
    v3 = v2;
    v4 = (void *)SUUICoreTelephonyFramework();
    v2 = (__CTServerConnection *)SUUIWeakLinkedSymbolForString("_CTServerConnectionCopyMobileCountryCode", v4);
    if (v2)
    {
      ((void (*)(__CTServerConnection *, id *))v2)(v3, &v6);
      v2 = (__CTServerConnection *)v6;
    }
  }
  return (NSString *)v2;
}

- (NSString)mobileNetworkCode
{
  __CTServerConnection *v2;
  __CTServerConnection *v3;
  void *v4;
  id v6;

  v6 = 0;
  v2 = -[SUUIJSTelephony _telephonyServer](self, "_telephonyServer");
  if (v2)
  {
    v3 = v2;
    v4 = (void *)SUUICoreTelephonyFramework();
    v2 = (__CTServerConnection *)SUUIWeakLinkedSymbolForString("_CTServerConnectionCopyMobileNetworkCode", v4);
    if (v2)
    {
      ((void (*)(__CTServerConnection *, id *))v2)(v3, &v6);
      v2 = (__CTServerConnection *)v6;
    }
  }
  return (NSString *)v2;
}

- (NSString)operatorName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operatorName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)phoneNumber
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "phoneNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)providerName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "providerName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)sendSMSWithBodyText:(id)a3 :(id)a4 :(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = SUUICoreTelephonyFramework();
  v11 = SUUIWeakLinkedClassForString(CFSTR("CTMessageCenter"), v10);
  objc_msgSend(SUUIWeakLinkedClassForString(CFSTR("CTPhoneNumber"), v10), "phoneNumberWithDigits:countryCode:", v8, v7);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "sharedMessageCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "canonicalFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendSMSWithText:serviceCenter:toAddress:", v9, 0, v13);

}

- (__CTServerConnection)_telephonyServer
{
  void *v3;
  void *v4;
  void (*v5)(void);
  void (*v6)(void);
  _QWORD v8[2];
  __int128 v9;
  uint64_t v10;

  if (!self->_telephonyServer)
  {
    v3 = (void *)SUUICoreTelephonyFramework();
    v4 = SUUIWeakLinkedSymbolForString("_CTServerConnectionCreateWithIdentifier", v3);
    v5 = (void (*)(void))SUUIWeakLinkedSymbolForString("_CTServerConnectionSetTargetQueue", v3);
    if (v4)
    {
      v6 = v5;
      if (v5)
      {
        v8[0] = 0;
        v9 = 0u;
        v10 = 0;
        v8[1] = self;
        self->_telephonyServer = (__CTServerConnection *)((uint64_t (*)(_QWORD, const __CFString *, _QWORD, _QWORD *))v4)(0, CFSTR("com.apple.iTunesStoreUI.SUUIJSTelephony"), _telephonyNotification, v8);
        v6();
      }
    }
  }
  return self->_telephonyServer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyQueue, 0);
}

@end
