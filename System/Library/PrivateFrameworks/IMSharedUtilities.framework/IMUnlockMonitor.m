@implementation IMUnlockMonitor

- (IMUnlockMonitor)init
{
  return (IMUnlockMonitor *)sub_19E24B8C0();
}

- (void)addListener:(id)a3
{
  sub_19E34D72C(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_addObject_);
}

- (BOOL)isUnderFirstDataProtectionLock
{
  IMUnlockMonitor *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_19E34D50C();

  return v3;
}

+ (id)sharedInstance
{
  if (qword_1ECFC6960 != -1)
    swift_once();
  return (id)qword_1ECFC6988;
}

- (BOOL)hasReceivedFirstUnlockNotification
{
  IMUnlockMonitor *v2;
  char v3;

  v2 = self;
  v3 = sub_19E34D5BC();

  return v3 & 1;
}

- (BOOL)isSystemLocked
{
  IMUnlockMonitor *v2;
  char v3;

  v2 = self;
  v3 = sub_19E34D5BC();

  return v3 & 1;
}

- (void)removeListener:(id)a3
{
  sub_19E34D72C(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_removeObject_);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
