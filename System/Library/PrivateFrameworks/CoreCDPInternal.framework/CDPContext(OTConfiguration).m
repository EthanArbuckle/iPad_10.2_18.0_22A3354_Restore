@implementation CDPContext(OTConfiguration)

- (id)octagonConfigurationContext
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init(MEMORY[0x24BDE84B8]);
  objc_msgSend(a1, "dsid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDsid:", v4);

  objc_msgSend(a1, "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAltDSID:", v5);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "telemetryFlowID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setFlowID:", v6);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "telemetryDeviceSessionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setDeviceSessionID:", v7);

  }
  return v2;
}

@end
