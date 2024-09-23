@implementation FigCaptureSourcePipeline

- (NSString)sourceID
{
  return self->_sourceID;
}

- (FigCaptureSourcePipeline)initWithGraph:(id)a3 name:(id)a4 sourceID:(id)a5
{
  FigCaptureSourcePipeline *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FigCaptureSourcePipeline;
  v6 = -[FigCapturePipeline initWithGraph:name:](&v8, sel_initWithGraph_name_, a3, a4);
  if (v6)
    v6->_sourceID = (NSString *)a5;
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSourcePipeline;
  -[FigCapturePipeline dealloc](&v3, sel_dealloc);
}

@end
