@implementation MTLGPUDebugStackOverflowErrorLog

- (id)description
{
  uint64_t v4[3];

  GPUDebugFunctionInfo::GPUDebugFunctionInfo(v4, -[MTLGPUDebugGPULog function](self, "function"));
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Stack Overflow executing %@\n%@"), -[MTLGPUDebugGPULog functionDescription](self, "functionDescription"), -[MTLGPUDebugGPULog locationDescription](self, "locationDescription"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLGPUDebugStackOverflowErrorLog;
  -[MTLGPUDebugGPULog dealloc](&v3, sel_dealloc);
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

@end
