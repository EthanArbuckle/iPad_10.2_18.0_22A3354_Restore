@implementation WDClinicalAccountOnboardingSession

- (id)makeDataTypeSelectionViewControllerForAccount:(id)a3
{
  id v5;
  id v6;
  WDClinicalAccountOnboardingSession *v7;
  id v8;

  v5 = objc_allocWithZone((Class)type metadata accessor for ClinicalSharingDataTypeSelectionViewController(0));
  v6 = a3;
  v7 = self;
  v8 = sub_1BC3658FC((char *)v7, v6);

  return v8;
}

- (id)makeNecessaryScopesNotPresentViewControllerForAccount:(id)a3
{
  id v4;

  v4 = objc_allocWithZone((Class)type metadata accessor for ClinicalSharingOnboardingNecessaryScopesNotPresentViewController());
  return sub_1BC5475B4(a3);
}

- (int64_t)context
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___WDClinicalAccountOnboardingSession_context);
}

- (unint64_t)options
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___WDClinicalAccountOnboardingSession_options);
}

- (HRProfile)profile
{
  return (HRProfile *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR___WDClinicalAccountOnboardingSession_profile));
}

- (BOOL)shouldLaunchClinicalSharing
{
  return *(_DWORD *)((_BYTE *)&self->super.isa + OBJC_IVAR___WDClinicalAccountOnboardingSession_options) & 1;
}

- (BOOL)allowsCancellingClinicalOnboarding
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR___WDClinicalAccountOnboardingSession_context) != (Class)2;
}

- (WDClinicalAccountOnboardingSession)initWithContext:(int64_t)a3 options:(unint64_t)a4 sourceIdentifier:(id)a5 profile:(id)a6 analyticsManager:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  WDClinicalAccountOnboardingSession *v16;

  if (a5)
  {
    v11 = sub_1BC62C680();
    v13 = v12;
  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  v14 = a6;
  v15 = a7;
  v16 = (WDClinicalAccountOnboardingSession *)sub_1BC60E17C(a3, a4, v11, v13, v14, v15);

  return v16;
}

- (void)submitClinicalSharingOnboardingStepAnalytic:(int64_t)a3
{
  WDClinicalAccountOnboardingSession *v4;

  v4 = self;
  sub_1BC60C52C(a3);

}

- (void)persistEphemeralAccount:(id)a3 fromSharing:(BOOL)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  WDClinicalAccountOnboardingSession *v17;
  id v18;
  uint64_t v19;

  sub_1BC384E68(0, (unint64_t *)&qword_1ED6A4DE0, (void (*)(uint64_t))MEMORY[0x1E0DF0750]);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - v10;
  v12 = _Block_copy(a5);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  v14 = sub_1BC62C95C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = 0;
  *(_QWORD *)(v15 + 24) = 0;
  *(_QWORD *)(v15 + 32) = self;
  *(_QWORD *)(v15 + 40) = a3;
  *(_BYTE *)(v15 + 48) = a4;
  *(_QWORD *)(v15 + 56) = sub_1BC60E8E0;
  *(_QWORD *)(v15 + 64) = v13;
  v16 = a3;
  v17 = self;
  v18 = v16;
  swift_retain();
  sub_1BC5C2784((uint64_t)v11, (uint64_t)&unk_1EF43AB08, v15);

  swift_release();
  swift_release();
}

- (void)didAddStaticSampleAccount:(id)a3
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
  char *v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  WDClinicalAccountOnboardingSession *v17;
  uint64_t v18;

  sub_1BC384E68(0, (unint64_t *)&qword_1ED6A4DE0, (void (*)(uint64_t))MEMORY[0x1E0DF0750]);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v18 - v5;
  v7 = sub_1BC62A7B4();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v18 - v12;
  sub_1BC62A79C();
  v14 = sub_1BC62C95C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v6, 1, 1, v14);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, v13, v7);
  v15 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v16 = (char *)swift_allocObject();
  *((_QWORD *)v16 + 2) = 0;
  *((_QWORD *)v16 + 3) = 0;
  *((_QWORD *)v16 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v16[v15], v10, v7);
  v17 = self;
  sub_1BC5C2784((uint64_t)v6, (uint64_t)&unk_1EF43AB00, (uint64_t)v16);

  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

- (void)markShouldDismissOnboardingTileViewController
{
  WDClinicalAccountOnboardingSession *v2;

  v2 = self;
  sub_1BC60D5C0();

}

- (void)onboardingWillDisappearWith:(id)a3 animated:(BOOL)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  WDClinicalAccountOnboardingSession *v13;
  id v14;
  uint64_t v15;

  sub_1BC384E68(0, (unint64_t *)&qword_1ED6A4DE0, (void (*)(uint64_t))MEMORY[0x1E0DF0750]);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v15 - v8;
  v10 = sub_1BC62C95C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = 0;
  *(_QWORD *)(v11 + 24) = 0;
  *(_QWORD *)(v11 + 32) = self;
  *(_BYTE *)(v11 + 40) = a4;
  *(_QWORD *)(v11 + 48) = a3;
  v12 = a3;
  v13 = self;
  v14 = v12;
  sub_1BC5C2784((uint64_t)v9, (uint64_t)&unk_1EF43AAF8, v11);

  swift_release();
}

- (WDClinicalAccountOnboardingSession)init
{
  WDClinicalAccountOnboardingSession *result;

  result = (WDClinicalAccountOnboardingSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

@end
