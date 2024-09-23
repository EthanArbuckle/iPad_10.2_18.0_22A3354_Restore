@implementation UNNotificationRequest

+ (UNNotificationRequest)requestWithIdentifier:(NSString *)identifier content:(UNNotificationContent *)content trigger:(UNNotificationTrigger *)trigger
{
  UNNotificationTrigger *v8;
  UNNotificationContent *v9;
  NSString *v10;
  void *v11;

  v8 = trigger;
  v9 = content;
  v10 = identifier;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIdentifier:content:trigger:destinations:", v10, v9, v8, 15);

  return (UNNotificationRequest *)v11;
}

+ (UNNotificationRequest)requestWithIdentifier:(id)a3 content:(id)a4 trigger:(id)a5 destinations:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIdentifier:content:trigger:destinations:", v12, v11, v10, a6);

  return (UNNotificationRequest *)v13;
}

+ (UNNotificationRequest)requestWithIdentifier:(id)a3 pushPayload:(id)a4 bundleIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  UNPushNotificationRequestBuilder *v12;
  void *v13;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v11;
  }
  v12 = -[UNPushNotificationRequestBuilder initWithIdentifier:payload:bundleIdentifier:]([UNPushNotificationRequestBuilder alloc], "initWithIdentifier:payload:bundleIdentifier:", v7, v9, v8);

  -[UNPushNotificationRequestBuilder buildNotificationRequest](v12, "buildNotificationRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (UNNotificationRequest *)v13;
}

- (id)_initWithIdentifier:(id)a3 content:(id)a4 trigger:(id)a5 destinations:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  UNNotificationRequest *v14;
  uint64_t v15;
  UNNotificationContent *content;
  uint64_t v17;
  NSString *identifier;
  uint64_t v19;
  UNNotificationTrigger *trigger;
  void *v22;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UNNotificationRequest.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

  }
  v23.receiver = self;
  v23.super_class = (Class)UNNotificationRequest;
  v14 = -[UNNotificationRequest init](&v23, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    content = v14->_content;
    v14->_content = (UNNotificationContent *)v15;

    v17 = objc_msgSend(v11, "copy");
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    trigger = v14->_trigger;
    v14->_trigger = (UNNotificationTrigger *)v19;

    v14->_destinations = -[UNNotificationRequest _notificationDestinationsForInterruptionLevel:inputDestinations:](v14, "_notificationDestinationsForInterruptionLevel:inputDestinations:", -[UNNotificationContent interruptionLevel](v14->_content, "interruptionLevel"), a6);
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;

  -[UNNotificationRequest content](self, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[UNNotificationRequest identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[UNNotificationRequest trigger](self, "trigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[UNNotificationRequest destinations](self, "destinations");

  return v9;
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
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UNNotificationRequest content](self, "content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "content");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (UNEqualObjects(v5, v6))
    {
      -[UNNotificationRequest identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (UNEqualObjects(v7, v8))
      {
        -[UNNotificationRequest trigger](self, "trigger");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "trigger");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (UNEqualObjects(v9, v10))
          v11 = UNEqualIntegers(-[UNNotificationRequest destinations](self, "destinations"), objc_msgSend(v4, "destinations"));
        else
          v11 = 0;

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
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
  -[UNNotificationRequest identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationRequest content](self, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationRequest trigger](self, "trigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier: %@, content: %@, trigger: %@>"),
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
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UNNotificationRequest content](self, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("content"));

  -[UNNotificationRequest identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[UNNotificationRequest trigger](self, "trigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("trigger"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[UNNotificationRequest destinations](self, "destinations"), CFSTR("destinations"));
}

- (UNNotificationRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UNNotificationRequest *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("content"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trigger"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("destinations"));

  v9 = -[UNNotificationRequest _initWithIdentifier:content:trigger:destinations:](self, "_initWithIdentifier:content:trigger:destinations:", v6, v5, v7, v8);
  return v9;
}

- (void)addSecurityScope:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UNNotificationRequest content](self, "content");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSecurityScope:", v4);

}

- (void)removeSecurityScope
{
  id v2;

  -[UNNotificationRequest content](self, "content");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeSecurityScope");

}

- (void)enterSecurityScope
{
  id v2;

  -[UNNotificationRequest content](self, "content");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enterSecurityScope");

}

- (void)leaveSecurityScope
{
  id v2;

  -[UNNotificationRequest content](self, "content");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leaveSecurityScope");

}

- (unint64_t)_notificationDestinationsForInterruptionLevel:(unint64_t)a3 inputDestinations:(unint64_t)a4
{
  unint64_t v4;

  v4 = a4 & 6;
  if (a3)
    v4 = a4;
  if (a3 - 1 >= 3)
    return v4;
  else
    return a4 & 0xF;
}

- (UNNotificationContent)content
{
  return self->_content;
}

- (UNNotificationTrigger)trigger
{
  return self->_trigger;
}

- (unint64_t)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(unint64_t)a3
{
  self->_destinations = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
