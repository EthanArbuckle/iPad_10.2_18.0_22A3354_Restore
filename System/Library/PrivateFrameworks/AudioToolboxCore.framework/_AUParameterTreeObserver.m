@implementation _AUParameterTreeObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  (*((void (**)(void))self->_callback + 2))();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_AUParameterTreeObserver;
  -[_AUParameterTreeObserver dealloc](&v3, sel_dealloc);
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
}

@end
