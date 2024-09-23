@implementation NSArray

uint64_t __32__NSArray_HealthKit__hk_filter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __37__NSArray_HKUUID__hk_dataForAllUUIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "hk_appendBytesWithUUID:", a2);
  return 1;
}

void __44__NSArray_HealthKit__hk_foldRightFrom_with___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __137__NSArray_HealthKit__hk_partitionArrayWithPartitionSetupBlock_partitionMembershipCheckBlock_partitionExtendBlock_partitionFinalizeBlock___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if (*(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24))
  {
    (*(void (**)(void))(a1[4] + 16))();
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 0;
  }
  if (((*(uint64_t (**)(void))(a1[5] + 16))() & 1) == 0)
  {
    (*(void (**)(void))(a1[6] + 16))();
    (*(void (**)(void))(a1[4] + 16))();
  }
  (*(void (**)(void))(a1[7] + 16))();

}

uint64_t __41__NSArray_HealthKit__hk_mapToDictionary___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (a3)
      return objc_msgSend(*(id *)(result + 32), "setObject:forKeyedSubscript:", a3, a2);
  }
  return result;
}

uint64_t __56__NSArray_HealthKit__hk_enumeratePermutationsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

  return 1;
}

void __50__NSArray_HKCodedObject__codingsForKeyPath_error___block_invoke(uint64_t a1, void *a2, unsigned __int8 a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _BYTE *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id obj;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if ((objc_msgSend(v7, "conformsToProtocol:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v9 + 40);
    objc_msgSend(v7, "codingsForKeyPath:error:", v8, &obj);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v9 + 40), obj);
    if (v10)
    {
      v22 = a4;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v25 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v23 = *(id *)(v17 + 40);
            objc_msgSend(v16, "indexableObjectCollectingPushingIndex:error:", a3, &v23);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_storeStrong((id *)(v17 + 40), v23);
            if (!v18)
            {
              *v22 = 1;
              goto LABEL_14;
            }
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v18);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
          if (v13)
            continue;
          break;
        }
      }
LABEL_14:

    }
    else
    {
      *a4 = 1;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("Loop object %@ does not conform to HKCodedObject protocol"), NSClassFromString((NSString *)v7));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

    *a4 = 1;
  }

}

void __57__NSArray_HKCodedObject__applyConcepts_forKeyPath_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;

  v7 = a2;
  if ((objc_msgSend(v7, "conformsToProtocol:", &unk_1EE3A8508) & 1) != 0)
  {
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v11 + 40);
    v12 = objc_msgSend(v8, "applyConcepts:forKeyPath:error:", v9, v10, &obj);
    objc_storeStrong((id *)(v11 + 40), obj);

    if ((v12 & 1) == 0)
      *a4 = 1;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("Loop object %@ does not conform to HKCodedObject protocol"), NSClassFromString((NSString *)v7));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    *a4 = 1;
  }

}

@end
