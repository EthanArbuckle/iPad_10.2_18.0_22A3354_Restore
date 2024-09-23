@implementation CSSuggestion

void __31__CSSuggestion_MailUI__mui_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)mui_log_log;
  mui_log_log = (uint64_t)v1;

}

void __43__CSSuggestion_MailUI__mui_emptySuggestion__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CA6B70], "emptySuggestion");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mui_emptySuggestion_emptySuggestion;
  mui_emptySuggestion_emptySuggestion = v0;

}

uint64_t __64__CSSuggestion_MailUIPredicates__mui_messageListSearchPredicate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mui_messageListSearchPredicate");
}

@end
