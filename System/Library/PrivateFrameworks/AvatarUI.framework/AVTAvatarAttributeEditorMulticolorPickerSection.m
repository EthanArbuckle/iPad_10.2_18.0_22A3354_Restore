@implementation AVTAvatarAttributeEditorMulticolorPickerSection

- (AVTAvatarAttributeEditorMulticolorPickerSection)initWithIdentifier:(id)a3 localizedName:(id)a4 items:(id)a5
{
  id v9;
  id v10;
  id v11;
  AVTAvatarAttributeEditorMulticolorPickerSection *v12;
  AVTAvatarAttributeEditorMulticolorPickerSection *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AVTAvatarAttributeEditorMulticolorPickerSection;
  v12 = -[AVTAvatarAttributeEditorMulticolorPickerSection init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_items, a5);
    objc_storeStrong((id *)&v13->_localizedName, a4);
    objc_storeStrong((id *)&v13->_sectionItems, a5);
    objc_storeStrong((id *)&v13->_identifier, a3);
    v13->_intendedDestination = 0;
  }

  return v13;
}

- (BOOL)shouldDisplayTitle
{
  void *v3;
  void *v4;
  BOOL v5;

  -[AVTAvatarAttributeEditorMulticolorPickerSection localizedName](self, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AVTAvatarAttributeEditorMulticolorPickerSection localizedName](self, "localizedName");
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
  return 0;
}

- (UIEdgeInsets)separatorInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0CEB4B0];
  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
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

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)sectionItems
{
  return self->_sectionItems;
}

- (NSString)identifier
{
  return self->_identifier;
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

- (AVTAvatarAttributeEditorSectionSupplementalPicker)supplementalPicker
{
  return self->_supplementalPicker;
}

- (void)setSupplementalPicker:(id)a3
{
  objc_storeStrong((id *)&self->_supplementalPicker, a3);
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_supplementalPicker, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_sectionItems, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
