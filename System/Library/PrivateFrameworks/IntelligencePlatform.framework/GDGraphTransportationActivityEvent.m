@implementation GDGraphTransportationActivityEvent

- (GDGraphTransportationActivityEvent)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 dateField:(id)a5 attendeesField:(id)a6 locationsField:(id)a7 startLocationField:(id)a8 endLocationField:(id)a9 activityTypeObjectField:(id)a10 activityTypeField:(id)a11 confidenceField:(id)a12 uncertaintyField:(id)a13 modeOfTransportationField:(id)a14 transportationTypeField:(id)a15 allNameField:(id)a16 allDateField:(id)a17 allStartLocationField:(id)a18 allEndLocationField:(id)a19 allActivityTypeObjectField:(id)a20 allActivityTypeField:(id)a21 allConfidenceField:(id)a22 allUncertaintyField:(id)a23 allModeOfTransportationField:(id)a24 allTransportationTypeField:(id)a25
{
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  GDGraphTransportationActivityEvent *v37;
  GDGraphTransportationActivityEvent *v38;
  id v41;
  id v42;
  id v43;
  id v44;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  objc_super v62;

  v61 = a3;
  v41 = a4;
  v60 = a4;
  v42 = a5;
  v59 = a5;
  v43 = a6;
  v58 = a6;
  v57 = a7;
  v44 = a8;
  v56 = a8;
  v55 = a9;
  v54 = a10;
  v53 = a11;
  v52 = a12;
  v51 = a13;
  v50 = a14;
  v49 = a15;
  v48 = a16;
  v30 = a17;
  v31 = a18;
  v32 = a19;
  v33 = a20;
  v34 = a21;
  v35 = a22;
  v36 = a23;
  v47 = a24;
  v46 = a25;
  v62.receiver = self;
  v62.super_class = (Class)GDGraphTransportationActivityEvent;
  v37 = -[GDGraphTransportationActivityEvent init](&v62, sel_init);
  v38 = v37;
  if (v37)
  {
    objc_storeStrong((id *)&v37->_entityIdentifier, a3);
    objc_storeStrong((id *)&v38->_name, v41);
    objc_storeStrong((id *)&v38->_date, v42);
    objc_storeStrong((id *)&v38->_attendees, v43);
    objc_storeStrong((id *)&v38->_locations, a7);
    objc_storeStrong((id *)&v38->_startLocation, v44);
    objc_storeStrong((id *)&v38->_endLocation, a9);
    objc_storeStrong((id *)&v38->_activityTypeObject, a10);
    objc_storeStrong((id *)&v38->_activityType, a11);
    objc_storeStrong((id *)&v38->_confidence, a12);
    objc_storeStrong((id *)&v38->_uncertainty, a13);
    objc_storeStrong((id *)&v38->_modeOfTransportation, a14);
    objc_storeStrong((id *)&v38->_transportationType, a15);
    objc_storeStrong((id *)&v38->_allName, a16);
    objc_storeStrong((id *)&v38->_allDate, a17);
    objc_storeStrong((id *)&v38->_allStartLocation, a18);
    objc_storeStrong((id *)&v38->_allEndLocation, a19);
    objc_storeStrong((id *)&v38->_allActivityTypeObject, a20);
    objc_storeStrong((id *)&v38->_allActivityType, a21);
    objc_storeStrong((id *)&v38->_allConfidence, a22);
    objc_storeStrong((id *)&v38->_allUncertainty, a23);
    objc_storeStrong((id *)&v38->_allModeOfTransportation, a24);
    objc_storeStrong((id *)&v38->_allTransportationType, a25);
  }

  return v38;
}

- (GDGraphTransportationActivityEventEntityIdentifier)entityIdentifier
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

- (NSNumber)uncertainty
{
  return self->_uncertainty;
}

- (GDGraphModeOfTransportationEntityIdentifier)modeOfTransportation
{
  return self->_modeOfTransportation;
}

- (NSNumber)transportationType
{
  return self->_transportationType;
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

- (NSArray)allUncertainty
{
  return self->_allUncertainty;
}

- (NSArray)allModeOfTransportation
{
  return self->_allModeOfTransportation;
}

- (NSArray)allTransportationType
{
  return self->_allTransportationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allTransportationType, 0);
  objc_storeStrong((id *)&self->_allModeOfTransportation, 0);
  objc_storeStrong((id *)&self->_allUncertainty, 0);
  objc_storeStrong((id *)&self->_allConfidence, 0);
  objc_storeStrong((id *)&self->_allActivityType, 0);
  objc_storeStrong((id *)&self->_allActivityTypeObject, 0);
  objc_storeStrong((id *)&self->_allEndLocation, 0);
  objc_storeStrong((id *)&self->_allStartLocation, 0);
  objc_storeStrong((id *)&self->_allDate, 0);
  objc_storeStrong((id *)&self->_allName, 0);
  objc_storeStrong((id *)&self->_transportationType, 0);
  objc_storeStrong((id *)&self->_modeOfTransportation, 0);
  objc_storeStrong((id *)&self->_uncertainty, 0);
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
