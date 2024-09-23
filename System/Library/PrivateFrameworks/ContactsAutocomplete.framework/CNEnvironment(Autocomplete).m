@implementation CNEnvironment(Autocomplete)

- (uint64_t)peopleSuggester
{
  return objc_msgSend(a1, "valueForKey:onCacheMiss:", CFSTR("people-suggester-facade"), &__block_literal_global_6);
}

- (uint64_t)cdPeopleSuggester
{
  return objc_msgSend(a1, "valueForKey:onCacheMiss:", CFSTR("cd-people-suggester-facade"), &__block_literal_global_11_0);
}

- (uint64_t)suggestedResultPrioritization
{
  return objc_msgSend(a1, "valueForKey:onCacheMiss:", CFSTR("suggested-result-prioritization"), &__block_literal_global_14);
}

- (uint64_t)stewie
{
  return objc_msgSend(a1, "valueForKey:onCacheMiss:", CFSTR("stewie"), &__block_literal_global_17);
}

- (uint64_t)dataAccessConnection
{
  return objc_msgSend(a1, "valueForKey:onCacheMiss:", CFSTR("data-access-connection"), &__block_literal_global_20);
}

@end
