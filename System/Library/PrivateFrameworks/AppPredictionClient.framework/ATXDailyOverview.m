@implementation ATXDailyOverview

- (ATXDailyOverview)initWithType:(unint64_t)a3 sections:(id)a4 dailySummary:(id)a5 pinnedEvents:(id)a6
{
  id v10;
  id v11;
  id v12;
  ATXDailyOverview *v13;
  ATXDailyOverview *v14;
  uint64_t v15;
  NSArray *sections;
  uint64_t v17;
  NSArray *pinnedEvents;
  objc_super v20;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ATXDailyOverview;
  v13 = -[ATXDailyOverview init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_type = a3;
    v15 = objc_msgSend(v10, "copy");
    sections = v14->_sections;
    v14->_sections = (NSArray *)v15;

    objc_storeStrong((id *)&v14->_dailySummary, a5);
    v17 = objc_msgSend(v12, "copy");
    pinnedEvents = v14->_pinnedEvents;
    v14->_pinnedEvents = (NSArray *)v17;

  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXDailyOverview)initWithCoder:(id)a3
{
  id v4;
  ATXDailyOverview *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *sections;
  uint64_t v13;
  ATXDailyTimeSummary *dailySummary;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSArray *pinnedEvents;
  ATXDailyOverview *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ATXDailyOverview;
  v5 = -[ATXDailyOverview init](&v24, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v6 = (void *)MEMORY[0x1A85A4F90]();
    v7 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithObjects:", v8, v9, 0);

    objc_autoreleasePoolPop(v6);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("sections"));
    v11 = objc_claimAutoreleasedReturnValue();
    sections = v5->_sections;
    v5->_sections = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dailySummary"));
    v13 = objc_claimAutoreleasedReturnValue();
    dailySummary = v5->_dailySummary;
    v5->_dailySummary = (ATXDailyTimeSummary *)v13;

    v15 = (void *)MEMORY[0x1A85A4F90]();
    v16 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_opt_self();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v16, "initWithObjects:", v17, v18, 0);

    objc_autoreleasePoolPop(v15);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("pinnedEvents"));
    v20 = objc_claimAutoreleasedReturnValue();
    pinnedEvents = v5->_pinnedEvents;
    v5->_pinnedEvents = (NSArray *)v20;

    v22 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sections, CFSTR("sections"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dailySummary, CFSTR("dailySummary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pinnedEvents, CFSTR("pinnedEvents"));

}

- (unint64_t)type
{
  return self->_type;
}

- (NSArray)sections
{
  return self->_sections;
}

- (ATXDailyTimeSummary)dailySummary
{
  return self->_dailySummary;
}

- (NSArray)pinnedEvents
{
  return self->_pinnedEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinnedEvents, 0);
  objc_storeStrong((id *)&self->_dailySummary, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
