@implementation CNEnvironmentTestDouble

- (CNEnvironmentTestDouble)init
{
  CNEnvironmentTestDouble *v2;
  CNProbabilityUtilityTestDouble *v3;
  CNProbabilityUtility *probabilityUtility;
  CNEnvironmentTestDouble *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNEnvironmentTestDouble;
  v2 = -[CNEnvironment init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CNProbabilityUtilityTestDouble);
    probabilityUtility = v2->super._probabilityUtility;
    v2->super._probabilityUtility = (CNProbabilityUtility *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)setFileManager:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__CNEnvironmentTestDouble_setFileManager___block_invoke;
  v6[3] = &unk_1E29B8C10;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  cn_runWithObjectLock(self, v6);

}

void __42__CNEnvironmentTestDouble_setFileManager___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (void)setUserDefaults:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__CNEnvironmentTestDouble_setUserDefaults___block_invoke;
  v6[3] = &unk_1E29B8C10;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  cn_runWithObjectLock(self, v6);

}

void __43__CNEnvironmentTestDouble_setUserDefaults___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

- (void)setFeatureFlags:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__CNEnvironmentTestDouble_setFeatureFlags___block_invoke;
  v6[3] = &unk_1E29B8C10;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  cn_runWithObjectLock(self, v6);

}

void __43__CNEnvironmentTestDouble_setFeatureFlags___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

- (void)setSchedulerProvider:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__CNEnvironmentTestDouble_setSchedulerProvider___block_invoke;
  v6[3] = &unk_1E29B8C10;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  cn_runWithObjectLock(self, v6);

}

void __48__CNEnvironmentTestDouble_setSchedulerProvider___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

- (void)setTimeProvider:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__CNEnvironmentTestDouble_setTimeProvider___block_invoke;
  v6[3] = &unk_1E29B8C10;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  cn_runWithObjectLock(self, v6);

}

void __43__CNEnvironmentTestDouble_setTimeProvider___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
}

- (void)setNotificationCenter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__CNEnvironmentTestDouble_setNotificationCenter___block_invoke;
  v6[3] = &unk_1E29B8C10;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  cn_runWithObjectLock(self, v6);

}

void __49__CNEnvironmentTestDouble_setNotificationCenter___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

- (void)setDistributedNotificationCenter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__CNEnvironmentTestDouble_setDistributedNotificationCenter___block_invoke;
  v6[3] = &unk_1E29B8C10;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  cn_runWithObjectLock(self, v6);

}

void __60__CNEnvironmentTestDouble_setDistributedNotificationCenter___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
}

- (void)setEntitlementVerifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__CNEnvironmentTestDouble_setEntitlementVerifier___block_invoke;
  v6[3] = &unk_1E29B8C10;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  cn_runWithObjectLock(self, v6);

}

void __50__CNEnvironmentTestDouble_setEntitlementVerifier___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
}

- (void)setAuthorizationContext:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__CNEnvironmentTestDouble_setAuthorizationContext___block_invoke;
  v6[3] = &unk_1E29B8C10;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  cn_runWithObjectLock(self, v6);

}

void __51__CNEnvironmentTestDouble_setAuthorizationContext___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
}

- (void)setLocalizationServices:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__CNEnvironmentTestDouble_setLocalizationServices___block_invoke;
  v6[3] = &unk_1E29B8C10;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  cn_runWithObjectLock(self, v6);

}

void __51__CNEnvironmentTestDouble_setLocalizationServices___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
}

- (void)setProbabilityUtility:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__CNEnvironmentTestDouble_setProbabilityUtility___block_invoke;
  v6[3] = &unk_1E29B8C10;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  cn_runWithObjectLock(self, v6);

}

void __49__CNEnvironmentTestDouble_setProbabilityUtility___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), *(id *)(a1 + 40));
}

- (void)setWatchdog:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__CNEnvironmentTestDouble_setWatchdog___block_invoke;
  v6[3] = &unk_1E29B8C10;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  cn_runWithObjectLock(self, v6);

}

void __39__CNEnvironmentTestDouble_setWatchdog___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 40));
}

- (void)setMainBundleIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__CNEnvironmentTestDouble_setMainBundleIdentifier___block_invoke;
  v6[3] = &unk_1E29B8C10;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  cn_runWithObjectLock(self, v6);

}

void __51__CNEnvironmentTestDouble_setMainBundleIdentifier___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), *(id *)(a1 + 40));
}

- (void)setDefaultCountryCode:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__CNEnvironmentTestDouble_setDefaultCountryCode___block_invoke;
  v6[3] = &unk_1E29B8C10;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  cn_runWithObjectLock(self, v6);

}

void __49__CNEnvironmentTestDouble_setDefaultCountryCode___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), *(id *)(a1 + 40));
}

- (void)setInternalBuild:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__CNEnvironmentTestDouble_setInternalBuild___block_invoke;
  v3[3] = &unk_1E29BC490;
  v3[4] = self;
  v4 = a3;
  cn_runWithObjectLock(self, v3);
}

void __44__CNEnvironmentTestDouble_setInternalBuild___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 128);
  *(_QWORD *)(v3 + 128) = v2;

}

- (void)setGreenTeaDevice:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__CNEnvironmentTestDouble_setGreenTeaDevice___block_invoke;
  v3[3] = &unk_1E29BC490;
  v3[4] = self;
  v4 = a3;
  cn_runWithObjectLock(self, v3);
}

void __45__CNEnvironmentTestDouble_setGreenTeaDevice___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 136);
  *(_QWORD *)(v3 + 136) = v2;

}

- (void)setCommLimitsEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__CNEnvironmentTestDouble_setCommLimitsEnabled___block_invoke;
  v3[3] = &unk_1E29BC490;
  v3[4] = self;
  v4 = a3;
  cn_runWithObjectLock(self, v3);
}

void __48__CNEnvironmentTestDouble_setCommLimitsEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 144);
  *(_QWORD *)(v3 + 144) = v2;

}

- (void)setKeychainEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__CNEnvironmentTestDouble_setKeychainEnabled___block_invoke;
  v3[3] = &unk_1E29BC490;
  v3[4] = self;
  v4 = a3;
  cn_runWithObjectLock(self, v3);
}

void __46__CNEnvironmentTestDouble_setKeychainEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 152);
  *(_QWORD *)(v3 + 152) = v2;

}

- (_TtP18ContactsFoundation24CNKeychainFacadeProtocol_)keychainFacade
{
  CNEnvironmentTestDouble *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_18F879D94();

  return (_TtP18ContactsFoundation24CNKeychainFacadeProtocol_ *)v3;
}

- (void)setKeychainFacade:(id)a3
{
  uint64_t v5;
  CNEnvironmentTestDouble *v6;
  id v7;

  v5 = qword_1EE176B58;
  swift_unknownObjectRetain();
  v6 = self;
  if (v5 != -1)
    swift_once();
  v7 = (id)sub_18F87F7B8();
  -[CNEnvironment setValue:forKey:](v6, sel_setValue_forKey_, a3, v7);

  swift_unknownObjectRelease();
}

@end
