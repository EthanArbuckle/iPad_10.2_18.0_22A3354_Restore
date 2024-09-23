@implementation CRSFCardLoader

+ (id)sharedLoader
{
  if (sharedLoader_onceToken != -1)
    dispatch_once(&sharedLoader_onceToken, &__block_literal_global_1);
  return (id)sharedLoader_cardLoader;
}

void __30__CRSFCardLoader_sharedLoader__block_invoke()
{
  CRSFCardLoader *v0;
  void *v1;

  v0 = objc_alloc_init(CRSFCardLoader);
  v1 = (void *)sharedLoader_cardLoader;
  sharedLoader_cardLoader = (uint64_t)v0;

}

- (CRSFCardLoader)init
{
  CRSFCardLoader *v2;
  NSCache *v3;
  NSCache *loadedCards;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRSFCardLoader;
  v2 = -[CRSFCardLoader init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    loadedCards = v2->_loadedCards;
    v2->_loadedCards = v3;

  }
  return v2;
}

- (void)loadSFCard:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  id v10;
  void (**v11)(id, void *);
  id v12;
  id location;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  objc_msgSend(v6, "cardId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](self->_loadedCards, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v7)
      v7[2](v7, v9);
  }
  else
  {
    objc_initWeak(&location, self);
    objc_copyWeak(&v12, &location);
    v10 = v6;
    v11 = v7;
    SFResourceLoaderLoadCard();

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __40__CRSFCardLoader_loadSFCard_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  _QWORD block[4];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      NSLog(CFSTR("Card %@ failed to load: %@"), a1[4], v6);
    }
    else
    {
      v9 = (void *)*((_QWORD *)WeakRetained + 1);
      objc_msgSend(a1[4], "cardId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v5, v10);

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __40__CRSFCardLoader_loadSFCard_completion___block_invoke_2;
      block[3] = &unk_24DDD92B8;
      v13 = a1[5];
      v12 = v5;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }

}

uint64_t __40__CRSFCardLoader_loadSFCard_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedCards, 0);
}

@end
