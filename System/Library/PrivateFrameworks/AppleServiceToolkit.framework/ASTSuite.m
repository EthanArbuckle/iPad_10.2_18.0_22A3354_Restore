@implementation ASTSuite

- (ASTSuite)initWithId:(id)a3 suiteNameLocalizedString:(id)a4 suiteDescriptionLocalizedString:(id)a5 estimatedCompletionTimeLocalizedString:(id)a6 primaryAssetLocator:(id)a7 secondaryAssetLocator:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  ASTSuite *v20;
  ASTSuite *v21;
  ASTSuite *v22;
  objc_super v24;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24.receiver = self;
    v24.super_class = (Class)ASTSuite;
    v20 = -[ASTSuite init](&v24, sel_init);
    v21 = v20;
    if (v20)
    {
      -[ASTSuite setSuiteID:](v20, "setSuiteID:", v14);
      -[ASTSuite setSuiteNameLocalizedString:](v21, "setSuiteNameLocalizedString:", v15);
      -[ASTSuite setSuiteDescriptionLocalizedString:](v21, "setSuiteDescriptionLocalizedString:", v16);
      -[ASTSuite setEstimatedCompletionTimeLocalizedString:](v21, "setEstimatedCompletionTimeLocalizedString:", v17);
      -[ASTSuite setPrimaryAssetLocator:](v21, "setPrimaryAssetLocator:", v18);
      -[ASTSuite setSecondaryAssetLocator:](v21, "setSecondaryAssetLocator:", v19);
    }
    self = v21;
    v22 = self;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  ASTSuite *v4;
  ASTSuite *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (ASTSuite *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v8 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ASTSuite suiteID](self, "suiteID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTSuite suiteID](v5, "suiteID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
LABEL_5:
    v8 = 0;
  }
LABEL_7:

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ASTSuite suiteID](self, "suiteID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (ASTSuite)initWithCoder:(id)a3
{
  id v4;
  ASTSuite *v5;
  uint64_t v6;
  NSNumber *suiteID;
  uint64_t v8;
  NSString *suiteNameLocalizedString;
  uint64_t v10;
  NSString *suiteDescriptionLocalizedString;
  uint64_t v12;
  NSString *estimatedCompletionTimeLocalizedString;
  uint64_t v14;
  NSString *primaryAssetLocator;
  uint64_t v16;
  NSString *secondaryAssetLocator;

  v4 = a3;
  v5 = -[ASTSuite init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suiteID"));
    v6 = objc_claimAutoreleasedReturnValue();
    suiteID = v5->_suiteID;
    v5->_suiteID = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suiteNameLocalizedString"));
    v8 = objc_claimAutoreleasedReturnValue();
    suiteNameLocalizedString = v5->_suiteNameLocalizedString;
    v5->_suiteNameLocalizedString = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suiteDescriptionLocalizedString"));
    v10 = objc_claimAutoreleasedReturnValue();
    suiteDescriptionLocalizedString = v5->_suiteDescriptionLocalizedString;
    v5->_suiteDescriptionLocalizedString = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("estimatedCompletionTimeLocalizedString"));
    v12 = objc_claimAutoreleasedReturnValue();
    estimatedCompletionTimeLocalizedString = v5->_estimatedCompletionTimeLocalizedString;
    v5->_estimatedCompletionTimeLocalizedString = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryAssetLocator"));
    v14 = objc_claimAutoreleasedReturnValue();
    primaryAssetLocator = v5->_primaryAssetLocator;
    v5->_primaryAssetLocator = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryAssetLocator"));
    v16 = objc_claimAutoreleasedReturnValue();
    secondaryAssetLocator = v5->_secondaryAssetLocator;
    v5->_secondaryAssetLocator = (NSString *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[ASTSuite suiteID](self, "suiteID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("suiteID"));

  -[ASTSuite suiteNameLocalizedString](self, "suiteNameLocalizedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("suiteNameLocalizedString"));

  -[ASTSuite suiteDescriptionLocalizedString](self, "suiteDescriptionLocalizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("suiteDescriptionLocalizedString"));

  -[ASTSuite estimatedCompletionTimeLocalizedString](self, "estimatedCompletionTimeLocalizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("estimatedCompletionTimeLocalizedString"));

  -[ASTSuite primaryAssetLocator](self, "primaryAssetLocator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("primaryAssetLocator"));

  -[ASTSuite secondaryAssetLocator](self, "secondaryAssetLocator");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("secondaryAssetLocator"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)suiteID
{
  return self->_suiteID;
}

- (void)setSuiteID:(id)a3
{
  objc_storeStrong((id *)&self->_suiteID, a3);
}

- (NSString)suiteNameLocalizedString
{
  return self->_suiteNameLocalizedString;
}

- (void)setSuiteNameLocalizedString:(id)a3
{
  objc_storeStrong((id *)&self->_suiteNameLocalizedString, a3);
}

- (NSString)suiteDescriptionLocalizedString
{
  return self->_suiteDescriptionLocalizedString;
}

- (void)setSuiteDescriptionLocalizedString:(id)a3
{
  objc_storeStrong((id *)&self->_suiteDescriptionLocalizedString, a3);
}

- (NSString)estimatedCompletionTimeLocalizedString
{
  return self->_estimatedCompletionTimeLocalizedString;
}

- (void)setEstimatedCompletionTimeLocalizedString:(id)a3
{
  objc_storeStrong((id *)&self->_estimatedCompletionTimeLocalizedString, a3);
}

- (NSString)primaryAssetLocator
{
  return self->_primaryAssetLocator;
}

- (void)setPrimaryAssetLocator:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAssetLocator, a3);
}

- (NSString)secondaryAssetLocator
{
  return self->_secondaryAssetLocator;
}

- (void)setSecondaryAssetLocator:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryAssetLocator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryAssetLocator, 0);
  objc_storeStrong((id *)&self->_primaryAssetLocator, 0);
  objc_storeStrong((id *)&self->_estimatedCompletionTimeLocalizedString, 0);
  objc_storeStrong((id *)&self->_suiteDescriptionLocalizedString, 0);
  objc_storeStrong((id *)&self->_suiteNameLocalizedString, 0);
  objc_storeStrong((id *)&self->_suiteID, 0);
}

@end
