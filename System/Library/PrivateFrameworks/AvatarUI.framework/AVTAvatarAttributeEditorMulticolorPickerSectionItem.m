@implementation AVTAvatarAttributeEditorMulticolorPickerSectionItem

- (AVTAvatarAttributeEditorMulticolorPickerSectionItem)initWithIdentifier:(id)a3 localizedName:(id)a4 isPlaceholder:(BOOL)a5 isRemovable:(BOOL)a6 colorItem:(id)a7 variationStore:(id)a8 avatarUpdater:(id)a9 editorStateUpdater:(id)a10 removalUpdater:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  AVTAvatarAttributeEditorMulticolorPickerSectionItem *v22;
  AVTAvatarAttributeEditorMulticolorPickerSectionItem *v23;
  uint64_t v24;
  NSString *localizedName;
  uint64_t v26;
  id avatarUpdater;
  uint64_t v28;
  id editorStateUpdater;
  uint64_t v30;
  id removalUpdater;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v35 = a3;
  v18 = a4;
  v34 = a7;
  v33 = a8;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  v36.receiver = self;
  v36.super_class = (Class)AVTAvatarAttributeEditorMulticolorPickerSectionItem;
  v22 = -[AVTAvatarAttributeEditorMulticolorPickerSectionItem init](&v36, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_identifier, a3);
    v24 = objc_msgSend(v18, "copy");
    localizedName = v23->_localizedName;
    v23->_localizedName = (NSString *)v24;

    v23->_isPlaceholder = a5;
    v23->_isRemovable = a6;
    objc_storeStrong((id *)&v23->_colorItem, a7);
    objc_storeStrong((id *)&v23->_variationStore, a8);
    v26 = objc_msgSend(v19, "copy");
    avatarUpdater = v23->_avatarUpdater;
    v23->_avatarUpdater = (id)v26;

    v28 = objc_msgSend(v20, "copy");
    editorStateUpdater = v23->_editorStateUpdater;
    v23->_editorStateUpdater = (id)v28;

    v30 = objc_msgSend(v21, "copy");
    removalUpdater = v23->_removalUpdater;
    v23->_removalUpdater = (id)v30;

  }
  return v23;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (id)editorStateUpdater
{
  return self->_editorStateUpdater;
}

- (id)avatarUpdater
{
  return self->_avatarUpdater;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (BOOL)isRemovable
{
  return self->_isRemovable;
}

- (id)removalUpdater
{
  return self->_removalUpdater;
}

- (AVTAvatarAttributeEditorSectionColorItem)colorItem
{
  return self->_colorItem;
}

- (AVTAvatarColorVariationStore)variationStore
{
  return self->_variationStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variationStore, 0);
  objc_storeStrong((id *)&self->_colorItem, 0);
  objc_storeStrong(&self->_removalUpdater, 0);
  objc_storeStrong(&self->_avatarUpdater, 0);
  objc_storeStrong(&self->_editorStateUpdater, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
