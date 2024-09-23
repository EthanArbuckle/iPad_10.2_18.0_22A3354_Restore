@implementation IMCTRCSUtilitiesManager

+ (id)sharedManager
{
  if (qword_1EE5007B0 != -1)
    swift_once();
  return (id)qword_1EE5007A0;
}

- (IMCTRCSUtilitiesManagerDelegate)delegate
{
  return (IMCTRCSUtilitiesManagerDelegate *)(id)MEMORY[0x1A1AE8B50]((char *)self+ OBJC_IVAR___IMCTRCSUtilitiesManager_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (IMCTRCSUtilitiesManager)initWithDelegate:(id)a3
{
  objc_super v5;

  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v5.receiver = self;
  v5.super_class = (Class)IMCTRCSUtilitiesManager;
  return -[IMCTRCSUtilitiesManager init](&v5, sel_init);
}

- (IMCTRCSUtilitiesManager)init
{
  uint64_t v3;
  IMCTRCSUtilitiesManager *v4;
  objc_super v6;

  swift_unknownObjectWeakInit();
  v3 = qword_1EE500798;
  v4 = self;
  if (v3 != -1)
    swift_once();
  swift_unknownObjectWeakAssign();

  v6.receiver = v4;
  v6.super_class = (Class)IMCTRCSUtilitiesManager;
  return -[IMCTRCSUtilitiesManager init](&v6, sel_init);
}

- (void)registerServiceCapabilityNotifications
{
  IMCTRCSUtilitiesManagerDelegate *v2;
  IMCTRCSUtilitiesManager *v3;

  v3 = self;
  v2 = -[IMCTRCSUtilitiesManager delegate](v3, sel_delegate);
  if (v2)
  {
    -[IMCTRCSUtilitiesManagerDelegate registerServiceCapabilityNotifications](v2, sel_registerServiceCapabilityNotifications);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (BOOL)carrierRequiresFirstTimeOnAlert
{
  IMCTRCSUtilitiesManager *v2;
  char v3;
  char v4;

  v2 = self;
  sub_19E32033C();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)carrierRequiresFirstTimeOnAlertForPhoneNumber:(id)a3 simID:(id)a4
{
  return sub_19E321018(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_19E320844);
}

- (BOOL)supportedForPhoneNumber:(id)a3 simID:(id)a4
{
  IMCTRCSUtilitiesManager *v5;
  IMCTRCSUtilitiesManagerDelegate *v6;
  IMCTRCSUtilitiesManagerDelegate *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  sub_19E36F888();
  sub_19E36F888();
  v5 = self;
  v6 = -[IMCTRCSUtilitiesManager delegate](v5, sel_delegate);
  if (v6)
  {
    v7 = v6;
    v8 = (void *)sub_19E36F864();
    v9 = (void *)sub_19E36F864();
    v10 = -[IMCTRCSUtilitiesManagerDelegate supportedForPhoneNumber:simID:](v7, sel_supportedForPhoneNumber_simID_, v8, v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v10 = 0;
  }

  return v10;
}

- (id)revokeIntervalForPhoneNumber:(id)a3 simID:(id)a4
{
  return sub_19E320D14(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_19E320C44);
}

- (BOOL)groupMessagingEnabledForPhoneNumber:(id)a3 simID:(id)a4
{
  return sub_19E320E68(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_19E322608);
}

- (int64_t)groupMessagingMaxGroupSizeForPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  IMCTRCSUtilitiesManager *v11;
  id v12;

  v6 = sub_19E36F888();
  v8 = v7;
  if (a4)
  {
    v9 = sub_19E36F888();
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  v11 = self;
  v12 = sub_19E3229A0(v6, v8, v9, (unint64_t)a4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (int64_t)v12;
}

- (BOOL)groupTextReplicationSupportedForPhoneNumber:(id)a3 simID:(id)a4
{
  return sub_19E320E68(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_19E322D70);
}

- (BOOL)enabledForPhoneNumber:(id)a3 simID:(id)a4
{
  return sub_19E321018(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_19E320F00);
}

- (BOOL)enabledForContext:(id)a3
{
  id v3;
  id v5;
  IMCTRCSUtilitiesManager *v6;

  v3 = a3;
  v5 = a3;
  v6 = self;
  LOBYTE(v3) = sub_19E3210C0(v3);

  return v3 & 1;
}

- (BOOL)isRBMSupportedForContext:(id)a3
{
  id v4;
  IMCTRCSUtilitiesManager *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_19E3219C0(v4);

  return self & 1;
}

- (BOOL)isRBMEnabledForContext:(id)a3
{
  id v4;
  IMCTRCSUtilitiesManager *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_19E321E4C(v4);

  return self & 1;
}

- (void).cxx_destruct
{
  sub_19E323244((uint64_t)self + OBJC_IVAR___IMCTRCSUtilitiesManager_delegate);
}

@end
