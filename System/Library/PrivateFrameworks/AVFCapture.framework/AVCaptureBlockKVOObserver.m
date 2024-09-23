@implementation AVCaptureBlockKVOObserver

- (AVCaptureBlockKVOObserver)initWithObjectToObserve:(id)a3 keyPath:(id)a4 options:(unint64_t)a5 handler:(id)a6
{
  AVCaptureBlockKVOObserver *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AVCaptureBlockKVOObserver;
  v10 = -[AVCaptureBlockKVOObserver init](&v12, sel_init);
  if (v10)
  {
    v10->_object = a3;
    v10->_keyPath = (NSString *)a4;
    v10->_handler = a6;
    objc_msgSend(a3, "addObserver:forKeyPath:options:context:", v10, a4, a5, AVCaptureBlockKVOObserverContext);
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[NSObject removeObserver:forKeyPath:](self->_object, "removeObserver:forKeyPath:", self, self->_keyPath);

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureBlockKVOObserver;
  -[AVCaptureBlockKVOObserver dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if ((void *)AVCaptureBlockKVOObserverContext == a6)
  {
    (*((void (**)(void))self->_handler + 2))();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AVCaptureBlockKVOObserver;
    -[AVCaptureBlockKVOObserver observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

@end
