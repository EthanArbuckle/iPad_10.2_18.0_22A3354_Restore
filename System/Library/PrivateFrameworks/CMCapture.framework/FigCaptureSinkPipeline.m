@implementation FigCaptureSinkPipeline

- (NSString)sinkID
{
  return self->_sinkID;
}

- (void)setDiscardsSampleData:(BOOL)a3
{
  -[BWNodeOutput setDiscardsSampleData:](self->_upstreamOutput, "setDiscardsSampleData:", a3);
}

- (BOOL)discardsSampleData
{
  return -[BWNodeOutput discardsSampleData](self->_upstreamOutput, "discardsSampleData");
}

- (void)setUpstreamOutput:(id)a3
{
  if (self->_upstreamOutput)
    FigDebugAssert3();
  self->_upstreamOutput = (BWNodeOutput *)a3;
}

- (FigCaptureSinkPipeline)initWithGraph:(id)a3 name:(id)a4 sinkID:(id)a5
{
  FigCaptureSinkPipeline *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FigCaptureSinkPipeline;
  v6 = -[FigCapturePipeline initWithGraph:name:](&v8, sel_initWithGraph_name_, a3, a4);
  if (v6)
    v6->_sinkID = (NSString *)a5;
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSinkPipeline;
  -[FigCapturePipeline dealloc](&v3, sel_dealloc);
}

@end
