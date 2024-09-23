@implementation UIStackView(INUICrossPlatform)

+ (id)_inui_stackViewWithArrangedSubviews:()INUICrossPlatform userInteractionEnabled:
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend([a1 alloc], "initWithArrangedSubviews:", v6);

  objc_msgSend(v7, "setUserInteractionEnabled:", a4);
  return v7;
}

@end
