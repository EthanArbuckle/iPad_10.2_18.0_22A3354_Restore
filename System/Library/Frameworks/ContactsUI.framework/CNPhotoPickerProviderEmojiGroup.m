@implementation CNPhotoPickerProviderEmojiGroup

- (CNPhotoPickerProviderEmojiGroup)initWithProviders:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5
{
  CNPhotoPickerProviderEmojiGroup *v5;
  CNPhotoPickerProviderEmojiGroup *v6;
  CNPhotoPickerProviderEmojiGroup *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNPhotoPickerProviderEmojiGroup;
  v5 = -[CNPhotoPickerProviderGroup initWithProviders:groupType:environment:allowAddItem:](&v9, sel_initWithProviders_groupType_environment_allowAddItem_, a3, 3, a4, a5);
  v6 = v5;
  if (v5)
    v7 = v5;

  return v6;
}

@end
