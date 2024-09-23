@implementation VibrantSegmentedControl

+ (double)_cornerRadiusForTraitCollection:(id)a3 size:(int)a4
{
  return 17.0;
}

+ (double)_sectionIndicatorInsetForTraitCollection:(id)a3 size:(int)a4
{
  return 4.0;
}

- (BOOL)isEnabled
{
  return sub_23BCAE518(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  sub_23BCAE568(self, (uint64_t)a2, a3, (SEL *)&selRef_isEnabled, (SEL *)&selRef_setEnabled_);
}

- (BOOL)isHighlighted
{
  return sub_23BCAE518(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  sub_23BCAE568(self, (uint64_t)a2, a3, (SEL *)&selRef_isHighlighted, (SEL *)&selRef_setHighlighted_);
}

- (BOOL)isSelected
{
  return sub_23BCAE518(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  sub_23BCAE568(self, (uint64_t)a2, a3, (SEL *)&selRef_isSelected, (SEL *)&selRef_setSelected_);
}

- (_TtC14FitnessAppRoot23VibrantSegmentedControl)initWithFrame:(CGRect)a3
{
  return (_TtC14FitnessAppRoot23VibrantSegmentedControl *)sub_23BCAE610(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC14FitnessAppRoot23VibrantSegmentedControl)initWithCoder:(id)a3
{
  id v4;
  _TtC14FitnessAppRoot23VibrantSegmentedControl *result;

  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC14FitnessAppRoot23VibrantSegmentedControl_lastTouchStayedOnSelectedSegment) = 0;
  v4 = a3;

  result = (_TtC14FitnessAppRoot23VibrantSegmentedControl *)sub_23BCD84AC();
  __break(1u);
  return result;
}

- (void)insertSegmentWithImage:(id)a3 atIndex:(int64_t)a4 animated:(BOOL)a5
{
  id v9;
  _TtC14FitnessAppRoot23VibrantSegmentedControl *v10;

  v9 = a3;
  v10 = self;
  sub_23BCAE7B0(a3, a4, a5);

}

- (void)setImage:(id)a3 forSegmentAtIndex:(int64_t)a4
{
  id v7;
  _TtC14FitnessAppRoot23VibrantSegmentedControl *v8;

  v7 = a3;
  v8 = self;
  sub_23BCAEA24(a3, a4);

}

- (void)setTitleTextAttributes:(id)a3 forState:(unint64_t)a4
{
  uint64_t v5;
  _TtC14FitnessAppRoot23VibrantSegmentedControl *v7;
  void *v8;
  _TtC14FitnessAppRoot23VibrantSegmentedControl *v9;
  objc_super v10;

  v5 = (uint64_t)a3;
  if (a3)
  {
    type metadata accessor for Key(0);
    sub_23BCAF8D4();
    v5 = sub_23BCD8104();
    v7 = self;
    v8 = (void *)sub_23BCD80F8();
  }
  else
  {
    v9 = self;
    v8 = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for VibrantSegmentedControl();
  -[VibrantSegmentedControl setTitleTextAttributes:forState:](&v10, sel_setTitleTextAttributes_forState_, v8, a4);

  sub_23BCAF2F0(v5, (id)a4);
  swift_bridgeObjectRelease();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  _TtC14FitnessAppRoot23VibrantSegmentedControl *v7;
  void *v8;
  objc_super v9;

  sub_23BCA3724(0, &qword_256A95730);
  sub_23BCAF91C();
  sub_23BCD82D8();
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC14FitnessAppRoot23VibrantSegmentedControl_lastTouchStayedOnSelectedSegment) = 1;
  v6 = a4;
  v7 = self;
  v8 = (void *)sub_23BCD82CC();
  v9.receiver = v7;
  v9.super_class = (Class)type metadata accessor for VibrantSegmentedControl();
  -[VibrantSegmentedControl touchesBegan:withEvent:](&v9, sel_touchesBegan_withEvent_, v8, v6);

  swift_bridgeObjectRelease();
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  _TtC14FitnessAppRoot23VibrantSegmentedControl *v7;
  void *v8;
  objc_super v9;

  sub_23BCA3724(0, &qword_256A95730);
  sub_23BCAF91C();
  sub_23BCD82D8();
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC14FitnessAppRoot23VibrantSegmentedControl_lastTouchStayedOnSelectedSegment) = 0;
  v6 = a4;
  v7 = self;
  v8 = (void *)sub_23BCD82CC();
  v9.receiver = v7;
  v9.super_class = (Class)type metadata accessor for VibrantSegmentedControl();
  -[VibrantSegmentedControl touchesCancelled:withEvent:](&v9, sel_touchesCancelled_withEvent_, v8, v6);

  swift_bridgeObjectRelease();
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC14FitnessAppRoot23VibrantSegmentedControl *v8;

  sub_23BCA3724(0, &qword_256A95730);
  sub_23BCAF91C();
  v6 = sub_23BCD82D8();
  v7 = a4;
  v8 = self;
  sub_23BCAEDFC(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)_highlightSegment:(int64_t)a3
{
  _TtC14FitnessAppRoot23VibrantSegmentedControl *v4;
  _TtC14FitnessAppRoot23VibrantSegmentedControl *v5;
  objc_super v6;

  v4 = self;
  v5 = v4;
  if (a3 >= 1 && -[VibrantSegmentedControl selectedSegmentIndex](v4, sel_selectedSegmentIndex) != (id)a3)
    *((_BYTE *)&v5->super.super.super.super.super.isa
    + OBJC_IVAR____TtC14FitnessAppRoot23VibrantSegmentedControl_lastTouchStayedOnSelectedSegment) = 0;
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for VibrantSegmentedControl();
  -[VibrantSegmentedControl _highlightSegment:](&v6, sel__highlightSegment_, a3);

}

- (_TtC14FitnessAppRoot23VibrantSegmentedControl)initWithItems:(id)a3
{
  _TtC14FitnessAppRoot23VibrantSegmentedControl *result;

  result = (_TtC14FitnessAppRoot23VibrantSegmentedControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
