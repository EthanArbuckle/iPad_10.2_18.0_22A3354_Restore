@implementation IDSFeatureToggleRetrievalOptions

+ (id)optionsWithFeatureID:(id)a3
{
  id v3;
  IDSFeatureToggleRetrievalOptions *v4;

  v3 = a3;
  v4 = -[IDSFeatureToggleRetrievalOptions initWithFeatureID:]([IDSFeatureToggleRetrievalOptions alloc], "initWithFeatureID:", v3);

  return v4;
}

- (IDSFeatureToggleRetrievalOptions)initWithFeatureID:(id)a3
{
  id v5;
  IDSFeatureToggleRetrievalOptions *v6;
  IDSFeatureToggleRetrievalOptions *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSFeatureToggleRetrievalOptions;
  v6 = -[IDSFeatureToggleRetrievalOptions init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_featureID, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  IDSFeatureToggleRetrievalOptions *v4;
  void *v5;
  IDSFeatureToggleRetrievalOptions *v6;

  v4 = [IDSFeatureToggleRetrievalOptions alloc];
  -[IDSFeatureToggleRetrievalOptions featureID](self, "featureID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IDSFeatureToggleRetrievalOptions initWithFeatureID:](v4, "initWithFeatureID:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSFeatureToggleRetrievalOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  IDSFeatureToggleRetrievalOptions *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[IDSFeatureToggleRetrievalOptions initWithFeatureID:](self, "initWithFeatureID:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IDSFeatureToggleRetrievalOptions featureID](self, "featureID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fid"));

}

- (NSString)featureID
{
  return self->_featureID;
}

- (void)setFeatureID:(id)a3
{
  objc_storeStrong((id *)&self->_featureID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureID, 0);
}

@end
