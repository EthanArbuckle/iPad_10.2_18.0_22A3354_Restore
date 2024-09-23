@implementation FigBWNodeRenderObserver

- (void)node:(id)a3 willRenderSampleBuffer:(opaqueCMSampleBuffer *)a4 forInput:(id)a5
{
  void (**willRenderSampleBufferHandler)(id, opaqueCMSampleBuffer *, id);

  willRenderSampleBufferHandler = (void (**)(id, opaqueCMSampleBuffer *, id))self->_willRenderSampleBufferHandler;
  if (willRenderSampleBufferHandler)
    willRenderSampleBufferHandler[2](willRenderSampleBufferHandler, a4, a5);
}

- (void)setWillRenderSampleBufferHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setFormatDidBecomeLiveHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (FigBWNodeRenderObserver)initWithBWNode:(id)a3
{
  FigBWNodeRenderObserver *v4;
  BWNode *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FigBWNodeRenderObserver;
  v4 = -[FigBWNodeRenderObserver init](&v7, sel_init);
  if (v4)
  {
    v5 = (BWNode *)a3;
    v4->_node = v5;
    -[BWNode setRenderDelegate:](v5, "setRenderDelegate:", v4);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[BWNode setRenderDelegate:](self->_node, "setRenderDelegate:", 0);

  v3.receiver = self;
  v3.super_class = (Class)FigBWNodeRenderObserver;
  -[FigBWNodeRenderObserver dealloc](&v3, sel_dealloc);
}

- (void)node:(id)a3 format:(id)a4 didBecomeLiveForInput:(id)a5 configurationID:(int64_t)a6
{
  void (**formatDidBecomeLiveHandler)(id, id, id, int64_t);

  formatDidBecomeLiveHandler = (void (**)(id, id, id, int64_t))self->_formatDidBecomeLiveHandler;
  if (formatDidBecomeLiveHandler)
    formatDidBecomeLiveHandler[2](formatDidBecomeLiveHandler, a4, a5, a6);
}

- (id)willRenderSampleBufferHandler
{
  return self->_willRenderSampleBufferHandler;
}

- (id)formatDidBecomeLiveHandler
{
  return self->_formatDidBecomeLiveHandler;
}

@end
