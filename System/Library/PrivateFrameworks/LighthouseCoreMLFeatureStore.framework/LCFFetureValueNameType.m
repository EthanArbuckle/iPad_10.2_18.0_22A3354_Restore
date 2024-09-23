@implementation LCFFetureValueNameType

- (id)init:(id)a3 featureValueType:(int64_t)a4
{
  id v7;
  LCFFetureValueNameType *v8;
  objc_super v10;

  v7 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LCFFetureValueNameType;
  v8 = -[LCFFetureValueNameType init](&v10, sel_init);
  if (v8)
  {
    LCFLoggingUtilsInit();
    objc_storeStrong((id *)&v8->_featureName, a3);
    v8->_featureValueType = a4;
  }

  return v8;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (int64_t)featureValueType
{
  return self->_featureValueType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureName, 0);
}

@end
