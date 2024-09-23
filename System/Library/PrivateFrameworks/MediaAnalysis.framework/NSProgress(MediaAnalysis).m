@implementation NSProgress(MediaAnalysis)

- (uint64_t)vcp_childWithPendingUnitCount:()MediaAnalysis
{
  return objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:parent:pendingUnitCount:", -1, a1, a3);
}

@end
