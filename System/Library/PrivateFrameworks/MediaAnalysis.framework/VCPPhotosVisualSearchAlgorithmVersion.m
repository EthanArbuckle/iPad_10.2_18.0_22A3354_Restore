@implementation VCPPhotosVisualSearchAlgorithmVersion

uint64_t __VCPPhotosVisualSearchAlgorithmVersion_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0DC6EB0], "parseFlowCacheVersion");
  VCPPhotosVisualSearchAlgorithmVersion::version |= result;
  return result;
}

@end
