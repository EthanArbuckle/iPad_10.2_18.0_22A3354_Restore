@implementation _LSPlugInPropertyList

- (BOOL)_getPropertyList:(id *)a3
{
  os_unfair_lock_s *p_mergeLock;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  NSDictionary *v11;
  NSDictionary *mergedPlist;
  NSDictionary *v13;

  p_mergeLock = &self->_mergeLock;
  os_unfair_lock_lock(&self->_mergeLock);
  if (!self->_mergedPlist)
  {
    -[_LSLazyPropertyList propertyList](self->_infoPlist);
    v6 = objc_claimAutoreleasedReturnValue();
    -[_LSLazyPropertyList propertyList](self->_sdkPlist);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v6 | v7)
    {
      if (v6)
      {
        objc_msgSend((id)v6, "ls_resolvePlugInKitInfoPlistWithDictionary:", v7);
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = (id)v7;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    v11 = (NSDictionary *)objc_msgSend(v10, "copy");
    mergedPlist = self->_mergedPlist;
    self->_mergedPlist = v11;

  }
  os_unfair_lock_unlock(p_mergeLock);
  v13 = objc_retainAutorelease(self->_mergedPlist);
  *a3 = v13;
  return v13 != 0;
}

- (BOOL)_getValue:(id *)a3 forPropertyListKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v11;

  v11 = 0;
  v6 = a4;
  -[_LSPlugInPropertyList _getPropertyList:](self, "_getPropertyList:", &v11);
  v7 = v11;
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  *a3 = v9;
  return v9 != 0;
}

- (_LSPlugInPropertyList)initWithInfoPlist:(id)a3 SDKPlist:(id)a4
{
  id v7;
  id v8;
  _LSPlugInPropertyList *v9;
  _LSPlugInPropertyList *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[_LSLazyPropertyList init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_infoPlist, a3);
    objc_storeStrong((id *)&v10->_sdkPlist, a4);
    v10->_mergeLock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergedPlist, 0);
  objc_storeStrong((id *)&self->_sdkPlist, 0);
  objc_storeStrong((id *)&self->_infoPlist, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_LSPlugInPropertyList;
  v4 = a3;
  -[_LSLazyPropertyList encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_infoPlist, CFSTR("infoPlist"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sdkPlist, CFSTR("sdkPlist"));

}

- (_LSPlugInPropertyList)initWithCoder:(id)a3
{
  id v4;
  _LSPlugInPropertyList *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_LSPlugInPropertyList;
  v5 = -[_LSLazyPropertyList initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("infoPlist"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sdkPlist"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 | v7)
    {
      objc_storeStrong((id *)&v5->_infoPlist, (id)v6);
      objc_storeStrong((id *)&v5->_sdkPlist, (id)v7);
    }

  }
  return v5;
}

@end
