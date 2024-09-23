@implementation HSPCTextField

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a4;
  if (sel_isEqual(a3, "captureTextFromCamera:"))
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)HSPCTextField;
    v7 = -[HSPCTextField canPerformAction:withSender:](&v9, "canPerformAction:withSender:", a3, v6);
  }

  return v7;
}

@end
