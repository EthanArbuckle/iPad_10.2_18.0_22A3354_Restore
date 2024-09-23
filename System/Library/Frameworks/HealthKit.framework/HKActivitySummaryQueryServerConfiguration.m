@implementation HKActivitySummaryQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKActivitySummaryQueryServerConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setShouldIncludeActivitySummaryPrivateProperties:", self->_shouldIncludeActivitySummaryPrivateProperties);
  objc_msgSend(v4, "setShouldIncludeActivitySummaryStatistics:", self->_shouldIncludeActivitySummaryStatistics);
  objc_msgSend(v4, "setOrderByDateAscending:", self->_orderByDateAscending);
  objc_msgSend(v4, "setLimit:", self->_limit);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKActivitySummaryQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKActivitySummaryQueryServerConfiguration *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKActivitySummaryQueryServerConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_shouldIncludeActivitySummaryPrivateProperties = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IncludePrivateProperties"));
    v5->_shouldIncludeActivitySummaryStatistics = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IncludeStatistics"));
    v5->_orderByDateAscending = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("OrderByDateAscending"));
    v5->_limit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Limit"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKActivitySummaryQueryServerConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldIncludeActivitySummaryPrivateProperties, CFSTR("IncludePrivateProperties"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldIncludeActivitySummaryStatistics, CFSTR("IncludeStatistics"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_orderByDateAscending, CFSTR("OrderByDateAscending"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_limit, CFSTR("Limit"));

}

- (BOOL)shouldIncludeActivitySummaryPrivateProperties
{
  return self->_shouldIncludeActivitySummaryPrivateProperties;
}

- (void)setShouldIncludeActivitySummaryPrivateProperties:(BOOL)a3
{
  self->_shouldIncludeActivitySummaryPrivateProperties = a3;
}

- (BOOL)shouldIncludeActivitySummaryStatistics
{
  return self->_shouldIncludeActivitySummaryStatistics;
}

- (void)setShouldIncludeActivitySummaryStatistics:(BOOL)a3
{
  self->_shouldIncludeActivitySummaryStatistics = a3;
}

- (BOOL)orderByDateAscending
{
  return self->_orderByDateAscending;
}

- (void)setOrderByDateAscending:(BOOL)a3
{
  self->_orderByDateAscending = a3;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

@end
