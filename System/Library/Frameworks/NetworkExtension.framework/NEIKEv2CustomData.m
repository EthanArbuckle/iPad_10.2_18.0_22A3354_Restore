@implementation NEIKEv2CustomData

- (id)description
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = -[NEIKEv2CustomData customType](self, "customType");
  -[NEIKEv2CustomData customData](self, "customData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Custom Payload %lld: %@"), v4, v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setCustomType:", -[NEIKEv2CustomData customType](self, "customType"));
  -[NEIKEv2CustomData customData](self, "customData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCustomData:", v6);

  return v4;
}

- (unint64_t)customType
{
  return self->_customType;
}

- (void)setCustomType:(unint64_t)a3
{
  self->_customType = a3;
}

- (NSData)customData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCustomData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customData, 0);
}

@end
