@implementation MKURLContext

- (MKURLContext)initWithOriginatedFromWatch:(BOOL)a3 companionRouteContext:(id)a4
{
  id v6;
  MKURLContext *v7;
  MKURLContext *v8;
  uint64_t v9;
  GEOCompanionRouteContext *companionRouteContext;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MKURLContext;
  v7 = -[MKURLContext init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_originatedFromWatch = a3;
    v9 = objc_msgSend(v6, "copy");
    companionRouteContext = v8->_companionRouteContext;
    v8->_companionRouteContext = (GEOCompanionRouteContext *)v9;

  }
  return v8;
}

- (GEOCompanionRouteContext)companionRouteContext
{
  return self->_companionRouteContext;
}

- (BOOL)originatedFromWatch
{
  return self->_originatedFromWatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionRouteContext, 0);
}

@end
