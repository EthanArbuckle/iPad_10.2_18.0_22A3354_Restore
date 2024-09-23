@implementation TabOverview.ItemView

- (_TtCC12MobileSafari11TabOverview8ItemView)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari11TabOverview8ItemView *)sub_18B8B8324(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC12MobileSafari11TabOverview8ItemView)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  objc_super v7;

  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtCC12MobileSafari11TabOverview8ItemView_closeHandler);
  *v4 = CGRectMake;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtCC12MobileSafari11TabOverview8ItemView_unpinHandler);
  *v5 = CGRectMake;
  v5[1] = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TabOverview.ItemView();
  return -[SFFluidTabOverviewReusableView initWithCoder:](&v7, sel_initWithCoder_, a3);
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TabOverview.ItemView();
  v2 = v3.receiver;
  -[TabOverview.ItemView layoutSubviews](&v3, sel_layoutSubviews);
  sub_18B8B8780();

}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
