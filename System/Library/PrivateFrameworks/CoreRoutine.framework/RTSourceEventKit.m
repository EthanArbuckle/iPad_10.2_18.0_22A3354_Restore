@implementation RTSourceEventKit

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sharingStatusToString:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Not Shared");
  if (a3 == 1)
    v3 = CFSTR("Shared From Me");
  if (a3 == 2)
    return CFSTR("Shared To Me");
  else
    return (id)v3;
}

- (RTSourceEventKit)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithEventIdentifier_startDate_endDate_title_location_allDay_sharingStatus_suggestionInfo_opaqueKey_suggestionsSchemaOrg_);
}

- (RTSourceEventKit)initWithEventIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 title:(id)a6 location:(id)a7 allDay:(BOOL)a8 sharingStatus:(unint64_t)a9
{
  return -[RTSourceEventKit initWithEventIdentifier:startDate:endDate:title:location:allDay:sharingStatus:suggestionInfo_opaqueKey:suggestionsSchemaOrg:](self, "initWithEventIdentifier:startDate:endDate:title:location:allDay:sharingStatus:suggestionInfo_opaqueKey:suggestionsSchemaOrg:", a3, a4, a5, a6, a7, a8, a9, 0, 0);
}

- (RTSourceEventKit)initWithEventIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 title:(id)a6 location:(id)a7 allDay:(BOOL)a8 sharingStatus:(unint64_t)a9 suggestionInfo_opaqueKey:(id)a10
{
  return -[RTSourceEventKit initWithEventIdentifier:startDate:endDate:title:location:allDay:sharingStatus:suggestionInfo_opaqueKey:suggestionsSchemaOrg:](self, "initWithEventIdentifier:startDate:endDate:title:location:allDay:sharingStatus:suggestionInfo_opaqueKey:suggestionsSchemaOrg:", a3, a4, a5, a6, a7, a8, a9, a10, 0);
}

- (RTSourceEventKit)initWithEventIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 title:(id)a6 location:(id)a7 allDay:(BOOL)a8 sharingStatus:(unint64_t)a9 suggestionInfo_opaqueKey:(id)a10 suggestionsSchemaOrg:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  RTSourceEventKit *v23;
  uint64_t v24;
  NSString *eventIdentifier;
  uint64_t v26;
  NSDate *startDate;
  uint64_t v28;
  NSDate *endDate;
  uint64_t v30;
  NSString *title;
  uint64_t v32;
  NSString *location;
  uint64_t v34;
  NSString *suggestionInfo_opaqueKey;
  uint64_t v36;
  NSDictionary *suggestionsSchemaOrg;
  id v39;
  objc_super v40;

  v17 = a3;
  v39 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a10;
  v22 = a11;
  v40.receiver = self;
  v40.super_class = (Class)RTSourceEventKit;
  v23 = -[RTSourceEventKit init](&v40, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v17, "copy");
    eventIdentifier = v23->_eventIdentifier;
    v23->_eventIdentifier = (NSString *)v24;

    v26 = objc_msgSend(v39, "copy");
    startDate = v23->_startDate;
    v23->_startDate = (NSDate *)v26;

    v28 = objc_msgSend(v18, "copy");
    endDate = v23->_endDate;
    v23->_endDate = (NSDate *)v28;

    v30 = objc_msgSend(v19, "copy");
    title = v23->_title;
    v23->_title = (NSString *)v30;

    v32 = objc_msgSend(v20, "copy");
    location = v23->_location;
    v23->_location = (NSString *)v32;

    v23->_allDay = a8;
    v23->_sharingStatus = a9;
    v34 = objc_msgSend(v21, "copy");
    suggestionInfo_opaqueKey = v23->_suggestionInfo_opaqueKey;
    v23->_suggestionInfo_opaqueKey = (NSString *)v34;

    v36 = objc_msgSend(v22, "copy");
    suggestionsSchemaOrg = v23->_suggestionsSchemaOrg;
    v23->_suggestionsSchemaOrg = (NSDictionary *)v36;

  }
  return v23;
}

- (RTSourceEventKit)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  RTSourceEventKit *v15;
  void *v17;
  void *v18;
  void *v19;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventIdentifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("allDay"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestionInfo_opaqueKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v13, CFSTR("suggestionsSchemaOrg"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[RTSourceEventKit initWithEventIdentifier:startDate:endDate:title:location:allDay:sharingStatus:suggestionInfo_opaqueKey:suggestionsSchemaOrg:](self, "initWithEventIdentifier:startDate:endDate:title:location:allDay:sharingStatus:suggestionInfo_opaqueKey:suggestionsSchemaOrg:", v19, v18, v17, v4, v5, v6, v8, v9, v14);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RTSourceEventKit;
  v4 = a3;
  -[RTSource encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_eventIdentifier, CFSTR("eventIdentifier"), v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_location, CFSTR("location"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_allDay, CFSTR("allDay"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sharingStatus);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sharingStatus"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_suggestionInfo_opaqueKey, CFSTR("suggestionInfo_opaqueKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_suggestionsSchemaOrg, CFSTR("suggestionsSchemaOrg"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTSourceEventKit eventIdentifier](self, "eventIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTSourceEventKit startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTSourceEventKit endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTSourceEventKit title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTSourceEventKit location](self, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "sharingStatusToString:", -[RTSourceEventKit sharingStatus](self, "sharingStatus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTSourceEventKit suggestionsSchemaOrg](self, "suggestionsSchemaOrg");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CFSTR("YES");
  if (!v12)
    v13 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, eventIdentifier, %@, startDate, %@, endDate, %@, title, %@, location %@, sharingStatus, %@, suggestionsSchemaOrg, %@"), v5, v6, v7, v8, v9, v10, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RTSourceEventKit;
  if (-[RTSource isEqual:](&v12, sel_isEqual_, v5))
  {
    v6 = v5;
    -[RTSourceEventKit eventIdentifier](self, "eventIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 || (objc_msgSend(v6, "eventIdentifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[RTSourceEventKit eventIdentifier](self, "eventIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "eventIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

      if (v7)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      v10 = 1;
    }

    goto LABEL_9;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RTSourceEventKit;
  v3 = -[RTSource hash](&v7, sel_hash);
  -[RTSourceEventKit eventIdentifier](self, "eventIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)location
{
  return self->_location;
}

- (BOOL)isAllDay
{
  return self->_allDay;
}

- (NSString)suggestionInfo_opaqueKey
{
  return self->_suggestionInfo_opaqueKey;
}

- (NSDictionary)suggestionsSchemaOrg
{
  return self->_suggestionsSchemaOrg;
}

- (unint64_t)sharingStatus
{
  return self->_sharingStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsSchemaOrg, 0);
  objc_storeStrong((id *)&self->_suggestionInfo_opaqueKey, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

@end
