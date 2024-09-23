@implementation _CDContactFavoritesUtilities

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken5_0 != -1)
    dispatch_once(&sharedInstance__pasOnceToken5_0, &__block_literal_global_57);
  return (id)sharedInstance__pasExprOnceResult_2;
}

- (_CDContactFavoritesUtilities)init
{
  _CDContactFavoritesUtilities *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  _PASLock *contactFavorites;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_CDContactFavoritesUtilities;
  v2 = -[_CDContactFavoritesUtilities init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D815F0]);
    v4 = objc_alloc(getCNFavoritesClass());
    v5 = objc_alloc_init(getCNContactStoreClass());
    v6 = (void *)objc_msgSend(v4, "initWithContactStore:", v5);
    v7 = objc_msgSend(v3, "initWithGuardedData:", v6);
    contactFavorites = v2->_contactFavorites;
    v2->_contactFavorites = (_PASLock *)v7;

  }
  return v2;
}

- (id)favoriteContactEntries
{
  _PASLock *contactFavorites;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__18;
  v10 = __Block_byref_object_dispose__18;
  v11 = 0;
  contactFavorites = self->_contactFavorites;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54___CDContactFavoritesUtilities_favoriteContactEntries__block_invoke;
  v5[3] = &unk_1E26E5D70;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](contactFavorites, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)entriesForContact:(id)a3
{
  id v4;
  _PASLock *contactFavorites;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__18;
  v16 = __Block_byref_object_dispose__18;
  v17 = 0;
  contactFavorites = self->_contactFavorites;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50___CDContactFavoritesUtilities_entriesForContact___block_invoke;
  v9[3] = &unk_1E26E5D98;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  -[_PASLock runWithLockAcquired:](contactFavorites, "runWithLockAcquired:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (_PASLock)contactFavorites
{
  return self->_contactFavorites;
}

- (void)setContactFavorites:(id)a3
{
  objc_storeStrong((id *)&self->_contactFavorites, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactFavorites, 0);
}

@end
