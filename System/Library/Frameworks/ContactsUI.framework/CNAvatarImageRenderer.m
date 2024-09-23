@implementation CNAvatarImageRenderer

- (CNAvatarImageRenderer)init
{
  void *v3;
  CNAvatarImageRenderer *v4;

  +[CNAvatarImageRendererSettings defaultSettings](CNAvatarImageRendererSettings, "defaultSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNAvatarImageRenderer initWithSettings:](self, "initWithSettings:", v3);

  return v4;
}

- (CNAvatarImageRenderer)initWithSettings:(id)a3
{
  id v4;
  CNAvatarImageRenderer *v5;
  uint64_t v6;
  CNUIPRLikenessResolver *resolver;
  uint64_t v8;
  CNUILikenessRendering *renderer;
  uint64_t v10;
  CNSchedulerProvider *schedulerProvider;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNAvatarImageRenderer;
  v5 = -[CNAvatarImageRenderer init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "likenessResolver");
    v6 = objc_claimAutoreleasedReturnValue();
    resolver = v5->_resolver;
    v5->_resolver = (CNUIPRLikenessResolver *)v6;

    objc_msgSend(v4, "likenessRenderer");
    v8 = objc_claimAutoreleasedReturnValue();
    renderer = v5->_renderer;
    v5->_renderer = (CNUILikenessRendering *)v8;

    objc_msgSend(v4, "schedulerProvider");
    v10 = objc_claimAutoreleasedReturnValue();
    schedulerProvider = v5->_schedulerProvider;
    v5->_schedulerProvider = (CNSchedulerProvider *)v10;

  }
  return v5;
}

- (id)placeholderImageProvider
{
  _CNAvatarImageProvider *v3;
  void *v4;
  void *v5;
  void *v6;
  _CNAvatarImageProvider *v7;

  v3 = [_CNAvatarImageProvider alloc];
  -[CNAvatarImageRenderer resolver](self, "resolver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placeholderProviderFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placeholderProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_CNAvatarImageProvider initWithLikenessProvider:](v3, "initWithLikenessProvider:", v6);

  return v7;
}

- (CNUIPRLikenessResolver)resolver
{
  return self->_resolver;
}

void __65__CNAvatarImageRenderer_avatarImageForContacts_withBadges_scope___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)avatarImageForContacts:(id)a3 scope:(id)a4
{
  return -[CNAvatarImageRenderer avatarImageForContacts:withBadges:scope:](self, "avatarImageForContacts:withBadges:scope:", a3, MEMORY[0x1E0C9AA60], a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
}

- (id)runScopeBasedImageObservable:(id)a3 scope:(id)a4 imageHandler:(id)a5
{
  void (**v7)(id, void *);
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v7 = (void (**)(id, void *))a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(v8, "conformsToProtocol:", &unk_1EE068BB8) & 1) != 0)
  {
    objc_msgSend(v8, "likenessRenderingScope");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D13AF0], "observerWithResultBlock:completionBlock:failureBlock:", v9, 0, &__block_literal_global_68);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subscribe:", v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("scope argument is invalid"));
    v13 = objc_alloc_init(MEMORY[0x1E0D139B8]);
  }

  return v13;
}

uint64_t __106__CNAvatarImageRenderer_renderAvatarsForContacts_withBadges_scope_placeholder_workScheduler_imageHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderedLikenessesForContacts:withBadges:scope:placeholder:workScheduler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

- (id)renderedLikenessesForContacts:(id)a3 withBadges:(id)a4 scope:(id)a5 placeholder:(BOOL)a6 workScheduler:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSObject *v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v8 = a6;
  v28 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a7;
  v15 = a4;
  -[CNAvatarImageRenderer renderer](self, "renderer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "renderedLikenessesForContacts:withBadges:scope:workScheduler:", v12, v15, v13, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "subscribeOn:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CNAvatarImageRenderer renderer](self, "renderer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "loadingPlaceholderForContactCount:scope:", objc_msgSend(v12, "count"), v13);
    v20 = objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v25 = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "startWith:", v21);
      v22 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v22;
    }
    else
    {
      CNUILogAvatarView();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v13;
        _os_log_error_impl(&dword_18AC56000, v20, OS_LOG_TYPE_ERROR, "Loading placeholder is nil for scope: %@", buf, 0xCu);
      }
    }

  }
  v23 = v18;

  return v23;
}

- (CNUILikenessRendering)renderer
{
  return self->_renderer;
}

- (id)avatarImageForContacts:(id)a3 withBadges:(id)a4 scope:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CNAvatarImageRenderer schedulerProvider](self, "schedulerProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "immediateScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__20818;
  v21 = __Block_byref_object_dispose__20819;
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__CNAvatarImageRenderer_avatarImageForContacts_withBadges_scope___block_invoke;
  v16[3] = &unk_1E204A210;
  v16[4] = &v17;
  -[CNAvatarImageRenderer renderAvatarsForContacts:withBadges:scope:placeholder:workScheduler:imageHandler:](self, "renderAvatarsForContacts:withBadges:scope:placeholder:workScheduler:imageHandler:", v8, v9, v10, 0, v12, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cancel");
  v14 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v14;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (id)renderAvatarsForContacts:(id)a3 withBadges:(id)a4 scope:(id)a5 placeholder:(BOOL)a6 workScheduler:(id)a7 imageHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  BOOL v26;

  v14 = a3;
  v15 = a4;
  v16 = a7;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __106__CNAvatarImageRenderer_renderAvatarsForContacts_withBadges_scope_placeholder_workScheduler_imageHandler___block_invoke;
  v22[3] = &unk_1E204A238;
  v22[4] = self;
  v23 = v14;
  v26 = a6;
  v24 = v15;
  v25 = v16;
  v17 = v16;
  v18 = v15;
  v19 = v14;
  -[CNAvatarImageRenderer runScopeBasedImageObservable:scope:imageHandler:](self, "runScopeBasedImageObservable:scope:imageHandler:", v22, a5, a8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)renderAvatarsForContacts:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = a3;
  -[CNAvatarImageRenderer resolver](self, "resolver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarImageRenderer schedulerProvider](self, "schedulerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backgroundScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__CNAvatarImageRenderer_renderAvatarsForContacts_handler___block_invoke;
  v14[3] = &unk_1E204B5E8;
  v15 = v6;
  v11 = v6;
  objc_msgSend(v8, "resolveLikenessesForContacts:workScheduler:withContentHandler:", v7, v10, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)renderMonogramForString:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v6 = a4;
  v7 = a3;
  -[CNAvatarImageRenderer resolver](self, "resolver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13AE8], "observableWithResult:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "basicMonogramObservableFromString:color:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAvatarImageRenderer schedulerProvider](self, "schedulerProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "backgroundScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subscribeOn:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D13AF0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __57__CNAvatarImageRenderer_renderMonogramForString_handler___block_invoke;
  v19[3] = &unk_1E204A1E8;
  v20 = v6;
  v15 = v6;
  objc_msgSend(v14, "observerWithResultBlock:", v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "subscribe:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)renderAvatarsForContacts:(id)a3 scope:(id)a4 imageHandler:(id)a5
{
  return -[CNAvatarImageRenderer renderAvatarsForContacts:withBadges:scope:includePlaceholder:imageHandler:](self, "renderAvatarsForContacts:withBadges:scope:includePlaceholder:imageHandler:", a3, 0, a4, 1, a5);
}

- (id)renderAvatarsForContacts:(id)a3 withBadges:(id)a4 scope:(id)a5 imageHandler:(id)a6
{
  return -[CNAvatarImageRenderer renderAvatarsForContacts:withBadges:scope:includePlaceholder:imageHandler:](self, "renderAvatarsForContacts:withBadges:scope:includePlaceholder:imageHandler:", a3, a4, a5, 1, a6);
}

- (id)renderAvatarsForContacts:(id)a3 scope:(id)a4 includePlaceholder:(BOOL)a5 imageHandler:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[CNAvatarImageRenderer schedulerProvider](self, "schedulerProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "backgroundScheduler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarImageRenderer renderAvatarsForContacts:withBadges:scope:placeholder:workScheduler:imageHandler:](self, "renderAvatarsForContacts:withBadges:scope:placeholder:workScheduler:imageHandler:", v12, 0, v11, v6, v14, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)renderAvatarsForContacts:(id)a3 withBadges:(id)a4 scope:(id)a5 includePlaceholder:(BOOL)a6 imageHandler:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[CNAvatarImageRenderer schedulerProvider](self, "schedulerProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "backgroundScheduler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarImageRenderer renderAvatarsForContacts:withBadges:scope:placeholder:workScheduler:imageHandler:](self, "renderAvatarsForContacts:withBadges:scope:placeholder:workScheduler:imageHandler:", v15, v14, v13, v7, v17, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)renderMonogramForString:(id)a3 scope:(id)a4 imageHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v8 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__CNAvatarImageRenderer_renderMonogramForString_scope_imageHandler___block_invoke;
  v12[3] = &unk_1E204A260;
  v12[4] = self;
  v13 = v8;
  v9 = v8;
  -[CNAvatarImageRenderer runScopeBasedImageObservable:scope:imageHandler:](self, "runScopeBasedImageObservable:scope:imageHandler:", v12, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)renderedMonogramObservableForString:(id)a3 scope:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  -[CNAvatarImageRenderer renderer](self, "renderer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13AE8], "observableWithResult:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "renderedBasicMonogramFromString:scope:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAvatarImageRenderer schedulerProvider](self, "schedulerProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "backgroundScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subscribeOn:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)imageForAvatarAccessoryView:(id)a3 scope:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  -[CNAvatarImageRenderer schedulerProvider](self, "schedulerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "immediateScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__20818;
  v24 = __Block_byref_object_dispose__20819;
  v10 = MEMORY[0x1E0C809B0];
  v25 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__CNAvatarImageRenderer_imageForAvatarAccessoryView_scope___block_invoke;
  v17[3] = &unk_1E204A2A8;
  v17[4] = self;
  v11 = v6;
  v18 = v11;
  v12 = v9;
  v19 = v12;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __59__CNAvatarImageRenderer_imageForAvatarAccessoryView_scope___block_invoke_2;
  v16[3] = &unk_1E204A210;
  v16[4] = &v20;
  -[CNAvatarImageRenderer runScopeBasedImageObservable:scope:imageHandler:](self, "runScopeBasedImageObservable:scope:imageHandler:", v17, v7, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cancel");
  v14 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v14;
}

- (id)loadingPlaceholderImageProvider
{
  _CNAvatarImageProvider *v3;
  void *v4;
  void *v5;
  void *v6;
  _CNAvatarImageProvider *v7;

  v3 = [_CNAvatarImageProvider alloc];
  -[CNAvatarImageRenderer resolver](self, "resolver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placeholderProviderFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadingPlaceholderProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_CNAvatarImageProvider initWithLikenessProvider:](v3, "initWithLikenessProvider:", v6);

  return v7;
}

- (id)renderMonogramForString:(id)a3 color:(id)a4 scope:(id)a5 prohibitedSources:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v10 = a4;
  v11 = a3;
  objc_msgSend(a5, "likenessRenderingScope");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarImageRenderer renderer](self, "renderer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "renderedBasicMonogramForString:color:scope:prohibitedSources:", v11, v10, v12, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)renderMonogramForContact:(id)a3 color:(id)a4 scope:(id)a5 prohibitedSources:(int64_t)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = (void *)MEMORY[0x1E0C97218];
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "stringFromContact:style:", a3, 1002);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarImageRenderer renderMonogramForString:color:scope:prohibitedSources:](self, "renderMonogramForString:color:scope:prohibitedSources:", v13, v12, v11, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __59__CNAvatarImageRenderer_imageForAvatarAccessoryView_scope___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "renderer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "renderedLikenessForBadge:scope:workScheduler:", a1[5], v4, a1[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "subscribeOn:", a1[6]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __59__CNAvatarImageRenderer_imageForAvatarAccessoryView_scope___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __68__CNAvatarImageRenderer_renderMonogramForString_scope_imageHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderedMonogramObservableForString:scope:", *(_QWORD *)(a1 + 40), a2);
}

void __57__CNAvatarImageRenderer_renderMonogramForString_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _CNAvatarImageProvider *v4;

  v3 = a2;
  v4 = -[_CNAvatarImageProvider initWithLikenessProvider:]([_CNAvatarImageProvider alloc], "initWithLikenessProvider:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__CNAvatarImageRenderer_renderAvatarsForContacts_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "_cn_map:", &__block_literal_global_20831);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

_CNAvatarImageProvider *__58__CNAvatarImageRenderer_renderAvatarsForContacts_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _CNAvatarImageProvider *v3;

  v2 = a2;
  v3 = -[_CNAvatarImageProvider initWithLikenessProvider:]([_CNAvatarImageProvider alloc], "initWithLikenessProvider:", v2);

  return v3;
}

+ (id)descriptorForRequiredKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0D13D50], "descriptorForRequiredKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNAvatarImageRenderer descriptorForRequiredKeys]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
