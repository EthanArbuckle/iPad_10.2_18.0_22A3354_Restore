@implementation CNAvatarPosterCarouselFingerprintCache

- (CNAvatarPosterCarouselFingerprintCache)initWithCache:(id)a3 contactStore:(id)a4
{
  id v7;
  id v8;
  CNAvatarPosterCarouselFingerprintCache *v9;
  CNAvatarPosterCarouselFingerprintCache *v10;
  uint64_t v11;
  CNAvatarCacheChangeListener *changeHistoryListener;
  CNAvatarPosterCarouselFingerprintCache *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNAvatarPosterCarouselFingerprintCache;
  v9 = -[CNAvatarPosterCarouselFingerprintCache init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cache, a3);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D13C58]), "initWithContactStore:delegate:", v8, v10);
    changeHistoryListener = v10->_changeHistoryListener;
    v10->_changeHistoryListener = (CNAvatarCacheChangeListener *)v11;

    -[CNAvatarCacheChangeListener start](v10->_changeHistoryListener, "start");
    v13 = v10;
  }

  return v10;
}

- (void)setFingerprint:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CNAvatarPosterCarouselFingerprintCache cache](self, "cache");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (id)fingerprintForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNAvatarPosterCarouselFingerprintCache cache](self, "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)removeObjectForContact:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "cacheKeyForContact:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[CNAvatarPosterCarouselFingerprintCache removeObjectForCacheKey:](self, "removeObjectForCacheKey:", v5);
}

- (void)removeObjectForCacheKey:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) == 0)
  {
    -[CNAvatarPosterCarouselFingerprintCache cache](self, "cache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", 0, v5);

  }
}

- (void)invalidateFingerprintsForContactIdentifiers:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __86__CNAvatarPosterCarouselFingerprintCache_invalidateFingerprintsForContactIdentifiers___block_invoke;
  v3[3] = &unk_1E204F620;
  v3[4] = self;
  objc_msgSend(a3, "_cn_each:", v3);
}

- (CNCache)cache
{
  return self->_cache;
}

- (CNAvatarCacheChangeListener)changeHistoryListener
{
  return self->_changeHistoryListener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeHistoryListener, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

void __86__CNAvatarPosterCarouselFingerprintCache_invalidateFingerprintsForContactIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "cacheKeyForContactIdentifier:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "removeObjectForCacheKey:", v4);
}

+ (id)cacheKeyForContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "cacheKeyForContactIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)cacheKeyForContactIdentifier:(id)a3
{
  return (id)objc_msgSend(a3, "_cn_take:", 36);
}

+ (CNAvatarPosterCarouselFingerprintCache)cacheWithCapacity:(unint64_t)a3 contactStore:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0D13B68];
  v6 = a4;
  objc_msgSend(v5, "synchronousSerialDispatchQueueWithName:", CFSTR("com.apple.contactsui.CNAvatarPosterCarouselFingerprintCache"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAvatarPosterCarouselFingerprintCache cacheWithCapacity:contactStore:resourceScheduler:](CNAvatarPosterCarouselFingerprintCache, "cacheWithCapacity:contactStore:resourceScheduler:", a3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNAvatarPosterCarouselFingerprintCache *)v8;
}

+ (CNAvatarPosterCarouselFingerprintCache)cacheWithCapacity:(unint64_t)a3 contactStore:(id)a4 resourceScheduler:(id)a5
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  CNAvatarPosterCarouselFingerprintCache *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0D139B0];
  v7 = a5;
  v8 = a4;
  v9 = [v6 alloc];
  objc_msgSend(MEMORY[0x1E0D139B0], "boundingStrategyWithCapacity:", 100);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithBoundingStrategies:resourceScheduler:", v11, v7);

  v13 = -[CNAvatarPosterCarouselFingerprintCache initWithCache:contactStore:]([CNAvatarPosterCarouselFingerprintCache alloc], "initWithCache:contactStore:", v12, v8);
  return v13;
}

@end
