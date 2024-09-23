@implementation IXApplicationRecordForIdentityInDomain

void __IXApplicationRecordForIdentityInDomain_block_invoke(_QWORD *a1, char a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;

  v6 = a3;
  if (v6 || (a2 & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0CA5870]);
    v8 = a1[4];
    v9 = *(_QWORD *)(a1[5] + 8);
    obj = *(id *)(v9 + 40);
    v10 = objc_msgSend(v7, "initWithBundleIdentifier:allowPlaceholder:error:", v8, 1, &obj);
    objc_storeStrong((id *)(v9 + 40), obj);
    v11 = *(_QWORD *)(a1[6] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

@end
