@implementation AFOpportuneSpeakingModelFeedback

- (AFOpportuneSpeakingModelFeedback)initWithCoder:(id)a3
{
  id v4;
  AFOpportuneSpeakingModelFeedback *v5;
  uint64_t v6;
  NSDate *lastNegativeFeedback;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *negativeFeedbackByContact;
  objc_super v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AFOpportuneSpeakingModelFeedback;
  v5 = -[AFOpportuneSpeakingModelFeedback init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastNegativeFeedback"));
    v6 = objc_claimAutoreleasedReturnValue();
    lastNegativeFeedback = v5->_lastNegativeFeedback;
    v5->_lastNegativeFeedback = (NSDate *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_negativeFeedbackByContact"));
    v11 = objc_claimAutoreleasedReturnValue();
    negativeFeedbackByContact = v5->_negativeFeedbackByContact;
    v5->_negativeFeedbackByContact = (NSDictionary *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *lastNegativeFeedback;
  id v5;

  lastNegativeFeedback = self->_lastNegativeFeedback;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", lastNegativeFeedback, CFSTR("_lastNegativeFeedback"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_negativeFeedbackByContact, CFSTR("_negativeFeedbackByContact"));

}

- (NSDate)lastNegativeFeedback
{
  return self->_lastNegativeFeedback;
}

- (void)setLastNegativeFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_lastNegativeFeedback, a3);
}

- (NSDictionary)negativeFeedbackByContact
{
  return self->_negativeFeedbackByContact;
}

- (void)setNegativeFeedbackByContact:(id)a3
{
  objc_storeStrong((id *)&self->_negativeFeedbackByContact, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativeFeedbackByContact, 0);
  objc_storeStrong((id *)&self->_lastNegativeFeedback, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
