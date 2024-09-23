@implementation DTTimer

- (MTAlarm)mtAlarm
{
  return (MTAlarm *)*(id *)((char *)&self->super.isa + OBJC_IVAR___DTTimer_mtAlarm);
}

- (MTTimer)mtTimer
{
  return (MTTimer *)*(id *)((char *)&self->super.isa + OBJC_IVAR___DTTimer_mtTimer);
}

- (DTTimer)initWithMTAlarm:(id)a3
{
  _QWORD *v3;
  _QWORD *v4;
  id v5;
  objc_super v7;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer_mtAlarm) = (Class)a3;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer__mtAlarmID);
  *v3 = 0;
  v3[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer_mtTimer) = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer__mtTimerID);
  *v4 = 0;
  v4[1] = 0;
  v7.receiver = self;
  v7.super_class = (Class)DTTimer;
  v5 = a3;
  return -[DTTimer init](&v7, sel_init);
}

- (DTTimer)initWithMTAlarmID:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  _QWORD *v7;
  objc_super v9;

  v4 = sub_23A521A28();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer_mtAlarm) = 0;
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___DTTimer__mtAlarmID);
  *v5 = v4;
  v5[1] = v6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer_mtTimer) = 0;
  v7 = (Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer__mtTimerID);
  *v7 = 0;
  v7[1] = 0;
  v9.receiver = self;
  v9.super_class = (Class)DTTimer;
  return -[DTTimer init](&v9, sel_init);
}

- (DTTimer)initWithMTTimer:(id)a3
{
  _QWORD *v3;
  _QWORD *v4;
  id v5;
  objc_super v7;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer_mtAlarm) = 0;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer__mtAlarmID);
  *v3 = 0;
  v3[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer_mtTimer) = (Class)a3;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer__mtTimerID);
  *v4 = 0;
  v4[1] = 0;
  v7.receiver = self;
  v7.super_class = (Class)DTTimer;
  v5 = a3;
  return -[DTTimer init](&v7, sel_init);
}

- (DTTimer)initWithMTTimerID:(id)a3
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  objc_super v9;

  v4 = sub_23A521A28();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer_mtAlarm) = 0;
  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer__mtAlarmID);
  *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer_mtTimer) = 0;
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___DTTimer__mtTimerID);
  *v6 = v4;
  v6[1] = v7;
  v9.receiver = self;
  v9.super_class = (Class)DTTimer;
  return -[DTTimer init](&v9, sel_init);
}

- (NSString)description
{
  return (NSString *)sub_23A502540(self, (uint64_t)a2, (void (*)(void))DTTimer.description.getter);
}

- (NSString)identifier
{
  return (NSString *)sub_23A502540(self, (uint64_t)a2, (void (*)(void))sub_23A502598);
}

- (NSString)mtAlarmID
{
  return (NSString *)sub_23A5026D0(self, (uint64_t)a2, (SEL *)&selRef_mtAlarm, (SEL *)&selRef_alarmIDString, &OBJC_IVAR___DTTimer__mtAlarmID);
}

- (NSString)mtTimerID
{
  return (NSString *)sub_23A5026D0(self, (uint64_t)a2, (SEL *)&selRef_mtTimer, (SEL *)&selRef_timerIDString, &OBJC_IVAR___DTTimer__mtTimerID);
}

- (BOOL)isEqual:(id)a3
{
  DTTimer *v4;
  DTTimer *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23A521C14();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = DTTimer.isEqual(_:)((uint64_t)v8);

  sub_23A506A9C((uint64_t)v8, &qword_25698AD38);
  return v6 & 1;
}

- (DTTimer)init
{
  DTTimer *result;

  result = (DTTimer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
