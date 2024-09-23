@implementation FFFeatureSet

- (FFFeatureSet)initWithGroup:(id)a3 set:(id)a4
{
  id v6;
  id v7;
  FFFeatureSetIdentifier *v8;
  FFFeatureSet *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[FFFeatureSetIdentifier initWithGroup:set:]([FFFeatureSetIdentifier alloc], "initWithGroup:set:", v7, v6);

  v9 = -[FFFeatureSet initWithIdentifier:](self, "initWithIdentifier:", v8);
  return v9;
}

- (FFFeatureSet)initWithIdentifier:(id)a3
{
  id v5;
  FFFeatureSet *v6;
  FFFeatureSet *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FFFeatureSet;
  v6 = -[FFFeatureSet init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

- (FFFeatureSetIdentifier)identifier
{
  return self->_identifier;
}

- (NSArray)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_features, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
