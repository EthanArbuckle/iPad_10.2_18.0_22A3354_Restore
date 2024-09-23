@implementation APSystemAppOutlet.SystemAppOutletSubjectMonitor

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  unint64_t v5;
  _TtCE13AppProtectionCSo17APSystemAppOutlet29SystemAppOutletSubjectMonitor *v6;

  type metadata accessor for APSubject(0);
  v5 = sub_2362CB764();
  swift_unknownObjectRetain();
  v6 = self;
  sub_236264054(v5);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtCE13AppProtectionCSo17APSystemAppOutlet29SystemAppOutletSubjectMonitor)init
{
  objc_super v4;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCE13AppProtectionCSo17APSystemAppOutlet29SystemAppOutletSubjectMonitor_subscription) = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)_s29SystemAppOutletSubjectMonitorCMa();
  return -[APSystemAppOutlet.SystemAppOutletSubjectMonitor init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectWeakDestroy();
}

@end
