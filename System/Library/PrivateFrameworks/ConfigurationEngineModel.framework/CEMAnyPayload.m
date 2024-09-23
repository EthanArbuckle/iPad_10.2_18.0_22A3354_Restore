@implementation CEMAnyPayload

+ (id)buildFromDictionary:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "loadPayload:error:", v3, 0);

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  NSDictionary *v5;
  NSDictionary *payloadKeys;

  v5 = (NSDictionary *)objc_msgSend(a3, "copy");
  payloadKeys = self->_payloadKeys;
  self->_payloadKeys = v5;

  return 1;
}

- (id)serializePayload
{
  return (id)-[NSDictionary copy](self->_payloadKeys, "copy");
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  return (id)-[NSDictionary copy](self->_payloadKeys, "copy", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CEMAnyPayload;
  v4 = -[CEMPayloadBase copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSDictionary copy](self->_payloadKeys, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (NSDictionary)payloadKeys
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPayloadKeys:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadKeys, 0);
}

@end
