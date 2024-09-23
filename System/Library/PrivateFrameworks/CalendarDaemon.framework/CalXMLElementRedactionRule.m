@implementation CalXMLElementRedactionRule

- (id)redactionRuleForAttribute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v11;

  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    if (redactionRuleForAttribute__onceToken != -1)
      dispatch_once(&redactionRuleForAttribute__onceToken, &__block_literal_global_51);
    v8 = redactionRuleForAttribute__logDedupingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__CalXMLElementRedactionRule_redactionRuleForAttribute___block_invoke_2;
    block[3] = &unk_1E6A373A8;
    v11 = v4;
    dispatch_sync(v8, block);

  }
  return v6;
}

void __56__CalXMLElementRedactionRule_redactionRuleForAttribute___block_invoke()
{
  id v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)redactionRuleForAttribute__loggedAttributes;
  redactionRuleForAttribute__loggedAttributes = (uint64_t)v0;

  v2 = dispatch_queue_create("com.apple.mobilecal.CalDAVTrafficLogScrubber.attributeDedupingQueue", 0);
  v3 = (void *)redactionRuleForAttribute__logDedupingQueue;
  redactionRuleForAttribute__logDedupingQueue = (uint64_t)v2;

}

uint64_t __56__CalXMLElementRedactionRule_redactionRuleForAttribute___block_invoke_2(uint64_t a1)
{
  uint64_t *v1;
  uint64_t result;
  NSObject *v3;

  v1 = (uint64_t *)(a1 + 32);
  result = objc_msgSend((id)redactionRuleForAttribute__loggedAttributes, "containsObject:", *(_QWORD *)(a1 + 32));
  if ((result & 1) == 0)
  {
    +[CalDAVTrafficLogScrubber log](CalDAVTrafficLogScrubber, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __56__CalXMLElementRedactionRule_redactionRuleForAttribute___block_invoke_2_cold_1(v1, v3);

    return objc_msgSend((id)redactionRuleForAttribute__loggedAttributes, "addObject:", *v1);
  }
  return result;
}

- (int)elementName
{
  return self->_elementName;
}

- (void)setElementName:(int)a3
{
  self->_elementName = a3;
}

- (int)content
{
  return self->_content;
}

- (void)setContent:(int)a3
{
  self->_content = a3;
}

- (int)cdata
{
  return self->_cdata;
}

- (void)setCdata:(int)a3
{
  self->_cdata = a3;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
}

void __56__CalXMLElementRedactionRule_redactionRuleForAttribute___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1B6A18000, a2, OS_LOG_TYPE_DEBUG, "Unknown attribute named %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_5();
}

@end
