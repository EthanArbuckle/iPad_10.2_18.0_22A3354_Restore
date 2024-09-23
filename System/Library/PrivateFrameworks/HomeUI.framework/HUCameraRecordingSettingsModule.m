@implementation HUCameraRecordingSettingsModule

- (HUCameraRecordingSettingsModule)initWithItemUpdater:(id)a3 cameraProfiles:(id)a4 displayStyle:(unint64_t)a5
{
  id v9;
  id v10;
  HUCameraRecordingSettingsModule *v11;
  uint64_t v12;
  NSSet *cameraProfiles;
  uint64_t v14;
  HULocationDeviceManager *locationDeviceManager;
  void *v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  if (!objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCameraRecordingSettingsModule.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cameraProfiles.count > 0"));

  }
  v18.receiver = self;
  v18.super_class = (Class)HUCameraRecordingSettingsModule;
  v11 = -[HFItemModule initWithItemUpdater:](&v18, sel_initWithItemUpdater_, v9);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    cameraProfiles = v11->_cameraProfiles;
    v11->_cameraProfiles = (NSSet *)v12;

    v11->_displayStyle = a5;
    +[HULocationDeviceManager sharedInstance](HULocationDeviceManager, "sharedInstance");
    v14 = objc_claimAutoreleasedReturnValue();
    locationDeviceManager = v11->_locationDeviceManager;
    v11->_locationDeviceManager = (HULocationDeviceManager *)v14;

    -[HUCameraRecordingSettingsModule _buildItemProviders](v11, "_buildItemProviders");
  }

  return v11;
}

- (HUCameraRecordingSettingsModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_cameraProfiles_displayStyle_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCameraRecordingSettingsModule.m"), 82, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCameraRecordingSettingsModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (BOOL)isItemHeader:(id)a3
{
  return 0;
}

- (unint64_t)awayAccessModeSetting
{
  void *v2;
  unint64_t v3;

  -[HUCameraRecordingSettingsModule whenAwaySectionModule](self, "whenAwaySectionModule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessModeSetting");

  return v3;
}

- (unint64_t)presentAccessModeSetting
{
  void *v2;
  unint64_t v3;

  -[HUCameraRecordingSettingsModule whenHomeSectionModule](self, "whenHomeSectionModule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessModeSetting");

  return v3;
}

- (NSArray)presenceModules
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[HUCameraRecordingSettingsModule whenAwaySectionModule](self, "whenAwaySectionModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[HUCameraRecordingSettingsModule whenHomeSectionModule](self, "whenHomeSectionModule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)_buildItemProviders
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  HUCameraRecordingOptionsItem *v8;
  void *v9;
  HUCameraRecordingOptionsItem *v10;
  HUCameraRecordingOptionsItem *recordingOptionsItem;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HUCameraPresenceRecordingSettingsModule *v17;
  void *v18;
  void *v19;
  HUCameraPresenceRecordingSettingsModule *v20;
  HUCameraPresenceRecordingSettingsModule *v21;
  void *v22;
  void *v23;
  HUCameraPresenceRecordingSettingsModule *v24;
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
  id v35;
  void *v36;
  NSArray *v37;
  NSArray *cameraPresenceItems;
  void *v39;
  void *v40;
  NSString *v41;
  NSString *longestCameraUsageOptionItemTitle;
  _QWORD v43[5];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  __CFString *v49;
  _QWORD v50[4];
  id v51[2];
  id location;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  -[HUCameraRecordingSettingsModule locationDeviceManager](self, "locationDeviceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeLocationDeviceFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __54__HUCameraRecordingSettingsModule__buildItemProviders__block_invoke;
  v50[3] = &unk_1E6F5B548;
  objc_copyWeak(v51, &location);
  v51[1] = (id)a2;
  v7 = (id)objc_msgSend(v5, "flatMap:", v50);

  v8 = [HUCameraRecordingOptionsItem alloc];
  -[HUCameraRecordingSettingsModule cameraProfiles](self, "cameraProfiles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUCameraRecordingOptionsItem initWithCameraProfiles:](v8, "initWithCameraProfiles:", v9);
  recordingOptionsItem = self->_recordingOptionsItem;
  self->_recordingOptionsItem = v10;

  v12 = objc_alloc(MEMORY[0x1E0D31848]);
  v13 = (void *)MEMORY[0x1E0C99E60];
  -[HUCameraRecordingSettingsModule recordingOptionsItem](self, "recordingOptionsItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v12, "initWithItems:", v15);

  v17 = [HUCameraPresenceRecordingSettingsModule alloc];
  -[HFItemModule itemUpdater](self, "itemUpdater");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingSettingsModule cameraProfiles](self, "cameraProfiles");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HUCameraPresenceRecordingSettingsModule initWithItemUpdater:cameraProfiles:presenceEventType:](v17, "initWithItemUpdater:cameraProfiles:presenceEventType:", v18, v19, 3);
  -[HUCameraRecordingSettingsModule setWhenHomeSectionModule:](self, "setWhenHomeSectionModule:", v20);

  v21 = [HUCameraPresenceRecordingSettingsModule alloc];
  -[HFItemModule itemUpdater](self, "itemUpdater");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingSettingsModule cameraProfiles](self, "cameraProfiles");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[HUCameraPresenceRecordingSettingsModule initWithItemUpdater:cameraProfiles:presenceEventType:](v21, "initWithItemUpdater:cameraProfiles:presenceEventType:", v22, v23, 4);
  -[HUCameraRecordingSettingsModule setWhenAwaySectionModule:](self, "setWhenAwaySectionModule:", v24);

  v25 = (void *)MEMORY[0x1E0C99E60];
  -[HUCameraRecordingSettingsModule expandableModules](self, "expandableModules");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setWithArray:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "na_flatMap:", &__block_literal_global_39_0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setByAddingObjectsFromArray:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingSettingsModule setItemProviders:](self, "setItemProviders:", v30);

  v31 = (void *)MEMORY[0x1E0D314C0];
  -[HUCameraRecordingSettingsModule itemProviders](self, "itemProviders");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "requestToReloadItemProviders:senderSelector:", v32, a2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (id)objc_msgSend(v34, "performItemUpdateRequest:", v33);

  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__26;
  v48 = __Block_byref_object_dispose__26;
  v49 = &stru_1E6F60E80;
  -[HUCameraRecordingSettingsModule presenceModules](self, "presenceModules");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v6;
  v43[1] = 3221225472;
  v43[2] = __54__HUCameraRecordingSettingsModule__buildItemProviders__block_invoke_42;
  v43[3] = &unk_1E6F5B590;
  v43[4] = &v44;
  objc_msgSend(v36, "na_map:", v43);
  v37 = (NSArray *)objc_claimAutoreleasedReturnValue();
  cameraPresenceItems = self->_cameraPresenceItems;
  self->_cameraPresenceItems = v37;

  objc_storeStrong((id *)&self->_longestCameraPresenceItemTitle, (id)v45[5]);
  -[HUCameraRecordingSettingsModule presenceModules](self, "presenceModules");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "firstObject");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "longestCameraUsageOptionItemTitle");
  v41 = (NSString *)objc_claimAutoreleasedReturnValue();
  longestCameraUsageOptionItemTitle = self->_longestCameraUsageOptionItemTitle;
  self->_longestCameraUsageOptionItemTitle = v41;

  _Block_object_dispose(&v44, 8);
  objc_destroyWeak(v51);
  objc_destroyWeak(&location);
}

id __54__HUCameraRecordingSettingsModule__buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setLocationDeviceName:", v5);

    v6 = (void *)MEMORY[0x1E0D314C0];
    objc_msgSend(WeakRetained, "itemProviders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requestToReloadItemProviders:senderSelector:", v7, *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "itemUpdater");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "performItemUpdateRequest:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "futureWithError:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

uint64_t __54__HUCameraRecordingSettingsModule__buildItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "itemProviders");
}

id __54__HUCameraRecordingSettingsModule__buildItemProviders__block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "showOptionsItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "length");
  if (v7 > objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "length"))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v6);
  objc_msgSend(v3, "showOptionsItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_expandingSectionModuleForPresenceType:(unint64_t)a3
{
  void *v3;

  if (a3 == 4)
  {
    -[HUCameraRecordingSettingsModule whenAwaySectionModule](self, "whenAwaySectionModule");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 3)
  {
    -[HUCameraRecordingSettingsModule whenHomeSectionModule](self, "whenHomeSectionModule");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)expandableModules
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[HUCameraRecordingSettingsModule whenHomeSectionModule](self, "whenHomeSectionModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[HUCameraRecordingSettingsModule whenAwaySectionModule](self, "whenAwaySectionModule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[HUCameraRecordingSettingsModule expandableModules](self, "expandableModules", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v10), "buildSectionsWithDisplayedItems:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "na_flatMap:", &__block_literal_global_46_0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  if (-[HUCameraRecordingSettingsModule displayStyle](self, "displayStyle") == 3)
  {
    -[HUCameraRecordingSettingsModule recordingOptionsItem](self, "recordingOptionsItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v13);

  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("RecordingSettings"));
  objc_msgSend(v14, "setItems:", v5);
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraStreamingSettingsHeaderDisplayStyleServiceDetails_streaming-and-recording_Title"), CFSTR("HUCameraStreamingSettingsHeaderDisplayStyleServiceDetails_streaming-and-recording_Title"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHeaderTitle:", v15);

  -[HUCameraRecordingSettingsModule _attributedFooterTitle](self, "_attributedFooterTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAttributedFooterTitle:", v16);

  v17 = (void *)MEMORY[0x1E0D314B0];
  v25 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "filterSections:toDisplayedItems:", v18, v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t __67__HUCameraRecordingSettingsModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "items");
}

- (id)_attributedFooterTitle
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  _HULocalizedStringWithDefaultValue(CFSTR("HUPresenceActiveLocationDeviceFooterSettingsLinkTitle"), CFSTR("HUPresenceActiveLocationDeviceFooterSettingsLinkTitle"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HUCameraRecordingSettingsModule displayStyle](self, "displayStyle") == 2
    || -[HUCameraRecordingSettingsModule displayStyle](self, "displayStyle") == 1)
  {
    -[HUCameraRecordingSettingsModule locationDeviceName](self, "locationDeviceName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[HUCameraRecordingSettingsModule locationDeviceName](self, "locationDeviceName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUCameraRecordingSetup_Footer"), CFSTR("%@%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      HULocalizedStringWithFormat(CFSTR("HUCameraRecordingSetup_Footer_NoFMF"), CFSTR("%@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) != 0
      || -[HUCameraRecordingSettingsModule displayStyle](self, "displayStyle") != 1)
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v19, 0);
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB3498];
      objc_msgSend(MEMORY[0x1E0C99E98], "hf_locationDeviceSettingsURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "hf_attributedLinkStringForString:linkString:linkURL:", v19, v3, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    -[HUCameraRecordingSettingsModule locationDeviceName](self, "locationDeviceName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      -[HUCameraRecordingSettingsModule locationDeviceName](self, "locationDeviceName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUCameraStreamingSettingsFooterDisplayStyleServiceDetails_footer_Title"), CFSTR("%@%@%@"), v31, v32, v33, v34, v35, v36, (uint64_t)v30);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      HULocalizedStringWithFormat(CFSTR("HUCameraStreamingSettingsFooterDisplayStyleServiceDetails_footer_NoFMF_Title"), CFSTR("%@%@"), v23, v24, v25, v26, v27, v28, (uint64_t)v3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) != 0)
    {
      v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v19, 0);
    }
    else
    {
      v38 = (void *)MEMORY[0x1E0CB3498];
      objc_msgSend(MEMORY[0x1E0C99E98], "hf_locationDeviceSettingsURL");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "hf_attributedLinkStringForString:linkString:linkURL:", v19, v3, v39);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v40 = (void *)MEMORY[0x1E0CB3498];
    objc_msgSend(MEMORY[0x1E0C99E98], "hf_cameraRecordingURL");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "hf_attributedLinkStringForAttributedString:linkString:linkURL:", v37, v4, v41);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v22;
}

- (id)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUExpandableItemContainerModule expandableModuleForItem:](self, "expandableModuleForItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "didSelectItem:", v4);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  objc_opt_class();
  v8 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __49__HUCameraRecordingSettingsModule_didSelectItem___block_invoke;
    v13[3] = &unk_1E6F4DB40;
    objc_copyWeak(&v15, &location);
    v14 = v8;
    v11 = (id)objc_msgSend(v5, "addCompletionBlock:", v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __49__HUCameraRecordingSettingsModule_didSelectItem___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cameraRecordingSettingsModule:didUpdateItem:", WeakRetained, *(_QWORD *)(a1 + 32));

  }
}

- (NSSet)itemProviders
{
  return self->_itemProviders;
}

- (void)setItemProviders:(id)a3
{
  objc_storeStrong((id *)&self->_itemProviders, a3);
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (NSString)longestCameraUsageOptionItemTitle
{
  return self->_longestCameraUsageOptionItemTitle;
}

- (NSString)longestCameraPresenceItemTitle
{
  return self->_longestCameraPresenceItemTitle;
}

- (NSArray)cameraPresenceItems
{
  return self->_cameraPresenceItems;
}

- (HUCameraRecordingSettingsModuleDelegate)delegate
{
  return (HUCameraRecordingSettingsModuleDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSSet)cameraProfiles
{
  return self->_cameraProfiles;
}

- (HUCameraRecordingOptionsItem)recordingOptionsItem
{
  return self->_recordingOptionsItem;
}

- (HUCameraPresenceRecordingSettingsModule)whenHomeSectionModule
{
  return self->_whenHomeSectionModule;
}

- (void)setWhenHomeSectionModule:(id)a3
{
  objc_storeStrong((id *)&self->_whenHomeSectionModule, a3);
}

- (HUCameraPresenceRecordingSettingsModule)whenAwaySectionModule
{
  return self->_whenAwaySectionModule;
}

- (void)setWhenAwaySectionModule:(id)a3
{
  objc_storeStrong((id *)&self->_whenAwaySectionModule, a3);
}

- (HULocationDeviceManager)locationDeviceManager
{
  return self->_locationDeviceManager;
}

- (void)setLocationDeviceManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationDeviceManager, a3);
}

- (NSString)locationDeviceName
{
  return self->_locationDeviceName;
}

- (void)setLocationDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_locationDeviceName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationDeviceName, 0);
  objc_storeStrong((id *)&self->_locationDeviceManager, 0);
  objc_storeStrong((id *)&self->_whenAwaySectionModule, 0);
  objc_storeStrong((id *)&self->_whenHomeSectionModule, 0);
  objc_storeStrong((id *)&self->_recordingOptionsItem, 0);
  objc_storeStrong((id *)&self->_cameraProfiles, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cameraPresenceItems, 0);
  objc_storeStrong((id *)&self->_longestCameraPresenceItemTitle, 0);
  objc_storeStrong((id *)&self->_longestCameraUsageOptionItemTitle, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
