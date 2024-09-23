@implementation SFBackdropEffectForBarTintStyle

void ___SFBackdropEffectForBarTintStyle_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 15);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_SFBackdropEffectForBarTintStyle_lightEffect;
  _SFBackdropEffectForBarTintStyle_lightEffect = v0;

  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 20);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_SFBackdropEffectForBarTintStyle_darkEffect;
  _SFBackdropEffectForBarTintStyle_darkEffect = v2;

}

@end
