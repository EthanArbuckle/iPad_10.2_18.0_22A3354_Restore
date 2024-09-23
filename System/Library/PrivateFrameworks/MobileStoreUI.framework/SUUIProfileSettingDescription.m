@implementation SUUIProfileSettingDescription

- (SUUIProfileSettingDescription)initWithViewElement:(id)a3 parent:(id)a4
{
  SUUIProfileSettingDescription *v4;
  NSOperationQueue *v5;
  NSOperationQueue *operationQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIProfileSettingDescription;
  v4 = -[SUUISettingDescription initWithViewElement:parent:](&v8, sel_initWithViewElement_parent_, a3, a4);
  if (v4)
  {
    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    operationQueue = v4->_operationQueue;
    v4->_operationQueue = v5;

    -[NSOperationQueue setQualityOfService:](v4->_operationQueue, "setQualityOfService:", 25);
    -[NSOperationQueue setName:](v4->_operationQueue, "setName:", CFSTR("com.apple.iTunesStoreUI.SUUIProfileSettingDescription"));
    -[SUUIProfileSettingDescription reloadData](v4, "reloadData");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[NSOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
  v3.receiver = self;
  v3.super_class = (Class)SUUIProfileSettingDescription;
  -[SUUIProfileSettingDescription dealloc](&v3, sel_dealloc);
}

- (void)reloadData
{
  -[NSOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
  -[SUUIProfileSettingDescription _fetchAccountInfo](self, "_fetchAccountInfo");
  -[SUUIProfileSettingDescription _fetchProfilePhoto](self, "_fetchProfilePhoto");
}

+ (Class)_viewClassForSettingDescription:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)_fetchAccountInfo
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  +[SUUIMediaSocialProfileCoordinator sharedCoordinator](SUUIMediaSocialProfileCoordinator, "sharedCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__SUUIProfileSettingDescription__fetchAccountInfo__block_invoke;
  v4[3] = &unk_2511FE118;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "getProfileWithOptions:profileBlock:", 0, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

void __50__SUUIProfileSettingDescription__fetchAccountInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__SUUIProfileSettingDescription__fetchAccountInfo__block_invoke_2;
  v5[3] = &unk_2511F6220;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void __50__SUUIProfileSettingDescription__fetchAccountInfo__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD *v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  if (v3)
    v4 = WeakRetained == 0;
  else
    v4 = 1;
  if (!v4)
  {
    v10 = WeakRetained;
    objc_msgSend(v3, "name");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v10[5];
    v10[5] = v5;

    objc_msgSend(*(id *)(a1 + 32), "handle");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v10[4];
    v10[4] = v7;

    objc_msgSend(v10, "parent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadSettingDescription:", v10);

    WeakRetained = v10;
  }

}

- (void)_fetchProfilePhoto
{
  void *v3;
  void *v4;
  SUUIMediaSocialLoadProfilePhotoOperation *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *, char);
  void *v9;
  id v10;
  id location;

  -[SUUISettingDescription parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SUUIMediaSocialLoadProfilePhotoOperation initWithClientContext:]([SUUIMediaSocialLoadProfilePhotoOperation alloc], "initWithClientContext:", v4);
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __51__SUUIProfileSettingDescription__fetchProfilePhoto__block_invoke;
  v9 = &unk_2511FE140;
  objc_copyWeak(&v10, &location);
  -[SUUIMediaSocialLoadProfilePhotoOperation setOutputBlock:](v5, "setOutputBlock:", &v6);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v5, v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __51__SUUIProfileSettingDescription__fetchProfilePhoto__block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SUUIProfileSettingDescription__fetchProfilePhoto__block_invoke_2;
  block[3] = &unk_2511F7B40;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v10 = a3;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v9);
}

void __51__SUUIProfileSettingDescription__fetchProfilePhoto__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && (*(_BYTE *)(a1 + 48) || !WeakRetained[7]))
  {
    v4 = WeakRetained;
    objc_storeStrong(WeakRetained + 7, *(id *)(a1 + 32));
    objc_msgSend(v4, "parent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadSettingDescription:", v4);

    WeakRetained = v4;
  }

}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)name
{
  return self->_name;
}

- (UIImage)photo
{
  return self->_photo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
