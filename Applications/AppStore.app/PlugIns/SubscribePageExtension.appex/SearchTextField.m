@implementation SearchTextField

- (_TtC22SubscribePageExtension15SearchTextField)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension15SearchTextField *)sub_100189F1C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension15SearchTextField)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10018BA04();
}

- (UIFont)font
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  return -[SearchTextField font](&v3, "font");
}

- (void)setFont:(id)a3
{
  objc_class *ObjectType;
  id v6;
  _TtC22SubscribePageExtension15SearchTextField *v7;
  void *v8;
  UIFont *v9;
  objc_super v10;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v11.receiver = self;
  v11.super_class = ObjectType;
  v6 = a3;
  v7 = self;
  -[SearchTextField setFont:](&v11, "setFont:", v6);
  v8 = *(Class *)((char *)&v7->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension15SearchTextField_ghostHintLabel);
  v10.receiver = v7;
  v10.super_class = ObjectType;
  v9 = -[SearchTextField font](&v10, "font");
  objc_msgSend(v8, "setFont:", v9);

}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension15SearchTextField *v2;

  v2 = self;
  sub_10018AB80();

}

- (BOOL)resignFirstResponder
{
  _TtC22SubscribePageExtension15SearchTextField *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_10018AE10();

  return v3 & 1;
}

- (void)beginFloatingCursorAtPoint:(CGPoint)a3
{
  double y;
  double x;
  _TtC22SubscribePageExtension15SearchTextField *v5;

  y = a3.y;
  x = a3.x;
  v5 = self;
  sub_10018AEF0(x, y);

}

- (void)didTapWithSender:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension15SearchTextField *v5;

  v4 = a3;
  v5 = self;
  sub_10018BAF4();

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension15SearchTextField *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_10018B058((uint64_t)v4);

  return self & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->ghostHintText[OBJC_IVAR____TtC22SubscribePageExtension15SearchTextField_ghostHintText]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15SearchTextField_ghostHintLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15SearchTextField_highlightView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15SearchTextField_interceptingTapGesture));
}

@end
