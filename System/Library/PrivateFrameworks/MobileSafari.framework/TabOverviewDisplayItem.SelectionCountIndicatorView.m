@implementation TabOverviewDisplayItem.SelectionCountIndicatorView

- (_TtCC12MobileSafari22TabOverviewDisplayItem27SelectionCountIndicatorView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id v9;
  _TtCC12MobileSafari22TabOverviewDisplayItem27SelectionCountIndicatorView *v10;
  _TtCC12MobileSafari22TabOverviewDisplayItem27SelectionCountIndicatorView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC12MobileSafari22TabOverviewDisplayItem27SelectionCountIndicatorView_selectionCount) = 0;
  v8 = OBJC_IVAR____TtCC12MobileSafari22TabOverviewDisplayItem27SelectionCountIndicatorView_label;
  v9 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);

  v13.receiver = v10;
  v13.super_class = (Class)_s27SelectionCountIndicatorViewCMa();
  v11 = -[TabOverviewDisplayItem.SelectionCountIndicatorView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  sub_18B96F52C();

  return v11;
}

- (_TtCC12MobileSafari22TabOverviewDisplayItem27SelectionCountIndicatorView)initWithCoder:(id)a3
{
  return (_TtCC12MobileSafari22TabOverviewDisplayItem27SelectionCountIndicatorView *)sub_18B96F454(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari22TabOverviewDisplayItem27SelectionCountIndicatorView_label));
}

@end
