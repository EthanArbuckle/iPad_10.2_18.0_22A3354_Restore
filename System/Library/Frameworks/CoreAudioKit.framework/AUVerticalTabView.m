@implementation AUVerticalTabView

- (_TtC12CoreAudioKit17AUVerticalTabView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit17AUVerticalTabView_horizontal) = 0;
  v7 = (objc_class *)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit17AUVerticalTabView_tabs) = (Class)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit17AUVerticalTabView_accessibleElements) = v7;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit17AUVerticalTabView_selectedTabIndex) = (Class)-1;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit17AUVerticalTabView_numActiveTabs) = (Class)1;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit17AUVerticalTabView_maxTabDimension) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit17AUVerticalTabView_tabDimension) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AUVerticalTabView();
  return -[AUVerticalTabView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC12CoreAudioKit17AUVerticalTabView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit17AUVerticalTabView *)sub_213176FBC(a3);
}

- (NSArray)accessibilityElements
{
  _TtC12CoreAudioKit17AUVerticalTabView *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_2131777F0();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_2131E1B00();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_213178890(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesBegan_withEvent_);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_213178890(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesMoved_withEvent_);
}

- (void)layoutSubviews
{
  _TtC12CoreAudioKit17AUVerticalTabView *v2;

  v2 = self;
  sub_21317898C();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
