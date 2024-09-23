@implementation DMFFetchStreamEventsRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (id)permittedPlatforms
{
  return &unk_1E6EF4A60;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchStreamEventsRequest)initWithCoder:(id)a3
{
  id v4;
  DMFFetchStreamEventsRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *organizationIdentifier;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *eventIdentifiers;
  void *v14;
  uint64_t v15;
  NSDate *startDate;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DMFFetchStreamEventsRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("organizationIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    organizationIdentifier = v5->_organizationIdentifier;
    v5->_organizationIdentifier = (NSString *)v7;

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("eventIdentifiers"));
    v12 = objc_claimAutoreleasedReturnValue();
    eventIdentifiers = v5->_eventIdentifiers;
    v5->_eventIdentifiers = (NSArray *)v12;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("startDate"));
    v15 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DMFFetchStreamEventsRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[DMFFetchStreamEventsRequest organizationIdentifier](self, "organizationIdentifier", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("organizationIdentifier"));

  -[DMFFetchStreamEventsRequest eventIdentifiers](self, "eventIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("eventIdentifiers"));

  -[DMFFetchStreamEventsRequest startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("startDate"));

}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)eventIdentifiers
{
  return self->_eventIdentifiers;
}

- (void)setEventIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_eventIdentifiers, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
}

@end
