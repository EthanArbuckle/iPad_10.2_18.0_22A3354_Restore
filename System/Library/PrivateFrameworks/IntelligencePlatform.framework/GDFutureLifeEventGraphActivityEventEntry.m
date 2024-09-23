@implementation GDFutureLifeEventGraphActivityEventEntry

- (GDFutureLifeEventGraphActivityEventEntry)initWithEntityIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  GDFutureLifeEventGraphActivityEventEntry *v12;
  GDFutureLifeEventGraphActivityEventEntry *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)GDFutureLifeEventGraphActivityEventEntry;
  v12 = -[GDFutureLifeEventGraphActivityEventEntry init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_entityIdentifier, a3);
    objc_storeStrong((id *)&v13->_startDate, a4);
    objc_storeStrong((id *)&v13->_endDate, a5);
  }

  return v13;
}

- (GDGraphActivityEventEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

@end
