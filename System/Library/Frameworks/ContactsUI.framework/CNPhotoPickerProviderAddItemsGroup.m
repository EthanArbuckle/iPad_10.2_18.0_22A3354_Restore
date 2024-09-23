@implementation CNPhotoPickerProviderAddItemsGroup

- (CNPhotoPickerProviderAddItemsGroup)initWithProviders:(id)a3 environment:(id)a4
{
  CNPhotoPickerProviderAddItemsGroup *v4;
  CNPhotoPickerProviderAddItemsGroup *v5;
  CNPhotoPickerProviderAddItemsGroup *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNPhotoPickerProviderAddItemsGroup;
  v4 = -[CNPhotoPickerProviderGroup initWithProviders:groupType:environment:allowAddItem:](&v8, sel_initWithProviders_groupType_environment_allowAddItem_, a3, 0, a4, 0);
  v5 = v4;
  if (v4)
    v6 = v4;

  return v5;
}

@end
