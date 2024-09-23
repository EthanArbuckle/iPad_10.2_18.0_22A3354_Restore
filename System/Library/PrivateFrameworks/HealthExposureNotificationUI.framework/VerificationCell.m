@implementation VerificationCell

- (_TtC28HealthExposureNotificationUI16VerificationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC28HealthExposureNotificationUI16VerificationCell *)sub_21CD72080((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21CD717B0);
}

- (_TtC28HealthExposureNotificationUI16VerificationCell)initWithCoder:(id)a3
{
  _TtC28HealthExposureNotificationUI16VerificationCell *result;

  result = (_TtC28HealthExposureNotificationUI16VerificationCell *)sub_21CD768EC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for VerificationCell();
  v2 = v5.receiver;
  -[VerificationCell layoutSubviews](&v5, sel_layoutSubviews);
  objc_msgSend(v2, sel_layoutMargins, v5.receiver, v5.super_class);
  v4 = v3;
  objc_msgSend(v2, sel_layoutMargins);
  objc_msgSend(v2, sel_setSeparatorInset_, 0.0, v4, 0.0);

}

@end
