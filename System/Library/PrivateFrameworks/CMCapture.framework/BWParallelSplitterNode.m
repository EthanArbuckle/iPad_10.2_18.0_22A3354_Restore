@implementation BWParallelSplitterNode

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  objc_super v7;

  if (a3)
    CMSetAttachment(a3, CFSTR("ParallelSplitterInputBuffer"), a3, 1u);
  v7.receiver = self;
  v7.super_class = (Class)BWParallelSplitterNode;
  -[BWFanOutNode renderSampleBuffer:forInput:](&v7, sel_renderSampleBuffer_forInput_, a3, a4);
}

@end
