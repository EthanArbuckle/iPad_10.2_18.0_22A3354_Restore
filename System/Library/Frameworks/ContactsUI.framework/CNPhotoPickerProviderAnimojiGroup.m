@implementation CNPhotoPickerProviderAnimojiGroup

- (CNPhotoPickerProviderAnimojiGroup)initWithProviders:(id)a3 environment:(id)a4 allowAddItem:(BOOL)a5
{
  CNPhotoPickerProviderAnimojiGroup *v5;
  CNPhotoPickerProviderAnimojiGroup *v6;
  CNPhotoPickerProviderAnimojiGroup *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNPhotoPickerProviderAnimojiGroup;
  v5 = -[CNPhotoPickerProviderGroup initWithProviders:groupType:environment:allowAddItem:](&v9, sel_initWithProviders_groupType_environment_allowAddItem_, a3, 2, a4, a5);
  v6 = v5;
  if (v5)
    v7 = v5;

  return v6;
}

- (BOOL)canCreateMemoji
{
  void *v2;
  void *v3;
  char v4;

  -[CNPhotoPickerProviderGroup providers](self, "providers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_firstObjectPassingTest:", &__block_literal_global_11458);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "canCreateMemoji");
  else
    v4 = 0;

  return v4;
}

- (BOOL)allowAddItem
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNPhotoPickerProviderAnimojiGroup;
  v3 = -[CNPhotoPickerProviderGroup allowAddItem](&v5, sel_allowAddItem);
  if (v3)
    LOBYTE(v3) = -[CNPhotoPickerProviderAnimojiGroup canCreateMemoji](self, "canCreateMemoji");
  return v3;
}

uint64_t __52__CNPhotoPickerProviderAnimojiGroup_canCreateMemoji__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
