@implementation _LSApplicationProxiesWithFlagsQuery

+ (id)queryWithPlistFlags:(unsigned int)a3 bundleFlags:(unint64_t)a4
{
  uint64_t v6;

  v6 = objc_msgSend(objc_alloc((Class)a1), "_init");
  if (v6)
  {
    *(_DWORD *)(v6 + 12) = a3;
    *(_QWORD *)(v6 + 16) = a4;
  }
  return (id)v6;
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  id v5;
  unsigned int v6;
  unint64_t v7;
  _QWORD v8[5];
  unsigned int v9;

  v5 = a4;
  v6 = -[_LSApplicationProxiesWithFlagsQuery plistFlags](self, "plistFlags");
  v7 = -[_LSApplicationProxiesWithFlagsQuery bundleFlags](self, "bundleFlags");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73___LSApplicationProxiesWithFlagsQuery__enumerateWithXPCConnection_block___block_invoke;
  v8[3] = &__block_descriptor_44_e368_B28__0___LSDatabase_8I16r__LSBundleData__LSBundleBaseData_IIIIIIi_LSVersionNumber__32C___LSVersionNumber__32C__IIIIIIIIIIIIIICCISI_LSBundleBaseFlags_b1b1b1b1b1b1__IQIIC_LSBundleMoreFlags_b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1b1_IiI_LSVersionNumber__32C___LSVersionNumber__32C__IQQQIIIIIIIIIIQIIQQQQIQQIIIQIQIIIIIIIIIIIIIIIIIICCCI_1I_II_LSAppClipFields_I_iIIIIII_20l;
  v9 = v6;
  v8[4] = v7;
  yieldAppsMatchingSearch(v5, v8);

}

- (BOOL)_requiresDatabaseMappingEntitlement
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_LSApplicationProxiesWithFlagsQuery;
  if (-[_LSQuery isEqual:](&v10, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "plistFlags");
    if (v6 == -[_LSApplicationProxiesWithFlagsQuery plistFlags](self, "plistFlags"))
    {
      v7 = objc_msgSend(v5, "bundleFlags");
      v8 = v7 == -[_LSApplicationProxiesWithFlagsQuery bundleFlags](self, "bundleFlags");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  objc_super v6;

  v3 = -[_LSApplicationProxiesWithFlagsQuery plistFlags](self, "plistFlags");
  v4 = -[_LSApplicationProxiesWithFlagsQuery bundleFlags](self, "bundleFlags") ^ (v3 << 32);
  v6.receiver = self;
  v6.super_class = (Class)_LSApplicationProxiesWithFlagsQuery;
  return v4 ^ -[_LSQuery hash](&v6, sel_hash);
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
  v5.super_class = (Class)_LSApplicationProxiesWithFlagsQuery;
  -[_LSQuery encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", -[_LSApplicationProxiesWithFlagsQuery plistFlags](self, "plistFlags"), CFSTR("plistFlags"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[_LSApplicationProxiesWithFlagsQuery bundleFlags](self, "bundleFlags"), CFSTR("bundleFlags"));

}

- (_LSApplicationProxiesWithFlagsQuery)initWithCoder:(id)a3
{
  id v4;
  _LSApplicationProxiesWithFlagsQuery *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_LSApplicationProxiesWithFlagsQuery;
  v5 = -[_LSQuery initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    *((_DWORD *)&v5->super.super._legacy + 1) = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("plistFlags"));
    *(_QWORD *)&v5->_plistFlags = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("bundleFlags"));
  }

  return v5;
}

- (unsigned)plistFlags
{
  return *((_DWORD *)&self->super.super._legacy + 1);
}

- (unint64_t)bundleFlags
{
  return *(_QWORD *)&self->_plistFlags;
}

@end
