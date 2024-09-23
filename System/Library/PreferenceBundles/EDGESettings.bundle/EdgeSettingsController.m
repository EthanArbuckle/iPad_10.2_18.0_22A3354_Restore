@implementation EdgeSettingsController

- (id)getAPNDataForSpecifier:(id)a3
{
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;

  v5 = objc_msgSend((id)objc_msgSend(a3, "propertyForKey:", CFSTR("ServiceTypeUI")), "intValue") - 1;
  if (v5 <= 4 && (v6 = dword_21C9550E0[v5], (v7 = objc_msgSend(a3, "propertyForKey:", CFSTR("apnItemKey"))) != 0))
    return (id)objc_msgSend(-[EdgeSettingsController _getAPNDictinaryForService:](self, "_getAPNDictinaryForService:", v6), "objectForKey:", v7);
  else
    return &stru_24E08D970;
}

- (void)setAPNData:(id)a3 forSpecifier:(id)a4
{
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;

  v7 = objc_msgSend((id)objc_msgSend(a4, "propertyForKey:", CFSTR("ServiceTypeUI")), "intValue") - 1;
  if (v7 >= 5)
  {
    objc_msgSend(a4, "propertyForKey:", CFSTR("apnItemKey"));
  }
  else
  {
    v8 = dword_21C9550E0[v7];
    v9 = objc_msgSend(a4, "propertyForKey:", CFSTR("apnItemKey"));
    if (v9)
      -[EdgeSettingsController _updateKey:toValue:forServiceType:](self, "_updateKey:toValue:forServiceType:", v9, a3, v8);
  }
}

- (void)resetAllConfiguredSettings
{
  CoreTelephonyClient *v3;
  CTXPCServiceSubscriptionContext *v4;
  _QWORD v5[5];

  v3 = -[EdgeSettingsController coreTelephonyClient](self, "coreTelephonyClient");
  v4 = -[EdgeSettingsController context](self, "context");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__EdgeSettingsController_resetAllConfiguredSettings__block_invoke;
  v5[3] = &unk_24E08D7E0;
  v5[4] = self;
  -[CoreTelephonyClient resetUIConfiguredApns:completion:](v3, "resetUIConfiguredApns:completion:", v4, v5);
}

void __52__EdgeSettingsController_resetAllConfiguredSettings__block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFString *v3;
  const void *v4;
  const __CFString *v5;
  const __CFString *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];

  if (a2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __52__EdgeSettingsController_resetAllConfiguredSettings__block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "resetAPNsDictionaries");
    objc_msgSend(*(id *)(a1 + 32), "loadCurrentAPNs");
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "context"), "slotID") == 1)
      v3 = CFSTR("MMS");
    else
      v3 = CFSTR("MMS2");
    v4 = (const void *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v5 = (const __CFString *)*MEMORY[0x24BDBD590];
    v6 = (const __CFString *)*MEMORY[0x24BDBD570];
    CFPreferencesSetValue(v3, v4, CFSTR("com.apple.mms_override"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
    CFPreferencesSynchronize(CFSTR("com.apple.mms_override"), v5, v6);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.MMSEnabled.changed"), 0, 0, 0);
    v8 = objc_msgSend(*(id *)(a1 + 32), "shouldResetAttachAPN");
    v9 = *(void **)(a1 + 32);
    if (v8)
    {
      v10 = (void *)objc_msgSend(v9, "coreTelephonyClient");
      v11 = objc_msgSend(*(id *)(a1 + 32), "context");
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __52__EdgeSettingsController_resetAllConfiguredSettings__block_invoke_31;
      v12[3] = &unk_24E08D7E0;
      v12[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v10, "context:modifyAttachApnSettings:completion:", v11, 0, v12);
    }
    else
    {
      objc_msgSend(v9, "reloadSpecifiers");
    }
  }
}

uint64_t __52__EdgeSettingsController_resetAllConfiguredSettings__block_invoke_31(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __52__EdgeSettingsController_resetAllConfiguredSettings__block_invoke_31_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "resetAttachAPNSettings");
  }
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)resetCarrierSettings:(id)a3
{
  if (-[CoreTelephonyClient loadGSMASettings:state:](-[EdgeSettingsController coreTelephonyClient](self, "coreTelephonyClient", a3), "loadGSMASettings:state:", -[EdgeSettingsController context](self, "context"), 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[EdgeSettingsController resetCarrierSettings:].cold.1();
  }
  -[EdgeSettingsController resetAllConfiguredSettings](self, "resetAllConfiguredSettings");
}

- (id)_getMMSObjectForKey:(id)a3
{
  const __CFString *v5;
  void *v6;
  id result;

  if (-[CTXPCServiceSubscriptionContext slotID](-[EdgeSettingsController context](self, "context"), "slotID") == 1)
    v5 = CFSTR("MMS");
  else
    v5 = CFSTR("MMS2");
  v6 = (id)CFPreferencesCopyValue(v5, CFSTR("com.apple.mms_override"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  if (!v6 || (result = (id)objc_msgSend(v6, "objectForKey:", a3)) == 0)
  {
    result = (id)-[CoreTelephonyClient context:getCarrierBundleValue:error:](-[EdgeSettingsController coreTelephonyClient](self, "coreTelephonyClient"), "context:getCarrierBundleValue:error:", -[EdgeSettingsController context](self, "context"), &unk_24E08EF40, 0);
    if (result)
      return (id)objc_msgSend(result, "objectForKey:", a3);
  }
  return result;
}

- (void)_setMMSOverrideValue:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  CFPropertyListRef v11;
  const __CFString *v12;
  __CFNotificationCenter *DarwinNotifyCenter;

  if (!a3 || (v6 = a3, objc_msgSend(a3, "isEqual:", &stru_24E08D970)))
    v6 = 0;
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if (-[CTXPCServiceSubscriptionContext slotID](-[EdgeSettingsController context](self, "context"), "slotID") == 1)
    v8 = CFSTR("MMS");
  else
    v8 = CFSTR("MMS2");
  v9 = (const __CFString *)*MEMORY[0x24BDBD590];
  v10 = (const __CFString *)*MEMORY[0x24BDBD570];
  v11 = (id)CFPreferencesCopyValue(v8, CFSTR("com.apple.mms_override"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  if (v11)
    objc_msgSend(v7, "addEntriesFromDictionary:", v11);
  if (v6)
    objc_msgSend(v7, "setObject:forKey:", v6, a4);
  else
    objc_msgSend(v7, "removeObjectForKey:", a4);
  if (-[CTXPCServiceSubscriptionContext slotID](-[EdgeSettingsController context](self, "context"), "slotID") == 1)
    v12 = CFSTR("MMS");
  else
    v12 = CFSTR("MMS2");
  CFPreferencesSetValue(v12, v7, CFSTR("com.apple.mms_override"), v9, v10);
  CFPreferencesSynchronize(CFSTR("com.apple.mms_override"), v9, v10);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.MMSEnabled.changed"), 0, 0, 0);
}

- (id)getMMSValueForSpecifier:(id)a3
{
  id result;

  result = (id)objc_msgSend(a3, "propertyForKey:", CFSTR("key"));
  if (result)
    return -[EdgeSettingsController _getMMSObjectForKey:](self, "_getMMSObjectForKey:", result);
  return result;
}

- (void)setMMSValue:(id)a3 forSpecifier:(id)a4
{
  uint64_t v7;

  v7 = objc_msgSend(a4, "propertyForKey:", CFSTR("key"));
  if (v7)
  {
    -[EdgeSettingsController _setMMSOverrideValue:forKey:](self, "_setMMSOverrideValue:forKey:", a3, v7);
    if (!a3 || !objc_msgSend(a3, "length"))
      -[EdgeSettingsController reloadSpecifier:](self, "reloadSpecifier:", a4);
  }
}

- (id)getMMSNumericValueForSpecifier:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(a3, "propertyForKey:", CFSTR("key"));
  if (!v4)
    return 0;
  v5 = -[EdgeSettingsController _getMMSObjectForKey:](self, "_getMMSObjectForKey:", v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend(v5, "stringValue");
  return v5;
}

- (void)setMMSNumericValue:(id)a3 forSpecifier:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = objc_msgSend(a4, "propertyForKey:", CFSTR("key"));
  if (!v7)
    return;
  v8 = v7;
  if (!a3)
  {
    -[EdgeSettingsController _setMMSOverrideValue:forKey:](self, "_setMMSOverrideValue:forKey:", 0, v7);
LABEL_9:
    -[EdgeSettingsController reloadSpecifier:](self, "reloadSpecifier:", a4);
    return;
  }
  if (objc_msgSend(a3, "length"))
    v9 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(a3, "intValue"));
  else
    v9 = 0;
  -[EdgeSettingsController _setMMSOverrideValue:forKey:](self, "_setMMSOverrideValue:forKey:", v9, v8);
  if (!objc_msgSend(a3, "length"))
    goto LABEL_9;
}

- (id)edgeDNS:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v4 = -[PSSystemConfiguration dataServiceID](self->_systemConfig, "dataServiceID", a3);
  v5 = (void *)-[PSSystemConfiguration protocolConfigurationValueForKey:protocolType:serviceID:](self->_systemConfig, "protocolConfigurationValueForKey:protocolType:serviceID:", *MEMORY[0x24BDF5A90], *MEMORY[0x24BDF5A50], v4);
  v6 = objc_msgSend(v5, "count");
  if (!v6)
    return &stru_24E08D970;
  if (v6 == 1)
    return (id)objc_msgSend(v5, "objectAtIndex:", 0);
  return (id)objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
}

- (id)getAttachAPNDataForSpecifier:(id)a3
{
  uint64_t v4;
  const __CFString *v5;
  void *v6;

  v4 = objc_msgSend(a3, "propertyForKey:", CFSTR("apnItemKey"));
  v5 = &stru_24E08D970;
  if (v4)
  {
    v6 = (void *)-[NSMutableDictionary objectForKey:](self->_newAttachAPNDict, "objectForKey:", v4);
    if (v6)
      return v6;
  }
  return (id)v5;
}

- (void)setAttachAPNData:(id)a3 forSpecifier:(id)a4
{
  uint64_t v7;
  uint64_t v8;

  v7 = objc_msgSend(a4, "propertyForKey:", CFSTR("apnItemKey"));
  if (a3)
  {
    v8 = v7;
    if (v7)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0
        && (!objc_msgSend(a3, "isEqualToString:", &stru_24E08D970)
         || -[NSMutableDictionary objectForKey:](self->_newAttachAPNDict, "objectForKey:", v8)))
      {
        -[NSMutableDictionary setObject:forKey:](self->_newAttachAPNDict, "setObject:forKey:", a3, v8);
      }
    }
  }
  -[EdgeSettingsController reloadSpecifier:](self, "reloadSpecifier:", a4);
}

- (BOOL)_shouldShowUIForServiceType:(int)a3
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v9;

  v5 = (void *)-[CoreTelephonyClient context:getCarrierBundleValue:error:](-[EdgeSettingsController coreTelephonyClient](self, "coreTelephonyClient"), "context:getCarrierBundleValue:error:", -[EdgeSettingsController context](self, "context"), &unk_24E08EF58, 0);
  if (v5
    || (v5 = (void *)-[CoreTelephonyClient context:getCarrierBundleValue:error:](-[EdgeSettingsController coreTelephonyClient](self, "coreTelephonyClient"), "context:getCarrierBundleValue:error:", -[EdgeSettingsController context](self, "context"), &unk_24E08EF70, 0)) != 0)
  {
    v6 = objc_msgSend(v5, "intValue");
  }
  else
  {
    LODWORD(v6) = 5;
  }
  if (a3 == 1 && (v6 & 1) != 0)
    goto LABEL_6;
  if (a3 == 2 && (v6 & 2) != 0)
  {
    v7 = MGGetBoolAnswer();
    if (v7)
      LOBYTE(v7) = -[EdgeSettingsController _APNDictionaryForServiceFromSC:](self, "_APNDictionaryForServiceFromSC:", 2) != 0;
  }
  else if (a3 == 4 && (v6 & 4) != 0)
  {
    LOBYTE(v7) = MGGetBoolAnswer();
  }
  else
  {
    if (a3 == 0x20000 && (v6 & 0x20000) != 0)
    {
LABEL_6:
      LOBYTE(v7) = 1;
      return v7;
    }
    if (a3 == 48)
    {
      v9 = 0;
      LOBYTE(v7) = -[CoreTelephonyClient isTetheringEditingSupported:error:](-[EdgeSettingsController coreTelephonyClient](self, "coreTelephonyClient"), "isTetheringEditingSupported:error:", -[EdgeSettingsController context](self, "context"), &v9);
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  _BOOL4 v16;

  if (!self->_group1Specifiers)
  {
    v3 = (void *)-[EdgeSettingsController specifier](self, "specifier");
    -[EdgeSettingsController setContext:](self, "setContext:", objc_msgSend(v3, "propertyForKey:", *MEMORY[0x24BE75CE8]));
    v4 = (void *)-[EdgeSettingsController specifier](self, "specifier");
    -[EdgeSettingsController setCoreTelephonyClient:](self, "setCoreTelephonyClient:", objc_msgSend(v4, "propertyForKey:", kEdgeSettingsClientConnection));
    -[CoreTelephonyClient setDelegate:](self->_coreTelephonyClient, "setDelegate:", self);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[EdgeSettingsController specifiers].cold.1(self);
    -[EdgeSettingsController resetAttachAPNSettings](self, "resetAttachAPNSettings");
    -[EdgeSettingsController loadCurrentAPNs](self, "loadCurrentAPNs");
    v5 = (void *)-[EdgeSettingsController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("EDGE Settings"), self);
    if (MGGetBoolAnswer())
      -[EdgeSettingsController setTitle:](self, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("APN_SETTINGS"), &stru_24E08D970, CFSTR("Edge")));
    v6 = objc_msgSend(v5, "count");
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *MEMORY[0x24BE75D08];
      v10 = (int *)MEMORY[0x24BE75738];
      do
      {
        v11 = (char *)objc_msgSend(v5, "objectAtIndex:", v8);
        v12 = *v10;
        if (*(_QWORD *)&v11[v12] == 4)
        {
          *(_QWORD *)&v11[v12] = 8;
          objc_msgSend(v11, "setProperty:forKey:", CFSTR("PSEditTextCell"), v9);
        }
        ++v8;
      }
      while (v7 != v8);
    }
    self->_group1Specifiers = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", objc_msgSend(v5, "specifierForID:", CFSTR("group_1_header")), objc_msgSend(v5, "specifierForID:", CFSTR("group_1_edgeproxytype")), 0);
    self->_pacSpecifiers = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", objc_msgSend(v5, "specifierForID:", CFSTR("pac_header")), objc_msgSend(v5, "specifierForID:", CFSTR("pac_file")), 0);
    self->_manualSpecifiers = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", objc_msgSend(v5, "specifierForID:", CFSTR("pac_header")), objc_msgSend(v5, "specifierForID:", CFSTR("pac_proxyserver")), objc_msgSend(v5, "specifierForID:", CFSTR("pac_port")), objc_msgSend(v5, "specifierForID:", CFSTR("pac_authentication")), 0);
    self->_proxyAuthSpecifiers = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", objc_msgSend(v5, "specifierForID:", CFSTR("pac_username")), objc_msgSend(v5, "specifierForID:", CFSTR("pac_password")), 0);
    self->_InternetContextSpecifiers = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", objc_msgSend(v5, "specifierForID:", CFSTR("internet_header")), objc_msgSend(v5, "specifierForID:", CFSTR("internet_apn")), objc_msgSend(v5, "specifierForID:", CFSTR("internet_username")), objc_msgSend(v5, "specifierForID:", CFSTR("internet_password")), 0);
    self->_VVMContextSpecifiers = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", objc_msgSend(v5, "specifierForID:", CFSTR("vvm_header")), objc_msgSend(v5, "specifierForID:", CFSTR("vvm_apn")), objc_msgSend(v5, "specifierForID:", CFSTR("vvm_username")), objc_msgSend(v5, "specifierForID:", CFSTR("vvm_password")), 0);
    if ((MGGetBoolAnswer() & 1) != 0)
      self->_MMSContextSpecifiers = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", objc_msgSend(v5, "specifierForID:", CFSTR("mms_header")), objc_msgSend(v5, "specifierForID:", CFSTR("mms_apn")), objc_msgSend(v5, "specifierForID:", CFSTR("mms_username")), objc_msgSend(v5, "specifierForID:", CFSTR("mms_password")), objc_msgSend(v5, "specifierForID:", CFSTR("mms_mmsc")), objc_msgSend(v5, "specifierForID:", CFSTR("mms_proxy")), objc_msgSend(v5, "specifierForID:", CFSTR("mms_maxmessagesize")), objc_msgSend(v5, "specifierForID:", CFSTR("mms_uaprofurl")), 0);
    self->_tetheringContextSpecifiers = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", objc_msgSend(v5, "specifierForID:", CFSTR("tethering_header")), objc_msgSend(v5, "specifierForID:", CFSTR("tethering_apn")), objc_msgSend(v5, "specifierForID:", CFSTR("tethering_username")), objc_msgSend(v5, "specifierForID:", CFSTR("tethering_password")), 0);
    self->_lteAttachAPNSpecifiers = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", objc_msgSend(v5, "specifierForID:", CFSTR("lte_attach_apn_header")), objc_msgSend(v5, "specifierForID:", CFSTR("lte_attach_apn")), objc_msgSend(v5, "specifierForID:", CFSTR("lte_attach_username")), objc_msgSend(v5, "specifierForID:", CFSTR("lte_attach_password")), 0);
    self->_IMSContextSpecifiers = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", objc_msgSend(v5, "specifierForID:", CFSTR("ims_header")), objc_msgSend(v5, "specifierForID:", CFSTR("ims_apn")), objc_msgSend(v5, "specifierForID:", CFSTR("ims_username")), objc_msgSend(v5, "specifierForID:", CFSTR("ims_password")), 0);
    self->_resetSpecifiers = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", objc_msgSend(v5, "specifierForID:", CFSTR("reset_settings_header")), objc_msgSend(v5, "specifierForID:", CFSTR("reset_settings")), 0);
  }
  v13 = (int)*MEMORY[0x24BE756E0];

  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = -[EdgeSettingsController getGSMASettingsUIControl](self, "getGSMASettingsUIControl");
  if (v15)
    objc_msgSend(v14, "addObjectsFromArray:", AutoGsmaSettingsSpecifiers((uint64_t)self));
  v16 = -[EdgeSettingsController _shouldShowUIForServiceType:](self, "_shouldShowUIForServiceType:", 1);
  if (v16)
    objc_msgSend(v14, "addObjectsFromArray:", self->_InternetContextSpecifiers);
  if (-[EdgeSettingsController isAttachAPNEditingAllowed](self, "isAttachAPNEditingAllowed"))
    objc_msgSend(v14, "addObjectsFromArray:", self->_lteAttachAPNSpecifiers);
  if (-[EdgeSettingsController _shouldShowUIForServiceType:](self, "_shouldShowUIForServiceType:", 2))
  {
    objc_msgSend(v14, "addObjectsFromArray:", self->_VVMContextSpecifiers);
    v16 = 1;
  }
  if (-[EdgeSettingsController _shouldShowUIForServiceType:](self, "_shouldShowUIForServiceType:", 4))
  {
    objc_msgSend(v14, "addObjectsFromArray:", self->_MMSContextSpecifiers);
    v16 = 1;
  }
  if (-[EdgeSettingsController _shouldShowUIForServiceType:](self, "_shouldShowUIForServiceType:", 0x20000))
  {
    objc_msgSend(v14, "addObjectsFromArray:", self->_IMSContextSpecifiers);
    v16 = 1;
  }
  if (-[EdgeSettingsController _shouldShowUIForServiceType:](self, "_shouldShowUIForServiceType:", 48))
  {
    objc_msgSend(v14, "addObjectsFromArray:", self->_tetheringContextSpecifiers);
    v16 = 1;
  }
  if (v15 != 1 && v16)
    objc_msgSend(v14, "addObjectsFromArray:", self->_resetSpecifiers);
  -[EdgeSettingsController loadCurrentAPNs](self, "loadCurrentAPNs");
  *(Class *)((char *)&self->super.super.super.super.super.isa + v13) = (Class)v14;
  return v14;
}

- (EdgeSettingsController)init
{
  EdgeSettingsController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EdgeSettingsController;
  v2 = -[EdgeSettingsController init](&v4, sel_init);
  if (v2)
  {
    v2->_systemConfig = (PSSystemConfiguration *)(id)objc_msgSend(MEMORY[0x24BE755C8], "sharedInstance");
    v2->_cacheInitialized = 0;
    v2->_internetSettingsDictionary = 0;
    v2->_vvmSettingsDictionary = 0;
    v2->_mmsSettingsDictionary = 0;
    v2->_imsSettingsDictionary = 0;
    v2->_tetheringSettingsDictionary = 0;
  }
  return v2;
}

- (unint64_t)getGSMASettingsUIControl
{
  unint64_t v2;
  uint64_t v4;

  v4 = 0;
  v2 = -[CoreTelephonyClient getGSMAUIControlSetting:error:](-[EdgeSettingsController coreTelephonyClient](self, "coreTelephonyClient"), "getGSMAUIControlSetting:error:", -[EdgeSettingsController context](self, "context"), &v4);
  if (v2 >= 3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[EdgeSettingsController getGSMASettingsUIControl].cold.1();
  return v2;
}

- (BOOL)isTypeOfService:(id)a3 ofServiceType:(int)a4
{
  const __CFNumber *v5;
  const __CFNumber *v6;
  CFTypeID v7;
  BOOL result;
  int valuePtr;

  v5 = (const __CFNumber *)objc_msgSend(a3, "valueForKey:", CFSTR("type-mask"));
  result = 0;
  if (v5)
  {
    v6 = v5;
    v7 = CFGetTypeID(v5);
    if (v7 == CFNumberGetTypeID())
    {
      valuePtr = 0;
      CFNumberGetValue(v6, kCFNumberIntType, &valuePtr);
      if ((valuePtr & a4) != 0)
        return 1;
    }
  }
  return result;
}

- (void)initAPNCacheDictionaries
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C94F000, MEMORY[0x24BDACB70], v0, "getUIConfiguredApns failed: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

+ (id)makeUIApnBasedOn:(id)a3
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (a3)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(a3, "objectForKey:", CFSTR("apn")), CFSTR("apn"));
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(a3, "objectForKey:", CFSTR("username")), CFSTR("username"));
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(a3, "objectForKey:", CFSTR("password")), CFSTR("password"));
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(a3, "objectForKey:", CFSTR("type-mask")), CFSTR("type-mask"));
  }
  return v4;
}

- (void)initDictionaryForUIApn:(id *)a3 forServiceType:(int)a4
{
  uint64_t v4;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v7 = (void *)objc_msgSend((id)objc_opt_class(), "makeUIApnBasedOn:", -[EdgeSettingsController _APNDictionaryForServiceFromSC:](self, "_APNDictionaryForServiceFromSC:", *(_QWORD *)&a4));
  *a3 = v7;
  if (v7)
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4), CFSTR("type-mask"));
  else
    *a3 = -[EdgeSettingsController _blankAPNDictionaryWithTypeMask:](self, "_blankAPNDictionaryWithTypeMask:", v4);
}

- (void)_updateKey:(id)a3 toValue:(id)a4 forServiceType:(int)a5
{
  NSMutableDictionary **p_internetSettingsDictionary;
  NSMutableDictionary *internetSettingsDictionary;
  EdgeSettingsController *v11;
  NSMutableDictionary **p_vvmSettingsDictionary;
  uint64_t v13;

  if (!self->_cacheInitialized)
    -[EdgeSettingsController initAPNCacheDictionaries](self, "initAPNCacheDictionaries");
  if (a5 <= 3)
  {
    if (a5 == 1)
    {
      p_internetSettingsDictionary = &self->_internetSettingsDictionary;
      internetSettingsDictionary = self->_internetSettingsDictionary;
      if (!internetSettingsDictionary)
      {
        v11 = self;
        p_vvmSettingsDictionary = &self->_internetSettingsDictionary;
        v13 = 1;
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    if (a5 != 2)
      return;
    p_internetSettingsDictionary = &self->_vvmSettingsDictionary;
    internetSettingsDictionary = self->_vvmSettingsDictionary;
    if (internetSettingsDictionary)
      goto LABEL_20;
    v11 = self;
    p_vvmSettingsDictionary = &self->_vvmSettingsDictionary;
    v13 = 2;
LABEL_19:
    -[EdgeSettingsController initDictionaryForUIApn:forServiceType:](v11, "initDictionaryForUIApn:forServiceType:", p_vvmSettingsDictionary, v13);
    internetSettingsDictionary = *p_internetSettingsDictionary;
    goto LABEL_20;
  }
  if (a5 == 4)
  {
    p_internetSettingsDictionary = &self->_mmsSettingsDictionary;
    internetSettingsDictionary = self->_mmsSettingsDictionary;
    if (internetSettingsDictionary)
      goto LABEL_20;
    v11 = self;
    p_vvmSettingsDictionary = &self->_mmsSettingsDictionary;
    v13 = 4;
    goto LABEL_19;
  }
  if (a5 != 48)
  {
    if (a5 != 0x20000)
      return;
    p_internetSettingsDictionary = &self->_imsSettingsDictionary;
    internetSettingsDictionary = self->_imsSettingsDictionary;
    if (internetSettingsDictionary)
      goto LABEL_20;
    v11 = self;
    p_vvmSettingsDictionary = &self->_imsSettingsDictionary;
    v13 = 0x20000;
    goto LABEL_19;
  }
  p_internetSettingsDictionary = &self->_tetheringSettingsDictionary;
  internetSettingsDictionary = self->_tetheringSettingsDictionary;
  if (!internetSettingsDictionary)
  {
    v11 = self;
    p_vvmSettingsDictionary = &self->_tetheringSettingsDictionary;
    v13 = 48;
    goto LABEL_19;
  }
LABEL_20:
  -[NSMutableDictionary setObject:forKey:](internetSettingsDictionary, "setObject:forKey:", a4, a3);
}

- (id)_getAPNDictinaryForService:(int)a3
{
  int *v3;
  void *v4;

  if (a3 <= 3)
  {
    if (a3 == 1)
    {
      v3 = &OBJC_IVAR___EdgeSettingsController__internetSettingsDictionary;
    }
    else
    {
      if (a3 != 2)
        return -[EdgeSettingsController _APNDictionaryForServiceFromSC:](self, "_APNDictionaryForServiceFromSC:");
      v3 = &OBJC_IVAR___EdgeSettingsController__vvmSettingsDictionary;
    }
  }
  else
  {
    switch(a3)
    {
      case 4:
        v3 = &OBJC_IVAR___EdgeSettingsController__mmsSettingsDictionary;
        break;
      case 0x30:
        v3 = &OBJC_IVAR___EdgeSettingsController__tetheringSettingsDictionary;
        break;
      case 0x20000:
        v3 = &OBJC_IVAR___EdgeSettingsController__imsSettingsDictionary;
        break;
      default:
        return -[EdgeSettingsController _APNDictionaryForServiceFromSC:](self, "_APNDictionaryForServiceFromSC:");
    }
  }
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + *v3);
  if (v4)
    return v4;
  return -[EdgeSettingsController _APNDictionaryForServiceFromSC:](self, "_APNDictionaryForServiceFromSC:");
}

- (id)_APNDictionaryForServiceFromSC:(int)a3
{
  uint64_t v3;
  NSArray *v5;
  id result;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[EdgeSettingsController currectSet](self, "currectSet", 0);
  result = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9);
        if (-[EdgeSettingsController isTypeOfService:ofServiceType:](self, "isTypeOfService:ofServiceType:", v10, v3))
          return v10;
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      result = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v7 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (BOOL)_isAPNDictionaryBlank:(id)a3
{
  int v4;

  if ((!objc_msgSend(a3, "objectForKey:", CFSTR("apn"))
     || (v4 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("apn")), "isEqual:", &stru_24E08D970)) != 0)
    && (!objc_msgSend(a3, "objectForKey:", CFSTR("username"))
     || (v4 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("username")), "isEqual:", &stru_24E08D970)) != 0))
  {
    if (objc_msgSend(a3, "objectForKey:", CFSTR("password")))
      LOBYTE(v4) = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("password")), "isEqual:", &stru_24E08D970);
    else
      LOBYTE(v4) = 1;
  }
  return v4;
}

- (void)uploadSettingsOnCT:(id)a3
{
  -[CoreTelephonyClient setUIConfiguredApns:apns:completion:](-[EdgeSettingsController coreTelephonyClient](self, "coreTelephonyClient"), "setUIConfiguredApns:apns:completion:", -[EdgeSettingsController context](self, "context"), a3, &__block_literal_global);
}

void __45__EdgeSettingsController_uploadSettingsOnCT___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __45__EdgeSettingsController_uploadSettingsOnCT___block_invoke_cold_1();
  }
}

- (id)_blankAPNDictionaryWithTypeMask:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v4, "setObject:forKey:", &stru_24E08D970, CFSTR("apn"));
  objc_msgSend(v4, "setObject:forKey:", &stru_24E08D970, CFSTR("username"));
  objc_msgSend(v4, "setObject:forKey:", &stru_24E08D970, CFSTR("password"));
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3), CFSTR("type-mask"));
  return v4;
}

- (void)commitAPNsSettings
{
  id v3;
  void *v4;
  void *v5;

  if (self->_cacheInitialized)
  {
    if (-[EdgeSettingsController _isAPNDictionaryBlank:](self, "_isAPNDictionaryBlank:", self->_internetSettingsDictionary))
    {
      -[NSMutableDictionary setObject:forKey:](self->_internetSettingsDictionary, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0), CFSTR("type-mask"));
    }
    if (-[EdgeSettingsController _isAPNDictionaryBlank:](self, "_isAPNDictionaryBlank:", self->_vvmSettingsDictionary))
      -[NSMutableDictionary setObject:forKey:](self->_vvmSettingsDictionary, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0), CFSTR("type-mask"));
    if (-[EdgeSettingsController _isAPNDictionaryBlank:](self, "_isAPNDictionaryBlank:", self->_mmsSettingsDictionary))
      -[NSMutableDictionary setObject:forKey:](self->_mmsSettingsDictionary, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0), CFSTR("type-mask"));
    if (-[EdgeSettingsController _isAPNDictionaryBlank:](self, "_isAPNDictionaryBlank:", self->_imsSettingsDictionary))
      -[NSMutableDictionary setObject:forKey:](self->_imsSettingsDictionary, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0), CFSTR("type-mask"));
    if (-[EdgeSettingsController _isAPNDictionaryBlank:](self, "_isAPNDictionaryBlank:", self->_tetheringSettingsDictionary))
    {
      -[NSMutableDictionary setObject:forKey:](self->_tetheringSettingsDictionary, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0), CFSTR("type-mask"));
    }
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v4 = v3;
    if (self->_internetSettingsDictionary)
      objc_msgSend(v3, "addObject:");
    if ((MGGetBoolAnswer() & 1) == 0)
    {
      if (self->_vvmSettingsDictionary)
        objc_msgSend(v4, "addObject:");
      if (self->_mmsSettingsDictionary)
        objc_msgSend(v4, "addObject:");
    }
    if (self->_tetheringSettingsDictionary)
      objc_msgSend(v4, "addObject:");
    if (self->_imsSettingsDictionary)
      objc_msgSend(v4, "addObject:");
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("usersettings"), CFSTR("source"), v4, CFSTR("apns"), 0);
    -[EdgeSettingsController uploadSettingsOnCT:](self, "uploadSettingsOnCT:", v5);

    -[EdgeSettingsController resetAPNsDictionaries](self, "resetAPNsDictionaries");
    -[EdgeSettingsController loadCurrentAPNs](self, "loadCurrentAPNs");
  }
}

- (void)resetAPNsDictionaries
{
  NSMutableDictionary *internetSettingsDictionary;
  NSMutableDictionary *vvmSettingsDictionary;
  NSMutableDictionary *mmsSettingsDictionary;
  NSMutableDictionary *imsSettingsDictionary;
  NSMutableDictionary *tetheringSettingsDictionary;

  internetSettingsDictionary = self->_internetSettingsDictionary;
  if (internetSettingsDictionary)
  {

    self->_internetSettingsDictionary = 0;
  }
  vvmSettingsDictionary = self->_vvmSettingsDictionary;
  if (vvmSettingsDictionary)
  {

    self->_vvmSettingsDictionary = 0;
  }
  mmsSettingsDictionary = self->_mmsSettingsDictionary;
  if (mmsSettingsDictionary)
  {

    self->_mmsSettingsDictionary = 0;
  }
  imsSettingsDictionary = self->_imsSettingsDictionary;
  if (imsSettingsDictionary)
  {

    self->_imsSettingsDictionary = 0;
  }
  tetheringSettingsDictionary = self->_tetheringSettingsDictionary;
  if (tetheringSettingsDictionary)
  {

    self->_tetheringSettingsDictionary = 0;
  }
  self->_cacheInitialized = 0;
}

- (void)loadCurrentAPNs
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C94F000, MEMORY[0x24BDACB70], v0, "getConfiguredApns failed: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)resetAttachAPNSettings
{
  NSMutableDictionary *lastAttachAPNDict;
  NSMutableDictionary *newAttachAPNDict;
  id v5;
  void *v6;
  NSMutableDictionary *v7;

  lastAttachAPNDict = self->_lastAttachAPNDict;
  if (lastAttachAPNDict)

  newAttachAPNDict = self->_newAttachAPNDict;
  if (newAttachAPNDict)

  v5 = -[EdgeSettingsController attachAPNSettings](self, "attachAPNSettings");
  if (v5)
  {
    v6 = v5;
    self->_lastAttachAPNDict = (NSMutableDictionary *)objc_msgSend(v5, "mutableCopy");
    v7 = (NSMutableDictionary *)objc_msgSend(v6, "mutableCopy");
  }
  else
  {
    self->_lastAttachAPNDict = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  }
  self->_newAttachAPNDict = v7;
}

- (id)attachAPNSettings
{
  void *v2;
  uint64_t v4;

  v4 = 0;
  v2 = (void *)-[CoreTelephonyClient context:getAttachApnSettings:](-[EdgeSettingsController coreTelephonyClient](self, "coreTelephonyClient"), "context:getAttachApnSettings:", -[EdgeSettingsController context](self, "context"), &v4);
  if (v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[EdgeSettingsController attachAPNSettings].cold.1();
  return v2;
}

- (void)commitAttachAPNSettings
{
  OUTLINED_FUNCTION_3(&dword_21C94F000, MEMORY[0x24BDACB70], a3, "Committing Attach APN settings", a5, a6, a7, a8, 0);
}

- (BOOL)isAttachAPNEditingAllowed
{
  uint64_t v3;

  v3 = 0;
  return -[CoreTelephonyClient isAttachApnSettingAllowed:error:](-[EdgeSettingsController coreTelephonyClient](self, "coreTelephonyClient"), "isAttachApnSettingAllowed:error:", -[EdgeSettingsController context](self, "context"), &v3);
}

- (BOOL)shouldResetAttachAPN
{
  if (-[EdgeSettingsController isAttachAPNEditingAllowed](self, "isAttachAPNEditingAllowed"))
    -[NSMutableDictionary objectForKey:](self->_lastAttachAPNDict, "objectForKey:", CFSTR("apn"));
  return 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[EdgeSettingsController commitAttachAPNSettings](self, "commitAttachAPNSettings");
  -[EdgeSettingsController commitAPNsSettings](self, "commitAPNsSettings");
  v5.receiver = self;
  v5.super_class = (Class)EdgeSettingsController;
  -[EdgeSettingsController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
}

- (void)applicationWillSuspend
{
  objc_super v3;

  -[EdgeSettingsController commitAttachAPNSettings](self, "commitAttachAPNSettings");
  -[EdgeSettingsController commitAPNsSettings](self, "commitAPNsSettings");
  v3.receiver = self;
  v3.super_class = (Class)EdgeSettingsController;
  -[EdgeSettingsController applicationWillSuspend](&v3, sel_applicationWillSuspend);
}

- (void)applicationDidResume
{
  objc_super v3;

  -[EdgeSettingsController resetAttachAPNSettings](self, "resetAttachAPNSettings");
  v3.receiver = self;
  v3.super_class = (Class)EdgeSettingsController;
  -[EdgeSettingsController applicationDidResume](&v3, sel_applicationDidResume);
}

- (void)showCarrierSettingsEraseAlert:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[5];
  BOOL v13;

  v5 = (void *)MEMORY[0x24BDF67F0];
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ERASE_CARRIER_SETTINGS_TITLE"), &stru_24E08D970, CFSTR("EDGE Settings"));
  v7 = (void *)objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ERASE_CARRIER_SETTINGS_CONFIRM_STRING"), &stru_24E08D970, CFSTR("EDGE Settings")), 1);
  v8 = (void *)MEMORY[0x24BDF67E8];
  v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ERASE_CARRIER_SETTINGS"), &stru_24E08D970, CFSTR("EDGE Settings"));
  v10 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__EdgeSettingsController_showCarrierSettingsEraseAlert___block_invoke;
  v12[3] = &unk_24E08D848;
  v12[4] = self;
  v13 = a3;
  objc_msgSend(v7, "addAction:", objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v12));
  v11[0] = v10;
  v11[1] = 3221225472;
  v11[2] = __56__EdgeSettingsController_showCarrierSettingsEraseAlert___block_invoke_174;
  v11[3] = &unk_24E08D870;
  v11[4] = self;
  objc_msgSend(v7, "addAction:", objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24E08D970, CFSTR("EDGE Settings")), 0, v11));
  -[EdgeSettingsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

uint64_t __56__EdgeSettingsController_showCarrierSettingsEraseAlert___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "coreTelephonyClient"), "loadGSMASettings:state:", objc_msgSend(*(id *)(a1 + 32), "context"), *(unsigned __int8 *)(a1 + 40));
  if (result)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[EdgeSettingsController resetCarrierSettings:].cold.1();
    return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  }
  return result;
}

uint64_t __56__EdgeSettingsController_showCarrierSettingsEraseAlert___block_invoke_174(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (id)getDefaultSettings:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = -[EdgeSettingsController getGSMASettingsUIControl](self, "getGSMASettingsUIControl", a3);
  v5 = v4;
  if (v4 == 1)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
      v17 = *MEMORY[0x24BE75A18];
      v18 = MEMORY[0x24BDBD1C8];
      v19 = MEMORY[0x24BDBD1C0];
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v13);
          v21 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if ((__CFString *)objc_msgSend(v21, "identifier") == CFSTR("GSMA_SETTING"))
          {
            v22 = v18;
          }
          else if (objc_msgSend(v21, "cellType") == 13)
          {
            v22 = v18;
          }
          else
          {
            v22 = v19;
          }
          objc_msgSend(v21, "setProperty:forKey:", v22, v17);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v15);
    }
  }
  else if (v4 == 2)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v29;
      v10 = *MEMORY[0x24BE75A18];
      v11 = MEMORY[0x24BDBD1C8];
      do
      {
        for (j = 0; j != v8; ++j)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "setProperty:forKey:", v11, v10);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v8);
    }
  }
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5 == 1);
}

- (void)setDefaultSettings:(id)a3 specifier:(id)a4
{
  if (objc_msgSend(a3, "BOOLValue"))
  {
    -[EdgeSettingsController resetAllConfiguredSettings](self, "resetAllConfiguredSettings");
    if (-[CoreTelephonyClient loadGSMASettings:state:](-[EdgeSettingsController coreTelephonyClient](self, "coreTelephonyClient"), "loadGSMASettings:state:", -[EdgeSettingsController context](self, "context"), 1))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[EdgeSettingsController resetCarrierSettings:].cold.1();
    }
  }
  else
  {
    -[EdgeSettingsController showCarrierSettingsEraseAlert:](self, "showCarrierSettingsEraseAlert:", 0);
  }
}

- (void)didChangeDeviceManagementSettings:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "slotID");
  if (v4 == -[CTXPCServiceSubscriptionContext slotID](-[EdgeSettingsController context](self, "context"), "slotID"))
    -[EdgeSettingsController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)dealloc
{
  OUTLINED_FUNCTION_3(&dword_21C94F000, MEMORY[0x24BDACB70], a3, "[EdgeSettingsController dealloc]", a5, a6, a7, a8, 0);
}

- (CTXPCServiceSubscriptionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1568);
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1576);
}

- (NSArray)currectSet
{
  return self->_currectSet;
}

- (void)setCurrectSet:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1584);
}

void __52__EdgeSettingsController_resetAllConfiguredSettings__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C94F000, MEMORY[0x24BDACB70], v0, "resetAllUIConfiguredApns failed: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __52__EdgeSettingsController_resetAllConfiguredSettings__block_invoke_31_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C94F000, MEMORY[0x24BDACB70], v0, "modifyAttachApnSettings failed: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)resetCarrierSettings:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C94F000, MEMORY[0x24BDACB70], v0, "loadGSMASettings failed: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)specifiers
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(a1, "context");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C94F000, MEMORY[0x24BDACB70], v1, "EdgeSettingsController context: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getGSMASettingsUIControl
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C94F000, MEMORY[0x24BDACB70], v0, "Unexpected value retrieved via getGSMAUIControlSetting: %ld", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __45__EdgeSettingsController_uploadSettingsOnCT___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C94F000, MEMORY[0x24BDACB70], v0, "setUIConfiguredApns failed: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)attachAPNSettings
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C94F000, MEMORY[0x24BDACB70], v0, "getAttachApnSettings failed: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

@end
