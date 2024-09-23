@implementation FCContentColorPair

+ (id)colorPairWithDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  FCContentColorPair *v9;
  BOOL v10;

  v3 = a3;
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("light"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("dark"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = 0;
  if (v6)
    v10 = v7 == 0;
  else
    v10 = 1;
  if (!v10)
    v9 = -[FCContentColorPair initWithLightColor:darkColor:]([FCContentColorPair alloc], "initWithLightColor:darkColor:", v6, v7);

  return v9;
}

- (FCContentColorPair)initWithLightColor:(id)a3 darkColor:(id)a4
{
  id v6;
  id v7;
  FCContentColorPair *v8;
  uint64_t v9;
  FCColor *lightColor;
  uint64_t v11;
  FCColor *darkColor;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCContentColorPair;
  v8 = -[FCContentColorPair init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    lightColor = v8->_lightColor;
    v8->_lightColor = (FCColor *)v9;

    v11 = objc_msgSend(v7, "copy");
    darkColor = v8->_darkColor;
    v8->_darkColor = (FCColor *)v11;

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkColor, 0);
  objc_storeStrong((id *)&self->_lightColor, 0);
}

- (FCColor)lightColor
{
  return self->_lightColor;
}

- (FCColor)darkColor
{
  return self->_darkColor;
}

@end
