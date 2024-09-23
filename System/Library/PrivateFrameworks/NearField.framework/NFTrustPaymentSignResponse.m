@implementation NFTrustPaymentSignResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFTrustPaymentSignResponse)initWithCoder:(id)a3
{
  id v4;
  NFTrustPaymentSignResponse *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFTrustPaymentSignResponse;
  v5 = -[NFTrustObject initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signResponse"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFTrustPaymentSignResponse setValue:forKey:](v5, "setValue:forKey:", v6, CFSTR("signResponse"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentResponse"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFTrustPaymentSignResponse setValue:forKey:](v5, "setValue:forKey:", v7, CFSTR("paymentResponse"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NFTrustPaymentSignResponse signResponse](self, "signResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("signResponse"));

  -[NFTrustPaymentSignResponse paymentResponse](self, "paymentResponse");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("paymentResponse"));

}

+ (id)paymentSignResponseWithSignResponse:(id)a3 paymentResponse:(id)a4
{
  id v7;
  id v8;
  NFTrustPaymentSignResponse *v9;
  NFTrustPaymentSignResponse *v10;
  const void **v11;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const char *Name;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = [NFTrustPaymentSignResponse alloc];
    v10 = v9;
    if (v9)
    {
      -[NFTrustPaymentSignResponse setSignResponse:](v9, "setSignResponse:", v7);
      -[NFTrustPaymentSignResponse setPaymentResponse:](v10, "setPaymentResponse:", v8);
    }
  }
  else
  {
    v11 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v17 = 45;
      if (isMetaClass)
        v17 = 43;
      v13(3, "%c[%{public}s %{public}s]:%i Could not create NFTrustPaymentSignResponse with nil NFTrustSignResponse", v17, ClassName, Name, 458);
    }
    dispatch_get_specific(*v11);
    NFSharedLogGetLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = object_getClass(a1);
      if (class_isMetaClass(v19))
        v20 = 43;
      else
        v20 = 45;
      *(_DWORD *)buf = 67109890;
      v24 = v20;
      v25 = 2082;
      v26 = object_getClassName(a1);
      v27 = 2082;
      v28 = sel_getName(a2);
      v29 = 1024;
      v30 = 458;
      _os_log_impl(&dword_19B5EB000, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not create NFTrustPaymentSignResponse with nil NFTrustSignResponse", buf, 0x22u);
    }

    v10 = 0;
  }

  return v10;
}

- (NFTrustSignResponse)signResponse
{
  return self->_signResponse;
}

- (void)setSignResponse:(id)a3
{
  objc_storeStrong((id *)&self->_signResponse, a3);
}

- (NFECommercePaymentResponse)paymentResponse
{
  return self->_paymentResponse;
}

- (void)setPaymentResponse:(id)a3
{
  objc_storeStrong((id *)&self->_paymentResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentResponse, 0);
  objc_storeStrong((id *)&self->_signResponse, 0);
}

@end
