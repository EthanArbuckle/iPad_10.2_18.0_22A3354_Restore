@implementation DMFFetchSecurityInformationRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (id)permittedPlatforms
{
  return &unk_1E6EF4A48;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchSecurityInformationRequest)initWithCoder:(id)a3
{
  id v4;
  DMFFetchSecurityInformationRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *infoKeys;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DMFFetchSecurityInformationRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("infoKeys"));
    v9 = objc_claimAutoreleasedReturnValue();
    infoKeys = v5->_infoKeys;
    v5->_infoKeys = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMFFetchSecurityInformationRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[DMFFetchSecurityInformationRequest infoKeys](self, "infoKeys", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("infoKeys"));

}

+ (NSArray)currentPlatformSecurityInfoKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(a1, "allPlatformSecurityInfoKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "iOSSecurityInfoKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  return (NSArray *)v5;
}

+ (NSArray)allPlatformSecurityInfoKeys
{
  if (allPlatformSecurityInfoKeys_onceToken != -1)
    dispatch_once(&allPlatformSecurityInfoKeys_onceToken, &__block_literal_global_12);
  return (NSArray *)(id)allPlatformSecurityInfoKeys_result;
}

void __65__DMFFetchSecurityInformationRequest_allPlatformSecurityInfoKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("DMFSecurityPasscodeIsSetKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allPlatformSecurityInfoKeys_result;
  allPlatformSecurityInfoKeys_result = v0;

}

+ (NSArray)iOSSecurityInfoKeys
{
  if (iOSSecurityInfoKeys_onceToken != -1)
    dispatch_once(&iOSSecurityInfoKeys_onceToken, &__block_literal_global_12);
  return (NSArray *)(id)iOSSecurityInfoKeys_result;
}

void __57__DMFFetchSecurityInformationRequest_iOSSecurityInfoKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];

  v2[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("DMFSecurityPasscodeIsCompliantWithGlobalRestrictionsKey");
  v2[1] = CFSTR("DMFSecurityPasscodeIsCompliantWithProfileRestrictionsKey");
  v2[2] = CFSTR("DMFSecurityPasscodeLockGracePeriodEnforcedKey");
  v2[3] = CFSTR("DMFSecurityPasscodeLockGracePeriodKey");
  v2[4] = CFSTR("DMFSecuritySupportsBlockLevelEncryptionKey");
  v2[5] = CFSTR("DMFSecuirtySupportsFileLevelEncryptionKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)iOSSecurityInfoKeys_result;
  iOSSecurityInfoKeys_result = v0;

}

+ (NSArray)macOSSecurityInfoKeys
{
  if (macOSSecurityInfoKeys_onceToken != -1)
    dispatch_once(&macOSSecurityInfoKeys_onceToken, &__block_literal_global_13);
  return (NSArray *)(id)macOSSecurityInfoKeys_result;
}

void __59__DMFFetchSecurityInformationRequest_macOSSecurityInfoKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];

  v2[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("DMFSecurityFirmwarePasswordStatusKey");
  v2[1] = CFSTR("DMFSecurityFirewallSettingsKey");
  v2[2] = CFSTR("DMFSecurityFullDiskEncryptionEnabledKey");
  v2[3] = CFSTR("DMFSecurityFullDiskEncryptionHasInstitutionalRecoveryKey");
  v2[4] = CFSTR("DMFSecurityFullDiskEncryptionHasPersonalRecoveryKey");
  v2[5] = CFSTR("DMFSecuritySystemIntegrityProtectionEnabledKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)macOSSecurityInfoKeys_result;
  macOSSecurityInfoKeys_result = v0;

}

+ (NSArray)tvOSSecurityInfoKeys
{
  if (tvOSSecurityInfoKeys_onceToken != -1)
    dispatch_once(&tvOSSecurityInfoKeys_onceToken, &__block_literal_global_14);
  return (NSArray *)(id)tvOSSecurityInfoKeys_result;
}

void __58__DMFFetchSecurityInformationRequest_tvOSSecurityInfoKeys__block_invoke()
{
  void *v0;

  v0 = (void *)tvOSSecurityInfoKeys_result;
  tvOSSecurityInfoKeys_result = MEMORY[0x1E0C9AA60];

}

+ (NSArray)watchOSSecurityInfoKeys
{
  if (watchOSSecurityInfoKeys_onceToken != -1)
    dispatch_once(&watchOSSecurityInfoKeys_onceToken, &__block_literal_global_15);
  return (NSArray *)(id)watchOSSecurityInfoKeys_result;
}

void __61__DMFFetchSecurityInformationRequest_watchOSSecurityInfoKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("DMFSecurityPasscodeIsCompliantWithGlobalRestrictionsKey");
  v2[1] = CFSTR("DMFSecurityPasscodeIsCompliantWithProfileRestrictionsKey");
  v2[2] = CFSTR("DMFSecurityPasscodeLockGracePeriodEnforcedKey");
  v2[3] = CFSTR("DMFSecurityPasscodeLockGracePeriodKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)watchOSSecurityInfoKeys_result;
  watchOSSecurityInfoKeys_result = v0;

}

- (NSArray)infoKeys
{
  return self->_infoKeys;
}

- (void)setInfoKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoKeys, 0);
}

@end
