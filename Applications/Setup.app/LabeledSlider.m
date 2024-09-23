@implementation LabeledSlider

- (CGSize)intrinsicContentSize
{
  _TtC5Setup13LabeledSlider *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_10001D5C8();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC5Setup13LabeledSlider)initWithCoder:(id)a3
{
  id v4;
  _TtC5Setup13LabeledSlider *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Setup13LabeledSlider_labelPositionConstraints) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Setup13LabeledSlider_labelOffset) = (Class)0x4024000000000000;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Setup13LabeledSlider_thumbSize) = (Class)0x403B000000000000;
  v4 = a3;

  result = (_TtC5Setup13LabeledSlider *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x7070757320746F4ELL, 0xED0000646574726FLL, "Setup/LabeledSlider.swift", 25, 2, 101, 0);
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  _TtC5Setup13LabeledSlider *v3;

  v3 = self;
  sub_10001F0E4();

}

- (void)updateConstraints
{
  _TtC5Setup13LabeledSlider *v2;

  v2 = self;
  sub_10001E554();

}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC5Setup13LabeledSlider *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_10001E77C(x, y, width, height);
  v9 = v8;
  v11 = v10;

  v12 = 38.5;
  v13 = 4.0;
  v14 = v9;
  v15 = v11;
  result.size.height = v13;
  result.size.width = v15;
  result.origin.y = v12;
  result.origin.x = v14;
  return result;
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _TtC5Setup13LabeledSlider *v6;
  id v7;
  float v8;
  float v9;
  double v10;
  objc_super v11;

  v4 = a4;
  v6 = self;
  v7 = sub_10001EAA4(a3);
  -[LabeledSlider maximumValue](v6, "maximumValue");
  v9 = (float)(v8
             / (float)((*(_QWORD **)((char *)&v6->super.super.super.super.super.isa
                                   + OBJC_IVAR____TtC5Setup13LabeledSlider_ticks))[2]
                     - 1))
     * (float)(uint64_t)v7;
  v11.receiver = v6;
  v11.super_class = (Class)type metadata accessor for LabeledSlider();
  *(float *)&v10 = v9;
  -[LabeledSlider setValue:animated:](&v11, "setValue:animated:", v4, v10);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC5Setup13LabeledSlider *v5;

  v4 = a3;
  v5 = self;
  sub_10001F4BC();

}

- (_TtC5Setup13LabeledSlider)initWithFrame:(CGRect)a3
{
  _TtC5Setup13LabeledSlider *result;

  result = (_TtC5Setup13LabeledSlider *)_swift_stdlib_reportUnimplementedInitializer("Setup.LabeledSlider", 19, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Setup13LabeledSlider_ticks));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Setup13LabeledSlider_labels));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Setup13LabeledSlider_labelPositionConstraints));
}

@end
