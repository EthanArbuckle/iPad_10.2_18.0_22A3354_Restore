@implementation AVTAvatarAttributeEditorSection

- (AVTAvatarAttributeEditorSection)initWithSectionItems:(id)a3 localizedName:(id)a4 identifier:(id)a5 intendedDestination:(unint64_t)a6 options:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  AVTAvatarAttributeEditorSection *v16;
  uint64_t v17;
  NSArray *sectionItems;
  uint64_t v19;
  NSString *localizedName;
  uint64_t v21;
  NSString *identifier;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)AVTAvatarAttributeEditorSection;
  v16 = -[AVTAvatarAttributeEditorSection init](&v24, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    sectionItems = v16->_sectionItems;
    v16->_sectionItems = (NSArray *)v17;

    v19 = objc_msgSend(v13, "copy");
    localizedName = v16->_localizedName;
    v16->_localizedName = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v21;

    objc_storeStrong((id *)&v16->_options, a7);
    v16->_intendedDestination = a6;
  }

  return v16;
}

- (NSString)description
{
  void *v3;
  void *v4;
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AVTAvatarAttributeEditorSection;
  -[AVTAvatarAttributeEditorSection description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AVTAvatarAttributeEditorSection localizedName](self, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorSection identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorSection sectionItems](self, "sectionItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "avt_description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" name: %@, identifier: %@, sectionItems: %@"), v5, v6, v8);

  -[AVTAvatarAttributeEditorSection supplementalPicker](self, "supplementalPicker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AVTAvatarAttributeEditorSection supplementalPicker](self, "supplementalPicker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(", supplemental picker: %@"), v11);

  }
  -[AVTAvatarAttributeEditorSection options](self, "options");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[AVTAvatarAttributeEditorSection options](self, "options");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(", options: %@"), v13);

  }
  v14 = (void *)objc_msgSend(v4, "copy");

  return (NSString *)v14;
}

- (BOOL)shouldDisplayTitle
{
  void *v3;
  void *v4;
  BOOL v5;

  -[AVTAvatarAttributeEditorSection localizedName](self, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AVTAvatarAttributeEditorSection localizedName](self, "localizedName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldDisplaySeparatorBeforeSection:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[AVTAvatarAttributeEditorSection shouldDisplayInsetSeparatorAfterSection](self, "shouldDisplayInsetSeparatorAfterSection"))
  {
    v5 = 1;
  }
  else if (v4)
  {
    v5 = objc_msgSend(v4, "shouldDisplayTitle");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (UIEdgeInsets)separatorInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (-[AVTAvatarAttributeEditorSection shouldDisplayInsetSeparatorAfterSection](self, "shouldDisplayInsetSeparatorAfterSection"))
  {
    v2 = 0.0;
    v3 = 20.0;
    v4 = 0.0;
    v5 = 20.0;
  }
  else
  {
    v2 = *MEMORY[0x1E0CEB4B0];
    v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (NSArray)sections
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)sectionItems
{
  return self->_sectionItems;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (AVTAvatarAttributeEditorSectionSupplementalPicker)supplementalPicker
{
  return self->_supplementalPicker;
}

- (void)setSupplementalPicker:(id)a3
{
  objc_storeStrong((id *)&self->_supplementalPicker, a3);
}

- (AVTAvatarAttributeEditorSectionOptions)options
{
  return self->_options;
}

- (unint64_t)intendedDestination
{
  return self->_intendedDestination;
}

- (void)setIntendedDestination:(unint64_t)a3
{
  self->_intendedDestination = a3;
}

- (BOOL)shouldDisplayInsetSeparatorAfterSection
{
  return self->_shouldDisplayInsetSeparatorAfterSection;
}

- (void)setShouldDisplayInsetSeparatorAfterSection:(BOOL)a3
{
  self->_shouldDisplayInsetSeparatorAfterSection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_supplementalPicker, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_sectionItems, 0);
}

@end
