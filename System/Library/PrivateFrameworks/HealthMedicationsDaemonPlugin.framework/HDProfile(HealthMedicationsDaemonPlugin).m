@implementation HDProfile(HealthMedicationsDaemonPlugin)

- (id)healthMedicationsProfileExtension
{
  void *v4;
  void *v6;
  void *v7;

  objc_msgSend(a1, "profileExtensionWithIdentifier:", CFSTR("com.apple.health.MedicationsDaemonPlugin"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "_profileExpectsExtension") && !v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "profileIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDHealthMedicationsProfileExtension.m"), 114, CFSTR("Health Medications Profile Extension is nil in profile %@"), v7);

  }
  return v4;
}

- (BOOL)_profileExpectsExtension
{
  uint64_t v1;
  _BOOL4 v2;

  v1 = objc_msgSend(a1, "profileType");
  v2 = v1 == 1 || v1 == 100;
  return (unint64_t)(v1 - 2) >= 3 && v2;
}

@end
