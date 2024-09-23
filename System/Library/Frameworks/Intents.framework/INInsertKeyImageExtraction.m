@implementation INInsertKeyImageExtraction

void __INInsertKeyImageExtraction_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(id, _QWORD);
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v11, "_storageServiceIdentifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(*(id *)(a1 + 32), "serviceIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "isEqualToString:", v7),
        v7,
        v6,
        v8))
  {
    objc_msgSend(v11, "retrieveProxiedImageSynchronouslyUsingService:error:", *(_QWORD *)(a1 + 32), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = v9;
    else
      v10 = v11;
    ((void (**)(id, id))v5)[2](v5, v10);

  }
  else
  {
    ((void (**)(id, id))v5)[2](v5, v11);
  }

}

void __INInsertKeyImageExtraction_block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
