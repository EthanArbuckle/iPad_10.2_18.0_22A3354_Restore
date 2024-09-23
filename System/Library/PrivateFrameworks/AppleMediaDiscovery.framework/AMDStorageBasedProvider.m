@implementation AMDStorageBasedProvider

- (AMDStorageBasedProvider)initWithDomain:(id)a3
{
  AMDStorageBasedProvider *v3;
  AMDStorageBasedProvider *v5;
  objc_super v6;
  id location[2];
  AMDStorageBasedProvider *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)AMDStorageBasedProvider;
  v8 = -[AMDStorageBasedProvider init](&v6, sel_init);
  objc_storeStrong((id *)&v8, v8);
  -[AMDStorageBasedProvider setDomain:](v8, "setDomain:", location[0]);
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (id)getFeatureWithName:(id)a3 withColumn:(id)a4 error:(id *)a5
{
  id v7;
  NSString *v8;
  id v9;
  id v10;
  id location[2];
  AMDStorageBasedProvider *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v7 = location[0];
  v8 = -[AMDStorageBasedProvider domain](v12, "domain");
  v9 = +[AMDTasteProfile getFeatureWithName:inDomain:withColumnName:error:](AMDTasteProfile, "getFeatureWithName:inDomain:withColumnName:error:", v7);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (void)storeFeatureData:(id)a3 error:(id *)a4
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  *a4 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 29, CFSTR("Store operation in AMDStorageBasedProvider not supported"));
  objc_storeStrong(location, 0);
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
