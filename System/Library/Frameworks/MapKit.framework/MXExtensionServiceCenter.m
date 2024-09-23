@implementation MXExtensionServiceCenter

void __54___MXExtensionServiceCenter_receivedExtensions_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _MXExtension *v6;
  _MXExtension *v7;
  id WeakRetained;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v9);

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = [_MXExtension alloc];
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 40));
    v6 = -[_MXExtension initWithExtensionIdentifier:extensionProvider:](v7, "initWithExtensionIdentifier:extensionProvider:", v9, WeakRetained);

  }
  objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v6, v9);

}

void __74___MXExtensionServiceCenter__siblingExtensionsWithContainingAppIdentifer___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _MXExtensionContainingAppProxy *v6;
  _MXExtensionContainingAppProxy *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;

  v20 = a2;
  objc_msgSend(v20, "_containingAppIdentifer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = v4;
    else
      v6 = -[_MXExtensionContainingAppProxy initWithContainingAppIdentifer:]([_MXExtensionContainingAppProxy alloc], "initWithContainingAppIdentifer:", v3);
    v7 = v6;

    objc_msgSend(v20, "extensionPointIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.maps.services"));

    if (v9)
    {
      -[_MXExtensionContainingAppProxy extensionNonUIIdentifiers](v7, "extensionNonUIIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v20, "extensionPointIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.maps.ui-services"));

      if (!v12)
        goto LABEL_10;
      -[_MXExtensionContainingAppProxy extensionUIIdentifiers](v7, "extensionUIIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = v10;
    objc_msgSend(v10, "addObject:", v20);

LABEL_10:
    objc_msgSend(v20, "extensionPointIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CBD4B8]);

    if (v15)
    {
      -[_MXExtensionContainingAppProxy extensionNonUIIdentifiers](v7, "extensionNonUIIdentifiers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v20, "extensionPointIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CBD4C0]);

      if (!v18)
      {
LABEL_15:
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v3);

        goto LABEL_16;
      }
      -[_MXExtensionContainingAppProxy extensionUIIdentifiers](v7, "extensionUIIdentifiers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v19 = v16;
    objc_msgSend(v16, "addObject:", v20);

    goto LABEL_15;
  }
LABEL_16:

}

void __43___MXExtensionServiceCenter_setExtensions___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

void __39___MXExtensionServiceCenter_extensions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __47___MXExtensionServiceCenter_setMapsExtensions___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

void __43___MXExtensionServiceCenter_mapsExtensions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __53___MXExtensionServiceCenter_setContainingAppProxies___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

void __49___MXExtensionServiceCenter_containingAppProxies__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
