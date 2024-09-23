@implementation MapsFeatureFlag

uint64_t __MapsFeatureFlag_AddBlockListener_block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = GEOIsFeatureActive(*(void **)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(unsigned __int8 *)(v3 + 24) != (_DWORD)result)
  {
    *(_BYTE *)(v3 + 24) = result;
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  return result;
}

void __MapsFeatureFlag_AddDelegateListener_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "valueChangedForMapsFeatureFlag:enabled:", v7, a3);
  else
    MapsFeatureFlag_RemoveBlockListener(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

}

void __MapsFeatureFlag_AddDelegateListener_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "arrayByAddingObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  objc_msgSend(v8, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));

}

void __MapsFeatureFlag_RemoveDelegateListenerForAllKeys_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  MapsFeatureFlag_RemoveBlockListener(v5);
  objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

}

@end
