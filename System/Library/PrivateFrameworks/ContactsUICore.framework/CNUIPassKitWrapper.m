@implementation CNUIPassKitWrapper

+ (BOOL)isPeerPaymentAvailable
{
  int v2;

  v2 = MGGetBoolAnswer();
  if (v2)
    LOBYTE(v2) = softLinkPKPeerPaymentIsAvailable();
  return v2;
}

+ (id)urlForPeerPaymentWithHandle:(id)a3
{
  return softLinkPKPeerPaymentGetSendPaymentSensitiveURL(a3, 0, 0);
}

@end
