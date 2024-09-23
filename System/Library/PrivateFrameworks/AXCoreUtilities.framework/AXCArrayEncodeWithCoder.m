@implementation AXCArrayEncodeWithCoder

void __AXCArrayEncodeWithCoder_block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  void (**v6)(id, id);
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = a2;
  v8 = (id)objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("%@.%@"), *(_QWORD *)(a1 + 32), v7);

  v6[2](v6, v8);
}

uint64_t __AXCArrayEncodeWithCoder_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "encodeBytes:length:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) * *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), a2);
}

void __AXCArrayEncodeWithCoder_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __AXCArrayEncodeWithCoder_block_invoke_4;
  v6[3] = &unk_1E28C2938;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = a2;
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(v5 + 16))(v5, a3, v6);

}

uint64_t __AXCArrayEncodeWithCoder_block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "encodeInt64:forKey:", *(_QWORD *)(a1 + 40), a2);
}

@end
