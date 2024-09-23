@implementation ATXUsageInsightsNotificationEvent

- (ATXUsageInsightsNotificationEvent)initWithBundleID:(id)a3 category:(unint64_t)a4 eventTime:(id)a5 contactIDs:(id)a6 isGroupMessage:(BOOL)a7 deliveryType:(int)a8
{
  id v14;
  id v15;
  id v16;
  ATXUsageInsightsNotificationEvent *v17;
  uint64_t v18;
  NSString *bundleID;
  uint64_t v20;
  NSArray *contactIDs;
  objc_super v23;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v23.receiver = self;
  v23.super_class = (Class)ATXUsageInsightsNotificationEvent;
  v17 = -[ATXUsageInsightsNotificationEvent init](&v23, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v14, "copy");
    bundleID = v17->_bundleID;
    v17->_bundleID = (NSString *)v18;

    v17->_category = a4;
    objc_storeStrong((id *)&v17->_eventTime, a5);
    v20 = objc_msgSend(v16, "copy");
    contactIDs = v17->_contactIDs;
    v17->_contactIDs = (NSArray *)v20;

    v17->_isGroupMessage = a7;
    v17->_deliveryType = a8;
  }

  return v17;
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
  -[ATXUsageInsightsNotificationEvent bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("bundleID"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[ATXUsageInsightsNotificationEvent category](self, "category"), CFSTR("category"));
  -[ATXUsageInsightsNotificationEvent eventTime](self, "eventTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("eventTime"));

  -[ATXUsageInsightsNotificationEvent contactIDs](self, "contactIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("contactIDs"));

  objc_msgSend(v7, "encodeBool:forKey:", -[ATXUsageInsightsNotificationEvent isGroupMessage](self, "isGroupMessage"), CFSTR("isGroupMessage"));
  objc_msgSend(v7, "encodeInt32:forKey:", -[ATXUsageInsightsNotificationEvent deliveryType](self, "deliveryType"), CFSTR("deliveryType"));

}

- (ATXUsageInsightsNotificationEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  ATXUsageInsightsNotificationEvent *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("category"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("contactIDs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isGroupMessage"));
  v13 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("deliveryType"));

  v14 = -[ATXUsageInsightsNotificationEvent initWithBundleID:category:eventTime:contactIDs:isGroupMessage:deliveryType:](self, "initWithBundleID:category:eventTime:contactIDs:isGroupMessage:deliveryType:", v5, v6, v7, v11, v12, v13);
  return v14;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unint64_t)category
{
  return self->_category;
}

- (NSDate)eventTime
{
  return self->_eventTime;
}

- (NSArray)contactIDs
{
  return self->_contactIDs;
}

- (BOOL)isGroupMessage
{
  return self->_isGroupMessage;
}

- (int)deliveryType
{
  return self->_deliveryType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIDs, 0);
  objc_storeStrong((id *)&self->_eventTime, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
