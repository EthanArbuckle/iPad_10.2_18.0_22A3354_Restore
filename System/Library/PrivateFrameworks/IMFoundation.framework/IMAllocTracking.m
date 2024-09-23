@implementation IMAllocTracking

- (void)_registerCallstack
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  if (!self->_callStacks)
    self->_callStacks = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_msgSend_callStackSymbols(MEMORY[0x1E0CB3978], a2, v2, v3);
  objc_msgSend_addObject_(self->_callStacks, v6, v5, v7);
}

- (IMAllocTracking)retain
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  IMAllocTracking *v6;
  objc_super v8;

  objc_sync_enter(self);
  objc_msgSend__registerCallstack(self, v3, v4, v5);
  v8.receiver = self;
  v8.super_class = (Class)IMAllocTracking;
  v6 = -[IMAllocTracking retain](&v8, sel_retain);
  objc_sync_exit(self);
  return v6;
}

- (void)release
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v6;

  objc_sync_enter(self);
  objc_msgSend__registerCallstack(self, v3, v4, v5);
  v6.receiver = self;
  v6.super_class = (Class)IMAllocTracking;
  -[IMAllocTracking release](&v6, sel_release);
  objc_sync_exit(self);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMAllocTracking;
  -[IMAllocTracking dealloc](&v3, sel_dealloc);
}

@end
