@implementation _UIAnimatedTextView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for _UIAnimatedTextView();
  v7 = v13.receiver;
  v8 = a4;
  v9 = -[_UIAnimatedTextView hitTest:withEvent:](&v13, "hitTest:withEvent:", v8, x, y);
  if (v9)
  {
    v10 = v9;
    sub_1000096AC(0, (unint64_t *)&unk_10009A380, UIView_ptr);
    v11 = v7;
    v7 = v10;
    LOBYTE(v10) = static NSObject.== infix(_:_:)(v7, v11);

    if ((v10 & 1) == 0)
      return v7;
  }
  else
  {

  }
  v7 = 0;
  return v7;
}

- (_TtC19FontPickerUIServiceP33_364789B77C608B517795CE5B8DEADC4419_UIAnimatedTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
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
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC19FontPickerUIServiceP33_364789B77C608B517795CE5B8DEADC4419_UIAnimatedTextView_shouldAnimate) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for _UIAnimatedTextView();
  return -[_UIAnimatedTextView initWithFrame:textContainer:](&v10, "initWithFrame:textContainer:", a4, x, y, width, height);
}

- (_TtC19FontPickerUIServiceP33_364789B77C608B517795CE5B8DEADC4419_UIAnimatedTextView)initWithCoder:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC19FontPickerUIServiceP33_364789B77C608B517795CE5B8DEADC4419_UIAnimatedTextView_shouldAnimate) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _UIAnimatedTextView();
  return -[_UIAnimatedTextView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
