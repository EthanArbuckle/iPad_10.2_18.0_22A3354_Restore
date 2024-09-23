@implementation MPStoreItemMetadataCacheKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontIdentifier, 0);
  objc_storeStrong((id *)&self->_enqueuerAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

void __77__MPStoreItemMetadataCacheKey__fastGetCacheKeyWithRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MPStoreItemMetadataCacheKey *v10;

  v10 = objc_alloc_init(MPStoreItemMetadataCacheKey);
  if (objc_msgSend(*(id *)(a1 + 32), "isPersonalized"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "DSID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPStoreItemMetadataCacheKey setAccountIdentifier:](v10, "setAccountIdentifier:", v2);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "DSID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPStoreItemMetadataCacheKey setEnqueuerAccountIdentifier:](v10, "setEnqueuerAccountIdentifier:", v3);

    -[MPStoreItemMetadataCacheKey setPersonalized:](v10, "setPersonalized:", 1);
  }
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v4 || (v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)) != 0)
  {
    objc_msgSend(v4, "storefrontIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localStoreAccountProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "storefrontIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v5 = v6;
  }
  MPStoreItemMetadataCacheableStorefrontForStorefront(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  -[MPStoreItemMetadataCacheKey setStorefrontIdentifier:](v10, "setStorefrontIdentifier:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __72__MPStoreItemMetadataCacheKey_getCacheKeyWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "_isGoodCacheKey"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 48), "_slowGetCacheKeyWithRequest:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)setStorefrontIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)_isGoodCacheKey
{
  NSUInteger v3;

  v3 = -[NSString length](self->_storefrontIdentifier, "length");
  if (v3)
    LOBYTE(v3) = !self->_personalized || self->_accountIdentifier || self->_enqueuerAccountIdentifier != 0;
  return v3;
}

void __77__MPStoreItemMetadataCacheKey__fastGetCacheKeyWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

+ (void)getCacheKeyWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__MPStoreItemMetadataCacheKey_getCacheKeyWithRequest_completionHandler___block_invoke;
  v10[3] = &unk_1E315F3F0;
  v12 = v7;
  v13 = a1;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend(a1, "_fastGetCacheKeyWithRequest:completionHandler:", v8, v10);

}

+ (void)_fastGetCacheKeyWithRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD v21[6];
  _QWORD v22[6];
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;

  v5 = a3;
  v6 = a4;
  v7 = dispatch_group_create();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create("com.apple.MediaPlayer.MPStoreItemMetadataCacheKey", v8);

  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__42185;
  v25[4] = __Block_byref_object_dispose__42186;
  v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__42185;
  v23[4] = __Block_byref_object_dispose__42186;
  v24 = 0;
  objc_msgSend(v5, "userIdentityStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    objc_msgSend(v5, "userIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      dispatch_group_enter(v7);
      v22[0] = v11;
      v22[1] = 3221225472;
      v22[2] = __77__MPStoreItemMetadataCacheKey__fastGetCacheKeyWithRequest_completionHandler___block_invoke;
      v22[3] = &unk_1E315F418;
      v22[4] = v7;
      v22[5] = v23;
      objc_msgSend(v10, "getPropertiesForUserIdentity:completionHandler:", v12, v22);
    }
    objc_msgSend(v5, "delegatedUserIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      dispatch_group_enter(v7);
      v21[0] = v11;
      v21[1] = 3221225472;
      v21[2] = __77__MPStoreItemMetadataCacheKey__fastGetCacheKeyWithRequest_completionHandler___block_invoke_2;
      v21[3] = &unk_1E315F418;
      v21[4] = v7;
      v21[5] = v25;
      objc_msgSend(v10, "getPropertiesForUserIdentity:completionHandler:", v13, v21);
    }

  }
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __77__MPStoreItemMetadataCacheKey__fastGetCacheKeyWithRequest_completionHandler___block_invoke_3;
  block[3] = &unk_1E315F440;
  v19 = v23;
  v20 = v25;
  v17 = v5;
  v18 = v6;
  v14 = v6;
  v15 = v5;
  dispatch_group_notify(v7, v9, block);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  _BOOL8 personalized;

  v3 = -[NSNumber hash](self->_accountIdentifier, "hash");
  v4 = -[NSNumber hash](self->_enqueuerAccountIdentifier, "hash") ^ v3;
  personalized = self->_personalized;
  return v4 ^ personalized ^ -[NSString hash](self->_storefrontIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  MPStoreItemMetadataCacheKey *v4;
  NSNumber *accountIdentifier;
  NSNumber *v6;
  char v7;
  NSNumber *enqueuerAccountIdentifier;
  NSNumber *v9;
  NSString *storefrontIdentifier;
  NSString *v11;

  v4 = (MPStoreItemMetadataCacheKey *)a3;
  if (self == v4)
    goto LABEL_17;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_personalized != v4->_personalized)
    goto LABEL_16;
  accountIdentifier = self->_accountIdentifier;
  v6 = v4->_accountIdentifier;
  if (accountIdentifier != v6)
  {
    v7 = 0;
    if (!accountIdentifier || !v6)
      goto LABEL_18;
    if (!-[NSNumber isEqualToNumber:](accountIdentifier, "isEqualToNumber:"))
      goto LABEL_16;
  }
  enqueuerAccountIdentifier = self->_enqueuerAccountIdentifier;
  v9 = v4->_enqueuerAccountIdentifier;
  if (enqueuerAccountIdentifier != v9)
  {
    v7 = 0;
    if (!enqueuerAccountIdentifier || !v9)
      goto LABEL_18;
    if (!-[NSNumber isEqualToNumber:](enqueuerAccountIdentifier, "isEqualToNumber:"))
    {
LABEL_16:
      v7 = 0;
      goto LABEL_18;
    }
  }
  storefrontIdentifier = self->_storefrontIdentifier;
  v11 = v4->_storefrontIdentifier;
  if (storefrontIdentifier == v11)
  {
LABEL_17:
    v7 = 1;
    goto LABEL_18;
  }
  v7 = 0;
  if (storefrontIdentifier && v11)
    v7 = -[NSString isEqualToString:](storefrontIdentifier, "isEqualToString:");
LABEL_18:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[NSNumber copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
    v7 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v6;

    v8 = -[NSNumber copyWithZone:](self->_enqueuerAccountIdentifier, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v8;

    *(_BYTE *)(v5 + 8) = self->_personalized;
    v10 = -[NSString copyWithZone:](self->_storefrontIdentifier, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v10;

  }
  return (id)v5;
}

- (MPStoreItemMetadataCacheKey)initWithRequest:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  MPStoreItemMetadataCacheKey *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *storefrontIdentifier;
  uint64_t v13;
  NSNumber *accountIdentifier;
  uint64_t v15;
  NSNumber *enqueuerAccountIdentifier;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MPStoreItemMetadataCacheKey;
  v8 = -[MPStoreItemMetadataCacheKey init](&v18, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "storefrontIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      MPStoreItemMetadataCacheableStorefrontForStorefront(v9);
      v11 = objc_claimAutoreleasedReturnValue();
      storefrontIdentifier = v8->_storefrontIdentifier;
      v8->_storefrontIdentifier = (NSString *)v11;

    }
    if (objc_msgSend(v6, "isPersonalized"))
    {
      objc_msgSend(v7, "accountIdentifier");
      v13 = objc_claimAutoreleasedReturnValue();
      accountIdentifier = v8->_accountIdentifier;
      v8->_accountIdentifier = (NSNumber *)v13;

      objc_msgSend(v7, "enqueuerAccountIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      enqueuerAccountIdentifier = v8->_enqueuerAccountIdentifier;
      v8->_enqueuerAccountIdentifier = (NSNumber *)v15;

      v8->_personalized = 1;
    }

  }
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)MPStoreItemMetadataCacheKey;
  -[MPStoreItemMetadataCacheKey description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [Account: %@, Enqueuer: %@, Personalized? %d, Storefront: %@]"), v4, self->_accountIdentifier, self->_enqueuerAccountIdentifier, self->_personalized, self->_storefrontIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)enqueuerAccountIdentifier
{
  return self->_enqueuerAccountIdentifier;
}

- (void)setEnqueuerAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isPersonalized
{
  return self->_personalized;
}

- (void)setPersonalized:(BOOL)a3
{
  self->_personalized = a3;
}

- (NSString)storefrontIdentifier
{
  return self->_storefrontIdentifier;
}

+ (void)_slowGetCacheKeyWithRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", CFSTR("https:///"));
  v8 = objc_alloc(MEMORY[0x1E0DDC0A0]);
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __77__MPStoreItemMetadataCacheKey__slowGetCacheKeyWithRequest_completionHandler___block_invoke;
  v18[3] = &unk_1E315F468;
  v10 = v5;
  v19 = v10;
  v11 = (void *)objc_msgSend(v8, "initWithBlock:", v18);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC0A8]), "initWithURL:requestContext:", v7, v11);
  objc_msgSend(v12, "setAnisetteVersion:", 0);
  objc_msgSend(v12, "setShouldUseMescalSigning:", 0);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __77__MPStoreItemMetadataCacheKey__slowGetCacheKeyWithRequest_completionHandler___block_invoke_2;
  v15[3] = &unk_1E315F490;
  v16 = v10;
  v17 = v6;
  v13 = v6;
  v14 = v10;
  objc_msgSend(v12, "buildURLRequestWithCompletionHandler:", v15);

}

void __77__MPStoreItemMetadataCacheKey__slowGetCacheKeyWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegatedUserIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v6, "setDelegatedIdentity:", v3);
  objc_msgSend(*(id *)(a1 + 32), "userIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v6, "setIdentity:", v4);
  objc_msgSend(*(id *)(a1 + 32), "userIdentityStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v6, "setIdentityStore:", v5);

}

void __77__MPStoreItemMetadataCacheKey__slowGetCacheKeyWithRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  MPStoreItemMetadataCacheKey *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v3 = objc_alloc_init(MPStoreItemMetadataCacheKey);
  v4 = objc_msgSend(*(id *)(a1 + 32), "isPersonalized");
  v5 = v13;
  if (v4)
  {
    objc_msgSend(v13, "ic_valueForHTTPHeaderField:", *MEMORY[0x1E0DDBDF0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", objc_msgSend(v6, "longLongValue"));
      -[MPStoreItemMetadataCacheKey setAccountIdentifier:](v3, "setAccountIdentifier:", v7);

    }
    objc_msgSend(v13, "ic_valueForHTTPHeaderField:", *MEMORY[0x1E0DDBDF8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", objc_msgSend(v8, "longLongValue"));
      -[MPStoreItemMetadataCacheKey setAccountIdentifier:](v3, "setAccountIdentifier:", v9);

    }
    -[MPStoreItemMetadataCacheKey setPersonalized:](v3, "setPersonalized:", 1);

    v5 = v13;
  }
  objc_msgSend(v5, "ic_valueForHTTPHeaderField:", *MEMORY[0x1E0DDBDE8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    MPStoreItemMetadataCacheableStorefrontForStorefront(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPStoreItemMetadataCacheKey setStorefrontIdentifier:](v3, "setStorefrontIdentifier:", v12);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __77__MPStoreItemMetadataCacheKey__fastGetCacheKeyWithRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "isDelegated"))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

@end
