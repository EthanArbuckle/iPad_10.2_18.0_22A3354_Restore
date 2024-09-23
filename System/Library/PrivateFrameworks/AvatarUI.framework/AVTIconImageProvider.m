@implementation AVTIconImageProvider

+ (void)prewarmIconImageForBundleIdentifier:(id)a3 size:(CGSize)a4 scale:(double)a5
{
  double height;
  double width;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  height = a4.height;
  width = a4.width;
  v13[1] = *MEMORY[0x1E0C80C00];
  v8 = (objc_class *)MEMORY[0x1E0D3A830];
  v9 = a3;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithSize:scale:", width, height, a5);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", v9);

  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "prepareImagesForImageDescriptors:", v12);

}

+ (void)iconImageForBundleIdentifier:(id)a3 size:(CGSize)a4 scale:(double)a5 completionBlock:(id)a6
{
  double height;
  double width;
  id v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  height = a4.height;
  width = a4.width;
  v10 = a6;
  v11 = (objc_class *)MEMORY[0x1E0D3A830];
  v12 = a3;
  v13 = (void *)objc_msgSend([v11 alloc], "initWithSize:scale:", width, height, a5);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", v12);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__AVTIconImageProvider_iconImageForBundleIdentifier_size_scale_completionBlock___block_invoke;
  v16[3] = &unk_1EA51FBF0;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v14, "getCGImageForImageDescriptor:completion:", v13, v16);

}

void __80__AVTIconImageProvider_iconImageForBundleIdentifier_size_scale_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

@end
