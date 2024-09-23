@implementation MPMediaKitInitPropertyStoreAssetMap

id ___MPMediaKitInitPropertyStoreAssetMap_block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("attributes.playParams"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("_MPMKT_transformedType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("attributes.videoKind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", CFSTR("tv-episodes"))
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("tvtrailer")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("uploaded-videos")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("uploaded-audios")))
  {
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id ___MPMediaKitInitPropertyStoreAssetMap_block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "valueForKeyPath:", CFSTR("attributes.playParams.reporting"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id ___MPMediaKitInitPropertyStoreAssetMap_block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("attributes.playParams"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("_MPMKT_transformedType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqual:", CFSTR("uploaded-audios")) & 1) != 0
      || (objc_msgSend(v5, "isEqual:", CFSTR("uploaded-videos")) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(v2, "valueForKeyPath:", CFSTR("attributes.offers.kind"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "containsObject:", CFSTR("subscription"));

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id ___MPMediaKitInitPropertyStoreAssetMap_block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("attributes.playParams"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = 3;
  }
  else
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("_MPMKT_transformedType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqual:", CFSTR("uploaded-audios")) & 1) != 0
      || (objc_msgSend(v5, "isEqual:", CFSTR("uploaded-videos")) & 1) != 0)
    {
      v4 = 3;
    }
    else
    {
      objc_msgSend(v2, "valueForKeyPath:", CFSTR("attributes.offers.kind"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "containsObject:", CFSTR("subscription")))
        v4 = 3;
      else
        v4 = 0;

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void ___MPMediaKitInitPropertyStoreAssetMap_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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
  v11[2] = ___MPMediaKitInitPropertyStoreAssetMap_block_invoke_2;
  v11[3] = &unk_1E3163A30;
  v12 = v6;
  v10 = v6;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "setUniversalStoreIdentifiersWithBlock:", v11);
  objc_msgSend(v8, "personID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPersonalStoreIdentifiersWithPersonID:block:", v9, &__block_literal_global_530);
}

void ___MPMediaKitInitPropertyStoreAssetMap_block_invoke_2(uint64_t a1, void *a2)
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
