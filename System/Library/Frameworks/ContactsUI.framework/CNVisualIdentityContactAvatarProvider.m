@implementation CNVisualIdentityContactAvatarProvider

- (CNVisualIdentityContactAvatarProvider)init
{
  return -[CNVisualIdentityContactAvatarProvider initWithSettings:](self, "initWithSettings:", 0);
}

- (CNVisualIdentityContactAvatarProvider)initWithSettings:(id)a3
{
  id v4;
  CNVisualIdentityContactAvatarProvider *v5;
  CNAvatarImageRendererSettings *v6;
  void *v7;
  CNAvatarImageRendererSettings *v8;
  void *v9;
  void *v10;
  void *v11;
  CNAvatarImageRenderer *v12;
  CNAvatarImageRenderer *avatarImageRenderer;
  CNVisualIdentityContactAvatarProvider *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNVisualIdentityContactAvatarProvider;
  v5 = -[CNVisualIdentityContactAvatarProvider init](&v16, sel_init);
  if (v5)
  {
    v6 = (CNAvatarImageRendererSettings *)v4;
    if (!v6)
    {
      +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = [CNAvatarImageRendererSettings alloc];
      objc_msgSend(v7, "cachingLikenessResolver");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cachingLikenessRenderer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "defaultSchedulerProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[CNAvatarImageRendererSettings initWithLikenessResolver:likenessRenderer:schedulerProvider:](v8, "initWithLikenessResolver:likenessRenderer:schedulerProvider:", v9, v10, v11);

    }
    v12 = -[CNAvatarImageRenderer initWithSettings:]([CNAvatarImageRenderer alloc], "initWithSettings:", v6);
    avatarImageRenderer = v5->_avatarImageRenderer;
    v5->_avatarImageRenderer = v12;

    v14 = v5;
  }

  return v5;
}

- (id)avatarImageForContact:(id)a3 withSize:(CGSize)a4 includePlaceholder:(BOOL)a5 imageHandler:(id)a6
{
  _BOOL8 v6;
  double height;
  double width;
  id v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[2];

  v6 = a5;
  height = a4.height;
  width = a4.width;
  v25[1] = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v12 = (void *)MEMORY[0x1E0DC3BF8];
  v13 = a3;
  objc_msgSend(v12, "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scale");
  v16 = v15;

  +[CNAvatarImageRenderingScope scopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:", 0, 0, 0, width, height, v16, 0.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityContactAvatarProvider avatarImageRenderer](self, "avatarImageRenderer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __104__CNVisualIdentityContactAvatarProvider_avatarImageForContact_withSize_includePlaceholder_imageHandler___block_invoke;
  v23[3] = &unk_1E204D070;
  v24 = v11;
  v20 = v11;
  objc_msgSend(v18, "renderAvatarsForContacts:scope:includePlaceholder:imageHandler:", v19, v17, v6, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)imageForAvatarAccessoryView:(id)a3 withSize:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  id v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;

  height = a4.height;
  width = a4.width;
  v7 = (void *)MEMORY[0x1E0DC3BF8];
  v8 = a3;
  objc_msgSend(v7, "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  +[CNAvatarImageRenderingScope scopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:", 0, 0, 0, width, height, v10, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNVisualIdentityContactAvatarProvider avatarImageRenderer](self, "avatarImageRenderer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageForAvatarAccessoryView:scope:", v8, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (CNAvatarImageRenderer)avatarImageRenderer
{
  return self->_avatarImageRenderer;
}

- (void)setAvatarImageRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_avatarImageRenderer, a3);
}

- (CNAvatarImageRenderingScope)renderingScope
{
  return self->_renderingScope;
}

- (void)setRenderingScope:(id)a3
{
  objc_storeStrong((id *)&self->_renderingScope, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderingScope, 0);
  objc_storeStrong((id *)&self->_avatarImageRenderer, 0);
}

uint64_t __104__CNVisualIdentityContactAvatarProvider_avatarImageForContact_withSize_includePlaceholder_imageHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1_41075 != -1)
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1_41075, &__block_literal_global_41076);
  return (id)descriptorForRequiredKeys_cn_once_object_1_41077;
}

void __66__CNVisualIdentityContactAvatarProvider_descriptorForRequiredKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C97200];
  +[CNAvatarImageRenderer descriptorForRequiredKeys](CNAvatarImageRenderer, "descriptorForRequiredKeys");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNVisualIdentityContactAvatarProvider descriptorForRequiredKeys]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "descriptorWithKeyDescriptors:description:", v2, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)descriptorForRequiredKeys_cn_once_object_1_41077;
  descriptorForRequiredKeys_cn_once_object_1_41077 = v4;

}

@end
