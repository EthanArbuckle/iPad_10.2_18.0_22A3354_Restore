@implementation ASDIAPInfoRequestOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adamIds, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSArray copy](self->_adamIds, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (NSArray)adamIds
{
  return self->_adamIds;
}

- (ASDIAPInfoRequestOptions)initWithCoder:(id)a3
{
  id v4;
  ASDIAPInfoRequestOptions *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *adamIds;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASDIAPInfoRequestOptions;
  v5 = -[ASDIAPInfoRequestOptions init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ASDIAPInfoRequestOptionsAdamIdsCodingKey"));
    v9 = objc_claimAutoreleasedReturnValue();

    adamIds = v5->_adamIds;
    v5->_adamIds = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_adamIds, CFSTR("ASDIAPInfoRequestOptionsAdamIdsCodingKey"));
}

- (ASDIAPInfoRequestOptions)initWithAdamIds:(id)a3
{
  id v4;
  ASDIAPInfoRequestOptions *v5;
  uint64_t v6;
  NSArray *adamIds;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDIAPInfoRequestOptions;
  v5 = -[ASDIAPInfoRequestOptions init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    adamIds = v5->_adamIds;
    v5->_adamIds = (NSArray *)v6;

  }
  return v5;
}

@end
