@implementation FPItem(CSSearchableItem)

- (void)toSearchableItem
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Item %@ has formerIdentifier, but itemIdentifier is not an on-disk identifier.", (uint8_t *)&v2, 0xCu);
}

+ (void)fp_queryFetchAttributes
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMDItemAttributeChangeDate(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("FPItem+CSSearchableItem.m"), 63, CFSTR("%s"), OUTLINED_FUNCTION_0_4());

  __break(1u);
}

@end
