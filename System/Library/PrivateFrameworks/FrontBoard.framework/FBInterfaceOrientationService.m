@implementation FBInterfaceOrientationService

- (void)setInterfaceOrientation:(int64_t)a3 animationSettings:(id)a4 direction:(int64_t)a5
{
  self->_interfaceOrientation = a3;
  -[FBInterfaceOrientationServiceServer noteInterfaceOrientationChanged:animationSettings:direction:](self->_server, "noteInterfaceOrientationChanged:animationSettings:direction:");
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_14);
  return (id)sharedInstance___SharedInstance_0;
}

void __47__FBInterfaceOrientationService_sharedInstance__block_invoke()
{
  FBInterfaceOrientationService *v0;
  void *v1;

  v0 = objc_alloc_init(FBInterfaceOrientationService);
  v1 = (void *)sharedInstance___SharedInstance_0;
  sharedInstance___SharedInstance_0 = (uint64_t)v0;

}

- (FBInterfaceOrientationService)init
{
  FBInterfaceOrientationService *v2;
  FBInterfaceOrientationServiceServer *v3;
  FBInterfaceOrientationServiceServer *server;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBInterfaceOrientationService;
  v2 = -[FBInterfaceOrientationService init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(FBInterfaceOrientationServiceServer);
    server = v2->_server;
    v2->_server = v3;

  }
  return v2;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  -[FBInterfaceOrientationService setInterfaceOrientation:animationSettings:direction:](self, "setInterfaceOrientation:animationSettings:direction:", a3, 0, 0);
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
}

@end
