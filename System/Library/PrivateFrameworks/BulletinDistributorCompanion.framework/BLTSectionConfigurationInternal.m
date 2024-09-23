@implementation BLTSectionConfigurationInternal

- (BLTSectionConfigurationInternal)init
{
  BLTSectionConfigurationInternal *v2;
  BLTSectionConfigurationInternal *v3;
  uint64_t v4;
  NSDictionary *configurations;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BLTSectionConfigurationInternal;
  v2 = -[BLTSectionConfigurationInternal init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[BLTSectionConfigurationInternal _loadConfigurations](v2, "_loadConfigurations");
    v4 = objc_claimAutoreleasedReturnValue();
    configurations = v3->_configurations;
    v3->_configurations = (NSDictionary *)v4;

  }
  return v3;
}

- (unint64_t)coordinationTypeForSectionID:(id)a3 subtype:(int64_t)a4
{
  return -[BLTSectionConfigurationInternal coordinationTypeForSectionID:subtype:category:](self, "coordinationTypeForSectionID:subtype:category:", a3, a4, 0);
}

- (unint64_t)coordinationTypeForSectionID:(id)a3 subtype:(int64_t)a4 category:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  char v24;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[NSDictionary objectForKeyedSubscript:](self->_configurations, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "coordinationTypeWithSubtype:", a4);
  objc_msgSend(MEMORY[0x24BE6B4E0], "blt_boundedWaitForActivePairedDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "bltVersion");

  if (v11 == 2)
  {
    if (v13 >= 4)
    {
      if (a4 == 0xFFFFFFFF80000000)
      {
        objc_msgSend(v10, "allowListedSubtypes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count") != 0;

      }
      else
      {
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        objc_msgSend(v10, "allowListedSubtypes");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v19)
        {
          v20 = *(_QWORD *)v34;
          while (2)
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v34 != v20)
                objc_enumerationMutation(v18);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "integerValue") == a4)
              {
                v15 = 1;
                goto LABEL_22;
              }
            }
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
            if (v19)
              continue;
            break;
          }
        }
        v15 = 0;
LABEL_22:

      }
      if (v15 || !v9 || v13 < 7)
      {
        if (!v15)
          goto LABEL_27;
      }
      else
      {
        objc_msgSend(v10, "allowListedCategories");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "containsObject:", v9);

        if ((v24 & 1) == 0)
          goto LABEL_27;
      }
      v11 = 0;
      goto LABEL_30;
    }
LABEL_27:
    v11 = 2;
    goto LABEL_30;
  }
  if (v9 && v13 >= 6)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    objc_msgSend(v10, "denyListedCategories");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", v9);

    v32 = v17;
    if (*((_BYTE *)v30 + 24))
    {
      v11 = 2;
    }
    else
    {
      objc_msgSend(v10, "denyListedCategoriesWithVersion");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __81__BLTSectionConfigurationInternal_coordinationTypeForSectionID_subtype_category___block_invoke;
      v26[3] = &unk_24D7622C8;
      v28 = &v29;
      v27 = v9;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v26);

      if (*((_BYTE *)v30 + 24))
        v11 = 2;
    }
    _Block_object_dispose(&v29, 8);
  }
LABEL_30:

  return v11;
}

void __81__BLTSectionConfigurationInternal_coordinationTypeForSectionID_subtype_category___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a3;
  if ((objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportIsGreaterEqualVersion:", objc_msgSend(a2, "unsignedIntValue")) & 1) == 0)*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "containsObject:", *(_QWORD *)(a1 + 32));
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

- (BOOL)hasSectionIDOptedOutOfAttachmentCoordination:(id)a3
{
  void *v3;
  char v4;

  -[NSDictionary objectForKeyedSubscript:](self->_configurations, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "optOutOfAttachmentTransmission");

  return v4;
}

- (BOOL)shouldSectionIDSettingsAlwaysSync:(id)a3
{
  void *v3;
  char v4;

  -[NSDictionary objectForKeyedSubscript:](self->_configurations, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "alwaysSyncSettings");

  return v4;
}

- (BOOL)shouldSectionIDAlwaysAlert:(id)a3 category:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;

  v6 = a4;
  -[NSDictionary objectForKeyedSubscript:](self->_configurations, "objectForKeyedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6
    && (objc_msgSend(v7, "denyListedCategories"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "containsObject:", v6),
        v9,
        (v10 & 1) != 0))
  {
    v11 = 0;
  }
  else
  {
    v11 = objc_msgSend(v8, "alwaysAlert");
  }

  return v11;
}

- (BOOL)hasSectionIDOptedOutOfWaitForUserIdle:(id)a3
{
  void *v3;
  char v4;

  -[NSDictionary objectForKeyedSubscript:](self->_configurations, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "optOutOfWaitForUserIdle");

  return v4;
}

- (BOOL)hasSectionIDOptedOutOfNotificationTuning:(id)a3
{
  void *v3;
  char v4;

  -[NSDictionary objectForKeyedSubscript:](self->_configurations, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "optOutOfNotificationTuning");

  return v4;
}

- (BOOL)hasSectionIDDisplayedCriticalBulletins:(id)a3
{
  void *v3;
  char v4;

  -[NSDictionary objectForKeyedSubscript:](self->_configurations, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasDisplayedCriticalBulletins");

  return v4;
}

- (BOOL)applyAllowListToChildSections:(id)a3
{
  void *v3;
  char v4;

  -[NSDictionary objectForKeyedSubscript:](self->_configurations, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "applyAllowListToChildSections");

  return v4;
}

- (unint64_t)legacyMapLocationForSectionID:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_configurations, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasLegacyMapInUserInfo");

  return v4;
}

- (id)watchVersionThatUsesUserInfoForContextForSectionID:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_configurations, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "watchVersionThatUsesUserInfoForContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)additionalBridgeSectionIDsForSectionID:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_configurations, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "additionalBridgeSectionIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)hasSectionIDOptedOutOfSubtitleRemovalForOlderWatches:(id)a3
{
  void *v3;
  char v4;

  -[NSDictionary objectForKeyedSubscript:](self->_configurations, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "optOutOfSubtitleRemovalForOlderWatches");

  return v4;
}

- (id)_loadConfigurations
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("SectionConfiguration"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__BLTSectionConfigurationInternal__loadConfigurations__block_invoke;
  v8[3] = &unk_24D7622F0;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

void __54__BLTSectionConfigurationInternal__loadConfigurations__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;

  v5 = a2;
  +[BLTSectionConfigurationItemFactory itemForSection:dictionary:](BLTSectionConfigurationItemFactory, "itemForSection:dictionary:", v5, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (BOOL)shouldUsePhoneExpirationDateForSectionID:(id)a3
{
  void *v3;
  char v4;

  -[NSDictionary objectForKeyedSubscript:](self->_configurations, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldUsePhoneExpirationDate");

  return v4;
}

- (BOOL)hasSectionIDOptedOutOfSettingsCoordination:(id)a3
{
  void *v3;
  char v4;

  -[NSDictionary objectForKeyedSubscript:](self->_configurations, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "optOutOfSettingsCoordination");

  return v4;
}

- (BOOL)setCoordinationType:(unint64_t)a3 sectionID:(id)a4
{
  void *v5;

  -[NSDictionary objectForKeyedSubscript:](self->_configurations, "objectForKeyedSubscript:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "updateCoordinationType:", a3);

  return a3;
}

- (id)watchVersionThatUsesAttachmentURLForSectionID:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_configurations, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "watchVersionThatUsesAttachmentURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurations, 0);
}

@end
