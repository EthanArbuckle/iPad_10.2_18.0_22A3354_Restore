@implementation BRiWorkSharingGetNeedsMigrateAtURL

void __BRiWorkSharingGetNeedsMigrateAtURL_block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

uint64_t __BRiWorkSharingGetNeedsMigrateAtURL_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBoolResult:error:", a2, a3);
}

@end
