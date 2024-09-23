@implementation HKLogConceptIndex

os_log_t __HKLogConceptIndex_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.HealthKit", "concept_index");
  HKLogConceptIndex_conceptIndexCategory = (uint64_t)result;
  return result;
}

@end
