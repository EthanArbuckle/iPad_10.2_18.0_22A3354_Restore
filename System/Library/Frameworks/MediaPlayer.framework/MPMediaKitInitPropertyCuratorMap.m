@implementation MPMediaKitInitPropertyCuratorMap

id ___MPMediaKitInitPropertyCuratorMap_block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("_MPMKT_transformedType");
  v12[1] = CFSTR("type");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _MPKeyPathValueTransformFirstNonnullKeyPath(v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("activities")) & 1) != 0)
  {
    v9 = 3;
  }
  else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("apple-curators")) & 1) != 0)
  {
    v9 = 1;
  }
  else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("editorial-items")) & 1) != 0)
  {
    v9 = 4;
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("curators")))
  {
    v9 = 2;
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id ___MPMediaKitInitPropertyCuratorMap_block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a2, "valueForKeyPath:", CFSTR("attributes.kind"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Show")) & 1) != 0)
  {
    v3 = 3;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Genre")) & 1) != 0)
  {
    v3 = 2;
  }
  else
  {
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Curator"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void ___MPMediaKitInitPropertyCuratorMap_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a2;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = ___MPMediaKitInitPropertyCuratorMap_block_invoke_2;
  v11[3] = &unk_1E3163A30;
  v12 = v6;
  v10 = v6;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "setUniversalStoreIdentifiersWithBlock:", v11);
  objc_msgSend(v8, "personID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPersonalStoreIdentifiersWithPersonID:block:", v9, &__block_literal_global_377);
}

void ___MPMediaKitInitPropertyCuratorMap_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("id"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v5, "longLongValue");
  else
    v4 = 0;

  objc_msgSend(v3, "setAdamID:", v4);
}

@end
