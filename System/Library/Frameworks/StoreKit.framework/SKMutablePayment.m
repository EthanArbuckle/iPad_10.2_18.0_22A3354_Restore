@implementation SKMutablePayment

- (void)setApplicationUsername:(NSString *)applicationUsername
{
  _QWORD *internal;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  internal = self->super._internal;
  if ((NSString *)internal[1] != applicationUsername)
  {
    v7 = internal;
    v5 = -[NSString copy](applicationUsername, "copy");
    v6 = (void *)internal[1];
    internal[1] = v5;

  }
}

- (void)setIsStoreOriginated:(BOOL)a3
{
  *((_BYTE *)self->super._internal + 65) = a3;
}

- (void)setProductIdentifier:(NSString *)productIdentifier
{
  _QWORD *internal;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  internal = self->super._internal;
  if ((NSString *)internal[4] != productIdentifier)
  {
    v7 = internal;
    v5 = -[NSString copy](productIdentifier, "copy");
    v6 = (void *)internal[4];
    internal[4] = v5;

  }
}

- (void)setQuantity:(NSInteger)quantity
{
  *((_QWORD *)self->super._internal + 5) = quantity;
}

- (void)setRequestData:(NSData *)requestData
{
  NSData *v4;
  __SecTask *v5;
  __SecTask *v6;
  CFTypeRef v7;
  const void *v8;
  CFTypeID TypeID;
  _BOOL4 v10;
  CFTypeRef v11;
  void *v12;
  CFTypeID v13;
  CFErrorRef v14;
  _QWORD *internal;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  CFErrorRef error;

  v4 = requestData;
  v5 = SecTaskCreateFromSelf(0);
  if (v5)
  {
    v6 = v5;
    error = 0;
    v7 = SecTaskCopyValueForEntitlement(v5, CFSTR("com.apple.storekit.request-data"), &error);
    if (v7)
    {
      v8 = v7;
      TypeID = CFBooleanGetTypeID();
      v10 = TypeID == CFGetTypeID(v8) && CFBooleanGetValue((CFBooleanRef)v8) != 0;
      CFRelease(v8);
    }
    else
    {
      if (error)
      {
        NSLog(CFSTR("SecTaskCopyValueForEntitlement error getting legacy entitlement: (%@)"), error);
        CFRelease(error);
      }
      v10 = 0;
    }
    error = 0;
    v11 = SecTaskCopyValueForEntitlement(v6, CFSTR("com.apple.developer.storekit.request-data"), &error);
    if (v11)
    {
      v12 = (void *)v11;
      v13 = CFBooleanGetTypeID();
      if (v13 == CFGetTypeID(v12) && CFBooleanGetValue((CFBooleanRef)v12))
        v10 = 1;
      v14 = (CFErrorRef)v12;
    }
    else
    {
      if (!error)
        goto LABEL_18;
      NSLog(CFSTR("SecTaskCopyValueForEntitlement error getting developer entitlement: (%@)"), error);
      v14 = error;
    }
    CFRelease(v14);
LABEL_18:
    CFRelease(v6);
    if (v10)
      goto LABEL_20;
  }
  NSLog(CFSTR("Warning: This app is not entitled to use SKPayment requestData. requestData will not be sent."));
LABEL_20:
  if (-[NSData length](v4, "length") > 0x2000)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The request data must be less than %d bytes"), 0x2000);
  internal = self->super._internal;
  if ((NSData *)internal[6] != v4)
  {
    v16 = internal;
    v17 = -[NSData copy](v4, "copy");
    v18 = (void *)internal[6];
    internal[6] = v17;

  }
}

- (void)setSimulatesAskToBuyInSandbox:(BOOL)simulatesAskToBuyInSandbox
{
  *((_BYTE *)self->super._internal + 64) = simulatesAskToBuyInSandbox;
}

- (void)setPaymentDiscount:(SKPaymentDiscount *)paymentDiscount
{
  objc_storeStrong((id *)self->super._internal + 9, paymentDiscount);

}

- (void)setPartnerIdentifier:(id)a3
{
  _QWORD *internal;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  internal = self->super._internal;
  if ((id)internal[2] != a3)
  {
    v7 = internal;
    v5 = objc_msgSend(a3, "copy");
    v6 = (void *)internal[2];
    internal[2] = v5;

  }
}

- (void)setPartnerTransactionIdentifier:(id)a3
{
  _QWORD *internal;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  internal = self->super._internal;
  if ((id)internal[3] != a3)
  {
    v7 = internal;
    v5 = objc_msgSend(a3, "copy");
    v6 = (void *)internal[3];
    internal[3] = v5;

  }
}

- (void)setRequestParameters:(id)a3
{
  _QWORD *internal;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  internal = self->super._internal;
  if ((id)internal[7] != a3)
  {
    v7 = internal;
    v5 = objc_msgSend(a3, "copy");
    v6 = (void *)internal[7];
    internal[7] = v5;

  }
}

- (void)setAppleIDAuthorizationClientInfo:(id)a3
{
  _QWORD *internal;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  internal = self->super._internal;
  if ((id)internal[10] != a3)
  {
    v7 = internal;
    v5 = objc_msgSend(a3, "copy");
    v6 = (void *)internal[10];
    internal[10] = v5;

  }
}

@end
