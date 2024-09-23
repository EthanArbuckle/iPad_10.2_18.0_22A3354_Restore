@implementation FigCaptureRemoteQueueSinkPipeline

- (BWRemoteQueueSinkNode)sinkNode
{
  return self->_sinkNode;
}

- (void)setSinkNode:(id)a3
{
  if (self->_sinkNode)
    FigDebugAssert3();
  self->_sinkNode = (BWRemoteQueueSinkNode *)a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureRemoteQueueSinkPipeline;
  -[FigCaptureSinkPipeline dealloc](&v3, sel_dealloc);
}

- (void)updateClientAuditToken:(id *)a3
{
  BWRemoteQueueSinkNode *sinkNode;
  __int128 v4;
  _OWORD v5[2];

  sinkNode = self->_sinkNode;
  v4 = *(_OWORD *)&a3->var0[4];
  v5[0] = *(_OWORD *)a3->var0;
  v5[1] = v4;
  -[BWRemoteQueueSinkNode updateClientAuditToken:](sinkNode, "updateClientAuditToken:", v5);
}

@end
