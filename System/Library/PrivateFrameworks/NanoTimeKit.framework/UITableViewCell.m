@implementation UITableViewCell

void __97__UITableViewCell_NTKFaceDetailComplicationPickerViewControllerAdditions__ntk_setPickerSelected___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_checkmarkImage:", 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)ntk_setPickerSelected__CheckmarkCheckImage;
  ntk_setPickerSelected__CheckmarkCheckImage = v1;

}

@end
