@implementation MOShieldConfiguration

- (MOShieldConfiguration)initWithBackgroundColorData:(id)a3 backgroundEffectData:(id)a4 iconData:(id)a5 title:(id)a6 subtitle:(id)a7 primaryButtonLabel:(id)a8 primaryButtonColorData:(id)a9 secondaryButtonLabel:(id)a10
{
  MOShieldLabel *v16;
  MOShieldLabel *v17;
  MOShieldLabel *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  MOShieldConfiguration *v23;
  uint64_t v24;
  NSData *backgroundColorData;
  uint64_t v26;
  NSData *backgroundEffectData;
  uint64_t v28;
  NSData *iconData;
  MOShieldLabel *title;
  MOShieldLabel *v31;
  MOShieldLabel *subtitle;
  MOShieldLabel *v33;
  MOShieldLabel *primaryButtonLabel;
  MOShieldLabel *v35;
  uint64_t v36;
  NSData *primaryButtonColorData;
  MOShieldLabel *secondaryButtonLabel;
  MOShieldLabel *v40;
  objc_super v41;

  v16 = (MOShieldLabel *)a6;
  v17 = (MOShieldLabel *)a7;
  v18 = (MOShieldLabel *)a8;
  v40 = (MOShieldLabel *)a10;
  v41.receiver = self;
  v41.super_class = (Class)MOShieldConfiguration;
  v19 = a9;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = -[MOShieldConfiguration init](&v41, sel_init);
  v24 = objc_msgSend(v22, "copy");

  backgroundColorData = v23->_backgroundColorData;
  v23->_backgroundColorData = (NSData *)v24;

  v26 = objc_msgSend(v21, "copy");
  backgroundEffectData = v23->_backgroundEffectData;
  v23->_backgroundEffectData = (NSData *)v26;

  v28 = objc_msgSend(v20, "copy");
  iconData = v23->_iconData;
  v23->_iconData = (NSData *)v28;

  title = v23->_title;
  v23->_title = v16;
  v31 = v16;

  subtitle = v23->_subtitle;
  v23->_subtitle = v17;
  v33 = v17;

  primaryButtonLabel = v23->_primaryButtonLabel;
  v23->_primaryButtonLabel = v18;
  v35 = v18;

  v36 = objc_msgSend(v19, "copy");
  primaryButtonColorData = v23->_primaryButtonColorData;
  v23->_primaryButtonColorData = (NSData *)v36;

  secondaryButtonLabel = v23->_secondaryButtonLabel;
  v23->_secondaryButtonLabel = v40;

  return v23;
}

- (MOShieldConfiguration)initWithCoder:(id)a3
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
  MOShieldConfiguration *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BackgroundColorData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BackgroundEffectData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IconData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Subtitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrimaryButtonLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrimaryButtonColorData"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SecondaryButtonLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[MOShieldConfiguration initWithBackgroundColorData:backgroundEffectData:iconData:title:subtitle:primaryButtonLabel:primaryButtonColorData:secondaryButtonLabel:](self, "initWithBackgroundColorData:backgroundEffectData:iconData:title:subtitle:primaryButtonLabel:primaryButtonColorData:secondaryButtonLabel:", v5, v6, v7, v8, v9, v10, v11, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *backgroundColorData;
  id v5;

  backgroundColorData = self->_backgroundColorData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", backgroundColorData, CFSTR("BackgroundColorData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backgroundEffectData, CFSTR("BackgroundEffectData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconData, CFSTR("IconData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("Title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("Subtitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryButtonLabel, CFSTR("PrimaryButtonLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryButtonColorData, CFSTR("PrimaryButtonColorData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondaryButtonLabel, CFSTR("SecondaryButtonLabel"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)backgroundColorData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)backgroundEffectData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)iconData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (MOShieldLabel)title
{
  return (MOShieldLabel *)objc_getProperty(self, a2, 32, 1);
}

- (MOShieldLabel)subtitle
{
  return (MOShieldLabel *)objc_getProperty(self, a2, 40, 1);
}

- (MOShieldLabel)primaryButtonLabel
{
  return (MOShieldLabel *)objc_getProperty(self, a2, 48, 1);
}

- (NSData)primaryButtonColorData
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (MOShieldLabel)secondaryButtonLabel
{
  return (MOShieldLabel *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryButtonLabel, 0);
  objc_storeStrong((id *)&self->_primaryButtonColorData, 0);
  objc_storeStrong((id *)&self->_primaryButtonLabel, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_backgroundEffectData, 0);
  objc_storeStrong((id *)&self->_backgroundColorData, 0);
}

@end
