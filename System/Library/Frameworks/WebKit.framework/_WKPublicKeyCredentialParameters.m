@implementation _WKPublicKeyCredentialParameters

- (_WKPublicKeyCredentialParameters)initWithAlgorithm:(id)a3
{
  _WKPublicKeyCredentialParameters *v4;
  _WKPublicKeyCredentialParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_WKPublicKeyCredentialParameters;
  v4 = -[_WKPublicKeyCredentialParameters init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[_WKPublicKeyCredentialParameters setAlgorithm:](v4, "setAlgorithm:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_WKPublicKeyCredentialParameters;
  -[_WKPublicKeyCredentialParameters dealloc](&v3, sel_dealloc);
}

- (NSNumber)algorithm
{
  return self->_algorithm;
}

- (void)setAlgorithm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
