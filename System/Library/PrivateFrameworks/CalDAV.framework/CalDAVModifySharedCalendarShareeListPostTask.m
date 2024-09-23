@implementation CalDAVModifySharedCalendarShareeListPostTask

- (id)copyDefaultParserForContentType:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = objc_alloc(MEMORY[0x24BE1ABE0]);
  v5 = *MEMORY[0x24BE1AE30];
  v6 = *MEMORY[0x24BE1AED0];
  v7 = objc_opt_class();
  -[CalDAVModifySharedCalendarShareeListPostTask url](self, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithRootElementNameSpace:name:parseClass:baseURL:", v5, v6, v7, v8);

  return v9;
}

@end
