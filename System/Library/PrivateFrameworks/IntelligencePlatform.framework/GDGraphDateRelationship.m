@implementation GDGraphDateRelationship

- (GDGraphDateRelationship)initWithStartDateField:(id)a3 endDateField:(id)a4 occurrenceDateField:(id)a5 allStartDateField:(id)a6 allEndDateField:(id)a7 allOccurrenceDateField:(id)a8
{
  id v15;
  id v16;
  id v17;
  GDGraphDateRelationship *v18;
  GDGraphDateRelationship *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)GDGraphDateRelationship;
  v18 = -[GDGraphDateRelationship init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_startDate, a3);
    objc_storeStrong((id *)&v19->_endDate, a4);
    objc_storeStrong((id *)&v19->_occurrenceDate, a5);
    objc_storeStrong((id *)&v19->_allStartDate, a6);
    objc_storeStrong((id *)&v19->_allEndDate, a7);
    objc_storeStrong((id *)&v19->_allOccurrenceDate, a8);
  }

  return v19;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)occurrenceDate
{
  return self->_occurrenceDate;
}

- (NSArray)allStartDate
{
  return self->_allStartDate;
}

- (NSArray)allEndDate
{
  return self->_allEndDate;
}

- (NSArray)allOccurrenceDate
{
  return self->_allOccurrenceDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allOccurrenceDate, 0);
  objc_storeStrong((id *)&self->_allEndDate, 0);
  objc_storeStrong((id *)&self->_allStartDate, 0);
  objc_storeStrong((id *)&self->_occurrenceDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
