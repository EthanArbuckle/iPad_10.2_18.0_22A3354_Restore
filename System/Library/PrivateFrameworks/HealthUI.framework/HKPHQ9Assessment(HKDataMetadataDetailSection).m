@implementation HKPHQ9Assessment(HKDataMetadataDetailSection)

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
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  objc_super v34;

  v4 = a3;
  HKUILocalizedStringForPHQ9Risk(objc_msgSend(a1, "risk"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PHQ9_RISK_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Chamomile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEAA60);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addText:detail:baseIdentifier:", v5, v7, v8);

  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%ld"), objc_msgSend(a1, "score"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("PHQ9_SCORE_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Chamomile"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEAA78);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v4;
  objc_msgSend(v4, "addText:detail:baseIdentifier:", v9, v11, v12);

  objc_msgSend(a1, "answers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    v15 = 0;
    v32 = a1;
    do
    {
      objc_msgSend(a1, "answers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "integerValue");

      HKUILocalizedStringForPHQ9Answer(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18 == 4)
      {
        v20 = 0x1E0CB3000;
      }
      else
      {
        v21 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("ASSESSMENT_POINT_DETAILS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Chamomile"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "localizedStringWithFormat:", v23, v18);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%@ %@"), v19, v24);
        v25 = objc_claimAutoreleasedReturnValue();

        v20 = 0x1E0CB3000uLL;
        a1 = v32;
        v19 = (void *)v25;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PHQ9_QUESTION_%i"), ++v15);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v20 + 1232), "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", v26, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Chamomile"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEAA90);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addText:detail:baseIdentifier:", v19, v28, v29);

      objc_msgSend(a1, "answers");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "count");

    }
    while (v31 > v15);
  }
  v34.receiver = a1;
  v34.super_class = (Class)&off_1F0233978;
  objc_msgSendSuper2(&v34, sel_addDetailValuesToSection_, v33);

}

@end
