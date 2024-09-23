@implementation AVTAvatarAttributeEditorColorSection

- (AVTAvatarAttributeEditorColorSection)initWithPrimaryItems:(id)a3 extendedItems:(id)a4 colorVariationStore:(id)a5 localizedName:(id)a6 identifier:(id)a7 intendedDestination:(unint64_t)a8 alwaysShowExtended:(BOOL)a9 options:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  AVTAvatarAttributeEditorColorSection *v21;
  uint64_t v22;
  NSArray *primaryItems;
  uint64_t v24;
  NSArray *extendedItems;
  uint64_t v26;
  NSString *localizedName;
  uint64_t v28;
  NSString *identifier;
  id v31;
  objc_super v32;

  v31 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a10;
  v32.receiver = self;
  v32.super_class = (Class)AVTAvatarAttributeEditorColorSection;
  v21 = -[AVTAvatarAttributeEditorColorSection init](&v32, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v31, "copy");
    primaryItems = v21->_primaryItems;
    v21->_primaryItems = (NSArray *)v22;

    v24 = objc_msgSend(v16, "copy");
    extendedItems = v21->_extendedItems;
    v21->_extendedItems = (NSArray *)v24;

    objc_storeStrong((id *)&v21->_colorVariationStore, a5);
    v26 = objc_msgSend(v18, "copy");
    localizedName = v21->_localizedName;
    v21->_localizedName = (NSString *)v26;

    v28 = objc_msgSend(v19, "copy");
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v28;

    v21->_intendedDestination = a8;
    v21->_alwaysShowExtended = a9;
    objc_storeStrong((id *)&v21->_options, a10);
  }

  return v21;
}

- (id)copyWithoutTitle
{
  AVTAvatarAttributeEditorColorSection *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  BOOL v9;
  void *v10;
  AVTAvatarAttributeEditorColorSection *v11;
  uint64_t v13;

  v3 = [AVTAvatarAttributeEditorColorSection alloc];
  -[AVTAvatarAttributeEditorColorSection primaryItems](self, "primaryItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorColorSection extendedItems](self, "extendedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorColorSection colorVariationStore](self, "colorVariationStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorColorSection identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AVTAvatarAttributeEditorColorSection intendedDestination](self, "intendedDestination");
  v9 = -[AVTAvatarAttributeEditorColorSection alwaysShowExtended](self, "alwaysShowExtended");
  -[AVTAvatarAttributeEditorColorSection options](self, "options");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = v9;
  v11 = -[AVTAvatarAttributeEditorColorSection initWithPrimaryItems:extendedItems:colorVariationStore:localizedName:identifier:intendedDestination:alwaysShowExtended:options:](v3, "initWithPrimaryItems:extendedItems:colorVariationStore:localizedName:identifier:intendedDestination:alwaysShowExtended:options:", v4, v5, v6, &stru_1EA5207B8, v7, v8, v13, v10);

  return v11;
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
  v16.super_class = (Class)AVTAvatarAttributeEditorColorSection;
  -[AVTAvatarAttributeEditorColorSection description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AVTAvatarAttributeEditorColorSection localizedName](self, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorColorSection identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorColorSection primaryItems](self, "primaryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "avt_description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" name: %@, identifier: %@, sectionItems: %@"), v5, v6, v8);

  -[AVTAvatarAttributeEditorColorSection supplementalPicker](self, "supplementalPicker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AVTAvatarAttributeEditorColorSection supplementalPicker](self, "supplementalPicker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(", supplemental picker: %@"), v11);

  }
  -[AVTAvatarAttributeEditorColorSection options](self, "options");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[AVTAvatarAttributeEditorColorSection options](self, "options");
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

  -[AVTAvatarAttributeEditorColorSection localizedName](self, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AVTAvatarAttributeEditorColorSection localizedName](self, "localizedName");
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
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "conformsToProtocol:", &unk_1F03D9670) & 1) == 0)
    v5 = objc_msgSend(v4, "shouldDisplayTitle");
  else
    v5 = 0;

  return v5;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
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

- (NSArray)primaryItems
{
  return self->_primaryItems;
}

- (NSArray)extendedItems
{
  return self->_extendedItems;
}

- (AVTAvatarColorVariationStore)colorVariationStore
{
  return self->_colorVariationStore;
}

- (BOOL)alwaysShowExtended
{
  return self->_alwaysShowExtended;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorVariationStore, 0);
  objc_storeStrong((id *)&self->_extendedItems, 0);
  objc_storeStrong((id *)&self->_primaryItems, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_supplementalPicker, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
