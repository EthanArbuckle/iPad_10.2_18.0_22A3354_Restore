@implementation UITableViewCell(NTKFaceDetailComplicationPickerViewControllerAdditions)

- (void)ntk_setPickerSelected:()NTKFaceDetailComplicationPickerViewControllerAdditions
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__UITableViewCell_NTKFaceDetailComplicationPickerViewControllerAdditions__ntk_setPickerSelected___block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = a1;
  if (ntk_setPickerSelected__onceToken != -1)
    dispatch_once(&ntk_setPickerSelected__onceToken, block);
  BPSBridgeTintColor();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v5);

  v7 = ntk_setPickerSelected__CheckmarkCheckImage;
  objc_msgSend(a1, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v7);

  objc_msgSend(a1, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", a3 ^ 1u);

}

@end
