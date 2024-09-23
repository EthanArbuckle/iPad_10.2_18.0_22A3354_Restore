@implementation IMDWorkQueue

+ (void)enqueueBlock:(id)a3
{
  MEMORY[0x1E0DE7D20](_IMDInternalWorkQueue, sel_enqueueWorkBlock_);
}

@end
