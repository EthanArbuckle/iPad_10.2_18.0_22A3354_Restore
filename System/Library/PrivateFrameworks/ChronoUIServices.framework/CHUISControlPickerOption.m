@implementation CHUISControlPickerOption

- (NSString)value
{
  return (NSString *)sub_1B715980C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CHUISControlPickerOption_value);
}

- (void)setValue:(id)a3
{
  sub_1B7159870((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___CHUISControlPickerOption_value);
}

- (UIImage)icon
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR___CHUISControlPickerOption_icon));
}

- (void)setIcon:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlPickerOption_icon);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlPickerOption_icon) = (Class)a3;
  v3 = a3;

}

- (UIColor)tint
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR___CHUISControlPickerOption_tint));
}

- (void)setTint:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlPickerOption_tint);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlPickerOption_tint) = (Class)a3;
  v3 = a3;

}

- (NSString)status
{
  return (NSString *)sub_1B715980C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CHUISControlPickerOption_status);
}

- (void)setStatus:(id)a3
{
  sub_1B7159870((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___CHUISControlPickerOption_status);
}

- (NSString)actionHint
{
  return (NSString *)sub_1B715980C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CHUISControlPickerOption_actionHint);
}

- (void)setActionHint:(id)a3
{
  sub_1B7159870((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___CHUISControlPickerOption_actionHint);
}

- (CHUISControlPickerOption)init
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  objc_super v6;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlPickerOption_value);
  *v2 = 0;
  v2[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlPickerOption_icon) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlPickerOption_tint) = 0;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlPickerOption_status);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlPickerOption_actionHint);
  *v4 = 0;
  v4[1] = 0;
  v6.receiver = self;
  v6.super_class = (Class)CHUISControlPickerOption;
  return -[CHUISControlPickerOption init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
