@implementation AXHomeClickHapticsSupported

uint64_t __AXHomeClickHapticsSupported_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AXHomeClickHapticsSupported_HapticsSupported = result;
  return result;
}

@end
