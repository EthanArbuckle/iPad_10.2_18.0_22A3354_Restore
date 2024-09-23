@implementation PKPaymentAuthorizationFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaymentAuthorizationFooterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentAuthorizationFooterView"), CFSTR("setState:string:animated:withCompletion:"), "v", "q", "@", "B", "@?", 0);
}

- (void)setState:(int64_t)a3 string:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6
{
  _BOOL4 v6;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  objc_super v11;

  v6 = a5;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentAuthorizationFooterViewAccessibility;
  -[PKPaymentAuthorizationFooterViewAccessibility setState:string:animated:withCompletion:](&v11, sel_setState_string_animated_withCompletion_, a3, a4, a5, a6);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __89__PKPaymentAuthorizationFooterViewAccessibility_setState_string_animated_withCompletion___block_invoke;
  v10[3] = &__block_descriptor_40_e5_v8__0l;
  v10[4] = a3;
  v8 = MEMORY[0x234918E74](v10);
  v9 = (void *)v8;
  if (v6)
    AXPerformBlockOnMainThreadAfterDelay();
  else
    (*(void (**)(uint64_t))(v8 + 16))(v8);

}

void __89__PKPaymentAuthorizationFooterViewAccessibility_setState_string_animated_withCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[1] = CFSTR("PKPaymentProgressState");
  v4[0] = CFSTR("ViewDidAppear");
  v3[0] = CFSTR("event");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(0xFA2u, v2);

}

@end
