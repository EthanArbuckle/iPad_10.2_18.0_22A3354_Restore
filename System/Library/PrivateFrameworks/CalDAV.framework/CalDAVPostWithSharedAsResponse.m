@implementation CalDAVPostWithSharedAsResponse

- (id)copyDefaultParserForContentType:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = objc_alloc(MEMORY[0x24BE1ABE0]);
  v5 = *MEMORY[0x24BE1ADC8];
  v6 = objc_opt_class();
  -[CalDAVPostWithSharedAsResponse url](self, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithRootElementNameSpace:name:parseClass:baseURL:", v5, CFSTR("shared-as"), v6, v7);

  return v8;
}

@end
