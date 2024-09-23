@implementation IDSFeatureToggleUpdateOptions

+ (id)optionsWithFeatureID:(id)a3 state:(unint64_t)a4
{
  id v5;
  IDSFeatureToggleUpdateOptions *v6;

  v5 = a3;
  v6 = -[IDSFeatureToggleUpdateOptions initWithFeatureID:state:]([IDSFeatureToggleUpdateOptions alloc], "initWithFeatureID:state:", v5, a4);

  return v6;
}

- (IDSFeatureToggleUpdateOptions)initWithFeatureID:(id)a3 state:(unint64_t)a4
{
  id v7;
  IDSFeatureToggleUpdateOptions *v8;
  IDSFeatureToggleUpdateOptions *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSFeatureToggleUpdateOptions;
  v8 = -[IDSFeatureToggleUpdateOptions init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_featureID, a3);
    v9->_state = a4;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  IDSFeatureToggleUpdateOptions *v4;
  void *v5;
  IDSFeatureToggleUpdateOptions *v6;

  v4 = [IDSFeatureToggleUpdateOptions alloc];
  -[IDSFeatureToggleUpdateOptions featureID](self, "featureID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IDSFeatureToggleUpdateOptions initWithFeatureID:state:](v4, "initWithFeatureID:state:", v5, -[IDSFeatureToggleUpdateOptions state](self, "state"));

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSFeatureToggleUpdateOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  IDSFeatureToggleUpdateOptions *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("st"));

  v7 = -[IDSFeatureToggleUpdateOptions initWithFeatureID:state:](self, "initWithFeatureID:state:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[IDSFeatureToggleUpdateOptions featureID](self, "featureID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("fid"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[IDSFeatureToggleUpdateOptions state](self, "state"), CFSTR("st"));
}

- (NSString)featureID
{
  return self->_featureID;
}

- (void)setFeatureID:(id)a3
{
  objc_storeStrong((id *)&self->_featureID, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureID, 0);
}

@end
