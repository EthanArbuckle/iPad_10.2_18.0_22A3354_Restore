@implementation FIUIDividerViewRoundedCornerImage

void __FIUIDividerViewRoundedCornerImage_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  CGSize v7;

  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRect:", 0.0, 0.0, 3.5, 1.5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 3.5, 1.5, 0.75);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.2, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7.width = 3.5;
  v7.height = 1.5;
  UIGraphicsBeginImageContextWithOptions(v7, 1, 0.0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFill");

  objc_msgSend(v6, "fill");
  objc_msgSend(v1, "setFill");
  objc_msgSend(v0, "fill");
  UIGraphicsGetImageFromCurrentImageContext();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v3, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, 1.5, 0.0, 1.5);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)FIUIDividerViewRoundedCornerImage_image;
  FIUIDividerViewRoundedCornerImage_image = v4;

}

@end
