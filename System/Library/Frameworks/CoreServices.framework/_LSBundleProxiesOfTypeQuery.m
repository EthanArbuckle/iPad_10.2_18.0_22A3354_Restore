@implementation _LSBundleProxiesOfTypeQuery

- (BOOL)bundleUnitMeetsRequirements:(unsigned int)a3 bundleData:(const LSBundleData *)a4 context:(LSContext *)a5
{
  int v5;
  void *v9;
  BOOL v10;
  unint64_t v12;
  unsigned int clas;
  id *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;

  LOBYTE(v5) = 0;
  if (a3 && a4 && a5)
  {
    v9 = (void *)_CSStringCopyCFString();
    if (v9)
    {
      if (-[_LSBundleProxiesOfTypeQuery type](self, "type") == 5)
      {
        v10 = a4->_clas == 13;
        goto LABEL_7;
      }
      if (-[_LSBundleProxiesOfTypeQuery type](self, "type") != 2)
      {
        v12 = -[_LSBundleProxiesOfTypeQuery type](self, "type");
        clas = a4->_clas;
        if (v12 == 7)
        {
          v10 = clas == 14;
LABEL_7:
          LOBYTE(v5) = v10;
          goto LABEL_12;
        }
        if (clas == 2)
        {
          LOBYTE(v5) = 0;
          switch(-[_LSBundleProxiesOfTypeQuery type](self, "type"))
          {
            case 0uLL:
              goto LABEL_24;
            case 1uLL:
              if ((*((_BYTE *)&a4->_clas + 6) & 4) != 0)
                goto LABEL_11;
              goto LABEL_24;
            case 3uLL:
              if ((*((_BYTE *)&a4->_clas + 6) & 4) == 0)
                goto LABEL_11;
              goto LABEL_24;
            case 4uLL:
              if ((*((_BYTE *)&a4->_clas + 6) & 4) != 0)
                goto LABEL_11;
              +[LSApplicationRestrictionsManager sharedInstance]();
              v14 = (id *)objc_claimAutoreleasedReturnValue();
              v15 = -[LSApplicationRestrictionsManager isApplicationRestricted:checkFeatureRestrictions:](v14, v9, 1);

              if ((v15 & 1) != 0)
                goto LABEL_11;
LABEL_24:
              _LSDatabaseGetNSStringFromString(a5->db);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = v16;
              if (v16
                && (v18 = objc_msgSend(v16, "isEqualToString:", CFSTR("Hidden")), v17, (v18 & 1) != 0))
              {
                v5 = v18 ^ 1;
              }
              else
              {
                _LSDatabaseGetNSStringFromString(a5->db);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = v19;
                if (v19)
                  v5 = objc_msgSend(v19, "isEqualToString:", CFSTR("SystemAppPlaceholder")) ^ 1;
                else
                  v5 = 1;

              }
              if (!v5)
                goto LABEL_12;
              if (-[_LSBundleProxiesOfTypeQuery type](self, "type"))
              {
                v10 = (a4->_bundleFlags & 0x200) == 0;
                goto LABEL_7;
              }
              LOBYTE(v5) = 1;
              break;
            default:
              goto LABEL_12;
          }
          goto LABEL_12;
        }
      }
    }
LABEL_11:
    LOBYTE(v5) = 0;
LABEL_12:

  }
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)_requiresDatabaseMappingEntitlement
{
  return 1;
}

+ (id)queryWithType:(unint64_t)a3
{
  uint64_t v6;
  _QWORD *v7;
  void *v9;

  v6 = objc_msgSend(objc_alloc((Class)a1), "_init");
  v7 = (_QWORD *)v6;
  if (a3 == 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSBundleQuery.mm"), 129, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type != LSBundleTypePlugInKitPlugin"));

    if (!v7)
      return v7;
    goto LABEL_3;
  }
  if (v6)
LABEL_3:
    v7[2] = a3;
  return v7;
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  _LSDServiceDomain *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  _LSDServiceDomain *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  void *v20;
  void **v21;
  id v22;
  char v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v24 = 0;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v8 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v21, v8, 0);

  if (v9)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __65___LSBundleProxiesOfTypeQuery__enumerateWithXPCConnection_block___block_invoke;
    v18[3] = &unk_1E1041E30;
    v18[4] = self;
    v20 = v9;
    v10 = v7;
    v19 = v10;
    v11 = _LSEnumerateViableBundlesOfClass(v9, 0, v18);
    if (v11)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v11, (uint64_t)"-[_LSBundleProxiesOfTypeQuery _enumerateWithXPCConnection:block:]", 273, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v12);

    }
  }
  else
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v13 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v14 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v21, v13, 0);

    if (v14)
      v15 = 0;
    else
      v15 = v24;
    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v15);

  }
  if (v21 && v23)
    _LSContextDestroy(v21);
  v16 = v22;
  v21 = 0;
  v22 = 0;

  v23 = 0;
  v17 = v24;
  v24 = 0;

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
  v10.super_class = (Class)_LSBundleProxiesOfTypeQuery;
  if (-[_LSQuery isEqual:](&v10, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "type");
    if (v6 == -[_LSBundleProxiesOfTypeQuery type](self, "type"))
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

  v3 = -[_LSBundleProxiesOfTypeQuery type](self, "type");
  v5.receiver = self;
  v5.super_class = (Class)_LSBundleProxiesOfTypeQuery;
  return -[_LSQuery hash](&v5, sel_hash) ^ (v3 << 16);
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
  v5.super_class = (Class)_LSBundleProxiesOfTypeQuery;
  -[_LSQuery encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[_LSBundleProxiesOfTypeQuery type](self, "type"), CFSTR("type"));

}

- (_LSBundleProxiesOfTypeQuery)initWithCoder:(id)a3
{
  id v4;
  _LSBundleProxiesOfTypeQuery *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_LSBundleProxiesOfTypeQuery;
  v5 = -[_LSQuery initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));

  return v5;
}

@end
