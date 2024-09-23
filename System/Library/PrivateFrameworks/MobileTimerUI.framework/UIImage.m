@implementation UIImage

void __39__UIImage_MTUIStyling__mtui_sleepImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mtui_imageWithSymbolName:pointSize:", CFSTR("zzz"), 13.0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)mtui_sleepImage_SleepImage;
  mtui_sleepImage_SleepImage = v1;

}

void __38__UIImage_MTUIStyling__mtui_wakeImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mtui_imageWithSymbolName:pointSize:", CFSTR("bell.fill"), 13.0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)mtui_wakeImage_WakeImage;
  mtui_wakeImage_WakeImage = v1;

}

void __46__UIImage_MTUIStyling__mtui_deleteButtonImage__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "mtui_imageWithSymbolName:pointSize:", CFSTR("minus.circle.fill"), 20.0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithRenderingMode:", 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)mtui_deleteButtonImage_DeleteButtonImage;
  mtui_deleteButtonImage_DeleteButtonImage = v1;

}

@end
