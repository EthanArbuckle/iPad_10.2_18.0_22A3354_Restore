@implementation DNDSModeAssertionSourceRecord

+ (id)recordForDictionary:(id)a3 keys:(id *)a4
{
  id v5;
  DNDSModeAssertionSourceRecord *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v5 = a3;
    v6 = objc_alloc_init(DNDSModeAssertionSourceRecord);
    objc_msgSend(v5, "bs_safeStringForKey:", a4->var4.var0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionSourceRecord setClientIdentifier:](v6, "setClientIdentifier:", v7);

    objc_msgSend(v5, "bs_safeStringForKey:", a4->var4.var1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[DNDSModeAssertionSourceRecord setDeviceIdentifier:](v6, "setDeviceIdentifier:", v8);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)dictionaryWithKeys:(id *)a3 options:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionSourceRecord clientIdentifier](self, "clientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_setSafeObject:forKey:", v7, a3->var4.var0);

  -[DNDSModeAssertionSourceRecord deviceIdentifier](self, "deviceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_setSafeObject:forKey:", v8, a3->var4.var1);

  return v6;
}

+ (id)recordForAssertionSource:(id)a3
{
  id v3;
  DNDSModeAssertionSourceRecord *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(DNDSModeAssertionSourceRecord);
    objc_msgSend(v3, "clientIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionSourceRecord setClientIdentifier:](v4, "setClientIdentifier:", v5);

    objc_msgSend(v3, "deviceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[DNDSModeAssertionSourceRecord setDeviceIdentifier:](v4, "setDeviceIdentifier:", v6);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)object
{
  void *v3;
  void *v4;
  void *v5;

  -[DNDSModeAssertionSourceRecord clientIdentifier](self, "clientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionSourceRecord deviceIdentifier](self, "deviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D648]), "initWithClientIdentifier:deviceIdentifier:", v3, v4);
  else
    v5 = 0;

  return v5;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end
