@implementation GDGraphMindfulnessActivityEvent

- (GDGraphMindfulnessActivityEvent)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 dateField:(id)a5 attendeesField:(id)a6 locationsField:(id)a7 startLocationField:(id)a8 endLocationField:(id)a9 activityTypeObjectField:(id)a10 activityTypeField:(id)a11 confidenceField:(id)a12 allNameField:(id)a13 allDateField:(id)a14 allStartLocationField:(id)a15 allEndLocationField:(id)a16 allActivityTypeObjectField:(id)a17 allActivityTypeField:(id)a18 allConfidenceField:(id)a19
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  GDGraphMindfulnessActivityEvent *v30;
  GDGraphMindfulnessActivityEvent *v31;
  id v34;
  id v35;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  objc_super v48;

  v47 = a3;
  v34 = a4;
  v46 = a4;
  v35 = a5;
  v45 = a5;
  v44 = a6;
  v43 = a7;
  v42 = a8;
  v41 = a9;
  v40 = a10;
  v39 = a11;
  v38 = a12;
  v37 = a13;
  v24 = a14;
  v25 = a15;
  v26 = a16;
  v27 = a17;
  v28 = a18;
  v29 = a19;
  v48.receiver = self;
  v48.super_class = (Class)GDGraphMindfulnessActivityEvent;
  v30 = -[GDGraphMindfulnessActivityEvent init](&v48, sel_init);
  v31 = v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_entityIdentifier, a3);
    objc_storeStrong((id *)&v31->_name, v34);
    objc_storeStrong((id *)&v31->_date, v35);
    objc_storeStrong((id *)&v31->_attendees, a6);
    objc_storeStrong((id *)&v31->_locations, a7);
    objc_storeStrong((id *)&v31->_startLocation, a8);
    objc_storeStrong((id *)&v31->_endLocation, a9);
    objc_storeStrong((id *)&v31->_activityTypeObject, a10);
    objc_storeStrong((id *)&v31->_activityType, a11);
    objc_storeStrong((id *)&v31->_confidence, a12);
    objc_storeStrong((id *)&v31->_allName, a13);
    objc_storeStrong((id *)&v31->_allDate, a14);
    objc_storeStrong((id *)&v31->_allStartLocation, a15);
    objc_storeStrong((id *)&v31->_allEndLocation, a16);
    objc_storeStrong((id *)&v31->_allActivityTypeObject, a17);
    objc_storeStrong((id *)&v31->_allActivityType, a18);
    objc_storeStrong((id *)&v31->_allConfidence, a19);
  }

  return v31;
}

- (GDGraphMindfulnessActivityEventEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
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
  objc_storeStrong((id *)&self->_attendees, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

@end
