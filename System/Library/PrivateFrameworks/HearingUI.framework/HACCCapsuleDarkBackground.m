@implementation HACCCapsuleDarkBackground

- (void)setupBackgroundVisualStyle
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__HACCCapsuleDarkBackground_setupBackgroundVisualStyle__block_invoke;
  block[3] = &unk_24DD60E68;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __55__HACCCapsuleDarkBackground_setupBackgroundVisualStyle__block_invoke(uint64_t a1)
{
  id v2;

  HUICCBackgroundVisualStylingProviderForCategory(2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_automaticallyUpdateView:withStyleNamed:andObserverBlock:", *(_QWORD *)(a1 + 32), CFSTR("moduleListTint"), 0);

}

@end
