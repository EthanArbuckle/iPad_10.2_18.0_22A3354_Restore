@implementation NSMutableAttributedString(CRTT)

- (void)cr_appendString:()CRTT
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v5);
  objc_msgSend(a1, "appendAttributedString:", v4);

}

- (void)cr_replaceStorageInRange:()CRTT withStorage:fromRange:
{
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[8];

  v14 = a5;
  objc_msgSend(v14, "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "substringWithRange:", a6, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "replaceCharactersInRange:withString:", a3, a4, v13);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__NSMutableAttributedString_CRTT__cr_replaceStorageInRange_withStorage_fromRange___block_invoke;
  v15[3] = &unk_1E775E350;
  v15[6] = a7;
  v15[7] = a3;
  v15[4] = a1;
  v15[5] = a6;
  objc_msgSend(v14, "enumerateAttributesInRange:options:usingBlock:", a6, a7, 0x100000, v15);

}

- (void)cr_appendStorage:()CRTT fromRange:
{
  id v8;

  v8 = a3;
  objc_msgSend(a1, "cr_replaceStorageInRange:withStorage:fromRange:", objc_msgSend(a1, "length"), 0, v8, a4, a5);

}

- (id)cr_storageFromRange:()CRTT
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "attributedSubstringFromRange:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  return v2;
}

- (id)cr_emptyCopy
{
  return objc_alloc_init(MEMORY[0x1E0CB3778]);
}

- (uint64_t)cr_mergeAttributesInRange:()CRTT withStorage:fromRange:
{
  _QWORD v8[6];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__NSMutableAttributedString_CRTT__cr_mergeAttributesInRange_withStorage_fromRange___block_invoke;
  v8[3] = &unk_1E775E3A0;
  v8[4] = a1;
  v8[5] = a3 - a6;
  return objc_msgSend(a5, "enumerateAttributesInRange:options:usingBlock:", a6, a7, 0x100000, v8);
}

@end
