@implementation FBMutableSystemShellInitializationOptions

- (void)setInitializeReadyForInteraction:(BOOL)a3
{
  self->super._initializeReadyForInteraction = a3;
}

- (void)setResetDarkBootState:(BOOL)a3
{
  self->super._resetDarkBootState = a3;
}

- (void)setShouldWaitForMigrator:(BOOL)a3
{
  self->super._shouldWaitForMigrator = a3;
}

- (void)setInitializeDisplayManager:(BOOL)a3
{
  self->super._initializeDisplayManager = a3;
}

- (void)setSystemSleepInterval:(double)a3
{
  self->super._systemSleepInterval = a3;
}

- (void)setRegisterAdditionalServicesBlock:(id)a3
{
  void *v4;
  id registerServicesBlock;

  v4 = (void *)objc_msgSend(a3, "copy");
  registerServicesBlock = self->super._registerServicesBlock;
  self->super._registerServicesBlock = v4;

}

- (void)setIndependentWatchdogPortName:(id)a3
{
  NSString *v4;
  NSString *independentWatchdogPortName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  independentWatchdogPortName = self->super._independentWatchdogPortName;
  self->super._independentWatchdogPortName = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FBSystemShellInitializationOptions _initWithOptions:]([FBSystemShellInitializationOptions alloc], "_initWithOptions:", self);
}

@end
