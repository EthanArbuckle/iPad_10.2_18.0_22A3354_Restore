@implementation NETransparentProxyProviderProtocol

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NETransparentProxyProviderProtocol;
  v4 = a3;
  -[NETunnelProviderProtocol encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[NETransparentProxyProviderProtocol order](self, "order", v5.receiver, v5.super_class), CFSTR("Order"));

}

- (NETransparentProxyProviderProtocol)initWithCoder:(id)a3
{
  id v4;
  NETransparentProxyProviderProtocol *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NETransparentProxyProviderProtocol;
  v5 = -[NETunnelProviderProtocol initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_order = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Order"));

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NETransparentProxyProviderProtocol;
  v4 = -[NETunnelProviderProtocol copyWithZone:](&v6, sel_copyWithZone_, a3);
  if (v4)
    objc_msgSend(v4, "setOrder:", -[NETransparentProxyProviderProtocol order](self, "order"));
  return v4;
}

- (NETransparentProxyProviderProtocol)init
{
  NETransparentProxyProviderProtocol *v2;
  NETransparentProxyProviderProtocol *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NETransparentProxyProviderProtocol;
  v2 = -[NETunnelProviderProtocol init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[NETransparentProxyProviderProtocol setOrder:](v2, "setOrder:", 0x7FFFFFFFLL);
  return v3;
}

- (NETransparentProxyProviderProtocol)initWithPluginType:(id)a3
{
  NETransparentProxyProviderProtocol *v3;
  NETransparentProxyProviderProtocol *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NETransparentProxyProviderProtocol;
  v3 = -[NETunnelProviderProtocol initWithPluginType:](&v6, sel_initWithPluginType_, a3);
  v4 = v3;
  if (v3)
    -[NETransparentProxyProviderProtocol setOrder:](v3, "setOrder:", 0x7FFFFFFFLL);
  return v4;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v11.receiver = self;
  v11.super_class = (Class)NETransparentProxyProviderProtocol;
  -[NETunnelProviderProtocol descriptionWithIndent:options:](&v11, sel_descriptionWithIndent_options_, v5, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

  objc_msgSend(v9, "appendPrettyInt:withName:andIndent:options:", -[NETransparentProxyProviderProtocol order](self, "order"), CFSTR("order"), v5, a4 & 0xFFFFFFFFFFFFFFF7);
  return v9;
}

- (unint64_t)order
{
  return self->_order;
}

- (void)setOrder:(unint64_t)a3
{
  self->_order = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
