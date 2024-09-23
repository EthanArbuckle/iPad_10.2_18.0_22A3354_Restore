@implementation PHChooserListContinueEnumerating

void __PHChooserListContinueEnumerating_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  _QWORD *v10;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[9];
  v4 = (void *)MEMORY[0x1E0CB3880];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __PHChooserListContinueEnumerating_block_invoke_2;
  v9[3] = &unk_1E35DB4C8;
  v10 = v2;
  objc_msgSend(v4, "predicateWithBlock:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 80);
  *(_QWORD *)(v7 + 80) = v6;

}

uint64_t __PHChooserListContinueEnumerating_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "dataStoreKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
    objc_msgSend(v3, "dataStoreKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6) ^ 1;

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

@end
