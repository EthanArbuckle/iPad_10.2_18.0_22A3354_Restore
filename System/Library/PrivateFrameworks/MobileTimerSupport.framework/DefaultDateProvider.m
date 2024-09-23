@implementation DefaultDateProvider

- (id)date
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "now");
}

@end
