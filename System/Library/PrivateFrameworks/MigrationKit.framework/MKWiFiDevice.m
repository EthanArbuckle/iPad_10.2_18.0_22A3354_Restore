@implementation MKWiFiDevice

- (id)currentNetwork
{
  id v3;
  uint64_t v4;
  const void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = WiFiManagerClientCreate();
  if (v4)
  {
    v5 = (const void *)v4;
    -[MKWiFiDevice channel:](self, "channel:", WiFiManagerClientGetDevice());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("en0"));

    CFRelease(v5);
  }
  return v3;
}

- (id)channel:(__WiFiDeviceClient *)a3
{
  void *v3;
  void *v4;
  id v5;

  if (a3 && WiFiDeviceClientCopyCurrentNetwork())
  {
    WiFiNetworkGetChannel();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      v5 = v3;
    else
      v5 = &unk_24E36B7C0;

  }
  else
  {
    v5 = &unk_24E36B7C0;
  }
  return v5;
}

@end
