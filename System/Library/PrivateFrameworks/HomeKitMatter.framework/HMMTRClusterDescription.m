@implementation HMMTRClusterDescription

- (HMMTRClusterDescription)initWithClass:(id)a3 selectorString:(id)a4
{
  NSString *v6;
  NSString *v7;
  HMMTRClusterDescription *v8;
  uint64_t v9;
  Class clusterClass;
  objc_super v12;

  v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMTRClusterDescription;
  v8 = -[HMMTRClusterDescription init](&v12, sel_init);
  if (v8)
  {
    NSClassFromString(v6);
    v9 = objc_claimAutoreleasedReturnValue();
    clusterClass = v8->_clusterClass;
    v8->_clusterClass = (Class)v9;

    v8->_clusterSelector = NSSelectorFromString(v7);
  }

  return v8;
}

- (Class)clusterClass
{
  return (Class)objc_getProperty(self, a2, 16, 1);
}

- (SEL)clusterSelector
{
  return self->_clusterSelector;
}

- (NSNumber)clusterID
{
  return self->_clusterID;
}

- (void)setClusterID:(id)a3
{
  objc_storeStrong((id *)&self->_clusterID, a3);
}

- (NSNumber)attributeID
{
  return self->_attributeID;
}

- (void)setAttributeID:(id)a3
{
  objc_storeStrong((id *)&self->_attributeID, a3);
}

- (id)mapValue
{
  return self->_mapValue;
}

- (void)setMapValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)primaryArgIndex
{
  return self->_primaryArgIndex;
}

- (void)setPrimaryArgIndex:(id)a3
{
  objc_storeStrong((id *)&self->_primaryArgIndex, a3);
}

- (id)primaryArg
{
  return self->_primaryArg;
}

- (void)setPrimaryArg:(id)a3
{
  objc_storeStrong(&self->_primaryArg, a3);
}

- (NSString)primaryArgType
{
  return self->_primaryArgType;
}

- (void)setPrimaryArgType:(id)a3
{
  objc_storeStrong((id *)&self->_primaryArgType, a3);
}

- (NSDictionary)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
  objc_storeStrong((id *)&self->_arguments, a3);
}

- (Class)paramsClass
{
  return self->_paramsClass;
}

- (void)setParamsClass:(Class)a3
{
  objc_storeStrong((id *)&self->_paramsClass, a3);
}

- (NSNumber)paramsIndex
{
  return self->_paramsIndex;
}

- (void)setParamsIndex:(id)a3
{
  objc_storeStrong((id *)&self->_paramsIndex, a3);
}

- (NSDictionary)paramsArguments
{
  return self->_paramsArguments;
}

- (void)setParamsArguments:(id)a3
{
  objc_storeStrong((id *)&self->_paramsArguments, a3);
}

- (id)mapWriteValueToExpectedValues
{
  return self->_mapWriteValueToExpectedValues;
}

- (void)setMapWriteValueToExpectedValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)syncWriteFunc
{
  return self->_syncWriteFunc;
}

- (void)setSyncWriteFunc:(BOOL)a3
{
  self->_syncWriteFunc = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mapWriteValueToExpectedValues, 0);
  objc_storeStrong((id *)&self->_paramsArguments, 0);
  objc_storeStrong((id *)&self->_paramsIndex, 0);
  objc_storeStrong((id *)&self->_paramsClass, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_primaryArgType, 0);
  objc_storeStrong(&self->_primaryArg, 0);
  objc_storeStrong((id *)&self->_primaryArgIndex, 0);
  objc_storeStrong(&self->_mapValue, 0);
  objc_storeStrong((id *)&self->_attributeID, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);
  objc_storeStrong((id *)&self->_clusterClass, 0);
}

@end
