@implementation HKCorrelation(HKDataMetadataDetailSection)

- (void)addDetailValuesToSection:()HKDataMetadataDetailSection
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v4 = a3;
  objc_msgSend(a1, "sampleType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "code");

  if (v6 == 80)
    objc_msgSend(a1, "_hk_bloodPressureDetailRowsWithSection:", v4);
  v7.receiver = a1;
  v7.super_class = (Class)&off_1F0228830;
  objc_msgSendSuper2(&v7, sel_addDetailValuesToSection_, v4);

}

- (void)_hk_bloodPressureDetailRowsWithSection:()HKDataMetadataDetailSection
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0CB6978];
  v5 = *MEMORY[0x1E0CB5AA8];
  v6 = a3;
  objc_msgSend(v4, "quantityTypeForIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SYSTOLIC"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_hk_bloodPressureDetailRowForSampleType:title:section:", v7, v9, v6);

  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AA0]);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DIASTOLIC"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_hk_bloodPressureDetailRowForSampleType:title:section:", v12, v11, v6);

}

- (void)_hk_bloodPressureDetailRowForSampleType:()HKDataMetadataDetailSection title:section:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a4;
  v8 = a5;
  objc_msgSend(a1, "objectsForType:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "displayTypeController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayTypeWithIdentifier:", &unk_1E9CED340);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "unitController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unitForDisplayType:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "quantity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValueForUnit:", v14);
    v17 = v16;

    objc_msgSend(v12, "presentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "adjustedValueForDaemonValue:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "unitController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    HKFormattedStringFromValueForContext(v20, v12, v21, 0, 0, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "unitController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedDisplayNameForDisplayType:value:nameContext:", v12, 0, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    HKFormatValueAndUnit(v22, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEA8E0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addText:detail:baseIdentifier:", v25, v27, v26);

  }
}

@end
