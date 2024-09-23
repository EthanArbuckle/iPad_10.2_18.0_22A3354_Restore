@implementation ATXMailContextResponse

- (ATXMailContextResponse)initWithMailSenderImportance:(int)a3 importanceConfidenceScore:(double)a4 mailFeatureDictionary:(id)a5
{
  id v9;
  ATXMailContextResponse *v10;
  ATXMailContextResponse *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ATXMailContextResponse;
  v10 = -[ATXMailContextResponse init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_mailSenderImportance = a3;
    v10->_importanceConfidenceScore = a4;
    objc_storeStrong((id *)&v10->_mailFeatureDictionary, a5);
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
  objc_msgSend(v4, "encodeInt32:forKey:", -[ATXMailContextResponse mailSenderImportance](self, "mailSenderImportance"), CFSTR("mailSenderImportance"));
  -[ATXMailContextResponse importanceConfidenceScore](self, "importanceConfidenceScore");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("importanceConfidenceScore"));
  -[ATXMailContextResponse mailFeatureDictionary](self, "mailFeatureDictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("mailFeatureDictionary"));

}

- (ATXMailContextResponse)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  ATXMailContextResponse *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("mailSenderImportance"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("importanceConfidenceScore"));
  v7 = v6;
  v8 = objc_opt_class();
  objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v8, objc_opt_class(), CFSTR("mailFeatureDictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ATXMailContextResponse initWithMailSenderImportance:importanceConfidenceScore:mailFeatureDictionary:](self, "initWithMailSenderImportance:importanceConfidenceScore:mailFeatureDictionary:", v5, v9, v7);
  return v10;
}

- (int)mailSenderImportance
{
  return self->_mailSenderImportance;
}

- (double)importanceConfidenceScore
{
  return self->_importanceConfidenceScore;
}

- (NSDictionary)mailFeatureDictionary
{
  return self->_mailFeatureDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailFeatureDictionary, 0);
}

@end
