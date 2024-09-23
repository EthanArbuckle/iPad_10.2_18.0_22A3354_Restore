@implementation DatePickerCell

- (_TtC28HealthExposureNotificationUIP33_B34324B7016DDD2106849E0328F1789A14DatePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_21CD765B0();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC28HealthExposureNotificationUIP33_B34324B7016DDD2106849E0328F1789A14DatePickerCell *)sub_21CCFA368(a3, (uint64_t)a4, v6);
}

- (_TtC28HealthExposureNotificationUIP33_B34324B7016DDD2106849E0328F1789A14DatePickerCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC28HealthExposureNotificationUIP33_B34324B7016DDD2106849E0328F1789A14DatePickerCell *result;

  v5 = OBJC_IVAR____TtC28HealthExposureNotificationUIP33_B34324B7016DDD2106849E0328F1789A14DatePickerCell_datePicker;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD520]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC28HealthExposureNotificationUIP33_B34324B7016DDD2106849E0328F1789A14DatePickerCell *)sub_21CD768EC();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUIP33_B34324B7016DDD2106849E0328F1789A14DatePickerCell_datePicker));
}

@end
