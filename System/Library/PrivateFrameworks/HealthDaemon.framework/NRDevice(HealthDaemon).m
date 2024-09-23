@implementation NRDevice(HealthDaemon)

- (uint64_t)hd_name
{
  return objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0D51728]);
}

- (uint64_t)hd_pairingID
{
  return objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0D51730]);
}

- (uint64_t)hd_systemBuildVersion
{
  return objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0D51760]);
}

- (uint64_t)hd_productType
{
  return objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0D51738]);
}

- (uint64_t)hd_isActive
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0D516C8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)hd_isAltAccount
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0D516D8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)hd_lastActiveDate
{
  return objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0D516F0]);
}

- (uint64_t)hd_lastInactiveDate
{
  return objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0D516F8]);
}

- (id)hd_shortDescription
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  objc_msgSend(a1, "hd_name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hd_pairingID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@:%p \"%@\" %@>"), v3, a1, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
