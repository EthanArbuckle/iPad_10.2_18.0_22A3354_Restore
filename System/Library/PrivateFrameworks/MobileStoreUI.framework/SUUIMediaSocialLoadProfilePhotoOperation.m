@implementation SUUIMediaSocialLoadProfilePhotoOperation

- (SUUIMediaSocialLoadProfilePhotoOperation)initWithClientContext:(id)a3
{
  id v5;
  SUUIMediaSocialLoadProfilePhotoOperation *v6;
  SUUIMediaSocialLoadProfilePhotoOperation *v7;
  NSLock *v8;
  NSLock *lock;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUIMediaSocialLoadProfilePhotoOperation;
  v6 = -[SSVOperation init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v7->_lock;
    v7->_lock = v8;

    -[NSLock setName:](v7->_lock, "setName:", CFSTR("com.apple.MediaSocial.loadProfilePhoto"));
  }

  return v7;
}

- (id)outputBlock
{
  void *v3;
  void *v4;

  -[NSLock lock](self->_lock, "lock");
  v3 = (void *)objc_msgSend(self->_outputBlock, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  v4 = _Block_copy(v3);

  return v4;
}

- (void)setOutputBlock:(id)a3
{
  void *v4;
  id outputBlock;
  id v6;

  v6 = a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_outputBlock != v6)
  {
    v4 = (void *)objc_msgSend(v6, "copy");
    outputBlock = self->_outputBlock;
    self->_outputBlock = v4;

  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)main
{
  void *v3;

  -[SUUIMediaSocialLoadProfilePhotoOperation _silhouette](self, "_silhouette");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIMediaSocialLoadProfilePhotoOperation _returnPhoto:isFinal:](self, "_returnPhoto:isFinal:", v3, 0);

  -[SUUIMediaSocialLoadProfilePhotoOperation _fetchProfile](self, "_fetchProfile");
}

- (void)_fetchMonogram
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SUUIMediaSocialProfile name](self->_profile, "name");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = SUUIContactsUIFramework();
    v4 = (void *)objc_msgSend(objc_alloc((Class)SUUIWeakLinkedClassForString(CFSTR("CNMonogrammer"), v3)), "initWithStyle:diameter:", 0, 57.0);
    objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(" "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    if (!v6)
      goto LABEL_8;
    if (v6 == 1)
    {
      objc_msgSend(v5, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "monogramForPersonWithFirstName:lastName:", v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "monogramForPersonWithFirstName:lastName:", v7, v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!v8)
    {
LABEL_8:
      -[SUUIMediaSocialLoadProfilePhotoOperation _silhouette](self, "_silhouette");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SUUIMediaSocialLoadProfilePhotoOperation _returnPhoto:isFinal:](self, "_returnPhoto:isFinal:", v8, 1);

  }
  else
  {
    -[SUUIMediaSocialLoadProfilePhotoOperation _silhouette](self, "_silhouette");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMediaSocialLoadProfilePhotoOperation _returnPhoto:isFinal:](self, "_returnPhoto:isFinal:", v4, 1);
  }

}

- (void)_fetchPhoto
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id location;

  -[SUUIMediaSocialProfile profileImageURL](self->_profile, "profileImageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2040]), "initWithURL:", v3);
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __55__SUUIMediaSocialLoadProfilePhotoOperation__fetchPhoto__block_invoke;
    v5[3] = &unk_2511F7640;
    objc_copyWeak(&v6, &location);
    v5[4] = self;
    objc_msgSend(v4, "setOutputBlock:", v5);
    -[SSVOperation runChildOperation:](self, "runChildOperation:", v4);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);

  }
  else
  {
    -[SUUIMediaSocialLoadProfilePhotoOperation _fetchMonogram](self, "_fetchMonogram");
  }

}

void __55__SUUIMediaSocialLoadProfilePhotoOperation__fetchPhoto__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  SUUIStyledImageDataConsumer *v8;
  void *v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (a3)
  {
    objc_msgSend(WeakRetained, "_fetchMonogram");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SUUIStyledImageDataConsumer initWithSize:treatment:]([SUUIStyledImageDataConsumer alloc], "initWithSize:treatment:", 10, 56.0, 56.0);
    -[SUUIStyledImageDataConsumer imageForImage:](v8, "imageForImage:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v6, "_returnPhoto:isFinal:", v9, 1);
    else
      objc_msgSend(*(id *)(a1 + 32), "_fetchMonogram");

  }
}

- (void)_fetchProfile
{
  void *v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  _QWORD v6[5];
  NSObject *v7;
  id v8;
  id location;

  +[SUUIMediaSocialProfileCoordinator sharedCoordinator](SUUIMediaSocialProfileCoordinator, "sharedCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__SUUIMediaSocialLoadProfilePhotoOperation__fetchProfile__block_invoke;
  v6[3] = &unk_2511F7668;
  objc_copyWeak(&v8, &location);
  v6[4] = self;
  v5 = v4;
  v7 = v5;
  objc_msgSend(v3, "getProfileWithOptions:profileBlock:", 0, v6);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __57__SUUIMediaSocialLoadProfilePhotoOperation__fetchProfile__block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v9 = WeakRetained;
    if (a4)
    {
      objc_msgSend(WeakRetained, "_silhouette");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_returnPhoto:isFinal:", v10, 1);

    }
    else
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 336), a2);
      objc_msgSend(v9, "_fetchPhoto");
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)_returnPhoto:(id)a3 isFinal:(BOOL)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  BOOL v12;

  v6 = a3;
  -[SUUIMediaSocialLoadProfilePhotoOperation outputBlock](self, "outputBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__SUUIMediaSocialLoadProfilePhotoOperation__returnPhoto_isFinal___block_invoke;
    block[3] = &unk_2511F7690;
    v11 = v7;
    v10 = v6;
    v12 = a4;
    dispatch_async(v8, block);

  }
}

uint64_t __65__SUUIMediaSocialLoadProfilePhotoOperation__returnPhoto_isFinal___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (id)_silhouette
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = SUUIContactsUIFramework();
  v3 = (void *)objc_msgSend(objc_alloc((Class)SUUIWeakLinkedClassForString(CFSTR("CNMonogrammer"), v2)), "initWithStyle:diameter:", 0, 57.0);
  objc_msgSend(v3, "silhouetteMonogram");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
