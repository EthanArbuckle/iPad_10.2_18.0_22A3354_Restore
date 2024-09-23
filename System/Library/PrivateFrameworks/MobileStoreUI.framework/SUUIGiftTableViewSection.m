@implementation SUUIGiftTableViewSection

- (SUUIGiftTableViewSection)initWithGiftConfiguration:(id)a3
{
  id v5;
  SUUIGiftTableViewSection *v6;
  SUUIGiftTableViewSection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIGiftTableViewSection;
  v6 = -[SUUIGiftTableViewSection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_giftConfiguration, a3);

  return v7;
}

+ (id)aloneRowBackgroundImageWithSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CGContext *CurrentContext;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  height = a3.height;
  width = a3.width;
  UIGraphicsBeginImageContextWithOptions(a3, 1, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.921568627, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "set");

  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.width = width;
  v15.size.height = height;
  UIRectFill(v15);
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = width;
  v16.size.height = height;
  v17 = CGRectInset(v16, 1.0, 1.0);
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height, 7.5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CGContextSaveGState(CurrentContext);
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "set");

  objc_msgSend(v7, "addClip");
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = width;
  v18.size.height = height;
  UIRectFill(v18);
  CGContextRestoreGState(CurrentContext);
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = width;
  v19.size.height = height;
  v20 = CGRectInset(v19, 0.5, 0.5);
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", v20.origin.x, v20.origin.y + 1.0, v20.size.width, v20.size.height + -3.0, 7.5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.929411765, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "set");

  objc_msgSend(v9, "stroke");
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = width;
  v21.size.height = height;
  v22 = CGRectInset(v21, 0.5, 0.5);
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height + -2.0, 7.5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.737254902, 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "set");

  objc_msgSend(v11, "stroke");
  UIGraphicsGetImageFromCurrentImageContext();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v13;
}

- (SUUIGiftConfiguration)giftConfiguration
{
  return self->_giftConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_giftConfiguration, 0);
}

@end
