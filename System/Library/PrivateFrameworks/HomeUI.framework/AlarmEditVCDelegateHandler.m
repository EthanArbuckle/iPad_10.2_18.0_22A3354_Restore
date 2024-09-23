@implementation AlarmEditVCDelegateHandler

- (void)alarmEditController:(id)a3 didAddAlarm:(id)a4
{
  sub_1B8EA8790(self, (uint64_t)a2, a3, a4, (uint64_t)&unk_1E6F41060, (uint64_t)&unk_1EF209BB8);
}

- (void)alarmEditController:(id)a3 didEditAlarm:(id)a4
{
  sub_1B8EA8790(self, (uint64_t)a2, a3, a4, (uint64_t)&unk_1E6F41010, (uint64_t)&unk_1EF209B98);
}

- (void)alarmEditController:(id)a3 didDeleteAlarm:(id)a4
{
  sub_1B8EA8790(self, (uint64_t)a2, a3, a4, (uint64_t)&unk_1E6F40FC0, (uint64_t)&unk_1EF209B70);
}

- (void)alarmEditControllerDidCancel:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC6HomeUIP33_248B7B14B6FEE0F07C50E5A087FE91DE26AlarmEditVCDelegateHandler *v7;
  id v8;

  v5 = MEMORY[0x1BCCC1DA8]((char *)self + OBJC_IVAR____TtC6HomeUIP33_248B7B14B6FEE0F07C50E5A087FE91DE26AlarmEditVCDelegateHandler_vc, a2);
  if (v5)
  {
    v8 = (id)v5;
    v6 = a3;
    v7 = self;
    objc_msgSend(v8, sel_dismissViewControllerAnimated_completion_, 1, 0);

  }
}

- (_TtC6HomeUIP33_248B7B14B6FEE0F07C50E5A087FE91DE26AlarmEditVCDelegateHandler)init
{
  _TtC6HomeUIP33_248B7B14B6FEE0F07C50E5A087FE91DE26AlarmEditVCDelegateHandler *result;

  result = (_TtC6HomeUIP33_248B7B14B6FEE0F07C50E5A087FE91DE26AlarmEditVCDelegateHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B8EA8C60((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC6HomeUIP33_248B7B14B6FEE0F07C50E5A087FE91DE26AlarmEditVCDelegateHandler_parentContainerID);
}

@end
