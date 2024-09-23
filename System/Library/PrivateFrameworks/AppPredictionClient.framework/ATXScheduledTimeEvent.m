@implementation ATXScheduledTimeEvent

+ (UTType)uniformType
{
  return (UTType *)objc_msgSend(MEMORY[0x1E0CEC3F8], "exportedTypeWithIdentifier:conformingToType:", CFSTR("com.proactive.scheduledTimeEvent"), *MEMORY[0x1E0CEC528]);
}

- (ATXScheduledTimeEvent)initWithDomainIdentifier:(id)a3 identifier:(id)a4 eventDescription:(id)a5 startDate:(id)a6 endDate:(id)a7 priority:(int64_t)a8 source:(id)a9 relevanceTag:(int64_t)a10 fuzzyTime:(int64_t)a11 context:(id)a12 isGap:(BOOL)a13 isPast:(BOOL)a14 isAllDayEvent:(BOOL)a15 isCompleted:(BOOL)a16 etaMinutes:(double)a17 mediumPresentation:(id)a18 smallPresentation:(id)a19 glyphPresentation:(id)a20 sourceLocation:(id)a21 destinationLocation:(id)a22 actions:(id)a23 feedbackOptions:(id)a24
{
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  ATXScheduledTimeEvent *v37;
  uint64_t v38;
  NSString *domainIdentifier;
  uint64_t v40;
  NSString *identifier;
  uint64_t v42;
  NSString *eventDescription;
  uint64_t v44;
  NSArray *actions;
  uint64_t v46;
  NSArray *feedbackOptions;
  ATXScheduledTimeEvent *v48;
  id obj;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  objc_super v59;

  v58 = a3;
  v57 = a4;
  v56 = a5;
  obj = a6;
  v55 = a6;
  v29 = a7;
  v30 = a9;
  v31 = a12;
  v32 = a18;
  v54 = a19;
  v33 = a20;
  v53 = a21;
  v34 = a22;
  v35 = a23;
  v36 = a24;
  v59.receiver = self;
  v59.super_class = (Class)ATXScheduledTimeEvent;
  v37 = -[ATXScheduledTimeEvent init](&v59, sel_init);
  if (v37)
  {
    v38 = objc_msgSend(v58, "copy");
    domainIdentifier = v37->_domainIdentifier;
    v37->_domainIdentifier = (NSString *)v38;

    v40 = objc_msgSend(v57, "copy");
    identifier = v37->_identifier;
    v37->_identifier = (NSString *)v40;

    v42 = objc_msgSend(v56, "copy");
    eventDescription = v37->_eventDescription;
    v37->_eventDescription = (NSString *)v42;

    objc_storeStrong((id *)&v37->_startDate, obj);
    objc_storeStrong((id *)&v37->_endDate, a7);
    v37->_priority = a8;
    objc_storeStrong((id *)&v37->_source, a9);
    v37->_relevanceTag = a10;
    v37->_fuzzyTime = a11;
    objc_storeStrong((id *)&v37->_context, a12);
    v37->_isGap = a13;
    v37->_isPast = a14;
    v37->_isAllDayEvent = a15;
    v37->_isCompleted = a16;
    v37->_etaMinutes = a17;
    objc_storeStrong((id *)&v37->_mediumPresentation, a18);
    objc_storeStrong((id *)&v37->_smallPresentation, a19);
    objc_storeStrong((id *)&v37->_glyphPresentation, a20);
    objc_storeStrong((id *)&v37->_sourceLocation, a21);
    objc_storeStrong((id *)&v37->_destinationLocation, a22);
    v44 = objc_msgSend(v35, "copy");
    actions = v37->_actions;
    v37->_actions = (NSArray *)v44;

    v46 = objc_msgSend(v36, "copy");
    feedbackOptions = v37->_feedbackOptions;
    v37->_feedbackOptions = (NSArray *)v46;

    v48 = v37;
  }

  return v37;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 isGap;
  id v5;

  isGap = self->_isGap;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", isGap, CFSTR("gap"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPast, CFSTR("past"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isAllDayEvent, CFSTR("allDay"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_relevanceTag, CFSTR("relevanceTag"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_fuzzyTime, CFSTR("fuzzyTime"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCompleted, CFSTR("complete"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_priority, CFSTR("priority"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventDescription, CFSTR("eventDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediumPresentation, CFSTR("mediumPresentation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_smallPresentation, CFSTR("smallPresentation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_glyphPresentation, CFSTR("glyphPresentation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_destinationLocation, CFSTR("locationDest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceLocation, CFSTR("locationSource"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("minutes"), self->_etaMinutes);
  objc_msgSend(v5, "encodeObject:forKey:", self->_source, CFSTR("source"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_domainIdentifier, CFSTR("domainIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_context, CFSTR("context"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actions, CFSTR("actions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_feedbackOptions, CFSTR("feedbackOptions"));

}

- (ATXScheduledTimeEvent)initWithCoder:(id)a3
{
  id v4;
  ATXScheduledTimeEvent *v5;
  uint64_t v6;
  NSString *eventDescription;
  uint64_t v8;
  NSDate *startDate;
  uint64_t v10;
  NSDate *endDate;
  uint64_t v12;
  ATXTimeEventPresentation *mediumPresentation;
  uint64_t v14;
  ATXTimeEventPresentation *smallPresentation;
  uint64_t v16;
  ATXTimeGlyphPresentation *glyphPresentation;
  uint64_t v18;
  ATXTimeEventLocation *sourceLocation;
  uint64_t v20;
  ATXTimeEventLocation *destinationLocation;
  double v22;
  uint64_t v23;
  ATXTimeEventSource *source;
  uint64_t v25;
  NSString *domainIdentifier;
  uint64_t v27;
  NSString *identifier;
  uint64_t v29;
  ATXTimeContext *context;
  uint64_t v31;
  NSArray *actions;
  uint64_t v33;
  NSArray *feedbackOptions;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)ATXScheduledTimeEvent;
  v5 = -[ATXScheduledTimeEvent init](&v36, sel_init);
  if (v5)
  {
    v5->_isGap = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("gap"));
    v5->_isPast = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("past"));
    v5->_isAllDayEvent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allDay"));
    v5->_relevanceTag = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("relevanceTag"));
    v5->_fuzzyTime = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fuzzyTime"));
    v5->_isCompleted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("complete"));
    v5->_priority = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("priority"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventDescription"));
    v6 = objc_claimAutoreleasedReturnValue();
    eventDescription = v5->_eventDescription;
    v5->_eventDescription = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediumPresentation"));
    v12 = objc_claimAutoreleasedReturnValue();
    mediumPresentation = v5->_mediumPresentation;
    v5->_mediumPresentation = (ATXTimeEventPresentation *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("smallPresentation"));
    v14 = objc_claimAutoreleasedReturnValue();
    smallPresentation = v5->_smallPresentation;
    v5->_smallPresentation = (ATXTimeEventPresentation *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("glyphPresentation"));
    v16 = objc_claimAutoreleasedReturnValue();
    glyphPresentation = v5->_glyphPresentation;
    v5->_glyphPresentation = (ATXTimeGlyphPresentation *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationSource"));
    v18 = objc_claimAutoreleasedReturnValue();
    sourceLocation = v5->_sourceLocation;
    v5->_sourceLocation = (ATXTimeEventLocation *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationDest"));
    v20 = objc_claimAutoreleasedReturnValue();
    destinationLocation = v5->_destinationLocation;
    v5->_destinationLocation = (ATXTimeEventLocation *)v20;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("minutes"));
    v5->_etaMinutes = v22;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source"));
    v23 = objc_claimAutoreleasedReturnValue();
    source = v5->_source;
    v5->_source = (ATXTimeEventSource *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domainIdentifier"));
    v25 = objc_claimAutoreleasedReturnValue();
    domainIdentifier = v5->_domainIdentifier;
    v5->_domainIdentifier = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v27 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
    v29 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (ATXTimeContext *)v29;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("actions"));
    v31 = objc_claimAutoreleasedReturnValue();
    actions = v5->_actions;
    v5->_actions = (NSArray *)v31;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("feedbackOptions"));
    v33 = objc_claimAutoreleasedReturnValue();
    feedbackOptions = v5->_feedbackOptions;
    v5->_feedbackOptions = (NSArray *)v33;

  }
  return v5;
}

- (id)description
{
  __CFString *v2;
  void *v4;
  _BOOL8 isPast;
  int64_t priority;
  NSString *eventDescription;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (self->_isGap)
  {
    v2 = CFSTR("\n\nGap\n");
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    isPast = self->_isPast;
    priority = self->_priority;
    eventDescription = self->_eventDescription;
    objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", self->_startDate, 1, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", self->_endDate, 1, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXTimeEventLocation geoLocation](self->_destinationLocation, "geoLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXTimeEventLocation title](self->_destinationLocation, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("\n\nPriority: %ld\nIs Past: %d\nEvent Description: %@\nStart Date: %@\nEnd Date: %@\nGeoLocation: %@\nLocation Title: %@\nLOI Type: %ld\n"), priority, isPast, eventDescription, v8, v9, v10, v11, -[ATXTimeEventLocation destinationLOIType](self->_destinationLocation, "destinationLOIType"));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v6;

  v4 = objc_alloc((Class)objc_opt_class());
  LODWORD(v6) = *(_DWORD *)&self->_isGap;
  return (id)objc_msgSend(v4, "initWithDomainIdentifier:identifier:eventDescription:startDate:endDate:priority:source:relevanceTag:fuzzyTime:context:isGap:isPast:isAllDayEvent:isCompleted:etaMinutes:mediumPresentation:smallPresentation:glyphPresentation:sourceLocation:destinationLocation:actions:feedbackOptions:", self->_domainIdentifier, self->_identifier, self->_eventDescription, self->_startDate, self->_endDate, self->_priority, self->_etaMinutes, self->_source, self->_relevanceTag, self->_fuzzyTime, self->_context, v6, self->_mediumPresentation, self->_smallPresentation, self->_glyphPresentation,
               self->_sourceLocation,
               self->_destinationLocation,
               self->_actions,
               self->_feedbackOptions);
}

- (BOOL)isGap
{
  return self->_isGap;
}

- (BOOL)isPast
{
  return self->_isPast;
}

- (BOOL)isAllDayEvent
{
  return self->_isAllDayEvent;
}

- (int64_t)fuzzyTime
{
  return self->_fuzzyTime;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (int64_t)relevanceTag
{
  return self->_relevanceTag;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (ATXTimeEventSource)source
{
  return self->_source;
}

- (double)etaMinutes
{
  return self->_etaMinutes;
}

- (int64_t)priority
{
  return self->_priority;
}

- (NSString)eventDescription
{
  return self->_eventDescription;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (ATXTimeEventPresentation)mediumPresentation
{
  return self->_mediumPresentation;
}

- (ATXTimeEventPresentation)smallPresentation
{
  return self->_smallPresentation;
}

- (ATXTimeGlyphPresentation)glyphPresentation
{
  return self->_glyphPresentation;
}

- (ATXTimeEventLocation)sourceLocation
{
  return self->_sourceLocation;
}

- (ATXTimeEventLocation)destinationLocation
{
  return self->_destinationLocation;
}

- (ATXTimeContext)context
{
  return self->_context;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSArray)feedbackOptions
{
  return self->_feedbackOptions;
}

- (BOOL)isCompleted
{
  return self->_isCompleted;
}

- (void)setIsCompleted:(BOOL)a3
{
  self->_isCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackOptions, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_destinationLocation, 0);
  objc_storeStrong((id *)&self->_sourceLocation, 0);
  objc_storeStrong((id *)&self->_glyphPresentation, 0);
  objc_storeStrong((id *)&self->_smallPresentation, 0);
  objc_storeStrong((id *)&self->_mediumPresentation, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_eventDescription, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
}

@end
