@implementation PAREngagedResult

- (PAREngagedResult)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PAREngagedResult;
  return -[PAREngagedResult init](&v3, sel_init);
}

- (PAREngagedResult)initWithCoder:(id)a3
{
  id v4;
  PAREngagedResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PAREngagedResult;
  v5 = -[PAREngagedResult init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PAREngagedResult setTitle:](v5, "setTitle:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PAREngagedResult setSearchString:](v5, "setSearchString:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("engagementTime"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PAREngagedResult setEngagementTime:](v5, "setEngagementTime:", v8);

    -[PAREngagedResult setType:](v5, "setType:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("type")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("freshnessScore"));
    -[PAREngagedResult setFreshnessScore:](v5, "setFreshnessScore:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("score"));
    -[PAREngagedResult setScore:](v5, "setScore:");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encodedNormalizedTopic"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PAREngagedResult setEncodedNormalizedTopic:](v5, "setEncodedNormalizedTopic:", v9);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PAREngagedResult title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[PAREngagedResult searchString](self, "searchString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("searchString"));

  -[PAREngagedResult engagementTime](self, "engagementTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("engagementTime"));

  objc_msgSend(v4, "encodeInt32:forKey:", -[PAREngagedResult type](self, "type"), CFSTR("type"));
  -[PAREngagedResult freshnessScore](self, "freshnessScore");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("freshnessScore"));
  -[PAREngagedResult score](self, "score");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("score"));
  -[PAREngagedResult encodedNormalizedTopic](self, "encodedNormalizedTopic");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("encodedNormalizedTopic"));

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSData)encodedNormalizedTopic
{
  return self->_encodedNormalizedTopic;
}

- (void)setEncodedNormalizedTopic:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)engagementTime
{
  return self->_engagementTime;
}

- (void)setEngagementTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)freshnessScore
{
  return self->_freshnessScore;
}

- (void)setFreshnessScore:(double)a3
{
  self->_freshnessScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementTime, 0);
  objc_storeStrong((id *)&self->_encodedNormalizedTopic, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
