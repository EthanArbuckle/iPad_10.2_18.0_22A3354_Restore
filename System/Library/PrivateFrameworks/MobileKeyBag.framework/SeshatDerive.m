@implementation SeshatDerive

uint64_t __SeshatDerive_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "derive:userHash:outData:outWriteCount:trackingError:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40, *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
}

@end
