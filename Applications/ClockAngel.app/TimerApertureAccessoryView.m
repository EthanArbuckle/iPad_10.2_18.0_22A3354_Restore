@implementation TimerApertureAccessoryView

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  double height;
  double width;
  _TtC10ClockAngel26TimerApertureAccessoryView *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = self;
  v7 = -[TimerApertureAccessoryView subviews](v6, "subviews");
  v8 = sub_100015494(0, (unint64_t *)&unk_1000B2E50, UIView_ptr);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, v8);

  if ((unint64_t)v9 >> 62)
  {
    if (v9 < 0)
      v18 = v9;
    else
      v18 = v9 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v9);
    v19 = _CocoaArrayWrapper.endIndex.getter(v18);
    *(_QWORD *)&v10 = swift_bridgeObjectRelease(v9).n128_u64[0];
    if (v19)
      goto LABEL_3;
LABEL_11:

    swift_bridgeObjectRelease(v9);
    v15 = 0.0;
    v17 = 0.0;
    goto LABEL_12;
  }
  if (!*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_11;
LABEL_3:
  if ((v9 & 0xC000000000000001) != 0)
  {
    v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v9);
  }
  else
  {
    if (!*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_15;
    }
    v12 = *(id *)(v9 + 32);
  }
  v13 = v12;
  swift_bridgeObjectRelease(v9);
  objc_msgSend(v13, "sizeThatFits:", width, height);
  v15 = v14;
  v17 = v16;

LABEL_12:
  v10 = v15;
  v11 = v17;
LABEL_15:
  result.height = v11;
  result.width = v10;
  return result;
}

- (_TtC10ClockAngel26TimerApertureAccessoryView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TimerApertureAccessoryView();
  return -[TimerApertureAccessoryView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC10ClockAngel26TimerApertureAccessoryView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TimerApertureAccessoryView();
  return -[TimerApertureAccessoryView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
