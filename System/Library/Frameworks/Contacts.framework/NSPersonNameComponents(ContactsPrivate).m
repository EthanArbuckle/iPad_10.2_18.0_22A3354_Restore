@implementation NSPersonNameComponents(ContactsPrivate)

+ (id)componentsForContact:()ContactsPrivate
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  +[CN allNameComponentRelatedProperties](CN, "allNameComponentRelatedProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__NSPersonNameComponents_ContactsPrivate__componentsForContact___block_invoke;
  v12[3] = &unk_1E29FE170;
  v15 = a1;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

+ (id)descriptorForUsedKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__NSPersonNameComponents_ContactsPrivate__descriptorForUsedKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (descriptorForUsedKeys_cn_once_token_0 != -1)
    dispatch_once(&descriptorForUsedKeys_cn_once_token_0, block);
  return (id)descriptorForUsedKeys_cn_once_object_0;
}

- (void)overrideComponentsInContact:()ContactsPrivate
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v4 = a3;
  +[CN allNameComponentRelatedProperties](CN, "allNameComponentRelatedProperties");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__NSPersonNameComponents_ContactsPrivate__overrideComponentsInContact___block_invoke;
  v7[3] = &unk_1E29FE198;
  v8 = v4;
  v9 = a1;
  v5 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

@end
