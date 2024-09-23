@implementation NSArray

void __98__NSArray_IntentsFoundation__if_enumerateAsynchronouslyInSequenceOnQueue_block_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 48), 0);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  free(*(void **)(a1 + 56));
}

void __98__NSArray_IntentsFoundation__if_enumerateAsynchronouslyInSequenceOnQueue_block_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __98__NSArray_IntentsFoundation__if_enumerateAsynchronouslyInSequenceOnQueue_block_completionHandler___block_invoke_4;
  v7[3] = &unk_1E97789C8;
  v2 = *(_QWORD *)(a1 + 72);
  v11 = *(_QWORD *)(a1 + 80);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v12 = *(_QWORD *)(a1 + 72);
  v9 = v5;
  v10 = v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *, _QWORD))(v4 + 16))(v4, v3, v2, v7, *(_QWORD *)(a1 + 80));

}

void __98__NSArray_IntentsFoundation__if_enumerateAsynchronouslyInSequenceOnQueue_block_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2;
  if (v3 || **(_BYTE **)(a1 + 56))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__NSArray_IntentsFoundation__if_enumerateAsynchronouslyInSequenceOnQueue_block_completionHandler___block_invoke_5;
    block[3] = &unk_1E97789A0;
    v4 = *(NSObject **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 64);
    v12 = v5;
    v14 = v6;
    v7 = v3;
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v11 = v7;
    v13 = v8;
    v15 = v9;
    dispatch_async(v4, block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
  }

}

void __98__NSArray_IntentsFoundation__if_enumerateAsynchronouslyInSequenceOnQueue_block_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  id *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  _QWORD v22[4];

  objc_msgSend(*(id *)(a1 + 32), "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(NSObject **)(a1 + 40);
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__NSArray_IntentsFoundation__if_enumerateAsynchronouslyInSequenceOnQueue_block_completionHandler___block_invoke_3;
    block[3] = &unk_1E97789F0;
    v6 = &v16;
    v16 = *(id *)(a1 + 56);
    v14 = v4;
    v7 = *(_QWORD *)(a1 + 72);
    v19 = a2;
    v20 = v7;
    v15 = *(id *)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 64);
    v17 = v8;
    v18 = v9;
    dispatch_async(v5, block);

  }
  else
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __98__NSArray_IntentsFoundation__if_enumerateAsynchronouslyInSequenceOnQueue_block_completionHandler___block_invoke_2;
    v21[3] = &unk_1E9778978;
    v6 = (id *)v22;
    v10 = *(id *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 64);
    v12 = *(_QWORD *)(a1 + 72);
    v22[0] = v10;
    v22[1] = v11;
    v22[2] = a2;
    v22[3] = v12;
    dispatch_async(v5, v21);
  }

}

id __37__NSArray_IntentsFoundation__if_map___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

uint64_t __61__NSArray_IntentsFoundation__if_firstObjectWithValue_forKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "valueForKeyPath:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

  return v4;
}

void __98__NSArray_IntentsFoundation__if_enumerateAsynchronouslyInSequenceOnQueue_block_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 56) + 1, *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  free(*(void **)(a1 + 64));
}

void __88__NSArray_IntentsFoundation__if_enumerateAsynchronouslyOnQueue_block_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "lock");
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    objc_msgSend(*(id *)(a1 + 32), "unlock");
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

}

uint64_t __88__NSArray_IntentsFoundation__if_enumerateAsynchronouslyOnQueue_block_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], a1[6], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
}

BOOL __51__NSArray_IntentsFoundation__if_objectsNotOfClass___block_invoke()
{
  return (objc_opt_isKindOfClass() & 1) == 0;
}

uint64_t __48__NSArray_IntentsFoundation__if_objectsOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

BOOL __64__NSArray_IntentsFoundation__if_firstObjectWithIntValue_forKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "valueForKeyPath:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue") == *(_DWORD *)(a1 + 40);

  return v4;
}

BOOL __65__NSArray_IntentsFoundation__if_firstObjectWithBoolValue_forKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "valueForKeyPath:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(unsigned __int8 *)(a1 + 40) == objc_msgSend(v3, "BOOLValue");

  return v4;
}

BOOL __60__NSArray_IntentsFoundation__if_objectsWithIntValue_forKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "valueForKeyPath:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue") == *(_DWORD *)(a1 + 40);

  return v4;
}

BOOL __61__NSArray_IntentsFoundation__if_objectsWithBoolValue_forKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "valueForKeyPath:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(unsigned __int8 *)(a1 + 40) == objc_msgSend(v3, "BOOLValue");

  return v4;
}

uint64_t __57__NSArray_IntentsFoundation__if_objectsWithValue_forKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "valueForKeyPath:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

  return v4;
}

id __75__NSArray_IntentsFoundation__if_escapedComponentsJoinedByString_forLocale___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (!v3)
  {
    v7 = 0;
    v4 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = 0;
    v7 = v3;
    goto LABEL_7;
  }
  v4 = v3;
  if (objc_msgSend(v3, "rangeOfString:", *(_QWORD *)(a1 + 32)) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "quotationBeginDelimiter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "quotationEndDelimiter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  }

  return v4;
}

id __49__NSArray_IntentsFoundation__if_mapConcurrently___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

@end
