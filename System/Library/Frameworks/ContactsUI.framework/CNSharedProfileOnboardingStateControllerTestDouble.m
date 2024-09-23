@implementation CNSharedProfileOnboardingStateControllerTestDouble

- (CNSharedProfileOnboardingStateControllerTestDouble)initWithIsPhotosReady:(BOOL)a3 multiplePhoneNumbersTiedToAppleID:(BOOL)a4 accountCanCreateSNaP:(BOOL)a5 hasCompletedOnboarding:(BOOL)a6 didSkipPoster:(BOOL)a7 lastShownVersionOnLaunch:(int64_t)a8 lastShownVersionInSettings:(int64_t)a9 deviceSupportsPosters:(BOOL)a10
{
  CNSharedProfileOnboardingStateControllerTestDouble *v16;
  CNSharedProfileOnboardingStateControllerTestDouble *v17;
  CNSharedProfileOnboardingStateControllerTestDouble *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CNSharedProfileOnboardingStateControllerTestDouble;
  v16 = -[CNSharedProfileOnboardingStateControllerTestDouble init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_isPhotosReadyForOnboarding = a3;
    v16->_multiplePhoneNumbersTiedToAppleID = a4;
    v16->_accountCanCreateSNaP = a5;
    v16->_alwaysShowSNaPOnboarding = 0;
    v16->_deviceSupportsPosters = a10;
    v16->_iCloudSignedInToUseNicknames = 1;
    v16->_lastShownOnboardingVersion = a8;
    v16->_lastShowOnboardingVersionInSettings = a9;
    v16->_didSkipPosterSetup = a7;
    v16->_hasCompletedOnboarding = a6;
    v18 = v16;
  }

  return v17;
}

- (BOOL)canShowOnboardingAllowingMultiplePhoneNumbers:(BOOL)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  int v8;

  v5 = -[CNSharedProfileOnboardingStateControllerTestDouble accountCanCreateSNaP](self, "accountCanCreateSNaP");
  if (v5)
    LOBYTE(v5) = a3
              || (objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment"),
                  v6 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v6, "featureFlags"),
                  v7 = (void *)objc_claimAutoreleasedReturnValue(),
                  v8 = objc_msgSend(v7, "isFeatureEnabled:", 14),
                  v7,
                  v6,
                  !v8)
              || !-[CNSharedProfileOnboardingStateControllerTestDouble multiplePhoneNumbersTiedToAppleID](self, "multiplePhoneNumbersTiedToAppleID");
  return v5;
}

- (void)writeToDefaultsLastShownOnboardingVersion
{
  self->_lastShownOnboardingVersion = -[CNSharedProfileOnboardingStateControllerTestDouble currentOnboardingVersion](self, "currentOnboardingVersion");
}

- (BOOL)shouldShowOnboarding
{
  return -[CNSharedProfileOnboardingStateControllerTestDouble alwaysShowSNaPOnboarding](self, "alwaysShowSNaPOnboarding")|| -[CNSharedProfileOnboardingStateControllerTestDouble lastShownOnboardingVersion](self, "lastShownOnboardingVersion") < 1;
}

- (void)writeToDefaultsLastShownSettingsOnboardingVersion
{
  self->_lastShowOnboardingVersionInSettings = -[CNSharedProfileOnboardingStateControllerTestDouble currentOnboardingVersion](self, "currentOnboardingVersion");
}

- (int64_t)currentOnboardingVersion
{
  return 1;
}

- (BOOL)isPhotosReadyForOnboarding
{
  return self->_isPhotosReadyForOnboarding;
}

- (void)setIsPhotosReadyForOnboarding:(BOOL)a3
{
  self->_isPhotosReadyForOnboarding = a3;
}

- (BOOL)alwaysShowSNaPOnboarding
{
  return self->_alwaysShowSNaPOnboarding;
}

- (void)setAlwaysShowSNaPOnboarding:(BOOL)a3
{
  self->_alwaysShowSNaPOnboarding = a3;
}

- (BOOL)multiplePhoneNumbersTiedToAppleID
{
  return self->_multiplePhoneNumbersTiedToAppleID;
}

- (void)setMultiplePhoneNumbersTiedToAppleID:(BOOL)a3
{
  self->_multiplePhoneNumbersTiedToAppleID = a3;
}

- (BOOL)accountCanCreateSNaP
{
  return self->_accountCanCreateSNaP;
}

- (void)setAccountCanCreateSNaP:(BOOL)a3
{
  self->_accountCanCreateSNaP = a3;
}

- (void)setCurrentOnboardingVersion:(int64_t)a3
{
  self->_currentOnboardingVersion = a3;
}

- (int64_t)lastShownOnboardingVersion
{
  return self->_lastShownOnboardingVersion;
}

- (void)setLastShownOnboardingVersion:(int64_t)a3
{
  self->_lastShownOnboardingVersion = a3;
}

- (int64_t)lastShowOnboardingVersionInSettings
{
  return self->_lastShowOnboardingVersionInSettings;
}

- (void)setLastShowOnboardingVersionInSettings:(int64_t)a3
{
  self->_lastShowOnboardingVersionInSettings = a3;
}

- (BOOL)iCloudSignedInToUseNicknames
{
  return self->_iCloudSignedInToUseNicknames;
}

- (void)setICloudSignedInToUseNicknames:(BOOL)a3
{
  self->_iCloudSignedInToUseNicknames = a3;
}

- (BOOL)deviceSupportsPosters
{
  return self->_deviceSupportsPosters;
}

- (void)setDeviceSupportsPosters:(BOOL)a3
{
  self->_deviceSupportsPosters = a3;
}

- (BOOL)didSkipPosterSetup
{
  return self->_didSkipPosterSetup;
}

- (void)setDidSkipPosterSetup:(BOOL)a3
{
  self->_didSkipPosterSetup = a3;
}

- (BOOL)hasCompletedOnboarding
{
  return self->_hasCompletedOnboarding;
}

- (void)setHasCompletedOnboarding:(BOOL)a3
{
  self->_hasCompletedOnboarding = a3;
}

+ (id)userDefaults
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.contacts.sharedProfile.test"));
}

@end
