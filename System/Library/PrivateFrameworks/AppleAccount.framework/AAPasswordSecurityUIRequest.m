@implementation AAPasswordSecurityUIRequest

- (id)urlString
{
  void *v2;
  void *v3;

  +[AAURLConfiguration urlConfiguration](AAURLConfiguration, "urlConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passwordSecurityUIURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)urlRequest
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AAPasswordSecurityUIRequest;
  v3 = -[AAAppleIDSettingsRequest urlRequest](&v9, sel_urlRequest);
  v8.receiver = self;
  v8.super_class = (Class)AAPasswordSecurityUIRequest;
  -[AAAppleIDSettingsRequest urlRequest](&v8, sel_urlRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (-[AAPasswordSecurityUIRequest spyglassOptionMask](self, "spyglassOptionMask"))
    objc_msgSend(v5, "aa_addSpyglassModeHeaderWithMask:", -[AAPasswordSecurityUIRequest spyglassOptionMask](self, "spyglassOptionMask"));
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (unint64_t)spyglassOptionMask
{
  return self->_spyglassOptionMask;
}

- (void)setSpyglassOptionMask:(unint64_t)a3
{
  self->_spyglassOptionMask = a3;
}

@end
