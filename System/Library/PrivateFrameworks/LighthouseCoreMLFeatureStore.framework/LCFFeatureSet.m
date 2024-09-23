@implementation LCFFeatureSet

- (LCFFeatureSet)initWithIdentifier:(id)a3 featureVersion:(id)a4 timestamp:(id)a5 featureValues:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  LCFFeatureSet *v15;
  LCFFeatureSet *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)LCFFeatureSet;
  v15 = -[LCFFeatureSet init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_itemIdentifier, a3);
    objc_storeStrong((id *)&v16->_featureVersion, a4);
    objc_storeStrong((id *)&v16->_timestamp, a5);
    objc_storeStrong((id *)&v16->_featureValues, a6);
  }

  return v16;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSNumber)featureVersion
{
  return self->_featureVersion;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSDictionary)featureValues
{
  return self->_featureValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureValues, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_featureVersion, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
