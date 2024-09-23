@implementation NSArray(HMUAdditions)

- (id)hmu_compactMap:()HMUAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __40__NSArray_HMUAdditions__hmu_compactMap___block_invoke;
  v13 = &unk_24D219A00;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

@end
