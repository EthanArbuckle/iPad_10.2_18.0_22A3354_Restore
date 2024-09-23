@implementation StaticPillView

- (_TtC24MenstrualCyclesAppPlugin14StaticPillView)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin14StaticPillView *)sub_23190F0A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin14StaticPillView)initWithCoder:(id)a3
{
  return (_TtC24MenstrualCyclesAppPlugin14StaticPillView *)sub_23190F228(a3);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14StaticPillView_configuration);
  v3 = *(double *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14StaticPillView_configuration);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  id v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for StaticPillView();
  v2 = v4.receiver;
  -[StaticPillView layoutSubviews](&v4, sel_layoutSubviews);
  sub_231910134();
  v3 = (void *)objc_opt_self();
  objc_msgSend(v3, sel_begin, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setDisableActions_, 1);
  sub_23191047C(v2);
  objc_msgSend(v3, sel_commit);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14StaticPillView_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14StaticPillView____lazy_storage___fertilityProjectionReversed));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14StaticPillView____lazy_storage___menstruationProjectionHighReversed));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14StaticPillView____lazy_storage___menstruationProjectionLowReversed));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14StaticPillView____lazy_storage___pill));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14StaticPillView____lazy_storage___pillMask));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14StaticPillView____lazy_storage___menstruationIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14StaticPillView____lazy_storage___menstruationIndicatorMask));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14StaticPillView____lazy_storage___logIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin14StaticPillView____lazy_storage___pregnancyBorderLayer));
}

@end
