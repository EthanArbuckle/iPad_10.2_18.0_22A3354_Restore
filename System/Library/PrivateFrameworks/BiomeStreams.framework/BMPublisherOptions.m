@implementation BMPublisherOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexSearch, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (BMPublisherOptions)initWithStartDate:(id)a3 endDate:(id)a4 maxEvents:(unint64_t)a5 lastN:(unint64_t)a6 reversed:(BOOL)a7
{
  return -[BMPublisherOptions initWithStartDate:endDate:indexSearch:maxEvents:lastN:reversed:](self, "initWithStartDate:endDate:indexSearch:maxEvents:lastN:reversed:", a3, a4, 0, a5, a6, a7);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (unint64_t)maxEvents
{
  return self->_maxEvents;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (BOOL)reversed
{
  return self->_reversed;
}

- (unint64_t)lastN
{
  return self->_lastN;
}

- (BMPublisherOptions)init
{
  return -[BMPublisherOptions initWithStartDate:endDate:maxEvents:lastN:reversed:](self, "initWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, 0, 0, 0);
}

- (BMPublisherOptions)initWithStartDate:(id)a3 endDate:(id)a4 indexSearch:(id)a5 maxEvents:(unint64_t)a6 lastN:(unint64_t)a7 reversed:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  BMPublisherOptions *v18;
  BMPublisherOptions *v19;
  objc_super v21;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v21.receiver = self;
  v21.super_class = (Class)BMPublisherOptions;
  v18 = -[BMPublisherOptions init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_startDate, a3);
    objc_storeStrong((id *)&v19->_endDate, a4);
    objc_storeStrong((id *)&v19->_indexSearch, a5);
    v19->_maxEvents = a6;
    v19->_lastN = a7;
    v19->_reversed = a8;
  }

  return v19;
}

+ (id)reversed
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, 0, 0, 1);
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSDate hash](self->_startDate, "hash");
  return -[NSDate hash](self->_endDate, "hash") ^ v3 ^ self->_maxEvents ^ (2 * self->_lastN) ^ (4 * self->_reversed);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSDate **v5;
  NSDate *startDate;
  NSDate *endDate;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NSDate **)v4;
    startDate = self->_startDate;
    v8 = (startDate == v5[2] || -[NSDate isEqual:](startDate, "isEqual:"))
      && ((endDate = self->_endDate, endDate == v5[3]) || -[NSDate isEqual:](endDate, "isEqual:"))
      && (NSDate *)self->_maxEvents == v5[4]
      && (NSDate *)self->_lastN == v5[5]
      && self->_reversed == *((unsigned __int8 *)v5 + 8);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@ %p> startDate: %@, endDate: %@, maxEvents: %lu, lastN: %lu, reversed: %d"), objc_opt_class(), self, self->_startDate, self->_endDate, self->_maxEvents, self->_lastN, self->_reversed);
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (void)setMaxEvents:(unint64_t)a3
{
  self->_maxEvents = a3;
}

- (void)setLastN:(unint64_t)a3
{
  self->_lastN = a3;
}

- (void)setReversed:(BOOL)a3
{
  self->_reversed = a3;
}

- (BMIndexSearch)indexSearch
{
  return self->_indexSearch;
}

- (void)setIndexSearch:(id)a3
{
  objc_storeStrong((id *)&self->_indexSearch, a3);
}

@end
