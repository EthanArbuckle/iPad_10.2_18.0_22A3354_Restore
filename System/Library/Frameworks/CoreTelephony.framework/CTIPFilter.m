@implementation CTIPFilter

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", id=%lu"), -[CTIPFilter filterId](self, "filterId"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", precedence=%lu"), -[CTIPFilter precedence](self, "precedence"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", ipProtocol=%lu"), -[CTIPFilter ipProtocol](self, "ipProtocol"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", ipFamilyProtocol=%lu"), -[CTIPFilter ipFamilyProtocol](self, "ipFamilyProtocol"));
  -[CTIPFilter tos](self, "tos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CTIPFilter tos](self, "tos");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", tos=%@"), v5);

  }
  -[CTIPFilter tosMask](self, "tosMask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CTIPFilter tosMask](self, "tosMask");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", tosMask=%@"), v7);

  }
  -[CTIPFilter src](self, "src");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CTIPFilter src](self, "src");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", src=%@"), v9);

  }
  -[CTIPFilter dst](self, "dst");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CTIPFilter dst](self, "dst");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", dst=%@"), v11);

  }
  -[CTIPFilter flowLabel](self, "flowLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CTIPFilter flowLabel](self, "flowLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", flowLabel=%@"), v13);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setFilterId:", -[CTIPFilter filterId](self, "filterId"));
  objc_msgSend(v4, "setPrecedence:", -[CTIPFilter precedence](self, "precedence"));
  objc_msgSend(v4, "setIpProtocol:", -[CTIPFilter ipProtocol](self, "ipProtocol"));
  objc_msgSend(v4, "setIpFamilyProtocol:", -[CTIPFilter ipFamilyProtocol](self, "ipFamilyProtocol"));
  -[CTIPFilter tos](self, "tos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setTos:", v6);

  -[CTIPFilter tosMask](self, "tosMask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setTosMask:", v8);

  -[CTIPFilter src](self, "src");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setSrc:", v10);

  -[CTIPFilter dst](self, "dst");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setDst:", v12);

  -[CTIPFilter flowLabel](self, "flowLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setFlowLabel:", v14);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[CTIPFilter filterId](self, "filterId"), CFSTR("id"));
  objc_msgSend(v4, "encodeInt:forKey:", -[CTIPFilter precedence](self, "precedence"), CFSTR("precedence"));
  objc_msgSend(v4, "encodeInt:forKey:", -[CTIPFilter ipProtocol](self, "ipProtocol"), CFSTR("ipProtocol"));
  objc_msgSend(v4, "encodeInt:forKey:", -[CTIPFilter ipFamilyProtocol](self, "ipFamilyProtocol"), CFSTR("ipFamilyProtocol"));
  -[CTIPFilter tos](self, "tos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("tos"));

  -[CTIPFilter tosMask](self, "tosMask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("tosMask"));

  -[CTIPFilter src](self, "src");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("src"));

  -[CTIPFilter dst](self, "dst");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("dst"));

  -[CTIPFilter flowLabel](self, "flowLabel");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("flowLabel"));

}

- (CTIPFilter)initWithCoder:(id)a3
{
  id v4;
  CTIPFilter *v5;
  uint64_t v6;
  NSNumber *tos;
  uint64_t v8;
  NSNumber *tosMask;
  uint64_t v10;
  CTIPFilterEndpoint *src;
  uint64_t v12;
  CTIPFilterEndpoint *dst;
  uint64_t v14;
  NSNumber *flowLabel;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CTIPFilter;
  v5 = -[CTIPFilter init](&v17, sel_init);
  if (v5)
  {
    v5->_filterId = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("id"));
    v5->_precedence = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("precedence"));
    v5->_ipProtocol = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("ipProtocol"));
    v5->_ipFamilyProtocol = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("ipFamilyProtocol"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tos"));
    v6 = objc_claimAutoreleasedReturnValue();
    tos = v5->_tos;
    v5->_tos = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tosMask"));
    v8 = objc_claimAutoreleasedReturnValue();
    tosMask = v5->_tosMask;
    v5->_tosMask = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("src"));
    v10 = objc_claimAutoreleasedReturnValue();
    src = v5->_src;
    v5->_src = (CTIPFilterEndpoint *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dst"));
    v12 = objc_claimAutoreleasedReturnValue();
    dst = v5->_dst;
    v5->_dst = (CTIPFilterEndpoint *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("flowLabel"));
    v14 = objc_claimAutoreleasedReturnValue();
    flowLabel = v5->_flowLabel;
    v5->_flowLabel = (NSNumber *)v14;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isTcp
{
  return -[CTIPFilter ipProtocol](self, "ipProtocol") == 6 || -[CTIPFilter ipProtocol](self, "ipProtocol") == 0;
}

- (BOOL)isUdp
{
  return -[CTIPFilter ipProtocol](self, "ipProtocol") == 17 || -[CTIPFilter ipProtocol](self, "ipProtocol") == 0;
}

- (BOOL)isAnyIpProtocol
{
  return -[CTIPFilter ipProtocol](self, "ipProtocol") == 0;
}

- (BOOL)isIpv4
{
  return -[CTIPFilter ipFamilyProtocol](self, "ipFamilyProtocol") == 4
      || -[CTIPFilter ipFamilyProtocol](self, "ipFamilyProtocol") == 0;
}

- (BOOL)isIpv6
{
  return -[CTIPFilter ipFamilyProtocol](self, "ipFamilyProtocol") == 41
      || -[CTIPFilter ipFamilyProtocol](self, "ipFamilyProtocol") == 0;
}

- (BOOL)isAnyIpFamilyProtocol
{
  return -[CTIPFilter ipFamilyProtocol](self, "ipFamilyProtocol") == 0;
}

- (unint64_t)filterId
{
  return self->_filterId;
}

- (void)setFilterId:(unint64_t)a3
{
  self->_filterId = a3;
}

- (unint64_t)precedence
{
  return self->_precedence;
}

- (void)setPrecedence:(unint64_t)a3
{
  self->_precedence = a3;
}

- (unint64_t)ipProtocol
{
  return self->_ipProtocol;
}

- (void)setIpProtocol:(unint64_t)a3
{
  self->_ipProtocol = a3;
}

- (unint64_t)ipFamilyProtocol
{
  return self->_ipFamilyProtocol;
}

- (void)setIpFamilyProtocol:(unint64_t)a3
{
  self->_ipFamilyProtocol = a3;
}

- (CTIPFilterEndpoint)src
{
  return self->_src;
}

- (void)setSrc:(id)a3
{
  objc_storeStrong((id *)&self->_src, a3);
}

- (CTIPFilterEndpoint)dst
{
  return self->_dst;
}

- (void)setDst:(id)a3
{
  objc_storeStrong((id *)&self->_dst, a3);
}

- (NSNumber)tos
{
  return self->_tos;
}

- (void)setTos:(id)a3
{
  objc_storeStrong((id *)&self->_tos, a3);
}

- (NSNumber)tosMask
{
  return self->_tosMask;
}

- (void)setTosMask:(id)a3
{
  objc_storeStrong((id *)&self->_tosMask, a3);
}

- (NSNumber)flowLabel
{
  return self->_flowLabel;
}

- (void)setFlowLabel:(id)a3
{
  objc_storeStrong((id *)&self->_flowLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowLabel, 0);
  objc_storeStrong((id *)&self->_tosMask, 0);
  objc_storeStrong((id *)&self->_tos, 0);
  objc_storeStrong((id *)&self->_dst, 0);
  objc_storeStrong((id *)&self->_src, 0);
}

@end
