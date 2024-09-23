@implementation ATXUsageInsightsPhubbingEvent

- (ATXUsageInsightsPhubbingEvent)initWithRelationshipType:(id)a3 startTime:(id)a4 endTime:(id)a5 duration:(double)a6 appSessions:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  ATXUsageInsightsPhubbingEvent *v16;
  uint64_t v17;
  NSString *relationshipType;
  uint64_t v19;
  NSArray *appSessions;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)ATXUsageInsightsPhubbingEvent;
  v16 = -[ATXUsageInsightsPhubbingEvent init](&v22, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    relationshipType = v16->_relationshipType;
    v16->_relationshipType = (NSString *)v17;

    objc_storeStrong((id *)&v16->_startTime, a4);
    objc_storeStrong((id *)&v16->_endTime, a5);
    v16->_duration = a6;
    v19 = objc_msgSend(v15, "copy");
    appSessions = v16->_appSessions;
    v16->_appSessions = (NSArray *)v19;

  }
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[ATXUsageInsightsPhubbingEvent relationshipType](self, "relationshipType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("relationshipType"));

  -[ATXUsageInsightsPhubbingEvent startTime](self, "startTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("startTime"));

  -[ATXUsageInsightsPhubbingEvent endTime](self, "endTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("endTime"));

  -[ATXUsageInsightsPhubbingEvent duration](self, "duration");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("duration"));
  -[ATXUsageInsightsPhubbingEvent appSessions](self, "appSessions");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("appSessions"));

}

- (ATXUsageInsightsPhubbingEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ATXUsageInsightsPhubbingEvent *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relationshipType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
  v9 = v8;
  v10 = (void *)MEMORY[0x1E0C99E60];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("appSessions"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[ATXUsageInsightsPhubbingEvent initWithRelationshipType:startTime:endTime:duration:appSessions:](self, "initWithRelationshipType:startTime:endTime:duration:appSessions:", v5, v6, v7, v13, v9);
  return v14;
}

- (NSString)relationshipType
{
  return self->_relationshipType;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (double)duration
{
  return self->_duration;
}

- (NSArray)appSessions
{
  return self->_appSessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSessions, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_relationshipType, 0);
}

@end
