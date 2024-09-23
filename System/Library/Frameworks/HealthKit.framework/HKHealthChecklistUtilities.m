@implementation HKHealthChecklistUtilities

+ (id)shared
{
  return objc_alloc_init(HKHealthChecklistUtilities);
}

- (BOOL)isHealthChecklistAvailable
{
  _BOOL4 v3;
  BOOL v4;

  v3 = -[HKHealthChecklistUtilities isHealthAppVisibleAndInstalled](self, "isHealthAppVisibleAndInstalled");
  if (v3)
  {
    v4 = -[HKHealthChecklistUtilities isMedicalIDAvailable](self, "isMedicalIDAvailable");
    LOBYTE(v3) = v4 & -[HKHealthChecklistUtilities isEmergencySOSAvailable](self, "isEmergencySOSAvailable");
  }
  return v3;
}

- (BOOL)isHealthAppVisibleAndInstalled
{
  void *v2;
  __CFString *v3;
  void *v4;
  int v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v3 == CFSTR("com.apple.Health"))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "healthAppHiddenOrNotInstalled") ^ 1;

  }
  return v5;
}

- (BOOL)isMedicalIDAvailable
{
  void *v2;
  char v3;

  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isiPad");

  if ((v3 & 1) != 0)
    return 0;
  else
    return MGGetBoolAnswer();
}

- (BOOL)isEmergencySOSAvailable
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getSOSManagerClass_softClass;
  v9 = getSOSManagerClass_softClass;
  if (!getSOSManagerClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getSOSManagerClass_block_invoke;
    v5[3] = &unk_1E37E8690;
    v5[4] = &v6;
    __getSOSManagerClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  return objc_msgSend(v3, "deviceSupportsSOS");
}

@end
