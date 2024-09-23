@implementation QuickReplyToMeBubbleView

- (_TtC8Business24QuickReplyToMeBubbleView)initWithCoder:(id)a3
{
  id v5;
  _TtC8Business24QuickReplyToMeBubbleView *result;

  *(_QWORD *)&self->model[OBJC_IVAR____TtC8Business24QuickReplyToMeBubbleView_delegate] = 0;
  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (_TtC8Business24QuickReplyToMeBubbleView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000B3DA0, "Business/QuickReplyToMeBubbleView.swift", 39, 2, 95, 0);
  __break(1u);
  return result;
}

- (void)tapGestureRecognized:(id)a3
{
  _TtC8Business24QuickReplyToMeBubbleView *v4;
  _TtC8Business24QuickReplyToMeBubbleView *v5;
  _TtC8Business24QuickReplyToMeBubbleView *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _TtC8Business24QuickReplyToMeBubbleView *v10;

  v4 = (_TtC8Business24QuickReplyToMeBubbleView *)a3;
  v5 = self;
  v6 = (_TtC8Business24QuickReplyToMeBubbleView *)-[QuickReplyToMeBubbleView view](v4, "view");
  if (v6)
  {
    v10 = v6;
    v7 = type metadata accessor for QuickReplyItemButton();
    v8 = (void *)swift_dynamicCastClass(v10, v7);
    if (v8)
    {
      v9 = objc_msgSend(v8, "tag");
      (*(void (**)(_QWORD, _QWORD, _QWORD, id))((char *)&v5->super.super.super.isa
                                                         + OBJC_IVAR____TtC8Business24QuickReplyToMeBubbleView_onItemSelected))(*(Class *)((char *)&v5->super.super.super.isa + OBJC_IVAR____TtC8Business24QuickReplyToMeBubbleView_model), *(_QWORD *)&v5->model[OBJC_IVAR____TtC8Business24QuickReplyToMeBubbleView_model], v5->model[OBJC_IVAR____TtC8Business24QuickReplyToMeBubbleView_model + 8], v9);
    }

    v4 = v5;
  }
  else
  {
    v10 = v5;
  }

}

- (_TtC8Business24QuickReplyToMeBubbleView)initWithFrame:(CGRect)a3
{
  _TtC8Business24QuickReplyToMeBubbleView *result;

  result = (_TtC8Business24QuickReplyToMeBubbleView *)_swift_stdlib_reportUnimplementedInitializer("Business.QuickReplyToMeBubbleView", 33, "init(frame:)", 12, 0, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8Business24QuickReplyToMeBubbleView_model));
  swift_release(*(_QWORD *)&self->model[OBJC_IVAR____TtC8Business24QuickReplyToMeBubbleView_onItemSelected]);
  sub_100011A64((uint64_t)self + OBJC_IVAR____TtC8Business24QuickReplyToMeBubbleView_delegate);
}

@end
