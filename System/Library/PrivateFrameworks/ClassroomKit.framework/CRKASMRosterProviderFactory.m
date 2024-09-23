@implementation CRKASMRosterProviderFactory

- (id)makeInstructorRosterProvider
{
  void *v3;
  void *v4;

  +[CRKASMRosterProviderConfiguration instructorRosterConfiguration](CRKASMRosterProviderConfiguration, "instructorRosterConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMRosterProviderFactory makeClassicAdHocSwitchReadingRosterProviderWithConfiguration:](self, "makeClassicAdHocSwitchReadingRosterProviderWithConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)makeEasyMAIDSignInRosterProvider
{
  CRKASMEasyMAIDSignInRosterProvider *v3;
  _QWORD v5[5];

  v3 = [CRKASMEasyMAIDSignInRosterProvider alloc];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__CRKASMRosterProviderFactory_makeEasyMAIDSignInRosterProvider__block_invoke;
  v5[3] = &unk_24D9C8570;
  v5[4] = self;
  return -[CRKASMEasyMAIDSignInRosterProvider initWithRosterProviderGenerator:](v3, "initWithRosterProviderGenerator:", v5);
}

uint64_t __63__CRKASMRosterProviderFactory_makeEasyMAIDSignInRosterProvider__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "makeRosterProviderWithConfiguration:", a2);
}

- (id)makeStudentRosterProvider
{
  void *v3;
  void *v4;

  +[CRKASMRosterProviderConfiguration studentRosterConfiguration](CRKASMRosterProviderConfiguration, "studentRosterConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMRosterProviderFactory makeClassicAdHocSwitchReadingRosterProviderWithConfiguration:](self, "makeClassicAdHocSwitchReadingRosterProviderWithConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)makeInstructorRosterWithoutKeychainAndWithPersonaAdoption
{
  void *v3;
  void *v4;

  +[CRKASMRosterProviderConfiguration instructorRosterWithoutKeychainAndWithPersonaAdoptionConfiguration](CRKASMRosterProviderConfiguration, "instructorRosterWithoutKeychainAndWithPersonaAdoptionConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMRosterProviderFactory makeClassicAdHocSwitchReadingRosterProviderWithConfiguration:](self, "makeClassicAdHocSwitchReadingRosterProviderWithConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)makeClassicAdHocSwitchReadingRosterProviderWithConfiguration:(id)a3
{
  id v4;
  CRKASMClassicAdHocSwitchReadingRosterProvider *v5;
  void *v6;
  id v7;
  CRKASMClassicAdHocSwitchReadingRosterProvider *v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = [CRKASMClassicAdHocSwitchReadingRosterProvider alloc];
  objc_msgSend(v4, "classKitFacade");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __92__CRKASMRosterProviderFactory_makeClassicAdHocSwitchReadingRosterProviderWithConfiguration___block_invoke;
  v10[3] = &unk_24D9C8598;
  v10[4] = self;
  v11 = v4;
  v7 = v4;
  v8 = -[CRKASMClassicAdHocSwitchReadingRosterProvider initWithClassKitFacade:rosterProviderGenerator:](v5, "initWithClassKitFacade:rosterProviderGenerator:", v6, v10);

  return v8;
}

uint64_t __92__CRKASMRosterProviderFactory_makeClassicAdHocSwitchReadingRosterProviderWithConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "makeRosterProviderWithConfiguration:", *(_QWORD *)(a1 + 40));
}

- (id)makeRosterProviderWithConfiguration:(id)a3
{
  id v3;
  CRKASMConcreteRosterProvider *v4;
  CRKASMCourseSizeLimitingRosterProvider *v5;
  CRKASMAtomicRosterProvider *v6;
  CRKASMTimeoutRosterProvider *v7;
  double v8;
  double v9;
  CRKASMTimeoutRosterProvider *v10;
  CRKASMNetworkCheckingRosterProvider *v11;

  v3 = a3;
  v4 = -[CRKASMConcreteRosterProvider initWithConfiguration:]([CRKASMConcreteRosterProvider alloc], "initWithConfiguration:", v3);
  v5 = -[CRKASMCourseSizeLimitingRosterProvider initWithRosterProvider:maxUserCount:maxTrustedUserCount:]([CRKASMCourseSizeLimitingRosterProvider alloc], "initWithRosterProvider:maxUserCount:maxTrustedUserCount:", v4, objc_msgSend(v3, "maxCourseUsersCount"), objc_msgSend(v3, "maxCourseTrustedUsersCount"));

  v6 = -[CRKASMAtomicRosterProvider initWithRosterProvider:]([CRKASMAtomicRosterProvider alloc], "initWithRosterProvider:", v5);
  v7 = [CRKASMTimeoutRosterProvider alloc];
  objc_msgSend(v3, "rosterMutationTimeout");
  v9 = v8;

  v10 = -[CRKASMTimeoutRosterProvider initWithRosterProvider:timeout:](v7, "initWithRosterProvider:timeout:", v6, v9);
  v11 = -[CRKASMNetworkCheckingRosterProvider initWithRosterProvider:]([CRKASMNetworkCheckingRosterProvider alloc], "initWithRosterProvider:", v10);

  return v11;
}

@end
