@implementation APSystemClock

- (id)now
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_date(MEMORY[0x1E0C99D68], a2, v2, v3);
}

@end
