@implementation IQFMapsPersonalizationLocation

- (IQFMapsPersonalizationLocation)initWithMUID:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  IQFMapsPersonalizationLocation *v9;
  IQFMapsPersonalizationLocation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IQFMapsPersonalizationLocation;
  v9 = -[IQFMapsPersonalizationLocation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_muid, a3);
    objc_storeStrong((id *)&v10->_name, a4);
  }

  return v10;
}

- (NSString)muid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_muid, 0);
}

@end
