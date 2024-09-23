@implementation AVPixelBufferAttributeMediator

- (id)mediatedPixelBufferAttributes
{
  int v2;
  id result;

  v2 = VTPixelBufferAttributesMediatorCopyProperty();
  result = 0;
  if (!v2)
    return 0;
  return result;
}

- (void)setRequestedPixelBufferAttributes:(id)a3 forKey:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (VTPixelBufferAttributesMediatorAddLayer(), !a3))
    VTPixelBufferAttributesMediatorRemoveRequestedPixelBufferAttributesForKey();
  else
    VTPixelBufferAttributesMediatorSetRequestedPixelBufferAttributesForKey();
}

- (void)setLayersAreSuppressed:(BOOL)a3
{
  VTPixelBufferAttributesMediatorSetProperty();
}

- (AVPixelBufferAttributeMediator)init
{
  AVPixelBufferAttributeMediator *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVPixelBufferAttributeMediator;
  v2 = -[AVPixelBufferAttributeMediator init](&v4, sel_init);
  if (v2)
  {
    if (VTPixelBufferAttributesMediatorCreate())
    {

      return 0;
    }
    else
    {
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterAddListener();
    }
  }
  return v2;
}

- (void)removeRequestedPixelBufferAttributesAttributesForKey:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    VTPixelBufferAttributesMediatorRemoveLayer();
  VTPixelBufferAttributesMediatorRemoveRequestedPixelBufferAttributesForKey();
}

- (void)dealloc
{
  OpaqueVTPixelBufferAttributesMediator *mediator;
  objc_super v4;

  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  VTPixelBufferAttributesMediatorNotificationBarrier();
  mediator = self->_mediator;
  if (mediator)
    CFRelease(mediator);
  v4.receiver = self;
  v4.super_class = (Class)AVPixelBufferAttributeMediator;
  -[AVPixelBufferAttributeMediator dealloc](&v4, sel_dealloc);
}

@end
