@implementation FaceTimeApplicationAccesssibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FaceTimeApplication");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityAllowsNotificationsDuringSuspension
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  AXPerformBlockSynchronouslyOnMainThread();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __86__FaceTimeApplicationAccesssibility__accessibilityAllowsNotificationsDuringSuspension__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "currentCallCount") != 0;

}

@end
