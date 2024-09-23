@implementation MBGetLogDateFormatter

uint64_t __MBGetLogDateFormatter_block_invoke()
{
  MBGetLogDateFormatter_formatter = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend((id)MBGetLogDateFormatter_formatter, "setFormatterBehavior:", 1040);
  return objc_msgSend((id)MBGetLogDateFormatter_formatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSS"));
}

@end
