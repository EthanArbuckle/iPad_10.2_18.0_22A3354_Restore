@implementation IMServiceAvailabilityMonitor

- (IMServiceAvailabilityMonitor)init
{
  IMServiceAvailabilityMonitor *v2;
  objc_super v4;

  *((_BYTE *)&self->super.isa + OBJC_IVAR___IMServiceAvailabilityMonitor_mmsEnabled) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___IMServiceAvailabilityMonitor_rcsEnabled) = 0;
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___IMServiceAvailabilityMonitor_mmsToken) = -1;
  v4.receiver = self;
  v4.super_class = (Class)IMServiceAvailabilityMonitor;
  v2 = -[IMServiceAvailabilityMonitor init](&v4, sel_init);
  sub_19E33AAB4();
  sub_19E33AC10();

  return v2;
}

- (BOOL)isiMessageEnabled
{
  void *v3;
  IMServiceAvailabilityMonitor *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_sharedInstance);
  if (v5)
  {
    v6 = v5;
    if (qword_1EE501558 != -1)
      swift_once();
    v7 = (void *)sub_19E36F864();
    v8 = objc_msgSend(v6, sel_availabilityForListenerID_forService_, v7, 1);

    LOBYTE(v5) = v8 == (id)1;
  }
  else
  {
    __break(1u);
  }
  return (char)v5;
}

- (BOOL)isRCSEnabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___IMServiceAvailabilityMonitor_rcsEnabled);
}

- (BOOL)isMMSEnabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___IMServiceAvailabilityMonitor_mmsEnabled);
}

@end
