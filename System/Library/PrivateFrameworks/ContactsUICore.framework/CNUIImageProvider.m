@implementation CNUIImageProvider

+ (id)imageForResource:(id)a3 template:(BOOL)a4 onCacheMiss:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v5 = a4;
  v8 = a5;
  objc_msgSend(a1, "cacheKeyForImageResourceName:template:", a3, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (imageForResource_template_onCacheMiss__cn_once_token_1 != -1)
    dispatch_once(&imageForResource_template_onCacheMiss__cn_once_token_1, &__block_literal_global_77);
  v10 = (void *)imageForResource_template_onCacheMiss__cn_once_object_1;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__CNUIImageProvider_imageForResource_template_onCacheMiss___block_invoke_2;
  v15[3] = &unk_1EA605740;
  v16 = v8;
  v11 = v8;
  v12 = v10;
  objc_msgSend(v12, "objectForKey:onCacheMiss:", v9, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)cacheKeyForImageResourceName:(id)a3 template:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  v7 = v5;
  if (v4)
  {
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("_template"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)uncachedImageForResource:(id)a3 template:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  Class v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v4 = a4;
  v5 = a3;
  v6 = NSClassFromString(CFSTR("UIImage"));
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class imageNamed:inBundle:compatibleWithTraitCollection:](v6, "imageNamed:inBundle:compatibleWithTraitCollection:", v5, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_opt_class();
    v9 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    objc_msgSend(v11, "imageWithRenderingMode:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

void __59__CNUIImageProvider_imageForResource_template_onCacheMiss___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D139B0], "atomicCache");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)imageForResource_template_onCacheMiss__cn_once_object_1;
  imageForResource_template_onCacheMiss__cn_once_object_1 = v0;

}

uint64_t __59__CNUIImageProvider_imageForResource_template_onCacheMiss___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)imageForResource:(id)a3
{
  return (id)objc_msgSend(a1, "imageForResource:template:", a3, 0);
}

+ (id)imageForResource:(id)a3 template:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  BOOL v13;

  v4 = a4;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__CNUIImageProvider_imageForResource_template___block_invoke;
  v10[3] = &unk_1EA605768;
  v11 = v6;
  v12 = a1;
  v13 = v4;
  v7 = v6;
  objc_msgSend(a1, "imageForResource:template:onCacheMiss:", v7, v4, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __47__CNUIImageProvider_imageForResource_template___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "uncachedImageForResource:template:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

@end
