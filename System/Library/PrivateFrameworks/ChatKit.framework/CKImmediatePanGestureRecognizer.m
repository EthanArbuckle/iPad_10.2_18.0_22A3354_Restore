@implementation CKImmediatePanGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKImmediatePanGestureRecognizer;
  -[CKImmediatePanGestureRecognizer touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  -[CKImmediatePanGestureRecognizer setState:](self, "setState:", 1);
}

- (void)finishCurrentInteraction
{
  -[CKImmediatePanGestureRecognizer setState:](self, "setState:", 3);
}

@end
