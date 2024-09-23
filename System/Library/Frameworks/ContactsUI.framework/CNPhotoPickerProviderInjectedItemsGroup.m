@implementation CNPhotoPickerProviderInjectedItemsGroup

- (CNPhotoPickerProviderInjectedItemsGroup)initWithEnvironment:(id)a3
{
  CNPhotoPickerProviderInjectedItemsGroup *v3;
  CNPhotoPickerProviderInjectedItemsGroup *v4;
  CNPhotoPickerProviderInjectedItemsGroup *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNPhotoPickerProviderInjectedItemsGroup;
  v3 = -[CNPhotoPickerProviderGroup initWithProviders:groupType:environment:allowAddItem:](&v7, sel_initWithProviders_groupType_environment_allowAddItem_, 0, 4, a3, 0);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

@end
