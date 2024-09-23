@implementation CNUIPlaceholderProviderFactory

void __64__CNUIPlaceholderProviderFactory_placeholderProviderForContact___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CNUIPRLikenessPlaceholderProvider *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  CNUIPRLikenessPlaceholderProvider *v8;
  uint64_t v9;
  id v10;
  void *v11;

  if (objc_msgSend(*(id *)(a1 + 32), "isKeyAvailable:", *MEMORY[0x1E0C96898])
    && objc_msgSend(*(id *)(a1 + 32), "contactType") == 1)
  {
    v2 = a1 + 40;
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
    if (!v3)
    {
      v4 = -[CNUIPRLikenessPlaceholderProvider initWithContact:]([CNUIPRLikenessPlaceholderProvider alloc], "initWithContact:", *(_QWORD *)(a1 + 32));
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(void **)(v5 + 16);
      *(_QWORD *)(v5 + 16) = v4;
      v7 = 16;
LABEL_7:

      v3 = *(void **)(*(_QWORD *)v2 + v7);
    }
  }
  else
  {
    v2 = a1 + 40;
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    if (!v3)
    {
      v8 = objc_alloc_init(CNUIPRLikenessPlaceholderProvider);
      v6 = *(void **)(*(_QWORD *)v2 + 8);
      *(_QWORD *)(*(_QWORD *)v2 + 8) = v8;
      v7 = 8;
      goto LABEL_7;
    }
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = v3;
  v11 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v10;

}

- (CNUIPRLikenessProvider)loadingPlaceholderProvider
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  -[CNUIPlaceholderProviderFactory highPriorityLock](self, "highPriorityLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__CNUIPlaceholderProviderFactory_loadingPlaceholderProvider__block_invoke;
  v6[3] = &unk_1EA6056A8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CNUIPRLikenessProvider *)v4;
}

- (CNScheduler)highPriorityLock
{
  return self->_highPriorityLock;
}

- (id)loadingGroupPlaceholderProviderWithBackgroundStyle:(unint64_t)a3
{
  void *v5;
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  -[CNUIPlaceholderProviderFactory highPriorityLock](self, "highPriorityLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__CNUIPlaceholderProviderFactory_loadingGroupPlaceholderProviderWithBackgroundStyle___block_invoke;
  v8[3] = &unk_1EA6056D0;
  v8[5] = &v9;
  v8[6] = a3;
  v8[4] = self;
  objc_msgSend(v5, "performBlock:", v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)placeholderProviderForContact:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  CNUIPlaceholderProviderFactory *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  -[CNUIPlaceholderProviderFactory resourceLock](self, "resourceLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__CNUIPlaceholderProviderFactory_placeholderProviderForContact___block_invoke;
  v9[3] = &unk_1EA603D98;
  v6 = v4;
  v10 = v6;
  v11 = self;
  v12 = &v13;
  objc_msgSend(v5, "performBlock:", v9);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

- (CNScheduler)resourceLock
{
  return self->_resourceLock;
}

- (CNUIPRLikenessProvider)placeholderProvider
{
  return (CNUIPRLikenessProvider *)-[CNUIPlaceholderProviderFactory placeholderProviderForContact:](self, "placeholderProviderForContact:", 0);
}

void __85__CNUIPlaceholderProviderFactory_loadingGroupPlaceholderProviderWithBackgroundStyle___block_invoke(_QWORD *a1)
{
  void *v2;
  CNUIPRLikenessLoadingGroupPlaceholderProvider *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(a1[4] + 32);
  if (!v2)
  {
    v3 = -[CNUIPRLikenessLoadingGroupPlaceholderProvider initWithBackgroundStyle:]([CNUIPRLikenessLoadingGroupPlaceholderProvider alloc], "initWithBackgroundStyle:", a1[6]);
    v4 = a1[4];
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

    v2 = *(void **)(a1[4] + 32);
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v2);
}

void __60__CNUIPlaceholderProviderFactory_loadingPlaceholderProvider__block_invoke(uint64_t a1)
{
  void *v2;
  CNUIPRLikenessLoadingPlaceholderProvider *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    v3 = objc_alloc_init(CNUIPRLikenessLoadingPlaceholderProvider);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

- (CNUIPlaceholderProviderFactory)init
{
  CNUIPlaceholderProviderFactory *v2;
  uint64_t v3;
  CNScheduler *resourceLock;
  uint64_t v5;
  CNScheduler *highPriorityLock;
  CNUIPlaceholderProviderFactory *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNUIPlaceholderProviderFactory;
  v2 = -[CNUIPlaceholderProviderFactory init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D13B68], "synchronousSerialDispatchQueueWithName:", CFSTR("com.apple.contacts.ContactsUICore.CNUIPlaceholderProviderFactory"));
    v3 = objc_claimAutoreleasedReturnValue();
    resourceLock = v2->_resourceLock;
    v2->_resourceLock = (CNScheduler *)v3;

    objc_msgSend(MEMORY[0x1E0D13B68], "synchronousSerialDispatchQueueWithName:", CFSTR("com.apple.contacts.ContactsUICore.CNUIPlaceholderProviderFactory.HighPriority"));
    v5 = objc_claimAutoreleasedReturnValue();
    highPriorityLock = v2->_highPriorityLock;
    v2->_highPriorityLock = (CNScheduler *)v5;

    v7 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highPriorityLock, 0);
  objc_storeStrong((id *)&self->_resourceLock, 0);
  objc_storeStrong((id *)&self->_loadingGroupPlaceholderProvider, 0);
  objc_storeStrong((id *)&self->_loadingPlaceholderProvider, 0);
  objc_storeStrong((id *)&self->_organizationPlaceholderProvider, 0);
  objc_storeStrong((id *)&self->_placeholderProvider, 0);
}

- (void)setResourceLock:(id)a3
{
  objc_storeStrong((id *)&self->_resourceLock, a3);
}

- (void)setHighPriorityLock:(id)a3
{
  objc_storeStrong((id *)&self->_highPriorityLock, a3);
}

- (CNUIPRLikenessProvider)loadingGroupPlaceholderProvider
{
  return (CNUIPRLikenessProvider *)objc_getProperty(self, a2, 32, 1);
}

@end
