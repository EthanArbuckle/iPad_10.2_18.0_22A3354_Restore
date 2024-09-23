@implementation MRNowPlayingControllerDestination

- (void)setEndpoint:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MRNowPlayingControllerDestination;
  -[MRDestination setEndpoint:](&v5, sel_setEndpoint_);
  if (!a3)
    self->_isEndpointSet = 0;
}

- (MRNowPlayingControllerDestination)initWithConfiguration:(id)a3
{
  id v4;
  MRNowPlayingControllerDestination *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRNowPlayingControllerDestination;
  v5 = -[MRDestination _init](&v11, sel__init);
  if (v5)
  {
    objc_msgSend(v4, "destination");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "outputDeviceUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDestination setOutputDeviceUID:](v5, "setOutputDeviceUID:", v7);

    objc_msgSend(v4, "destination");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endpoint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRNowPlayingControllerDestination setEndpoint:](v5, "setEndpoint:", v9);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MRNowPlayingControllerDestination;
  v4 = -[MRDestination copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[MRNowPlayingControllerDestination unresolvedPlayerPath](self, "unresolvedPlayerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnresolvedPlayerPath:", v5);

  objc_msgSend(v4, "setIsEndpointSet:", -[MRNowPlayingControllerDestination isEndpointSet](self, "isEndpointSet"));
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MRNowPlayingControllerDestination;
  -[MRDestination description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDestination endpoint](self, "endpoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 || !-[MRNowPlayingControllerDestination isEndpointSet](self, "isEndpointSet"))
  {
    v6 = v3;
  }
  else
  {
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR(">"), &stru_1E30D5AF8, 0, objc_msgSend(v3, "length") - 1, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", CFSTR(" endpoint=NONE>"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (MRPlayerPath)unresolvedPlayerPath
{
  return self->_unresolvedPlayerPath;
}

- (void)setUnresolvedPlayerPath:(id)a3
{
  objc_storeStrong((id *)&self->_unresolvedPlayerPath, a3);
}

- (BOOL)isEndpointSet
{
  return self->_isEndpointSet;
}

- (void)setIsEndpointSet:(BOOL)a3
{
  self->_isEndpointSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unresolvedPlayerPath, 0);
}

@end
