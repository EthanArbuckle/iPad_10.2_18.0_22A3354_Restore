@implementation HKStateOfMind(HKDataMetadataDetailSection)

- (void)addDetailValuesToSection:()HKDataMetadataDetailSection
{
  id v4;
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
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;

  v4 = a3;
  objc_msgSend(v4, "displayTypeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sampleType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayTypeForObjectType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HKUILocalizedStringForStateOfMind(a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localization");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEA9A0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addText:detail:baseIdentifier:", v8, v10, v11);

  objc_msgSend(MEMORY[0x1E0CB37F0], "hk_percentDecimalNumberFormatter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "valence");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFromNumber:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("STATE_OF_MIND_VALENCE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Chamomile"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEA9B8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addText:detail:baseIdentifier:", v15, v17, v18);

  objc_msgSend(a1, "domains");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    objc_msgSend(a1, "domains");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hk_map:", &__block_literal_global_637);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("STATE_OF_MIND_DOMAINS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Chamomile"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEA9D0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addText:detail:baseIdentifier:", v23, v25, v26);

  }
  objc_msgSend(a1, "labels");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count");

  if (v28)
  {
    objc_msgSend(a1, "labels");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "hk_map:", &__block_literal_global_645);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("STATE_OF_MIND_DESCRIPTIONS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Chamomile"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEA9E8);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addText:detail:baseIdentifier:", v31, v33, v34);

  }
  objc_msgSend(a1, "context");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(a1, "context");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("STATE_OF_MIND_CONTEXT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Chamomile"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEAA00);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addText:detail:baseIdentifier:", v36, v38, v39);

  }
  v40.receiver = a1;
  v40.super_class = (Class)&off_1F0233378;
  objc_msgSendSuper2(&v40, sel_addDetailValuesToSection_, v4);

}

@end
