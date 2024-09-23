@implementation GDGraphBehaviorActivityEvent

- (GDGraphBehaviorActivityEvent)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 dateField:(id)a5 attendeesField:(id)a6 locationsField:(id)a7 startLocationField:(id)a8 endLocationField:(id)a9 activityTypeObjectField:(id)a10 activityTypeField:(id)a11 confidenceField:(id)a12 behaviorTypeField:(id)a13 allNameField:(id)a14 allDateField:(id)a15 allStartLocationField:(id)a16 allEndLocationField:(id)a17 allActivityTypeObjectField:(id)a18 allActivityTypeField:(id)a19 allConfidenceField:(id)a20 allBehaviorTypeField:(id)a21
{
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  GDGraphBehaviorActivityEvent *v33;
  GDGraphBehaviorActivityEvent *v34;
  id v37;
  id v38;
  id v39;
  id v41;
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
  objc_super v53;

  v52 = a3;
  v37 = a4;
  v51 = a4;
  v38 = a5;
  v50 = a5;
  v39 = a6;
  v49 = a6;
  v48 = a7;
  v47 = a8;
  v46 = a9;
  v45 = a10;
  v44 = a11;
  v43 = a12;
  v42 = a13;
  v26 = a14;
  v27 = a15;
  v28 = a16;
  v29 = a17;
  v30 = a18;
  v31 = a19;
  v32 = a20;
  v41 = a21;
  v53.receiver = self;
  v53.super_class = (Class)GDGraphBehaviorActivityEvent;
  v33 = -[GDGraphBehaviorActivityEvent init](&v53, sel_init);
  v34 = v33;
  if (v33)
  {
    objc_storeStrong((id *)&v33->_entityIdentifier, a3);
    objc_storeStrong((id *)&v34->_name, v37);
    objc_storeStrong((id *)&v34->_date, v38);
    objc_storeStrong((id *)&v34->_attendees, v39);
    objc_storeStrong((id *)&v34->_locations, a7);
    objc_storeStrong((id *)&v34->_startLocation, a8);
    objc_storeStrong((id *)&v34->_endLocation, a9);
    objc_storeStrong((id *)&v34->_activityTypeObject, a10);
    objc_storeStrong((id *)&v34->_activityType, a11);
    objc_storeStrong((id *)&v34->_confidence, a12);
    objc_storeStrong((id *)&v34->_behaviorType, a13);
    objc_storeStrong((id *)&v34->_allName, a14);
    objc_storeStrong((id *)&v34->_allDate, a15);
    objc_storeStrong((id *)&v34->_allStartLocation, a16);
    objc_storeStrong((id *)&v34->_allEndLocation, a17);
    objc_storeStrong((id *)&v34->_allActivityTypeObject, a18);
    objc_storeStrong((id *)&v34->_allActivityType, a19);
    objc_storeStrong((id *)&v34->_allConfidence, a20);
    objc_storeStrong((id *)&v34->_allBehaviorType, a21);
  }

  return v34;
}

- (GDGraphBehaviorActivityEventEntityIdentifier)entityIdentifier
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

- (NSString)behaviorType
{
  return self->_behaviorType;
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

- (NSArray)allBehaviorType
{
  return self->_allBehaviorType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allBehaviorType, 0);
  objc_storeStrong((id *)&self->_allConfidence, 0);
  objc_storeStrong((id *)&self->_allActivityType, 0);
  objc_storeStrong((id *)&self->_allActivityTypeObject, 0);
  objc_storeStrong((id *)&self->_allEndLocation, 0);
  objc_storeStrong((id *)&self->_allStartLocation, 0);
  objc_storeStrong((id *)&self->_allDate, 0);
  objc_storeStrong((id *)&self->_allName, 0);
  objc_storeStrong((id *)&self->_behaviorType, 0);
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
