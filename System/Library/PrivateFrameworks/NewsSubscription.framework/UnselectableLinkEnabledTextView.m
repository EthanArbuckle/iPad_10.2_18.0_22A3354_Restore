@implementation UnselectableLinkEnabledTextView

- (_TtC16NewsSubscription31UnselectableLinkEnabledTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for UnselectableLinkEnabledTextView();
  return -[UnselectableLinkEnabledTextView initWithFrame:textContainer:](&v10, sel_initWithFrame_textContainer_, a4, x, y, width, height);
}

- (_TtC16NewsSubscription31UnselectableLinkEnabledTextView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UnselectableLinkEnabledTextView();
  return -[UnselectableLinkEnabledTextView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v5;
  _TtC16NewsSubscription31UnselectableLinkEnabledTextView *v6;
  BOOL v7;
  void *v8;
  id v9;
  _TtC16NewsSubscription31UnselectableLinkEnabledTextView *v10;
  objc_super v12;

  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    v5 = a3;
    v6 = self;
  }
  else
  {
    objc_opt_self();
    v8 = (void *)swift_dynamicCastObjCClass();
    v9 = a3;
    v10 = self;
    if (!v8 || (uint64_t)objc_msgSend(v8, sel_numberOfTapsRequired) <= 1)
    {
      v12.receiver = v10;
      v12.super_class = (Class)type metadata accessor for UnselectableLinkEnabledTextView();
      v7 = -[UnselectableLinkEnabledTextView gestureRecognizerShouldBegin:](&v12, sel_gestureRecognizerShouldBegin_, v9);

      return v7;
    }
  }
  objc_msgSend(a3, sel_setEnabled_, 0);

  return 0;
}

@end
