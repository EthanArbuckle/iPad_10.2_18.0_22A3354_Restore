@implementation SFToolbar

uint64_t __37___SFToolbar__deviceSupportsMinibars__block_invoke()
{
  void *v0;
  BOOL v1;
  uint64_t result;
  CGRect v3;

  if (MGGetBoolAnswer() && MGGetBoolAnswer())
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "_referenceBounds");
    v1 = CGRectGetWidth(v3) <= 375.0;

  }
  else
  {
    v1 = 1;
  }
  result = _SFDeviceIsPad();
  _deviceSupportsMinibars_deviceSupportsMinibars = v1 & ~(_BYTE)result;
  return result;
}

void __117___SFToolbar_animateLinkImage_fromRect_inView_toBarItem_afterImageDisappearsBlock_afterDestinationLayerBouncesBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  if (*(_QWORD *)(a1 + 40))
    dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 40));
}

@end
