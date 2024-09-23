@implementation CKSettingsCheckInLocationHistory

- (CKSettingsCheckInLocationHistory)init
{
  CKSettingsCheckInLocationHistory *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKSettingsCheckInLocationHistory;
  v2 = -[CKSettingsCheckInLocationHistory init](&v5, sel_init);
  if (v2)
  {
    MessagesSettingsLocalizedString(CFSTR("CHECK_IN_LOCATION_HISTORY_VIEW_TITLE"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSettingsCheckInLocationHistory setTitle:](v2, "setTitle:", v3);

  }
  return v2;
}

- (id)specifiers
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;

  v2 = (int)*MEMORY[0x24BE756E0];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("LOCATION_HISTORY_SELECTION_GROUP"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSettingsCheckInLocationHistory setSelectionGroup:](self, "setSelectionGroup:", v7);

    -[CKSettingsCheckInLocationHistory selectionGroup](self, "selectionGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSettingsCheckInLocationHistory getSelectionGroupFooterText](self, "getSelectionGroupFooterText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x24BE75A68];
    objc_msgSend(v8, "setProperty:forKey:", v9, *MEMORY[0x24BE75A68]);

    -[CKSettingsCheckInLocationHistory selectionGroup](self, "selectionGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v11, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B28]);

    -[CKSettingsCheckInLocationHistory selectionGroup](self, "selectionGroup");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v13);

    v14 = (void *)MEMORY[0x24BE75590];
    MessagesSettingsLocalizedString(CFSTR("CHECK_IN_LOCATION_HISTORY_SELECTION_NO_HISTORY"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, 0, 3, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSettingsCheckInLocationHistory setNoLocationHistorySelector:](self, "setNoLocationHistorySelector:", v16);

    -[CKSettingsCheckInLocationHistory noLocationHistorySelector](self, "noLocationHistorySelector");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x24BE75868];
    objc_msgSend(v17, "setProperty:forKey:", v12, *MEMORY[0x24BE75868]);

    -[CKSettingsCheckInLocationHistory noLocationHistorySelector](self, "noLocationHistorySelector");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *MEMORY[0x24BE75DA0];
    objc_msgSend(v19, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75DA0]);

    -[CKSettingsCheckInLocationHistory noLocationHistorySelector](self, "noLocationHistorySelector");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v21);

    v22 = (void *)MEMORY[0x24BE75590];
    MessagesSettingsLocalizedString(CFSTR("CHECK_IN_LOCATION_HISTORY_SELECTION_FULL_HISTORY"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v23, self, 0, 0, 0, 3, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSettingsCheckInLocationHistory setFullLocationHistorySelector:](self, "setFullLocationHistorySelector:", v24);

    -[CKSettingsCheckInLocationHistory fullLocationHistorySelector](self, "fullLocationHistorySelector");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setProperty:forKey:", v12, v18);

    -[CKSettingsCheckInLocationHistory fullLocationHistorySelector](self, "fullLocationHistorySelector");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setProperty:forKey:", v12, v20);

    -[CKSettingsCheckInLocationHistory fullLocationHistorySelector](self, "fullLocationHistorySelector");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v27);

    -[CKSettingsCheckInLocationHistory selectionGroup](self, "selectionGroup");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(MEMORY[0x24BE83470], "shareAllLocations") & 1) != 0)
      -[CKSettingsCheckInLocationHistory fullLocationHistorySelector](self, "fullLocationHistorySelector");
    else
      -[CKSettingsCheckInLocationHistory noLocationHistorySelector](self, "noLocationHistorySelector");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setProperty:forKey:", v29, *MEMORY[0x24BE75C20]);

    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("LOCATION_HISTORY_SAMPLE_MAP_DATA_GROUP"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSettingsCheckInLocationHistory setSampleMapDataGroup:](self, "setSampleMapDataGroup:", v30);

    -[CKSettingsCheckInLocationHistory sampleMapDataGroup](self, "sampleMapDataGroup");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    MessagesSettingsLocalizedString(CFSTR("CHECK_IN_LOCATION_HISTORY_SAMPLE_DATA_TITLE"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setName:", v32);

    -[CKSettingsCheckInLocationHistory sampleMapDataGroup](self, "sampleMapDataGroup");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v33);

    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, -1, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSettingsCheckInLocationHistory setNoLocationHistoryMap:](self, "setNoLocationHistoryMap:", v34);

    -[CKSettingsCheckInLocationHistory noLocationHistoryMap](self, "noLocationHistoryMap");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_opt_class();
    v37 = *MEMORY[0x24BE75948];
    objc_msgSend(v35, "setProperty:forKey:", v36, *MEMORY[0x24BE75948]);

    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, -1, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSettingsCheckInLocationHistory setFullLocationHistoryMap:](self, "setFullLocationHistoryMap:", v38);

    -[CKSettingsCheckInLocationHistory fullLocationHistoryMap](self, "fullLocationHistoryMap");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setProperty:forKey:", objc_opt_class(), v37);

    -[CKSettingsCheckInLocationHistory sampleMapDataSpecifier](self, "sampleMapDataSpecifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v40);

    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("LOCATION_HISTORY_SAMPLE_DEVICES_DATA_GROUP"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSettingsCheckInLocationHistory setSampleDevicesDataGroup:](self, "setSampleDevicesDataGroup:", v41);

    -[CKSettingsCheckInLocationHistory sampleDevicesDataGroup](self, "sampleDevicesDataGroup");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    MessagesSettingsLocalizedString(CFSTR("CHECK_IN_LOCATION_HISTORY_SELECTION_GROUP_FOOTER"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setProperty:forKey:", v43, v10);

    -[CKSettingsCheckInLocationHistory sampleDevicesDataGroup](self, "sampleDevicesDataGroup");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v44);

    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, -1, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSettingsCheckInLocationHistory setNoLocationHistoryDevices:](self, "setNoLocationHistoryDevices:", v45);

    -[CKSettingsCheckInLocationHistory noLocationHistoryDevices](self, "noLocationHistoryDevices");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setProperty:forKey:", objc_opt_class(), v37);

    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, -1, 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSettingsCheckInLocationHistory setFullLocationHistoryDevices:](self, "setFullLocationHistoryDevices:", v47);

    -[CKSettingsCheckInLocationHistory fullLocationHistoryDevices](self, "fullLocationHistoryDevices");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setProperty:forKey:", objc_opt_class(), v37);

    -[CKSettingsCheckInLocationHistory sampleDevicesDataSpecifier](self, "sampleDevicesDataSpecifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v49);

    v50 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = (Class)v6;
    v51 = v6;

    v4 = *(id *)((char *)&self->super.super.super.super.super.isa + v2);
  }
  return v4;
}

- (id)getSelectionGroupFooterText
{
  __CFString *v2;

  if (objc_msgSend(MEMORY[0x24BE83470], "shareAllLocations"))
    v2 = CFSTR("CHECK_IN_LOCATION_HISTORY_SAMPLE_DATA_FULL_HISTORY_FOOTER");
  else
    v2 = CFSTR("CHECK_IN_LOCATION_HISTORY_SAMPLE_DATA_NO_HISTORY_FOOTER");
  MessagesSettingsLocalizedString(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sampleMapDataSpecifier
{
  if ((objc_msgSend(MEMORY[0x24BE83470], "shareAllLocations") & 1) != 0)
    -[CKSettingsCheckInLocationHistory fullLocationHistoryMap](self, "fullLocationHistoryMap");
  else
    -[CKSettingsCheckInLocationHistory noLocationHistoryMap](self, "noLocationHistoryMap");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sampleDevicesDataSpecifier
{
  if ((objc_msgSend(MEMORY[0x24BE83470], "shareAllLocations") & 1) != 0)
    -[CKSettingsCheckInLocationHistory fullLocationHistoryDevices](self, "fullLocationHistoryDevices");
  else
    -[CKSettingsCheckInLocationHistory noLocationHistoryDevices](self, "noLocationHistoryDevices");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)updateSampleDataSpecifiersAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v3 = a3;
  v49 = *MEMORY[0x24BDAC8D0];
  -[CKSettingsCheckInLocationHistory selectionGroup](self, "selectionGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSettingsCheckInLocationHistory getSelectionGroupFooterText](self, "getSelectionGroupFooterText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", v6, *MEMORY[0x24BE75A68]);

  -[CKSettingsCheckInLocationHistory selectionGroup](self, "selectionGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSettingsCheckInLocationHistory reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v7, 1);

  v46 = 0;
  -[CKSettingsCheckInLocationHistory sampleMapDataGroup](self, "sampleMapDataGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSettingsCheckInLocationHistory getGroup:row:ofSpecifierID:](self, "getGroup:row:ofSpecifierID:", &v46, 0, v9);

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[CKSettingsCheckInLocationHistory specifiersInGroup:](self, "specifiersInGroup:", v46);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKSettingsCheckInLocationHistory sampleMapDataGroup](self, "sampleMapDataGroup");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16 != v18)
          -[CKSettingsCheckInLocationHistory removeSpecifier:animated:](self, "removeSpecifier:animated:", v15, v3);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v12);
  }

  -[CKSettingsCheckInLocationHistory sampleMapDataGroup](self, "sampleMapDataGroup");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[CKSettingsCheckInLocationHistory indexOfSpecifierID:](self, "indexOfSpecifierID:", v20) + 1;

  if (v21 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CKSettingsCheckInLocationHistory sampleMapDataSpecifier](self, "sampleMapDataSpecifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSettingsCheckInLocationHistory insertSpecifier:atIndex:animated:](self, "insertSpecifier:atIndex:animated:", v22, v21, v3);

    -[CKSettingsCheckInLocationHistory sampleDevicesDataGroup](self, "sampleDevicesDataGroup");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSettingsCheckInLocationHistory getGroup:row:ofSpecifierID:](self, "getGroup:row:ofSpecifierID:", &v46, 0, v24);

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    -[CKSettingsCheckInLocationHistory specifiersInGroup:](self, "specifiersInGroup:", v46, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v39 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
          objc_msgSend(v30, "identifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKSettingsCheckInLocationHistory sampleDevicesDataGroup](self, "sampleDevicesDataGroup");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "identifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31 != v33)
            -[CKSettingsCheckInLocationHistory removeSpecifier:animated:](self, "removeSpecifier:animated:", v30, v3);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v27);
    }

    -[CKSettingsCheckInLocationHistory sampleDevicesDataGroup](self, "sampleDevicesDataGroup");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "identifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[CKSettingsCheckInLocationHistory indexOfSpecifierID:](self, "indexOfSpecifierID:", v35) + 1;

    if (v36 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[CKSettingsCheckInLocationHistory sampleDevicesDataSpecifier](self, "sampleDevicesDataSpecifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSettingsCheckInLocationHistory insertSpecifier:atIndex:animated:](self, "insertSpecifier:atIndex:animated:", v37, v36, v3);

    }
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v8 = -[CKSettingsCheckInLocationHistory indexForIndexPath:](self, "indexForIndexPath:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CKSettingsCheckInLocationHistory getGroupSpecifierForSpecifier:](self, "getGroupSpecifierForSpecifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "propertyForKey:", *MEMORY[0x24BE75B28]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v12)
  {
    -[CKSettingsCheckInLocationHistory selectionGroup](self, "selectionGroup");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "propertyForKey:", *MEMORY[0x24BE75DA0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v10 == v13)
    {
      v16 = objc_msgSend(v14, "BOOLValue");
      objc_msgSend(MEMORY[0x24BE83470], "setShareAllLocations:", v16);

      -[CKSettingsCheckInLocationHistory updateSampleDataSpecifiersAnimated:](self, "updateSampleDataSpecifiersAnimated:", 1);
    }
    else
    {
      -[CKSettingsCheckInLocationHistory setPreferenceValue:specifier:](self, "setPreferenceValue:specifier:", v14, v10);

    }
  }
  v17.receiver = self;
  v17.super_class = (Class)CKSettingsCheckInLocationHistory;
  -[CKSettingsCheckInLocationHistory tableView:didSelectRowAtIndexPath:](&v17, sel_tableView_didSelectRowAtIndexPath_, v6, v7);

}

- (PSSpecifier)selectionGroup
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1376, 1);
}

- (void)setSelectionGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1376);
}

- (PSSpecifier)noLocationHistorySelector
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1384, 1);
}

- (void)setNoLocationHistorySelector:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1384);
}

- (PSSpecifier)fullLocationHistorySelector
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1392, 1);
}

- (void)setFullLocationHistorySelector:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1392);
}

- (PSSpecifier)sampleMapDataGroup
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1400, 1);
}

- (void)setSampleMapDataGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1400);
}

- (PSSpecifier)noLocationHistoryMap
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1408, 1);
}

- (void)setNoLocationHistoryMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1408);
}

- (PSSpecifier)fullLocationHistoryMap
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setFullLocationHistoryMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1416);
}

- (PSSpecifier)sampleDevicesDataGroup
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setSampleDevicesDataGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1424);
}

- (PSSpecifier)noLocationHistoryDevices
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1432, 1);
}

- (void)setNoLocationHistoryDevices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1432);
}

- (PSSpecifier)fullLocationHistoryDevices
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1440, 1);
}

- (void)setFullLocationHistoryDevices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1440);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullLocationHistoryDevices, 0);
  objc_storeStrong((id *)&self->_noLocationHistoryDevices, 0);
  objc_storeStrong((id *)&self->_sampleDevicesDataGroup, 0);
  objc_storeStrong((id *)&self->_fullLocationHistoryMap, 0);
  objc_storeStrong((id *)&self->_noLocationHistoryMap, 0);
  objc_storeStrong((id *)&self->_sampleMapDataGroup, 0);
  objc_storeStrong((id *)&self->_fullLocationHistorySelector, 0);
  objc_storeStrong((id *)&self->_noLocationHistorySelector, 0);
  objc_storeStrong((id *)&self->_selectionGroup, 0);
}

@end
