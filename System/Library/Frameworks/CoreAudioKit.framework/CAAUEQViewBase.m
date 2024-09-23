@implementation CAAUEQViewBase

- (_TtC12CoreAudioKit14CAAUEQViewBase)initWithFrame:(CGRect)a3
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
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit14CAAUEQViewBase_viewSetup) = 0;
  v7 = (objc_class *)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit14CAAUEQViewBase_permanentHeaderConstraints) = (Class)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit14CAAUEQViewBase_permanentGraphConstraints) = v7;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit14CAAUEQViewBase_temporaryConstraints) = v7;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit14CAAUEQViewBase____lazy_storage___headerView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit14CAAUEQViewBase____lazy_storage___graphView) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CAAUEQViewBase();
  return -[CAAUEQViewBase initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC12CoreAudioKit14CAAUEQViewBase)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2131E0C74();
}

- (void)didMoveToSuperview
{
  _TtC12CoreAudioKit14CAAUEQViewBase *v2;

  v2 = self;
  sub_2131DEB28();

}

- (void)tintColorDidChange
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CAAUEQViewBase();
  v2 = v7.receiver;
  -[CAAUEQViewBase tintColorDidChange](&v7, sel_tintColorDidChange);
  v3 = sub_2131DE974();
  v4 = objc_msgSend(v2, sel_tintColor, v7.receiver, v7.super_class);
  objc_msgSend(v3, sel_setTintColor_, v4);

  v5 = sub_2131DE8BC();
  v6 = objc_msgSend(v2, sel_tintColor);
  objc_msgSend(v5, sel_setTintColor_, v6);

}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit14CAAUEQViewBase____lazy_storage___headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit14CAAUEQViewBase____lazy_storage___graphView));
}

@end
