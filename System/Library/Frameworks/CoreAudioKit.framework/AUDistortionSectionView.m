@implementation AUDistortionSectionView

- (UIColor)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AUDistortionSectionView();
  return -[AUDistortionSectionView tintColor](&v3, sel_tintColor);
}

- (void)setTintColor:(id)a3
{
  _TtC12CoreAudioKit23AUDistortionSectionView *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_2131DE70C((uint64_t)a3);

}

- (_TtC12CoreAudioKit23AUDistortionSectionView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit23AUDistortionSectionView *)sub_2131DA188(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit23AUDistortionSectionView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2131DE7E4();
}

- (void)parameterChangedWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC12CoreAudioKit23AUDistortionSectionView *v9;
  uint64_t v10;

  v4 = sub_2131E18CC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2131E18B4();
  v9 = self;
  sub_2131DAE5C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit23AUDistortionSectionView_visualizationView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit23AUDistortionSectionView_controlsView));
  sub_21317BC98((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit23AUDistortionSectionView_dataSource, &qword_254B885E8);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit23AUDistortionSectionView_audioUnit));
  swift_bridgeObjectRelease();
}

@end
