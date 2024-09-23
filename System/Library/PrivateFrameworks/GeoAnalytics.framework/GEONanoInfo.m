@implementation GEONanoInfo

+ (id)sharedInfo
{
  return 0;
}

- (id)hasPairedDevice
{
  return (id)MEMORY[0x24BDBD1C0];
}

- (id)hasPairedDeviceIfAvailable
{
  return (id)MEMORY[0x24BDBD1C0];
}

- (id)deviceSystemVersion
{
  return 0;
}

- (id)deviceSystemVersionIfAvailable
{
  return 0;
}

- (id)deviceSystemBuildVersion
{
  return 0;
}

- (id)deviceSystemBuildVersionIfAvailable
{
  return 0;
}

- (id)deviceProductType
{
  return 0;
}

- (id)deviceProductTypeIfAvailable
{
  return 0;
}

- (id)deviceIsAltAcct
{
  return (id)MEMORY[0x24BDBD1C0];
}

- (id)deviceIsAltAcctIfAvailable
{
  return (id)MEMORY[0x24BDBD1C0];
}

- (id)deviceOsVersionIfAvailable
{
  void *v3;
  void *v4;
  void *v5;

  -[GEONanoInfo deviceSystemVersionIfAvailable](self, "deviceSystemVersionIfAvailable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[GEONanoInfo deviceSystemBuildVersionIfAvailable](self, "deviceSystemBuildVersionIfAvailable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
