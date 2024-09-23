@implementation AEConcretePreferences

- (id)initWithPrimitives:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)AEConcretePreferences;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

- (AEConcretePreferences)init
{
  _QWORD *v3;
  AEConcretePreferences *v4;

  v3 = -[AEConcretePreferencePrimitives initWithDomain:]([AEConcretePreferencePrimitives alloc], CFSTR("com.apple.assessmentmode"));
  v4 = (AEConcretePreferences *)-[AEConcretePreferences initWithPrimitives:]((id *)&self->super.isa, v3);

  return v4;
}

- (BOOL)shouldEnterSandbox
{
  return -[AEConcretePreferences assessmentBoolForKey:]((uint64_t)self, (uint64_t)CFSTR("IgnoreEnterSandbox")) ^ 1;
}

- (uint64_t)assessmentBoolForKey:(uint64_t)a1
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 8), "BOOLForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setEnterSandbox:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    if (a3)
      v3 = 0;
    else
      v3 = MEMORY[0x24BDBD1C8];
    -[AEPreferencePrimitives setBool:forKey:](self->_primitives, "setBool:forKey:", v3, CFSTR("IgnoreEnterSandbox"));
  }
}

- (BOOL)shouldPresentShields
{
  return -[AEConcretePreferences assessmentBoolForKey:]((uint64_t)self, (uint64_t)CFSTR("IgnorePresentShields")) ^ 1;
}

- (void)setPresentShields:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    if (a3)
      v3 = 0;
    else
      v3 = MEMORY[0x24BDBD1C8];
    -[AEPreferencePrimitives setBool:forKey:](self->_primitives, "setBool:forKey:", v3, CFSTR("IgnorePresentShields"));
  }
}

- (BOOL)shouldDisableSiri
{
  return -[AEConcretePreferences assessmentBoolForKey:]((uint64_t)self, (uint64_t)CFSTR("IgnoreDisableSiri")) ^ 1;
}

- (void)setDisableSiri:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    if (a3)
      v3 = 0;
    else
      v3 = MEMORY[0x24BDBD1C8];
    -[AEPreferencePrimitives setBool:forKey:](self->_primitives, "setBool:forKey:", v3, CFSTR("IgnoreDisableSiri"));
  }
}

- (BOOL)shouldDisableContinuity
{
  return -[AEConcretePreferences assessmentBoolForKey:]((uint64_t)self, (uint64_t)CFSTR("IgnoreDisableContinuity")) ^ 1;
}

- (void)setDisableContinuity:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    if (a3)
      v3 = 0;
    else
      v3 = MEMORY[0x24BDBD1C8];
    -[AEPreferencePrimitives setBool:forKey:](self->_primitives, "setBool:forKey:", v3, CFSTR("IgnoreDisableContinuity"));
  }
}

- (BOOL)shouldScrubPasteboard
{
  return -[AEConcretePreferences assessmentBoolForKey:]((uint64_t)self, (uint64_t)CFSTR("IgnoreScrubPasteboard")) ^ 1;
}

- (void)setScrubPasteboard:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    if (a3)
      v3 = 0;
    else
      v3 = MEMORY[0x24BDBD1C8];
    -[AEPreferencePrimitives setBool:forKey:](self->_primitives, "setBool:forKey:", v3, CFSTR("IgnoreScrubPasteboard"));
  }
}

- (BOOL)shouldRestrictNetworkAccess
{
  return -[AEConcretePreferences assessmentBoolForKey:]((uint64_t)self, (uint64_t)CFSTR("IgnoreRestrictNetworkAccess")) ^ 1;
}

- (void)setRestrictNetworkAccess:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    if (a3)
      v3 = 0;
    else
      v3 = MEMORY[0x24BDBD1C8];
    -[AEPreferencePrimitives setBool:forKey:](self->_primitives, "setBool:forKey:", v3, CFSTR("IgnoreRestrictNetworkAccess"));
  }
}

- (BOOL)shouldRestrictFrontmostApp
{
  return -[AEConcretePreferences assessmentBoolForKey:]((uint64_t)self, (uint64_t)CFSTR("IgnoreRestrictFrontmostApp")) ^ 1;
}

- (void)setRestrictFrontmostApp:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    if (a3)
      v3 = 0;
    else
      v3 = MEMORY[0x24BDBD1C8];
    -[AEPreferencePrimitives setBool:forKey:](self->_primitives, "setBool:forKey:", v3, CFSTR("IgnoreRestrictFrontmostApp"));
  }
}

- (BOOL)shouldStopAirPlayBeforehand
{
  return -[AEConcretePreferences assessmentBoolForKey:]((uint64_t)self, (uint64_t)CFSTR("IgnoreStopAirPlayBeforehand")) ^ 1;
}

- (void)setStopAirPlayBeforehand:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    if (a3)
      v3 = 0;
    else
      v3 = MEMORY[0x24BDBD1C8];
    -[AEPreferencePrimitives setBool:forKey:](self->_primitives, "setBool:forKey:", v3, CFSTR("IgnoreStopAirPlayBeforehand"));
  }
}

- (BOOL)shouldRestrictContentCapture
{
  return -[AEConcretePreferences assessmentBoolForKey:]((uint64_t)self, (uint64_t)CFSTR("IgnoreRestrictContentCapture")) ^ 1;
}

- (void)setRestrictContentCapture:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    if (a3)
      v3 = 0;
    else
      v3 = MEMORY[0x24BDBD1C8];
    -[AEPreferencePrimitives setBool:forKey:](self->_primitives, "setBool:forKey:", v3, CFSTR("IgnoreRestrictContentCapture"));
  }
}

- (BOOL)shouldDisableTrackpadLookup
{
  return -[AEConcretePreferences assessmentBoolForKey:]((uint64_t)self, (uint64_t)CFSTR("IgnoreDisableTrackpadLookup")) ^ 1;
}

- (void)setDisableTrackpadLookup:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    if (a3)
      v3 = 0;
    else
      v3 = MEMORY[0x24BDBD1C8];
    -[AEPreferencePrimitives setBool:forKey:](self->_primitives, "setBool:forKey:", v3, CFSTR("IgnoreDisableTrackpadLookup"));
  }
}

- (BOOL)shouldCaptureDisplays
{
  return -[AEConcretePreferences assessmentBoolForKey:]((uint64_t)self, (uint64_t)CFSTR("IgnoreCaptureDisplays")) ^ 1;
}

- (void)setCaptureDisplays:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    if (a3)
      v3 = 0;
    else
      v3 = MEMORY[0x24BDBD1C8];
    -[AEPreferencePrimitives setBool:forKey:](self->_primitives, "setBool:forKey:", v3, CFSTR("IgnoreCaptureDisplays"));
  }
}

- (BOOL)shouldElevateWindows
{
  return -[AEConcretePreferences assessmentBoolForKey:]((uint64_t)self, (uint64_t)CFSTR("IgnoreElevateWindows")) ^ 1;
}

- (void)setElevateWindows:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    if (a3)
      v3 = 0;
    else
      v3 = MEMORY[0x24BDBD1C8];
    -[AEPreferencePrimitives setBool:forKey:](self->_primitives, "setBool:forKey:", v3, CFSTR("IgnoreElevateWindows"));
  }
}

- (BOOL)shouldDisableDictation
{
  return -[AEConcretePreferences assessmentBoolForKey:]((uint64_t)self, (uint64_t)CFSTR("IgnoreDisableDication")) ^ 1;
}

- (void)setDisableDictation:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    if (a3)
      v3 = 0;
    else
      v3 = MEMORY[0x24BDBD1C8];
    -[AEPreferencePrimitives setBool:forKey:](self->_primitives, "setBool:forKey:", v3, CFSTR("IgnoreDisableDication"));
  }
}

- (BOOL)shouldDisableQuickNote
{
  return -[AEConcretePreferences assessmentBoolForKey:]((uint64_t)self, (uint64_t)CFSTR("IgnoreDisableQuickNote")) ^ 1;
}

- (void)setDisableQuickNote:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    if (a3)
      v3 = 0;
    else
      v3 = MEMORY[0x24BDBD1C8];
    -[AEPreferencePrimitives setBool:forKey:](self->_primitives, "setBool:forKey:", v3, CFSTR("IgnoreDisableQuickNote"));
  }
}

- (BOOL)isPortalDemoModeActive
{
  return -[AEConcretePreferences assessmentBoolForKey:]((uint64_t)self, (uint64_t)CFSTR("PortalDemoModeActive"));
}

- (void)setPortalDemoModeActive:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    if (a3)
      v3 = MEMORY[0x24BDBD1C8];
    else
      v3 = 0;
    -[AEPreferencePrimitives setBool:forKey:](self->_primitives, "setBool:forKey:", v3, CFSTR("PortalDemoModeActive"));
  }
}

- (BOOL)shouldRestrictMedia
{
  return -[AEConcretePreferences assessmentBoolForKey:]((uint64_t)self, (uint64_t)CFSTR("IgnoreRestrictMedia")) ^ 1;
}

- (void)setRestrictMedia:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    if (a3)
      v3 = 0;
    else
      v3 = MEMORY[0x24BDBD1C8];
    -[AEPreferencePrimitives setBool:forKey:](self->_primitives, "setBool:forKey:", v3, CFSTR("IgnoreRestrictMedia"));
  }
}

- (BOOL)shouldEnforceSingleAppMode
{
  return -[AEConcretePreferences assessmentBoolForKey:]((uint64_t)self, (uint64_t)CFSTR("IgnoreEnforceSingleAppMode")) ^ 1;
}

- (void)setEnforceSingleAppMode:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    if (a3)
      v3 = 0;
    else
      v3 = MEMORY[0x24BDBD1C8];
    -[AEPreferencePrimitives setBool:forKey:](self->_primitives, "setBool:forKey:", v3, CFSTR("IgnoreEnforceSingleAppMode"));
  }
}

- (BOOL)shouldShowPromptsAndBanners
{
  return -[AEConcretePreferences assessmentBoolForKey:]((uint64_t)self, (uint64_t)CFSTR("IgnoreShowPromptsAndBanners")) ^ 1;
}

- (void)setShowPromptsAndBanners:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    if (a3)
      v3 = 0;
    else
      v3 = MEMORY[0x24BDBD1C8];
    -[AEPreferencePrimitives setBool:forKey:](self->_primitives, "setBool:forKey:", v3, CFSTR("IgnoreShowPromptsAndBanners"));
  }
}

- (BOOL)shouldForceScreenMirroring
{
  return -[AEConcretePreferences assessmentBoolForKey:]((uint64_t)self, (uint64_t)CFSTR("IgnoreForceScreenMirroring")) ^ 1;
}

- (void)setForceScreenMirroring:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    if (a3)
      v3 = 0;
    else
      v3 = MEMORY[0x24BDBD1C8];
    -[AEPreferencePrimitives setBool:forKey:](self->_primitives, "setBool:forKey:", v3, CFSTR("IgnoreForceScreenMirroring"));
  }
}

- (BOOL)shouldAllowRemotelyKillingAgent
{
  return 1;
}

- (BOOL)shouldSetCustomHomeScreenLayout
{
  return -[AEConcretePreferences assessmentBoolForKey:]((uint64_t)self, (uint64_t)CFSTR("IgnoreCustomHomeScreenLayout")) ^ 1;
}

- (void)setSetCustomHomeScreenLayout:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    if (a3)
      v3 = 0;
    else
      v3 = MEMORY[0x24BDBD1C8];
    -[AEPreferencePrimitives setBool:forKey:](self->_primitives, "setBool:forKey:", v3, CFSTR("IgnoreCustomHomeScreenLayout"));
  }
}

- (double)expirationTime
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[AEConcretePreferences assessmentNumberForKey:]((id *)&self->super.isa, (uint64_t)CFSTR("ExpirationTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 28800.0;
  }

  return v5;
}

- (id)assessmentNumberForKey:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[1], "numberForKey:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)setExpirationTime:(double)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v5 = v4;
    -[AEPreferencePrimitives setNumber:forKey:](self->_primitives, "setNumber:forKey:", v4, CFSTR("ExpirationTime"));
    v4 = v5;
  }

}

- (BOOL)shouldFailOnDeactivation
{
  return -[AEConcretePreferences assessmentBoolForKey:]((uint64_t)self, (uint64_t)CFSTR("FailOnDeactivationKey"));
}

- (void)setFailOnDeactivation:(BOOL)a3
{
  uint64_t v3;

  if (self)
  {
    if (a3)
      v3 = MEMORY[0x24BDBD1C8];
    else
      v3 = 0;
    -[AEPreferencePrimitives setBool:forKey:](self->_primitives, "setBool:forKey:", v3, CFSTR("FailOnDeactivationKey"));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primitives, 0);
}

@end
