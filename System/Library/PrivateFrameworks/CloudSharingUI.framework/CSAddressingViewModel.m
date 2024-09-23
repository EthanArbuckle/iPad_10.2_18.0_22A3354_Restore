@implementation CSAddressingViewModel

- (CSAddressingViewModel)initWithHeaderImageData:(id)a3 headerTitle:(id)a4 loadingText:(id)a5 supplementaryText:(id)a6 userInfoText:(id)a7 primaryButtonText:(id)a8 secondaryButtonText:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  CSAddressingViewModel *v22;
  CSAddressingViewModel *v23;
  objc_super v25;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v25.receiver = self;
  v25.super_class = (Class)CSAddressingViewModel;
  v22 = -[CSAddressingViewModel init](&v25, sel_init);
  v23 = v22;
  if (v22)
  {
    -[CSAddressingViewModel setHeaderImageData:](v22, "setHeaderImageData:", v15);
    -[CSAddressingViewModel setHeaderTitle:](v23, "setHeaderTitle:", v16);
    -[CSAddressingViewModel setLoadingText:](v23, "setLoadingText:", v17);
    -[CSAddressingViewModel setSupplementaryText:](v23, "setSupplementaryText:", v18);
    -[CSAddressingViewModel setUserInfoText:](v23, "setUserInfoText:", v19);
    -[CSAddressingViewModel setPrimaryButtonText:](v23, "setPrimaryButtonText:", v20);
    -[CSAddressingViewModel setSecondaryButtonText:](v23, "setSecondaryButtonText:", v21);
  }

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *headerImageData;
  id v5;

  headerImageData = self->_headerImageData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", headerImageData, CFSTR("headerImageData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_headerTitle, CFSTR("headerTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_loadingText, CFSTR("loadingText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supplementaryText, CFSTR("supplementaryText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInfoText, CFSTR("userInfoText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryButtonText, CFSTR("primaryButtonText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondaryButtonText, CFSTR("secondaryButtonText"));

}

- (CSAddressingViewModel)initWithCoder:(id)a3
{
  id v4;
  CSAddressingViewModel *v5;
  uint64_t v6;
  NSData *headerImageData;
  uint64_t v8;
  NSString *headerTitle;
  uint64_t v10;
  NSString *loadingText;
  uint64_t v12;
  NSString *supplementaryText;
  uint64_t v14;
  NSString *userInfoText;
  uint64_t v16;
  NSString *primaryButtonText;
  uint64_t v18;
  NSString *secondaryButtonText;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CSAddressingViewModel;
  v5 = -[CSAddressingViewModel init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("headerImageData"));
    v6 = objc_claimAutoreleasedReturnValue();
    headerImageData = v5->_headerImageData;
    v5->_headerImageData = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("headerTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    headerTitle = v5->_headerTitle;
    v5->_headerTitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("loadingText"));
    v10 = objc_claimAutoreleasedReturnValue();
    loadingText = v5->_loadingText;
    v5->_loadingText = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supplementaryText"));
    v12 = objc_claimAutoreleasedReturnValue();
    supplementaryText = v5->_supplementaryText;
    v5->_supplementaryText = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userInfoText"));
    v14 = objc_claimAutoreleasedReturnValue();
    userInfoText = v5->_userInfoText;
    v5->_userInfoText = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryButtonText"));
    v16 = objc_claimAutoreleasedReturnValue();
    primaryButtonText = v5->_primaryButtonText;
    v5->_primaryButtonText = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryButtonText"));
    v18 = objc_claimAutoreleasedReturnValue();
    secondaryButtonText = v5->_secondaryButtonText;
    v5->_secondaryButtonText = (NSString *)v18;

  }
  return v5;
}

- (NSData)headerImageData
{
  return self->_headerImageData;
}

- (void)setHeaderImageData:(id)a3
{
  objc_storeStrong((id *)&self->_headerImageData, a3);
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
  objc_storeStrong((id *)&self->_headerTitle, a3);
}

- (NSString)loadingText
{
  return self->_loadingText;
}

- (void)setLoadingText:(id)a3
{
  objc_storeStrong((id *)&self->_loadingText, a3);
}

- (NSString)supplementaryText
{
  return self->_supplementaryText;
}

- (void)setSupplementaryText:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryText, a3);
}

- (NSString)userInfoText
{
  return self->_userInfoText;
}

- (void)setUserInfoText:(id)a3
{
  objc_storeStrong((id *)&self->_userInfoText, a3);
}

- (NSString)primaryButtonText
{
  return self->_primaryButtonText;
}

- (void)setPrimaryButtonText:(id)a3
{
  objc_storeStrong((id *)&self->_primaryButtonText, a3);
}

- (NSString)secondaryButtonText
{
  return self->_secondaryButtonText;
}

- (void)setSecondaryButtonText:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryButtonText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryButtonText, 0);
  objc_storeStrong((id *)&self->_primaryButtonText, 0);
  objc_storeStrong((id *)&self->_userInfoText, 0);
  objc_storeStrong((id *)&self->_supplementaryText, 0);
  objc_storeStrong((id *)&self->_loadingText, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_headerImageData, 0);
}

@end
