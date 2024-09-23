@implementation MNGuidanceEventFeedback

- (MNGuidanceEventFeedback)initWithEvent:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int64x2_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MNGuidanceEventFeedback;
  v5 = -[MNGuidanceEventFeedback init](&v17, sel_init);
  if (!v5)
    goto LABEL_16;
  objc_msgSend(v4, "uniqueID");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)*((_QWORD *)v5 + 2);
  *((_QWORD *)v5 + 2) = v6;

  objc_msgSend(v4, "serverRouteID");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)*((_QWORD *)v5 + 3);
  *((_QWORD *)v5 + 3) = v8;

  *((_QWORD *)v5 + 6) = 0x7FFFFFFFFFFFFFFFLL;
  v10 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  *((int64x2_t *)v5 + 2) = v10;
  *(int64x2_t *)(v5 + 120) = v10;
  v11 = objc_msgSend(v4, "source");
  switch(v11)
  {
    case 3:
      *((_QWORD *)v5 + 5) = objc_msgSend(v4, "enrouteNoticeIndex");
      goto LABEL_7;
    case 2:
LABEL_7:
      *((_QWORD *)v5 + 6) = objc_msgSend(v4, "sourceIndex");
      break;
    case 1:
      *((_QWORD *)v5 + 4) = objc_msgSend(v4, "stepID");
      goto LABEL_7;
  }
  if (objc_msgSend(v4, "hasSpokenGuidance"))
  {
    v12 = 2;
  }
  else if (objc_msgSend(v4, "hasSignGuidance"))
  {
    v12 = 1;
  }
  else if (objc_msgSend(v4, "hasJunctionView"))
  {
    v12 = 4;
  }
  else
  {
    v12 = 3;
  }
  *((_QWORD *)v5 + 7) = v12;
  objc_msgSend(v4, "description");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)*((_QWORD *)v5 + 19);
  *((_QWORD *)v5 + 19) = v13;

  v15 = v5;
LABEL_16:

  return (MNGuidanceEventFeedback *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MNGuidanceEventFeedback *v4;
  uint64_t v5;
  NSUUID *uniqueID;
  uint64_t v7;
  NSData *routeID;
  uint64_t v9;
  NSArray *junctionViewImageIDs;
  uint64_t v11;
  NSString *enrouteNoticeIdentifier;
  uint64_t v13;
  NSString *eventDescription;

  v4 = -[MNGuidanceEventFeedback init](+[MNGuidanceEventFeedback allocWithZone:](MNGuidanceEventFeedback, "allocWithZone:", a3), "init");
  v5 = -[NSUUID copy](self->_uniqueID, "copy");
  uniqueID = v4->_uniqueID;
  v4->_uniqueID = (NSUUID *)v5;

  v7 = -[NSData copy](self->_routeID, "copy");
  routeID = v4->_routeID;
  v4->_routeID = (NSData *)v7;

  v4->_stepID = self->_stepID;
  v4->_enrouteNoticeIndex = self->_enrouteNoticeIndex;
  v4->_eventIndex = self->_eventIndex;
  v4->_type = self->_type;
  v4->_startTime = self->_startTime;
  v4->_endTime = self->_endTime;
  v4->_maneuverTime = self->_maneuverTime;
  v4->_startDistance = self->_startDistance;
  v4->_endDistance = self->_endDistance;
  v4->_vehicleSpeed = self->_vehicleSpeed;
  v4->_trafficColor = self->_trafficColor;
  v4->_selectedPrimaryStringIndex = self->_selectedPrimaryStringIndex;
  v4->_selectedSecondaryStringIndex = self->_selectedSecondaryStringIndex;
  v9 = -[NSArray copy](self->_junctionViewImageIDs, "copy");
  junctionViewImageIDs = v4->_junctionViewImageIDs;
  v4->_junctionViewImageIDs = (NSArray *)v9;

  v11 = -[NSString copy](self->_enrouteNoticeIdentifier, "copy");
  enrouteNoticeIdentifier = v4->_enrouteNoticeIdentifier;
  v4->_enrouteNoticeIdentifier = (NSString *)v11;

  v4->_trafficCameraType = self->_trafficCameraType;
  v13 = -[NSString copy](self->_eventDescription, "copy");
  eventDescription = v4->_eventDescription;
  v4->_eventDescription = (NSString *)v13;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNGuidanceEventFeedback)initWithCoder:(id)a3
{
  id v4;
  MNGuidanceEventFeedback *v5;
  uint64_t v6;
  NSUUID *uniqueID;
  uint64_t v8;
  NSData *routeID;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *junctionViewImageIDs;
  uint64_t v21;
  NSString *enrouteNoticeIdentifier;
  uint64_t v23;
  NSString *eventDescription;
  MNGuidanceEventFeedback *v25;

  v4 = a3;
  v5 = -[MNGuidanceEventFeedback init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_uniqueID"));
    v6 = objc_claimAutoreleasedReturnValue();
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routeID"));
    v8 = objc_claimAutoreleasedReturnValue();
    routeID = v5->_routeID;
    v5->_routeID = (NSData *)v8;

    v5->_stepID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_stepID"));
    v5->_enrouteNoticeIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_enrouteNoticeIndex"));
    v5->_eventIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_eventIndex"));
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_type"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_startTime"));
    v5->_startTime = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_endTime"));
    v5->_endTime = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_maneuverTime"));
    v5->_maneuverTime = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_startDistance"));
    v5->_startDistance = v13;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_endDistance"));
    v5->_endDistance = v14;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_vehicleSpeed"));
    v5->_vehicleSpeed = v15;
    v5->_trafficColor = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_trafficColor"));
    v5->_selectedPrimaryStringIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_selectedPrimaryStringIndex"));
    v5->_selectedSecondaryStringIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_selectedSecondaryStringIndex"));
    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("_junctionViewImageIDs"));
    v19 = objc_claimAutoreleasedReturnValue();
    junctionViewImageIDs = v5->_junctionViewImageIDs;
    v5->_junctionViewImageIDs = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_enrouteNoticeIdentifier"));
    v21 = objc_claimAutoreleasedReturnValue();
    enrouteNoticeIdentifier = v5->_enrouteNoticeIdentifier;
    v5->_enrouteNoticeIdentifier = (NSString *)v21;

    v5->_trafficCameraType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_trafficCameraType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_eventDescription"));
    v23 = objc_claimAutoreleasedReturnValue();
    eventDescription = v5->_eventDescription;
    v5->_eventDescription = (NSString *)v23;

    v25 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uniqueID;
  id v5;

  uniqueID = self->_uniqueID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uniqueID, CFSTR("_uniqueID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_routeID, CFSTR("_routeID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_stepID, CFSTR("_stepID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_enrouteNoticeIndex, CFSTR("_enrouteNoticeIndex"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_eventIndex, CFSTR("_eventIndex"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("_type"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_startTime"), self->_startTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_endTime"), self->_endTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_maneuverTime"), self->_maneuverTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_startDistance"), self->_startDistance);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_endDistance"), self->_endDistance);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_vehicleSpeed"), self->_vehicleSpeed);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_trafficColor, CFSTR("_trafficColor"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_selectedPrimaryStringIndex, CFSTR("_selectedPrimaryStringIndex"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_selectedSecondaryStringIndex, CFSTR("_selectedSecondaryStringIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_junctionViewImageIDs, CFSTR("_junctionViewImageIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_enrouteNoticeIdentifier, CFSTR("_enrouteNoticeIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_trafficCameraType, CFSTR("_trafficCameraType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventDescription, CFSTR("_eventDescription"));

}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueID, a3);
}

- (NSData)routeID
{
  return self->_routeID;
}

- (void)setRouteID:(id)a3
{
  objc_storeStrong((id *)&self->_routeID, a3);
}

- (unint64_t)stepID
{
  return self->_stepID;
}

- (void)setStepID:(unint64_t)a3
{
  self->_stepID = a3;
}

- (unint64_t)enrouteNoticeIndex
{
  return self->_enrouteNoticeIndex;
}

- (void)setEnrouteNoticeIndex:(unint64_t)a3
{
  self->_enrouteNoticeIndex = a3;
}

- (unint64_t)eventIndex
{
  return self->_eventIndex;
}

- (void)setEventIndex:(unint64_t)a3
{
  self->_eventIndex = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (double)maneuverTime
{
  return self->_maneuverTime;
}

- (void)setManeuverTime:(double)a3
{
  self->_maneuverTime = a3;
}

- (double)startDistance
{
  return self->_startDistance;
}

- (void)setStartDistance:(double)a3
{
  self->_startDistance = a3;
}

- (double)endDistance
{
  return self->_endDistance;
}

- (void)setEndDistance:(double)a3
{
  self->_endDistance = a3;
}

- (double)vehicleSpeed
{
  return self->_vehicleSpeed;
}

- (void)setVehicleSpeed:(double)a3
{
  self->_vehicleSpeed = a3;
}

- (unint64_t)trafficColor
{
  return self->_trafficColor;
}

- (void)setTrafficColor:(unint64_t)a3
{
  self->_trafficColor = a3;
}

- (unint64_t)selectedPrimaryStringIndex
{
  return self->_selectedPrimaryStringIndex;
}

- (void)setSelectedPrimaryStringIndex:(unint64_t)a3
{
  self->_selectedPrimaryStringIndex = a3;
}

- (unint64_t)selectedSecondaryStringIndex
{
  return self->_selectedSecondaryStringIndex;
}

- (void)setSelectedSecondaryStringIndex:(unint64_t)a3
{
  self->_selectedSecondaryStringIndex = a3;
}

- (NSArray)junctionViewImageIDs
{
  return self->_junctionViewImageIDs;
}

- (void)setJunctionViewImageIDs:(id)a3
{
  objc_storeStrong((id *)&self->_junctionViewImageIDs, a3);
}

- (NSString)enrouteNoticeIdentifier
{
  return self->_enrouteNoticeIdentifier;
}

- (void)setEnrouteNoticeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (int)trafficCameraType
{
  return self->_trafficCameraType;
}

- (void)setTrafficCameraType:(int)a3
{
  self->_trafficCameraType = a3;
}

- (NSString)eventDescription
{
  return self->_eventDescription;
}

- (void)setEventDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDescription, 0);
  objc_storeStrong((id *)&self->_enrouteNoticeIdentifier, 0);
  objc_storeStrong((id *)&self->_junctionViewImageIDs, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end
