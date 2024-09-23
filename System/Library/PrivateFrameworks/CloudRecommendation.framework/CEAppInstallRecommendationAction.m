@implementation CEAppInstallRecommendationAction

- (CEAppInstallRecommendationAction)initWithIdentifier:(id)a3 title:(id)a4 appIdentifier:(id)a5
{
  id v9;
  CEAppInstallRecommendationAction *v10;
  CEAppInstallRecommendationAction *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CEAppInstallRecommendationAction;
  v10 = -[CERecommendationAction initWithIdentifier:actionTitle:actionType:](&v13, sel_initWithIdentifier_actionTitle_actionType_, a3, a4, CFSTR("AppInstall"));
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_appStoreID, a5);

  return v11;
}

- (CEAppInstallRecommendationAction)initWithDictionary:(id)a3
{
  id v4;
  CEAppInstallRecommendationAction *v5;
  void *v6;
  NSString *v7;
  NSObject *appStoreID;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CEAppInstallRecommendationAction;
  v5 = -[CERecommendationAction initWithDictionary:](&v10, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appStoreID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      appStoreID = v5->_appStoreID;
      v5->_appStoreID = v7;
    }
    else
    {
      _CELogSystem();
      appStoreID = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(appStoreID, OS_LOG_TYPE_DEBUG))
        -[CEAppInstallRecommendationAction initWithDictionary:].cold.1();
    }

  }
  return v5;
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
  v5.super_class = (Class)CEAppInstallRecommendationAction;
  v4 = a3;
  -[CERecommendationAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_appStoreID, CFSTR("appStoreID"), v5.receiver, v5.super_class);

}

- (CEAppInstallRecommendationAction)initWithCoder:(id)a3
{
  id v4;
  CEAppInstallRecommendationAction *v5;
  uint64_t v6;
  NSString *appStoreID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CEAppInstallRecommendationAction;
  v5 = -[CERecommendationAction initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appStoreID"));
    v6 = objc_claimAutoreleasedReturnValue();
    appStoreID = v5->_appStoreID;
    v5->_appStoreID = (NSString *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CEAppInstallRecommendationAction;
  v4 = -[CERecommendationAction copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setAppStoreID:", self->_appStoreID);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CEAppInstallRecommendationAction;
  -[CERecommendationAction description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" appStoreID: %@"), self->_appStoreID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)appStoreID
{
  return self->_appStoreID;
}

- (void)setAppStoreID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStoreID, 0);
}

- (void)initWithDictionary:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse AppStore ID from dictionary", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end
