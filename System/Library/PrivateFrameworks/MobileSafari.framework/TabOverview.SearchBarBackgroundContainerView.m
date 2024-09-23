@implementation TabOverview.SearchBarBackgroundContainerView

- (_TtCC12MobileSafari11TabOverview32SearchBarBackgroundContainerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v7;
  uint64_t v8;
  _TtCC12MobileSafari11TabOverview32SearchBarBackgroundContainerView *v9;
  id v10;
  _TtCC12MobileSafari11TabOverview32SearchBarBackgroundContainerView *v11;
  objc_super v13;
  _OWORD v14[6];
  uint64_t v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = OBJC_IVAR____TtCC12MobileSafari11TabOverview32SearchBarBackgroundContainerView_backgroundView;
  v8 = qword_1EDFE8CF0;
  v9 = self;
  if (v8 != -1)
    swift_once();
  v14[4] = xmmword_1EE007C80;
  v14[5] = *(_OWORD *)&qword_1EE007C90;
  v15 = qword_1EE007CA0;
  v14[0] = xmmword_1EE007C40;
  v14[1] = xmmword_1EE007C50;
  v14[2] = xmmword_1EE007C60;
  v14[3] = xmmword_1EE007C70;
  v10 = objc_allocWithZone((Class)_s17BarBackgroundViewCMa());
  sub_18B8D0EC0((uint64_t)v14);
  *(Class *)((char *)&v9->super.super.super.super.super.isa + v7) = (Class)sub_18B9028F4((uint64_t)v14);

  v13.receiver = v9;
  v13.super_class = (Class)type metadata accessor for TabOverview.SearchBarBackgroundContainerView();
  v11 = -[SFFluidTabOverviewReusableView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  objc_msgSend(*(id *)((char *)&v11->super.super.super.super.super.isa+ OBJC_IVAR____TtC12MobileSafari29SFFluidCollectionReusableView_contentView), sel_addSubview_, *(Class *)((char *)&v11->super.super.super.super.super.isa+ OBJC_IVAR____TtCC12MobileSafari11TabOverview32SearchBarBackgroundContainerView_backgroundView));
  return v11;
}

- (_TtCC12MobileSafari11TabOverview32SearchBarBackgroundContainerView)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  _TtCC12MobileSafari11TabOverview32SearchBarBackgroundContainerView *result;
  _OWORD v9[6];
  uint64_t v10;

  v4 = OBJC_IVAR____TtCC12MobileSafari11TabOverview32SearchBarBackgroundContainerView_backgroundView;
  v5 = qword_1EDFE8CF0;
  v6 = a3;
  if (v5 != -1)
    swift_once();
  v9[4] = xmmword_1EE007C80;
  v9[5] = *(_OWORD *)&qword_1EE007C90;
  v10 = qword_1EE007CA0;
  v9[0] = xmmword_1EE007C40;
  v9[1] = xmmword_1EE007C50;
  v9[2] = xmmword_1EE007C60;
  v9[3] = xmmword_1EE007C70;
  v7 = objc_allocWithZone((Class)_s17BarBackgroundViewCMa());
  sub_18B8D0EC0((uint64_t)v9);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)sub_18B9028F4((uint64_t)v9);

  result = (_TtCC12MobileSafari11TabOverview32SearchBarBackgroundContainerView *)sub_18BAC18C4();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TabOverview.SearchBarBackgroundContainerView();
  v2 = (char *)v7.receiver;
  -[TabOverview.SearchBarBackgroundContainerView layoutSubviews](&v7, sel_layoutSubviews);
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC12MobileSafari29SFFluidCollectionReusableView_contentView], sel_bounds, v7.receiver, v7.super_class);
  sub_18B904B24(v3, v4, v5, v6);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabOverview32SearchBarBackgroundContainerView_backgroundView));
}

@end
