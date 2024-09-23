@implementation CNLocalizationServicesTestDouble

- (CNLocalizationServicesTestDouble)init
{
  CNLocalizationServicesTestDouble *v2;
  uint64_t v3;
  NSMutableDictionary *values;
  CNLocalizationServicesTestDouble *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNLocalizationServicesTestDouble;
  v2 = -[CNLocalizationServicesTestDouble init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    values = v2->_values;
    v2->_values = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)givenLocalizedString:(id)a3 forKey:(id)a4 table:(id)a5 bundleForClass:(Class)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "storageKeyForKey:table:inBundleForClass:", v11, v10, a6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_values, "setObject:forKeyedSubscript:", v12, v13);
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5 bundleForClass:(Class)a6 comment:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v11 = a4;
  v12 = a5;
  v13 = a3;
  objc_msgSend((id)objc_opt_class(), "storageKeyForKey:table:inBundleForClass:", v13, v12, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_values, "objectForKeyedSubscript:", v14);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!v15)
    v15 = v11;

  return v15;
}

+ (id)storageKeyForKey:(id)a3 table:(id)a4 inBundleForClass:(Class)a5
{
  __CFString *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;

  v7 = (__CFString *)a4;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  NSStringFromClass(a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v10);

  objc_msgSend(v9, "appendString:", CFSTR("."));
  v11 = CFSTR("*");
  if (v7 && -[__CFString length](v7, "length"))
    v11 = v7;
  objc_msgSend(v9, "appendString:", v11);
  objc_msgSend(v9, "appendString:", CFSTR("."));
  objc_msgSend(v9, "appendString:", v8);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
