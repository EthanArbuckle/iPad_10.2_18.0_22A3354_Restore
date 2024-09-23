@implementation AATrustedContactsInheritanceSplashScreenModel

- (id)bullets
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__AATrustedContactsInheritanceSplashScreenModel_bullets__block_invoke;
  block[3] = &unk_1E416E3A8;
  block[4] = self;
  if (bullets_onceToken != -1)
    dispatch_once(&bullets_onceToken, block);
  return (id)bullets_bullets;
}

void __56__AATrustedContactsInheritanceSplashScreenModel_bullets__block_invoke(uint64_t a1)
{
  AAOBBulletPointModel *v2;
  void *v3;
  AAOBBulletPointModel *v4;
  AAOBBulletPointModel *v5;
  void *v6;
  void *v7;
  void *v8;
  AAOBBulletPointModel *v9;
  AAOBBulletPointModel *v10;
  void *v11;
  void *v12;
  void *v13;
  AAOBBulletPointModel *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v2 = [AAOBBulletPointModel alloc];
  objc_msgSend(*(id *)(a1 + 32), "_firstBulletPointSymbolName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_firstBulletPointTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_firstBulletPointDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AAOBBulletPointModel initWithSymbolNamed:title:description:](v2, "initWithSymbolNamed:title:description:", v18, v17, v3);
  v19[0] = v4;
  v5 = [AAOBBulletPointModel alloc];
  objc_msgSend(*(id *)(a1 + 32), "_secondBulletPointSymbolName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_secondBulletPointTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_secondBulletPointDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AAOBBulletPointModel initWithSymbolNamed:title:description:](v5, "initWithSymbolNamed:title:description:", v6, v7, v8);
  v19[1] = v9;
  v10 = [AAOBBulletPointModel alloc];
  objc_msgSend(*(id *)(a1 + 32), "_thirdBulletPointSymbolName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_thirdBulletPointTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_thirdBulletPointDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[AAOBBulletPointModel initWithSymbolNamed:title:description:](v10, "initWithSymbolNamed:title:description:", v11, v12, v13);
  v19[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)bullets_bullets;
  bullets_bullets = v15;

}

- (NSString)secondaryButton
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_SPLASH_SCREEN_CANCEL_TITLE"), 0, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)primaryButton
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_SPLASH_SCREEN_CONTINUE_TITLE"), 0, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)title
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_SPLASH_SCREEN_TITLE"), 0, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)imageName
{
  return 0;
}

- (id)_firstBulletPointDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_SPLASH_SCREEN_FIRST_BULLET_DESCRIPTION"), 0, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_firstBulletPointSymbolName
{
  return CFSTR("person.2.fill");
}

- (id)_firstBulletPointTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_SPLASH_SCREEN_FIRST_BULLET_TITLE"), 0, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_secondBulletPointDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_SPLASH_SCREEN_SECOND_BULLET_DESCRIPTION"), 0, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_secondBulletPointSymbolName
{
  return CFSTR("key.fill");
}

- (id)_secondBulletPointTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_SPLASH_SCREEN_SECOND_BULLET_TITLE"), 0, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_thirdBulletPointDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_SPLASH_SCREEN_THIRD_BULLET_DESCRIPTION"), 0, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_thirdBulletPointSymbolName
{
  return CFSTR("doc.fill");
}

- (id)_thirdBulletPointTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_SPLASH_SCREEN_THIRD_BULLET_TITLE"), 0, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)helpLinkTitle
{
  return self->_helpLinkTitle;
}

- (void)setHelpLinkTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)helpLinkURL
{
  return self->_helpLinkURL;
}

- (void)setHelpLinkURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isWalrusEnabled
{
  return self->_isWalrusEnabled;
}

- (void)setIsWalrusEnabled:(BOOL)a3
{
  self->_isWalrusEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helpLinkURL, 0);
  objc_storeStrong((id *)&self->_helpLinkTitle, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
}

@end
