@implementation MRCreateSectionsForRequest

void ___onQueue_MRCreateSectionsForRequest_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "block");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)(*((uint64_t (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, *(_QWORD *)(a1 + 40));
  if (v2)
  {
    _onClientQueue_MRCreateSectionsForRequest(*(void **)(a1 + 48), v6, *(void **)(a1 + 56), *(void **)(a1 + 40));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

@end
