@implementation MPLegacyRecentsTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MPLegacyRecentsTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPLegacyRecentsTableViewCell"), CFSTR("callButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPLegacyRecentsTableViewCell"), CFSTR("callButtonTapped:"), "v", "@", 0);

}

- (BOOL)_accessibilityShouldIgnoreSwipeActionCompletionHandler
{
  return 1;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  char v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  objc_opt_class();
  -[MPLegacyRecentsTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("callButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isHidden") & 1) != 0)
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("call.text"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __71__MPLegacyRecentsTableViewCellAccessibility_accessibilityCustomActions__block_invoke;
    v10[3] = &unk_2502907F0;
    v10[4] = self;
    v11 = v4;
    v8 = (void *)objc_msgSend(v6, "initWithName:actionHandler:", v7, v10);

    v13[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

uint64_t __71__MPLegacyRecentsTableViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  return 1;
}

uint64_t __71__MPLegacyRecentsTableViewCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callButtonTapped:", *(_QWORD *)(a1 + 40));
}

@end
