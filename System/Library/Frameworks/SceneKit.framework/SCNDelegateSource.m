@implementation SCNDelegateSource

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNDelegateSource;
  -[SCNDelegateSource dealloc](&v3, sel_dealloc);
}

- (id)textureSource
{
  SCNTextureDelegateSource *v3;

  v3 = objc_alloc_init(SCNTextureDelegateSource);
  -[SCNTextureDelegateSource setDelegate:](v3, "setDelegate:", -[SCNDelegateSource delegate](self, "delegate"));
  return v3;
}

- (BOOL)isOpaque
{
  return objc_msgSend(-[SCNDelegateSource delegate](self, "delegate"), "isOpaque");
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
