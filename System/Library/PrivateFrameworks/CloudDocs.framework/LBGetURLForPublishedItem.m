@implementation LBGetURLForPublishedItem

void __LBGetURLForPublishedItem_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __LBGetURLForPublishedItem_block_invoke_2;
  v15[3] = &unk_1E3DA52E0;
  v10 = *(NSObject **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v19 = v11;
  v12 = v9;
  v13 = v8;
  v14 = v7;
  dispatch_async(v10, v15);

}

uint64_t __LBGetURLForPublishedItem_block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

@end
