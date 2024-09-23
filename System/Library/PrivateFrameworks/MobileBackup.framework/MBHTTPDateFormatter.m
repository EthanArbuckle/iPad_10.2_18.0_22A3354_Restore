@implementation MBHTTPDateFormatter

uint64_t __MBHTTPDateFormatter_block_invoke()
{
  id v0;

  MBHTTPDateFormatter_formatter = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB3578]);
  v0 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US"));
  objc_msgSend((id)MBHTTPDateFormatter_formatter, "setLocale:", v0);
  return objc_msgSend((id)MBHTTPDateFormatter_formatter, "setDateFormat:", CFSTR("EEE, dd MMM yyyy HH:mm:ss z"));
}

@end
