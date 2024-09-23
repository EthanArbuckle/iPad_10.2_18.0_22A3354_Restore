@implementation WFCreateArchiveWithFileWrapper

id __WFCreateArchiveWithFileWrapper_block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE90]), "initWithData:", *(_QWORD *)(a1 + 32));
}

@end
