@implementation SFSafariIconLinkImage

void ___SFSafariIconLinkImage_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  id v11;
  CGSize v12;

  v12.width = 66.0;
  v12.height = 66.0;
  UIGraphicsBeginImageContextWithOptions(v12, 0, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 66.0, 66.0, 3.0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.874509804, 0.874509804, 0.874509804, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setFill");

  objc_msgSend(v11, "fill");
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4B50], 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC4918]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "configurationWithTraitCollection:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("safari"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.152941176, 0.450980392, 0.858823529, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithTintColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "size");
  objc_msgSend(v6, "drawAtPoint:", (66.0 - v7) * 0.5, (66.0 - v8) * 0.5);
  UIGraphicsGetImageFromCurrentImageContext();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)_SFSafariIconLinkImage::image;
  _SFSafariIconLinkImage::image = v9;

  UIGraphicsEndImageContext();
}

@end
