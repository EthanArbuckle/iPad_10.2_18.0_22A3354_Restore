@implementation AVTAvatarAttributeEditorMulticolorSectionProvider

- (AVTAvatarAttributeEditorMulticolorSectionProvider)initWithLocalizedName:(id)a3 subpickers:(id)a4 nestedPresetPickers:(id)a5 supplementalPicker:(id)a6 pickerItems:(id)a7 editorState:(id)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  AVTAvatarAttributeEditorMulticolorSectionProvider *v23;

  v14 = (void *)MEMORY[0x1E0CB3A28];
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  objc_msgSend(v14, "UUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "UUIDString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[AVTAvatarAttributeEditorMulticolorSectionProvider initWithIdentifier:localizedName:subpickers:nestedPresetPickers:supplementalPicker:pickerItems:editorState:](self, "initWithIdentifier:localizedName:subpickers:nestedPresetPickers:supplementalPicker:pickerItems:editorState:", v22, v20, v19, v18, v17, v16, v15);

  return v23;
}

- (AVTAvatarAttributeEditorMulticolorSectionProvider)initWithIdentifier:(id)a3 localizedName:(id)a4 subpickers:(id)a5 nestedPresetPickers:(id)a6 supplementalPicker:(id)a7 pickerItems:(id)a8 editorState:(id)a9
{
  return -[AVTAvatarAttributeEditorMulticolorSectionProvider initWithIdentifier:localizedName:subpickers:subpickerRemovalUpdaters:nestedPresetPickers:supplementalPicker:pickerItems:editorState:](self, "initWithIdentifier:localizedName:subpickers:subpickerRemovalUpdaters:nestedPresetPickers:supplementalPicker:pickerItems:editorState:", a3, a4, a5, 0, a6, a7, a8, a9);
}

- (AVTAvatarAttributeEditorMulticolorSectionProvider)initWithIdentifier:(id)a3 localizedName:(id)a4 subpickers:(id)a5 subpickerRemovalUpdaters:(id)a6 nestedPresetPickers:(id)a7 supplementalPicker:(id)a8 pickerItems:(id)a9 editorState:(id)a10
{
  id v17;
  AVTAvatarAttributeEditorMulticolorSectionProvider *v18;
  AVTAvatarAttributeEditorMulticolorSectionProvider *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v21 = a9;
  v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)AVTAvatarAttributeEditorMulticolorSectionProvider;
  v18 = -[AVTAvatarAttributeEditorMulticolorSectionProvider init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_localizedName, a4);
    objc_storeStrong((id *)&v19->_subpickerRemovalUpdaters, a6);
    objc_storeStrong((id *)&v19->_nestedPresetPickers, a7);
    objc_storeStrong((id *)&v19->_supplementalPicker, a8);
    objc_storeStrong((id *)&v19->_pickerItems, a9);
    objc_storeStrong((id *)&v19->_subpickers, a5);
    objc_storeStrong((id *)&v19->_editorState, a10);
  }

  return v19;
}

- (void)createPickerSectionIfNeeded
{
  void *v3;
  AVTAvatarAttributeEditorMulticolorPickerSection *v4;
  void *v5;
  void *v6;
  void *v7;
  AVTAvatarAttributeEditorMulticolorPickerSection *v8;

  -[AVTAvatarAttributeEditorMulticolorSectionProvider pickerSection](self, "pickerSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [AVTAvatarAttributeEditorMulticolorPickerSection alloc];
    -[AVTAvatarAttributeEditorMulticolorSectionProvider identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorMulticolorSectionProvider localizedName](self, "localizedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorMulticolorSectionProvider pickerItems](self, "pickerItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AVTAvatarAttributeEditorMulticolorPickerSection initWithIdentifier:localizedName:items:](v4, "initWithIdentifier:localizedName:items:", v5, v6, v7);

    -[AVTAvatarAttributeEditorMulticolorSectionProvider setPickerSection:](self, "setPickerSection:", v8);
  }
}

- (id)subpickerSectionIdentifiers
{
  void *v2;
  void *v3;

  -[AVTAvatarAttributeEditorMulticolorSectionProvider subpickers](self, "subpickers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avt_map:", &__block_literal_global_20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __80__AVTAvatarAttributeEditorMulticolorSectionProvider_subpickerSectionIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (NSArray)sections
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[AVTAvatarAttributeEditorMulticolorSectionProvider editorState](self, "editorState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorMulticolorSectionProvider identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "selectedMulticolorSubpickersIndexForMulticolorPickerIdentifier:", v4);

  v6 = (void *)MEMORY[0x1E0C99DE8];
  -[AVTAvatarAttributeEditorMulticolorSectionProvider nestedPresetPickers](self, "nestedPresetPickers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count") + 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarAttributeEditorMulticolorSectionProvider createPickerSectionIfNeeded](self, "createPickerSectionIfNeeded");
  -[AVTAvatarAttributeEditorMulticolorSectionProvider pickerSection](self, "pickerSection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  -[AVTAvatarAttributeEditorMulticolorSectionProvider subpickers](self, "subpickers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObject:", v11);
  -[AVTAvatarAttributeEditorMulticolorSectionProvider nestedPresetPickers](self, "nestedPresetPickers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v19++), "setShouldDisplayInsetSeparatorAfterSection:", 1, (_QWORD)v22);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v17);
  }

  if (v15)
    objc_msgSend(v8, "addObjectsFromArray:", v15);
  v20 = (void *)objc_msgSend(v8, "copy", (_QWORD)v22);

  return (NSArray *)v20;
}

- (NSArray)subsections
{
  return self->_subsections;
}

- (NSDictionary)nestedPresetPickers
{
  return self->_nestedPresetPickers;
}

- (void)setNestedPresetPickers:(id)a3
{
  objc_storeStrong((id *)&self->_nestedPresetPickers, a3);
}

- (BOOL)allowsRemoval
{
  return self->_allowsRemoval;
}

- (NSArray)subpickerRemovalUpdaters
{
  return self->_subpickerRemovalUpdaters;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedName, a3);
}

- (AVTAvatarAttributeEditorMulticolorPickerSection)pickerSection
{
  return self->_pickerSection;
}

- (void)setPickerSection:(id)a3
{
  objc_storeStrong((id *)&self->_pickerSection, a3);
}

- (NSArray)pickerItems
{
  return self->_pickerItems;
}

- (void)setPickerItems:(id)a3
{
  objc_storeStrong((id *)&self->_pickerItems, a3);
}

- (NSArray)subpickers
{
  return self->_subpickers;
}

- (void)setSubpickers:(id)a3
{
  objc_storeStrong((id *)&self->_subpickers, a3);
}

- (AVTAvatarAttributeEditorSectionSupplementalPicker)supplementalPicker
{
  return self->_supplementalPicker;
}

- (void)setSupplementalPicker:(id)a3
{
  objc_storeStrong((id *)&self->_supplementalPicker, a3);
}

- (AVTAvatarAttributeEditorState)editorState
{
  return self->_editorState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorState, 0);
  objc_storeStrong((id *)&self->_supplementalPicker, 0);
  objc_storeStrong((id *)&self->_subpickers, 0);
  objc_storeStrong((id *)&self->_pickerItems, 0);
  objc_storeStrong((id *)&self->_pickerSection, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_subpickerRemovalUpdaters, 0);
  objc_storeStrong((id *)&self->_nestedPresetPickers, 0);
  objc_storeStrong((id *)&self->_subsections, 0);
}

@end
