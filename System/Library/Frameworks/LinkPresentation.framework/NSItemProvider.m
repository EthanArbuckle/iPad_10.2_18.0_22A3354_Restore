@implementation NSItemProvider

void __103__NSItemProvider_LPExtras___lp_loadFirstDataRepresentationMatchingMIMETypePredicate_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __103__NSItemProvider_LPExtras___lp_loadFirstDataRepresentationMatchingMIMETypePredicate_completionHandler___block_invoke_2;
  v5[3] = &unk_1E44A8440;
  v7 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  v4 = (id)objc_msgSend(v2, "loadDataRepresentationForTypeIdentifier:completionHandler:", v3, v5);

}

void __103__NSItemProvider_LPExtras___lp_loadFirstDataRepresentationMatchingMIMETypePredicate_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;

  v3 = a2;
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __103__NSItemProvider_LPExtras___lp_loadFirstDataRepresentationMatchingMIMETypePredicate_completionHandler___block_invoke_4;
    v5[3] = &unk_1E44A7D60;
    v4 = &v8;
    v8 = *(id *)(a1 + 40);
    v6 = v3;
    v7 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __103__NSItemProvider_LPExtras___lp_loadFirstDataRepresentationMatchingMIMETypePredicate_completionHandler___block_invoke_3;
    block[3] = &unk_1E44A8418;
    v4 = &v10;
    v10 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __103__NSItemProvider_LPExtras___lp_loadFirstDataRepresentationMatchingMIMETypePredicate_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __103__NSItemProvider_LPExtras___lp_loadFirstDataRepresentationMatchingMIMETypePredicate_completionHandler___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __62__NSItemProvider_LPExtras___lp_itemProviderWithData_MIMEType___block_invoke(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
  return 0;
}

@end
