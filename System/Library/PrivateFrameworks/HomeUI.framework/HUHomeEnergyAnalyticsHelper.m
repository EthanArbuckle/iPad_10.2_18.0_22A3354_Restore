@implementation HUHomeEnergyAnalyticsHelper

+ (void)sendUtilityOnboardingEntryPointInSettingsViewEvent
{
  sub_1B8F1AA4C((uint64_t)a1, (uint64_t)a2, MEMORY[0x1E0D32B98]);
}

+ (void)sendUtilityOnboardingEntryPointInSettingsTappedEvent
{
  sub_1B8F1AA4C((uint64_t)a1, (uint64_t)a2, MEMORY[0x1E0D32B90]);
}

+ (void)sendUtilityIntroAndSelectionSheetViewEventWithNumOfUtilities:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2108A0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1B93EBA2C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB9A8();
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E0D32B78], v6);
  sub_1B93EBA14();
  v10 = sub_1B93EBA20();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v5, 0, 1, v10);
  sub_1B93EB9F0();
  swift_allocObject();
  sub_1B93EB9E4();
  MEMORY[0x1BCCBD74C]();
  swift_release();
}

+ (void)sendUtilityAccountLookupViewEventWithUtilityID:(id)a3 presentingVC:(int64_t)a4
{
  sub_1B8F1A4E4((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_1B8F1AC70);
}

+ (void)sendUtilityOTPMethodSelectionSheetViewEventWithUtilityID:(id)a3 numOfMethods:(int64_t)a4
{
  sub_1B8F1A4E4((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_1B8F1AE54);
}

+ (void)sendUtilityOTPMethodSelectedByUserEventWithUtilityID:(id)a3 selectedOTPMethod:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v4 = a4;
  if (!a3)
  {
    v5 = 0;
    v7 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  v5 = sub_1B93EDDB4();
  v7 = v6;
  if (!v4)
    goto LABEL_5;
LABEL_3:
  v8 = sub_1B93EDDB4();
  v4 = v9;
LABEL_6:
  sub_1B8F1B038(v5, v7, v8, (uint64_t)v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (void)sendUtilityOnboardingCancelledEventWithUtilityID:(id)a3 sourceViewController:(int64_t)a4
{
  sub_1B8F1A4E4((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_1B8F1B35C);
}

+ (void)sendUtilityOnboardingCompletedEventWithUtilityID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2108A0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1B93EBA2C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
    sub_1B93EDDB4();
  sub_1B93EB9A8();
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E0D32B68], v7);
  sub_1B93ECF74();
  sub_1B93EBA14();
  v11 = sub_1B93EBA20();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v6, 0, 1, v11);
  sub_1B93EB9F0();
  swift_allocObject();
  sub_1B93EB9E4();
  MEMORY[0x1BCCBD74C]();
  swift_bridgeObjectRelease();
  swift_release();
}

+ (void)sendUtilityDisconnectedByUserEvent
{
  sub_1B8F1AA4C((uint64_t)a1, (uint64_t)a2, MEMORY[0x1E0D32B58]);
}

- (HUHomeEnergyAnalyticsHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HomeEnergyAnalyticsHelper();
  return -[HUHomeEnergyAnalyticsHelper init](&v3, sel_init);
}

@end
