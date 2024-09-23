@implementation CNAvatarPosePickerController

- (CNAvatarPosePickerController)initWithAvatarRecord:(id)a3 variantsManager:(id)a4
{
  id v6;
  void *v7;
  CNAvatarPosePickerController *v8;

  v6 = a4;
  +[CNPhotoPickerAnimojiProvider providerItemForAvatarRecord:](CNPhotoPickerAnimojiProvider, "providerItemForAvatarRecord:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNAvatarPosePickerController initWithAnimojiProviderItem:variantsManager:](self, "initWithAnimojiProviderItem:variantsManager:", v7, v6);

  return v8;
}

- (CNAvatarPosePickerController)initWithAnimojiProviderItem:(id)a3 variantsManager:(id)a4
{
  id v7;
  id v8;
  CNAvatarPosePickerController *v9;
  CNAvatarPosePickerController *v10;
  CNAvatarPosePickerController *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNAvatarPosePickerController;
  v9 = -[CNAvatarPosePickerController init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_variantsManager, a4);
    objc_storeStrong((id *)&v10->_originalProviderItem, a3);
    v11 = v10;
  }

  return v10;
}

- (void)setNumberOfItemsPerRow:(int64_t)a3
{
  _QWORD v3[5];

  if (self->_numberOfItemsPerRow != a3)
  {
    self->_numberOfItemsPerRow = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __55__CNAvatarPosePickerController_setNumberOfItemsPerRow___block_invoke;
    v3[3] = &__block_descriptor_40_e39_q40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
    v3[4] = a3;
    -[CNPhotoPickerVariantListController setNumberOfItemsPerRowProvider:](self->_posePickerController, "setNumberOfItemsPerRowProvider:", v3);
  }
}

- (void)setDesiredContentSize:(CGSize)a3
{
  if (self->_desiredContentSize.width != a3.width || self->_desiredContentSize.height != a3.height)
  {
    self->_desiredContentSize = a3;
    -[CNPhotoPickerVariantListController setPreferredContentSize:](self->_posePickerController, "setPreferredContentSize:");
  }
}

- (id)posePickerViewController
{
  CNPhotoPickerVariantListController *posePickerController;
  CNPhotoPickerVariantListController *v5;
  void *v6;
  void *v7;
  CNPhotoPickerVariantListController *v8;
  int64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  CNPhotoPickerVariantListController *v14;
  CNPhotoPickerVariantListController *v15;
  CNPhotoPickerVariantListController *v16;
  _QWORD v17[5];

  posePickerController = self->_posePickerController;
  if (posePickerController)
    return posePickerController;
  v5 = [CNPhotoPickerVariantListController alloc];
  -[CNAvatarPosePickerController variantsManager](self, "variantsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarPosePickerController originalProviderItem](self, "originalProviderItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNPhotoPickerVariantListController initWithVariantsManager:originalItem:](v5, "initWithVariantsManager:originalItem:", v6, v7);

  -[CNPhotoPickerVariantListController setDelegate:](v8, "setDelegate:", self);
  -[CNPhotoPickerVariantListController setShowPreview:](v8, "setShowPreview:", 0);
  -[CNPhotoPickerVariantListController setCellStyle:](v8, "setCellStyle:", 0);
  v9 = -[CNAvatarPosePickerController numberOfItemsPerRow](self, "numberOfItemsPerRow");
  v10 = 3;
  if (v9)
    v10 = v9;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __56__CNAvatarPosePickerController_posePickerViewController__block_invoke;
  v17[3] = &__block_descriptor_40_e39_q40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  v17[4] = v10;
  -[CNPhotoPickerVariantListController setNumberOfItemsPerRowProvider:](v8, "setNumberOfItemsPerRowProvider:", v17);
  -[CNPhotoPickerVariantListController setCommitsChangesOnSelection:](v8, "setCommitsChangesOnSelection:", 1);
  -[CNAvatarPosePickerController desiredContentSize](self, "desiredContentSize");
  if (v12 != *MEMORY[0x1E0C9D820] || v11 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[CNAvatarPosePickerController desiredContentSize](self, "desiredContentSize");
    -[CNPhotoPickerVariantListController setPreferredContentSize:](v8, "setPreferredContentSize:");
  }
  -[CNPhotoPickerVariantListController setShowsSelection:](v8, "setShowsSelection:", 0);
  v14 = self->_posePickerController;
  self->_posePickerController = v8;
  v15 = v8;

  v16 = self->_posePickerController;
  return v16;
}

- (void)photoPickerVariantListController:(id)a3 didSelectProviderItem:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v5 = a4;
  objc_opt_class();
  v9 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v9;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[CNAvatarPosePickerController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "posePickerController:didSelectProviderItem:", self, v7);

  }
}

- (void)photoPickerVariantListControllerDidCancel:(id)a3
{
  id v4;

  -[CNAvatarPosePickerController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posePickerController:didSelectProviderItem:", self, 0);

}

- (CNAvatarPosePickerControllerDelegate)delegate
{
  return (CNAvatarPosePickerControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)numberOfItemsPerRow
{
  return self->_numberOfItemsPerRow;
}

- (CGSize)desiredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_desiredContentSize.width;
  height = self->_desiredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (void)setVariantsManager:(id)a3
{
  objc_storeStrong((id *)&self->_variantsManager, a3);
}

- (CNPhotoPickerAnimojiProviderItem)originalProviderItem
{
  return self->_originalProviderItem;
}

- (void)setOriginalProviderItem:(id)a3
{
  objc_storeStrong((id *)&self->_originalProviderItem, a3);
}

- (CNPhotoPickerVariantListController)posePickerController
{
  return self->_posePickerController;
}

- (void)setPosePickerController:(id)a3
{
  objc_storeStrong((id *)&self->_posePickerController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posePickerController, 0);
  objc_storeStrong((id *)&self->_originalProviderItem, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __56__CNAvatarPosePickerController_posePickerViewController__block_invoke(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t __55__CNAvatarPosePickerController_setNumberOfItemsPerRow___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

@end
