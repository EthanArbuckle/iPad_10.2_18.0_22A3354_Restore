@implementation SUUIRunLoopDelay

- (SUUIRunLoopDelay)initWithRunLoopMode:(id)a3 timeout:(double)a4
{
  id v6;
  SUUIRunLoopDelay *v7;
  uint64_t v8;
  NSString *mode;
  CFRunLoopSourceContext v11;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUIRunLoopDelay;
  v7 = -[SUUIRunLoopDelay init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    mode = v7->_mode;
    v7->_mode = (NSString *)v8;

    v7->_timeout = a4;
    v7->_runLoop = CFRunLoopGetCurrent();
    memset(&v11, 0, sizeof(v11));
    v7->_runLoopSource = CFRunLoopSourceCreate(0, 0, &v11);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  CFRunLoopSourceInvalidate(self->_runLoopSource);
  v3.receiver = self;
  v3.super_class = (Class)SUUIRunLoopDelay;
  -[SUUIRunLoopDelay dealloc](&v3, sel_dealloc);
}

- (void)delayRunLoop
{
  const __CFString *v3;

  v3 = self->_mode;
  CFRunLoopAddSource(self->_runLoop, self->_runLoopSource, v3);
  CFRunLoopRunInMode(v3, self->_timeout, 1u);
  CFRelease(v3);
}

- (void)endDelay
{
  CFRunLoopSourceSignal(self->_runLoopSource);
  CFRunLoopWakeUp(self->_runLoop);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mode, 0);
}

@end
