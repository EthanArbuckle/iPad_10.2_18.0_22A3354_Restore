@implementation HRUITextAndActionCell

- (UIButton)actionButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR___HRUITextAndActionCell_actionButton));
}

- (NSString)explanation
{
  return (NSString *)sub_1BC49BD98((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRUITextAndActionCell_explanation);
}

- (void)setExplanation:(id)a3
{
  sub_1BC49BE24(self, (uint64_t)a2, (uint64_t)a3, sub_1BC4D0D48);
}

- (NSString)actionTitle
{
  return (NSString *)sub_1BC49BD98((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRUITextAndActionCell_actionTitle);
}

- (void)setActionTitle:(id)a3
{
  sub_1BC49BE24(self, (uint64_t)a2, (uint64_t)a3, sub_1BC4D0F10);
}

- (HRUITextAndActionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_1BC62C680();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (HRUITextAndActionCell *)TextAndActionCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (HRUITextAndActionCell)initWithCoder:(id)a3
{
  return (HRUITextAndActionCell *)sub_1BC4D12C8(a3);
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
