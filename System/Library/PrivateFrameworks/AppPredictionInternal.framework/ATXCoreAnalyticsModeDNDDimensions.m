@implementation ATXCoreAnalyticsModeDNDDimensions

- (ATXCoreAnalyticsModeDNDDimensions)initWithMode:(id)a3 nullableIsDND:(id)a4
{
  id v7;
  id v8;
  ATXCoreAnalyticsModeDNDDimensions *v9;
  ATXCoreAnalyticsModeDNDDimensions *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXCoreAnalyticsModeDNDDimensions;
  v9 = -[ATXCoreAnalyticsModeDNDDimensions init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mode, a3);
    objc_storeStrong((id *)&v10->_isDND, a4);
  }

  return v10;
}

- (ATXCoreAnalyticsModeDNDDimensions)initWithMode:(id)a3 isDND:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  ATXCoreAnalyticsModeDNDDimensions *v9;

  v4 = a4;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ATXCoreAnalyticsModeDNDDimensions initWithMode:nullableIsDND:](self, "initWithMode:nullableIsDND:", v7, v8);

  return v9;
}

- (id)powerset
{
  void *v3;
  ATXCoreAnalyticsModeDNDDimensions *v4;
  ATXCoreAnalyticsModeDNDDimensions *v5;
  ATXCoreAnalyticsModeDNDDimensions *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "addObject:", self);
  v4 = -[ATXCoreAnalyticsModeDNDDimensions initWithMode:nullableIsDND:]([ATXCoreAnalyticsModeDNDDimensions alloc], "initWithMode:nullableIsDND:", 0, 0);
  objc_msgSend(v3, "addObject:", v4);
  v5 = -[ATXCoreAnalyticsModeDNDDimensions initWithMode:nullableIsDND:]([ATXCoreAnalyticsModeDNDDimensions alloc], "initWithMode:nullableIsDND:", 0, self->_isDND);
  objc_msgSend(v3, "addObject:", v5);
  v6 = -[ATXCoreAnalyticsModeDNDDimensions initWithMode:nullableIsDND:]([ATXCoreAnalyticsModeDNDDimensions alloc], "initWithMode:nullableIsDND:", self->_mode, 0);
  objc_msgSend(v3, "addObject:", v6);
  objc_msgSend(v3, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)coreAnalyticsDictionary
{
  NSString *mode;
  void *v4;
  NSNumber *isDND;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("mode");
  mode = self->_mode;
  v4 = mode;
  if (!mode)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("isDND");
  v10[0] = v4;
  isDND = self->_isDND;
  v6 = isDND;
  if (!isDND)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!isDND)
  {

    if (mode)
      return v7;
LABEL_9:

    return v7;
  }
  if (!mode)
    goto LABEL_9;
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ATXCoreAnalyticsModeDNDDimensions initWithMode:nullableIsDND:](+[ATXCoreAnalyticsModeDNDDimensions allocWithZone:](ATXCoreAnalyticsModeDNDDimensions, "allocWithZone:", a3), "initWithMode:nullableIsDND:", self->_mode, self->_isDND);
}

- (NSString)mode
{
  return self->_mode;
}

- (NSNumber)isDND
{
  return self->_isDND;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isDND, 0);
  objc_storeStrong((id *)&self->_mode, 0);
}

@end
