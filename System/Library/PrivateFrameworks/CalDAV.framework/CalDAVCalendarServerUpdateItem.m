@implementation CalDAVCalendarServerUpdateItem

- (CalDAVCalendarServerUpdateItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], CFSTR("update"));
}

@end
