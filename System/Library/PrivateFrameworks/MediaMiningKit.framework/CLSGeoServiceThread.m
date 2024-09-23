@implementation CLSGeoServiceThread

- (void)main
{
  void *v3;
  __CFRunLoopSource *v4;
  const __CFString *v5;
  CFRunLoopSourceContext v6;

  v3 = (void *)MEMORY[0x1D1796094](self, a2);
  self->_runLoop = CFRunLoopGetCurrent();
  memset(&v6, 0, sizeof(v6));
  v4 = CFRunLoopSourceCreate(0, 0, &v6);
  v5 = (const __CFString *)*MEMORY[0x1E0C9B280];
  CFRunLoopAddSource(self->_runLoop, v4, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  CFRelease(v4);
  CFRunLoopRun();
  CFRunLoopRemoveSource(self->_runLoop, v4, v5);
  objc_autoreleasePoolPop(v3);
}

- (void)cancel
{
  __CFRunLoop *runLoop;
  objc_super v4;

  runLoop = self->_runLoop;
  if (runLoop)
    CFRunLoopStop(runLoop);
  v4.receiver = self;
  v4.super_class = (Class)CLSGeoServiceThread;
  -[CLSGeoServiceThread cancel](&v4, sel_cancel);
}

@end
