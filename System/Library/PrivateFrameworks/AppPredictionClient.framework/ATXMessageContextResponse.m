@implementation ATXMessageContextResponse

- (ATXMessageContextResponse)initWithMessageSenderImportance:(int)a3 importanceConfidenceScore:(double)a4 messageFeatureDictionary:(id)a5
{
  id v9;
  ATXMessageContextResponse *v10;
  ATXMessageContextResponse *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ATXMessageContextResponse;
  v10 = -[ATXMessageContextResponse init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_messageSenderImportance = a3;
    v10->_importanceConfidenceScore = a4;
    objc_storeStrong((id *)&v10->_messageFeatureDictionary, a5);
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
  objc_msgSend(v4, "encodeInt32:forKey:", -[ATXMessageContextResponse messageSenderImportance](self, "messageSenderImportance"), CFSTR("messageSenderImportance"));
  -[ATXMessageContextResponse importanceConfidenceScore](self, "importanceConfidenceScore");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("importanceConfidenceScore"));
  -[ATXMessageContextResponse messageFeatureDictionary](self, "messageFeatureDictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("messageFeatureDictionary"));

}

- (ATXMessageContextResponse)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  ATXMessageContextResponse *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("messageSenderImportance"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("importanceConfidenceScore"));
  v7 = v6;
  v8 = objc_opt_class();
  objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v8, objc_opt_class(), CFSTR("messageFeatureDictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ATXMessageContextResponse initWithMessageSenderImportance:importanceConfidenceScore:messageFeatureDictionary:](self, "initWithMessageSenderImportance:importanceConfidenceScore:messageFeatureDictionary:", v5, v9, v7);
  return v10;
}

- (int)messageSenderImportance
{
  return self->_messageSenderImportance;
}

- (double)importanceConfidenceScore
{
  return self->_importanceConfidenceScore;
}

- (NSDictionary)messageFeatureDictionary
{
  return self->_messageFeatureDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageFeatureDictionary, 0);
}

@end
