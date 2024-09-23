@implementation PKPeerPaymentMessageBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPeerPaymentMessageBalloonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPeerPaymentMessageBalloonView"), CFSTR("bubbleView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPeerPaymentMessageBalloonView"), CFSTR("peerPaymentType"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPeerPaymentBubbleView"), CFSTR("_messageText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPeerPaymentBubbleView"), CFSTR("_statusText"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = -[PKPeerPaymentMessageBalloonViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("peerPaymentType"));
  -[PKPeerPaymentMessageBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bubbleView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safeStringForKey:", CFSTR("_messageText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", CFSTR("_statusText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = CFSTR("unknown.transfer.format");
    if (v3 == 1)
      v8 = CFSTR("sent.transfer.format");
    if (v3 == 2)
      v9 = CFSTR("received.transfer.format");
    else
      v9 = (__CFString *)v8;
    v10 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v11, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    accessibilityLocalizedString(CFSTR("unknown.transfer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  __UIAXStringForVariables();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
