@implementation HUServiceDetailsShowContainedItemsInGroupItem

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v45;
  void *v46;
  id v48;
  _QWORD v49[5];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint8_t buf[4];
  HUServiceDetailsShowContainedItemsInGroupItem *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsContainedServicesLabel"), CFSTR("HUServiceDetailsContainedServicesLabel"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D30D18];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("AccessoryDetails.ContainedServices"), *MEMORY[0x1E0D30BA0]);
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v8, "conformsToProtocol:", &unk_1EF316598);

  if ((_DWORD)v5)
  {
    -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = &unk_1EF316598;
    v11 = v9;
    if (objc_msgSend(v11, "conformsToProtocol:", v10))
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    v14 = objc_msgSend(v13, "numberOfCompoundItems");
    v51[3] = v14;
    objc_msgSend(v13, "homeKitObject");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_safeAddObject:", v15);
LABEL_16:

    goto LABEL_17;
  }
  if (-[HUServiceDetailsAbstractItem isItemGroup](self, "isItemGroup"))
  {
    -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = &unk_1EF2AC600;
    v18 = v16;
    if (objc_msgSend(v18, "conformsToProtocol:", v17))
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    v21 = objc_msgSend(v20, "numberOfItemsContainedWithinGroup");
    v51[3] = v21;
    objc_opt_class();
    v13 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v13;
    else
      v22 = 0;
    v15 = v22;

    if (objc_msgSend(v15, "isHomePodMediaSystem"))
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsContainedSpeakersLabel"), CFSTR("HUServiceDetailsContainedSpeakersLabel"), 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, v6);

    }
    objc_msgSend(v13, "homeKitObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v24);

    goto LABEL_16;
  }
LABEL_17:
  -[HUServiceDetailsShowContainedItemsInGroupItem sourceBridgeAccessory](self, "sourceBridgeAccessory");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "hf_bridgedAccessories");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HUServiceDetailsAbstractItem isBridge](self, "isBridge")
    && !-[HUServiceDetailsAbstractItem isService](self, "isService"))
  {
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __77__HUServiceDetailsShowContainedItemsInGroupItem__subclass_updateWithOptions___block_invoke;
    v49[3] = &unk_1E6F584F0;
    v49[4] = &v50;
    objc_msgSend(v26, "na_each:", v49);
    objc_msgSend(v7, "na_safeAddObject:", v25);
  }
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = -[HUServiceDetailsAbstractItem isMediaAccessoryGroup](self, "isMediaAccessoryGroup");

    if (!v28)
    {
      -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "accessories");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "anyObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "hf_visibleServices");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "count");

      HFLogForCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v45 = (id)objc_claimAutoreleasedReturnValue();
        -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v55 = self;
        v56 = 2112;
        v57 = v45;
        v58 = 2048;
        v59 = v33;
        v60 = 2112;
        v61 = v46;
        _os_log_error_impl(&dword_1B8E1E000, v34, OS_LOG_TYPE_ERROR, "%@:%@ Adding %ld, visible services to count for media accessory %@", buf, 0x2Au);

      }
      v51[3] += v33;
    }
  }
  else
  {

  }
  if (-[HUServiceDetailsShowContainedItemsInGroupItem hasAnyVisibleBridgedAccessories](self, "hasAnyVisibleBridgedAccessories"))
  {
    v35 = v51[3];
    objc_msgSend(v25, "uniqueIdentifiersForBridgedAccessories");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count");
    v51[3] = v37 + v35;

    objc_msgSend(v7, "addObject:", v26);
  }
  if (v51[3] < 1)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }
  else
  {
    v38 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "localizedStringFromNumber:numberStyle:", v39, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v40, *MEMORY[0x1E0D30BF8]);

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30B80]);
  }
  v41 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v4);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "futureWithResult:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v50, 8);
  return v43;
}

void __77__HUServiceDetailsShowContainedItemsInGroupItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(v4, "hf_showAsIndividualServices") & 1) != 0)
  {
    objc_msgSend(v4, "hf_visibleServices");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v3, "count");

  }
  else
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }

}

- (id)sourceBridgeAccessory
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    v9 = objc_opt_isKindOfClass();

    if ((v9 & 1) == 0)
    {
      v8 = 0;
      return v8;
    }
    -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)hasAnyVisibleBridgedServices
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[HUServiceDetailsAbstractItem isBridge](self, "isBridge");
  if (v3)
  {
    -[HUServiceDetailsShowContainedItemsInGroupItem sourceBridgeAccessory](self, "sourceBridgeAccessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_servicesBehindBridge");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_247);

    LOBYTE(v3) = v6;
  }
  return v3;
}

uint64_t __77__HUServiceDetailsShowContainedItemsInGroupItem_hasAnyVisibleBridgedServices__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isVisible");
}

- (BOOL)hasAnyVisibleBridgedAccessories
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[HUServiceDetailsAbstractItem isBridge](self, "isBridge");
  if (v3)
  {
    -[HUServiceDetailsShowContainedItemsInGroupItem sourceBridgeAccessory](self, "sourceBridgeAccessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_bridgedAccessories");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_80_0);

    LOBYTE(v3) = v6;
  }
  return v3;
}

uint64_t __80__HUServiceDetailsShowContainedItemsInGroupItem_hasAnyVisibleBridgedAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isRemoteControl");
}

@end
