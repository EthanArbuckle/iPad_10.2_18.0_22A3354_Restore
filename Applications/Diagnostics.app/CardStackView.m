@implementation CardStackView

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _TtC11Diagnostics13CardStackView *v7;
  _QWORD v8[5];
  uint64_t v9;

  v3 = swift_allocObject(&unk_100139798, 24, 7);
  *(_QWORD *)(v3 + 16) = self;
  v4 = (void *)objc_opt_self(UIView);
  v8[4] = sub_10008F420;
  v9 = v3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_100030658;
  v8[3] = &unk_1001397B0;
  v5 = _Block_copy(v8);
  v6 = v9;
  v7 = self;
  swift_retain(v3);
  swift_release(v6);
  objc_msgSend(v4, "animateWithDuration:delay:options:animations:completion:", 1, v5, 0, 0.25, 0.0);
  _Block_release(v5);

  swift_release(v3);
}

- (void)addArrangedSubview:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  SEL v17;
  id v18;
  int v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _TtC11Diagnostics13CardStackView *v24;

  v4 = a3;
  v24 = self;
  v5 = -[CardStackView arrangedSubviews](v24, "arrangedSubviews");
  v6 = sub_10008F2B8();
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);

  if ((unint64_t)v7 >> 62)
  {
    if (v7 < 0)
      v16 = v7;
    else
      v16 = v7 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v7);
    v15 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease((DARootViewController *)v7, v17, v18, v19, v20, v21, v22, v23);
  }
  else
  {
    v15 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease((DARootViewController *)v7, v8, v9, v10, v11, v12, v13, v14);
  sub_10008D7DC(v4, v15, 0);

}

- (void)insertArrangedSubview:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  _TtC11Diagnostics13CardStackView *v7;

  v6 = a3;
  v7 = self;
  sub_10008D7DC(v6, a4, 0);

}

- (void)removeArrangedSubview:(id)a3
{
  id v4;
  _TtC11Diagnostics13CardStackView *v5;

  v4 = a3;
  v5 = self;
  sub_10008D9A8(v4, 0);

}

- (_TtC11Diagnostics13CardStackView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC11Diagnostics13CardStackView_layoutUpdateHandler);
  *v7 = 0;
  v7[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11Diagnostics13CardStackView_heightConstraints) = (Class)&_swiftEmptyArrayStorage;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CardStackView();
  return -[BaseStackView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC11Diagnostics13CardStackView)initWithCoder:(id)a3
{
  _QWORD *v4;
  objc_super v6;

  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC11Diagnostics13CardStackView_layoutUpdateHandler);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11Diagnostics13CardStackView_heightConstraints) = (Class)&_swiftEmptyArrayStorage;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CardStackView();
  return -[BaseStackView initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  SEL v3;
  id v4;
  int v5;
  id v6;
  id v7;
  id v8;
  id v9;

  sub_100035D74(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC11Diagnostics13CardStackView_layoutUpdateHandler), *(_QWORD *)&self->layoutUpdateHandler[OBJC_IVAR____TtC11Diagnostics13CardStackView_layoutUpdateHandler]);
  swift_bridgeObjectRelease(*(DARootViewController **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC11Diagnostics13CardStackView_heightConstraints), v3, v4, v5, v6, v7, v8, v9);
}

@end
