@implementation HTMLStringForMetadata

void __HTMLStringForMetadata_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1198]), "initWithURL:", a1[4]);
  objc_msgSend(v5, "setMetadata:", a1[5]);
  objc_msgSend(v5, "HTMLFragmentString");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __HTMLStringForMetadata_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
