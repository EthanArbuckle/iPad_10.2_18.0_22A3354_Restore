@implementation GDGraphActivityEvent

- (GDGraphActivityEvent)initWithEntityIdentifierField:(id)a3 eventTypesField:(id)a4 nameField:(id)a5 dateField:(id)a6 attendeesField:(id)a7 cooccurringEventsField:(id)a8 subEventsField:(id)a9 locationsField:(id)a10 startLocationField:(id)a11 endLocationField:(id)a12 activityTypeObjectField:(id)a13 activityTypeField:(id)a14 confidenceField:(id)a15 allNameField:(id)a16 allDateField:(id)a17 allStartLocationField:(id)a18 allEndLocationField:(id)a19 allActivityTypeObjectField:(id)a20 allActivityTypeField:(id)a21 allConfidenceField:(id)a22
{
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  GDGraphActivityEvent *v34;
  GDGraphActivityEvent *v35;
  id v38;
  id v39;
  id v40;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  objc_super v55;

  v54 = a3;
  v38 = a4;
  v53 = a4;
  v39 = a5;
  v52 = a5;
  v40 = a6;
  v51 = a6;
  v50 = a7;
  v49 = a8;
  v48 = a9;
  v47 = a10;
  v46 = a11;
  v45 = a12;
  v44 = a13;
  v43 = a14;
  v27 = a15;
  v28 = a16;
  v29 = a17;
  v30 = a18;
  v31 = a19;
  v32 = a20;
  v33 = a21;
  v42 = a22;
  v55.receiver = self;
  v55.super_class = (Class)GDGraphActivityEvent;
  v34 = -[GDGraphActivityEvent init](&v55, sel_init);
  v35 = v34;
  if (v34)
  {
    objc_storeStrong((id *)&v34->_entityIdentifier, a3);
    objc_storeStrong((id *)&v35->_eventTypes, v38);
    objc_storeStrong((id *)&v35->_name, v39);
    objc_storeStrong((id *)&v35->_date, v40);
    objc_storeStrong((id *)&v35->_attendees, a7);
    objc_storeStrong((id *)&v35->_cooccurringEvents, a8);
    objc_storeStrong((id *)&v35->_subEvents, a9);
    objc_storeStrong((id *)&v35->_locations, a10);
    objc_storeStrong((id *)&v35->_startLocation, a11);
    objc_storeStrong((id *)&v35->_endLocation, a12);
    objc_storeStrong((id *)&v35->_activityTypeObject, a13);
    objc_storeStrong((id *)&v35->_activityType, a14);
    objc_storeStrong((id *)&v35->_confidence, a15);
    objc_storeStrong((id *)&v35->_allName, a16);
    objc_storeStrong((id *)&v35->_allDate, a17);
    objc_storeStrong((id *)&v35->_allStartLocation, a18);
    objc_storeStrong((id *)&v35->_allEndLocation, a19);
    objc_storeStrong((id *)&v35->_allActivityTypeObject, a20);
    objc_storeStrong((id *)&v35->_allActivityType, a21);
    objc_storeStrong((id *)&v35->_allConfidence, a22);
  }

  return v35;
}

- (GDGraphActivityEventEntityIdentifier)entityIdentifier
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

- (NSArray)subEvents
{
  return self->_subEvents;
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

- (GDGraphActivityEventTypeEntityIdentifier)activityTypeObject
{
  return self->_activityTypeObject;
}

- (NSNumber)activityType
{
  return self->_activityType;
}

- (NSNumber)confidence
{
  return self->_confidence;
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

- (NSArray)allActivityTypeObject
{
  return self->_allActivityTypeObject;
}

- (NSArray)allActivityType
{
  return self->_allActivityType;
}

- (NSArray)allConfidence
{
  return self->_allConfidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allConfidence, 0);
  objc_storeStrong((id *)&self->_allActivityType, 0);
  objc_storeStrong((id *)&self->_allActivityTypeObject, 0);
  objc_storeStrong((id *)&self->_allEndLocation, 0);
  objc_storeStrong((id *)&self->_allStartLocation, 0);
  objc_storeStrong((id *)&self->_allDate, 0);
  objc_storeStrong((id *)&self->_allName, 0);
  objc_storeStrong((id *)&self->_confidence, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_activityTypeObject, 0);
  objc_storeStrong((id *)&self->_endLocation, 0);
  objc_storeStrong((id *)&self->_startLocation, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_subEvents, 0);
  objc_storeStrong((id *)&self->_cooccurringEvents, 0);
  objc_storeStrong((id *)&self->_attendees, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_eventTypes, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

@end
