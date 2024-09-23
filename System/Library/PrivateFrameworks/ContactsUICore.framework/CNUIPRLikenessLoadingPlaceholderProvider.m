@implementation CNUIPRLikenessLoadingPlaceholderProvider

- (CGImage)renderCircularImageForSize:(CGSize)a3 scale:(double)a4
{
  CGImage *result;

  result = CNUICircularImageCreate(&__block_literal_global_60, a3.width, a3.height, a4);
  if (result)
    return (CGImage *)CFAutorelease(result);
  return result;
}

void __77__CNUIPRLikenessLoadingPlaceholderProvider_renderCircularImageForSize_scale___block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, CGContext *a6, CGColorSpace *a7)
{
  CNUIDrawLikenessPlatterInContext(a6, a7, a1, a2, a3, a4);
}

- (CGImage)_cnui_circularImageForSize:(CGSize)a3 scale:(double)a4
{
  CGFloat height;
  CGFloat width;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  const void *v13;
  CGImage *v14;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  height = a3.height;
  width = a3.width;
  v8 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSize(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-Circular"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  -[CNUIPRLikenessLoadingPlaceholderProvider resourceLock](self, "resourceLock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__CNUIPRLikenessLoadingPlaceholderProvider__cnui_circularImageForSize_scale___block_invoke;
  v16[3] = &unk_1EA6051C0;
  v18 = &v22;
  v16[4] = self;
  v12 = v10;
  v17 = v12;
  v19 = width;
  v20 = height;
  v21 = a4;
  objc_msgSend(v11, "performBlock:", v16);

  v13 = (const void *)v23[3];
  if (v13)
    v14 = (CGImage *)CFAutorelease(v13);
  else
    v14 = 0;

  _Block_object_dispose(&v22, 8);
  return v14;
}

- (CNScheduler)resourceLock
{
  return self->_resourceLock;
}

uint64_t __77__CNUIPRLikenessLoadingPlaceholderProvider__cnui_circularImageForSize_scale___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderCircularImageForSize:scale:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

void __77__CNUIPRLikenessLoadingPlaceholderProvider__cnui_circularImageForSize_scale___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  __int128 v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__CNUIPRLikenessLoadingPlaceholderProvider__cnui_circularImageForSize_scale___block_invoke_2;
  v5[3] = &unk_1EA603938;
  v3 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v2, "objectForKey:onCacheMiss:", v3, v5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;

}

- (CNCache)cache
{
  return self->_cache;
}

- (CNUIPRLikenessLoadingPlaceholderProvider)init
{
  CNUIPRLikenessLoadingPlaceholderProvider *v2;
  uint64_t v3;
  CNScheduler *resourceLock;
  CNCache *v5;
  CNCache *cache;
  CNUIPRLikenessLoadingPlaceholderProvider *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNUIPRLikenessLoadingPlaceholderProvider;
  v2 = -[CNUIPRLikenessLoadingPlaceholderProvider init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D13B68], "synchronousSerialDispatchQueueWithName:", CFSTR("com.apple.contacts.ContactsUICore.CNUIPRLikenessLoadingPlaceholderProvider"));
    v3 = objc_claimAutoreleasedReturnValue();
    resourceLock = v2->_resourceLock;
    v2->_resourceLock = (CNScheduler *)v3;

    v5 = (CNCache *)objc_alloc_init(MEMORY[0x1E0D139B0]);
    cache = v2->_cache;
    v2->_cache = v5;

    v7 = v2;
  }

  return v2;
}

- (CGImage)renderRoundedRectImageForSize:(CGSize)a3 scale:(double)a4
{
  CGImage *result;

  result = CNUIRoundedRectImageCreate(&__block_literal_global_3_3, a3.width, a3.height, a4);
  if (result)
    return (CGImage *)CFAutorelease(result);
  return result;
}

void __80__CNUIPRLikenessLoadingPlaceholderProvider_renderRoundedRectImageForSize_scale___block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, CGContext *a6, CGColorSpace *a7)
{
  CNUIDrawLikenessPlatterInContext(a6, a7, a1, a2, a3, a4);
}

- (CGImage)_cnui_roundedRectImageForSize:(CGSize)a3 scale:(double)a4
{
  CGFloat height;
  CGFloat width;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  const void *v13;
  CGImage *v14;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  height = a3.height;
  width = a3.width;
  v8 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSize(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-RoundedRect"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  -[CNUIPRLikenessLoadingPlaceholderProvider resourceLock](self, "resourceLock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__CNUIPRLikenessLoadingPlaceholderProvider__cnui_roundedRectImageForSize_scale___block_invoke;
  v16[3] = &unk_1EA6051C0;
  v18 = &v22;
  v16[4] = self;
  v12 = v10;
  v17 = v12;
  v19 = width;
  v20 = height;
  v21 = a4;
  objc_msgSend(v11, "performBlock:", v16);

  v13 = (const void *)v23[3];
  if (v13)
    v14 = (CGImage *)CFAutorelease(v13);
  else
    v14 = 0;

  _Block_object_dispose(&v22, 8);
  return v14;
}

void __80__CNUIPRLikenessLoadingPlaceholderProvider__cnui_roundedRectImageForSize_scale___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  __int128 v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__CNUIPRLikenessLoadingPlaceholderProvider__cnui_roundedRectImageForSize_scale___block_invoke_2;
  v5[3] = &unk_1EA603938;
  v3 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v2, "objectForKey:onCacheMiss:", v3, v5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;

}

uint64_t __80__CNUIPRLikenessLoadingPlaceholderProvider__cnui_roundedRectImageForSize_scale___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderRoundedRectImageForSize:scale:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (id)_cnui_likenessForSize:(CGSize)a3 scale:(double)a4
{
  CGImage *v4;

  v4 = -[CNUIPRLikenessLoadingPlaceholderProvider _cnui_circularImageForSize:scale:](self, "_cnui_circularImageForSize:scale:", a3.width, a3.height, a4);
  return (id)objc_msgSend(MEMORY[0x1E0D70A68], "photoWithScope:image:", 2, v4);
}

- (unint64_t)_cnui_likenessType
{
  return 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_resourceLock, 0);
}

@end
