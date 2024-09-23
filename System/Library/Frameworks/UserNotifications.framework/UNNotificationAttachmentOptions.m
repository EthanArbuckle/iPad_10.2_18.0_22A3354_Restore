@implementation UNNotificationAttachmentOptions

- (UNNotificationAttachmentOptions)init
{
  return (UNNotificationAttachmentOptions *)-[UNNotificationAttachmentOptions _initWithOptions:](self, "_initWithOptions:", 0);
}

- (id)_initWithOptions:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "displayLocation");
  objc_msgSend(v4, "thumbnailGeneratorUserInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UNNotificationAttachmentOptions _initWithDisplayLocation:thumbnailGeneratorUserInfo:](self, "_initWithDisplayLocation:thumbnailGeneratorUserInfo:", v5, v6);
  return v7;
}

- (id)_initWithDisplayLocation:(unint64_t)a3 thumbnailGeneratorUserInfo:(id)a4
{
  id v6;
  UNNotificationAttachmentOptions *v7;
  id *p_isa;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UNNotificationAttachmentOptions;
  v7 = -[UNNotificationAttachmentOptions init](&v13, sel_init);
  p_isa = (id *)&v7->super.isa;
  if (v7)
  {
    v7->_displayLocation = a3;
    v9 = objc_msgSend(v6, "copy");
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = (void *)MEMORY[0x1E0C9AA70];
    objc_storeStrong(p_isa + 2, v11);

  }
  return p_isa;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[UNNotificationAttachmentOptions displayLocation](self, "displayLocation");
  -[UNNotificationAttachmentOptions thumbnailGeneratorUserInfo](self, "thumbnailGeneratorUserInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  UNNotificationAttachmentOptions *v4;
  UNNotificationAttachmentOptions *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (UNNotificationAttachmentOptions *)a3;
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
      v6 = -[UNNotificationAttachmentOptions displayLocation](self, "displayLocation");
      if (v6 == -[UNNotificationAttachmentOptions displayLocation](v5, "displayLocation"))
      {
        -[UNNotificationAttachmentOptions thumbnailGeneratorUserInfo](self, "thumbnailGeneratorUserInfo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[UNNotificationAttachmentOptions thumbnailGeneratorUserInfo](v5, "thumbnailGeneratorUserInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = UNEqualObjects(v7, v8);

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

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  UNStringFromNotificationAttachmentDisplayLocation(-[UNNotificationAttachmentOptions displayLocation](self, "displayLocation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationAttachmentOptions thumbnailGeneratorUserInfo](self, "thumbnailGeneratorUserInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; displayLocation: %@; thumbnailGeneratorUserInfo: %@>"),
    v4,
    self,
    v5,
    v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[UNNotificationAttachmentOptions _initWithOptions:]([UNMutableNotificationAttachmentOptions alloc], "_initWithOptions:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UNNotificationAttachmentOptions)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  UNNotificationAttachmentOptions *v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("displayLocation"));
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("thumbnailGeneratorUserInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[UNNotificationAttachmentOptions _initWithDisplayLocation:thumbnailGeneratorUserInfo:](self, "_initWithDisplayLocation:thumbnailGeneratorUserInfo:", v5, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationAttachmentOptions displayLocation](self, "displayLocation"), CFSTR("displayLocation"));
  -[UNNotificationAttachmentOptions thumbnailGeneratorUserInfo](self, "thumbnailGeneratorUserInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("thumbnailGeneratorUserInfo"));

}

- (unint64_t)displayLocation
{
  return self->_displayLocation;
}

- (NSDictionary)thumbnailGeneratorUserInfo
{
  return self->_thumbnailGeneratorUserInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailGeneratorUserInfo, 0);
}

@end
