@implementation SearchTextField

- (_TtC8AppStore15SearchTextField)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore15SearchTextField *)sub_1004D5C40(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore15SearchTextField)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004D7728();
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
  _TtC8AppStore15SearchTextField *v7;
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
                + OBJC_IVAR____TtC8AppStore15SearchTextField_ghostHintLabel);
  v10.receiver = v7;
  v10.super_class = ObjectType;
  v9 = -[SearchTextField font](&v10, "font");
  objc_msgSend(v8, "setFont:", v9);

}

- (void)layoutSubviews
{
  _TtC8AppStore15SearchTextField *v2;

  v2 = self;
  sub_1004D68A4();

}

- (BOOL)resignFirstResponder
{
  _TtC8AppStore15SearchTextField *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1004D6B34();

  return v3 & 1;
}

- (void)beginFloatingCursorAtPoint:(CGPoint)a3
{
  double y;
  double x;
  _TtC8AppStore15SearchTextField *v5;

  y = a3.y;
  x = a3.x;
  v5 = self;
  sub_1004D6C14(x, y);

}

- (void)didTapWithSender:(id)a3
{
  id v4;
  _TtC8AppStore15SearchTextField *v5;

  v4 = a3;
  v5 = self;
  sub_1004D7818();

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC8AppStore15SearchTextField *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1004D6D7C((uint64_t)v4);

  return self & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->ghostHintText[OBJC_IVAR____TtC8AppStore15SearchTextField_ghostHintText]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15SearchTextField_ghostHintLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15SearchTextField_highlightView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15SearchTextField_interceptingTapGesture));
}

@end
