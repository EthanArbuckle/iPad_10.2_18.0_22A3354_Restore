@implementation FamilyHotspotSettingsController

- (FamilyHotspotSettingsController)init
{
  FamilyHotspotSettingsController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FamilyHotspotSettingsController;
  v2 = -[FamilyHotspotSettingsController init](&v5, sel_init);
  if (v2)
  {
    -[FamilyHotspotSettingsController setWifiClient:](v2, "setWifiClient:", WiFiManagerClientCreate());
    -[FamilyHotspotSettingsController _getFamilyMembers](v2, "_getFamilyMembers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[FamilyHotspotSettingsController setFamilyMembers:](v2, "setFamilyMembers:", v3);

    -[FamilyHotspotSettingsController setShouldShareWithFamily:](v2, "setShouldShareWithFamily:", -[FamilyHotspotSettingsController _shouldShareHotspotWithFamily](v2, "_shouldShareHotspotWithFamily"));
  }
  return v2;
}

- (void)dealloc
{
  __WiFiManagerClient *wifiClient;
  objc_super v4;

  wifiClient = self->_wifiClient;
  if (wifiClient)
    CFRelease(wifiClient);
  v4.receiver = self;
  v4.super_class = (Class)FamilyHotspotSettingsController;
  -[FamilyHotspotSettingsController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FamilyHotspotSettingsController;
  -[FamilyHotspotSettingsController viewDidLoad](&v3, sel_viewDidLoad);
  WMSUIEventDictionary(CFSTR("view-ph-password"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WMSubmitUIEventMetric(v2);

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  PSSpecifier *switchSpecifier;
  PSSpecifier *v8;
  PSSpecifier *v9;
  PSSpecifier *v10;
  void *v11;
  void *v12;
  NSArray *familyMembers;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  FamilyHotspotSettingsController *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    switchSpecifier = self->_switchSpecifier;
    if (!switchSpecifier)
    {
      -[FamilyHotspotSettingsController _switchSpecifier](self, "_switchSpecifier");
      v8 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
      v9 = self->_switchSpecifier;
      self->_switchSpecifier = v8;

      switchSpecifier = self->_switchSpecifier;
    }
    v10 = switchSpecifier;
    v20[0] = v6;
    v20[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v11);

    if (self->_shouldShareWithFamily && -[NSArray count](self->_familyMembers, "count"))
    {
      objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v12);
      familyMembers = self->_familyMembers;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __45__FamilyHotspotSettingsController_specifiers__block_invoke;
      v17[3] = &unk_24FDBB5A0;
      v18 = v5;
      v19 = self;
      -[NSArray enumerateObjectsUsingBlock:](familyMembers, "enumerateObjectsUsingBlock:", v17);

    }
    v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;
    v15 = v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

void __45__FamilyHotspotSettingsController_specifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_specifierForFamilyMember:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)_specifierForFamilyMember:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FAMILY_HOTSPOT_ASK"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FAMILY_HOTSPOT_AUTOMATIC"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v6, "initWithArray:", v11);

  v13 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v5, "displayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, sel__setJoinOption_specifier_, sel__joinOption_, objc_opt_class(), 2, 0, v17[0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setValues:titles:", &unk_24FDBF038, v12);
  objc_msgSend(v15, "setProperty:forKey:", v5, CFSTR("FamilyMemberDetailKey"));

  return v15;
}

- (id)_joinOption:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "propertyForKey:", CFSTR("FamilyMemberDetailKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v3, "shareOption"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setJoinOption:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "propertyForKey:", CFSTR("FamilyMemberDetailKey"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  objc_msgSend(v9, "setShareOption:", v8);
  objc_msgSend(v6, "setProperty:forKey:", v9, CFSTR("FamilyMemberDetailKey"));

  -[FamilyHotspotSettingsController _updateMemberWithMember:](self, "_updateMemberWithMember:", v9);
  -[FamilyHotspotSettingsController _setFamilyPreferences](self, "_setFamilyPreferences");

}

- (id)_switchSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SHARING"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, sel__setFamilyShare_, sel__getFamilyShare, 0, 6, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_setFamilyShare:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  id v9;

  v4 = objc_msgSend(a3, "BOOLValue");
  self->_shouldShareWithFamily = v4;
  -[FamilyHotspotSettingsController familyMembers](self, "familyMembers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = &__block_literal_global_64;
  else
    v7 = &__block_literal_global_1;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

  -[FamilyHotspotSettingsController _setFamilyPreferences](self, "_setFamilyPreferences");
  -[FamilyHotspotSettingsController reloadSpecifiers](self, "reloadSpecifiers");
  if (self->_shouldShareWithFamily)
    v8 = CFSTR("true");
  else
    v8 = CFSTR("false");
  WMSUIEventDictionary(CFSTR("toggle-ph-family"), v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  WMSubmitUIEventMetric(v9);

}

uint64_t __51__FamilyHotspotSettingsController__setFamilyShare___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShareOption:", 0);
}

void __51__FamilyHotspotSettingsController__setFamilyShare___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (!objc_msgSend(v2, "shareOption"))
    objc_msgSend(v2, "setShareOption:", 1);

}

- (id)_getFamilyShare
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_shouldShareWithFamily);
}

- (BOOL)_shouldShareHotspotWithFamily
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[FamilyHotspotSettingsController familyMembers](self, "familyMembers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __64__FamilyHotspotSettingsController__shouldShareHotspotWithFamily__block_invoke;
  v4[3] = &unk_24FDBB628;
  v4[4] = &v5;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __64__FamilyHotspotSettingsController__shouldShareHotspotWithFamily__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "shareOption");
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

- (void)_updateMemberWithMember:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[FamilyHotspotSettingsController familyMembers](self, "familyMembers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__FamilyHotspotSettingsController__updateMemberWithMember___block_invoke;
  v7[3] = &unk_24FDBB650;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __59__FamilyHotspotSettingsController__updateMemberWithMember___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "altDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
    objc_msgSend(v5, "setShareOption:", objc_msgSend(*(id *)(a1 + 32), "shareOption"));

}

- (id)_getFamilyMembers
{
  void *v2;
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v2 = (void *)WiFiManagerClientCopyFamilyHotspotPreferences();
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__FamilyHotspotSettingsController__getFamilyMembers__block_invoke;
  v6[3] = &unk_24FDBB678;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v6);

  return v4;
}

void __52__FamilyHotspotSettingsController__getFamilyMembers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  HotspotFamilyMember *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FamilyHotspotIdentifier"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FamilyHotspotDisplayName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FamilyHotspotSharingMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HotspotFamilyMember initWithAltDSID:displayName:shareOption:]([HotspotFamilyMember alloc], "initWithAltDSID:displayName:shareOption:", v7, v4, objc_msgSend(v5, "intValue"));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

- (void)_setFamilyPreferences
{
  id v2;

  -[FamilyHotspotSettingsController _generateFamilyPreferencesArray](self, "_generateFamilyPreferencesArray");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  WiFiManagerClientSetFamilyHotspotPreferences();

}

- (void)_resetFamilyPreferences
{
  WiFiManagerClientSetFamilyHotspotPreferences();
}

- (id)_generateFamilyPreferencesArray
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  FamilyHotspotSettingsController *v10;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[FamilyHotspotSettingsController familyMembers](self, "familyMembers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__FamilyHotspotSettingsController__generateFamilyPreferencesArray__block_invoke;
  v8[3] = &unk_24FDBB5A0;
  v5 = v3;
  v9 = v5;
  v10 = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  v6 = v5;
  return v6;
}

void __66__FamilyHotspotSettingsController__generateFamilyPreferencesArray__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_generatePrefDictionaryForMember:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)_generatePrefDictionaryForMember:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = objc_msgSend(v4, "shareOption");

  objc_msgSend(v8, "numberWithUnsignedInt:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("FamilyHotspotIdentifier"));
  objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("FamilyHotspotDisplayName"));
  objc_msgSend(v5, "setValue:forKey:", v10, CFSTR("FamilyHotspotSharingMode"));

  return v5;
}

- (NSArray)familyMembers
{
  return self->_familyMembers;
}

- (void)setFamilyMembers:(id)a3
{
  objc_storeStrong((id *)&self->_familyMembers, a3);
}

- (BOOL)shouldShareWithFamily
{
  return self->_shouldShareWithFamily;
}

- (void)setShouldShareWithFamily:(BOOL)a3
{
  self->_shouldShareWithFamily = a3;
}

- (PSSpecifier)switchSpecifier
{
  return self->_switchSpecifier;
}

- (void)setSwitchSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_switchSpecifier, a3);
}

- (__WiFiManagerClient)wifiClient
{
  return self->_wifiClient;
}

- (void)setWifiClient:(__WiFiManagerClient *)a3
{
  self->_wifiClient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switchSpecifier, 0);
  objc_storeStrong((id *)&self->_familyMembers, 0);
}

@end
