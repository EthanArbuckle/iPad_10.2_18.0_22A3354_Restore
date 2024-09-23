@implementation SFSafariViewControllerActivityButton

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = (void *)-[UIImage copy](self->_templateImage, "copy");
  v6 = (void *)-[NSString copy](self->_extensionIdentifier, "copy");
  v7 = (void *)objc_msgSend(v4, "initWithTemplateImage:extensionIdentifier:", v5, v6);

  -[SFSafariViewControllerActivityButton accessibilityLabel](self, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v7, "setAccessibilityLabel:", v9);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSafariViewControllerActivityButton)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SFSafariViewControllerActivityButton *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("templateImage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessibilityLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SFSafariViewControllerActivityButton initWithTemplateImage:extensionIdentifier:](self, "initWithTemplateImage:extensionIdentifier:", v5, v7);
  -[SFSafariViewControllerActivityButton setAccessibilityLabel:](v8, "setAccessibilityLabel:", v6);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  UIImage *templateImage;
  void *v5;
  id v6;

  templateImage = self->_templateImage;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", templateImage, CFSTR("templateImage"));
  -[SFSafariViewControllerActivityButton accessibilityLabel](self, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("accessibilityLabel"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_extensionIdentifier, CFSTR("extensionIdentifier"));
}

- (SFSafariViewControllerActivityButton)initWithTemplateImage:(UIImage *)templateImage extensionIdentifier:(NSString *)extensionIdentifier
{
  UIImage *v6;
  NSString *v7;
  SFSafariViewControllerActivityButton *v8;
  uint64_t v9;
  UIImage *v10;
  uint64_t v11;
  NSString *v12;
  SFSafariViewControllerActivityButton *v13;
  objc_super v15;

  v6 = templateImage;
  v7 = extensionIdentifier;
  v15.receiver = self;
  v15.super_class = (Class)SFSafariViewControllerActivityButton;
  v8 = -[SFSafariViewControllerActivityButton init](&v15, sel_init);
  if (v8)
  {
    v9 = -[UIImage copy](v6, "copy");
    v10 = v8->_templateImage;
    v8->_templateImage = (UIImage *)v9;

    v11 = -[NSString copy](v7, "copy");
    v12 = v8->_extensionIdentifier;
    v8->_extensionIdentifier = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (BOOL)_fieldsAreValid
{
  UIImage *templateImage;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  _BOOL4 v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;

  if (!self->_extensionIdentifier)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXExtensions();
    v7 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (!v7)
      return v7;
    -[SFSafariViewControllerActivityButton _fieldsAreValid].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
LABEL_12:
    LOBYTE(v7) = 0;
    return v7;
  }
  templateImage = self->_templateImage;
  if (!templateImage)
  {
    v16 = WBS_LOG_CHANNEL_PREFIXExtensions();
    v7 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (!v7)
      return v7;
    -[SFSafariViewControllerActivityButton _fieldsAreValid].cold.2(v16, v17, v18, v19, v20, v21, v22, v23);
    goto LABEL_12;
  }
  -[UIImage size](templateImage, "size");
  v4 = v3;
  v6 = v5;
  if (v5 == 0.0 || v3 == 0.0)
  {
    v24 = WBS_LOG_CHANNEL_PREFIXExtensions();
    v7 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (!v7)
      return v7;
    -[SFSafariViewControllerActivityButton _fieldsAreValid].cold.3(v24, v4, v6);
    goto LABEL_12;
  }
  LOBYTE(v7) = 1;
  return v7;
}

- (UIImage)templateImage
{
  return self->_templateImage;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_templateImage, 0);
}

- (void)_fieldsAreValid
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  CGSize v10;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v10.width = a2;
  v10.height = a3;
  NSStringFromCGSize(v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543362;
  v8 = v6;
  _os_log_error_impl(&dword_1A3B2D000, v5, OS_LOG_TYPE_ERROR, "Not showing activity button because templateImage has an invalid size: %{public}@", (uint8_t *)&v7, 0xCu);

}

@end
