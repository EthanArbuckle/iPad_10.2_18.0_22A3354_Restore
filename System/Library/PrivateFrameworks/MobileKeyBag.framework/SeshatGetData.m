@implementation SeshatGetData

uint64_t __SeshatGetData_block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "getData:updateKUD:outWriteLimit:outWriteCount:", *(_QWORD *)(a1[4] + 8) + 40, a1[5], a1[6], a1[7]);
}

@end
