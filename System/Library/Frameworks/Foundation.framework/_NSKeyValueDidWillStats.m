@implementation _NSKeyValueDidWillStats

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSKeyValueDidWillStats;
  -[_NSKeyValueDidWillStats dealloc](&v3, sel_dealloc);
}

- (void)_recordThread
{
  NSThread *v3;
  NSThread *originalThread;

  v3 = +[NSThread currentThread](NSThread, "currentThread");
  originalThread = self->_originalThread;
  if (originalThread)
    self->_detectedIssues.hasWillDidThreadMismatch = originalThread != v3;
  else
    self->_originalThread = v3;
}

@end
