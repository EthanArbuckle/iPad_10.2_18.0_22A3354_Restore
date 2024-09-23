@implementation CATransaction(HealthUI)

+ (uint64_t)hk_performWithoutAnimations:()HealthUI
{
  void *v3;
  void (**v4)(_QWORD);

  v3 = (void *)MEMORY[0x1E0CD28B0];
  v4 = a3;
  objc_msgSend(v3, "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD3160]);
  v4[2](v4);

  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

@end
