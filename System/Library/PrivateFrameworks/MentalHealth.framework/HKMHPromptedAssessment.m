@implementation HKMHPromptedAssessment

- (HKMHPromptedAssessment)initWithEligibilityStartDate:(id)a3 reason:(int64_t)a4
{
  id v6;
  HKMHPromptedAssessment *v7;
  uint64_t v8;
  NSDate *eligibilityStartDate;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKMHPromptedAssessment;
  v7 = -[HKMHPromptedAssessment init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    eligibilityStartDate = v7->_eligibilityStartDate;
    v7->_eligibilityStartDate = (NSDate *)v8;

    v7->_reason = a4;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[NSDate isEqualToDate:](self->_eligibilityStartDate, "isEqualToDate:", v5[1]))
      v6 = self->_reason == v5[2];
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_reason ^ -[NSDate hash](self->_eligibilityStartDate, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMHPromptedAssessment)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  HKMHPromptedAssessment *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eligibilityStartDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reason"));

  v7 = -[HKMHPromptedAssessment initWithEligibilityStartDate:reason:](self, "initWithEligibilityStartDate:reason:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *eligibilityStartDate;
  id v5;

  eligibilityStartDate = self->_eligibilityStartDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", eligibilityStartDate, CFSTR("eligibilityStartDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_reason, CFSTR("reason"));

}

- (NSDate)eligibilityStartDate
{
  return self->_eligibilityStartDate;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eligibilityStartDate, 0);
}

@end
