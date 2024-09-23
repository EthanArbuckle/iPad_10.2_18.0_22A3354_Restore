@implementation ICActivityStreamDockView

- (ICActivityStreamCoordinating)coordinator
{
  return (ICActivityStreamCoordinating *)(id)swift_unknownObjectRetain();
}

- (BOOL)isDisplayedInCard
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___ICActivityStreamDockView_isDisplayedInCard);
}

- (NSLayoutConstraint)horizontalStackLeadingConstraint
{
  return (NSLayoutConstraint *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                       + OBJC_IVAR___ICActivityStreamDockView_horizontalStackLeadingConstraint));
}

- (void)setHorizontalStackLeadingConstraint:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___ICActivityStreamDockView_horizontalStackLeadingConstraint);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICActivityStreamDockView_horizontalStackLeadingConstraint) = (Class)a3;
  v3 = a3;

}

- (ICActivityStreamDockView)initWithCoordinator:(id)a3 isDisplayedInCard:(BOOL)a4
{
  swift_unknownObjectRetain();
  return (ICActivityStreamDockView *)ActivityStreamDockView.init(coordinator:isDisplayedInCard:)((uint64_t)a3, a4);
}

- (ICActivityStreamDockView)initWithCoder:(id)a3
{
  sub_1DD94B08C(a3);
}

- (void)update
{
  ICActivityStreamDockView *v2;

  v2 = self;
  ActivityStreamDockView.update()();

}

- (ICActivityStreamSelection)selection
{
  return (ICActivityStreamSelection *)sub_1DD94B700((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICActivityStreamDockView_selection);
}

- (void)setSelection:(id)a3
{
  sub_1DD94B79C((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___ICActivityStreamDockView_selection);
}

- (ICCloudSyncingObject)object
{
  return (ICCloudSyncingObject *)sub_1DD94B700((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICActivityStreamDockView_object);
}

- (void)setObject:(id)a3
{
  sub_1DD94B79C((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___ICActivityStreamDockView_object);
}

- (double)margin
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICActivityStreamDockView_margin);
}

- (double)buttonHeight
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICActivityStreamDockView_buttonHeight);
}

- (double)closeButtonHeight
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICActivityStreamDockView_closeButtonHeight);
}

- (double)closeButtonImageHeight
{
  ICActivityStreamDockView *v2;
  unsigned __int8 v3;
  double result;

  v2 = self;
  if (!-[ICActivityStreamDockView ic_hasCompactHeight](v2, sel_ic_hasCompactHeight))
  {

    return 30.0;
  }
  v3 = -[ICActivityStreamDockView ic_hasCompactWidth](v2, sel_ic_hasCompactWidth);

  result = 22.0;
  if ((v3 & 1) == 0)
    return 30.0;
  return result;
}

- (ICActivityStreamDockView)initWithFrame:(CGRect)a3
{
  ICActivityStreamDockView *result;

  result = (ICActivityStreamDockView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamDockView_horizontalStackLeadingConstraint));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamDockView____lazy_storage___topBorderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamDockView____lazy_storage___backgroundEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamDockView____lazy_storage___colorBar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamDockView____lazy_storage___avatarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamDockView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamDockView____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamDockView____lazy_storage___showAllActivityButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamDockView____lazy_storage___closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamDockView____lazy_storage___horizontalStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamDockView____lazy_storage___verticalStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamDockView____lazy_storage___baselineLayoutGuide));
}

@end
