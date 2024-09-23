@implementation EXExtensionGenerateNSPredicateFromActivationDictionary

uint64_t ___EXExtensionGenerateNSPredicateFromActivationDictionary_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_EXExtensionGenerateNSPredicateFromActivationDictionary_predicateCache;
  _EXExtensionGenerateNSPredicateFromActivationDictionary_predicateCache = (uint64_t)v0;

  return objc_msgSend((id)_EXExtensionGenerateNSPredicateFromActivationDictionary_predicateCache, "setName:", CFSTR("NSExtension predicate cache"));
}

@end
