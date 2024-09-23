@implementation NSEntityDescription(HomeKitDaemon)

- (void)hmd_recursivelyEnumerateSubentitiesUsingBlock:()HomeKitDaemon
{
  id v4;
  id v5;
  void (**v6)(void *, uint64_t, _QWORD, uint64_t *);
  _QWORD aBlock[4];
  id v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v14 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__NSEntityDescription_HomeKitDaemon__hmd_recursivelyEnumerateSubentitiesUsingBlock___block_invoke;
  aBlock[3] = &unk_24E7825B0;
  v9 = &v15;
  v5 = v4;
  v8 = v5;
  v10 = &v11;
  v6 = (void (**)(void *, uint64_t, _QWORD, uint64_t *))_Block_copy(aBlock);
  v12[3] = (uint64_t)v6;
  v6[2](v6, a1, 0, v16 + 3);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

}

- (id)hmd_attributesBySettingsPath
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  _QWORD v9[4];
  id v10;

  objc_getAssociatedObject(a1, sel_hmd_attributeForSettingsPath_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "attributesByName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __66__NSEntityDescription_HomeKitDaemon__hmd_attributesBySettingsPath__block_invoke;
    v9[3] = &unk_24E7825D8;
    v5 = v3;
    v10 = v5;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

    v2 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(a1, "managedObjectModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hmd_isImmutable");

    if (v7)
      objc_setAssociatedObject(a1, sel_hmd_attributeForSettingsPath_, v2, (void *)0x301);

  }
  return v2;
}

- (id)hmd_attributeForSettingsPath:()HomeKitDaemon
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "hmd_attributesBySettingsPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
