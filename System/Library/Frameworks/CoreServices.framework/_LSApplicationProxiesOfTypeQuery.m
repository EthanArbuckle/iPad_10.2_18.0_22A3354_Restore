@implementation _LSApplicationProxiesOfTypeQuery

+ (id)queryWithType:(unint64_t)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "_init");
  if (v4)
    v4[2] = a3;
  return v4;
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  id v5;
  unint64_t v6;
  __CFString *v7;
  __CFString *v8;
  _QWORD v9[4];
  __CFString *v10;

  v5 = a4;
  v6 = -[_LSApplicationProxiesOfTypeQuery type](self, "type");
  if (v6 >= 3)
    v7 = 0;
  else
    v7 = *off_1E1041EC0[v6];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70___LSApplicationProxiesOfTypeQuery__enumerateWithXPCConnection_block___block_invoke;
  v9[3] = &unk_1E1041E58;
  v10 = v7;
  v8 = v7;
  yieldAppsMatchingSearch(v5, v9);

}

- (BOOL)_requiresDatabaseMappingEntitlement
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_LSApplicationProxiesOfTypeQuery;
  if (-[_LSQuery isEqual:](&v10, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "type");
    if (v6 == -[_LSApplicationProxiesOfTypeQuery type](self, "type"))
    {
      v7 = objc_msgSend(v5, "isLegacy");
      v8 = v7 ^ -[_LSQuery isLegacy](self, "isLegacy") ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v3 = -[_LSApplicationProxiesOfTypeQuery type](self, "type");
  v5.receiver = self;
  v5.super_class = (Class)_LSApplicationProxiesOfTypeQuery;
  return -[_LSQuery hash](&v5, sel_hash) | (v3 << 16);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_LSApplicationProxiesOfTypeQuery;
  -[_LSQuery encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[_LSApplicationProxiesOfTypeQuery type](self, "type"), CFSTR("type"));

}

- (_LSApplicationProxiesOfTypeQuery)initWithCoder:(id)a3
{
  id v4;
  _LSApplicationProxiesOfTypeQuery *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_LSApplicationProxiesOfTypeQuery;
  v5 = -[_LSQuery initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

@end
