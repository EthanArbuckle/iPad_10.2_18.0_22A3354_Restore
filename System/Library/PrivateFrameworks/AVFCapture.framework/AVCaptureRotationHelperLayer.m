@implementation AVCaptureRotationHelperLayer

- (AVCaptureRotationHelperLayer)initWithDelegate:(id)a3
{
  AVCaptureRotationHelperLayer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVCaptureRotationHelperLayer;
  v4 = -[AVCaptureRotationHelperLayer init](&v6, sel_init);
  if (v4)
    v4->_delegate = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", a3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureRotationHelperLayer;
  -[AVCaptureRotationHelperLayer dealloc](&v3, sel_dealloc);
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  v5 = (void *)-[AVWeakReference referencedObject](self->_delegate, "referencedObject");
  if (v5)
    objc_msgSend(v5, "layer:didBecomeVisible:", self, v3);
}

@end
