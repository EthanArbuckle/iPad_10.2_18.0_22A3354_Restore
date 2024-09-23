@implementation _CRSUIClusterThemeData

- (_CRSUIClusterThemeData)initWithThemeData:(id)a3
{
  id v5;
  _CRSUIClusterThemeData *v6;
  _CRSUIClusterThemeData *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CRSUIClusterThemeData;
  v6 = -[_CRSUIClusterThemeData init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_themeData, a3);

  return v7;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CRSUIClusterThemeData themeData](self, "themeData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeDictionary:forKey:", v5, CFSTR("themeData"));

}

- (_CRSUIClusterThemeData)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  _CRSUIClusterThemeData *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeDictionaryOfClass:forKey:", objc_opt_class(), CFSTR("themeData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[_CRSUIClusterThemeData initWithThemeData:](self, "initWithThemeData:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSDictionary)themeData
{
  return self->_themeData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themeData, 0);
}

@end
