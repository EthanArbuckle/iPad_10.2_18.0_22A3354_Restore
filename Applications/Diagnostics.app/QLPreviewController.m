@implementation QLPreviewController

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  QLPreviewController *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)QLPreviewController;
  v4 = self;
  -[QLPreviewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
  sub_1000D215C();

}

@end
