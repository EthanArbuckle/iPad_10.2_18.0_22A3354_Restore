@implementation CCUIMenuModuleStackView

- (void)layoutSubviews
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __41__CCUIMenuModuleStackView_layoutSubviews__block_invoke;
  v2[3] = &unk_1E8E20590;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

id __41__CCUIMenuModuleStackView_layoutSubviews__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)CCUIMenuModuleStackView;
  return objc_msgSendSuper2(&v2, sel_layoutSubviews);
}

@end
