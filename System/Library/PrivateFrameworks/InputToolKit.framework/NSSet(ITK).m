@implementation NSSet(ITK)

- (id)itk_objectPassingTest:()ITK
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectsPassingTest:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)itk_containsObjectPassingTest:()ITK
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "itk_objectPassingTest:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)itk_objectsConformingToProtocol:()ITK
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__NSSet_ITK__itk_objectsConformingToProtocol___block_invoke;
  v8[3] = &unk_250F9E378;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "objectsPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)itk_objectsOfClass:()ITK
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __33__NSSet_ITK__itk_objectsOfClass___block_invoke;
  v4[3] = &__block_descriptor_40_e12_B24__0_8_B16lu32l8;
  v4[4] = a3;
  objc_msgSend(a1, "objectsPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)itk_compactMap:()ITK
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
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __29__NSSet_ITK__itk_compactMap___block_invoke;
  v13 = &unk_250F9E3C0;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)itk_map:()ITK
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
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __22__NSSet_ITK__itk_map___block_invoke;
  v13 = &unk_250F9E3C0;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

@end
