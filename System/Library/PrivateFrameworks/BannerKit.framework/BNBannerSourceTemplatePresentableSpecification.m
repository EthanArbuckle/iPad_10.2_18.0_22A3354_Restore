@implementation BNBannerSourceTemplatePresentableSpecification

- (BOOL)providesTemplateContent
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  BNTemplateViewProviding *leadingTemplateViewProvider;
  uint64_t v6;
  BNTemplateViewProviding *v7;
  BNTemplateViewProviding *v8;
  BNTemplateViewProviding *v9;
  BNTemplateViewProviding *trailingTemplateViewProvider;
  uint64_t v11;
  BNTemplateViewProviding *v12;
  BNTemplateViewProviding *v13;
  BNTemplateViewProviding *v14;
  BNTemplateItemProviding *primaryTemplateItemProvider;
  uint64_t v16;
  BNTemplateItemProviding *v17;
  BNTemplateItemProviding *v18;
  BNTemplateItemProviding *v19;
  BNTemplateItemProviding *secondaryTemplateItemProvider;
  uint64_t v21;
  BNTemplateItemProviding *v22;
  BNTemplateItemProviding *v23;
  BNTemplateItemProviding *v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BNBannerSourceTemplatePresentableSpecification;
  -[BNBannerSourcePresentableSpecification encodeWithBSXPCCoder:](&v25, sel_encodeWithBSXPCCoder_, v4);
  leadingTemplateViewProvider = self->_leadingTemplateViewProvider;
  if (leadingTemplateViewProvider)
  {
    v6 = objc_opt_class();
    v7 = leadingTemplateViewProvider;
    if (v6)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v9 = v8;

    objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("leadingTemplateViewProvider"));
  }
  trailingTemplateViewProvider = self->_trailingTemplateViewProvider;
  if (trailingTemplateViewProvider)
  {
    v11 = objc_opt_class();
    v12 = trailingTemplateViewProvider;
    if (v11)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    v14 = v13;

    objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("trailingTemplateViewProvider"));
  }
  primaryTemplateItemProvider = self->_primaryTemplateItemProvider;
  if (primaryTemplateItemProvider)
  {
    v16 = objc_opt_class();
    v17 = primaryTemplateItemProvider;
    if (v16)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
    }
    else
    {
      v18 = 0;
    }
    v19 = v18;

    objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("primaryTemplateItemProvider"));
  }
  secondaryTemplateItemProvider = self->_secondaryTemplateItemProvider;
  if (secondaryTemplateItemProvider)
  {
    v21 = objc_opt_class();
    v22 = secondaryTemplateItemProvider;
    if (v21)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v23 = v22;
      else
        v23 = 0;
    }
    else
    {
      v23 = 0;
    }
    v24 = v23;

    objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("secondaryTemplateItemProvider"));
  }
  if (-[NSString length](self->_presentableAccessibilityIdentifier, "length"))
    objc_msgSend(v4, "encodeObject:forKey:", self->_presentableAccessibilityIdentifier, CFSTR("presentableAccessibilityIdentifier"));

}

- (BNBannerSourceTemplatePresentableSpecification)initWithBSXPCCoder:(id)a3
{
  id v4;
  BNBannerSourceTemplatePresentableSpecification *v5;
  uint64_t v6;
  BNTemplateViewProviding *leadingTemplateViewProvider;
  uint64_t v8;
  BNTemplateViewProviding *trailingTemplateViewProvider;
  uint64_t v10;
  BNTemplateItemProviding *primaryTemplateItemProvider;
  uint64_t v12;
  BNTemplateItemProviding *secondaryTemplateItemProvider;
  uint64_t v14;
  NSString *presentableAccessibilityIdentifier;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BNBannerSourceTemplatePresentableSpecification;
  v5 = -[BNBannerSourcePresentableSpecification initWithBSXPCCoder:](&v17, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("leadingTemplateViewProvider"));
    v6 = objc_claimAutoreleasedReturnValue();
    leadingTemplateViewProvider = v5->_leadingTemplateViewProvider;
    v5->_leadingTemplateViewProvider = (BNTemplateViewProviding *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trailingTemplateViewProvider"));
    v8 = objc_claimAutoreleasedReturnValue();
    trailingTemplateViewProvider = v5->_trailingTemplateViewProvider;
    v5->_trailingTemplateViewProvider = (BNTemplateViewProviding *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryTemplateItemProvider"));
    v10 = objc_claimAutoreleasedReturnValue();
    primaryTemplateItemProvider = v5->_primaryTemplateItemProvider;
    v5->_primaryTemplateItemProvider = (BNTemplateItemProviding *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryTemplateItemProvider"));
    v12 = objc_claimAutoreleasedReturnValue();
    secondaryTemplateItemProvider = v5->_secondaryTemplateItemProvider;
    v5->_secondaryTemplateItemProvider = (BNTemplateItemProviding *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("presentableAccessibilityIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    presentableAccessibilityIdentifier = v5->_presentableAccessibilityIdentifier;
    v5->_presentableAccessibilityIdentifier = (NSString *)v14;

  }
  return v5;
}

- (BNTemplateViewProviding)leadingTemplateViewProvider
{
  return self->_leadingTemplateViewProvider;
}

- (void)setLeadingTemplateViewProvider:(id)a3
{
  objc_storeStrong((id *)&self->_leadingTemplateViewProvider, a3);
}

- (BNTemplateViewProviding)trailingTemplateViewProvider
{
  return self->_trailingTemplateViewProvider;
}

- (void)setTrailingTemplateViewProvider:(id)a3
{
  objc_storeStrong((id *)&self->_trailingTemplateViewProvider, a3);
}

- (BNTemplateItemProviding)primaryTemplateItemProvider
{
  return self->_primaryTemplateItemProvider;
}

- (void)setPrimaryTemplateItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTemplateItemProvider, a3);
}

- (BNTemplateItemProviding)secondaryTemplateItemProvider
{
  return self->_secondaryTemplateItemProvider;
}

- (void)setSecondaryTemplateItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTemplateItemProvider, a3);
}

- (NSString)presentableAccessibilityIdentifier
{
  return self->_presentableAccessibilityIdentifier;
}

- (void)setPresentableAccessibilityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentableAccessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryTemplateItemProvider, 0);
  objc_storeStrong((id *)&self->_primaryTemplateItemProvider, 0);
  objc_storeStrong((id *)&self->_trailingTemplateViewProvider, 0);
  objc_storeStrong((id *)&self->_leadingTemplateViewProvider, 0);
}

@end
