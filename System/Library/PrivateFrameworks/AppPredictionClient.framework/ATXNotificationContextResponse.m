@implementation ATXNotificationContextResponse

- (ATXNotificationContextResponse)initWithNotificationSenderImportance:(int)a3 importanceConfidenceScore:(double)a4 notificationFeatureDictionary:(id)a5
{
  id v9;
  ATXNotificationContextResponse *v10;
  ATXNotificationContextResponse *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ATXNotificationContextResponse;
  v10 = -[ATXNotificationContextResponse init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_notificationSenderImportance = a3;
    v10->_importanceConfidenceScore = a4;
    objc_storeStrong((id *)&v10->_notificationFeatureDictionary, a5);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[ATXNotificationContextResponse notificationSenderImportance](self, "notificationSenderImportance"), CFSTR("notificationSenderImportance"));
  -[ATXNotificationContextResponse importanceConfidenceScore](self, "importanceConfidenceScore");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("importanceConfidenceScore"));
  -[ATXNotificationContextResponse notificationFeatureDictionary](self, "notificationFeatureDictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("notificationFeatureDictionary"));

}

- (ATXNotificationContextResponse)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  ATXNotificationContextResponse *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("notificationSenderImportance"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("importanceConfidenceScore"));
  v7 = v6;
  v8 = objc_opt_class();
  objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v8, objc_opt_class(), CFSTR("notificationFeatureDictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ATXNotificationContextResponse initWithNotificationSenderImportance:importanceConfidenceScore:notificationFeatureDictionary:](self, "initWithNotificationSenderImportance:importanceConfidenceScore:notificationFeatureDictionary:", v5, v9, v7);
  return v10;
}

- (int)notificationSenderImportance
{
  return self->_notificationSenderImportance;
}

- (double)importanceConfidenceScore
{
  return self->_importanceConfidenceScore;
}

- (NSDictionary)notificationFeatureDictionary
{
  return self->_notificationFeatureDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationFeatureDictionary, 0);
}

@end
