@implementation UNNotificationResponse

+ (UNNotificationResponse)responseWithNotification:(id)a3 actionIdentifier:(id)a4
{
  return (UNNotificationResponse *)objc_msgSend(a1, "responseWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:", a3, a4, &stru_1E57F06A0, 0);
}

+ (UNNotificationResponse)responseWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:targetSceneIdentifier:", v13, v12, v11, v10, 0);

  return (UNNotificationResponse *)v14;
}

+ (UNNotificationResponse)responseWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6 targetSceneIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:targetSceneIdentifier:", v16, v15, v14, v13, v12);

  return (UNNotificationResponse *)v17;
}

- (id)_initWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6 targetSceneIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  UNNotificationResponse *v17;
  uint64_t v18;
  UNNotification *notification;
  uint64_t v20;
  NSString *actionIdentifier;
  uint64_t v22;
  NSString *originIdentifier;
  objc_super v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)UNNotificationResponse;
  v17 = -[UNNotificationResponse init](&v25, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    notification = v17->_notification;
    v17->_notification = (UNNotification *)v18;

    v20 = objc_msgSend(v13, "copy");
    actionIdentifier = v17->_actionIdentifier;
    v17->_actionIdentifier = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    originIdentifier = v17->_originIdentifier;
    v17->_originIdentifier = (NSString *)v22;

    objc_storeStrong((id *)&v17->_targetConnectionEndpoint, a6);
    objc_storeStrong((id *)&v17->_targetSceneIdentifier, a7);
  }

  return v17;
}

- (UNNotificationResponse)initWithNotification:(id)a3 actionIdentifier:(id)a4
{
  return (UNNotificationResponse *)-[UNNotificationResponse _initWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:targetSceneIdentifier:](self, "_initWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:targetSceneIdentifier:", a3, a4, &stru_1E57F06A0, 0, 0);
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[UNNotificationResponse notification](self, "notification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[UNNotificationResponse actionIdentifier](self, "actionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[UNNotificationResponse originIdentifier](self, "originIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[UNNotificationResponse targetConnectionEndpoint](self, "targetConnectionEndpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[UNNotificationResponse targetSceneIdentifier](self, "targetSceneIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v16;
  void *v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UNNotificationResponse notification](self, "notification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (UNEqualObjects(v5, v6))
    {
      -[UNNotificationResponse actionIdentifier](self, "actionIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "actionIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (UNEqualStrings(v7, v8))
      {
        -[UNNotificationResponse originIdentifier](self, "originIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "originIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (UNEqualStrings(v9, v10))
        {
          -[UNNotificationResponse targetConnectionEndpoint](self, "targetConnectionEndpoint");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "targetConnectionEndpoint");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (UNEqualObjects(v11, v12))
          {
            -[UNNotificationResponse targetSceneIdentifier](self, "targetSceneIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "targetSceneIdentifier");
            v17 = v11;
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = UNEqualStrings(v16, v13);

            v11 = v17;
          }
          else
          {
            v14 = 0;
          }

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[UNNotificationResponse actionIdentifier](self, "actionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationResponse notification](self, "notification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; actionIdentifier: %@, notification: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[UNNotificationResponse notification](self, "notification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("notification"));

  -[UNNotificationResponse actionIdentifier](self, "actionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("actionIdentifier"));

  -[UNNotificationResponse originIdentifier](self, "originIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("originIdentifier"));

  -[UNNotificationResponse targetConnectionEndpoint](self, "targetConnectionEndpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("targetConnectionEndpoint"));

  -[UNNotificationResponse targetSceneIdentifier](self, "targetSceneIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("targetSceneIdentifier"));

}

- (UNNotificationResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UNNotificationResponse *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notification"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetConnectionEndpoint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetSceneIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UNNotificationResponse _initWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:targetSceneIdentifier:](self, "_initWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:targetSceneIdentifier:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[UNNotificationResponse actionIdentifier](self, "actionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();

  -[UNNotificationResponse originIdentifier](self, "originIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();

  -[UNNotificationResponse notification](self, "notification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();

  -[UNNotificationResponse targetSceneIdentifier](self, "targetSceneIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();

  objc_msgSend(MEMORY[0x1E0D018A0], "coderWithMessage:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[UNNotificationResponse targetConnectionEndpoint](self, "targetConnectionEndpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("targetConnectionEndpoint"));

}

- (UNNotificationResponse)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UNNotificationResponse *v11;

  v4 = a3;
  objc_opt_class();
  BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D018A0], "coderWithMessage:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetConnectionEndpoint"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UNNotificationResponse _initWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:targetSceneIdentifier:](self, "_initWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:targetSceneIdentifier:", v7, v5, v6, v10, v8);

  return v11;
}

- (UNNotification)notification
{
  return self->_notification;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)originIdentifier
{
  return self->_originIdentifier;
}

- (BSServiceConnectionEndpoint)targetConnectionEndpoint
{
  return self->_targetConnectionEndpoint;
}

- (NSString)targetSceneIdentifier
{
  return self->_targetSceneIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_targetConnectionEndpoint, 0);
  objc_storeStrong((id *)&self->_originIdentifier, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_notification, 0);
}

@end
