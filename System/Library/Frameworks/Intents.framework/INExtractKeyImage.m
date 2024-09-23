@implementation INExtractKeyImage

void __INExtractKeyImage_block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, id);
  INKeyImageExtraction *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v5, "isEqual:", a1[4]) & 1) == 0 && !objc_msgSend(v5, "isEqual:", a1[5]))
  {
    v6[2](v6, v5);
    goto LABEL_15;
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v7 = objc_alloc_init(INKeyImageExtraction);
    v8 = *(_QWORD *)(a1[6] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  if ((objc_msgSend(v5, "isEqual:", a1[4]) & 1) != 0)
  {
    v10 = 0;
LABEL_9:
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "_setImageTypeToStore:", v10);
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "isEqual:", a1[5]))
  {
    v10 = 1;
    goto LABEL_9;
  }
LABEL_10:
  v11 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  v15 = 0;
  +[INRemoteImageProxy proxyImageSynchronously:usingService:error:](INRemoteImageProxy, "proxyImageSynchronously:usingService:error:", v5, v11, &v15);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v15)
    v14 = v5;
  else
    v14 = (id)v12;
  v6[2](v6, v14);

LABEL_15:
}

void __INExtractKeyImage_block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
