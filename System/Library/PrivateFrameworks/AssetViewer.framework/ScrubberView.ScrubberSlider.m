@implementation ScrubberView.ScrubberSlider

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  _TtCC11AssetViewer12ScrubberView14ScrubberSlider *v6;

  v6 = self;
  sub_1D940EDB4(a4, a3);

}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtCC11AssetViewer12ScrubberView14ScrubberSlider *v9;
  double v10;
  double v11;
  CGFloat v12;
  double MinX;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = self;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  CGRectGetMidY(v18);
  UIFloorToViewScale();
  v11 = v10;
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v12 = (CGRectGetWidth(v19) + -8.0) * a5;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  MinX = CGRectGetMinX(v20);

  v14 = MinX + v12;
  v15 = 9.0;
  v16 = 9.0;
  v17 = v11;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v17;
  result.origin.x = v14;
  return result;
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtCC11AssetViewer12ScrubberView14ScrubberSlider *v7;
  CGFloat MinX;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  MinX = CGRectGetMinX(v15);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v9 = CGRectGetMidY(v16) + -2.5;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v10 = CGRectGetWidth(v17);

  v11 = 5.0;
  v12 = MinX;
  v13 = v9;
  v14 = v10;
  result.size.height = v11;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)createThumbView
{
  _TtCC11AssetViewer12ScrubberView14ScrubberSlider *v2;
  void *v3;

  v2 = self;
  v3 = sub_1D940F030();

  return v3;
}

- (void)tintColorDidChange
{
  char *v2;
  void *v3;
  char *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ScrubberView.ScrubberSlider();
  v2 = (char *)v6.receiver;
  -[ScrubberView.ScrubberSlider tintColorDidChange](&v6, sel_tintColorDidChange);
  v3 = *(void **)&v2[OBJC_IVAR____TtCC11AssetViewer12ScrubberView14ScrubberSlider_sliderThumbView];
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v2, sel_thumbTintColor, v6.receiver, v6.super_class);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);

    v2 = v4;
  }

}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  _TtCC11AssetViewer12ScrubberView14ScrubberSlider *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  LOBYTE(a4) = sub_1D940F1FC(v6, (uint64_t)a4);

  return a4 & 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  _TtCC11AssetViewer12ScrubberView14ScrubberSlider *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  LOBYTE(a4) = sub_1D940F31C(v6, (uint64_t)a4);

  return a4 & 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v7;
  id v8;
  _TtCC11AssetViewer12ScrubberView14ScrubberSlider *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_1D940F4D8(a3, (uint64_t)a4);

}

- (void)cancelTrackingWithEvent:(id)a3
{
  id v4;
  _BYTE *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ScrubberView.ScrubberSlider();
  v4 = a3;
  v5 = v10.receiver;
  -[ScrubberView.ScrubberSlider cancelTrackingWithEvent:](&v10, sel_cancelTrackingWithEvent_, v4);
  v6 = &v5[OBJC_IVAR____TtCC11AssetViewer12ScrubberView14ScrubberSlider_trackedLocationOfTouch];
  v7 = *(_QWORD *)&v5[OBJC_IVAR____TtCC11AssetViewer12ScrubberView14ScrubberSlider_trackedLocationOfTouch];
  v8 = *(_QWORD *)&v5[OBJC_IVAR____TtCC11AssetViewer12ScrubberView14ScrubberSlider_trackedLocationOfTouch + 8];
  v9 = v5[OBJC_IVAR____TtCC11AssetViewer12ScrubberView14ScrubberSlider_trackedLocationOfTouch + 16];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  sub_1D940EBFC(v7, v8, v9);
  v5[OBJC_IVAR____TtCC11AssetViewer12ScrubberView14ScrubberSlider_thumbShouldReturnToTouch] = 0;

}

- (_TtCC11AssetViewer12ScrubberView14ScrubberSlider)initWithFrame:(CGRect)a3
{
  return (_TtCC11AssetViewer12ScrubberView14ScrubberSlider *)sub_1D940F6D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC11AssetViewer12ScrubberView14ScrubberSlider)initWithCoder:(id)a3
{
  return (_TtCC11AssetViewer12ScrubberView14ScrubberSlider *)sub_1D940F7C8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC11AssetViewer12ScrubberView14ScrubberSlider_sliderThumbView));
}

@end
