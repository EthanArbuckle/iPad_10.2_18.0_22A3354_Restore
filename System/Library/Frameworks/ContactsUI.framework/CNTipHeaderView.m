@implementation CNTipHeaderView

- (BOOL)displaysBottomSeparator
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_displaysBottomSeparator;
  swift_beginAccess();
  return *v2;
}

- (void)setDisplaysBottomSeparator:(BOOL)a3
{
  BOOL *v5;
  _TtC10ContactsUI15CNTipHeaderView *v6;

  v5 = (BOOL *)self + OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_displaysBottomSeparator;
  swift_beginAccess();
  *v5 = a3;
  v6 = self;
  sub_18AD6CD14();

}

- (UIView)hostingView
{
  return (UIView *)sub_18ACB1AEC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_hostingView);
}

- (void)setHostingView:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  _TtC10ContactsUI15CNTipHeaderView *v8;

  v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_hostingView);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  sub_18AD6D2E0();
}

+ (double)verticalInsetTotal
{
  return 32.0;
}

- (_TtC10ContactsUI15CNTipHeaderView)initWithFrame:(CGRect)a3 separatorInset:(UIEdgeInsets)a4
{
  return (_TtC10ContactsUI15CNTipHeaderView *)CNTipHeaderView.init(frame:separatorInset:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.top, a4.left, a4.bottom, a4.right);
}

- (_TtC10ContactsUI15CNTipHeaderView)initWithCoder:(id)a3
{
  _OWORD *v4;
  __int128 v5;
  id v6;
  _TtC10ContactsUI15CNTipHeaderView *result;

  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_separatorEdgeInset);
  v5 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  *v4 = *MEMORY[0x1E0DC49E8];
  v4[1] = v5;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_bottomSeparatorView) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_displaysBottomSeparator) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_hostingView) = 0;
  v6 = a3;

  result = (_TtC10ContactsUI15CNTipHeaderView *)sub_18AF50310();
  __break(1u);
  return result;
}

- (_TtC10ContactsUI15CNTipHeaderView)initWithFrame:(CGRect)a3
{
  _TtC10ContactsUI15CNTipHeaderView *result;

  result = (_TtC10ContactsUI15CNTipHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_bottomSeparatorView));

}

@end
