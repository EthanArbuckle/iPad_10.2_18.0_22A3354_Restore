@implementation CHSMutableScreenshotPresentationAttributes

- (void)setColorScheme:(int64_t)a3
{
  self->super._colorScheme = a3;
}

- (void)setAllowsPrivacySensitiveContent:(BOOL)a3
{
  self->super._allowsPrivacySensitiveContent = a3;
}

- (void)setUserWantsWidgetDataWhenPasscodeLocked:(BOOL)a3
{
  self->super._userWantsWidgetDataWhenPasscodeLocked = a3;
}

- (void)setTintParameters:(id)a3
{
  objc_storeStrong((id *)&self->super._tintParameters, a3);
}

- (void)setAdditionalSettingsContext:(id)a3
{
  NSString *v4;
  NSString *additionalSettingsContext;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  additionalSettingsContext = self->super._additionalSettingsContext;
  self->super._additionalSettingsContext = v4;

}

@end
