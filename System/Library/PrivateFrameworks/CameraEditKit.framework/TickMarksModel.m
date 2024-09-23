@implementation TickMarksModel

- (_TtP13CameraEditKit19TickMarksDataSource_)dataSource
{
  return (_TtP13CameraEditKit19TickMarksDataSource_ *)(id)MEMORY[0x1BCCC6008]((char *)self+ OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource, a2);
}

- (void)setDataSource:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (_TtP13CameraEditKit17TickMarksDelegate_)delegate
{
  return (_TtP13CameraEditKit17TickMarksDelegate_ *)(id)MEMORY[0x1BCCC6008]((char *)self+ OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (unint64_t)tickMarksCount
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);
}

- (void)setTickMarksCount:(unint64_t)a3
{
  _TtC13CameraEditKit14TickMarksModel *v4;

  v4 = self;
  sub_1B986A314((void *)a3, &OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);

}

- (double)tickMarkSpacing
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing);
}

- (void)setTickMarkSpacing:(double)a3
{
  _TtC13CameraEditKit14TickMarksModel *v4;

  v4 = self;
  sub_1B986A200(&OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing, a3);

}

- (double)tickMarkWidth
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
}

- (void)setTickMarkWidth:(double)a3
{
  _TtC13CameraEditKit14TickMarksModel *v4;

  v4 = self;
  sub_1B986A200(&OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth, a3);

}

- (int64_t)mainTickMarkInterval
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_mainTickMarkInterval);
}

- (void)setMainTickMarkInterval:(int64_t)a3
{
  _TtC13CameraEditKit14TickMarksModel *v4;

  v4 = self;
  sub_1B986A314((void *)a3, &OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_mainTickMarkInterval);

}

- (int64_t)mainTickMarkOffset
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_mainTickMarkOffset);
}

- (void)setMainTickMarkOffset:(int64_t)a3
{
  _TtC13CameraEditKit14TickMarksModel *v4;

  v4 = self;
  sub_1B986A314((void *)a3, &OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_mainTickMarkOffset);

}

- (BOOL)logarithmic
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic);
}

- (void)setLogarithmic:(BOOL)a3
{
  _BOOL8 v3;
  _TtC13CameraEditKit14TickMarksModel *v4;

  v3 = a3;
  v4 = self;
  sub_1B986A498(v3, &OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic, (SEL *)&selRef_tickMarksModelDidChangeWidthForTickMarkCountWithModel_);

}

- (BOOL)endTickMarksProminent
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_endTickMarksProminent);
}

- (void)setEndTickMarksProminent:(BOOL)a3
{
  _BOOL8 v3;
  _TtC13CameraEditKit14TickMarksModel *v4;

  v3 = a3;
  v4 = self;
  sub_1B986A498(v3, &OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_endTickMarksProminent, (SEL *)&selRef_tickMarksModelDidChangeAppearanceWithModel_);

}

- (BOOL)useTickMarkLegibilityShadows
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_useTickMarkLegibilityShadows);
}

- (void)setUseTickMarkLegibilityShadows:(BOOL)a3
{
  _BOOL8 v3;
  _TtC13CameraEditKit14TickMarksModel *v4;

  v3 = a3;
  v4 = self;
  sub_1B986A498(v3, &OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_useTickMarkLegibilityShadows, (SEL *)&selRef_tickMarksModelDidChangeAppearanceWithModel_);

}

- (UIColor)mainTickMarkColor
{
  _TtC13CameraEditKit14TickMarksModel *v2;
  id v3;

  v2 = self;
  v3 = sub_1B986A53C();

  return (UIColor *)v3;
}

- (void)setMainTickMarkColor:(id)a3
{
  id v5;
  _TtC13CameraEditKit14TickMarksModel *v6;

  v5 = a3;
  v6 = self;
  sub_1B986A824(a3, &OBJC_IVAR____TtC13CameraEditKit14TickMarksModel__primaryTickMarkColor);

}

- (UIColor)secondaryTickMarkColor
{
  _TtC13CameraEditKit14TickMarksModel *v2;
  id v3;

  v2 = self;
  v3 = sub_1B986A6B4();

  return (UIColor *)v3;
}

- (void)setSecondaryTickMarkColor:(id)a3
{
  id v5;
  _TtC13CameraEditKit14TickMarksModel *v6;

  v5 = a3;
  v6 = self;
  sub_1B986A824(a3, &OBJC_IVAR____TtC13CameraEditKit14TickMarksModel__secondaryTickMarkColor);

}

- (double)requiredWidth
{
  return sub_1B986A950();
}

- (double)xOffsetForTickMarkIndex:(unint64_t)a3
{
  _TtC13CameraEditKit14TickMarksModel *v4;
  double v5;
  double v6;

  v4 = self;
  sub_1B986AA28(a3);
  v6 = v5;

  return v6;
}

- (double)xOffsetForNormalizedValue:(double)a3
{
  _TtC13CameraEditKit14TickMarksModel *v4;
  double v5;

  v4 = self;
  v5 = sub_1B986AB60(a3);

  return v5;
}

- (double)absoluteValueForNormalizedValue:(double)a3 inAbsoluteRangeSize:(double)a4
{
  _TtC13CameraEditKit14TickMarksModel *v6;
  double v7;

  v6 = self;
  v7 = sub_1B986AC98(a3, a4);

  return v7;
}

- (unint64_t)floorTickMarkIndexForXOffset:(double)a3
{
  _TtC13CameraEditKit14TickMarksModel *v4;
  unint64_t v5;
  unint64_t v6;

  v4 = self;
  sub_1B986AD3C(a3);
  v6 = v5;

  return v6;
}

- (BOOL)isMainTickMarkAtIndex:(int64_t)a3
{
  return sub_1B986AF04(a3);
}

- (_TtC13CameraEditKit14TickMarksModel)init
{
  return (_TtC13CameraEditKit14TickMarksModel *)sub_1B986AFC4();
}

- (void).cxx_destruct
{
  sub_1B986B1E4((uint64_t)self + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource);
  sub_1B986B1E4((uint64_t)self + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_delegate);

}

@end
