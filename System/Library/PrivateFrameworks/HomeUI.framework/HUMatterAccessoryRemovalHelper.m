@implementation HUMatterAccessoryRemovalHelper

- (HUMatterAccessoryRemovalHelper)initWithItem:(id)a3 connectedEcosystems:(id)a4
{
  id v6;
  id v7;
  HUMatterAccessoryRemovalHelper *v8;
  HUMatterAccessoryRemovalHelper *v9;
  void *v10;
  uint64_t v11;
  NSArray *connectedEcosystems;
  uint64_t v13;
  NSArray *thirdPartyEcosystems;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUMatterAccessoryRemovalHelper;
  v8 = -[HUMatterAccessoryRemovalHelper init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_item, v6);
    objc_msgSend(MEMORY[0x1E0CBA390], "hf_ecosystemComparator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortedArrayUsingComparator:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    connectedEcosystems = v9->_connectedEcosystems;
    v9->_connectedEcosystems = (NSArray *)v11;

    objc_msgSend(v7, "na_filter:", &__block_literal_global_0);
    v13 = objc_claimAutoreleasedReturnValue();
    thirdPartyEcosystems = v9->_thirdPartyEcosystems;
    v9->_thirdPartyEcosystems = (NSArray *)v13;

    v9->_shouldUseEcosystemRemovalConfirmation = -[HUMatterAccessoryRemovalHelper updateShouldUseEcosystemRemovalConfirmation](v9, "updateShouldUseEcosystemRemovalConfirmation");
  }

  return v9;
}

uint64_t __67__HUMatterAccessoryRemovalHelper_initWithItem_connectedEcosystems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "vendor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isAppleVendor") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "vendor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isSystemCommissionerVendor") ^ 1;

  }
  return v4;
}

- (BOOL)updateShouldUseEcosystemRemovalConfirmation
{
  void *v3;
  void *v4;
  id v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;

  -[HUMatterAccessoryRemovalHelper item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF2AC600))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "isItemGroup");
  if ((v6 & 1) != 0)
    return 0;
  objc_opt_class();
  -[HUMatterAccessoryRemovalHelper item](self, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_opt_isKindOfClass() & 1) != 0 ? v7 : 0;

  if (v8)
    return 0;
  objc_opt_class();
  -[HUMatterAccessoryRemovalHelper item](self, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_opt_isKindOfClass() & 1) != 0 ? v9 : 0;
  v11 = v10;

  objc_msgSend(v11, "accessories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v11) = objc_msgSend(v12, "na_any:", &__block_literal_global_58);
  if ((v11 & 1) != 0)
    return 0;
  -[HUMatterAccessoryRemovalHelper item](self, "item");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessories");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15 != 1)
    return 0;
  -[HUMatterAccessoryRemovalHelper item](self, "item");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accessories");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "anyObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "supportsCHIP"))
  {
    -[HUMatterAccessoryRemovalHelper thirdPartyEcosystems](self, "thirdPartyEcosystems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count") != 0;

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

uint64_t __77__HUMatterAccessoryRemovalHelper_updateShouldUseEcosystemRemovalConfirmation__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "categoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB7A58]);

  return v4;
}

- (void)matterAccessoryGenerateRemovalConfirmationForAccessoryName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  _QWORD v88[4];
  id v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t (*v94)(uint64_t, uint64_t);
  void (*v95)(uint64_t);
  id v96;
  uint8_t buf[4];
  id v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v87 = a3;
  -[HUMatterAccessoryRemovalHelper setTitle:](self, "setTitle:", 0);
  -[HUMatterAccessoryRemovalHelper item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUEcosystemAccessoryRemovalActionForAppleHome"), CFSTR("%@"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMatterAccessoryRemovalHelper setRemovalActionTitle:](self, "setRemovalActionTitle:", v13);

  HULocalizedStringWithFormat(CFSTR("HUServiceDetailsRemoveDeviceAlertTitle"), CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v87);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMatterAccessoryRemovalHelper setRemovalActionConfirmationTitle:](self, "setRemovalActionConfirmationTitle:", v20);

  _HULocalizedStringWithDefaultValue(CFSTR("HURemoveTitle"), CFSTR("HURemoveTitle"), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMatterAccessoryRemovalHelper setRemovalActionConfirmationButtonTitle:](self, "setRemovalActionConfirmationButtonTitle:", v21);

  objc_opt_class();
  -[HUMatterAccessoryRemovalHelper item](self, "item");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v23 = v22;
  else
    v23 = 0;
  v24 = v23;

  objc_msgSend(v24, "profile");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "hf_supportsRecordingEvents");

  if (v26)
  {
    HULocalizedStringWithFormat(CFSTR("HUServiceDetailsRemoveCameraWithClipsAlertTitle"), CFSTR("%@"), v27, v28, v29, v30, v31, v32, (uint64_t)v87);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMatterAccessoryRemovalHelper setTitle:](self, "setTitle:", v33);

    _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsRemoveDeviceAlertRemoveCameraButton"), CFSTR("HUServiceDetailsRemoveDeviceAlertRemoveCameraButton"), 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMatterAccessoryRemovalHelper setRemovalActionTitle:](self, "setRemovalActionTitle:", v34);

  }
  v91 = 0;
  v92 = &v91;
  v93 = 0x3032000000;
  v94 = __Block_byref_object_copy_;
  v95 = __Block_byref_object_dispose_;
  v96 = 0;
  v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HUMatterAccessoryRemovalHelper connectedEcosystems](self, "connectedEcosystems");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v88[2] = __93__HUMatterAccessoryRemovalHelper_matterAccessoryGenerateRemovalConfirmationForAccessoryName___block_invoke;
  v88[3] = &unk_1E6F4C2E8;
  v90 = &v91;
  v37 = v35;
  v89 = v37;
  objc_msgSend(v36, "na_each:", v88);

  objc_msgSend(v37, "sortUsingSelector:", sel_localizedStandardCompare_);
  HFLogForCategory();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v98 = v37;
    _os_log_impl(&dword_1B8E1E000, v38, OS_LOG_TYPE_DEFAULT, "vendorNames, %@", buf, 0xCu);
  }

  HFLogForCategory();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v40 = (void *)v92[5];
    *(_DWORD *)buf = 138412290;
    v98 = v40;
    _os_log_impl(&dword_1B8E1E000, v39, OS_LOG_TYPE_DEFAULT, "systemCommissionerVendor, %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1E6F60E80);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v37, "count") == 1)
  {
    objc_msgSend(v37, "firstObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUEcosystemAccessoryRemovalActionConfirmationTitleForOneEcosystem"), CFSTR("%@"), v43, v44, v45, v46, v47, v48, (uint64_t)v42);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "appendString:", v49);
  }
  else if (objc_msgSend(v37, "count") == 2)
  {
    objc_msgSend(v37, "firstObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "lastObject");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUEcosystemAccessoryRemovalActionConfirmationTitleForTwoEcosystems"), CFSTR("%@%@"), v50, v51, v52, v53, v54, v55, (uint64_t)v42);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "appendString:", v56);

  }
  else
  {
    if ((unint64_t)objc_msgSend(v37, "count") < 3)
      goto LABEL_20;
    objc_msgSend(v37, "firstObject");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUEcosystemAccessoryRemovalActionConfirmationTitleForMultipleEcosystems_FirstEcosystem"), CFSTR("%@"), v58, v59, v60, v61, v62, v63, (uint64_t)v57);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "appendString:", v64);

    v65 = objc_msgSend(v37, "count");
    if (v65 - 1 >= 2)
    {
      v66 = 2;
      do
      {
        objc_msgSend(v37, "objectAtIndexedSubscript:", v66 - 1);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        HULocalizedStringWithFormat(CFSTR("HUEcosystemAccessoryRemovalActionConfirmationTitleForMultipleEcosystems_OtherEcosystems"), CFSTR("%@"), v68, v69, v70, v71, v72, v73, (uint64_t)v67);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "appendString:", v74);

        ++v66;
      }
      while (v65 != v66);
    }
    objc_msgSend(v37, "lastObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUEcosystemAccessoryRemovalActionConfirmationTitleForMultipleEcosystems_LastEcosystem"), CFSTR("%@"), v75, v76, v77, v78, v79, v80, (uint64_t)v42);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "appendString:", v49);
  }

LABEL_20:
  if (v92[5])
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUEcosystemAccessoryRemovalActionConfirmationTitle_SystemCommissioner"), CFSTR("HUEcosystemAccessoryRemovalActionConfirmationTitle_SystemCommissioner"), 1);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "appendString:", v81);

  }
  _HULocalizedStringWithDefaultValue(CFSTR("HUEcosystemAccessoryRemovalActionConfirmationTitle_Postfix"), CFSTR("HUEcosystemAccessoryRemovalActionConfirmationTitle_Postfix"), 1);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "appendString:", v82);

  HFLogForCategory();
  v83 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v98 = v41;
    _os_log_impl(&dword_1B8E1E000, v83, OS_LOG_TYPE_DEFAULT, "resetAllActionConfirmationTitle, %@", buf, 0xCu);
  }

  _HULocalizedStringWithDefaultValue(CFSTR("HUEcosystemAccessoryRemovalActionForMultipleEcosystems"), CFSTR("HUEcosystemAccessoryRemovalActionForMultipleEcosystems"), 1);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMatterAccessoryRemovalHelper setResetAllActionTitle:](self, "setResetAllActionTitle:", v84);

  v85 = (void *)objc_msgSend(v41, "copy");
  -[HUMatterAccessoryRemovalHelper setResetAllActionConfirmationTitle:](self, "setResetAllActionConfirmationTitle:", v85);

  _HULocalizedStringWithDefaultValue(CFSTR("HUEcosystemAccessoryRemovalActionForMultipleEcosystems"), CFSTR("HUEcosystemAccessoryRemovalActionForMultipleEcosystems"), 1);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMatterAccessoryRemovalHelper setResetAllActionConfirmationButtonTitle:](self, "setResetAllActionConfirmationButtonTitle:", v86);

  _Block_object_dispose(&v91, 8);
}

void __93__HUMatterAccessoryRemovalHelper_matterAccessoryGenerateRemovalConfirmationForAccessoryName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "vendor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSystemCommissionerVendor");

  if (v5)
  {
    objc_msgSend(v3, "vendor");
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }
  else
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v3, "vendor");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeAddObject:", v10);

    v8 = v11;
  }

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)removalActionTitle
{
  return self->_removalActionTitle;
}

- (void)setRemovalActionTitle:(id)a3
{
  objc_storeStrong((id *)&self->_removalActionTitle, a3);
}

- (NSString)resetAllActionTitle
{
  return self->_resetAllActionTitle;
}

- (void)setResetAllActionTitle:(id)a3
{
  objc_storeStrong((id *)&self->_resetAllActionTitle, a3);
}

- (NSString)removalActionConfirmationTitle
{
  return self->_removalActionConfirmationTitle;
}

- (void)setRemovalActionConfirmationTitle:(id)a3
{
  objc_storeStrong((id *)&self->_removalActionConfirmationTitle, a3);
}

- (NSString)removalActionConfirmationButtonTitle
{
  return self->_removalActionConfirmationButtonTitle;
}

- (void)setRemovalActionConfirmationButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_removalActionConfirmationButtonTitle, a3);
}

- (NSString)resetAllActionConfirmationTitle
{
  return self->_resetAllActionConfirmationTitle;
}

- (void)setResetAllActionConfirmationTitle:(id)a3
{
  objc_storeStrong((id *)&self->_resetAllActionConfirmationTitle, a3);
}

- (NSString)resetAllActionConfirmationButtonTitle
{
  return self->_resetAllActionConfirmationButtonTitle;
}

- (void)setResetAllActionConfirmationButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_resetAllActionConfirmationButtonTitle, a3);
}

- (BOOL)shouldUseEcosystemRemovalConfirmation
{
  return self->_shouldUseEcosystemRemovalConfirmation;
}

- (HFServiceLikeItem)item
{
  return (HFServiceLikeItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (void)setItem:(id)a3
{
  objc_storeWeak((id *)&self->_item, a3);
}

- (NSArray)connectedEcosystems
{
  return self->_connectedEcosystems;
}

- (void)setConnectedEcosystems:(id)a3
{
  objc_storeStrong((id *)&self->_connectedEcosystems, a3);
}

- (NSArray)thirdPartyEcosystems
{
  return self->_thirdPartyEcosystems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thirdPartyEcosystems, 0);
  objc_storeStrong((id *)&self->_connectedEcosystems, 0);
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong((id *)&self->_resetAllActionConfirmationButtonTitle, 0);
  objc_storeStrong((id *)&self->_resetAllActionConfirmationTitle, 0);
  objc_storeStrong((id *)&self->_removalActionConfirmationButtonTitle, 0);
  objc_storeStrong((id *)&self->_removalActionConfirmationTitle, 0);
  objc_storeStrong((id *)&self->_resetAllActionTitle, 0);
  objc_storeStrong((id *)&self->_removalActionTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
