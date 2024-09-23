@implementation HMFMutableHTTPResponse

- (id)copyWithZone:(_NSZone *)a3
{
  HMFHTTPResponse *v4;
  void *v5;
  void *v6;
  void *v7;
  HMFHTTPResponse *v8;

  v4 = +[HMFHTTPResponse allocWithZone:](HMFHTTPResponse, "allocWithZone:", a3);
  -[HMFHTTPResponse request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFHTTPResponse internal](self, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  v8 = -[HMFHTTPResponse initWithRequest:internalResponse:](v4, "initWithRequest:internalResponse:", v5, v7);

  return v8;
}

- (void)setBody:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMFHTTPResponse internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBody:", v4);

}

- (void)setHeaderValue:(id)a3 forHeaderKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMFHTTPResponse internal](self, "internal");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHeaderValue:forHeaderKey:", v7, v6);

}

@end
