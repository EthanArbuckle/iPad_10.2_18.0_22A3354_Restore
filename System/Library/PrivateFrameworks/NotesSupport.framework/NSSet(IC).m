@implementation NSSet(IC)

- (id)ic_map:()IC
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
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __20__NSSet_IC__ic_map___block_invoke;
  v13 = &unk_1EA825088;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)ic_compactMap:()IC
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
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __27__NSSet_IC__ic_compactMap___block_invoke;
  v13 = &unk_1EA825088;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

+ (id)ic_setFromNonNilObject:()IC
{
  if (a3)
    objc_msgSend(a1, "setWithObject:");
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)ic_objectsOfClass:()IC
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__NSSet_IC__ic_objectsOfClass___block_invoke;
  v4[3] = &__block_descriptor_40_e12_B24__0_8_B16lu32l8;
  v4[4] = a3;
  objc_msgSend(a1, "objectsPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)ic_objectPassingTest:()IC
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__NSSet_IC__ic_objectPassingTest___block_invoke;
  v9[3] = &unk_1EA825018;
  v10 = v4;
  v5 = v4;
  objc_msgSend(a1, "objectsPassingTest:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)ic_containsObjectPassingTest:()IC
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "ic_objectPassingTest:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (uint64_t)ic_containsObjectMatchingPredicate:()IC
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__NSSet_IC__ic_containsObjectMatchingPredicate___block_invoke;
  v8[3] = &unk_1EA825040;
  v9 = v4;
  v5 = v4;
  v6 = objc_msgSend(a1, "ic_containsObjectPassingTest:", v8);

  return v6;
}

+ (id)ic_setFromNonNilArray:()IC
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C9AA60];
  if (a3)
    v4 = a3;
  v5 = v4;
  objc_msgSend(a1, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)ic_objectsConformingToProtocol:()IC
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__NSSet_IC__ic_objectsConformingToProtocol___block_invoke;
  v8[3] = &unk_1EA825040;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "objectsPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)ic_objectOfClass:()IC
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__NSSet_IC__ic_objectOfClass___block_invoke;
  v4[3] = &__block_descriptor_40_e12_B24__0_8_B16lu32l8;
  v4[4] = a3;
  objc_msgSend(a1, "ic_objectPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
