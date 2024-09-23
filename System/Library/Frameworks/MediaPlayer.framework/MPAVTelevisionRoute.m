@implementation MPAVTelevisionRoute

- (MPAVTelevisionRoute)initWithTelevision:(void *)a3
{
  MPAVTelevisionRoute *v5;
  uint64_t v6;
  NSString *routeName;
  NSDictionary *avRouteDescription;
  MPAVRoute *wirelessDisplayRoute;
  MPAVRouteConnection *v10;
  MPAVRouteConnection *connection;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MPAVTelevisionRoute;
  v5 = -[MPAVTelevisionRoute init](&v14, sel_init);
  if (v5)
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("MPAVTelevisionRoute.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("television"));

    }
    v5->_television = (void *)CFRetain(a3);
    v6 = MRExternalDeviceCopyName();
    routeName = v5->super._routeName;
    v5->super._routeName = (NSString *)v6;

    v5->super._picked = 0;
    avRouteDescription = v5->super._avRouteDescription;
    v5->super._avRouteDescription = 0;

    wirelessDisplayRoute = v5->super._wirelessDisplayRoute;
    v5->super._wirelessDisplayRoute = 0;

    v5->super._displayRouteType = 3;
    v10 = -[MPAVRouteConnection initWithExternalDevice:]([MPAVRouteConnection alloc], "initWithExternalDevice:", v5->_television);
    connection = v5->_connection;
    v5->_connection = v10;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  CFRetain(self->_television);
  v3.receiver = self;
  v3.super_class = (Class)MPAVTelevisionRoute;
  -[MPAVTelevisionRoute dealloc](&v3, sel_dealloc);
}

- (id)connection
{
  return self->_connection;
}

- (id)routeUID
{
  return (id)MRExternalDeviceCopyUniqueIdentifier();
}

- (int64_t)routeType
{
  return 3;
}

- (int64_t)routeSubtype
{
  return 1;
}

- (void)television
{
  return self->_television;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
