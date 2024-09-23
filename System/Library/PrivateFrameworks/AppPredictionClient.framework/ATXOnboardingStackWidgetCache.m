@implementation ATXOnboardingStackWidgetCache

- (ATXOnboardingStackWidgetCache)initWithAppLaunchDictionary:(id)a3
{
  id v4;
  void *v5;
  ATXOnboardingStackWidgetCache *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[ATXOnboardingStackWidgetCache initWithAppLaunchDictionary:cacheUpdateDate:hasiCloudFamily:](self, "initWithAppLaunchDictionary:cacheUpdateDate:hasiCloudFamily:", v4, v5, 0);

  return v6;
}

- (ATXOnboardingStackWidgetCache)initWithAppLaunchDictionary:(id)a3 cacheUpdateDate:(id)a4 hasiCloudFamily:(id)a5
{
  id v8;
  id v9;
  id v10;
  ATXOnboardingStackWidgetCache *v11;
  uint64_t v12;
  NSDictionary *descriptorToAppLaunchData;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXOnboardingStackWidgetCache;
  v11 = -[ATXOnboardingStackWidgetCache init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    descriptorToAppLaunchData = v11->_descriptorToAppLaunchData;
    v11->_descriptorToAppLaunchData = (NSDictionary *)v12;

    objc_storeStrong((id *)&v11->_cacheUpdateDate, a4);
    objc_storeStrong((id *)&v11->_hasiCloudFamily, a5);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *descriptorToAppLaunchData;
  id v5;

  descriptorToAppLaunchData = self->_descriptorToAppLaunchData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", descriptorToAppLaunchData, CFSTR("descriptorToAppLaunchData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cacheUpdateDate, CFSTR("cacheUpdateDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hasiCloudFamily, CFSTR("hasiCloudFamily"));

}

- (ATXOnboardingStackWidgetCache)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ATXOnboardingStackWidgetCache *v14;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, v9, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("descriptorToAppLaunchData"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cacheUpdateDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hasiCloudFamily"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  if (v11 && v12)
  {
    self = -[ATXOnboardingStackWidgetCache initWithAppLaunchDictionary:cacheUpdateDate:hasiCloudFamily:](self, "initWithAppLaunchDictionary:cacheUpdateDate:hasiCloudFamily:", v11, v12, v13);
    v14 = self;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAppLaunchDictionary:cacheUpdateDate:hasiCloudFamily:", self->_descriptorToAppLaunchData, self->_cacheUpdateDate, self->_hasiCloudFamily);
}

- (BOOL)isEqual:(id)a3
{
  ATXOnboardingStackWidgetCache *v4;
  ATXOnboardingStackWidgetCache *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;

  v4 = (ATXOnboardingStackWidgetCache *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[ATXOnboardingStackWidgetCache cacheUpdateDate](v5, "cacheUpdateDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToDate:", self->_cacheUpdateDate);

      if (v7)
      {
        -[ATXOnboardingStackWidgetCache descriptorToAppLaunchData](v5, "descriptorToAppLaunchData");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqual:", self->_descriptorToAppLaunchData);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (NSDictionary)descriptorToAppLaunchData
{
  return self->_descriptorToAppLaunchData;
}

- (NSDate)cacheUpdateDate
{
  return self->_cacheUpdateDate;
}

- (NSNumber)hasiCloudFamily
{
  return self->_hasiCloudFamily;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasiCloudFamily, 0);
  objc_storeStrong((id *)&self->_cacheUpdateDate, 0);
  objc_storeStrong((id *)&self->_descriptorToAppLaunchData, 0);
}

@end
