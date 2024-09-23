@implementation AMSLookupResult

- (AMSLookupResult)initWithResult:(id)a3 dictionary:(id)a4
{
  id v6;
  id v7;
  AMSLookupResult *v8;
  AMSLookupResult *v9;
  AMSLookupResult *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)AMSLookupResult;
    v8 = -[AMSURLResult initWithResult:](&v12, sel_initWithResult_, v6);
    v9 = v8;
    if (v8)
      objc_storeStrong((id *)&v8->_response, a4);
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSArray)allItems
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__AMSLookupResult_allItems__block_invoke;
  v6[3] = &unk_1E2542A00;
  v4 = v3;
  v7 = v4;
  -[AMSLookupResult _enumerateItemsWithBlock:](self, "_enumerateItemsWithBlock:", v6);

  return (NSArray *)v4;
}

uint64_t __27__AMSLookupResult_allItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)appStoreURLWithReason:(int64_t)a3 initialIndex:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[AMSLookupResult allItems](self, "allItems", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "productPageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)itemForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AMSLookupItem *v7;

  v4 = a3;
  -[NSDictionary objectForKey:](self->_response, "objectForKey:", CFSTR("results"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = -[AMSLookupItem initWithLookupDictionary:]([AMSLookupItem alloc], "initWithLookupDictionary:", v6);
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)valueForProperty:(id)a3
{
  return -[NSDictionary objectForKey:](self->_response, "objectForKey:", a3);
}

- (void)_enumerateItemsWithBlock:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _QWORD v9[4];

  v4 = a3;
  -[NSDictionary objectForKey:](self->_response, "objectForKey:", CFSTR("results"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v9[3] = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __44__AMSLookupResult__enumerateItemsWithBlock___block_invoke;
    v6[3] = &unk_1E2542A30;
    v7 = v4;
    v8 = v9;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);

    _Block_object_dispose(v9, 8);
  }

}

void __44__AMSLookupResult__enumerateItemsWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  AMSLookupItem *v5;
  AMSLookupItem *v6;

  v4 = a3;
  v6 = -[AMSLookupItem initWithLookupDictionary:]([AMSLookupItem alloc], "initWithLookupDictionary:", v4);

  v5 = v6;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v5 = v6;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }

}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

@end
