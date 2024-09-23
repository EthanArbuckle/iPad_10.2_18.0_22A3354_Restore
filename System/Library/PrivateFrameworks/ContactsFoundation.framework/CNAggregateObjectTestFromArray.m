@implementation CNAggregateObjectTestFromArray

uint64_t ___CNAggregateObjectTestFromArray_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___CNAggregateObjectTestFromArray_block_invoke_2;
  v8[3] = &unk_1E29BB540;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "_cn_all:", v8);

  return v6;
}

uint64_t ___CNAggregateObjectTestFromArray_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

@end
