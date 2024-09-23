@implementation IMBWebURLView

- (_TtC8Business13IMBWebURLView)init
{
  return (_TtC8Business13IMBWebURLView *)sub_10007DA30();
}

- (_TtC8Business13IMBWebURLView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _TtC8Business13IMBWebURLView *result;

  v5 = OBJC_IVAR____TtC8Business13IMBWebURLView_domainLabel;
  v6 = objc_allocWithZone((Class)UILabel);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  v8 = OBJC_IVAR____TtC8Business13IMBWebURLView_separator;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  v9 = (char *)self + OBJC_IVAR____TtC8Business13IMBWebURLView_navigationURL;
  v10 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);

  result = (_TtC8Business13IMBWebURLView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000B3DA0, "Business/IMBWebURLView.swift", 28, 2, 36, 0);
  __break(1u);
  return result;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)handleLongPress
{
  void *v3;
  _TtC8Business13IMBWebURLView *v4;
  id v5;

  v3 = (void *)objc_opt_self(UIMenuController);
  v4 = self;
  v5 = objc_msgSend(v3, "sharedMenuController");
  -[IMBWebURLView becomeFirstResponder](v4, "becomeFirstResponder");
  -[IMBWebURLView bounds](v4, "bounds");
  objc_msgSend(v5, "showMenuFromView:rect:", v4);

}

- (void)copy:(id)a3
{
  _TtC8Business13IMBWebURLView *v5;
  _TtC8Business13IMBWebURLView *v6;
  _OWORD v7[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v7);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    v6 = self;
  }
  sub_10007EDA4();

  sub_100010A98((uint64_t)v7, (uint64_t *)&unk_1000EEB60);
}

- (_TtC8Business13IMBWebURLView)initWithFrame:(CGRect)a3
{
  _TtC8Business13IMBWebURLView *result;

  result = (_TtC8Business13IMBWebURLView *)_swift_stdlib_reportUnimplementedInitializer("Business.IMBWebURLView", 22, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_100010A98((uint64_t)self + OBJC_IVAR____TtC8Business13IMBWebURLView_navigationURL, (uint64_t *)&unk_1000ED480);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  _TtC8Business13IMBWebURLView *v7;
  _TtC8Business13IMBWebURLView *v8;
  uint64_t v9;
  unsigned __int8 v10;
  _TtC8Business13IMBWebURLView *v11;

  v6 = a3;
  v7 = (_TtC8Business13IMBWebURLView *)a4;
  v8 = self;
  if (sub_10002DA10() == 2)
  {
    v9 = objc_opt_self(UIHoverGestureRecognizer);
    v10 = swift_dynamicCastObjCClass(v6, v9) != 0;
  }
  else
  {
    v11 = (_TtC8Business13IMBWebURLView *)objc_msgSend((id)objc_opt_self(UIMenuController), "sharedMenuController");
    v10 = -[IMBWebURLView canPerformAction:withSender:](v8, "canPerformAction:withSender:", "copy:", v11);

    v7 = v8;
    v8 = v11;
  }

  return v10;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtC8Business13IMBWebURLView *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_10007F4F0();

  return v7;
}

- (id)toolTipInteraction:(id)a3 configurationAtPoint:(CGPoint)a4
{
  id v5;
  _TtC8Business13IMBWebURLView *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_10007F5E4();

  return v7;
}

@end
