@implementation CSSuggestion(Person)

- (void)updateLocalizedAttributedStringForPersonSuggestion
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_18C42F000, a2, OS_LOG_TYPE_DEBUG, "CSUserQuery: Didn't update suggestion localizedAttributedString since                         updated displayText %@ was nil or same as current suggestion's displayText", (uint8_t *)&v2, 0xCu);
}

@end
