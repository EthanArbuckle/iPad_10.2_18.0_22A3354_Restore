@implementation CTDataUsed

- (CTDataUsed)initWithUsage:(id)a3 proxied:(id)a4
{
  id v7;
  id v8;
  CTDataUsed *v9;
  CTDataUsed *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CTDataUsed;
  v9 = -[CTDataUsed init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_native, a3);
    objc_storeStrong((id *)&v10->_proxied, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTDataUsed native](self, "native");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", native = %@"), v4);

  -[CTDataUsed proxied](self, "proxied");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", proxied = %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[CTDataUsed native](self, "native");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "native");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[CTDataUsed proxied](self, "proxied");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "proxied");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)addUsage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "native");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTDataUsed addNativeUsage:](self, "addNativeUsage:", v5);

  objc_msgSend(v4, "proxied");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[CTDataUsed addProxiedUsage:](self, "addProxiedUsage:", v6);
}

- (void)addNativeUsage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CTDataUsed native](self, "native");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addUsage:", v4);

}

- (void)addProxiedUsage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CTDataUsed proxied](self, "proxied");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addUsage:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTDataUsed native](self, "native");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[1];
  v4[1] = v5;

  -[CTDataUsed proxied](self, "proxied");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CTDataUsed native](self, "native");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("native"));

  -[CTDataUsed proxied](self, "proxied");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("proxied"));

}

- (CTDataUsed)initWithCoder:(id)a3
{
  id v4;
  CTDataUsed *v5;
  uint64_t v6;
  CTDataUsage *native;
  uint64_t v8;
  CTDataUsage *proxied;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTDataUsed;
  v5 = -[CTDataUsed init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("native"));
    v6 = objc_claimAutoreleasedReturnValue();
    native = v5->_native;
    v5->_native = (CTDataUsage *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proxied"));
    v8 = objc_claimAutoreleasedReturnValue();
    proxied = v5->_proxied;
    v5->_proxied = (CTDataUsage *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTDataUsage)native
{
  return self->_native;
}

- (CTDataUsage)proxied
{
  return self->_proxied;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxied, 0);
  objc_storeStrong((id *)&self->_native, 0);
}

@end
