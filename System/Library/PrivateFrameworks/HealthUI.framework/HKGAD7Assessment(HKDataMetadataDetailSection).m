@implementation HKGAD7Assessment(HKDataMetadataDetailSection)

- (void)addDetailValuesToSection:()HKDataMetadataDetailSection
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  objc_super v33;

  v4 = a3;
  HKUILocalizedStringForGAD7Risk(objc_msgSend(a1, "risk"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("GAD7_RISK_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Chamomile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEAA18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addText:detail:baseIdentifier:", v5, v7, v8);

  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%ld"), objc_msgSend(a1, "score"));
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("GAD7_SCORE_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Chamomile"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEAA30);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v9;
  v32 = v4;
  objc_msgSend(v4, "addText:detail:baseIdentifier:", v9, v11, v12);

  objc_msgSend(a1, "answers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    v15 = 0;
    do
    {
      objc_msgSend(a1, "answers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "integerValue");

      HKUILocalizedStringForGAD7Answer(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("ASSESSMENT_POINT_DETAILS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Chamomile"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringWithFormat:", v22, v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%@ %@"), v19, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GAD7_QUESTION_%i"), ++v15);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", v25, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Chamomile"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEAA48);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addText:detail:baseIdentifier:", v24, v27, v28);

      objc_msgSend(a1, "answers");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "count");

    }
    while (v30 > v15);
  }
  v33.receiver = a1;
  v33.super_class = (Class)&off_1F0233818;
  objc_msgSendSuper2(&v33, sel_addDetailValuesToSection_, v32);

}

@end
