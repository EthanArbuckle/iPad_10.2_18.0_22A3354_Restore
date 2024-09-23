@implementation VFXView(Generative_Playground)

- (void)vfx_setClearBackground
{
  id v2;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setBackgroundColor:", v2);

}

- (uint64_t)vfx_resetColorSpace
{
  return objc_msgSend(a1, "_vfx_setColorSpace:", 0);
}

- (void)vfx_setExtendedLinearSRGBColorSpace
{
  CGColorSpace *v2;

  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF270]);
  objc_msgSend(a1, "_vfx_setColorSpace:", v2);
  CGColorSpaceRelease(v2);
}

- (void)vfx_setLinearSRGBColorSpace
{
  CGColorSpace *v2;

  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF308]);
  objc_msgSend(a1, "_vfx_setColorSpace:", v2);
  CGColorSpaceRelease(v2);
}

- (void)_vfx_setColorSpace:()Generative_Playground
{
  void *v4;
  void *v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "performSelector:withObject:", sel_setColorSpace_, a3);
    v4 = a3;
  }
  else
  {
    objc_msgSend(a1, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setColorspace:", a3);
    v4 = v5;
  }

}

@end
