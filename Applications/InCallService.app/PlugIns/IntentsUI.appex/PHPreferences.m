@implementation PHPreferences

- (NSString)domain
{
  NSString *domain;
  NSBundle *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  domain = self->_domain;
  if (!domain)
  {
    v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
    v7 = self->_domain;
    self->_domain = v6;

    domain = self->_domain;
  }
  return domain;
}

- (id)preferencesValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHPreferences domain](self, "domain"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHPreferences preferencesValueForKey:domain:](self, "preferencesValueForKey:domain:", v4, v5));

  return v6;
}

- (id)preferencesValueForKey:(id)a3 domain:(id)a4
{
  return PHPreferencesGetValueInDomain(a3, a4);
}

- (void)setPreferencesValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[PHPreferences domain](self, "domain"));
  -[PHPreferences setPreferencesValue:forKey:domain:](self, "setPreferencesValue:forKey:domain:", v7, v6, v8);

}

- (void)setPreferencesValue:(id)a3 forKey:(id)a4 domain:(id)a5
{
  PHPreferencesSetValueInDomain(a4, a3, a5);
}

- (BOOL)BOOLForKey:(id)a3 defaultValue:(BOOL)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHPreferences numberForKey:defaultValue:](self, "numberForKey:defaultValue:", a3, 0));
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  -[PHPreferences setNumber:forKey:](self, "setNumber:forKey:", v7, v6);

}

- (id)numberForKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHPreferences preferencesValueForKey:](self, "preferencesValueForKey:", a3));
  v8 = objc_opt_class(NSNumber);
  v9 = v6;
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = v7;

  }
  return v9;
}

- (void)setNumber:(id)a3 forKey:(id)a4
{
  -[PHPreferences setPreferencesValue:forKey:](self, "setPreferencesValue:forKey:", a3, a4);
}

- (int64_t)integerForKey:(id)a3 defaultValue:(int64_t)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHPreferences numberForKey:defaultValue:](self, "numberForKey:defaultValue:", a3, 0));
  v6 = v5;
  if (v5)
    a4 = (int64_t)objc_msgSend(v5, "integerValue");

  return a4;
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  -[PHPreferences setNumber:forKey:](self, "setNumber:forKey:", v7, v6);

}

- (unint64_t)unsignedIntegerForKey:(id)a3 defaultValue:(unint64_t)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHPreferences numberForKey:defaultValue:](self, "numberForKey:defaultValue:", a3, 0));
  v6 = v5;
  if (v5)
    a4 = (unint64_t)objc_msgSend(v5, "unsignedIntegerValue");

  return a4;
}

- (void)setUnsignedInteger:(unint64_t)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[PHPreferences setNumber:forKey:](self, "setNumber:forKey:", v7, v6);

}

- (id)stringForKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHPreferences preferencesValueForKey:](self, "preferencesValueForKey:", a3));
  v8 = objc_opt_class(NSString);
  v9 = v6;
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = v7;

  }
  return v9;
}

- (void)setString:(id)a3 forKey:(id)a4
{
  -[PHPreferences setPreferencesValue:forKey:](self, "setPreferencesValue:forKey:", a3, a4);
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
