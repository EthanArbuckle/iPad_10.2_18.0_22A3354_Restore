@implementation MIUIDisplayConfiguration

+ (id)lockScreenConfiguration
{
  MIUIDisplayConfiguration *v2;

  v2 = objc_alloc_init(MIUIDisplayConfiguration);
  -[MIUIDisplayConfiguration setIsLockScreen:](v2, "setIsLockScreen:", 1);
  -[MIUIDisplayConfiguration setIsEditingAvailable:](v2, "setIsEditingAvailable:", 0);
  -[MIUIDisplayConfiguration setIsShowWhenLockedVisible:](v2, "setIsShowWhenLockedVisible:", 0);
  -[MIUIDisplayConfiguration setIsShareDuringEmergencyCallVisible:](v2, "setIsShareDuringEmergencyCallVisible:", 0);
  -[MIUIDisplayConfiguration setAccessPoint:](v2, "setAccessPoint:", 0);
  return v2;
}

+ (id)standardConfiguration
{
  return objc_alloc_init(MIUIDisplayConfiguration);
}

- (MIUIDisplayConfiguration)initWithEntryPoint:(int64_t)a3 isEditingAvailable:(BOOL)a4 isDeletionAvailable:(BOOL)a5 shouldShowDonateLifeRegistrationIfAvailable:(BOOL)a6 isShowWhenLockedVisible:(BOOL)a7 isShareDuringEmergencyCallVisible:(BOOL)a8 accessPoint:(int64_t)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  MIUIDisplayConfiguration *v15;
  MIUIDisplayConfiguration *v16;
  objc_super v18;

  v9 = a8;
  v10 = a7;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MIUIDisplayConfiguration;
  v15 = -[MIUIDisplayConfiguration init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    -[MIUIDisplayConfiguration setEntryPoint:](v15, "setEntryPoint:", a3);
    -[MIUIDisplayConfiguration setIsEditingAvailable:](v16, "setIsEditingAvailable:", v13);
    -[MIUIDisplayConfiguration setIsDeletionAvailable:](v16, "setIsDeletionAvailable:", v12);
    -[MIUIDisplayConfiguration setShouldShowDonateLifeRegistrationIfAvailable:](v16, "setShouldShowDonateLifeRegistrationIfAvailable:", v11);
    -[MIUIDisplayConfiguration setIsShowWhenLockedVisible:](v16, "setIsShowWhenLockedVisible:", v10);
    -[MIUIDisplayConfiguration setIsShareDuringEmergencyCallVisible:](v16, "setIsShareDuringEmergencyCallVisible:", v9);
    -[MIUIDisplayConfiguration setAccessPoint:](v16, "setAccessPoint:", a9);
  }
  return v16;
}

- (MIUIDisplayConfiguration)init
{
  MIUIDisplayConfiguration *v2;
  MIUIDisplayConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIUIDisplayConfiguration;
  v2 = -[MIUIDisplayConfiguration init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MIUIDisplayConfiguration setEntryPoint:](v2, "setEntryPoint:", 0);
    -[MIUIDisplayConfiguration setIsEditingAvailable:](v3, "setIsEditingAvailable:", 1);
    -[MIUIDisplayConfiguration setIsDeletionAvailable:](v3, "setIsDeletionAvailable:", 0);
    -[MIUIDisplayConfiguration setShouldShowDonateLifeRegistrationIfAvailable:](v3, "setShouldShowDonateLifeRegistrationIfAvailable:", 0);
    -[MIUIDisplayConfiguration setIsShowWhenLockedVisible:](v3, "setIsShowWhenLockedVisible:", 1);
    -[MIUIDisplayConfiguration setIsShareDuringEmergencyCallVisible:](v3, "setIsShareDuringEmergencyCallVisible:", 1);
    -[MIUIDisplayConfiguration setAccessPoint:](v3, "setAccessPoint:", 0);
    -[MIUIDisplayConfiguration setIsHomeIndicatorHidden:](v3, "setIsHomeIndicatorHidden:", 0);
    -[MIUIDisplayConfiguration setSuggestHealthData:](v3, "setSuggestHealthData:", 0);
    -[MIUIDisplayConfiguration setShouldSaveDataToHealthDetails:](v3, "setShouldSaveDataToHealthDetails:", 0);
    -[MIUIDisplayConfiguration setIsLockScreen:](v3, "setIsLockScreen:", 0);
    -[MIUIDisplayConfiguration setIsHostingView:](v3, "setIsHostingView:", 0);
    -[MIUIDisplayConfiguration setShouldShowDoneButton:](v3, "setShouldShowDoneButton:", 0);
  }
  return v3;
}

- (int64_t)entryPoint
{
  return self->_entryPoint;
}

- (void)setEntryPoint:(int64_t)a3
{
  self->_entryPoint = a3;
}

- (BOOL)isEditingAvailable
{
  return self->_isEditingAvailable;
}

- (void)setIsEditingAvailable:(BOOL)a3
{
  self->_isEditingAvailable = a3;
}

- (BOOL)isDeletionAvailable
{
  return self->_isDeletionAvailable;
}

- (void)setIsDeletionAvailable:(BOOL)a3
{
  self->_isDeletionAvailable = a3;
}

- (BOOL)shouldShowDonateLifeRegistrationIfAvailable
{
  return self->_shouldShowDonateLifeRegistrationIfAvailable;
}

- (void)setShouldShowDonateLifeRegistrationIfAvailable:(BOOL)a3
{
  self->_shouldShowDonateLifeRegistrationIfAvailable = a3;
}

- (BOOL)isShowWhenLockedVisible
{
  return self->_isShowWhenLockedVisible;
}

- (void)setIsShowWhenLockedVisible:(BOOL)a3
{
  self->_isShowWhenLockedVisible = a3;
}

- (BOOL)isShareDuringEmergencyCallVisible
{
  return self->_isShareDuringEmergencyCallVisible;
}

- (void)setIsShareDuringEmergencyCallVisible:(BOOL)a3
{
  self->_isShareDuringEmergencyCallVisible = a3;
}

- (BOOL)suggestHealthData
{
  return self->_suggestHealthData;
}

- (void)setSuggestHealthData:(BOOL)a3
{
  self->_suggestHealthData = a3;
}

- (BOOL)isHomeIndicatorHidden
{
  return self->_isHomeIndicatorHidden;
}

- (void)setIsHomeIndicatorHidden:(BOOL)a3
{
  self->_isHomeIndicatorHidden = a3;
}

- (int64_t)accessPoint
{
  return self->_accessPoint;
}

- (void)setAccessPoint:(int64_t)a3
{
  self->_accessPoint = a3;
}

- (BOOL)shouldSaveDataToHealthDetails
{
  return self->_shouldSaveDataToHealthDetails;
}

- (void)setShouldSaveDataToHealthDetails:(BOOL)a3
{
  self->_shouldSaveDataToHealthDetails = a3;
}

- (BOOL)isLockScreen
{
  return self->_isLockScreen;
}

- (void)setIsLockScreen:(BOOL)a3
{
  self->_isLockScreen = a3;
}

- (BOOL)isHostingView
{
  return self->_isHostingView;
}

- (void)setIsHostingView:(BOOL)a3
{
  self->_isHostingView = a3;
}

- (BOOL)shouldShowDoneButton
{
  return self->_shouldShowDoneButton;
}

- (void)setShouldShowDoneButton:(BOOL)a3
{
  self->_shouldShowDoneButton = a3;
}

@end
