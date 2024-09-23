@implementation HKConceptIndexableComparisonFilter

uint64_t __64___HKConceptIndexableComparisonFilter_supportsKeyPath_forTypes___block_invoke(uint64_t a1, void *a2)
{
  return _ClassSupportsConceptIndexableKeyPath((void *)objc_msgSend(a2, "dataObjectClass"), *(void **)(a1 + 32));
}

@end
