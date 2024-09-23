@implementation AMSUIWebCameraTextField

- (AMSUIWebCameraTextField)initWithFrame:(CGRect)a3
{
  AMSUIWebCameraTextField *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSUIWebCameraTextField;
  v3 = -[AMSUIWebCameraTextField initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebCameraTextField setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[AMSUIWebCameraTextField setOpaque:](v3, "setOpaque:", 1);
  }
  return v3;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double width;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)AMSUIWebCameraTextField;
  -[AMSUIWebCameraTextField editingRectForBounds:](&v8, sel_editingRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = width + -30.0;
  v7 = 15.0;
  result.size.height = v5;
  result.size.width = v6;
  result.origin.y = v4;
  result.origin.x = v7;
  return result;
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  double width;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)AMSUIWebCameraTextField;
  -[AMSUIWebCameraTextField placeholderRectForBounds:](&v8, sel_placeholderRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = width + -30.0;
  v7 = 15.0;
  result.size.height = v5;
  result.size.width = v6;
  result.origin.y = v4;
  result.origin.x = v7;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double width;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)AMSUIWebCameraTextField;
  -[AMSUIWebCameraTextField textRectForBounds:](&v8, sel_textRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = width + -30.0;
  v7 = 15.0;
  result.size.height = v5;
  result.size.width = v6;
  result.origin.y = v4;
  result.origin.x = v7;
  return result;
}

@end
