@implementation FM

uint64_t __58__FM_Workaround_30408319_Button_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidateIntrinsicContentSize");
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

@end
