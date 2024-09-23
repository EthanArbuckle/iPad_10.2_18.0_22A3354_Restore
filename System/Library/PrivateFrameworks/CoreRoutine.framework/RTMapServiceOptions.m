@implementation RTMapServiceOptions

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)analyticsIdentifier
{
  return self->_analyticsIdentifier;
}

- (BOOL)useBackgroundTraits
{
  return self->_useBackgroundTraits;
}

- (RTMapServiceOptions)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  RTMapServiceOptions *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useBackgroundTraits"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("analyticsIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[RTMapServiceOptions initWithUseBackgroundTraits:analyticsIdentifier:clientIdentifier:](self, "initWithUseBackgroundTraits:analyticsIdentifier:clientIdentifier:", v5, v6, v7);
  return v8;
}

- (RTMapServiceOptions)initWithUseBackgroundTraits:(BOOL)a3 analyticsIdentifier:(id)a4 clientIdentifier:(id)a5
{
  id v9;
  id v10;
  RTMapServiceOptions *v11;
  RTMapServiceOptions *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)RTMapServiceOptions;
  v11 = -[RTMapServiceOptions init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_useBackgroundTraits = a3;
    objc_storeStrong((id *)&v11->_analyticsIdentifier, a4);
    objc_storeStrong((id *)&v12->_clientIdentifier, a5);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 useBackgroundTraits;
  id v5;

  useBackgroundTraits = self->_useBackgroundTraits;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", useBackgroundTraits, CFSTR("useBackgroundTraits"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_analyticsIdentifier, CFSTR("analyticsIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientIdentifier, CFSTR("clientIdentifier"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_analyticsIdentifier, 0);
}

- (RTMapServiceOptions)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithUseBackgroundTraits_analyticsIdentifier_clientIdentifier_);
}

- (RTMapServiceOptions)initWithUseBackgroundTraits:(BOOL)a3 analyticsIdentifier:(id)a4
{
  return -[RTMapServiceOptions initWithUseBackgroundTraits:analyticsIdentifier:clientIdentifier:](self, "initWithUseBackgroundTraits:analyticsIdentifier:clientIdentifier:", a3, a4, 0);
}

@end
