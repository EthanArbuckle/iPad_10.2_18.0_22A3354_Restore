@implementation NSArray

void __72__NSArray_NURenderPipelineFunction__nu_evaluateWithPipelineState_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  id *v7;
  void *v8;
  id obj;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  obj = 0;
  objc_msgSend(a2, "nu_evaluateWithPipelineState:error:", v6, &obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v7, obj);
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    *a4 = 0;
  }

}

@end
