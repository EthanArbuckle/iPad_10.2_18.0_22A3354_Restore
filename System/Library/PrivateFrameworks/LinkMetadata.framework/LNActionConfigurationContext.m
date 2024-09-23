@implementation LNActionConfigurationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetFamily, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[LNActionConfigurationContext widgetFamily](self, "widgetFamily");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWidgetFamily:", v5);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNActionConfigurationContext widgetFamily](self, "widgetFamily");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("widgetFamily"));

}

- (LNActionConfigurationContext)initWithCoder:(id)a3
{
  id v4;
  LNActionConfigurationContext *v5;
  uint64_t v6;
  NSString *widgetFamily;
  LNActionConfigurationContext *v8;

  v4 = a3;
  v5 = -[LNActionConfigurationContext init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("widgetFamily"));
    v6 = objc_claimAutoreleasedReturnValue();
    widgetFamily = v5->_widgetFamily;
    v5->_widgetFamily = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNActionConfigurationContext widgetFamily](self, "widgetFamily");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, widgetFamily: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[LNActionConfigurationContext widgetFamily](self, "widgetFamily");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  LNActionConfigurationContext *v4;
  LNActionConfigurationContext *v5;
  LNActionConfigurationContext *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v4 = (LNActionConfigurationContext *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[LNActionConfigurationContext widgetFamily](self, "widgetFamily");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNActionConfigurationContext widgetFamily](v6, "widgetFamily");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        v12 = 1;
      }
      else
      {
        v12 = 0;
        if (v9 && v10)
          v12 = objc_msgSend(v9, "isEqualToString:", v10);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (NSString)widgetFamily
{
  return self->_widgetFamily;
}

- (void)setWidgetFamily:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
