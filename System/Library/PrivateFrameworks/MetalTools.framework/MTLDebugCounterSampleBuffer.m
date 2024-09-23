@implementation MTLDebugCounterSampleBuffer

- (MTLDebugCounterSampleBuffer)initWithCounterSampleBuffer:(id)a3 device:(id)a4 descriptor:(id)a5
{
  MTLDebugCounterSampleBuffer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLDebugCounterSampleBuffer;
  v6 = -[MTLToolsObject initWithBaseObject:parent:](&v8, sel_initWithBaseObject_parent_, a3, a4);
  if (v6)
  {
    v6->_descriptor = (MTLCounterSampleBufferDescriptor *)objc_msgSend(a5, "copy");
    v6->_storageMode = objc_msgSend(a5, "storageMode");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_descriptor = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugCounterSampleBuffer;
  -[MTLToolsObject dealloc](&v3, sel_dealloc);
}

- (id)formattedDescription:(unint64_t)a3
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3 + 4;
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "formattedDescription:", v4);
  v10[0] = v5;
  v10[1] = CFSTR("label =");
  if (-[MTLToolsCounterSampleBuffer label](self, "label"))
    v8 = -[MTLToolsCounterSampleBuffer label](self, "label");
  else
    v8 = CFSTR("<none>");
  v10[2] = v8;
  return (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v7, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 3), "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  return -[MTLDebugCounterSampleBuffer formattedDescription:](self, "formattedDescription:", 0);
}

- (id)resolveCounterRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  NSUInteger v8;
  unint64_t v9;

  length = a3.length;
  location = a3.location;
  v6 = a3.location + a3.length;
  if (a3.location + a3.length > -[MTLToolsCounterSampleBuffer sampleCount](self, "sampleCount"))
  {
    v8 = v6;
    v9 = -[MTLToolsCounterSampleBuffer sampleCount](self, "sampleCount");
    MTLReportFailure();
  }
  if (-[MTLDebugCounterSampleBuffer storageMode](self, "storageMode", v8, v9) == 2)
    MTLReportFailure();
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resolveCounterRange:", location, length);
}

- (MTLCounterSampleBufferDescriptor)descriptor
{
  return self->_descriptor;
}

- (unint64_t)storageMode
{
  return self->_storageMode;
}

@end
