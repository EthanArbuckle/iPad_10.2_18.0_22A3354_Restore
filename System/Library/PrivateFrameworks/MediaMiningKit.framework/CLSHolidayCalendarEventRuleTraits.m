@implementation CLSHolidayCalendarEventRuleTraits

- (CLSHolidayCalendarEventRuleTraits)init
{
  CLSHolidayCalendarEventRuleTraits *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSHolidayCalendarEventRuleTraits;
  result = -[CLSHolidayCalendarEventRuleTraits init](&v3, sel_init);
  if (result)
  {
    result->_containsMePerson = 1;
    result->_peopleTrait = 0;
    result->_locationTrait = 0;
    result->_numberOfPeople = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)CLSHolidayCalendarEventRuleTraits;
  -[CLSHolidayCalendarEventRuleTraits description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ location %lu, people %lu, numberOfPeople %lu, containsMe %d"), v4, self->_locationTrait, self->_peopleTrait, self->_numberOfPeople, self->_containsMePerson);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)containsMePerson
{
  return self->_containsMePerson;
}

- (void)setContainsMePerson:(BOOL)a3
{
  self->_containsMePerson = a3;
}

- (unint64_t)numberOfPeople
{
  return self->_numberOfPeople;
}

- (void)setNumberOfPeople:(unint64_t)a3
{
  self->_numberOfPeople = a3;
}

- (unint64_t)peopleTrait
{
  return self->_peopleTrait;
}

- (void)setPeopleTrait:(unint64_t)a3
{
  self->_peopleTrait = a3;
}

- (unint64_t)locationTrait
{
  return self->_locationTrait;
}

- (void)setLocationTrait:(unint64_t)a3
{
  self->_locationTrait = a3;
}

@end
