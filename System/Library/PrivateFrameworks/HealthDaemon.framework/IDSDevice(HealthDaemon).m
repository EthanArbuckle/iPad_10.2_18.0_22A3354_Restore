@implementation IDSDevice(HealthDaemon)

- (id)hd_destinationIdentifier
{
  return (id)IDSCopyIDForDevice();
}

- (uint64_t)hd_isEquivalentToDevice:()HealthDaemon
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(a1, "hd_deviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hd_deviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v4, "hd_deviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(a1, "hd_deviceIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hd_deviceIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (id)hd_shortDescription
{
  void *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  objc_msgSend(a1, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "isActive"))
    v5 = "active";
  else
    v5 = "inactive";
  objc_msgSend(a1, "hd_deviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@:%p \"%@\" (%s) device-id:%@>"), v3, a1, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
