@implementation HUContainedServicesGridViewController

id __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v15;
  _QWORD v16[4];
  __int128 v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  if (*(_QWORD *)(a1 + 32))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D317D8]), "initWithHome:serviceTypes:", v3, 0);
    objc_msgSend(v6, "setValueSource:", *(_QWORD *)(a1 + 40));
    v29[0] = v5;
    v29[1] = 3221225472;
    v29[2] = __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke_2;
    v29[3] = &unk_1E6F4D8E8;
    v30 = *(id *)(a1 + 32);
    objc_msgSend(v6, "setFilter:", v29);
    objc_msgSend(v4, "addObject:", v6);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D310B0]), "initWithHome:", v3);
    objc_msgSend(v7, "setValueSource:", *(_QWORD *)(a1 + 40));
    v26[0] = v5;
    v26[1] = 3221225472;
    v26[2] = __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke_3;
    v26[3] = &unk_1E6F4D910;
    v27 = *(id *)(a1 + 32);
    v28 = *(_OWORD *)(a1 + 56);
    objc_msgSend(v7, "setFilter:", v26);
    objc_msgSend(v4, "addObject:", v7);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D316B0]), "initWithHome:", v3);
    v24[0] = v5;
    v24[1] = 3221225472;
    v24[2] = __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke_109;
    v24[3] = &unk_1E6F4D8E8;
    v25 = *(id *)(a1 + 32);
    objc_msgSend(v8, "setFilter:", v24);
    objc_msgSend(v4, "addObject:", v8);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D318B0]), "initWithHome:", v3);
    v22[0] = v5;
    v22[1] = 3221225472;
    v22[2] = __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke_2_111;
    v22[3] = &unk_1E6F4D8E8;
    v23 = *(id *)(a1 + 32);
    objc_msgSend(v9, "setFilter:", v22);
    objc_msgSend(v4, "addObject:", v9);

  }
  if (*(_QWORD *)(a1 + 48))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31510]), "initWithHome:includeContainedProfiles:", v3, 0);
    objc_msgSend(v10, "setValueSource:", *(_QWORD *)(a1 + 40));
    v19[0] = v5;
    v19[1] = 3221225472;
    v19[2] = __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke_3_113;
    v19[3] = &unk_1E6F4D910;
    v20 = *(id *)(a1 + 48);
    v21 = *(_OWORD *)(a1 + 56);
    objc_msgSend(v10, "setFilter:", v19);
    objc_msgSend(v4, "addObject:", v10);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D317D8]), "initWithHome:serviceTypes:", v3, 0);
    objc_msgSend(v11, "setValueSource:", *(_QWORD *)(a1 + 40));
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke_320;
    v16[3] = &unk_1E6F4D910;
    v18 = *(_QWORD *)(a1 + 64);
    v15 = *(_OWORD *)(a1 + 48);
    v12 = (id)v15;
    v17 = v15;
    objc_msgSend(v11, "setFilter:", v16);
    objc_msgSend(v4, "addObject:", v11);

  }
  v13 = (void *)objc_msgSend(v4, "copy", v15);

  return v13;
}

uint64_t __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "hu_containedServices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  return v8;
}

uint64_t __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "hu_containedAccessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "containsObject:", v6))
  {

    goto LABEL_10;
  }
  v8 = objc_msgSend(v6, "hf_isHomePod");

  if (!v8)
  {
LABEL_10:
    objc_msgSend(*(id *)(a1 + 32), "hu_containedAccessories");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "containsObject:", v6);

    goto LABEL_11;
  }
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v13;
    v17 = 2112;
    v18 = v14;
    v19 = 2112;
    v20 = v6;
    _os_log_error_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_ERROR, "%@:%@ HomePod %@ reports itself as part of the service container, filtering out", (uint8_t *)&v15, 0x20u);

  }
  v10 = 0;
LABEL_11:

  return v10;
}

uint64_t __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke_109(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "hu_containedServices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v6, "services");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "intersectsSet:", v10);

  return v11;
}

uint64_t __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke_2_111(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (objc_msgSend(v6, "hf_isRemoteControl"))
  {
    objc_msgSend(*(id *)(a1 + 32), "hu_containedAccessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_owningBridgeAccessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke_3_113(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF347468))
  {
    v4 = v3;
    if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EF347468))
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    objc_msgSend(*(id *)(a1 + 32), "accessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_backingAccessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "containsObject:", v8))
    {
      objc_msgSend(v6, "hf_backingAccessory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "hf_isHomePod") & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "accessories");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");

        if (v11 == 1)
        {
          HFLogForCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v16 = *(_QWORD *)(a1 + 40);
            NSStringFromSelector(*(SEL *)(a1 + 48));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "hf_backingAccessory");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = 138412802;
            v20 = v16;
            v21 = 2112;
            v22 = v17;
            v23 = 2112;
            v24 = v18;
            _os_log_error_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_ERROR, "%@:%@ HomePod %@ reports itself as part of the service container as a media item, filtering out", (uint8_t *)&v19, 0x20u);

          }
          v13 = 0;
          goto LABEL_15;
        }
LABEL_14:
        objc_msgSend(*(id *)(a1 + 32), "mediaProfileContainers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v14, "containsObject:", v6);

LABEL_15:
        goto LABEL_16;
      }

    }
    goto LABEL_14;
  }
  v13 = 0;
LABEL_16:

  return v13;
}

uint64_t __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke_320(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v15 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412802;
    v21 = v15;
    v22 = 2112;
    v23 = v16;
    v24 = 2112;
    v25 = v3;
    _os_log_debug_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEBUG, "%@:%@: Filtering check for: %@", (uint8_t *)&v20, 0x20u);

  }
  objc_opt_class();
  v5 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = v5;
  objc_msgSend(*(id *)(a1 + 32), "accessories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "containsObject:", v10))
  {

    goto LABEL_12;
  }
  v11 = objc_msgSend(*(id *)(a1 + 32), "isHomePodMediaSystem");

  if (!v11)
  {
LABEL_12:
    objc_msgSend(*(id *)(a1 + 32), "hu_containedServices");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = -[NSObject containsObject:](v12, "containsObject:", v7);
    goto LABEL_13;
  }
  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v17 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412802;
    v21 = v17;
    v22 = 2112;
    v23 = v18;
    v24 = 2112;
    v25 = v19;
    _os_log_error_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_ERROR, "%@:%@ HomePod %@ has services but is part of a media group, filtering out", (uint8_t *)&v20, 0x20u);

  }
  v13 = 0;
LABEL_13:

  return v13;
}

@end
