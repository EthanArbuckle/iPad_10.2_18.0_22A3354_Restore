@implementation ClearButtonImageColor

void __ClearButtonImageColor_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0DC3658];
  EventKitUIBundle();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("ClearButtonImageColor"), v3, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)ClearButtonImageColor__color;
  ClearButtonImageColor__color = v1;

}

@end
