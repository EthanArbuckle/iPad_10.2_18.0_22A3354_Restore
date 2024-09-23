@implementation NSArray

uint64_t __57__NSArray_GC__gc_enumerateObjectsWithOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD v7[6];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__NSArray_GC__gc_enumerateObjectsWithOptions_usingBlock___block_invoke_2;
  v7[3] = &__block_descriptor_48_e12__24__0_8__16lu32l8;
  v7[4] = a2;
  v7[5] = a3;
  return (*(uint64_t (**)(_QWORD, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v7, a3, a4, a5, a6);
}

id __57__NSArray_GC__gc_enumerateObjectsWithOptions_usingBlock___block_invoke_2(uint64_t a1, objc_class *a2, _QWORD *a3)
{
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return *(id *)(a1 + 32);
  if (a3)
  {
    +[NSNumber numberWithUnsignedInteger:](&off_1F03A9E90, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    NSStringFromClass(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Element at index '%@' has unexpected class '%@'."), v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0CB2D68];
    v15[0] = *MEMORY[0x1E0CB2D50];
    v15[1] = v13;
    v16[0] = CFSTR("Invalid array.");
    v16[1] = v12;
    v15[2] = CFSTR("NSCollectionErrorIndexKey");
    v15[3] = CFSTR("NSCollectionErrorElementClassKey");
    v16[2] = v8;
    v16[3] = v11;
    v15[4] = CFSTR("NSCollectionErrorExpectedClassesKey");
    v16[4] = v9;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v16, v15, 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", CFSTR("NSCollectionErrorDomain"), 3, v14);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

@end
