@implementation HKCDADocumentSample(HKDataMetadataDetailSection)

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
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v4 = a3;
  objc_msgSend(a1, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CLINICAL_DOCUMENT_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEA8F8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addText:detail:baseIdentifier:", v7, v9, v10);

    objc_msgSend(v6, "patientName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CLINICAL_DOCUMENT_PATIENT_NAME"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEA910);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addText:detail:baseIdentifier:", v11, v13, v14);

    objc_msgSend(v6, "authorName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CLINICAL_DOCUMENT_AUTHOR_NAME"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEA928);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addText:detail:baseIdentifier:", v15, v17, v18);

    objc_msgSend(v6, "custodianName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("CLINICAL_DOCUMENT_CUSTODIAN_NAME"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(&unk_1E9CEA940);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addText:detail:baseIdentifier:", v19, v21, v22);

  }
  v23.receiver = a1;
  v23.super_class = (Class)&off_1F0222F88;
  objc_msgSendSuper2(&v23, sel_addDetailValuesToSection_, v4);

}

@end
