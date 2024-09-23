@implementation NSDictionary

void __77__NSDictionary_NURenderPipelineFunction__nu_evaluateWithPipelineState_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  id *v9;
  void *v10;
  id obj;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  obj = 0;
  objc_msgSend(a3, "nu_evaluateWithPipelineState:error:", v8, &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v9, obj);
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v10, v7);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    *a4 = 0;
  }

}

@end
