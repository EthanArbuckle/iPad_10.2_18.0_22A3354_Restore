@implementation NSLock(MessageAdditions)

- (uint64_t)mf_waitForLock
{
  id v2;
  const __CFString *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if ((objc_msgSend(a1, "lockBeforeDate:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 2.0)) & 1) == 0)
  {
    v3 = (const __CFString *)*MEMORY[0x1E0C9B270];
    do
      CFRunLoopRunInMode(v3, 0.5, 0);
    while (!objc_msgSend(a1, "lockBeforeDate:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 2.0)));
  }
  return objc_msgSend(v2, "drain");
}

@end
