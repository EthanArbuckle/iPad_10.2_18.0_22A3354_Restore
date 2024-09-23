@implementation IMMomentSharePresentationCache

- (IMMomentSharePresentationCache)init
{
  abort();
}

- (IMMomentSharePresentationCache)initWithMomentShareCache:(id)a3
{
  id v5;
  IMMomentSharePresentationCache *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *cache;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IMMomentSharePresentationCache;
  v6 = -[IMMomentSharePresentationCache init](&v11, sel_init);
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cache = v6->_cache;
    v6->_cache = v7;

    objc_storeStrong((id *)&v6->_momentShareCache, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__momentShareCacheDidChange_, CFSTR("IMMomentShareCacheDidChangeNotification"), v6->_momentShareCache);

  }
  return v6;
}

- (id)statusPresentationForMomentShareURLString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[IMMomentSharePresentationCache registerMomentShareURLString:](self, "registerMomentShareURLString:", v4);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)registerMomentShareItemForMessage:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  IMCoreMomentShareURLForMessage(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
      -[IMMomentSharePresentationCache registerMomentShareURLString:](self, "registerMomentShareURLString:", v5);

    v4 = v6;
  }

}

- (void)registerMomentShareURLString:(id)a3
{
  id v4;
  void *v5;
  IMMomentShareCache *momentShareCache;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    momentShareCache = self->_momentShareCache;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_1A207E2EC;
    v7[3] = &unk_1E471FFD8;
    v7[4] = self;
    v8 = v4;
    -[IMMomentShareCache momentShareForURLString:completionHandler:](momentShareCache, "momentShareForURLString:completionHandler:", v8, v7);

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v7;

  if ((a4 & 0x1400C) != 0 && qword_1EE65C918 == (_QWORD)a5)
  {
    -[IMMomentSharePresentationCache delegate](self, "delegate", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "momentSharePresentationCacheDidChange:", self);

  }
}

- (void)_momentShareCacheDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  IMMomentSharePresentationCache *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IMMomentShareCacheNotificationURLStringsUserInfoKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[NSMutableDictionary allKeys](self->_cache, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1A207E668;
  v10[3] = &unk_1E4720000;
  v8 = v6;
  v11 = v8;
  v12 = self;
  v13 = &v14;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  if (*((_BYTE *)v15 + 24))
  {
    -[IMMomentSharePresentationCache delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "momentSharePresentationCacheDidChange:", self);

  }
  _Block_object_dispose(&v14, 8);

}

- (IMMomentSharePresentationCacheDelegate)delegate
{
  return (IMMomentSharePresentationCacheDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_momentShareCache, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
