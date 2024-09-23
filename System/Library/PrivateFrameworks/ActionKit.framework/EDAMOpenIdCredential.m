@implementation EDAMOpenIdCredential

+ (id)structName
{
  return CFSTR("OpenIdCredential");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_6029;
  if (!structFields_structFields_6029)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 0, CFSTR("tokenPayload"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 8, 0, CFSTR("serviceProvider"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)structFields_structFields_6029;
    structFields_structFields_6029 = v5;

    v2 = (void *)structFields_structFields_6029;
  }
  return v2;
}

- (NSString)tokenPayload
{
  return self->_tokenPayload;
}

- (void)setTokenPayload:(id)a3
{
  objc_storeStrong((id *)&self->_tokenPayload, a3);
}

- (NSNumber)serviceProvider
{
  return self->_serviceProvider;
}

- (void)setServiceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProvider, 0);
  objc_storeStrong((id *)&self->_tokenPayload, 0);
}

@end
