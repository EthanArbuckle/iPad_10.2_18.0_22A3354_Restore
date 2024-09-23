@implementation SecItemFetchCurrentItemDataAcrossAllDevices

uint64_t __SecItemFetchCurrentItemDataAcrossAllDevices_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __SecItemFetchCurrentItemDataAcrossAllDevices_block_invoke_2(uint64_t a1, SecItemCurrentItemData *a2, void *a3, void *a4)
{
  id v7;
  SecItemCurrentItemData *v8;
  id v9;

  v9 = a4;
  if (a2)
  {
    v7 = a3;
    v8 = a2;
    a2 = -[SecItemCurrentItemData initWithPersistentRef:]([SecItemCurrentItemData alloc], "initWithPersistentRef:", v8);

    -[SecItemCurrentItemData setCurrentItemPointerModificationTime:](a2, "setCurrentItemPointerModificationTime:", v7);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
