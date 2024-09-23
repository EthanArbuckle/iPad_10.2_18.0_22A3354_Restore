@implementation VerificationCheckmarkCell

- (UILabel)label
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC28HealthExposureNotificationUI25VerificationCheckmarkCell_label));
}

- (_TtC28HealthExposureNotificationUI25VerificationCheckmarkCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC28HealthExposureNotificationUI25VerificationCheckmarkCell *)sub_21CD72080((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21CD71A10);
}

- (_TtC28HealthExposureNotificationUI25VerificationCheckmarkCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC28HealthExposureNotificationUI25VerificationCheckmarkCell *result;

  v5 = OBJC_IVAR____TtC28HealthExposureNotificationUI25VerificationCheckmarkCell_label;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = OBJC_IVAR____TtC28HealthExposureNotificationUI25VerificationCheckmarkCell_accessoryImageView;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_init);
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC28HealthExposureNotificationUI25VerificationCheckmarkCell_isChecked) = 0;

  result = (_TtC28HealthExposureNotificationUI25VerificationCheckmarkCell *)sub_21CD768EC();
  __break(1u);
  return result;
}

- (BOOL)isChecked
{
  return *((_BYTE *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC28HealthExposureNotificationUI25VerificationCheckmarkCell_isChecked);
}

- (void)setIsChecked:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC28HealthExposureNotificationUI25VerificationCheckmarkCell_isChecked) = a3;
  -[VerificationCheckmarkCell setNeedsLayout](self, sel_setNeedsLayout);
}

- (void)layoutSubviews
{
  _TtC28HealthExposureNotificationUI25VerificationCheckmarkCell *v2;

  v2 = self;
  sub_21CD721C4();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI25VerificationCheckmarkCell_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI25VerificationCheckmarkCell_accessoryImageView));
}

@end
