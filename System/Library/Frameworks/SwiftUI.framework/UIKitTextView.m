@implementation UIKitTextView

- (BOOL)becomeFirstResponder
{
  id v2;
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UIKitTextView();
  v2 = v5.receiver;
  v3 = -[UIKitTextView becomeFirstResponder](&v5, sel_becomeFirstResponder);
  if (v3)
    UIKitTextView.enqueueScrollIfNeeded()();

  return v3;
}

- (_TtC7SwiftUI13UIKitTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
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
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI13UIKitTextView_didShowObserver) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI13UIKitTextView_willHideObserver) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for UIKitTextView();
  return -[UIKitTextView initWithFrame:textContainer:](&v10, sel_initWithFrame_textContainer_, a4, x, y, width, height);
}

- (_TtC7SwiftUI13UIKitTextView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI13UIKitTextView_didShowObserver) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI13UIKitTextView_willHideObserver) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UIKitTextView();
  return -[UIKitTextView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
