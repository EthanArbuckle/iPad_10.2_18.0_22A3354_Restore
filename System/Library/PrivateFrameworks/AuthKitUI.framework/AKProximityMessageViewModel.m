@implementation AKProximityMessageViewModel

- (AKProximityMessageViewModel)initWithType:(unint64_t)a3
{
  AKProximityMessageViewModel *v4;
  AKProximityMessageViewModel *v5;
  void *v6;
  uint64_t v7;
  NSString *titleText;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  NSString *v19;
  uint64_t v20;
  NSString *detailedText;
  void *v22;
  uint64_t v23;
  NSString *v24;
  void *v25;
  uint64_t v26;
  NSString *v27;
  uint64_t v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)AKProximityMessageViewModel;
  v4 = -[AKProximityMessageViewModel init](&v30, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    switch(a3)
    {
      case 0uLL:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PROXIMITY_AUTH_BROADCAST_TITLE"), &stru_1E7679C68, CFSTR("Localizable"));
        v7 = objc_claimAutoreleasedReturnValue();
        titleText = v5->_titleText;
        v5->_titleText = (NSString *)v7;

        v9 = (void *)MEMORY[0x1E0D001D8];
        v10 = CFSTR("PROXIMITY_AUTH_BROADCAST_DESCRIPTION");
        goto LABEL_9;
      case 1uLL:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("PROXIMITY_AUTH_VISUAL_PAIRING_TITLE"), &stru_1E7679C68, CFSTR("Localizable"));
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = v5->_titleText;
        v5->_titleText = (NSString *)v12;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v14 = (NSString *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v16 = CFSTR("PROXIMITY_AUTH_VISUAL_PAIRING_DESCRIPTION");
        goto LABEL_6;
      case 2uLL:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("PROXIMITY_AUTH_PIN_VIEW_TITLE"), &stru_1E7679C68, CFSTR("Localizable"));
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = v5->_titleText;
        v5->_titleText = (NSString *)v18;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v14 = (NSString *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v16 = CFSTR("PROXIMITY_AUTH_PIN_VIEW_DESCRIPTION");
LABEL_6:
        -[NSString localizedStringForKey:value:table:](v14, "localizedStringForKey:value:table:", v16, &stru_1E7679C68, CFSTR("Localizable"));
        v20 = objc_claimAutoreleasedReturnValue();
        detailedText = v5->_detailedText;
        v5->_detailedText = (NSString *)v20;

        goto LABEL_10;
      case 3uLL:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("PROXIMITY_AUTH_BROADCAST_TITLE"), &stru_1E7679C68, CFSTR("Localizable"));
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v5->_titleText;
        v5->_titleText = (NSString *)v23;

        v9 = (void *)MEMORY[0x1E0D001D8];
        v10 = CFSTR("PROXIMITY_AUTH_SETUP_IN_PROGRESS_DESCRIPTION");
        goto LABEL_9;
      case 4uLL:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("PROXIMITY_AUTH_ERROR_TITLE"), &stru_1E7679C68, CFSTR("Localizable"));
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = v5->_titleText;
        v5->_titleText = (NSString *)v26;

        v9 = (void *)MEMORY[0x1E0D001D8];
        v10 = CFSTR("PROXIMITY_AUTH_ERROR_DESCRIPTION");
LABEL_9:
        objc_msgSend(v9, "deviceSpecificLocalizedStringWithKey:", v10);
        v28 = objc_claimAutoreleasedReturnValue();
        v15 = v5->_detailedText;
        v5->_detailedText = (NSString *)v28;
LABEL_10:

        break;
      default:
        return v5;
    }
  }
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)detailedText
{
  return self->_detailedText;
}

- (void)setDetailedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)primaryButtonTitle
{
  return self->_primaryButtonTitle;
}

- (void)setPrimaryButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)secondaryButtonTitle
{
  return self->_secondaryButtonTitle;
}

- (void)setSecondaryButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryButtonTitle, 0);
  objc_storeStrong((id *)&self->_primaryButtonTitle, 0);
  objc_storeStrong((id *)&self->_detailedText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end
