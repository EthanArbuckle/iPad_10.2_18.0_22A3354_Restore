@implementation NSDictionary(AppStoreComponents)

- (id)asc_dictionaryByMergingDictionary:()AppStoreComponents uniquingKeysWithBlock:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  id v18;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(a1, "mutableCopy");
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __92__NSDictionary_AppStoreComponents__asc_dictionaryByMergingDictionary_uniquingKeysWithBlock___block_invoke;
  v16 = &unk_1E7561A08;
  v17 = v8;
  v18 = v6;
  v9 = v6;
  v10 = v8;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v13);

  v11 = (void *)objc_msgSend(v10, "copy", v13, v14, v15, v16);
  return v11;
}

@end
