@implementation GDGraphCalendarEvent

- (GDGraphCalendarEvent)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 datesField:(id)a5 isAllDayField:(id)a6 identifiersField:(id)a7 attendeesField:(id)a8 organizersField:(id)a9 locationsField:(id)a10 sgeventTypeField:(id)a11 allNameField:(id)a12 allIsAllDayField:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  GDGraphCalendarEvent *v23;
  GDGraphCalendarEvent *v24;
  id v27;
  id v28;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v35 = a3;
  v34 = a4;
  v27 = a5;
  v33 = a5;
  v32 = a6;
  v31 = a7;
  v28 = a8;
  v30 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v22 = a13;
  v36.receiver = self;
  v36.super_class = (Class)GDGraphCalendarEvent;
  v23 = -[GDGraphCalendarEvent init](&v36, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_entityIdentifier, a3);
    objc_storeStrong((id *)&v24->_name, a4);
    objc_storeStrong((id *)&v24->_dates, v27);
    objc_storeStrong((id *)&v24->_isAllDay, a6);
    objc_storeStrong((id *)&v24->_identifiers, a7);
    objc_storeStrong((id *)&v24->_attendees, v28);
    objc_storeStrong((id *)&v24->_organizers, a9);
    objc_storeStrong((id *)&v24->_locations, a10);
    objc_storeStrong((id *)&v24->_sgeventType, a11);
    objc_storeStrong((id *)&v24->_allName, a12);
    objc_storeStrong((id *)&v24->_allIsAllDay, a13);
  }

  return v24;
}

- (GDGraphCalendarEventEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)dates
{
  return self->_dates;
}

- (NSNumber)isAllDay
{
  return self->_isAllDay;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (NSArray)attendees
{
  return self->_attendees;
}

- (NSArray)organizers
{
  return self->_organizers;
}

- (NSArray)locations
{
  return self->_locations;
}

- (NSArray)sgeventType
{
  return self->_sgeventType;
}

- (NSArray)allName
{
  return self->_allName;
}

- (NSArray)allIsAllDay
{
  return self->_allIsAllDay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allIsAllDay, 0);
  objc_storeStrong((id *)&self->_allName, 0);
  objc_storeStrong((id *)&self->_sgeventType, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_organizers, 0);
  objc_storeStrong((id *)&self->_attendees, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_isAllDay, 0);
  objc_storeStrong((id *)&self->_dates, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

@end
