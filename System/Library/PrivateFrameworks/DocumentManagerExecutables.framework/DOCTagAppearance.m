@implementation DOCTagAppearance

+ (id)renderingAppearance
{
  if (renderingAppearance_onceToken != -1)
    dispatch_once(&renderingAppearance_onceToken, &__block_literal_global_5);
  return (id)renderingAppearance_shared;
}

void __39__DOCTagAppearance_renderingAppearance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[DOCTagRenderingAppearance _init]([DOCTagRenderingAppearance alloc], "_init");
  v1 = (void *)renderingAppearance_shared;
  renderingAppearance_shared = (uint64_t)v0;

}

+ (id)pickerList
{
  if (pickerList_onceToken != -1)
    dispatch_once(&pickerList_onceToken, &__block_literal_global_5);
  return (id)pickerList_shared;
}

void __30__DOCTagAppearance_pickerList__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[DOCTagListCellAppearance _init]([DOCTagListCellAppearance alloc], "_init");
  v1 = (void *)pickerList_shared;
  pickerList_shared = (uint64_t)v0;

}

+ (id)makerUI
{
  if (makerUI_onceToken != -1)
    dispatch_once(&makerUI_onceToken, &__block_literal_global_1_1);
  return (id)makerUI_shared;
}

void __27__DOCTagAppearance_makerUI__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[DOCTagMakerAppearance _init]([DOCTagMakerAppearance alloc], "_init");
  v1 = (void *)makerUI_shared;
  makerUI_shared = (uint64_t)v0;

}

+ (id)infoCollection
{
  if (infoCollection_onceToken != -1)
    dispatch_once(&infoCollection_onceToken, &__block_literal_global_3);
  return (id)infoCollection_shared;
}

void __34__DOCTagAppearance_infoCollection__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[DOCTagInfoCollectionAppearance _init]([DOCTagInfoCollectionAppearance alloc], "_init");
  v1 = (void *)infoCollection_shared;
  infoCollection_shared = (uint64_t)v0;

}

@end
