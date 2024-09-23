@implementation BLSHLocalOnlySimplePlatformProvider

- (BLSHLocalOnlySimplePlatformProvider)initWithConfiguration:(id)a3
{
  id v4;
  BLSHLocalOnlySimplePlatformProvider *v5;
  double v6;
  double v7;
  double v8;
  float v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BLSHLocalOnlySimplePlatformProvider;
  v5 = -[BLSHLocalOnlySimplePlatformProvider init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "fadeInDuration");
    v5->_backlightFadeInDuration = v6;
    objc_msgSend(v4, "fadeOutDuration");
    v5->_backlightFadeOutDuration = v7;
    objc_msgSend(v4, "dimmingDuration");
    v5->_backlightDimmingDuration = v8;
    objc_msgSend(v4, "dimmedFactor");
    v5->_backlightDimmedFactor = v9;
  }

  return v5;
}

- (BOOL)isShowingBlankingWindow
{
  return 0;
}

- (id)createInactiveEnvironmentSession
{
  BLSHBacklightEnvironmentPresentation *v2;
  BLSHBacklightEnvironmentPresentation *v3;
  void *v4;

  v2 = [BLSHBacklightEnvironmentPresentation alloc];
  v3 = -[BLSHBacklightEnvironmentPresentation initWithPresentationEntries:flipbookContext:expirationDate:](v2, "initWithPresentationEntries:flipbookContext:expirationDate:", MEMORY[0x24BDBD1A8], 0, 0);
  +[BLSHBacklightInactiveEnvironmentSession sessionWithPresentation:](BLSHBacklightInactiveEnvironmentSession, "sessionWithPresentation:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)backlightFadeInDuration
{
  return self->_backlightFadeInDuration;
}

- (double)backlightFadeOutDuration
{
  return self->_backlightFadeOutDuration;
}

- (double)backlightDimmingDuration
{
  return self->_backlightDimmingDuration;
}

- (float)backlightDimmedFactor
{
  return self->_backlightDimmedFactor;
}

@end
