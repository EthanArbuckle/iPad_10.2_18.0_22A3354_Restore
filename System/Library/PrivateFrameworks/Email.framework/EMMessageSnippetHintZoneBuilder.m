@implementation EMMessageSnippetHintZoneBuilder

+ (id)authorHintsFromHintsBySnippetZone:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("EMMessageSnippetHintZoneAuthor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("EMMessageSnippetHintZoneAuthorEmailAddresses"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v6);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__EMMessageSnippetHintZoneBuilder_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_27 != -1)
    dispatch_once(&log_onceToken_27, block);
  return (OS_os_log *)(id)log_log_27;
}

void __38__EMMessageSnippetHintZoneBuilder_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_27;
  log_log_27 = (uint64_t)v1;

}

+ (id)snippetHintZoneFromString:(id)a3
{
  id v3;
  const __CFString *v4;
  NSObject *v6;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA6048]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("EMMessageSnippetHintZoneAuthor")) & 1) != 0)
  {
    v4 = CFSTR("EMMessageSnippetHintZoneAuthor");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA6030]) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("EMMessageSnippetHintZoneAuthorEmailAddresses")) & 1) != 0)
  {
    v4 = CFSTR("EMMessageSnippetHintZoneAuthorEmailAddresses");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA68D8]) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("EMMessageSnippetHintZoneSubject")) & 1) != 0)
  {
    v4 = CFSTR("EMMessageSnippetHintZoneSubject");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA6910]) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("EMMessageSnippetHintZoneTextContent")) & 1) != 0)
  {
    v4 = CFSTR("EMMessageSnippetHintZoneTextContent");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA67D8]) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("EMMessageSnippetHintZoneRecipients")) & 1) != 0)
  {
    v4 = CFSTR("EMMessageSnippetHintZoneRecipients");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA67D0]) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("EMMessageSnippetHintZoneRecipientEmailAddresses")) & 1) != 0)
  {
    v4 = CFSTR("EMMessageSnippetHintZoneRecipientEmailAddresses");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA61B8]) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("EMMessageSnippetHintZoneEmailAddresses")) & 1) != 0)
  {
    v4 = CFSTR("EMMessageSnippetHintZoneEmailAddresses");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA5FF8]) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("EMMessageSnippetHintZoneAttachmentNames")) & 1) != 0)
  {
    v4 = CFSTR("EMMessageSnippetHintZoneAttachmentNames");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA6008]) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("EMMessageSnippetHintZoneAttachmentTypes")) & 1) != 0)
  {
    v4 = CFSTR("EMMessageSnippetHintZoneAttachmentTypes");
  }
  else
  {
    +[EMMessageSnippetHintZoneBuilder log](EMMessageSnippetHintZoneBuilder, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[EMMessageSnippetHintZoneBuilder snippetHintZoneFromString:].cold.1((uint64_t)v3, v6);

    v4 = CFSTR("EMMessageSnippetHintZoneOther");
  }

  return (id)v4;
}

+ (void)snippetHintZoneFromString:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B99BB000, a2, OS_LOG_TYPE_ERROR, "[Snippet Hints] Unsupported snippet hint zone: %@", (uint8_t *)&v2, 0xCu);
}

@end
