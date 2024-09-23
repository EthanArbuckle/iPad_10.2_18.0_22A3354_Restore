@implementation MUIManualSummaryView

- (MUIManualSummaryView)initWithFrame:(CGRect)a3
{
  return (MUIManualSummaryView *)ManualSummaryView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MUIManualSummaryView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D55DAB20();
}

- (void)updateConstraints
{
  MUIManualSummaryView *v2;

  v2 = self;
  ManualSummaryView.updateConstraints()();

}

- (void)didTapButton
{
  MUIManualSummaryView *v2;

  v2 = self;
  sub_1D55D9128();

}

- (void).cxx_destruct
{
  sub_1D5565CF4();
  sub_1D55D8874((id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUIManualSummaryView_viewModel));
  sub_1D5565D18((id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUIManualSummaryView_titleLabelTopConstraint));
  sub_1D5565D18((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MUIManualSummaryView____lazy_storage___titleLabel));
  sub_1D5565D18((id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUIManualSummaryView_buttonBaselineConstraint));
  sub_1D5565D18((id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUIManualSummaryView_buttonCenterYConstaint));
  sub_1D5565D18((id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUIManualSummaryView_buttonTrailingConstraint));
  sub_1D5565D18((id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUIManualSummaryView____lazy_storage___button));
  sub_1D5565D18((id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUIManualSummaryView_textViewHeightConstraint));
  sub_1D5565D18((id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUIManualSummaryView_textViewTopConstraint));
  sub_1D5565D18((id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUIManualSummaryView_textViewBottomConstraint));
  sub_1D5565D18((id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUIManualSummaryView____lazy_storage___textView));
  sub_1D5530388();
}

@end
