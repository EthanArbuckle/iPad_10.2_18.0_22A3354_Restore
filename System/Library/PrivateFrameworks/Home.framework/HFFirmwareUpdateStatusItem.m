@implementation HFFirmwareUpdateStatusItem

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  HFSoftwareUpdateCounter *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  HFMutableItemUpdateOutcome *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  HFImageIconDescriptor *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const __CFString *v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", HFItemUpdateOptionFastInitialUpdate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0D519C0];
    v49 = CFSTR("hidden");
    v50[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "futureWithResult:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  -[HFStatusItem room](self, "room");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[HFStatusItem room](self, "room");
  else
    -[HFStatusItem home](self, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessories");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[HFSoftwareUpdateCounter initWithAccessories:]([HFSoftwareUpdateCounter alloc], "initWithAccessories:", v13);
  if (!-[HFSoftwareUpdateCounter softwareUpdatesInProgress](v14, "softwareUpdatesInProgress"))
  {
    if (-[HFSoftwareUpdateCounter updatesReadyToInstall](v14, "updatesReadyToInstall"))
    {
      v47 = -[HFSoftwareUpdateCounter updatesReadyToInstall](v14, "updatesReadyToInstall");
      HFLocalizedStringWithFormat(CFSTR("HFStatusTitleFirmwareUpdateAvailable"), CFSTR("%lu"), v21, v22, v23, v24, v25, v26, v47);
      goto LABEL_13;
    }
LABEL_14:
    v33 = 0;
    goto LABEL_15;
  }
  if (!-[HFSoftwareUpdateCounter softwareUpdatesInstalling](v14, "softwareUpdatesInstalling"))
  {
    if (-[HFSoftwareUpdateCounter softwareUpdatesDownloading](v14, "softwareUpdatesDownloading"))
    {
      v48 = -[HFSoftwareUpdateCounter softwareUpdatesDownloading](v14, "softwareUpdatesDownloading");
      HFLocalizedStringWithFormat(CFSTR("HFStatusTitleFirmwareUpdateDownloading"), CFSTR("%lu"), v27, v28, v29, v30, v31, v32, v48);
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v46 = -[HFSoftwareUpdateCounter softwareUpdatesInstalling](v14, "softwareUpdatesInstalling");
  HFLocalizedStringWithFormat(CFSTR("HFStatusTitleFirmwareUpdateInstalling"), CFSTR("%lu"), v15, v16, v17, v18, v19, v20, v46);
LABEL_13:
  v33 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
  v34 = objc_alloc_init(HFMutableItemUpdateOutcome);
  v35 = (void *)MEMORY[0x1E0C99E60];
  v36 = objc_opt_class();
  v37 = objc_opt_class();
  v38 = objc_opt_class();
  objc_msgSend(v35, "setWithObjects:", v36, v37, v38, objc_opt_class(), 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v39, CFSTR("dependentHomeKitClasses"));

  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hasSoftwareUpdateV2Dependency"));
  if (v33)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "na_filter:", &__block_literal_global_70);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 24.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:configuration:", CFSTR("square.and.arrow.down.fill"), v42);
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v43, CFSTR("icon"));

    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", &unk_1EA7CC010, CFSTR("statusItemCategory"));
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v41, CFSTR("representedHomeKitObjects"));
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v33, CFSTR("title"));
    _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusSortKeyFirmwareUpdate"), CFSTR("HFStatusSortKeyFirmwareUpdate"), 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v44, CFSTR("sortKey"));

    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", &unk_1EA7CC028, CFSTR("priority"));
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("shouldHideForNonAdminUsers"));

  }
  else
  {
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v34);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  return v45;
}

uint64_t __58__HFFirmwareUpdateStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_hasNewValidSoftwareOrFirmwareUpdate");
}

@end
