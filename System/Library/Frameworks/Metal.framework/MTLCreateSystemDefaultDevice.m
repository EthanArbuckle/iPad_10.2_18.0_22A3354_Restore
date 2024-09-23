@implementation MTLCreateSystemDefaultDevice

void __MTLCreateSystemDefaultDevice_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (objc_msgSend((id)_deviceArray, "count"))
  {
    if (objc_msgSend((id)_deviceArray, "count") == 1)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = (id)objc_msgSend((id)_deviceArray, "objectAtIndex:", 0);
    else
      MTLReportFailure(0, "MTLCreateSystemDefaultDevice_block_invoke", 758, (uint64_t)CFSTR("MTLCreateSystemDefaultDevice doesn't know what to do with more than one device"), v10, v11, v12, v13, a9);
  }
}

@end
