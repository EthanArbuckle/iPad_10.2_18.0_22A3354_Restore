@implementation EKLazyDrawingLayer

- (void)didChangeValueForKey:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("hidden")))
    -[EKLazyDrawingLayer setNeedsDisplay](self, "setNeedsDisplay");
  v5.receiver = self;
  v5.super_class = (Class)EKLazyDrawingLayer;
  -[EKLazyDrawingLayer didChangeValueForKey:](&v5, sel_didChangeValueForKey_, v4);

}

@end
