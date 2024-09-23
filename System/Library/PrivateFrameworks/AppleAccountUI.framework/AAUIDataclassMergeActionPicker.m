@implementation AAUIDataclassMergeActionPicker

- (id)title
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (self->_isPerformingBatchMerge)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("BATCH_MERGE_TITLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", v4, CFSTR("iCloud"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CF4F10];
    -[ACUIDataclassActionPicker affectedDataclasses](self, "affectedDataclasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedTitleForDataclass:", v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MERGE_DATA_TO_SERVER_TITLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v10, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)message
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;

  v3 = (void *)MEMORY[0x1E0CF4F10];
  -[ACUIDataclassActionPicker affectedDataclasses](self, "affectedDataclasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedTextForDataclasses:usedAtBeginningOfSentence:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_isPerformingBatchMerge)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3708], "modelSpecificLocalizedStringKeyForKey:", CFSTR("BATCH_MERGE_FORMAT"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_1EA2E2A18, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v8, v5, CFSTR("iCloud"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  v10 = (void *)MEMORY[0x1E0CF4F10];
  -[ACUIDataclassActionPicker affectedDataclasses](self, "affectedDataclasses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedReferenceToLocalSourceOfDataclass:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("MERGE_DATA_TO_SERVER"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v15, v5, CFSTR("iCloud"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_isTetheredSyncingEnabled && !self->_isAnotherAccountSyncingDataclass)
  {
    if (-[NSString isEqualToString:](self->_tetheredSyncingSource, "isEqualToString:", CFSTR("OSX")))
    {
      v22 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v23;
      v24 = CFSTR("MERGE_TETHERED_DATA_TO_SERVER_MAC");
    }
    else
    {
      if (!-[NSString isEqualToString:](self->_tetheredSyncingSource, "isEqualToString:", CFSTR("Windows")))
        goto LABEL_16;
      v22 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v23;
      v24 = CFSTR("MERGE_TETHERED_DATA_TO_SERVER_PC");
    }
    objc_msgSend(v23, "localizedStringForKey:value:table:", v24, &stru_1EA2E2A18, CFSTR("Localizable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", v18, v5, CFSTR("iCloud"));
    goto LABEL_14;
  }
  if (!self->_isDataclassSyncingUsingExchangeOnly)
  {
    if (!self->_isAnotherAccountSyncingDataclass)
      goto LABEL_16;
    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("MERGE_DATA_TO_SERVER_OTHER_OTA_ENABLED"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", v18, v5, CFSTR("iCloud"));
LABEL_14:
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "modelSpecificLocalizedStringKeyForKey:", CFSTR("MERGE_DATA_TO_SERVER_EAS_PRESENT"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", v18, &stru_1EA2E2A18, CFSTR("Localizable"));
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", v19, v5, CFSTR("iCloud"));
  v20 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)v19;
LABEL_15:

  v9 = (void *)v20;
LABEL_16:
  if (self->_localStoreHasReadOnlyCalendars)
  {
    v25 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("READ_ONLY_CALENDARS_WILL_BE_DELETED"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", v27, v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("%@ %@"), v9, v28);
    v29 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v29;
  }
LABEL_18:

  return v9;
}

- (id)descriptionForDataclassAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v5 = v4;
  if (!self->_isPerformingBatchMerge)
    goto LABEL_7;
  if (objc_msgSend(v4, "type") == 5)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("BATCH_MERGE_OK_BUTTON");
  }
  else
  {
    if (objc_msgSend(v5, "type"))
    {
LABEL_7:
      v11.receiver = self;
      v11.super_class = (Class)AAUIDataclassMergeActionPicker;
      -[ACUIDataclassActionPicker descriptionForDataclassAction:](&v11, sel_descriptionForDataclassAction_, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("BATCH_MERGE_CANCEL_BUTTON");
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1EA2E2A18, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_7;
LABEL_8:

  return v9;
}

- (BOOL)isPerformingBatchMerge
{
  return self->_isPerformingBatchMerge;
}

- (void)setPerformingBatchMerge:(BOOL)a3
{
  self->_isPerformingBatchMerge = a3;
}

- (BOOL)isTetheredSyncingEnabled
{
  return self->_isTetheredSyncingEnabled;
}

- (void)setTetheredSyncingEnabled:(BOOL)a3
{
  self->_isTetheredSyncingEnabled = a3;
}

- (BOOL)isAnotherAccountSyncingDataclass
{
  return self->_isAnotherAccountSyncingDataclass;
}

- (void)setAnotherAccountIsSyncingDataclass:(BOOL)a3
{
  self->_isAnotherAccountSyncingDataclass = a3;
}

- (BOOL)isDataclassSyncingUsingExchangeOnly
{
  return self->_isDataclassSyncingUsingExchangeOnly;
}

- (void)setDataclassIsSyncingUsingExchangeOnly:(BOOL)a3
{
  self->_isDataclassSyncingUsingExchangeOnly = a3;
}

- (BOOL)localStoreHasReadOnlyCalendars
{
  return self->_localStoreHasReadOnlyCalendars;
}

- (void)setLocalStoreHasReadOnlyCalendars:(BOOL)a3
{
  self->_localStoreHasReadOnlyCalendars = a3;
}

- (NSString)tetheredSyncingSource
{
  return self->_tetheredSyncingSource;
}

- (void)setTetheredSyncingSource:(id)a3
{
  self->_tetheredSyncingSource = (NSString *)a3;
}

@end
