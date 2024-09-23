@implementation AUVerticalSegmentControl

- (_TtC12CoreAudioKit24AUVerticalSegmentControl)initWithFrame:(CGRect)a3
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
  v7 = (objc_class *)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit24AUVerticalSegmentControl_items) = (Class)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit24AUVerticalSegmentControl_accessibleElements) = v7;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit24AUVerticalSegmentControl_columnCount) = (Class)1;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit24AUVerticalSegmentControl_selectedSegmentIndex) = (Class)-1;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit24AUVerticalSegmentControl_segmentHeight) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AUVerticalSegmentControl();
  return -[AUVerticalSegmentControl initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC12CoreAudioKit24AUVerticalSegmentControl)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit24AUVerticalSegmentControl *)sub_21316799C(a3);
}

- (NSArray)accessibilityElements
{
  _TtC12CoreAudioKit24AUVerticalSegmentControl *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_213168184();

  if (v3)
  {
    v4 = (void *)sub_2131E1B00();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)removeFromSuperview
{
  void *v3;
  _TtC12CoreAudioKit24AUVerticalSegmentControl *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for AUVerticalSegmentControl();
  -[AUVerticalSegmentControl removeFromSuperview](&v6, sel_removeFromSuperview);

}

- (void)segmentSelectionChangedWithNotification:(id)a3
{
  sub_2131695C8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_213168BD0);
}

- (void)segmentEnabledChangedWithNotification:(id)a3
{
  sub_2131695C8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_213168F10);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC12CoreAudioKit24AUVerticalSegmentControl *v8;

  sub_21316A930(0, &qword_254B88030);
  sub_21316A7C0();
  v6 = sub_2131E1B9C();
  v7 = a4;
  v8 = self;
  sub_213169668(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  _TtC12CoreAudioKit24AUVerticalSegmentControl *v7;
  id v8;
  void *v9;
  void *v10;
  CGFloat v11;
  double v12;
  void *v13;
  objc_super v14;

  sub_21316A930(0, &qword_254B88030);
  sub_21316A7C0();
  v6 = sub_2131E1B9C();
  v7 = self;
  v8 = a4;
  v9 = (void *)sub_2131CCBD4(v6);
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, sel_locationInView_, v7);
    sub_213168908(v11, v12);

  }
  v13 = (void *)sub_2131E1B90();
  v14.receiver = v7;
  v14.super_class = (Class)type metadata accessor for AUVerticalSegmentControl();
  -[AUVerticalSegmentControl touchesMoved:withEvent:](&v14, sel_touchesMoved_withEvent_, v13, v8);

  swift_bridgeObjectRelease();
}

- (void)layoutSubviews
{
  _TtC12CoreAudioKit24AUVerticalSegmentControl *v2;

  v2 = self;
  sub_213169D90();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
