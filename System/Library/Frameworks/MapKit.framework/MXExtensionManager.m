@implementation MXExtensionManager

uint64_t __90___MXExtensionManager_Ridesharing___maps_lookupPolicyForEnabledRidesharingNonUIExtensions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isEnabled")
    && (objc_msgSend(v3, "extensionPointIdentifier"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0CBD4B8]),
        v4,
        v5))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "_maps_ridesharingRequiredIntentClassesForNonUIHandling", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(v3, "canSupportIntentClass:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)) & 1) != 0)
          {
            v7 = 1;
            goto LABEL_14;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __83___MXExtensionManager_Ridesharing___maps_lookupPolicyForRidesharingNonUIExtensions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "extensionPointIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0CBD4B8]);

  if (v5)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "_maps_ridesharingRequiredIntentClassesForNonUIHandling", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(v3, "canSupportIntentClass:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)) & 1) != 0)
          {
            v7 = 1;
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __56___MXExtensionManager_managerWithLookupPolicy_delegate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *, void *);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "extensionProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __56___MXExtensionManager_managerWithLookupPolicy_delegate___block_invoke_2;
  v7 = &unk_1E20D8438;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v2, "addExtensionsUpdateHandler:", &v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMatchingContext:", v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __56___MXExtensionManager_managerWithLookupPolicy_delegate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void (*v9)(uint64_t);
  uint64_t *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_applyExtensionPredicateWithExtensionsIfNeeded:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v14 = MEMORY[0x1E0C809B0];
    v9 = __56___MXExtensionManager_managerWithLookupPolicy_delegate___block_invoke_3;
    v10 = &v14;
    v11 = v5;
  }
  else
  {
    v13 = MEMORY[0x1E0C809B0];
    v9 = __56___MXExtensionManager_managerWithLookupPolicy_delegate___block_invoke_4;
    v10 = &v13;
    v11 = v8;
  }
  v10[1] = 3221225472;
  v10[2] = (uint64_t)v9;
  v10[3] = (uint64_t)&unk_1E20D7E58;
  v10[4] = (uint64_t)WeakRetained;
  v10[5] = (uint64_t)v11;
  v12 = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __56___MXExtensionManager_managerWithLookupPolicy_delegate___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionManager:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __56___MXExtensionManager_managerWithLookupPolicy_delegate___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionManager:didUpdateAvailableExtensions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __70___MXExtensionManager_managerWithExtensionLookupPolicy_updateHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "extensionProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70___MXExtensionManager_managerWithExtensionLookupPolicy_updateHandler___block_invoke_2;
  v4[3] = &unk_1E20DCA88;
  objc_copyWeak(&v6, &location);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "addExtensionsUpdateHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMatchingContext:", v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __70___MXExtensionManager_managerWithExtensionLookupPolicy_updateHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  void *v8;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_applyExtensionPredicateWithExtensionsIfNeeded:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __29___MXExtensionManager__queue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.maps._MXExtensionManager", v2);
  v1 = (void *)qword_1ECE2DD30;
  qword_1ECE2DD30 = (uint64_t)v0;

}

uint64_t __62___MXExtensionManager_lookupPolicyForExtensionWithCapability___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __64___MXExtensionManager_lookupPolicyForExtensionWithCapabilities___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isSubsetOfSet:", v3);

  return v4;
}

uint64_t __63___MXExtensionManager__lookupPolicyForExtensionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __102___MXExtensionManager__lookupPolicyForExtensionWithContainingAppIdentifiers_supportsIntentClassNames___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, NSString *);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v3 = a2;
  objc_msgSend(v3, "extensionPointIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CBD4B8]))
  {

  }
  else
  {
    objc_msgSend(v3, "extensionPointIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CBD4C0]);

    if (!v6)
    {
      v11 = 0;
      goto LABEL_11;
    }
  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  v7 = *(void **)(a1 + 32);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __102___MXExtensionManager__lookupPolicyForExtensionWithContainingAppIdentifiers_supportsIntentClassNames___block_invoke_2;
  v16 = &unk_1E20DCAD8;
  v18 = &v19;
  v8 = v3;
  v17 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v13);
  if (objc_msgSend(*(id *)(a1 + 40), "count", v13, v14, v15, v16))
  {
    if (*((_BYTE *)v20 + 24))
    {
      v9 = *(void **)(a1 + 40);
      objc_msgSend(v8, "_containingAppIdentifer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "containsObject:", v10);

    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = *((unsigned __int8 *)v20 + 24) != 0;
  }

  _Block_object_dispose(&v19, 8);
LABEL_11:

  return v11;
}

uint64_t __102___MXExtensionManager__lookupPolicyForExtensionWithContainingAppIdentifiers_supportsIntentClassNames___block_invoke_2(uint64_t a1, NSString *aClassName)
{
  Class v3;
  uint64_t v4;
  uint64_t result;

  v3 = NSClassFromString(aClassName);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v4 + 24))
  {
    result = objc_msgSend(*(id *)(a1 + 32), "canSupportIntentClass:", v3);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  else
  {
    result = 0;
  }
  *(_BYTE *)(v4 + 24) = result;
  return result;
}

uint64_t __46___MXExtensionManager__lookupPolicyWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
