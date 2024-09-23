@implementation BonjourAdvertiserReportNANIssue

uint64_t __BonjourAdvertiserReportNANIssue_block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 40) + 64))
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 64), "reportIssue:", *(_QWORD *)(result + 32));
  return result;
}

@end
