@implementation FeatureHash

- (FeatureHash)initWithValues:(id)a3
{
  id v4;
  FeatureHash *v5;
  id v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FeatureHash;
  v5 = -[FeatureHash init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDD1880]);
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FeatureHash setHashID:](v5, "setHashID:", v7);

    -[FeatureHash setValues:](v5, "setValues:", v4);
  }

  return v5;
}

- (NSMutableArray)values
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setValues:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)hashID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHashID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashID, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

@end
