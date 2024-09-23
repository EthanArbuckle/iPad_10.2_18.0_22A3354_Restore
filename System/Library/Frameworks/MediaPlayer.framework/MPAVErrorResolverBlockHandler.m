@implementation MPAVErrorResolverBlockHandler

- (MPAVErrorResolverBlockHandler)initWithErrorResolver:(id)a3
{
  id v5;
  MPAVErrorResolverBlockHandler *v6;
  MPAVErrorResolverBlockHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPAVErrorResolverBlockHandler;
  v6 = -[MPAVErrorResolverBlockHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_errorResolver, a3);
    -[MPAVErrorResolver setDelegate:](v7->_errorResolver, "setDelegate:", v7);
  }

  return v7;
}

- (void)errorResolver:(id)a3 didResolveError:(id)a4 withResolution:(int64_t)a5
{
  void (**resolutionHandler)(id, int64_t, id, id);
  id v7;
  MPAVErrorResolverBlockHandler *strongSelf;

  resolutionHandler = (void (**)(id, int64_t, id, id))self->_resolutionHandler;
  if (resolutionHandler)
  {
    resolutionHandler[2](resolutionHandler, a5, a3, a4);
    v7 = self->_resolutionHandler;
    self->_resolutionHandler = 0;

    strongSelf = self->_strongSelf;
    self->_strongSelf = 0;

  }
}

- (void)resolveError:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_strongSelf, self);
  v5 = a3;
  -[MPAVErrorResolver resolveError:](self->_errorResolver, "resolveError:", v5);

}

- (MPAVErrorResolver)errorResolver
{
  return self->_errorResolver;
}

- (id)resolutionHandler
{
  return self->_resolutionHandler;
}

- (void)setResolutionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resolutionHandler, 0);
  objc_storeStrong((id *)&self->_errorResolver, 0);
  objc_storeStrong((id *)&self->_strongSelf, 0);
}

@end
