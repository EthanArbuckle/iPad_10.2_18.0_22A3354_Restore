@implementation SFIconGenerator

+ (void)getAppIconForBundleIdentifier:(id)a3 imageDescriptor:(id)a4 resultHandler:(id)a5
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v7 = a4;
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E0D3A820];
  v10 = a3;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithBundleIdentifier:", v10);

  objc_msgSend(v11, "imageForDescriptor:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "placeholder") & 1) != 0)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __79__SFIconGenerator_getAppIconForBundleIdentifier_imageDescriptor_resultHandler___block_invoke;
    v14[3] = &unk_1E21E2FB0;
    v15 = v8;
    objc_msgSend(v11, "getImageForImageDescriptor:completion:", v7, v14);

  }
  else
  {
    uiImageFromISImage(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v8 + 2))(v8, v13);

  }
}

void __79__SFIconGenerator_getAppIconForBundleIdentifier_imageDescriptor_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_msgSend(v5, "placeholder") & 1) == 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    uiImageFromISImage(v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
}

+ (id)appIconForBundleIdentifier:(id)a3 imageSize:(CGSize)a4
{
  double height;
  double width;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  height = a4.height;
  width = a4.width;
  v6 = (objc_class *)MEMORY[0x1E0D3A820];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithBundleIdentifier:", v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", width, height, _SFScreenScale());
  objc_msgSend(v8, "prepareImageForDescriptor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "placeholder") & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    uiImageFromISImage(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

@end
