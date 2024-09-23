@implementation SLFacebookRequest

- (SLFacebookRequest)initWithURL:(id)a3 parameters:(id)a4 requestMethod:(int64_t)a5
{
  id v8;
  SLFacebookRequest *v9;
  void *v10;
  objc_super v12;

  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SLFacebookRequest;
  v9 = -[SLRequest initWithServiceType:URL:parameters:requestMethod:](&v12, sel_initWithServiceType_URL_parameters_requestMethod_, CFSTR("com.apple.social.facebook"), a3, v8, a5);
  if (v9)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("format"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      -[SLFacebookRequest setResponseDataFormat:](v9, "setResponseDataFormat:", 2);
  }

  return v9;
}

- (id)preparedURLRequest
{
  objc_super v4;

  -[SLFacebookRequest preflightRequest](self, "preflightRequest");
  v4.receiver = self;
  v4.super_class = (Class)SLFacebookRequest;
  -[SLRequest preparedURLRequest](&v4, sel_preparedURLRequest);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setAccessToken:(id)a3
{
  if (a3)
    -[SLRequest setParameterValue:forKey:](self, "setParameterValue:forKey:", a3, CFSTR("access_token"));
  else
    -[SLRequest removeParameterForKey:](self, "removeParameterForKey:", CFSTR("access_token"));
}

- (NSString)accessToken
{
  return (NSString *)-[SLRequest parameterForKey:](self, "parameterForKey:", CFSTR("access_token"));
}

- (void)setResponseDataFormat:(int)a3
{
  const __CFString *v3;

  if (a3 == 2)
    v3 = CFSTR("json");
  else
    v3 = CFSTR("xml");
  -[SLRequest setParameterValue:forKey:](self, "setParameterValue:forKey:", v3, CFSTR("format"));
}

- (int)responseDataFormat
{
  void *v2;
  void *v3;
  int v4;

  -[SLRequest parameterForKey:](self, "parameterForKey:", CFSTR("format"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "isEqualToString:", CFSTR("json")))
      v4 = 2;
    else
      v4 = 0;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

@end
