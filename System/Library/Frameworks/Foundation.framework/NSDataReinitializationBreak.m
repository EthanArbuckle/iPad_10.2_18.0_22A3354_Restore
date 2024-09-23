@implementation NSDataReinitializationBreak

void ___NSDataReinitializationBreak_block_invoke()
{
  NSLog((NSString *)CFSTR("You should not call an -init method on object has already been initialized, like [NSData data]. Break on _NSDataReinitializationBreak to debug. This message will only be logged once."));
}

@end
