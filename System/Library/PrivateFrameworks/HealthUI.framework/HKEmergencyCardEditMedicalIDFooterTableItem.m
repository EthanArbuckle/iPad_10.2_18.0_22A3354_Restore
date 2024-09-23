@implementation HKEmergencyCardEditMedicalIDFooterTableItem

- (void)setProfileFirstName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MEDICAL_ID_EDIT_%@%@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MEDICAL_ID_EDIT_APPLE_WATCH_APP"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v7, v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "rangeOfString:", v9);
  v13 = v12;
  v14 = objc_alloc(MEMORY[0x1E0CB3778]);
  v20[0] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v20[1] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v14, "initWithString:attributes:", v10, v17);

  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", CFSTR("bridge:root=ActiveWatch"));
    objc_msgSend(v18, "addAttribute:value:range:", *MEMORY[0x1E0DC1160], v19, v11, v13);

  }
  -[HKEmergencyCardFooterTableItem setAttributedTitleForFooter:](self, "setAttributedTitleForFooter:", v18);
  -[HKEmergencyCardFooterTableItem setShouldInteractWithURLBlock:](self, "setShouldInteractWithURLBlock:", &__block_literal_global_7);

}

uint64_t __67__HKEmergencyCardEditMedicalIDFooterTableItem_setProfileFirstName___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CA5878];
  v3 = a2;
  objc_msgSend(v2, "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, MEMORY[0x1E0C9AA70]);

  return 0;
}

@end
