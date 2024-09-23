@implementation HRAccountTimelineButtonCell

+ (NSString)reuseIdentifier
{
  return (NSString *)(id)sub_1BC62C650();
}

- (NSString)buttonText
{
  return (NSString *)sub_1BC49BD98((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRAccountTimelineButtonCell_buttonText);
}

- (void)setButtonText:(id)a3
{
  sub_1BC49BE24(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1BC49BD14);
}

- (NSString)explanationText
{
  return (NSString *)sub_1BC49BD98((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRAccountTimelineButtonCell_explanationText);
}

- (void)setExplanationText:(id)a3
{
  sub_1BC49BE24(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1BC49BE94);
}

- (BOOL)roundBottomCorners
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HRAccountTimelineButtonCell_roundBottomCorners;
  swift_beginAccess();
  return *v2;
}

- (void)setRoundBottomCorners:(BOOL)a3
{
  HRAccountTimelineButtonCell *v4;

  v4 = self;
  sub_1BC49C144(a3);

}

- (HRAccountTimelineButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (HRAccountTimelineButtonCell *)sub_1BC49C888((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))AccountTimelineButtonCell.init(style:reuseIdentifier:));
}

- (HRAccountTimelineButtonCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC49DBD4();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  HRAccountTimelineButtonCell *v6;

  v5 = a3;
  v6 = self;
  sub_1BC49D02C(a3);

}

- (void)prepareForReuse
{
  id v2;
  id v3;
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AccountTimelineButtonCell();
  v2 = v6.receiver;
  -[HRAccountTimelineButtonCell prepareForReuse](&v6, sel_prepareForReuse);
  v3 = sub_1BC49C354();
  objc_msgSend(v3, sel_setText_, 0, v6.receiver, v6.super_class);

  v4 = sub_1BC49C4A4();
  objc_msgSend(v4, sel_setText_, 0);

  v5 = sub_1BC49C610();
  sub_1BC62CE00();

}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  HRAccountTimelineButtonCell *v5;

  v5 = self;
  sub_1BC49DCA0(a3);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRAccountTimelineButtonCell____lazy_storage___buttonLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRAccountTimelineButtonCell____lazy_storage___explanationLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRAccountTimelineButtonCell____lazy_storage___containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HRAccountTimelineButtonCell____lazy_storage___separatorView));
  swift_bridgeObjectRelease();
}

@end
