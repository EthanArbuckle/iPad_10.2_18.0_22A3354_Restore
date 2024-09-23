@implementation BNTemplateItemProvider

- (BNTemplateItemProvider)initWithItem:(id)a3
{
  id v6;
  uint64_t v7;
  void *v8;
  BNTemplateItemProvider *v9;
  BNTemplateItemProvider *v10;
  objc_super v12;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = 1;
LABEL_13:
    v8 = v6;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = 2;
    goto LABEL_13;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v6, "isImageProvider") & 1) != 0)
  {
    v7 = 3;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = 4;
    goto LABEL_13;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v6, "isCAPackageProvider") & 1) != 0)
  {
    v7 = 5;
    goto LABEL_13;
  }

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNTemplateItemProvider.m"), 62, CFSTR("Invalid item: %@"), v6);
  v7 = 0;
LABEL_14:

  v12.receiver = self;
  v12.super_class = (Class)BNTemplateItemProvider;
  v9 = -[BNTemplateItemProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_templateItem, a3);
    v10->_templateItemType = v7;
  }

  return v10;
}

- (NSString)templateItemText
{
  if (self->_templateItemType == 1)
    return (NSString *)self->_templateItem;
  else
    return (NSString *)0;
}

- (NSAttributedString)templateItemAttributedText
{
  if (self->_templateItemType == 2)
    return (NSAttributedString *)self->_templateItem;
  else
    return (NSAttributedString *)0;
}

- (BNImageProviding)templateItemImageProvider
{
  if (self->_templateItemType == 3)
    return (BNImageProviding *)self->_templateItem;
  else
    return (BNImageProviding *)0;
}

- (UIButtonConfiguration)templateItemButtonConfiguration
{
  if (self->_templateItemType == 4)
    return (UIButtonConfiguration *)self->_templateItem;
  else
    return (UIButtonConfiguration *)0;
}

- (BNCAPackageProviding)templateItemCAPackageProvider
{
  if (self->_templateItemType == 5)
    return (BNCAPackageProviding *)self->_templateItem;
  else
    return (BNCAPackageProviding *)0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v4;
  NSUInteger v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", self->_templateItemType, CFSTR("itemType"));
  v4 = self->_templateItemType - 1;
  if (v4 <= 3)
    objc_msgSend(v7, "encodeObject:forKey:", self->_templateItem, off_1E7044640[v4]);
  if (self->_visualStyleCategory >= 1 && self->_visualStyle >= 1)
  {
    objc_msgSend(v7, "encodeInteger:forKey:");
    objc_msgSend(v7, "encodeInteger:forKey:", self->_visualStyle, CFSTR("visualStyle"));
  }
  if (self->_hidden)
    objc_msgSend(v7, "encodeBool:forKey:", 1, CFSTR("hidden"));
  v5 = -[NSString length](self->_accessibilityIdentifier, "length");
  v6 = v7;
  if (v5)
  {
    objc_msgSend(v7, "encodeObject:forKey:", self->_accessibilityIdentifier, CFSTR("accessibilityIdentifier"));
    v6 = v7;
  }

}

- (BNTemplateItemProvider)initWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  BNTemplateItemProvider *v7;
  uint64_t v8;
  NSString *accessibilityIdentifier;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("itemType")) - 1;
  if (v5 > 3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), off_1E7044680[v5]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = -[BNTemplateItemProvider initWithItem:](self, "initWithItem:", v6);
  if (v7)
  {
    v7->_visualStyleCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("visualStyleCategory"));
    v7->_visualStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("visualStyle"));
    v7->_hidden = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hidden"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessibilityIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    accessibilityIdentifier = v7->_accessibilityIdentifier;
    v7->_accessibilityIdentifier = (NSString *)v8;

  }
  return v7;
}

- (int64_t)visualStyleCategory
{
  return self->_visualStyleCategory;
}

- (void)setVisualStyleCategory:(int64_t)a3
{
  self->_visualStyleCategory = a3;
}

- (int64_t)visualStyle
{
  return self->_visualStyle;
}

- (void)setVisualStyle:(int64_t)a3
{
  self->_visualStyle = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setAccessibilityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong(&self->_templateItem, 0);
}

@end
