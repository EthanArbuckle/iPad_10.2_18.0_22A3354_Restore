@implementation BMStoreEvent(Extras)

- (id)eventTime
{
  id v2;

  v2 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(a1, "timestamp");
  return (id)objc_msgSend(v2, "initWithTimeIntervalSinceReferenceDate:");
}

@end
