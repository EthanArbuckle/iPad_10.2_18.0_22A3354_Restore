@implementation FCCKDirectRequestOperationURLCache

- (void)storeCachedResponse:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "HTTPMethod");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("GET"));

  if (v9)
  {
    v10.receiver = self;
    v10.super_class = (Class)FCCKDirectRequestOperationURLCache;
    -[NSURLCache storeCachedResponse:forRequest:](&v10, sel_storeCachedResponse_forRequest_, v6, v7);
  }

}

@end
