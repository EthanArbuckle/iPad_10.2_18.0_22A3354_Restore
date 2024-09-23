@implementation DMFReportingRequirements

- (DMFReportingRequirements)init
{
  DMFReportingRequirements *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DMFReportingRequirements;
  result = -[DMFReportingRequirements init](&v3, sel_init);
  if (result)
    result->_updateCoalescenceInterval = -1.0;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("reachableHostName");
  v6[1] = CFSTR("updateCoalescenceInterval");
  v6[2] = CFSTR("requireActiveConnection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DMFObjectDescriptionWithProperties(self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFReportingRequirements)initWithCoder:(id)a3
{
  id v4;
  DMFReportingRequirements *v5;
  void *v6;
  uint64_t v7;
  NSString *reachableHostName;
  void *v9;
  double v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMFReportingRequirements;
  v5 = -[DMFReportingRequirements init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("reachableHostName"));
    v7 = objc_claimAutoreleasedReturnValue();
    reachableHostName = v5->_reachableHostName;
    v5->_reachableHostName = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updateCoalescenceInterval"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v5->_updateCoalescenceInterval = v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requireActiveConnection"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_requireActiveConnection = objc_msgSend(v11, "BOOLValue");

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
  -[DMFReportingRequirements reachableHostName](self, "reachableHostName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("reachableHostName"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[DMFReportingRequirements updateCoalescenceInterval](self, "updateCoalescenceInterval");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("updateCoalescenceInterval"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFReportingRequirements requireActiveConnection](self, "requireActiveConnection"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("requireActiveConnection"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[DMFReportingRequirements reachableHostName](self, "reachableHostName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReachableHostName:", v5);

  -[DMFReportingRequirements updateCoalescenceInterval](self, "updateCoalescenceInterval");
  objc_msgSend(v4, "setUpdateCoalescenceInterval:");
  objc_msgSend(v4, "setRequireActiveConnection:", -[DMFReportingRequirements requireActiveConnection](self, "requireActiveConnection"));
  return v4;
}

- (NSString)reachableHostName
{
  return self->_reachableHostName;
}

- (void)setReachableHostName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)updateCoalescenceInterval
{
  return self->_updateCoalescenceInterval;
}

- (void)setUpdateCoalescenceInterval:(double)a3
{
  self->_updateCoalescenceInterval = a3;
}

- (BOOL)requireActiveConnection
{
  return self->_requireActiveConnection;
}

- (void)setRequireActiveConnection:(BOOL)a3
{
  self->_requireActiveConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachableHostName, 0);
}

@end
