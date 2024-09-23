@implementation UIView(RPVideoOverlayButton)

+ (id)_srVideoOverlayButtonWithStyle:()RPVideoOverlayButton
{
  void *v4;
  uint64_t v5;
  __objc2_class **v6;

  if (a3 == 2
    || !a3
    && (objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "_graphicsQuality"),
        v4,
        v5 == 10))
  {
    v6 = off_24D15CF98;
  }
  else
  {
    v6 = off_24D15CFA0;
  }
  return (id)objc_msgSend(objc_alloc(*v6), "initWithStyle:", a3);
}

@end
