@implementation AVTAvatarAttributeEditorSectionSupplementalPicker

+ (id)pickerFromEditorSection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  AVTAvatarAttributeEditorSectionSupplementalPicker *v6;
  void *v7;
  AVTAvatarAttributeEditorSectionSupplementalPicker *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__12;
  v15 = __Block_byref_object_dispose__12;
  v16 = 0;
  objc_msgSend(v3, "sectionItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__AVTAvatarAttributeEditorSectionSupplementalPicker_pickerFromEditorSection___block_invoke;
  v10[3] = &unk_1EA51EC58;
  v10[4] = &v11;
  objc_msgSend(v4, "avt_map:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [AVTAvatarAttributeEditorSectionSupplementalPicker alloc];
  objc_msgSend((id)v12[5], "localizedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AVTAvatarAttributeEditorSectionSupplementalPicker initWithLocalizedTitle:choices:](v6, "initWithLocalizedTitle:choices:", v7, v5);

  _Block_object_dispose(&v11, 8);
  return v8;
}

AVTAvatarAttributeEditorSectionSupplementalPickerItem *__77__AVTAvatarAttributeEditorSectionSupplementalPicker_pickerFromEditorSection___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  AVTAvatarAttributeEditorSectionSupplementalPickerItem *v5;
  void *v6;
  void *v7;
  AVTAvatarAttributeEditorSectionSupplementalPickerItem *v8;

  v4 = a2;
  if (objc_msgSend(v4, "isSelected"))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v5 = [AVTAvatarAttributeEditorSectionSupplementalPickerItem alloc];
  objc_msgSend(v4, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avatarUpdater");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AVTAvatarAttributeEditorSectionSupplementalPickerItem initWithLocalizedName:localizedDescription:avatarUpdater:editorUpdater:selected:](v5, "initWithLocalizedName:localizedDescription:avatarUpdater:editorUpdater:selected:", v6, 0, v7, 0, objc_msgSend(v4, "isSelected"));

  return v8;
}

+ (id)pickerForPairableModelCategory:(id)a3 isPaired:(BOOL)a4 avatarUpdaterOnPair:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  AVTAvatarAttributeEditorSectionSupplementalPickerItem *v9;
  void *v10;
  void *v11;
  id v12;
  AVTAvatarAttributeEditorSectionSupplementalPickerItem *v13;
  AVTAvatarAttributeEditorSectionSupplementalPickerItem *v14;
  void *v15;
  void *v16;
  id v17;
  AVTAvatarAttributeEditorSectionSupplementalPickerItem *v18;
  AVTAvatarAttributeEditorSectionSupplementalPicker *v19;
  void *v20;
  AVTAvatarAttributeEditorSectionSupplementalPicker *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[3];

  v5 = a4;
  v28[2] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(a3, "pairing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = [AVTAvatarAttributeEditorSectionSupplementalPickerItem alloc];
    objc_msgSend(v8, "localizedPairTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedPairedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __113__AVTAvatarAttributeEditorSectionSupplementalPicker_pickerForPairableModelCategory_isPaired_avatarUpdaterOnPair___block_invoke;
    v26[3] = &unk_1EA51EC80;
    v12 = v8;
    v27 = v12;
    v13 = -[AVTAvatarAttributeEditorSectionSupplementalPickerItem initWithLocalizedName:localizedDescription:avatarUpdater:editorUpdater:selected:](v9, "initWithLocalizedName:localizedDescription:avatarUpdater:editorUpdater:selected:", v10, v11, 0, v26, v5);

    v14 = [AVTAvatarAttributeEditorSectionSupplementalPickerItem alloc];
    objc_msgSend(v12, "localizedUnpairTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedUnpairedDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __113__AVTAvatarAttributeEditorSectionSupplementalPicker_pickerForPairableModelCategory_isPaired_avatarUpdaterOnPair___block_invoke_2;
    v24[3] = &unk_1EA51EC80;
    v17 = v12;
    v25 = v17;
    v18 = -[AVTAvatarAttributeEditorSectionSupplementalPickerItem initWithLocalizedName:localizedDescription:avatarUpdater:editorUpdater:selected:](v14, "initWithLocalizedName:localizedDescription:avatarUpdater:editorUpdater:selected:", v15, v16, v7, v24, v5 ^ 1);

    if (v5)
      objc_msgSend(v17, "localizedPairTitle");
    else
      objc_msgSend(v17, "localizedUnpairTitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = [AVTAvatarAttributeEditorSectionSupplementalPicker alloc];
    v28[0] = v13;
    v28[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[AVTAvatarAttributeEditorSectionSupplementalPicker initWithLocalizedTitle:choices:](v21, "initWithLocalizedTitle:choices:", v20, v22);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

void __113__AVTAvatarAttributeEditorSectionSupplementalPicker_pickerForPairableModelCategory_isPaired_avatarUpdaterOnPair___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setCategory:inPairedState:", objc_msgSend(v2, "pairedCategory"), 1);

}

void __113__AVTAvatarAttributeEditorSectionSupplementalPicker_pickerForPairableModelCategory_isPaired_avatarUpdaterOnPair___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setCategory:inPairedState:", objc_msgSend(v2, "pairedCategory"), 0);

}

+ (id)pickerForMulticolorPicker:(id)a3 isMultipleSelected:(BOOL)a4 switchToSingleColorAvatarUpdater:(id)a5 switchToMultipleColorAvatarUpdater:(id)a6
{
  _BOOL8 v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AVTAvatarAttributeEditorSectionSupplementalPickerItem *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  AVTAvatarAttributeEditorSectionSupplementalPickerItem *v24;
  AVTAvatarAttributeEditorSectionSupplementalPickerItem *v25;
  void *v26;
  void *v27;
  AVTAvatarAttributeEditorSectionSupplementalPickerItem *v28;
  void *v29;
  void *v30;
  AVTAvatarAttributeEditorSectionSupplementalPicker *v31;
  void *v32;
  AVTAvatarAttributeEditorSectionSupplementalPicker *v33;
  AVTAvatarAttributeEditorSectionSupplementalPicker *v34;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[3];

  v8 = a4;
  v42[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v9, "auxiliaryPicker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "items");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "items");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = v11;
    v18 = [AVTAvatarAttributeEditorSectionSupplementalPickerItem alloc];
    objc_msgSend(v15, "title");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "message");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __166__AVTAvatarAttributeEditorSectionSupplementalPicker_pickerForMulticolorPicker_isMultipleSelected_switchToSingleColorAvatarUpdater_switchToMultipleColorAvatarUpdater___block_invoke;
    v40[3] = &unk_1EA51EC80;
    v21 = v9;
    v36 = v9;
    v22 = v10;
    v23 = v21;
    v41 = v21;
    v24 = -[AVTAvatarAttributeEditorSectionSupplementalPickerItem initWithLocalizedName:localizedDescription:avatarUpdater:editorUpdater:selected:](v18, "initWithLocalizedName:localizedDescription:avatarUpdater:editorUpdater:selected:", v19, v20, v22, v40, v8 ^ 1);

    v25 = [AVTAvatarAttributeEditorSectionSupplementalPickerItem alloc];
    objc_msgSend(v17, "title");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "message");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __166__AVTAvatarAttributeEditorSectionSupplementalPicker_pickerForMulticolorPicker_isMultipleSelected_switchToSingleColorAvatarUpdater_switchToMultipleColorAvatarUpdater___block_invoke_2;
    v38[3] = &unk_1EA51EC80;
    v39 = v23;
    v28 = -[AVTAvatarAttributeEditorSectionSupplementalPickerItem initWithLocalizedName:localizedDescription:avatarUpdater:editorUpdater:selected:](v25, "initWithLocalizedName:localizedDescription:avatarUpdater:editorUpdater:selected:", v26, v27, v37, v38, v8);

    if (v8)
      v29 = v17;
    else
      v29 = v15;
    objc_msgSend(v29, "title");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = [AVTAvatarAttributeEditorSectionSupplementalPicker alloc];
    v42[0] = v24;
    v42[1] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v31;
    v11 = v37;
    v34 = -[AVTAvatarAttributeEditorSectionSupplementalPicker initWithLocalizedTitle:choices:](v33, "initWithLocalizedTitle:choices:", v30, v32);

    v10 = v22;
    v9 = v36;

  }
  else
  {
    v34 = 0;
  }

  return v34;
}

void __166__AVTAvatarAttributeEditorSectionSupplementalPicker_pickerForMulticolorPicker_isMultipleSelected_switchToSingleColorAvatarUpdater_switchToMultipleColorAvatarUpdater___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabledMulticolorSubpickersIndex:forMulticolorPickerIdentifier:", 0, v4);

}

void __166__AVTAvatarAttributeEditorSectionSupplementalPicker_pickerForMulticolorPicker_isMultipleSelected_switchToSingleColorAvatarUpdater_switchToMultipleColorAvatarUpdater___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "subpickers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "count") - 1;
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabledMulticolorSubpickersIndex:forMulticolorPickerIdentifier:", v5, v6);

}

- (AVTAvatarAttributeEditorSectionSupplementalPicker)initWithLocalizedTitle:(id)a3 choices:(id)a4
{
  id v7;
  id v8;
  AVTAvatarAttributeEditorSectionSupplementalPicker *v9;
  AVTAvatarAttributeEditorSectionSupplementalPicker *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTAvatarAttributeEditorSectionSupplementalPicker;
  v9 = -[AVTAvatarAttributeEditorSectionSupplementalPicker init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localizedTitle, a3);
    objc_storeStrong((id *)&v10->_choices, a4);
  }

  return v10;
}

- (id)copyWithLocalizedTitle:(id)a3
{
  id v4;
  AVTAvatarAttributeEditorSectionSupplementalPicker *v5;
  void *v6;
  AVTAvatarAttributeEditorSectionSupplementalPicker *v7;

  v4 = a3;
  v5 = [AVTAvatarAttributeEditorSectionSupplementalPicker alloc];
  -[AVTAvatarAttributeEditorSectionSupplementalPicker choices](self, "choices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AVTAvatarAttributeEditorSectionSupplementalPicker initWithLocalizedTitle:choices:](v5, "initWithLocalizedTitle:choices:", v4, v6);

  return v7;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSArray)choices
{
  return self->_choices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_choices, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end
