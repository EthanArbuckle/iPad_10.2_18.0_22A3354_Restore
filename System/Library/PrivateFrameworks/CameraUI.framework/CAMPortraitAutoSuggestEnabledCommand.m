@implementation CAMPortraitAutoSuggestEnabledCommand

- (CAMPortraitAutoSuggestEnabledCommand)initWithPortraitAutoSuggestEnabled:(BOOL)a3
{
  CAMPortraitAutoSuggestEnabledCommand *v4;
  CAMPortraitAutoSuggestEnabledCommand *v5;
  CAMPortraitAutoSuggestEnabledCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMPortraitAutoSuggestEnabledCommand;
  v4 = -[CAMCaptureCommand initWithSubcommands:](&v8, sel_initWithSubcommands_, 0);
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMPortraitAutoSuggestEnabledCommand)initWithSubcommands:(id)a3
{
  return -[CAMPortraitAutoSuggestEnabledCommand initWithPortraitAutoSuggestEnabled:](self, "initWithPortraitAutoSuggestEnabled:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMPortraitAutoSuggestEnabledCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMPortraitAutoSuggestEnabledCommand _isEnabled](self, "_isEnabled");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  _BOOL8 v5;
  id v6;

  v4 = a3;
  v5 = -[CAMPortraitAutoSuggestEnabledCommand _isEnabled](self, "_isEnabled");
  objc_msgSend(v4, "currentVideoPreviewLayer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isPortraitAutoSuggestSupported"))
    objc_msgSend(v6, "setPortraitAutoSuggestEnabled:", v5);

}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

@end
