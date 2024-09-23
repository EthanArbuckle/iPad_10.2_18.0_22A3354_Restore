@implementation CBActivityAttribution

- (CBActivityAttribution)initWithSTActivityAttribution:(id)a3
{
  id v4;
  CBActivityAttribution *v5;
  uint64_t v6;
  NSObject *v7;
  STActivityAttribution *v8;
  STActivityAttribution *attribution;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  NSBundle *v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *v19;
  NSString *attributionGroup;
  objc_super v22;
  uint8_t buf[4];
  id v24;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CBActivityAttribution;
  v5 = -[CBActivityAttribution init](&v22, "init");
  if (v5)
  {
    v6 = CheckerBoardLogHandleForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Creating CBActivityAttribution for STActivityAttribution %@", buf, 0xCu);
    }

    v8 = (STActivityAttribution *)objc_msgSend(v4, "copy");
    attribution = v5->_attribution;
    v5->_attribution = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributedEntity"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundlePath"));
    if (v11 || (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "executablePath"))) != 0)
    {
      v12 = BSPathExistsOnSystemPartition(v11) ^ 1;

    }
    else
    {
      v12 = 1;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedDisplayName"));
    v15 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(STStatusServer, v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SYSTEM_ATTRIBUTION_STRING"), 0, CFSTR("SystemStatusServer")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_ATTRIBUTION_STRING"), 0, CFSTR("SystemStatusServer")));
    if ((v12 & 1) != 0
      || (objc_msgSend(v13, "isEqualToString:", v18) & 1) != 0
      || (objc_msgSend(v13, "isEqualToString:", v17) & 1) != 0)
    {
      v19 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
    }
    else
    {
      v19 = v13;
    }
    attributionGroup = v5->_attributionGroup;
    v5->_attributionGroup = v19;

  }
  return v5;
}

- (id)_activityAttribution
{
  return self->_attribution;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  void *v4;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STActivityAttribution attributedEntity](self->_attribution, "attributedEntity"));
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "auditToken");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (NSString)bundleIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STActivityAttribution attributedEntity](self->_attribution, "attributedEntity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bundleIdentifier"));

  return (NSString *)v3;
}

- (NSString)activeEntityBundleIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STActivityAttribution activeEntity](self->_attribution, "activeEntity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bundleIdentifier"));

  return (NSString *)v3;
}

- (NSString)displayName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STActivityAttribution attributedEntity](self->_attribution, "attributedEntity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedDisplayName"));

  return (NSString *)v3;
}

- (NSString)executableDisplayName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STActivityAttribution attributedEntity](self->_attribution, "attributedEntity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedExecutableDisplayName"));

  return (NSString *)v3;
}

- (NSString)website
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STActivityAttribution attributedEntity](self->_attribution, "attributedEntity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "website"));

  return (NSString *)v3;
}

- (BOOL)isSystemService
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STActivityAttribution attributedEntity](self->_attribution, "attributedEntity"));
  v3 = objc_msgSend(v2, "isSystemService");

  return v3;
}

- (BOOL)hasMatchingAttributedEntity:(id)a3
{
  return objc_msgSend(a3, "isEqual:", self->_attribution);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BSEqualsBuilder *v6;
  void *v7;
  STActivityAttribution *attribution;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v6 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:](BSEqualsBuilder, "builderWithObject:ofExpectedClass:", v4, objc_opt_class(CBActivityAttribution, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  attribution = self->_attribution;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001D38C;
  v12[3] = &unk_100075BE8;
  v13 = v4;
  v9 = v4;
  v10 = objc_msgSend(v7, "appendObject:counterpart:", attribution, v12);
  LOBYTE(attribution) = objc_msgSend(v7, "isEqual");

  return (char)attribution;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](BSHashBuilder, "builder"));
  v4 = objc_msgSend(v3, "appendObject:", self->_attribution);
  v5 = objc_msgSend(v3, "hash");

  return (unint64_t)v5;
}

- (NSString)description
{
  return (NSString *)-[CBActivityAttribution succinctDescription](self, "succinctDescription");
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CBActivityAttribution succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "build"));

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBActivityAttribution displayName](self, "displayName"));
  v5 = objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("displayName"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBActivityAttribution bundleIdentifier](self, "bundleIdentifier"));
  v7 = objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("bundleIdentifier"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBActivityAttribution website](self, "website"));
  v9 = objc_msgSend(v3, "appendBool:withName:", objc_msgSend(v8, "length") != 0, CFSTR("website-non-nil"));

  v10 = objc_msgSend(v3, "appendBool:withName:", -[CBActivityAttribution isSystemService](self, "isSystemService"), CFSTR("isSystemService"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBActivityAttribution descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  CBActivityAttribution *v10;

  v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001D610;
  v8[3] = &unk_1000754E8;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v9 = v5;
  v10 = self;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v8);

  v6 = v5;
  return v6;
}

- (NSString)attributionGroup
{
  return self->_attributionGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionGroup, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
}

@end
