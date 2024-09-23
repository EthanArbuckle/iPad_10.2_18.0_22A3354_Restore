@implementation AXTwiceCompanionRendererView

- (void)layoutSubviews
{
  _TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView *v2;

  v2 = self;
  sub_21EC67750();

}

- (_TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView)initWithFrame:(CGRect)a3
{
  return (_TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView *)AXTwiceCompanionRendererView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView)initWithCoder:(id)a3
{
  return (_TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView *)AXTwiceCompanionRendererView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_mirroringLayer));
  sub_21EC689EC((uint64_t)self + OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_delegate);
}

- (BOOL)performAXAction:(int)a3 withValue:(id)a4 onBridgeElement:(id)a5
{
  uint64_t v6;
  id v8;
  _TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView *v9;
  id v10;
  _TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView *v11;
  BOOL v12;
  _OWORD v14[2];

  v6 = *(_QWORD *)&a3;
  if (a4)
  {
    v8 = a5;
    v9 = self;
    swift_unknownObjectRetain();
    sub_21EC7D1CC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v14, 0, sizeof(v14));
    v10 = a5;
    v11 = self;
  }
  v12 = AXTwiceCompanionRendererView.perform(_:withValue:on:)(v6, (uint64_t)v14, (uint64_t)a5);

  sub_21EC689AC((uint64_t)v14);
  return v12;
}

@end
