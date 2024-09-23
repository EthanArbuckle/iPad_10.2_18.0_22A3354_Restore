@implementation EdgeController

- (void)dealloc
{
  objc_super v3;

  -[EdgeController setCoreTelephonyClient:](self, "setCoreTelephonyClient:", 0);
  -[EdgeController setContext:](self, "setContext:", 0);
  v3.receiver = self;
  v3.super_class = (Class)EdgeController;
  -[EdgeController dealloc](&v3, sel_dealloc);
}

- (void)setCoreTelephonyClient:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (id)specifiersWithSpecifier:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v10;
  unsigned int v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  CoreTelephonyClient *v15;
  uint64_t v16;

  v4 = *MEMORY[0x24BE75CE8];
  -[EdgeController setContext:](self, "setContext:", objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75CE8]));
  NSLog(CFSTR("EdgeController for context: %@"), -[CTXPCServiceSubscriptionContext description](-[EdgeController context](self, "context"), "description"));
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = objc_alloc(MEMORY[0x24BDC2810]);
  -[EdgeController setCoreTelephonyClient:](self, "setCoreTelephonyClient:", (id)objc_msgSend(v7, "initWithQueue:", MEMORY[0x24BDAC9B8]));
  if (!-[EdgeController coreTelephonyClient](self, "coreTelephonyClient"))
    goto LABEL_4;
  v16 = 0;
  v8 = -[CoreTelephonyClient context:getCarrierBundleValue:error:](self->_coreTelephonyClient, "context:getCarrierBundleValue:error:", -[EdgeController context](self, "context"), &unk_24E08EF28, &v16);
  if (v16)
  {
    NSLog(CFSTR("getCarrierBundleValue(AllowEDGEEditing) failed with %@"), v16);
LABEL_4:
    NSLog(CFSTR("allowEditing = %d"), 0);
    return v6;
  }
  v10 = (void *)v8;
  if (!v8)
    goto LABEL_4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  v11 = objc_msgSend(v10, "BOOLValue");
  NSLog(CFSTR("allowEditing = %d"), v11);
  if (v11)
  {
    v12 = (void *)MEMORY[0x24BE75590];
    if (MGGetBoolAnswer())
      v13 = CFSTR("APN_SETTINGS");
    else
      v13 = CFSTR("EDGE");
    v14 = (void *)objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", objc_msgSend(v5, "localizedStringForKey:value:table:", v13, &stru_24E08D970, CFSTR("Edge")), self, 0, 0, objc_opt_class(), 1, 0);
    objc_msgSend(v14, "setIdentifier:", CFSTR("APN_SETTINGS"));
    objc_msgSend(v14, "setProperty:forKey:", -[EdgeController context](self, "context"), v4);
    v15 = -[EdgeController coreTelephonyClient](self, "coreTelephonyClient");
    objc_msgSend(v14, "setProperty:forKey:", v15, kEdgeSettingsClientConnection);
    objc_msgSend(v6, "addObject:", v14);
  }
  return v6;
}

- (CTXPCServiceSubscriptionContext)context
{
  return self->_context;
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setBasebandValue:(id)a3 forTraceName:(id)a4 property:(id)a5
{
  uint64_t v6;
  const void *v7;

  v6 = _CTServerConnectionCreate();
  if (v6)
  {
    v7 = (const void *)v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(a3, "BOOLValue", 0, 0, 0, 0, 0);
    _CTServerConnectionSetTraceProperty();
    CFRelease(v7);
  }
}

@end
