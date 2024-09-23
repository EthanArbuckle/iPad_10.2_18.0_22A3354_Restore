@implementation VUIUpNextRequestManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIUpNextRequestManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIUpNextRequestManager"), CFSTR("sendRequestForCanonicalID:action:confirmationShouldWaitCompletion:"), "v", "@", "Q", "B", 0);
}

- (void)sendRequestForCanonicalID:(id)a3 action:(unint64_t)a4 confirmationShouldWaitCompletion:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v8;
  id v9;
  objc_super v10;

  v5 = a5;
  v8 = *MEMORY[0x24BDF7328];
  v9 = a3;
  MEMORY[0x23492454C](v8);
  v10.receiver = self;
  v10.super_class = (Class)VUIUpNextRequestManagerAccessibility;
  -[VUIUpNextRequestManagerAccessibility sendRequestForCanonicalID:action:confirmationShouldWaitCompletion:](&v10, sel_sendRequestForCanonicalID_action_confirmationShouldWaitCompletion_, v9, a4, v5);

}

@end
