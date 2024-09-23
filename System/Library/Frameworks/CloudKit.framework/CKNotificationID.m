@implementation CKNotificationID

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
}

- (CKNotificationID)initWithNotificationUUID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKNotificationID *v8;
  uint64_t v9;
  NSString *notificationUUID;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKNotificationID;
  v8 = -[CKNotificationID init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend_copy(v4, v5, v6, v7);
    notificationUUID = v8->_notificationUUID;
    v8->_notificationUUID = (NSString *)v9;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  CKNotificationID *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  char isEqualToString;

  v4 = (CKNotificationID *)a3;
  if (self == v4)
  {
    isEqualToString = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_notificationUUID(self, v5, v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_notificationUUID(v4, v9, v10, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v15)
      {
        isEqualToString = 1;
      }
      else
      {
        objc_msgSend_notificationUUID(self, v12, v13, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_notificationUUID(v4, v17, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v16, v21, (uint64_t)v20, v22);

      }
    }
    else
    {
      isEqualToString = 0;
    }
  }

  return isEqualToString;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend_notificationUUID(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_notificationUUID(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v6, (uint64_t)CFSTR("UUID=%@"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)description
{
  return (id)((uint64_t (*)(CKNotificationID *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  id v10;

  v10 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_notificationUUID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v10, v9, (uint64_t)v8, (uint64_t)CFSTR("UUID"));

  objc_autoreleasePoolPop(v4);
}

- (CKNotificationID)initWithCoder:(id)a3
{
  id v4;
  CKNotificationID *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSString *notificationUUID;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKNotificationID;
  v5 = -[CKNotificationID init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("UUID"));
    v9 = objc_claimAutoreleasedReturnValue();
    notificationUUID = v5->_notificationUUID;
    v5->_notificationUUID = (NSString *)v9;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSString)notificationUUID
{
  return self->_notificationUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationUUID, 0);
}

@end
