@implementation CRHandleCarPlayRestrictionChanged

void __CRHandleCarPlayRestrictionChanged_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __CRHandleCarPlayRestrictionChanged_block_invoke_2;
  v6[3] = &unk_1E5428B80;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a2, "handleCarPlayRestrictionChangedWithReply:", v6);

}

uint64_t __CRHandleCarPlayRestrictionChanged_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
