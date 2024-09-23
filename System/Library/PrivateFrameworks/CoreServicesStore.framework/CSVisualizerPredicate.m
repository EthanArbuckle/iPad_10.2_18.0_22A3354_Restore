@implementation CSVisualizerPredicate

void __80___CSVisualizerPredicate_getRanges_inDescription_options_limit_searchedInRange___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("$HAYSTACK LIKE[cd] $NEEDLE"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)-[_CSVisualizerPredicate getRanges:inDescription:options:limit:searchedInRange:]::likePredicate;
  -[_CSVisualizerPredicate getRanges:inDescription:options:limit:searchedInRange:]::likePredicate = v0;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("$HAYSTACK MATCHES[cd] $NEEDLE"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)-[_CSVisualizerPredicate getRanges:inDescription:options:limit:searchedInRange:]::matchesPredicate;
  -[_CSVisualizerPredicate getRanges:inDescription:options:limit:searchedInRange:]::matchesPredicate = v2;

}

@end
