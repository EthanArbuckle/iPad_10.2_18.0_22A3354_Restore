@implementation ContinueRouterOperationOnWorkQueue

void __ContinueRouterOperationOnWorkQueue_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "networkRouterAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

  if ((v4 & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

  }
}

@end
