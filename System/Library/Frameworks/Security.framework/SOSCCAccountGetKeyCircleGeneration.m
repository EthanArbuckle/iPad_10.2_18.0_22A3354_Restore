@implementation SOSCCAccountGetKeyCircleGeneration

void __SOSCCAccountGetKeyCircleGeneration_block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void (*v11)(uint64_t, _QWORD, id);
  id v12;

  v12 = a3;
  if (v12)
  {
    v6 = (void *)MEMORY[0x1E0C99DF0];
    v7 = a4;
    objc_msgSend(v6, "dataWithLength:", 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ccsha256_di();
    objc_msgSend(v12, "length");
    objc_msgSend(objc_retainAutorelease(v12), "bytes");
    v9 = objc_retainAutorelease(v8);
    objc_msgSend(v9, "mutableBytes");
    ccdigest();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void (**)(uint64_t, _QWORD, id))(v10 + 16);
    v9 = a4;
    v11(v10, 0, v9);
  }

}

@end
