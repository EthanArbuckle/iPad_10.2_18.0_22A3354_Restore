@implementation UIColor

id __66__UIColor_ChatKitAdditions__dynamicColorWithLightColor_darkColor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id *v4;

  v3 = objc_msgSend(a2, "userInterfaceStyle");
  v4 = (id *)(a1 + 40);
  if (v3 != 2)
    v4 = (id *)(a1 + 32);
  return *v4;
}

@end
