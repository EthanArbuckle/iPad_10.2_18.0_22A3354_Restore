@implementation CNEnvironmentTestDouble(Autocomplete)

- (uint64_t)setPeopleSuggester:()Autocomplete
{
  return objc_msgSend(a1, "setValue:forKey:", a3, CFSTR("people-suggester-facade"));
}

- (uint64_t)setCdPeopleSuggester:()Autocomplete
{
  return objc_msgSend(a1, "setValue:forKey:", a3, CFSTR("cd-people-suggester-facade"));
}

- (uint64_t)setSuggestedResultPrioritization:()Autocomplete
{
  return objc_msgSend(a1, "setValue:forKey:", a3, CFSTR("suggested-result-prioritization"));
}

- (uint64_t)setStewie:()Autocomplete
{
  return objc_msgSend(a1, "setValue:forKey:", a3, CFSTR("stewie"));
}

- (uint64_t)setDataAccessConnection:()Autocomplete
{
  return objc_msgSend(a1, "setValue:forKey:", a3, CFSTR("data-access-connection"));
}

@end
