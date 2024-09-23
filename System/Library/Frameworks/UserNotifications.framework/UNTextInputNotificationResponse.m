@implementation UNTextInputNotificationResponse

+ (UNTextInputNotificationResponse)responseWithNotification:(id)a3 actionIdentifier:(id)a4 userText:(id)a5
{
  return (UNTextInputNotificationResponse *)objc_msgSend(a1, "responseWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:userText:", a3, a4, &stru_1E57F06A0, 0, a5);
}

+ (UNTextInputNotificationResponse)responseWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6 userText:(id)a7
{
  return (UNTextInputNotificationResponse *)objc_msgSend(a1, "responseWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:targetSceneIdentifier:userText:", a3, a4, a5, a6, 0, a7);
}

+ (UNTextInputNotificationResponse)responseWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6 targetSceneIdentifier:(id)a7 userText:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:targetSceneIdentifier:userText:", v19, v18, v17, v16, v15, v14);

  return (UNTextInputNotificationResponse *)v20;
}

- (id)_initWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6 targetSceneIdentifier:(id)a7
{
  return -[UNTextInputNotificationResponse _initWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:targetSceneIdentifier:userText:](self, "_initWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:targetSceneIdentifier:userText:", a3, a4, a5, a6, a7, &stru_1E57F06A0);
}

- (id)_initWithNotification:(id)a3 actionIdentifier:(id)a4 originIdentifier:(id)a5 targetConnectionEndpoint:(id)a6 targetSceneIdentifier:(id)a7 userText:(id)a8
{
  id v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v13 = a8;
  v18.receiver = self;
  v18.super_class = (Class)UNTextInputNotificationResponse;
  v14 = -[UNNotificationResponse _initWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:targetSceneIdentifier:](&v18, sel__initWithNotification_actionIdentifier_originIdentifier_targetConnectionEndpoint_targetSceneIdentifier_, a3, a4, a5, a6, 0);
  if (v14)
  {
    v15 = objc_msgSend(v13, "copy");
    v16 = (void *)v14[6];
    v14[6] = v15;

  }
  return v14;
}

- (UNTextInputNotificationResponse)initWithNotification:(id)a3 actionIdentifier:(id)a4 userText:(id)a5
{
  return (UNTextInputNotificationResponse *)-[UNTextInputNotificationResponse _initWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:targetSceneIdentifier:userText:](self, "_initWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:targetSceneIdentifier:userText:", a3, a4, &stru_1E57F06A0, 0, 0, a5);
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UNTextInputNotificationResponse;
  v3 = -[UNNotificationResponse hash](&v7, sel_hash);
  -[UNTextInputNotificationResponse userText](self, "userText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNTextInputNotificationResponse;
  if (-[UNNotificationResponse isEqual:](&v9, sel_isEqual_, v4))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UNTextInputNotificationResponse userText](self, "userText");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "userText");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = UNEqualObjects(v5, v6);

    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[UNNotificationResponse actionIdentifier](self, "actionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNTextInputNotificationResponse userText](self, "userText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationResponse notification](self, "notification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; actionIdentifier: %@, userText: %@, notification: %@>"),
    v4,
    self,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
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
  void *v9;
  id v10;

  v4 = a3;
  -[UNNotificationResponse notification](self, "notification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("notification"));

  -[UNNotificationResponse actionIdentifier](self, "actionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("actionIdentifier"));

  -[UNTextInputNotificationResponse userText](self, "userText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("userText"));

  -[UNNotificationResponse originIdentifier](self, "originIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("originIdentifier"));

  -[UNNotificationResponse targetConnectionEndpoint](self, "targetConnectionEndpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("targetConnectionEndpoint"));

  -[UNNotificationResponse targetSceneIdentifier](self, "targetSceneIdentifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("targetSceneIdentifier"));

}

- (UNTextInputNotificationResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UNTextInputNotificationResponse *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notification"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetConnectionEndpoint"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetSceneIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[UNTextInputNotificationResponse _initWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:targetSceneIdentifier:userText:](self, "_initWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:targetSceneIdentifier:userText:", v5, v6, v8, v9, v10, v7);
  return v11;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[UNNotificationResponse actionIdentifier](self, "actionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();

  -[UNNotificationResponse originIdentifier](self, "originIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();

  -[UNTextInputNotificationResponse userText](self, "userText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();

  -[UNNotificationResponse notification](self, "notification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();

  -[UNNotificationResponse targetSceneIdentifier](self, "targetSceneIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();

  objc_msgSend(MEMORY[0x1E0D018A0], "coderWithMessage:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[UNNotificationResponse targetConnectionEndpoint](self, "targetConnectionEndpoint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("targetConnectionEndpoint"));

}

- (UNTextInputNotificationResponse)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UNTextInputNotificationResponse *v12;

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
  objc_opt_class();
  BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D018A0], "coderWithMessage:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetConnectionEndpoint"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UNTextInputNotificationResponse _initWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:targetSceneIdentifier:userText:](self, "_initWithNotification:actionIdentifier:originIdentifier:targetConnectionEndpoint:targetSceneIdentifier:userText:", v8, v5, v6, v11, v9, v7);

  return v12;
}

- (NSString)userText
{
  return self->_userText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userText, 0);
}

@end
