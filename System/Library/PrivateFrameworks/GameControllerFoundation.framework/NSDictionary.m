@implementation NSDictionary

uint64_t __57__NSDictionary_GC__gc_enumerateKeysAndObjectsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  id (*v6)(uint64_t, objc_class *, _QWORD *);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id (*v12)(uint64_t, objc_class *, _QWORD *);
  void *v13;
  uint64_t v14;

  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __57__NSDictionary_GC__gc_enumerateKeysAndObjectsUsingBlock___block_invoke_2;
  v13 = &__block_descriptor_40_e12__24__0_8__16lu32l8;
  v14 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __57__NSDictionary_GC__gc_enumerateKeysAndObjectsUsingBlock___block_invoke_3;
  v7 = &__block_descriptor_48_e12__24__0_8__16lu32l8u40l8;
  v8 = a3;
  v9 = a2;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __57__NSDictionary_GC__gc_enumerateKeysAndObjectsUsingBlock___block_invoke_2(uint64_t a1, objc_class *a2, _QWORD *a3)
{
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return *(id *)(a1 + 32);
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Key '%@' has unexpected class '%@'."), v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CB2D68];
    v14[0] = *MEMORY[0x1E0CB2D50];
    v14[1] = v12;
    v15[0] = CFSTR("Invalid dictionary.");
    v15[1] = v11;
    v14[2] = CFSTR("NSCollectionErrorIndexKey");
    v14[3] = CFSTR("NSCollectionErrorIndexClassKey");
    v15[2] = v7;
    v15[3] = v10;
    v14[4] = CFSTR("NSCollectionErrorExpectedClassKey");
    v15[4] = v8;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", CFSTR("NSCollectionErrorDomain"), 2, v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

id __57__NSDictionary_GC__gc_enumerateKeysAndObjectsUsingBlock___block_invoke_3(uint64_t a1, objc_class *a2, _QWORD *a3)
{
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return *(id *)(a1 + 32);
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 40), "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Value for key '%@' has unexpected class '%@'."), v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CB2D68];
    v14[0] = *MEMORY[0x1E0CB2D50];
    v14[1] = v12;
    v15[0] = CFSTR("Invalid dictionary.");
    v15[1] = v11;
    v14[2] = CFSTR("NSCollectionErrorIndexKey");
    v14[3] = CFSTR("NSCollectionErrorElementClassKey");
    v15[2] = v7;
    v15[3] = v10;
    v14[4] = CFSTR("NSCollectionErrorExpectedClassKey");
    v15[4] = v8;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", CFSTR("NSCollectionErrorDomain"), 3, v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

@end
