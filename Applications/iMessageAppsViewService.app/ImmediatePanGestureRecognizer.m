@implementation ImmediatePanGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ImmediatePanGestureRecognizer;
  -[ImmediatePanGestureRecognizer touchesBegan:withEvent:](&v5, "touchesBegan:withEvent:", a3, a4);
  -[ImmediatePanGestureRecognizer setState:](self, "setState:", 1);
}

- (void)finishCurrentInteraction
{
  -[ImmediatePanGestureRecognizer setState:](self, "setState:", 3);
}

@end
