@implementation INParameterCombinationsWithDictionary

void ___INParameterCombinationsWithDictionary_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self.length > 0"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_INParameterCombinationsWithDictionary_predicate;
  _INParameterCombinationsWithDictionary_predicate = v0;

}

@end
