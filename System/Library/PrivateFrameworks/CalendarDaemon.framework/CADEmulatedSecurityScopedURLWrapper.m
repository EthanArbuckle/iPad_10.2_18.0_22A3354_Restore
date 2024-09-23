@implementation CADEmulatedSecurityScopedURLWrapper

- (CADEmulatedSecurityScopedURLWrapper)initWithOriginalURL:(id)a3
{
  id v4;
  CADEmulatedURL *v5;
  CADEmulatedSecurityScopedURLWrapper *v6;
  objc_super v8;

  v4 = a3;
  v5 = -[CADEmulatedURL initWithOriginalURL:]([CADEmulatedURL alloc], "initWithOriginalURL:", v4);

  v8.receiver = self;
  v8.super_class = (Class)CADEmulatedSecurityScopedURLWrapper;
  v6 = -[NSSecurityScopedURLWrapper initWithURL:](&v8, sel_initWithURL_, v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emulatedURL, 0);
}

@end
