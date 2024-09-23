@implementation UtilityPlatterBackgroundTemplateImage

void ___UtilityPlatterBackgroundTemplateImage_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  _BYTE v20[192];
  double v21;

  v12 = a2;
  v2 = (void *)MEMORY[0x1BCCA7FA8]();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_49(v12, v20);
  v4 = v21;
  objc_msgSend(MEMORY[0x1E0DC3830], "preferredFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "screenScale");
  objc_msgSend(v5, "setScale:");
  objc_msgSend(v5, "setPreferredRange:", 0);
  objc_msgSend(v5, "setOpaque:", 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v5, v4 + v4, v4 + v4);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = ___UtilityPlatterBackgroundTemplateImage_block_invoke_2;
  v13[3] = &unk_1E6BD9C78;
  v15 = 0;
  v16 = 0;
  v14 = v3;
  v17 = v4 + v4;
  v18 = v4 + v4;
  v19 = v4;
  v7 = v3;
  objc_msgSend(v6, "imageWithActions:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageWithRenderingMode:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "resizableImageWithCapInsets:", v4, v4, v4, v4);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_UtilityPlatterBackgroundTemplateImage_backgroundImage;
  _UtilityPlatterBackgroundTemplateImage_backgroundImage = v10;

  objc_autoreleasePoolPop(v2);
}

void ___UtilityPlatterBackgroundTemplateImage_block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "set");
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fill");

}

@end
