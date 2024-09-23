@implementation OSLogEventBacktrace

- (NSArray)frames
{
  return self->_frames;
}

- (OSLogEventBacktrace)initWithSingleFrame:(id)a3
{
  OSLogEventBacktrace *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OSLogEventBacktrace;
  v4 = -[OSLogEventBacktrace init](&v6, sel_init);
  if (v4)
    v4->_frames = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", a3, 0);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OSLogEventBacktrace;
  -[OSLogEventBacktrace dealloc](&v3, sel_dealloc);
}

- (OSLogEventBacktrace)initWithBacktrace:(os_log_backtrace_s *)a3
{
  OSLogEventBacktrace *v3;
  uint64_t v4;
  uint64_t frames;
  NSArray *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OSLogEventBacktrace;
  v3 = -[OSLogEventBacktrace init](&v8, sel_init);
  if (v3)
  {
    LODWORD(v4) = os_log_backtrace_get_length();
    frames = os_log_backtrace_get_frames();
    v6 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (int)v4);
    if ((int)v4 >= 1)
    {
      v4 = v4;
      do
      {
        -[NSArray addObject:](v6, "addObject:", -[OSLogEventBacktraceFrame initWithUUIDBytes:andOffset:]([OSLogEventBacktraceFrame alloc], "initWithUUIDBytes:andOffset:", frames, *(unsigned int *)(frames + 16)));
        frames += 20;
        --v4;
      }
      while (v4);
    }
    v3->_frames = v6;
  }
  return v3;
}

- (OSLogEventBacktrace)initWithFrames:(id)a3
{
  OSLogEventBacktrace *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OSLogEventBacktrace;
  v4 = -[OSLogEventBacktrace init](&v6, sel_init);
  if (v4)
    v4->_frames = (NSArray *)a3;
  return v4;
}

@end
