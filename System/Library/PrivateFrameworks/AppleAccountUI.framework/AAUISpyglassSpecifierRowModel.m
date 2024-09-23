@implementation AAUISpyglassSpecifierRowModel

- (id)initForSpecifierType:(int64_t)a3
{
  AAUISpyglassSpecifierRowModel *v4;
  void *v5;
  uint64_t v6;
  NSString *title;
  NSString *iconName;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  NSString *v12;
  void *v13;
  uint64_t v14;
  NSString *v15;
  void *v16;
  uint64_t v17;
  NSString *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)AAUISpyglassSpecifierRowModel;
  v4 = -[AAUISpyglassSpecifierRowModel init](&v20, sel_init);
  if (v4)
  {
    switch(a3)
    {
      case 1:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SPYGLASS_SPECIFIER_PERSONAL_INFORMATION"), &stru_1EA2E2A18, CFSTR("Localizable"));
        v6 = objc_claimAutoreleasedReturnValue();
        title = v4->_title;
        v4->_title = (NSString *)v6;

        iconName = v4->_iconName;
        v9 = CFSTR("person.text.rectangle.fill");
        goto LABEL_7;
      case 2:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SPYGLASS_SPECIFIER_SIGNIN_AND_SECURITY"), &stru_1EA2E2A18, CFSTR("Localizable"));
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v4->_title;
        v4->_title = (NSString *)v11;

        iconName = v4->_iconName;
        v9 = CFSTR("custom.key.fill.shield.fill");
        goto LABEL_7;
      case 3:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SPYGLASS_SPECIFIER_PAYMENT_AND_SHIPPING"), &stru_1EA2E2A18, CFSTR("Localizable"));
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v4->_title;
        v4->_title = (NSString *)v14;

        iconName = v4->_iconName;
        v9 = CFSTR("creditcard.fill");
        goto LABEL_7;
      case 4:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SPYGLASS_SPECIFIER_SUBSCRIPTIONS"), &stru_1EA2E2A18, CFSTR("Localizable"));
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v4->_title;
        v4->_title = (NSString *)v17;

        iconName = v4->_iconName;
        v9 = CFSTR("goforward.plus");
LABEL_7:
        v4->_iconName = &v9->isa;

        break;
      default:
        return v4;
    }
  }
  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)iconName
{
  return self->_iconName;
}

- (void)setIconName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
