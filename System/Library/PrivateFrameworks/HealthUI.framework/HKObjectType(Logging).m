@implementation HKObjectType(Logging)

- (uint64_t)logPrivacyLevel
{
  uint64_t v1;
  uint64_t result;
  BOOL v3;

  v1 = objc_msgSend(a1, "code");
  result = 3;
  v3 = (unint64_t)(v1 - 262) > 0x34 || ((1 << (v1 - 6)) & 0x1800000000000FLL) == 0;
  if (v3
    && ((unint64_t)(v1 - 191) > 0x34 || ((1 << (v1 + 65)) & 0x10000000000003) == 0)
    && (unint64_t)(v1 - 95) >= 2)
  {
    return 0;
  }
  return result;
}

- (BOOL)requiresSensitiveHealthLogs
{
  uint64_t v1;
  _BOOL8 result;
  BOOL v3;

  v1 = objc_msgSend(a1, "code");
  result = 1;
  v3 = (unint64_t)(v1 - 262) > 0x34 || ((1 << (v1 - 6)) & 0x1800000000000FLL) == 0;
  if (v3 && ((unint64_t)(v1 - 191) > 0x34 || ((1 << (v1 + 65)) & 0x10000000000003) == 0))
    return (unint64_t)(v1 - 95) < 2;
  return result;
}

- (id)sensitiveLoggingIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  if (objc_msgSend(a1, "requiresSensitiveHealthLogs"))
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    HKSensitiveLogItem();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (uint64_t)isAbleToWriteHealthSensitiveLogs
{
  void *v1;
  uint64_t v2;

  if (!objc_msgSend(a1, "requiresSensitiveHealthLogs"))
    return 1;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "showSensitiveLogItems");

  return v2;
}

@end
