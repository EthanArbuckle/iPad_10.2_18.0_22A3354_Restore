@implementation SFCustomActivityProxy

- (SFCustomActivityProxy)initWithActivity:(id)a3
{
  id v4;
  SFCustomActivityProxy *v5;
  SFCustomActivityProxy *v6;
  uint64_t v7;
  NSString *activityType;
  uint64_t v9;
  NSString *activityTitle;
  uint64_t v11;
  UIImage *activityImage;
  uint64_t v13;
  SFCustomActivityProxy *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFCustomActivityProxy;
  v5 = -[SFCustomActivityProxy init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SFCustomActivityProxy activityTypeWithActivity:](v5, "activityTypeWithActivity:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    activityType = v6->_activityType;
    v6->_activityType = (NSString *)v7;

    objc_msgSend(v4, "activityTitle");
    v9 = objc_claimAutoreleasedReturnValue();
    activityTitle = v6->_activityTitle;
    v6->_activityTitle = (NSString *)v9;

    objc_msgSend(v4, "activityImage");
    v11 = objc_claimAutoreleasedReturnValue();
    activityImage = v6->_activityImage;
    v6->_activityImage = (UIImage *)v11;

    v13 = initWithActivity__activityProxyID++;
    v6->_activityProxyID = v13;
    v14 = v6;
  }

  return v6;
}

- (id)_initWithActivityType:(id)a3 title:(id)a4 image:(id)a5 proxyID:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  SFCustomActivityProxy *v14;
  SFCustomActivityProxy *v15;
  SFCustomActivityProxy *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SFCustomActivityProxy;
  v14 = -[SFCustomActivityProxy init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_activityType, a3);
    objc_storeStrong((id *)&v15->_activityTitle, a4);
    objc_storeStrong((id *)&v15->_activityImage, a5);
    v15->_activityProxyID = a6;
    v16 = v15;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_activityProxyID == v4[4];

  return v5;
}

- (unint64_t)hash
{
  return self->_activityProxyID;
}

- (id)activityTypeWithActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a3;
  objc_msgSend(v3, "activityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v4, "safari_stringByRemovingCharactersInSet:", v5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "length"),
        v6,
        !v7))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_stringByRemovingCharactersInSet:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "activityTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safari_stringByRemovingCharactersInSet:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.SafariServices.hostApplicationActivity.%@.%@"), v10, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v13;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCustomActivityProxy)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  SFCustomActivityProxy *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityImage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("activityProxyID"));

  v9 = -[SFCustomActivityProxy _initWithActivityType:title:image:proxyID:](self, "_initWithActivityType:title:image:proxyID:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *activityType;
  id v5;

  activityType = self->_activityType;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", activityType, CFSTR("activityType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activityTitle, CFSTR("activityTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activityImage, CFSTR("activityImage"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_activityProxyID, CFSTR("activityProxyID"));

}

- (NSString)activityType
{
  return self->_activityType;
}

- (NSString)activityTitle
{
  return self->_activityTitle;
}

- (UIImage)activityImage
{
  return self->_activityImage;
}

- (unint64_t)activityProxyID
{
  return self->_activityProxyID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityImage, 0);
  objc_storeStrong((id *)&self->_activityTitle, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

@end
