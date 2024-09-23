@implementation AVTAvatarAttributeEditorSectionSupplementalPickerItem

- (AVTAvatarAttributeEditorSectionSupplementalPickerItem)initWithLocalizedName:(id)a3 localizedDescription:(id)a4 avatarUpdater:(id)a5 editorUpdater:(id)a6 selected:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  AVTAvatarAttributeEditorSectionSupplementalPickerItem *v17;
  AVTAvatarAttributeEditorSectionSupplementalPickerItem *v18;
  uint64_t v19;
  id avatarUpdater;
  uint64_t v21;
  id editorUpdater;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v24.receiver = self;
  v24.super_class = (Class)AVTAvatarAttributeEditorSectionSupplementalPickerItem;
  v17 = -[AVTAvatarAttributeEditorSectionSupplementalPickerItem init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_localizedName, a3);
    v19 = MEMORY[0x1DF0D0754](v15);
    avatarUpdater = v18->_avatarUpdater;
    v18->_avatarUpdater = (id)v19;

    v21 = MEMORY[0x1DF0D0754](v16);
    editorUpdater = v18->_editorUpdater;
    v18->_editorUpdater = (id)v21;

    objc_storeStrong((id *)&v18->_localizedDescription, a4);
    v18->_selected = a7;
  }

  return v18;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (id)avatarUpdater
{
  return self->_avatarUpdater;
}

- (id)editorUpdater
{
  return self->_editorUpdater;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong(&self->_editorUpdater, 0);
  objc_storeStrong(&self->_avatarUpdater, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
