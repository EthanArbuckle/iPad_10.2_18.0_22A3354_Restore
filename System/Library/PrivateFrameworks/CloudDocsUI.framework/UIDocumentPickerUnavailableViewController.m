@implementation UIDocumentPickerUnavailableViewController

void __84___UIDocumentPickerUnavailableViewController__buttonBackgroundImageForState_traits___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  CGRect v5;
  CGRect v6;

  v2 = (void *)MEMORY[0x24BDF6870];
  v5.origin.x = *(CGFloat *)MEMORY[0x24BDBEFB0];
  v5.origin.y = *(CGFloat *)(MEMORY[0x24BDBEFB0] + 8);
  v5.size.width = *(CGFloat *)(a1 + 32);
  v5.size.height = *(CGFloat *)(a1 + 40);
  v6 = CGRectInset(v5, 0.5, 0.5);
  objc_msgSend(v2, "bezierPathWithRoundedRect:cornerRadius:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height, 3.0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineWidth:", 1.0);
  v3 = *(_QWORD *)(a1 + 48);
  if (v3 == 1)
  {
    objc_msgSend(v4, "fill");
  }
  else if (!v3)
  {
    objc_msgSend(v4, "stroke");
  }

}

@end
