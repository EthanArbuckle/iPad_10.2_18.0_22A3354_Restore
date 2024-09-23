@implementation NFCVASResponse

- (NFCVASResponse)init
{
  void *v3;
  void *v4;
  NFCVASResponse *v5;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = -[NFCVASResponse initWithStatus:data:mobileToken:](self, "initWithStatus:data:mobileToken:", 0, v3, v4);

  return v5;
}

- (NFCVASResponse)initWithStatus:(int64_t)a3 data:(id)a4 mobileToken:(id)a5
{
  id v9;
  id v10;
  NFCVASResponse *v11;
  NFCVASResponse *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NFCVASResponse;
  v11 = -[NFCVASResponse init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_status = a3;
    objc_storeStrong((id *)&v11->_vasData, a4);
    objc_storeStrong((id *)&v12->_mobileToken, a5);
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStatus:data:mobileToken:", self->_status, self->_vasData, self->_mobileToken);
}

- (NFCVASErrorCode)status
{
  return self->_status;
}

- (NSData)vasData
{
  return self->_vasData;
}

- (NSData)mobileToken
{
  return self->_mobileToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileToken, 0);
  objc_storeStrong((id *)&self->_vasData, 0);
}

@end
