@implementation NSObject(DelayedPerformWithNullSource)

- (void)da_addNullRunLoopSourceAndPerformSelector:()DelayedPerformWithNullSource withObject:afterDelay:inModes:
{
  id v10;
  __CFRunLoop *Current;
  id v12;

  v10 = a6;
  v12 = a5;
  Current = CFRunLoopGetCurrent();
  addNullRunLoopSourceForRunLoopAndModes(Current, v10);
  objc_msgSend(a1, "performSelector:withObject:afterDelay:inModes:", a4, v12, v10, a2);

}

@end
