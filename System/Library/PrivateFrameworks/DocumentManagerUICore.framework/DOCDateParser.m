@implementation DOCDateParser

- (DOCDateParser)init
{
  DOCDateParser *v2;
  void *v3;
  DOCDateParser *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCDateParser;
  v2 = -[DOCDateParser init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    v2->_searchParser = (void *)NLSearchParserCreate();
    NLSearchParserSetContext();
    NLSearchParserSetIndex();
    v4 = v2;

  }
  return v2;
}

- (id)parse:(id)a3
{
  id v3;
  const void *v4;
  void *v5;
  void *v6;
  NSObject **v7;
  NSObject *v8;

  v3 = a3;
  NLSearchParserSetString();
  v4 = (const void *)NLSearchParserCopyParseWithOptions();
  v5 = (void *)NLSearchParseCandidateCopyAttributedInput();
  CFRelease(v4);
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSObject **)MEMORY[0x24BE2DFF0];
  v8 = *MEMORY[0x24BE2DFF0];
  if (!*MEMORY[0x24BE2DFF0])
  {
    DOCInitLogging();
    v8 = *v7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DOCDateParser parse:].cold.1((uint64_t)v3, (uint64_t)v6, v8);

  return v6;
}

- (void)dealloc
{
  void *searchParser;
  objc_super v4;

  searchParser = self->_searchParser;
  if (searchParser)
    CFRelease(searchParser);
  v4.receiver = self;
  v4.super_class = (Class)DOCDateParser;
  -[DOCDateParser dealloc](&v4, sel_dealloc);
}

- (void)parse:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("YES");
  if (a2)
    v3 = CFSTR("NO");
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_2172C6000, log, OS_LOG_TYPE_DEBUG, "DOCDateParser: Did find an NLP annotation in the current input '%@': %@", (uint8_t *)&v4, 0x16u);
}

@end
