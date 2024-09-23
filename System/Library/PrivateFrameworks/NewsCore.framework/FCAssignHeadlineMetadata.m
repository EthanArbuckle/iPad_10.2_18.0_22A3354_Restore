@implementation FCAssignHeadlineMetadata

uint64_t __FCAssignHeadlineMetadata_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "applyHeadlineMetadata:configuration:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
