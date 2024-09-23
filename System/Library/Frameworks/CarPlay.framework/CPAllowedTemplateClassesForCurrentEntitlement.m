@implementation CPAllowedTemplateClassesForCurrentEntitlement

void __CPAllowedTemplateClassesForCurrentEntitlement_block_invoke()
{
  void *v0;
  id v1;
  void *v2;

  if (CPCurrentProcessHasMapsEntitlement())
  {
    if (CPNavigationTemplateClasses_onceToken != -1)
      dispatch_once(&CPNavigationTemplateClasses_onceToken, &__block_literal_global_538);
    v0 = (void *)CPNavigationTemplateClasses_classes;
LABEL_18:
    v1 = v0;
LABEL_19:
    v2 = (void *)CPAllowedTemplateClassesForCurrentEntitlement_allowedTemplateClasses;
    CPAllowedTemplateClassesForCurrentEntitlement_allowedTemplateClasses = (uint64_t)v1;

    return;
  }
  if (CPCurrentProcessHasAudioEntitlement())
  {
    if (CPAudioTemplateClasses_onceToken != -1)
      dispatch_once(&CPAudioTemplateClasses_onceToken, &__block_literal_global_539);
    v0 = (void *)CPAudioTemplateClasses_classes;
    goto LABEL_18;
  }
  if (CPCurrentProcessHasCommunicationEntitlement())
  {
    if (CPCommunicationTemplateClasses_onceToken != -1)
      dispatch_once(&CPCommunicationTemplateClasses_onceToken, &__block_literal_global_540);
    v0 = (void *)CPCommunicationTemplateClasses_classes;
    goto LABEL_18;
  }
  if ((CPCurrentProcessHasChargingEntitlement() & 1) != 0 || CPCurrentProcessHasParkingEntitlement())
  {
    if (CPChargingParkingTemplateClasses_onceToken != -1)
      dispatch_once(&CPChargingParkingTemplateClasses_onceToken, &__block_literal_global_541);
    v0 = (void *)CPChargingParkingTemplateClasses_classes;
    goto LABEL_18;
  }
  if (CPCurrentProcessHasQuickOrderingEntitlement())
  {
    CPQuickOrderingTemplateClasses();
    v1 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (CPCurrentProcessHasPublicSafetyEntitlement())
  {
    CPPublicSafetyTemplateClasses();
    v1 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (CPCurrentProcessHasFuelingEntitlement())
  {
    CPFuelingTemplateClasses();
    v1 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (CPCurrentProcessHasDrivingTaskEntitlement())
  {
    CPDrivingTaskTemplateClasses();
    v1 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
}

@end
