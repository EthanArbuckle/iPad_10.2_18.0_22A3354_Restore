@implementation GDGraphEvent

- (GDGraphEvent)initWithEntityIdentifierField:(id)a3 eventTypesField:(id)a4 nameField:(id)a5 dateField:(id)a6 attendeesField:(id)a7 cooccurringEventsField:(id)a8 locationsField:(id)a9 startLocationField:(id)a10 endLocationField:(id)a11 allNameField:(id)a12 allDateField:(id)a13 allStartLocationField:(id)a14 allEndLocationField:(id)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  GDGraphEvent *v25;
  GDGraphEvent *v26;
  id v29;
  id v30;
  id v31;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  objc_super v41;

  v40 = a3;
  v29 = a4;
  v39 = a4;
  v30 = a5;
  v38 = a5;
  v31 = a6;
  v37 = a6;
  v36 = a7;
  v35 = a8;
  v34 = a9;
  v33 = a10;
  v20 = a11;
  v21 = a12;
  v22 = a13;
  v23 = a14;
  v24 = a15;
  v41.receiver = self;
  v41.super_class = (Class)GDGraphEvent;
  v25 = -[GDGraphEvent init](&v41, sel_init);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_entityIdentifier, a3);
    objc_storeStrong((id *)&v26->_eventTypes, v29);
    objc_storeStrong((id *)&v26->_name, v30);
    objc_storeStrong((id *)&v26->_date, v31);
    objc_storeStrong((id *)&v26->_attendees, a7);
    objc_storeStrong((id *)&v26->_cooccurringEvents, a8);
    objc_storeStrong((id *)&v26->_locations, a9);
    objc_storeStrong((id *)&v26->_startLocation, a10);
    objc_storeStrong((id *)&v26->_endLocation, a11);
    objc_storeStrong((id *)&v26->_allName, a12);
    objc_storeStrong((id *)&v26->_allDate, a13);
    objc_storeStrong((id *)&v26->_allStartLocation, a14);
    objc_storeStrong((id *)&v26->_allEndLocation, a15);
  }

  return v26;
}

- (GDGraphEventEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSArray)eventTypes
{
  return self->_eventTypes;
}

- (NSString)name
{
  return self->_name;
}

- (GDGraphDateRelationship)date
{
  return self->_date;
}

- (NSArray)attendees
{
  return self->_attendees;
}

- (NSArray)cooccurringEvents
{
  return self->_cooccurringEvents;
}

- (NSArray)locations
{
  return self->_locations;
}

- (GDGraphLocationEntityIdentifier)startLocation
{
  return self->_startLocation;
}

- (GDGraphLocationEntityIdentifier)endLocation
{
  return self->_endLocation;
}

- (NSArray)allName
{
  return self->_allName;
}

- (NSArray)allDate
{
  return self->_allDate;
}

- (NSArray)allStartLocation
{
  return self->_allStartLocation;
}

- (NSArray)allEndLocation
{
  return self->_allEndLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allEndLocation, 0);
  objc_storeStrong((id *)&self->_allStartLocation, 0);
  objc_storeStrong((id *)&self->_allDate, 0);
  objc_storeStrong((id *)&self->_allName, 0);
  objc_storeStrong((id *)&self->_endLocation, 0);
  objc_storeStrong((id *)&self->_startLocation, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_cooccurringEvents, 0);
  objc_storeStrong((id *)&self->_attendees, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_eventTypes, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

@end
