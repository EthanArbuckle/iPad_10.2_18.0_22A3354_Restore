@implementation HKLogHealthOntology

os_log_t __HKLogHealthOntology_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.HealthKit", "ontology");
  HKLogHealthOntology_ontologyCategory = (uint64_t)result;
  return result;
}

@end
