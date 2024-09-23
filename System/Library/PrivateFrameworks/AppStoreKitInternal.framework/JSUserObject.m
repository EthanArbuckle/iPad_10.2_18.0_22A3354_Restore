@implementation JSUserObject

- (NSString)dsid
{
  _TtC19AppStoreKitInternal12JSUserObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1D8330BA8();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1D892AD90();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (BOOL)isOnDevicePersonalizationEnabled
{
  _TtC19AppStoreKitInternal12JSUserObject *v2;
  char v3;

  v2 = self;
  v3 = sub_1D837DC30(MEMORY[0x1E0CFD790]);

  return v3 & 1;
}

- (NSString)firstName
{
  return (NSString *)sub_1D8609380(self, (uint64_t)a2, (SEL *)&selRef_ams_firstName);
}

- (NSString)lastName
{
  return (NSString *)sub_1D8609380(self, (uint64_t)a2, (SEL *)&selRef_ams_lastName);
}

- (NSString)accountIdentifier
{
  return (NSString *)sub_1D8609380(self, (uint64_t)a2, (SEL *)&selRef_username);
}

- (BOOL)isManagedAppleID
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _TtC19AppStoreKitInternal12JSUserObject *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
  _TtC19AppStoreKitInternal12JSUserObject *v10;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA3AE90);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  MEMORY[0x1DF0839E4]();
  v7 = sub_1D892AA24();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) == 1)
  {
    sub_1D83371E4((uint64_t)v5, &qword_1EDA3AE90);
    v9 = 0;
  }
  else
  {
    v10 = (_TtC19AppStoreKitInternal12JSUserObject *)sub_1D892AA18();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
    v9 = -[JSUserObject ams_isManagedAppleID](v10, sel_ams_isManagedAppleID);

    v6 = v10;
  }

  return v9;
}

- (BOOL)isUnderThirteen
{
  _TtC19AppStoreKitInternal12JSUserObject *v2;
  char v3;

  v2 = self;
  v3 = sub_1D837DC30(MEMORY[0x1E0CFD798]);

  return v3 & 1;
}

- (NSNumber)userAgeIfAvailable
{
  return (NSNumber *)0;
}

- (BOOL)isFitnessAppInstallationAllowed
{
  _TtC19AppStoreKitInternal12JSUserObject *v2;
  char v3;

  v2 = self;
  v3 = sub_1D860957C();

  return v3 & 1;
}

- (void)queryFitnessAppInstallationAllowed
{
  void *v3;
  uint64_t v4;
  void *v5;
  _TtC19AppStoreKitInternal12JSUserObject *v6;
  _QWORD v7[6];

  v3 = (void *)objc_opt_self();
  v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v7[4] = sub_1D8609C30;
  v7[5] = v4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 1107296256;
  v7[2] = sub_1D83F3C00;
  v7[3] = &block_descriptor_32;
  v5 = _Block_copy(v7);
  v6 = self;
  swift_release();
  objc_msgSend(v3, sel_fetchIsFitnessAvailableForDeviceWithCompletion_, v5);
  _Block_release(v5);

}

- (id)onDevicePersonalizationDataContainerForAppIds:(id)a3
{
  uint64_t v4;
  _TtC19AppStoreKitInternal12JSUserObject *v5;
  id v6;

  v4 = sub_1D892B060();
  v5 = self;
  v6 = sub_1D86097B0(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC19AppStoreKitInternal12JSUserObject)init
{
  _TtC19AppStoreKitInternal12JSUserObject *result;

  result = (_TtC19AppStoreKitInternal12JSUserObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal12JSUserObject_onDevicePersonalizationDataManager));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal12JSUserObject_fitnessAppInstallationAllowedConditionLock));
}

@end
