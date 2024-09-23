@implementation DSDeepLinkRepresentation

- (DSDeepLinkRepresentation)initWithOrder:(id)a3 chapters:(id)a4 requiresAuth:(BOOL)a5 flowType:(int64_t)a6 entrypointAnalytic:(id)a7 path:(id)a8
{
  id v15;
  id v16;
  id v17;
  DSDeepLinkRepresentation *v18;
  DSDeepLinkRepresentation *v19;
  id v21;
  objc_super v22;

  v21 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)DSDeepLinkRepresentation;
  v18 = -[DSDeepLinkRepresentation init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_navigationOrder, a3);
    objc_storeStrong((id *)&v19->_navigationChapters, a4);
    v19->_flowRequiresAuth = a5;
    v19->_flowType = a6;
    objc_storeStrong((id *)&v19->_entrypoint, a7);
    objc_storeStrong((id *)&v19->_path, a8);
  }

  return v19;
}

- (NSString)remoteUIURL
{
  __CFString *path;

  if (-[NSString hasPrefix:](self->_path, "hasPrefix:", CFSTR("https")))
    path = (__CFString *)self->_path;
  else
    path = &stru_24EFF4790;
  return (NSString *)path;
}

- (NSArray)navigationOrder
{
  return self->_navigationOrder;
}

- (NSDictionary)navigationChapters
{
  return self->_navigationChapters;
}

- (BOOL)flowRequiresAuth
{
  return self->_flowRequiresAuth;
}

- (int64_t)flowType
{
  return self->_flowType;
}

- (NSString)entrypoint
{
  return self->_entrypoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entrypoint, 0);
  objc_storeStrong((id *)&self->_navigationChapters, 0);
  objc_storeStrong((id *)&self->_navigationOrder, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
