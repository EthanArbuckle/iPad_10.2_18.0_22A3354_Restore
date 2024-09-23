@implementation IQFMapsPersonalizationResult

- (IQFMapsPersonalizationResult)initWithMUID:(id)a3 resultType:(unint64_t)a4 eventName:(id)a5 startEventDate:(id)a6 endEventDate:(id)a7 terminal:(id)a8 flightCode:(id)a9 ticketNumber:(id)a10 numberOfVisits:(id)a11 dateOfLastVisit:(id)a12 numberOfGuests:(id)a13
{
  return -[IQFMapsPersonalizationResult initWithMUID:resultType:eventName:startEventDate:endEventDate:terminal:flightCode:ticketNumber:numberOfVisits:numberOfVisitsGivenLocation:dateOfLastVisit:entityRelevanceScore:numberOfGuests:](self, "initWithMUID:resultType:eventName:startEventDate:endEventDate:terminal:flightCode:ticketNumber:numberOfVisits:numberOfVisitsGivenLocation:dateOfLastVisit:entityRelevanceScore:numberOfGuests:", a3, a4, a5, a6, a7, a8, a9, a10, a11, &unk_250F8EB60, a12, &unk_250F8EB60, a13);
}

- (IQFMapsPersonalizationResult)initWithMUID:(id)a3 resultType:(unint64_t)a4 eventName:(id)a5 startEventDate:(id)a6 endEventDate:(id)a7 terminal:(id)a8 flightCode:(id)a9 ticketNumber:(id)a10 numberOfVisits:(id)a11 numberOfVisitsGivenLocation:(id)a12 dateOfLastVisit:(id)a13 entityRelevanceScore:(id)a14 numberOfGuests:(id)a15
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  IQFMapsPersonalizationResult *v24;
  IQFMapsPersonalizationResult *v25;
  id v29;
  id v30;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  objc_super v39;

  v38 = a3;
  v29 = a5;
  v37 = a5;
  v36 = a6;
  v30 = a7;
  v35 = a7;
  v34 = a8;
  v33 = a9;
  v32 = a10;
  v19 = a11;
  v20 = a12;
  v21 = a13;
  v22 = a14;
  v23 = a15;
  v39.receiver = self;
  v39.super_class = (Class)IQFMapsPersonalizationResult;
  v24 = -[IQFMapsPersonalizationResult init](&v39, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_muid, a3);
    v25->_resultType = a4;
    objc_storeStrong((id *)&v25->_eventName, v29);
    objc_storeStrong((id *)&v25->_startEventDate, a6);
    objc_storeStrong((id *)&v25->_endEventDate, v30);
    objc_storeStrong((id *)&v25->_terminal, a8);
    objc_storeStrong((id *)&v25->_flightCode, a9);
    objc_storeStrong((id *)&v25->_ticketNumber, a10);
    objc_storeStrong((id *)&v25->_numberOfVisits, a11);
    objc_storeStrong((id *)&v25->_numberOfVisitsGivenLocation, a12);
    objc_storeStrong((id *)&v25->_dateOfLastVisit, a13);
    objc_storeStrong((id *)&v25->_entityRelevanceScore, a14);
    objc_storeStrong((id *)&v25->_numberOfGuests, a15);
  }

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IQFMapsPersonalizationResult)initWithCoder:(id)a3
{
  id v4;
  IQFMapsPersonalizationResult *v5;
  uint64_t v6;
  NSString *muid;
  uint64_t v8;
  NSString *eventName;
  uint64_t v10;
  NSDate *startEventDate;
  uint64_t v12;
  NSDate *endEventDate;
  uint64_t v14;
  NSString *terminal;
  uint64_t v16;
  NSString *flightCode;
  uint64_t v18;
  NSString *ticketNumber;
  uint64_t v20;
  NSNumber *numberOfVisits;
  uint64_t v22;
  NSNumber *numberOfVisitsGivenLocation;
  uint64_t v24;
  NSDate *dateOfLastVisit;
  uint64_t v26;
  NSNumber *entityRelevanceScore;
  uint64_t v28;
  NSNumber *numberOfGuests;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)IQFMapsPersonalizationResult;
  v5 = -[IQFMapsPersonalizationResult init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_muid"));
    v6 = objc_claimAutoreleasedReturnValue();
    muid = v5->_muid;
    v5->_muid = (NSString *)v6;

    v5->_resultType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_resultType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_eventName"));
    v8 = objc_claimAutoreleasedReturnValue();
    eventName = v5->_eventName;
    v5->_eventName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_startEventDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    startEventDate = v5->_startEventDate;
    v5->_startEventDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_endEventDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    endEventDate = v5->_endEventDate;
    v5->_endEventDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_terminal"));
    v14 = objc_claimAutoreleasedReturnValue();
    terminal = v5->_terminal;
    v5->_terminal = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_flightCode"));
    v16 = objc_claimAutoreleasedReturnValue();
    flightCode = v5->_flightCode;
    v5->_flightCode = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ticketNumber"));
    v18 = objc_claimAutoreleasedReturnValue();
    ticketNumber = v5->_ticketNumber;
    v5->_ticketNumber = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_numberOfVisits"));
    v20 = objc_claimAutoreleasedReturnValue();
    numberOfVisits = v5->_numberOfVisits;
    v5->_numberOfVisits = (NSNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_numberOfVisitsGivenLocation"));
    v22 = objc_claimAutoreleasedReturnValue();
    numberOfVisitsGivenLocation = v5->_numberOfVisitsGivenLocation;
    v5->_numberOfVisitsGivenLocation = (NSNumber *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_dateOfLastVisit"));
    v24 = objc_claimAutoreleasedReturnValue();
    dateOfLastVisit = v5->_dateOfLastVisit;
    v5->_dateOfLastVisit = (NSDate *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_entityRelevanceScore"));
    v26 = objc_claimAutoreleasedReturnValue();
    entityRelevanceScore = v5->_entityRelevanceScore;
    v5->_entityRelevanceScore = (NSNumber *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_numberOfGuests"));
    v28 = objc_claimAutoreleasedReturnValue();
    numberOfGuests = v5->_numberOfGuests;
    v5->_numberOfGuests = (NSNumber *)v28;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *muid;
  NSString *eventName;
  NSDate *startEventDate;
  NSDate *endEventDate;
  void *v9;
  NSString *terminal;
  NSString *flightCode;
  NSString *ticketNumber;
  NSNumber *numberOfVisits;
  NSNumber *numberOfVisitsGivenLocation;
  NSDate *dateOfLastVisit;
  NSNumber *entityRelevanceScore;
  NSNumber *numberOfGuests;
  id v18;

  v4 = a3;
  muid = self->_muid;
  v18 = v4;
  if (muid)
  {
    objc_msgSend(v4, "encodeObject:forKey:", muid, CFSTR("_muid"));
    v4 = v18;
  }
  objc_msgSend(v4, "encodeInteger:forKey:", self->_resultType, CFSTR("_resultType"));
  eventName = self->_eventName;
  if (eventName)
    objc_msgSend(v18, "encodeObject:forKey:", eventName, CFSTR("_eventName"));
  startEventDate = self->_startEventDate;
  if (startEventDate)
    objc_msgSend(v18, "encodeObject:forKey:", startEventDate, CFSTR("_startEventDate"));
  endEventDate = self->_endEventDate;
  v9 = v18;
  if (endEventDate)
  {
    objc_msgSend(v18, "encodeObject:forKey:", endEventDate, CFSTR("_endEventDate"));
    v9 = v18;
  }
  terminal = self->_terminal;
  if (terminal)
  {
    objc_msgSend(v18, "encodeObject:forKey:", terminal, CFSTR("_terminal"));
    v9 = v18;
  }
  flightCode = self->_flightCode;
  if (flightCode)
  {
    objc_msgSend(v18, "encodeObject:forKey:", flightCode, CFSTR("_flightCode"));
    v9 = v18;
  }
  ticketNumber = self->_ticketNumber;
  if (ticketNumber)
  {
    objc_msgSend(v18, "encodeObject:forKey:", ticketNumber, CFSTR("_ticketNumber"));
    v9 = v18;
  }
  numberOfVisits = self->_numberOfVisits;
  if (numberOfVisits)
  {
    objc_msgSend(v18, "encodeObject:forKey:", numberOfVisits, CFSTR("_numberOfVisits"));
    v9 = v18;
  }
  numberOfVisitsGivenLocation = self->_numberOfVisitsGivenLocation;
  if (numberOfVisitsGivenLocation)
  {
    objc_msgSend(v18, "encodeObject:forKey:", numberOfVisitsGivenLocation, CFSTR("_numberOfVisitsGivenLocation"));
    v9 = v18;
  }
  dateOfLastVisit = self->_dateOfLastVisit;
  if (dateOfLastVisit)
  {
    objc_msgSend(v18, "encodeObject:forKey:", dateOfLastVisit, CFSTR("_dateOfLastVisit"));
    v9 = v18;
  }
  entityRelevanceScore = self->_entityRelevanceScore;
  if (entityRelevanceScore)
  {
    objc_msgSend(v18, "encodeObject:forKey:", entityRelevanceScore, CFSTR("_entityRelevanceScore"));
    v9 = v18;
  }
  numberOfGuests = self->_numberOfGuests;
  if (numberOfGuests)
  {
    objc_msgSend(v18, "encodeObject:forKey:", numberOfGuests, CFSTR("_numberOfGuests"));
    v9 = v18;
  }

}

- (void)setIsCandidateForPromotion:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *isCandidateForPromotion;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  isCandidateForPromotion = self->_isCandidateForPromotion;
  self->_isCandidateForPromotion = v4;

}

- (BOOL)isCandidateForPromotion
{
  return -[NSNumber BOOLValue](self->_isCandidateForPromotion, "BOOLValue");
}

- (id)_isCandidateForPromotion
{
  return self->_isCandidateForPromotion;
}

- (void)setScore:(double)a3
{
  NSNumber *v4;
  NSNumber *score;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  score = self->_score;
  self->_score = v4;

}

- (double)score
{
  double result;

  -[NSNumber doubleValue](self->_score, "doubleValue");
  return result;
}

- (id)_score
{
  return self->_score;
}

- (NSString)muid
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)resultType
{
  return self->_resultType;
}

- (void)setResultType:(unint64_t)a3
{
  self->_resultType = a3;
}

- (NSString)eventName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEventName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDate)startEventDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStartEventDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDate)endEventDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEndEventDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)terminal
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTerminal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)flightCode
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFlightCode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)ticketNumber
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTicketNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSNumber)numberOfVisits
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setNumberOfVisits:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)numberOfVisitsGivenLocation
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setNumberOfVisitsGivenLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSDate)dateOfLastVisit
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDateOfLastVisit:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSNumber)numberOfGuests
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setNumberOfGuests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSNumber)entityRelevanceScore
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setEntityRelevanceScore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityRelevanceScore, 0);
  objc_storeStrong((id *)&self->_numberOfGuests, 0);
  objc_storeStrong((id *)&self->_dateOfLastVisit, 0);
  objc_storeStrong((id *)&self->_numberOfVisitsGivenLocation, 0);
  objc_storeStrong((id *)&self->_numberOfVisits, 0);
  objc_storeStrong((id *)&self->_ticketNumber, 0);
  objc_storeStrong((id *)&self->_flightCode, 0);
  objc_storeStrong((id *)&self->_terminal, 0);
  objc_storeStrong((id *)&self->_endEventDate, 0);
  objc_storeStrong((id *)&self->_startEventDate, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_muid, 0);
  objc_storeStrong((id *)&self->_isCandidateForPromotion, 0);
  objc_storeStrong((id *)&self->_score, 0);
}

@end
