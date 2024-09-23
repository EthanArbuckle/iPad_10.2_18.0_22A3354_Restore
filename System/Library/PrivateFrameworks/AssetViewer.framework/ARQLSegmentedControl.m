@implementation ARQLSegmentedControl

+ (double)_cornerRadiusForTraitCollection:(id)a3 size:(int)a4
{
  uint64_t v4;
  id v5;
  double v6;

  v4 = qword_1F01C3028;
  v5 = a3;
  if (v4 != -1)
    swift_once();
  v6 = *(double *)&qword_1F01C71F8;

  return v6;
}

+ (double)_sectionIndicatorInsetForTraitCollection:(id)a3 size:(int)a4
{
  return 2.0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1D94A7D10(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_1D94A7AA8);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_1D94A7D10(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_1D94A7B94);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1D94A7D10(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_1D94A7DA8);
}

- (_TtC11AssetViewerP33_B6181FA999264CAE88B5B5263D996C2E20ARQLSegmentedControl)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self
     + OBJC_IVAR____TtC11AssetViewerP33_B6181FA999264CAE88B5B5263D996C2E20ARQLSegmentedControl_currentState;
  *(_QWORD *)v7 = 0;
  v7[8] = 0;
  *((_QWORD *)v7 + 2) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ARQLSegmentedControl();
  return -[ARQLSegmentedControl initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11AssetViewerP33_B6181FA999264CAE88B5B5263D996C2E20ARQLSegmentedControl)initWithCoder:(id)a3
{
  char *v4;
  objc_super v6;

  v4 = (char *)self
     + OBJC_IVAR____TtC11AssetViewerP33_B6181FA999264CAE88B5B5263D996C2E20ARQLSegmentedControl_currentState;
  *(_QWORD *)v4 = 0;
  v4[8] = 0;
  *((_QWORD *)v4 + 2) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ARQLSegmentedControl();
  return -[ARQLSegmentedControl initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (_TtC11AssetViewerP33_B6181FA999264CAE88B5B5263D996C2E20ARQLSegmentedControl)initWithItems:(id)a3
{
  char *v4;
  void *v5;
  char *v6;
  _TtC11AssetViewerP33_B6181FA999264CAE88B5B5263D996C2E20ARQLSegmentedControl *v7;
  objc_super v9;

  if (a3)
  {
    sub_1D94D3124();
    v4 = (char *)self
       + OBJC_IVAR____TtC11AssetViewerP33_B6181FA999264CAE88B5B5263D996C2E20ARQLSegmentedControl_currentState;
    *(_QWORD *)v4 = 0;
    v4[8] = 0;
    *((_QWORD *)v4 + 2) = 0;
    v5 = (void *)sub_1D94D3118();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
    v6 = (char *)self
       + OBJC_IVAR____TtC11AssetViewerP33_B6181FA999264CAE88B5B5263D996C2E20ARQLSegmentedControl_currentState;
    *(_QWORD *)v6 = 0;
    v6[8] = 0;
    *((_QWORD *)v6 + 2) = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ARQLSegmentedControl();
  v7 = -[ARQLSegmentedControl initWithItems:](&v9, sel_initWithItems_, v5);

  return v7;
}

@end
